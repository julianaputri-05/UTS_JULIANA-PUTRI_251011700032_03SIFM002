<?php

namespace App\Http\Controllers;

use App\Models\Instrument;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class InstrumentController extends Controller
{
    public function index(Request $request): View
    {
        $filters = $request->validate([
            'q' => ['nullable', 'string', 'max:100'],
            'type' => ['nullable', 'string', 'max:100'],
        ]);

        $instruments = Instrument::query()
            ->when($filters['q'] ?? null, function ($query, string $search): void {
                $query->where(function ($query) use ($search): void {
                    $query->where('name', 'like', "%{$search}%")
                        ->orWhere('brand', 'like', "%{$search}%");
                });
            })
            ->when($filters['type'] ?? null, fn ($query, string $type) => $query->where('type', $type))
            ->orderBy('brand')
            ->orderBy('name')
            ->paginate(12)
            ->withQueryString();

        $types = Instrument::query()->select('type')->distinct()->orderBy('type')->pluck('type');

        return view('instruments.index', compact('instruments', 'types', 'filters'));
    }

    public function show(Instrument $instrument): View
    {
        $recommendations = Instrument::query()
            ->where('id', '!=', $instrument->id)
            ->where('type', $instrument->type)
            ->limit(3)
            ->get();

        return view('instruments.show', compact('instrument', 'recommendations'));
    }
}

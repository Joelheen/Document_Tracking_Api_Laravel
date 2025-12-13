<?php

namespace App\Http\Controllers;

use App\Models\Document;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class DocumentController extends Controller
{
    /**
     * Get all documents
     */
    public function index()
    {
        $documents = Document::all();
        return response()->json([
            'success' => true,
            'data' => $documents
        ]);
    }

    /**
     * Create a new document
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string',
            'description' => 'nullable|string',
            'status' => ['required', 'string', Rule::in(['draft', 'in-review', 'approved', 'rejected'])],
        ]);

        $document = Document::create($validated);

        return response()->json([
            'success' => true,
            'data' => $document
        ], 201);
    }

    /**
     * Get a specific document
     */
    public function show(Document $document)
    {
        return response()->json([
            'success' => true,
            'data' => $document
        ]);
    }

    /**
     * Update a document
     */
    public function update(Request $request, Document $document)
    {
        $validated = $request->validate([
            'title' => 'required|string',
            'description' => 'nullable|string',
            'status' => ['required', 'string', Rule::in(['draft', 'in-review', 'approved', 'rejected'])],
        ]);

        $document->update($validated);

        return response()->json([
            'success' => true,
            'data' => $document
        ]);
    }

    /**
     * Delete a document
     */
    public function destroy(Document $document)
    {
        $document->delete();

        return response()->json([
            'success' => true,
            'message' => 'Resource deleted'
        ]);
    }
}

<?php

namespace Database\Seeders;

use App\Models\Document;
use Illuminate\Database\Seeder;

class DocumentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Document::create([
            'title' => 'Project Proposal',
            'description' => 'Proposal for new project',
            'status' => 'draft',
        ]);

        Document::create([
            'title' => 'Budget Report',
            'description' => 'Q1 Budget Report',
            'status' => 'approved',
        ]);

        Document::create([
            'title' => 'Meeting Notes',
            'description' => 'Notes from team meeting',
            'status' => 'in-review',
        ]);

        Document::create([
            'title' => 'Contract Agreement',
            'description' => 'Client contract agreement',
            'status' => 'approved',
        ]);
    }
}

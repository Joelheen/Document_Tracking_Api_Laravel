Document Tracking API (Laravel)

A Laravel implementation of the Document Tracking REST API (converted from a Node.js/Express prototype).

Prerequisites
- PHP 8.1+ with CLI enabled
- Composer
- SQLite (or MySQL) and write permission to `database/`
- Git (optional)

Quick setup (local)
1. Clone or copy the repository:
   cd C:\xampp\htdocs
   git clone https://github.com/Joelheen/Document_Tracking_Api_Laravel.git
   cd document_tracking_api_laravel

2. Install PHP dependencies:
   composer install

3. Environment:
   copy .env.example .env
   php artisan key:generate

4. Database (SQLite example):
   type NUL > database\database.sqlite
   # update `.env`: set DB_CONNECTION=sqlite and DB_DATABASE=database/database.sqlite

5. Run migrations and seed sample data:
   php artisan migrate --seed

6. Start dev server:
   php artisan serve --host=127.0.0.1 --port=8000

API Endpoints (base URL: http://127.0.0.1:8000)
- GET  /api/documents         — list all documents
- POST /api/documents         — create document (JSON body: title, description, status)
- GET  /api/documents/{id}    — show a single document
- PUT  /api/documents/{id}    — update a document
- DELETE /api/documents/{id}  — delete a document

Validation
- `title` (required)
- `status` (required) — one of: `draft`, `in-review`, `approved`, `rejected`

Testing
- Example curl to list documents:
  curl http://127.0.0.1:8000/api/documents

Notes
- If `php artisan serve` fails or exits, you can serve using PHP's built-in server:
  php -S 127.0.0.1:8000 -t public public/index.php
- To expose via Apache, point a vhost's DocumentRoot to the project's `public` folder.

Repository
- GitHub: https://github.com/Joelheen/Document_Tracking_Api_Laravel

If you'd like, I can add a GitHub Actions workflow, example Postman collection, or Apache vhost snippet next.
<?php

use App\Http\Controllers\FormationController;
use App\Models\Formation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//route for formation
Route::resource('formations','App\Http\Controllers\FormationController');
Route::get('formations/get_formation_by_nom/{nom}','App\Http\Controllers\FormationController@get_formation_by_nom');
Route::get('formations/get_formation_by_id/{id}','App\Http\Controllers\FormationController@get_formation_by_id');
//route for categories
Route::resource('categories','App\Http\Controllers\CategorieController');
Route::get('categories/get_categorie_by_nom/{nom}','App\Http\Controllers\CategorieController@get_categorie_by_nom');
//route for sceance
Route::resource('sceances','App\Http\Controllers\SceanceController');
Route::get('sceances/get_sceance_by_nom/{nom}','App\Http\Controllers\SceanceController@get_sceance_by_nom');
Route::get('sceances/get_sceance_by_id_formation/{id}','App\Http\Controllers\SceanceController@get_sceance_by_id_formation');
Route::get('sceances/get_sceance_by_id_sceance/{id}','App\Http\Controllers\SceanceController@get_sceance_by_id_sceance');
//route for evaluation
Route::resource('evaluations','App\Http\Controllers\EvaluationController');
Route::get('evaluations/get_evaluation_by_nom/{nom}','App\Http\Controllers\EvaluationController@get_evaluation_by_nom');
Route::get('evaluations/get_evaluations_by_id_sceance/{id}','App\Http\Controllers\EvaluationController@get_evaluations_by_id_sceance');
//route for videos
Route::resource('videos','App\Http\Controllers\VideoController');
Route::get('videos/get_video_by_nom/{nom}','App\Http\Controllers\VideoController@get_video_by_nom');
//route for administrateurs
Route::resource('administrateurs','App\Http\Controllers\AdministrateurController');
Route::get('administrateurs/get_administrateur_by_nom/{nom}','App\Http\Controllers\AdministrateurController@get_administrateur_by_nom');
//route for utilisateurs
Route::resource('utilisateurs','App\Http\Controllers\UtilisateurController');
Route::get('utilisateurs/get_utilisateur_by_nom/{nom}','App\Http\Controllers\UtilisateurController@get_utilisateur_by_nom');
Route::get('utilisateurs/get_utilisateur_by_email_pwd/{email}/{pwd}','App\Http\Controllers\UtilisateurController@get_utilisateur_by_email_pwd');
//route for avoir_formation
//Route::get('avoir_formations/{id_utlilisateur}/{id_formation}','App\Http\Controllers\AvoirFormationController@destroyy');
Route::resource('avoir_formations','App\Http\Controllers\AvoirFormationController');
Route::get('avoir_formations/get_avoir_formation_by_id/{id}','App\Http\Controllers\AvoirFormationController@get_avoir_formation_by_id');
//route for avoir_sceance
Route::resource('avoir_sceances','App\Http\Controllers\AvoirSceanceController');
Route::get('avoir_sceances/get_avoir_sceance_by_id/{id}','App\Http\Controllers\AvoirSceanceController@get_avoir_sceance_by_id');
//route for avoir_evaluation
Route::resource('avoir_evaluations','App\Http\Controllers\AvoirEvaluationController');
Route::get('avoir_evaluations/get_avoir_evaluation_by_id/{id}','App\Http\Controllers\AvoirEvaluationController@get_avoir_evaluation_by_id');


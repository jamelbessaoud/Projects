<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AvoirEvaluation extends Model
{
protected $fillable = ['id_avoir_evaluation','id_utilisateur','id_evaluation'];
}

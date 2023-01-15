<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Evaluation extends Model
{
protected $fillable = ['id_evaluation','nom_evaluation','description_evaluation','id_sceance','enonce_evaluation','corrige_evaluation'];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AvoirSceance extends Model
{
protected $fillable = ['id_avoir_sceance','id_utilisateur','id_sceance'];
}

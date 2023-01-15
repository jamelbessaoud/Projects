<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Avoir_formation extends Model
{
    protected $fillable = ['id_avoir_formation','id_utilisateur','id_formation'];

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Administrateur extends Model
{
protected $fillable = ['id_administrateur','nom_administrateur','prenom_administrateur','age_administrateur','email_administrateur','pwd_administrateur','telephone_administrateur'];

}

<?php

nameSpace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    //Relación uno a mmuchos inverso

    public function user(){
        return $this->belongsTo('App\Models\User')
    }
}
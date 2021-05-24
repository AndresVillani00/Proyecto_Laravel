<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
<<<<<<< HEAD

    //Relación uno a muchos
    public function pagos(){
        return $this->hasMany('App\Models\Pagos');
    }
     //Relación uno a muchos
     public function notas(){
        return $this->hasMany('App\ModelsNotas');
    }
     //Relación uno a muchos
     public function idiomas(){
    return $this->hasMany('App\ModelsIdiomas');
        }
    //Relación uno a muchos
     public function nivel_idiomas(){
    return $this->hasMany('App\ModelsNivel_idiomas');
            }
    //Relación uno a muchos
    public function pagos(){
    return $this->hasMany('App\ModelsPagos');
            }
    //Relación uno a muchos
    public function ciclos(){
        return $this->hasMany('App\ModelsCiclos');
     }
      //Relación uno a muchos
    public function productos(){
        return $this->hasMany('App\ModelsProductos');
     }
      //Relación uno a muchos
    public function descuentos(){
        return $this->hasMany('App\ModelsDescuentos');
     }
=======
>>>>>>> 3285c772e1a7ed3a3b03eafa08723c4f32cd3b96
}

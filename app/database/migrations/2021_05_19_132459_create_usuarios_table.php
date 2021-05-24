<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsuariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->integer('id_usuario')->primary()->autoIncrement();
            $table->string('nombre_usuario');
            $table->string('contraseña_usuario');
            $table->integer('código_usuario');
            $table->string('correo_usuario');
            $table->string('nombre_curso_usuario');
<<<<<<< HEAD

            $table->timestamps();
=======
>>>>>>> 3285c772e1a7ed3a3b03eafa08723c4f32cd3b96
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usuarios');
    }
}

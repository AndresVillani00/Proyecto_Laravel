<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateListaNegraUsuariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lista_negra_usuarios', function (Blueprint $table) {
            $table->id('id_usuario_lista_negra')->autoIncrement();
            $table->tinyInteger('bloqueado');
            $table->tinyInteger('eliminado');
            $table->tinyInteger('Reintegro');
            $table->Integer('id_usuario');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lista_negra_usuarios');
    }
}

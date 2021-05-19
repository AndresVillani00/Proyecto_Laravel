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
            $table->integer('id_usuario_lista_negra')->primary()->autoIncrement();
            $table->tinyInteger('bloqueado');
            $table->tinyInteger('eliminado');
            $table->tinyInteger('Reintegro');
            $table->integer('id_usuario');
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

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCursosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cursos', function (Blueprint $table) {
            $table->id('id_curso')->autoIncrement();
            $table->Integer('cod_idioma');
            $table->Integer('nro_sala_online');
            $table->Integer('cod_profesor');
            $table->Integer('id_horario');
            $table->Integer('cod_ciclo');
            $table->string('nombre');
            $table->string('dirección');
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
        Schema::dropIfExists('cursos');
    }
}

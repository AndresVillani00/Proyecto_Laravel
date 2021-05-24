<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notas', function (Blueprint $table) {
            $table->integer('id_notas')->primary()->autoIncrement();
            $table->decimal('nota1');
            $table->decimal('nota2');
            $table->decimal('nota3');
            $table->decimal('parcial');
            $table->decimal('nota_final');
            $table->string('estado');
            $table->integer('cod_alumno')->nullable();
            $table->integer('cod_idioma')->nullable();
            $table->integer('cod_nivel')->nullable();

            

            $table->foreign('cod_alumno')->references('cod_alumno')->on('alumnos')->onDelete('set null');
            $table->foreign('cod_idioma')->references('cod_idioma')->on('idiomas')->onDelete('set null');
            $table->foreign('cod_nivel')->references('cod_nivel')->on('nivel_idiomas')->onDelete('set null');
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
        Schema::dropIfExists('notas');
    }
}

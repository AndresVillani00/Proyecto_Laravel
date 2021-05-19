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
            $table->integer('cod_alumno');
            $table->integer('cod_nivel');
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

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIdiomasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('idiomas', function (Blueprint $table) {
            $table->integer('cod_idioma')->primary()->autoIncrement();
            $table->string('idioma');
            $table->string('nivel');
<<<<<<< HEAD
            $table->integer('cod_nivel')->nullable();
           
           
            $table->foreign('cod_nivel')->references('cod_nivel')->on('nivel_idiomas')->onDelete('set null');
           
            $table->timestamps();
=======
            $table->integer('cod_nivel');
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
        Schema::dropIfExists('idiomas');
    }
}

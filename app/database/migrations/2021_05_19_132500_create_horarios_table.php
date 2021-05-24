<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHorariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('horarios', function (Blueprint $table) {
            $table->integer('id_horario')->primary()->autoIncrement();
            $table->dateTime('día');
            $table->string('hora');
<<<<<<< HEAD
            $table->integer('cod_ciclo')->nullable();


            $table->foreign('cod_ciclo')->references('cod_ciclo')->on('ciclos')->onDelete('set null');
            $table->timestamps();
=======
            $table->integer('cod_ciclo');
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
        Schema::dropIfExists('horarios');
    }
}

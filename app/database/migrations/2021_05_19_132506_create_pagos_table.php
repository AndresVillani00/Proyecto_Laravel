<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePagosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pagos', function (Blueprint $table) {
            $table->integer('id_pago')->primary()->autoIncrement();
<<<<<<< HEAD
            $table->integer('id_alumno');->nullable();
            $table->integer('cvv');

            $table->foreign('id_alumno')
            ->references('cod_alumno')->on('alumnos')
            ->onDelete('set null');
=======
            $table->integer('id_alumno');
            $table->integer('cvv');
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
        Schema::dropIfExists('pagos');
    }
}

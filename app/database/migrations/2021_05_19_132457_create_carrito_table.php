<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCarritoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('carrito', function (Blueprint $table) {
            $table->integer('id_carrito')->primary()->autoIncrement();
            $table->integer('id_datos_usuario');
            $table->integer('productos');
            $table->integer('cantidad');
            $table->integer('id_producto');
<<<<<<< HEAD

            $table->foreign('id_producto')->references('id_producto')->on('productos')->onDelete('set null');
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
        Schema::dropIfExists('carrito');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->integer('id_producto')->primary()->autoIncrement();
            $table->string('nombre_curso');
            $table->dateTime('fecha');
            $table->integer('precio');
            $table->integer('id_descuento');->nullable();
            
            $table->foreign('id_descuento')->references('id_descuento')->on('descuentos')->onDelete('set null');
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
        Schema::dropIfExists('productos');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNivelIdiomasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nivel_idiomas', function (Blueprint $table) {
            $table->integer('cod_nivel')->primary()->autoIncrement();
            $table->integer('nivel');
            $table->date('fecha');
<<<<<<< HEAD

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
        Schema::dropIfExists('nivel_idiomas');
    }
}

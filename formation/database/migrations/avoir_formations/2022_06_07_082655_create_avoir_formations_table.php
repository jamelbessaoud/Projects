<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('avoir_formations', function (Blueprint $table) {
            $table->integer('id_utilisateur');
/*             $table->foreign('id_utilisateur')
                    ->references('id_utilisateur')->on('utilisateurs')
                    ->onDelete('cascade'); */


            $table->string('id_formation',20);
            $table->foreign('id_formation')
                    ->references('id_formation')->on('formations')
                    ->onDelete('cascade');
            $table->string('id_avoir_formation',20);
            $table->primary('id_avoir_formation');





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
        Schema::dropIfExists('avoir_formations');
    }
};

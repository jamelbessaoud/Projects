<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

use function PHPUnit\Framework\once;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('evaluations', function (Blueprint $table) {

            $table->string('id_evaluation',20);
            $table->primary('id_evaluation');
            $table->string('nom_evaluation',20);
            $table->string('description_evaluation',200);
            $table->string('enonce_evaluation',20);
            $table->string('corrige_evaluation',20);

            $table->string('id_sceance',20);
            $table->foreign('id_sceance')->references('id_sceance')
            ->on('sceances')->onDelete('cascade');

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
        Schema::dropIfExists('evaluations');
    }
};

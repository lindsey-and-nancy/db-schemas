-- CreateEnum
CREATE TYPE "Location" AS ENUM ('a', 'wr', 'anx');

-- CreateEnum
CREATE TYPE "Modifier" AS ENUM ('psoc', 'peu');

-- CreateEnum
CREATE TYPE "Direction" AS ENUM ('cnt', 'clc');

-- CreateEnum
CREATE TYPE "Movement" AS ENUM ('trns');

-- CreateEnum
CREATE TYPE "Shape" AS ENUM ('cir', 'rec', 'sq');

-- CreateTable
CREATE TABLE "Scan" (
    "id" INTEGER NOT NULL,
    "end_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Scan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Behaviour" (
    "id" TEXT NOT NULL,
    "locations" "Location"[],

    CONSTRAINT "Behaviour_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cage" (
    "id" INTEGER NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "Cage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Observation" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "scan_id" INTEGER NOT NULL,
    "cage_id" INTEGER NOT NULL,
    "mouse_id" INTEGER NOT NULL,
    "housing_id" TEXT NOT NULL,
    "behaviour_id" TEXT NOT NULL,
    "location" "Location" NOT NULL,
    "modifier" "Modifier" NOT NULL,
    "direction" "Direction" NOT NULL,
    "shape" "Shape" NOT NULL,
    "movement" "Movement" NOT NULL,

    CONSTRAINT "Observation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Mouse" (
    "id" INTEGER NOT NULL,

    CONSTRAINT "Mouse_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Housing" (
    "id" TEXT NOT NULL,
    "enriched" BOOLEAN NOT NULL,

    CONSTRAINT "Housing_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Observation" ADD CONSTRAINT "Observation_scan_id_fkey" FOREIGN KEY ("scan_id") REFERENCES "Scan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Observation" ADD CONSTRAINT "Observation_cage_id_fkey" FOREIGN KEY ("cage_id") REFERENCES "Cage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Observation" ADD CONSTRAINT "Observation_mouse_id_fkey" FOREIGN KEY ("mouse_id") REFERENCES "Mouse"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Observation" ADD CONSTRAINT "Observation_housing_id_fkey" FOREIGN KEY ("housing_id") REFERENCES "Housing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Observation" ADD CONSTRAINT "Observation_behaviour_id_fkey" FOREIGN KEY ("behaviour_id") REFERENCES "Behaviour"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

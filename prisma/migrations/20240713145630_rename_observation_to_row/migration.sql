/*
  Warnings:

  - You are about to drop the `Observation` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Observation" DROP CONSTRAINT "Observation_behaviour_id_fkey";

-- DropForeignKey
ALTER TABLE "Observation" DROP CONSTRAINT "Observation_cage_id_fkey";

-- DropForeignKey
ALTER TABLE "Observation" DROP CONSTRAINT "Observation_housing_id_fkey";

-- DropForeignKey
ALTER TABLE "Observation" DROP CONSTRAINT "Observation_mouse_id_fkey";

-- DropForeignKey
ALTER TABLE "Observation" DROP CONSTRAINT "Observation_scan_id_fkey";

-- DropTable
DROP TABLE "Observation";

-- CreateTable
CREATE TABLE "Row" (
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

    CONSTRAINT "Row_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Row" ADD CONSTRAINT "Row_scan_id_fkey" FOREIGN KEY ("scan_id") REFERENCES "Scan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Row" ADD CONSTRAINT "Row_cage_id_fkey" FOREIGN KEY ("cage_id") REFERENCES "Cage"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Row" ADD CONSTRAINT "Row_mouse_id_fkey" FOREIGN KEY ("mouse_id") REFERENCES "Mouse"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Row" ADD CONSTRAINT "Row_housing_id_fkey" FOREIGN KEY ("housing_id") REFERENCES "Housing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Row" ADD CONSTRAINT "Row_behaviour_id_fkey" FOREIGN KEY ("behaviour_id") REFERENCES "Behaviour"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

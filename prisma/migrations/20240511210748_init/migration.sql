-- CreateTable
CREATE TABLE "Client" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "phone" TEXT,
    "email" TEXT,
    "hide" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Projects" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "dateAgreedOn" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "datePlannedStart" TIMESTAMP(3),
    "datePlannedEnd" TIMESTAMP(3),
    "dateWorkStarted" TIMESTAMP(3),
    "dateWorkEnded" TIMESTAMP(3),
    "notes" TEXT,
    "clientId" INTEGER NOT NULL,
    "staffAssigned" TEXT,
    "projectEstimate" DOUBLE PRECISION,
    "finalAmount" DOUBLE PRECISION,
    "staffingCost" DOUBLE PRECISION,

    CONSTRAINT "Projects_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Projects_clientId_key" ON "Projects"("clientId");

-- AddForeignKey
ALTER TABLE "Projects" ADD CONSTRAINT "Projects_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

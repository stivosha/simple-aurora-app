/**
 * SPDX-FileCopyrightText: Copyright 2023 Open Mobile Platform LLC <community@omp.ru>
 * SPDX-License-Identifier: MIT
 */
#include <flutter/application.h>
#include "generated_plugin_registrant.h"

int main(int argc, char *argv[]) {
    Application::Initialize(argc, argv);
    RegisterPlugins();
    Application::Launch();
    return 0;
}

#!/bin/bash

# Add copyright to .cs files
for file in ProjectTemplates/*.cs; do
    if [ -f "$file" ]; then
        temp_file=$(mktemp)
        cat > "$temp_file" << 'HEADER'
/*
 * Copyright (c) 2025 Barrer Software
 * 
 * This file is part of the AMP Visual Studio Plugin.
 * Licensed under the MIT License - see LICENSE.txt
 * 
 * For more information: https://barrersoftware.com
 */

HEADER
        cat "$file" >> "$temp_file"
        mv "$temp_file" "$file"
        echo "Added header to $file"
    fi
done

# Add copyright to HTML files
for file in ProjectTemplates/WebRoot/*.html; do
    if [ -f "$file" ]; then
        temp_file=$(mktemp)
        cat > "$temp_file" << 'HEADER'
<!--
  Copyright (c) 2025 Barrer Software
  
  This file is part of the AMP Visual Studio Plugin.
  Licensed under the MIT License - see LICENSE.txt
  
  For more information: https://barrersoftware.com
-->

HEADER
        cat "$file" >> "$temp_file"
        mv "$temp_file" "$file"
        echo "Added header to $file"
    fi
done

echo "✅ Copyright headers added to all source files"

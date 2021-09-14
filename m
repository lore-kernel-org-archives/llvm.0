Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10F63FD0
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 15:44:53 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t18so21025173wrb.0
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rammhold-de.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xB5A2oEf3U8Ifr6DwVPVPmZXqJzCQ/TxKjqPJnOVvSw=;
        b=YEGAM5EzV/rMOgfYuWLuKDLUs2BwsuiLV1yNTyqJVb4AfvERwA8Ct4jCuJSKERT8Ze
         iTg6A14ro/tZbdpWiKYTcyRvjklT801kLYuQv5jVr1sJreT7aUp7h8YpXcvR0KanJISi
         JKWHr64A4Trz1RTCFNQ7o+k1E0UcOrNuNpo/gjPDdnoOCfoZRF/J1cBLeEdNm4YFyOxn
         b+06TZB92Yy4w5OhIRdxX+l0MayFSGMYWa0sIjQPlAwbMyIKQt5Uisvbn6e+oimQ769+
         Oq95AGHyOV3r+mi3CI0F+wRNNaR4ATaXNJ4EzjDe4umiDjcFIOwt2NiKcGed9N/1+DfG
         sZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xB5A2oEf3U8Ifr6DwVPVPmZXqJzCQ/TxKjqPJnOVvSw=;
        b=XpVt835wsZq88Efux2xQelv7UI3N5xzVTlaqlRDVKajkJHy+MIftP+CvEX9Btoo1IU
         OvsOR3SrcjZ7orNaAv9uCUQ9bQRv12n+zXD7PKmrFWolBgLuKYHLAcpqz7bCLJEuZEpL
         67mUkyyK2BOSmq7Kf+BeYxRCkObI36v/wuBMKmP8HvbVEnyqGOOHEV+4sU+W8O+wSdkz
         MZQjGtVy3Ih99U+OaYzFY3nfSMAWHjJXfkOKrFBYj7pZZtYxy7u96fd/On7GC45EMlZi
         rzNLZ5exPI8M2N41pgv2vVnn2DSWlDDBs6oUE4gWP7wvJuKEbxCrYqu23ewmos540CWt
         q+IA==
X-Gm-Message-State: AOAM531IjeTNxrsIeup3fYSg2LZ6xdTYPUat9MT9FZXlovXxj2BqV96M
	7oIoPTzV+rIrTjKrtdqVzQpbWQ==
X-Google-Smtp-Source: ABdhPJzDau7pwVvLCpxszXC/rXBjGfaEgQZEqVtE/A1z/aUdFKjyOLxyw0A9z+XxnRsr7X7tc1nCnA==
X-Received: by 2002:adf:f805:: with SMTP id s5mr321672wrp.259.1631634291752;
        Tue, 14 Sep 2021 08:44:51 -0700 (PDT)
Received: from localhost ([2a00:e67:5c9:a:2e15:c474:2ef7:bc26])
        by smtp.gmail.com with ESMTPSA id j17sm10632383wrh.67.2021.09.14.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 08:44:51 -0700 (PDT)
From: andreas@rammhold.de
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Andreas Rammhold <andreas@rammhold.de>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gen_compile_commands: add missing sys import
Date: Tue, 14 Sep 2021 17:44:40 +0200
Message-Id: <20210914154441.1726853-1-andreas@rammhold.de>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Rammhold <andreas@rammhold.de>

The sys.exit was being used at multiple locations within the script but
never imported. This lead to the script exiting with a error instead of
with the nicely formatted (useful) error output.

Signed-off-by: Andreas Rammhold <andreas@rammhold.de>
---
 scripts/clang-tools/gen_compile_commands.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 0033eedce003e..1d1bde1fd45eb 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -13,6 +13,7 @@ import logging
 import os
 import re
 import subprocess
+import sys
 
 _DEFAULT_OUTPUT = 'compile_commands.json'
 _DEFAULT_LOG_LEVEL = 'WARNING'
-- 
2.32.0


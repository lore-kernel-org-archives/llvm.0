Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97072
	for <llvm@lists.linux.dev>; Wed,  8 Sep 2021 03:30:33 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so479381pjw.2
        for <llvm@lists.linux.dev>; Tue, 07 Sep 2021 20:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YCmgiIqK/f2uj+2FIB5ZoM8EM/HSqIdCmUJnhQwVgP4=;
        b=dc9bzny1WKO1FGe6huTtpTsHefn+LffqFdPXd+y+4gPjwBzud1kpZ5EhiyAEpYrN/H
         QhI4DSxGtfB7pncHLAAHSOveW8GqDwwrhhHu4VAOdyznAyKYfG84FLJ5mI9xCXY2UBmx
         lg169RpruRjntuPFhDy/PF7n0qZmtEcuoUWQCYSgh1a9d1sh4Sjl7tdv16M9Hft2CMmV
         mR/Q9u9ERoCuTNyN8fhVC++xgTt0aGbaSGbC0aD9xcxmFKa0N9fAnPpARPH5U3WQ5AjH
         xbeXqzLxh18Zup4wtDo2V+i/gTx5S1LTGhSMXSHeWZO4O+4ng75XAINJvMXT6RpQfz28
         qXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YCmgiIqK/f2uj+2FIB5ZoM8EM/HSqIdCmUJnhQwVgP4=;
        b=DUX1NIhdSXWuVaGcin2HGMKnB+R07+gx3NwFNCZMjV3x+8me2NyQ4qPZmLmSL4pL45
         EtaAUsPzYZYeX1xJzKSXhFO1uTfI7gLxrjPW7VPI5NPYfHVvQNXYYa8jiIXg0S2X6hVc
         N22l3FRdY/vXipecaGTq+bXTxDUAV+5Bb34y20g4NFK8UKdABPw/QLnKFoPTAMbIfhKS
         k7xRC1df92tGA+e03XOVRbThj2LpdVY1j19qBdWlH6RtWJ8MCkod3mRoAs0ySaeShhDn
         dj+NacMSdfDtfPOTib9HWU2wrFYkcU3u2aDg7FaBm4qxyFKTmTFUqmTOfVbYpTyLtsZM
         Y06A==
X-Gm-Message-State: AOAM533Q2Ahz5ASyN22YXjug1CSNxZzA4k/pnFgSLFztJJmUG1QqtviO
	lyAFGa1T77yUZ5tNlhbsX2c=
X-Google-Smtp-Source: ABdhPJzDt5UczW+E462e0Rsta+z7TRVsEMOa46W64QdwzX81nyylrn7uzqChkR1kefHPcLE507Bn3w==
X-Received: by 2002:a17:90a:b785:: with SMTP id m5mr1823388pjr.213.1631071833256;
        Tue, 07 Sep 2021 20:30:33 -0700 (PDT)
Received: from localhost ([45.76.146.157])
        by smtp.gmail.com with ESMTPSA id t15sm595283pgi.80.2021.09.07.20.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 20:30:31 -0700 (PDT)
From: Kortan <kortanzh@gmail.com>
To: nathan@kernel.org,
	ndesaulniers@google.com
Cc: masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	clang-built-linux@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Kortan <kortanzh@gmail.com>
Subject: [PATCH v2] gen_compile_commands: fix missing 'sys' package
Date: Wed,  8 Sep 2021 11:28:48 +0800
Message-Id: <20210908032847.18683-1-kortanzh@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to import the 'sys' package since the script has called
sys.exit() method.

Signed-off-by: Kortan <kortanzh@gmail.com>
---
Changes v1 -> v2:
* Fix commit title.
* Improve commit message. 

 scripts/clang-tools/gen_compile_commands.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 0033eedce003..1d1bde1fd45e 100755
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
2.33.0


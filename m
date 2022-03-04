Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E3365
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 00:06:53 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id x27-20020aa79a5b000000b004f3f7c2981eso4042300pfj.3
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 16:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=L2EqmECeGnDxBTpQsY7qBHnNCdpRu+0gpxLs2lR25VM=;
        b=Od6sUIoBeI6YLIHz8dugjZNkV2e1G9ybEJ+EtPnZaPldHnMI495OSQXixpu5cD8MIL
         LftkXHa1bDXNL/O7LVOgt6AQJJvJ0Z2+X/vMsRdavLJfC5JpSufc7XnPYGoIJYPFiMxt
         SAHSYAxwfxCNp+0SYsc4xSvU7KTsOv2itMiPEVdMknFAsmNfYdZJ/rWBKFh0Bnhmv5ce
         T7BDGlgmj141JJuCh9WvVnH0a0SXb+fEAuA4BXQieWuqf+pR/BtURhwmoeNU27CHClQb
         kp55gbk1n8GvC5i6hbNFSqVC5JYHoxiOtNPthp61DnahHJj9bxhC570JzV2IIQQMnQY5
         Co3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=L2EqmECeGnDxBTpQsY7qBHnNCdpRu+0gpxLs2lR25VM=;
        b=LdL3PWEIU/18adSqEO/NNxRKAjaIeBazB+C6+IXV82RyBe+XUb3PfqbCz8QQnU4Vo7
         GXynZn7j8+rQlDEgmk2HignZCdekZQsxFlgXliumV46cD2GCuAR4lWyHeC2FpywFea+Y
         m8q6YAhxnpPAZUTnG4O1tbfcGAtp2YXDGRd6+1YbjP3+gqrfsRYuxJc6bSKzyaptujSr
         SCTdOQyV3Kp3H2SDGR2DSuwrCQulRALEZt+Hs03VYVuoBDTz0gd4hgV9e2sibd+A6dGA
         3+f7oGZMQm8CNus3FIfS6ZH1lp6YVkHitAzq1M6DN4szi6JbnDupoxT/+/eSOLI4MQz6
         slMg==
X-Gm-Message-State: AOAM530g5n90FS3iMlL9JgsDmRaPxiD83SUAu1S+bMvUsSRtvY7uHZoS
	vbH8bIW9V0Cz6oQP39o3I/KwDkEgdugopeHH
X-Google-Smtp-Source: ABdhPJwf+20lur8uv++KBdcOVEbgmjgiEAuuWAsUNu0PrpdZBGP1HHD9FdhGtIOfDG0Vu8bdNEN7h6tsuFuUnliQ
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:2327])
 (user=yosryahmed job=sendgmr) by 2002:a05:6a00:de:b0:4e0:ca1a:9f07 with SMTP
 id e30-20020a056a0000de00b004e0ca1a9f07mr41091497pfj.11.1646352412683; Thu,
 03 Mar 2022 16:06:52 -0800 (PST)
Date: Fri,  4 Mar 2022 00:06:45 +0000
Message-Id: <20220304000645.1888133-1-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH] selftests: vm: fix clang build error multiple output files
From: Yosry Ahmed <yosryahmed@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"

When building the vm selftests using clang, some errors are seen due to
having headers in the compilation command:

clang -Wall -I ../../../../usr/include  -no-pie    gup_test.c ../../../../mm/gup_test.h -lrt -lpthread -o .../tools/testing/selftests/vm/gup_test
clang: error: cannot specify -o when generating multiple output files
make[1]: *** [../lib.mk:146: .../tools/testing/selftests/vm/gup_test] Error 1

Rework to add the header files to LOCAL_HDRS before including ../lib.mk,
since the dependency is evaluated in '$(OUTPUT)/%:%.c $(LOCAL_HDRS)' in
file lib.mk.

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
---
This patch was inspired by:
https://lore.kernel.org/lkml/20211105162530.3307666-1-anders.roxell@linaro.org/


---
 tools/testing/selftests/vm/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index 1607322a112c..a14b5b800897 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for vm selftests
 
+LOCAL_HDRS += $(selfdir)/vm/local_config.h $(top_srcdir)/mm/gup_test.h
+
 include local_config.mk
 
 uname_M := $(shell uname -m 2>/dev/null || echo not)
@@ -140,10 +142,6 @@ endif
 
 $(OUTPUT)/mlock-random-test $(OUTPUT)/memfd_secret: LDLIBS += -lcap
 
-$(OUTPUT)/gup_test: ../../../../mm/gup_test.h
-
-$(OUTPUT)/hmm-tests: local_config.h
-
 # HMM_EXTRA_LIBS may get set in local_config.mk, or it may be left empty.
 $(OUTPUT)/hmm-tests: LDLIBS += $(HMM_EXTRA_LIBS)
 
-- 
2.35.1.616.g0bdcbb4464-goog


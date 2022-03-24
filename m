Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D57E
	for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 22:39:35 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id w1-20020a5b08c1000000b00633be107f28so4670702ybq.4
        for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 15:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=2UXOWK4H/ABoSS6KabIKT0cRAkKR0ZUPw5leAS4VA2Y=;
        b=mFrw/DyLpphzNFV0Nr7i6+kDrT0/C9GU5c4FP6bzXJk/QsrgjgdsN5pw+Twz+s6tGi
         qy25SacKdr9ipsWUo6trNsVmt+dTa/NxO3N5FT6aeXplL6+ZEw1LMGDWTo0PQCwb+Bvv
         4GDi1sgE7Jd6QRrZP/c4HReJ6wxGKYe3J8j58vlNKNI0HzHCFnfQgsW07wf12tX5ifUO
         PkWd0jUpPH/MCtF459clWjsDteS21Ykgbme/qNhmrt1Ttph7wf3EUSy9EX8Ao16PvJnO
         QLKcOxdXbMcH953M7Bj/sxYtgU4u2dWspJAXKFL7VZLBu7hfRoPYI0AbX+uq/222BMVD
         SSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=2UXOWK4H/ABoSS6KabIKT0cRAkKR0ZUPw5leAS4VA2Y=;
        b=rV3oWOubWdrpr1Tn6Ktw5cP0hcIsg7PyT2OGPXhOp6PQr1NUbWyh6ntwmTN9I5xh50
         OFSUHulkwPjBSmr3RKyI1GcJAu8huG2CLJT/MXaJ8uxJbg1ag60/fM8pGUVuUiWp5ilZ
         zTO2vv2oMQhTyHRs41+9akesOchYVZkNyL8vQtXeAL1XO2C1/orMB7Gk8bakNALRCR+3
         To6ZcydwBoZ4kxLqAP23oJRrAbBrYbpmwcRmCEsA/xEeZ6KYuObd2K2MmtX2EGfNho3L
         szqQ4EQpR0T3GLQgGjOe+cs7C1qZzqfRkPmGnisyjgKz6SXz0gaADMv6C6C3j7mdT7dl
         uHng==
X-Gm-Message-State: AOAM530b8MIlgrI7fBbPlKsr4b7dQQ2HLeM5dpNQPJ8IictZ8pxUJQGu
	jm/IAoGA/4KsaYQLEqtjqofJ87Cy8bpFQQQVR8zj
X-Google-Smtp-Source: ABdhPJw4BH07SPiQZUc2OcEknGn2R1/wKMDadrW5rM6fMHjf1XTNKTbDi8N9qPU+6gv6J5NGI8IQbzzmpbGwWUQn91RR
X-Received: from ajr0.svl.corp.google.com ([2620:15c:2cd:203:9892:9f7f:2c27:2968])
 (user=axelrasmussen job=sendgmr) by 2002:a25:5f11:0:b0:633:ee0c:ab79 with
 SMTP id t17-20020a255f11000000b00633ee0cab79mr6599611ybb.491.1648161574585;
 Thu, 24 Mar 2022 15:39:34 -0700 (PDT)
Date: Thu, 24 Mar 2022 15:39:28 -0700
Message-Id: <20220324223929.1893741-1-axelrasmussen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [PATCH 1/2] selftests: fix header dependency for pid_namespace selftests
From: Axel Rasmussen <axelrasmussen@google.com>
To: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev, Axel Rasmussen <axelrasmussen@google.com>
Content-Type: text/plain; charset="UTF-8"

The way the test target was defined before, when building with clang we
get a command line like this:

clang -Wall -Werror -g -I../../../../usr/include/ \
	regression_enomem.c ../pidfd/pidfd.h  -o regression_enomem

This yields an error, because clang thinks we want to produce both a *.o
file, as well as a precompiled header:

clang: error: cannot specify -o when generating multiple output files

gcc, for whatever reason, doesn't exhibit the same behavior which I
suspect is why the problem wasn't noticed before.

This can be fixed simply by using the LOCAL_HDRS infrastructure the
selftests lib.mk provides. It does the right think and marks the target
as depending on the header (so if the header changes, we rebuild), but
it filters the header out of the compiler command line, so we don't get
the error described above.

Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
---
 tools/testing/selftests/pid_namespace/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/pid_namespace/Makefile b/tools/testing/selftests/pid_namespace/Makefile
index dcaefa224ca0..edafaca1aeb3 100644
--- a/tools/testing/selftests/pid_namespace/Makefile
+++ b/tools/testing/selftests/pid_namespace/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += -g -I../../../../usr/include/
 
-TEST_GEN_PROGS := regression_enomem
+TEST_GEN_PROGS = regression_enomem
 
-include ../lib.mk
+LOCAL_HDRS += $(selfdir)/pidfd/pidfd.h
 
-$(OUTPUT)/regression_enomem: regression_enomem.c ../pidfd/pidfd.h
+include ../lib.mk
-- 
2.35.1.1021.g381101b075-goog


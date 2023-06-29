Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985121078E
	for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 23:42:54 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5771e0959f7so11004797b3.3
        for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 16:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688082173; x=1690674173;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rwKLI/qRUKPULIlBC3OTUhb6lfrxfVtcL7RWgMXp+DM=;
        b=xZ4gzYmgSDP58mOKR8hM46Nd3CktXTb7BWdOsL40ZpOowsFja8hHx4hEpRu7h+8XXt
         MXlo89FDD72TAUb0aNZwUN9hsD5krX9N6BIDIdgNZjO2+Q9hqoPmMO0wHRAE3CanaHoU
         CADHRRVIOfgsXUI7G64inFFIC6roC6nRP9g9q4FoTqTZt29i4bySfE6PCOpQKuDFFD+S
         qmiO+EA4gU+2Idsy+Qnduwt2kaRDhqdZTG4p59yUdS5hMXfpchMb7zXP+BfLtVyISxVO
         bziwFW/aif6c2MFD81O0+6TPzmJ57qD6QsqQF1V8sU5pSP48L18NjLafTtvf7VZj/Uf6
         mi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688082173; x=1690674173;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwKLI/qRUKPULIlBC3OTUhb6lfrxfVtcL7RWgMXp+DM=;
        b=Z7+FtyD+0eTNJVqWbwfEK/NFYbmKIjRvjlypYeQAXwPQXhxZAGymkCtoLfWzz76pqQ
         6nQRlhsS3x3s5WU//l6Gm2wNo460DNvtPLkLZ3+i/cDce9kARPMoRsi/z5ml+d9Qbs34
         OB/j1n+BR8VmKbYmIU+v2JkhME61w6zgH3ytLotGe1Gw1PKeBmf8TlBKjV9YOIQOEhUs
         nZjIuP3enNeV1ZCMD5m2Snnoxu4yzXTRfBZnXVaqruWeXaOZO3oiYsX6vUIXYvoSldJx
         XnbBulZqNxE2tt+km9Sy9eeZRYR4+74DcAkDOoEPXSbyEvHFieI1yjbH2HrnKB0z2Cym
         r2hg==
X-Gm-Message-State: ABy/qLYfm49ecVlB4myCfKSsgVEZ1UNEs3ELRGUXVb/HsCpOkuWSti81
	M2/FlsDEFbln0GOzhJw/mEy+bGjoBI3VBjhJIuk=
X-Google-Smtp-Source: APBJJlGvY9o8TdVQA2iFVhCCB50GqC+vEYRFxxtjURS+zUxZ3uCTPfePcPm+HJkTvW8UT4zvI1DCpmZcRMm1arw/G+E=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a81:7e0a:0:b0:56f:f62b:7a11 with SMTP
 id o10-20020a817e0a000000b0056ff62b7a11mr6436ywn.8.1688082173423; Thu, 29 Jun
 2023 16:42:53 -0700 (PDT)
Date: Thu, 29 Jun 2023 23:42:47 +0000
In-Reply-To: <20230629234244.1752366-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230629234244.1752366-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898; i=samitolvanen@google.com;
 h=from:subject; bh=Gkp1NJ2f7yYUqQXHMI7a2x2tGYxFA1ILvi7IEKTnass=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBknhb1WHJAgo4Uq6U6j6NflafXu9jZGHzv6JSKG
 I68vAHUjwOJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZJ4W9QAKCRBMtfaEi7xW
 7ra7DACnV4oH9Zp+lDg83B8KilPxMfwy2imQEk7g4tL0+joJ7XhULu9MfK90xn7TM7i4gtaSYlw
 WWtBPr32oT+mqBypw6Zzzh3TjqvFxGw6L4NBPrew6Zv8Q2DnCsPP3MdTja4RKLIR9eYZz/6MKhY
 KoJ1U2HlLEczeZs9jBPFvTUBeodHLyEcItxzzSMGaK8gSj0HUgan9Y0jDi1r2wlPF9qgKtm/5lF
 e3pkg/Uv3sTKtwhfqNeCqnkBuo3UwEAuXmUP2BKHh1RVZRRHkXsYPbi6hckTUsHIsz/Ei36AaKy
 dYHxMndLyrFMOV55dL9x2qlhOYEwmNjRDotAMG/b0sT09z4txrkykyuszG4sHikOQg5drQ6Qt5K
 Fjw/DqnV9FeYOjowphHAm21MgWwnxwBUALJrWe92r5LVU+EqWAZEFtROnZlRkcsTrt3D8P6ozhM kSPl2dnVwxy5LCbyOS8SfKJPZbyg7P3geJcOGAJ3DcZ0TRSuOpXbTvdhgxFYPSa++A5FQ=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230629234244.1752366-10-samitolvanen@google.com>
Subject: [PATCH 2/6] riscv: Add types to indirectly called assembly functions
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

With CONFIG_CFI_CLANG, assembly functions indirectly called
from C code must be annotated with type identifiers to pass CFI
checking. Use the SYM_TYPED_START macro to add types to the
relevant functions.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/kernel/mcount.S        | 5 +++--
 arch/riscv/kernel/suspend_entry.S | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 30102aadc4d7..712c1d2c2723 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -3,6 +3,7 @@
 
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/asm.h>
 #include <asm/csr.h>
 #include <asm/unistd.h>
@@ -47,13 +48,13 @@
 	addi	sp, sp, 4*SZREG
 	.endm
 
-ENTRY(ftrace_stub)
+SYM_TYPED_FUNC_START(ftrace_stub)
 #ifdef CONFIG_DYNAMIC_FTRACE
        .global MCOUNT_NAME
        .set    MCOUNT_NAME, ftrace_stub
 #endif
 	ret
-ENDPROC(ftrace_stub)
+SYM_FUNC_END(ftrace_stub)
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 ENTRY(return_to_handler)
diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
index 12b52afe09a4..f7960c7c5f9e 100644
--- a/arch/riscv/kernel/suspend_entry.S
+++ b/arch/riscv/kernel/suspend_entry.S
@@ -5,6 +5,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/assembler.h>
@@ -58,7 +59,7 @@ ENTRY(__cpu_suspend_enter)
 	ret
 END(__cpu_suspend_enter)
 
-ENTRY(__cpu_resume_enter)
+SYM_TYPED_FUNC_START(__cpu_resume_enter)
 	/* Load the global pointer */
 	.option push
 	.option norelax
@@ -94,4 +95,4 @@ ENTRY(__cpu_resume_enter)
 
 	/* Return to C code */
 	ret
-END(__cpu_resume_enter)
+SYM_FUNC_END(__cpu_resume_enter)
-- 
2.41.0.255.g8b1d071c50-goog


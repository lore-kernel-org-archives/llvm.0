Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB1C14A86
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 16:35:08 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-583fe0f84a5so69094167b3.3
        for <llvm@lists.linux.dev>; Tue, 08 Aug 2023 09:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691512507; x=1692117307;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nTM81EZMZbsGROKqkK+2bQm1mxf+detNdwYuQiVhiKI=;
        b=NLhu0LP53J4D4l9J4feCfPU5/l3uqoArpZHJ0ECEL6xFUd0tcpgZfboT0p/kOcrv1i
         XurwyVIyJVvh9OLoEaf6pP9EgBzqx+ayApgGh3mgBpvOf8w6olcj27SbvaSxITbSMqMN
         CgZIpuMxyfhJyCSjXwTvGkaVdAxYLJF3xZxoaQMDQ1UZxjr4Q22jzvvMcQCFf6tLqeH7
         1dEKTsxQeURWUr5SVN0EFpwesJP3bx+hG1gUlPCXdsSwapIam0tuneLG1tBKmOCqJyjW
         1Y55eWM+4i5zr9j8RJ8Sbzv34OO4Vxei1vpJY8o02jLQT9JQrGXhAGl7FUdxFgOn6p1t
         BbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512507; x=1692117307;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTM81EZMZbsGROKqkK+2bQm1mxf+detNdwYuQiVhiKI=;
        b=kDfQdNP6eFU8LCm4n/V/ak11DUyL3OXqEdK5Dz22+qf+Sy17NVX+OZ0T7S0t49luAB
         DWWSHwoBNNEJ0IbPERSXHqUD15ybea9dvholbtcsVwsqvicWn2zeDYfbPqhfHK5/dsYY
         j8X7hWhR0/yAi8YS4BjbFzTd1JYn38+XKJDF6/S2e9Rm/rekNZV7kUgPtTQbkj2wc7EL
         1mBOqcAhkqK5LL6HXq1luQT3V8KUQEC6LVkT2iAXx3+hXpNdENfjNkchi458BsmDdGXe
         ATMOfCrPPNAZ3FCwhTiWY3+5B2bNkXlUbdkj9B93r3po3wRAQbmZh8bLPrH+BhI33YDL
         E9iA==
X-Gm-Message-State: AOJu0Yw+1mRR/6HOrQK01qOVGhRgnK+oW92a9u3Oi/6YPu5evc7neo9U
	4B8o8xTkSZxkWK8nrMd5UottPXAdUBJB89KC8NE=
X-Google-Smtp-Source: AGHT+IGra8Wwc+HhL5o0pTOnXN44VrV3kTC7GbKyzGjGnaN9IQv8EY6FCqvWavWJO404OgNolWFZn+285BMePOXRcxo=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:cc03:38d0:9718:e90b])
 (user=ndesaulniers job=sendgmr) by 2002:a81:764a:0:b0:586:b4e9:753 with SMTP
 id j10-20020a81764a000000b00586b4e90753mr2137ywk.4.1691512507357; Tue, 08 Aug
 2023 09:35:07 -0700 (PDT)
Date: Tue, 08 Aug 2023 09:35:00 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALNu0mQC/3XMwQoCIRSF4VcZ7jrD0Sht1XvEEKJX50KNg4oUg
 ++ezb7lf+B8G2RMhBmuwwYJK2WKSw9xGMDOZgnIyPUGwYXkiiuWKNv6yMUUskyeFJdndNbgBfp lTejpvXP3qfdMucT02fU6/tY/UB3ZyLSXzmrtjEd1CzGGJx5tfMHUWvsClxODhakAAAA=
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691512501; l=3558;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=0g7k5Ub/PaWtkHDnipVyOF/RYqCFfg6Kly4NdhVJ1+4=; b=Ug/yXmBRV7rjndULD++FZYy1jLinoPsNkkAK8t9L3JV7U5XhMf8DHNpIh7iNPIn8X5mPxvKoJ
 dRaQj3ShdkZADTxwuBmiZkSOcXfBMna7SC6UFCfavkMC+GX9BFqJcFd
X-Mailer: b4 0.12.3
Message-ID: <20230808-riscv_static-v2-1-2a1e2d2c7a4f@google.com>
Subject: [PATCH v2] riscv: mm: fix 2 instances of -Wmissing-variable-declarations
From: Nick Desaulniers <ndesaulniers@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
bot spotted the following instance in ARCH=riscv builds:

  arch/riscv/mm/init.c:276:7: warning: no previous extern declaration
  for non-static variable 'trampoline_pg_dir'
  [-Wmissing-variable-declarations]
  276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
      |       ^
  arch/riscv/mm/init.c:276:1: note: declare 'static' if the variable is
  not intended to be used outside of this translation unit
  276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
      | ^
  arch/riscv/mm/init.c:279:7: warning: no previous extern declaration
  for non-static variable 'early_pg_dir'
  [-Wmissing-variable-declarations]
  279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
      |       ^
  arch/riscv/mm/init.c:279:1: note: declare 'static' if the variable is
  not intended to be used outside of this translation unit
  279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
      | ^

These symbols are referenced by more than one translation unit, so make
sure they're both declared and include the correct header for their
declarations. Finally, sort the list of includes to help keep them tidy.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes in v2:
- Forward declare early_pg_dir, too.
- Remove declaration of early_pg_dir from arch/riscv/mm/kasan_init.c.
- Link to v1: https://lore.kernel.org/r/20230808-riscv_static-v1-1-9f3dc99dafe8@google.com
---
 arch/riscv/include/asm/pgtable.h | 2 ++
 arch/riscv/mm/init.c             | 9 +++++----
 arch/riscv/mm/kasan_init.c       | 1 -
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 75970ee2bda2..b5680c940c1e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -188,6 +188,8 @@ extern struct pt_alloc_ops pt_ops __initdata;
 #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
 
 extern pgd_t swapper_pg_dir[];
+extern pgd_t trampoline_pg_dir[];
+extern pgd_t early_pg_dir[];
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline int pmd_present(pmd_t pmd)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9ce504737d18..cc0e06b4f223 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -26,12 +26,13 @@
 #include <linux/kfence.h>
 
 #include <asm/fixmap.h>
-#include <asm/tlbflush.h>
-#include <asm/sections.h>
-#include <asm/soc.h>
 #include <asm/io.h>
-#include <asm/ptdump.h>
 #include <asm/numa.h>
+#include <asm/pgtable.h>
+#include <asm/ptdump.h>
+#include <asm/sections.h>
+#include <asm/soc.h>
+#include <asm/tlbflush.h>
 
 #include "../kernel/head.h"
 
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 8fc0efcf905c..a01bc15dce24 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -22,7 +22,6 @@
  * region is not and then we have to go down to the PUD level.
  */
 
-extern pgd_t early_pg_dir[PTRS_PER_PGD];
 pgd_t tmp_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 p4d_t tmp_p4d[PTRS_PER_P4D] __page_aligned_bss;
 pud_t tmp_pud[PTRS_PER_PUD] __page_aligned_bss;

---
base-commit: 14f9643dc90adea074a0ffb7a17d337eafc6a5cc
change-id: 20230808-riscv_static-348036edcae7

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>


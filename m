Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2752F2C
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 20:56:10 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id a11so5904719pff.1
        for <llvm@lists.linux.dev>; Thu, 12 May 2022 13:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P/Ac7JONYQRbqYr75B8cPwknKxer6j9wwthXWi5R/P0=;
        b=a9vzilDVBWK31znRhkyZYpN3fhm2ncMeaUJqBg+1Cpjx8PT05UuCERtREHvRj5BHZY
         Qb+gUvYtymqMI+8FsdrWl5qJaHIb9D8nY6hw+JhhW9OK3h0faS05sGiyNkahpMmBRmGA
         8QDus7tX6d4JAuz8co/q2DLC6yAObwIO7HHwzsZw1JQhclpVIotCG0HYwgwn5pTJY6gt
         ZAq0zNpe0o7wb0GOe0d4/l2FuMHzZ/5sO7chV6AxbUX9YPJqMDeVParVYbCyIBQq52aJ
         oWzRcnakW25XwwMmpRl2YtoK0PdhjncL4T87XixUuikhuN8FGDxwpoMFAPRsV4gFyCdE
         HK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P/Ac7JONYQRbqYr75B8cPwknKxer6j9wwthXWi5R/P0=;
        b=ZcfxReKiJmTmt1OsPtaeoATuXTNcQAxhfp6hTtaMCWutwyh9h5N7w51O8MJA/unwqt
         hyFN0p5tRIGUvSA+npnNZJbWOwaTqW+qtBkxfPC21W1KYRRXohCWDi2yWvM59FeNj6DH
         GDcPP1+9uSVcgKKoMMOCah0RVetkTcV2RfBcELLYA+2SAv883woO/+3VWcIfGG0ONwdQ
         TQKKsDUkUkVxlP85U7INIZS53lFR4dZcXiK+0DXmNnGTzed6j64idCj5R/SsXAoW31Uw
         PuL8pPCKV6IHarH4fnNqUySaBc8irn0y265Jj6MOHc6uusGUh12DXW9GqKqI0fdFOSVK
         UxBw==
X-Gm-Message-State: AOAM5304lI+YXRVQKPE8WI/VmEaec3UCKtvpybdil4S/c9QGKbHwMBKl
	7QMZ3Nd96r7FpLrY21+UinA=
X-Google-Smtp-Source: ABdhPJwGz4p76paZX1fTS49cyppG95kskcfcQitNZXrNm+Ea3iZqgsWKNzmM6+/+tz57/l3BGKh8gQ==
X-Received: by 2002:a63:d90c:0:b0:3c6:4ab4:fbfe with SMTP id r12-20020a63d90c000000b003c64ab4fbfemr1129133pgg.499.1652388970134;
        Thu, 12 May 2022 13:56:10 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:1:20::1f:7001])
        by smtp.gmail.com with ESMTPSA id t189-20020a635fc6000000b003c14af5060dsm139955pgb.37.2022.05.12.13.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 13:56:09 -0700 (PDT)
From: Wende Tan <twd2.me@gmail.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Cc: Wende Tan <twd2.me@gmail.com>,
	nathan@kernel.org,
	ndesaulniers@google.com,
	llvm@lists.linux.dev
Subject: [PATCH v2] RISC-V: build: Allow LTO to be selected
Date: Thu, 12 May 2022 20:55:45 +0000
Message-Id: <20220512205545.992288-1-twd2.me@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
issue [1] in prior LLD versions that prevents LLD to generate proper
machine code for RISC-V when writing `nop`s.

I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
can boot to shell using an archriscv rootfs on QEMU.

I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
`BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
separate patch further.

[1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
    commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")

Tested-by: Wende Tan <twd2.me@gmail.com>
Signed-off-by: Wende Tan <twd2.me@gmail.com>
---
v2:
- Some textual changes suggested by Nick.
- Drop the changes to `arch/riscv/Makefile`, since the LLVM issue is filed
  and resolved.
- Drop the unnecessary changes to `arch/riscv/kernel/vdso/Makefile`.

v1: https://lore.kernel.org/linux-riscv/20210719205208.1023221-1-twd2.me@gmail.com/
---
 arch/riscv/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 00fd9c548f26..c55f6b95e5af 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -38,6 +38,10 @@ config RISCV
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
+	# LLD >= 14:
+	# - https://github.com/llvm/llvm-project/issues/50505
+	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
+	select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
 	select ARCH_USE_MEMTEST
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
-- 
2.25.1


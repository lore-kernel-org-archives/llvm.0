Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0512CCB7
	for <llvm@lists.linux.dev>; Fri, 31 May 2024 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717172621; cv=none; b=APwuaAy/KBtIzaxRPfaXGnm1UKa/n2lKpeEB/RCdqitaFB+C/Nx7n7yasAweyJQFiFuZ2hb//IZzFxqk3PIsCgjZ+SdNWr8Tqgi9sRvf5yvP3H2oeE/3JHn8dA2dVwIdBGwR60kT7NavTMj6qeEnlZHHpAVllWQ1OG/v1j9VRX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717172621; c=relaxed/simple;
	bh=bIfxEfz4EBdKnjco6iVqwTUBBvuXdTOs9eUQkf5mKfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJQb6H+owkBSRYXN3hPk/GBqIIZCw9WFL37BrUFB2Qv/c/8DBZWhLuxFugxhsSDkdBb/upVRXaIaR68w6uS7UaFmVu2DAJ3II4HRbBGaGomdZcUAzT0BuMNhA9iWax04RIaAmVIYaoW0615i8GFYwPRkKvo0YNdkbp7b77G6HU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=y1ZTmVu8; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="y1ZTmVu8"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7024d560b32so438008b3a.1
        for <llvm@lists.linux.dev>; Fri, 31 May 2024 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717172619; x=1717777419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rsKkVgyABm2zSwFdUDJOXq7adWq0Ho5JZ/Z2NJ4mJiU=;
        b=y1ZTmVu8v18IIYDOH+H4errFXoFTQMmRfGS92wj/0yJhjX9Ln9vcUb3av8xW0Ho4PN
         0QJGxiEJbqWrjPc9WMbNGUHfJuhyBt29cbt/lOGjLnXdiHC+OKEr3+n+NfOv/YOe8108
         yFbCHpwt/MXyPKQ40I5h6gtdTGyv6zr/1pnbeS6jw6bDXURjMOMxWZOG81aoTvdPq4qc
         BIwr/oCyC01+hqONUsa8O4Sc/Gh6megpFB8lS5KJZDar2tYdvzp9U2jcaTRT+Tso+RvV
         y1wvQbAYc/F+lqtE4beNC/nVkNt7COKMHMGmSeVmEdeGznQAo2qjrx6jhR/nCHvRMsGf
         iH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717172619; x=1717777419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsKkVgyABm2zSwFdUDJOXq7adWq0Ho5JZ/Z2NJ4mJiU=;
        b=qaNSOLYVMeufsN0uS2GrpfAexqAdCeyHH1I9sJlEsXtubtr4T73jc/1RcovZz4wyON
         /Awp0N7AA6dFwZTwJu9NWBbFsQPJoqAyOWjd/UeMYdex4oxwJ99zrWneLtGIRnZvW6zA
         rzuh239PGmgA+s/orY8m8HCwJvLQnqsTk+aD8mBOj351zCwKDGwi4lCVwaGo5JAeArbk
         YImhmgt6gdLpiPhk1Pu/3U0r8sfPtiZauKQrU8zLpRhpV+0lWAomcthCdx8Wu6t5WeBf
         b3Imp4uB/LJ94TrnKlY7KeGCcTZUIHkRYGjKLNOHNUu1jWkUCn3uUjredyvHHDOA8HzS
         BMEA==
X-Forwarded-Encrypted: i=1; AJvYcCW1c/y+JFe99ZaBUmf+97inH9x71Zsc/2xkh1JTTmNctIp8KufiG+Np5LfYfsMSalfiTQsu3IIlG/RvDL/471f4vpq/BA==
X-Gm-Message-State: AOJu0YwwzVHNfCIfNeNFIVX+kE438ptnYRCLGNTAnAfWspCIobquYPWq
	VutqPU5x0WZ+5LcrID6H6V6glKx3VChlNN6gHmiTBdNCTdgKRQ4716ekdZz3K7s=
X-Google-Smtp-Source: AGHT+IHpgxDFAp5J7T641RR+0mVW8V2Nn0gbrQcP9lUx8oojqxJVe9W67kxVGgNI9Mv6tX6A5vxQdg==
X-Received: by 2002:a05:6a21:3a4a:b0:1af:86e4:bc99 with SMTP id adf61e73a8af0-1b26f12ce72mr3535729637.10.1717172618783;
        Fri, 31 May 2024 09:23:38 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423cb6eesm1572398b3a.6.2024.05.31.09.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 09:23:38 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Date: Fri, 31 May 2024 12:23:27 -0400
Message-ID: <20240531162327.2436962-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dectect the Zkr extension and use it to seed the kernel base address.

Detection of the extension can not be done in the typical fashion, as
this is very early in the boot process. Instead, add a trap handler
and run it to see if the extension is present.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/kernel/pi/Makefile           |  2 +-
 arch/riscv/kernel/pi/archrandom_early.c | 71 +++++++++++++++++++++++++
 arch/riscv/mm/init.c                    |  3 ++
 3 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kernel/pi/archrandom_early.c

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 50bc5ef7dd2f..9025eb52945a 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -32,5 +32,5 @@ $(obj)/string.o: $(srctree)/lib/string.c FORCE
 $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
+obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o archrandom_early.pi.o
 extra-y		:= $(patsubst %.pi.o,%.o,$(obj-y))
diff --git a/arch/riscv/kernel/pi/archrandom_early.c b/arch/riscv/kernel/pi/archrandom_early.c
new file mode 100644
index 000000000000..311be9388b5c
--- /dev/null
+++ b/arch/riscv/kernel/pi/archrandom_early.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * To avoid rewriteing code include asm/archrandom.h and create macros
+ * for the functions that won't be included.
+ */
+
+#define riscv_has_extension_likely(...) false
+#define pr_err_once(...)
+
+#include <linux/types.h>
+#include <asm/hwcap.h>
+#include <asm/archrandom.h>
+
+/*
+ * Asm goto is needed so that the compiler does not remove the label.
+ */
+
+#define csr_goto_swap(csr, val)						\
+({									\
+	unsigned long __v;						\
+	__asm__ __volatile__ goto("csrrw %0, " __ASM_STR(csr) ", %1"	\
+				  : "=r" (__v) : "rK" (&&val)		\
+				  : "memory" : val);			\
+	__v;								\
+})
+
+/*
+ * Declare the functions that are exported (but prefixed) here so that LLVM
+ * does not complain it lacks the 'static' keyword (which, if added, makes
+ * LLVM complain because the function is actually unused in this file).
+ */
+
+u64 get_kaslr_seed_zkr(void);
+
+/*
+ * This function is called by setup_vm to check if the kernel has the ZKR.
+ * Traps haven't been set up yet, but save and restore the TVEC to avoid
+ * any side effects.
+ */
+
+static inline bool __must_check riscv_has_zkr(void)
+{
+	unsigned long tvec;
+
+	tvec = csr_goto_swap(CSR_TVEC, not_zkr);
+	csr_swap(CSR_SEED, 0);
+	csr_write(CSR_TVEC, tvec);
+	return true;
+not_zkr:
+	csr_write(CSR_TVEC, tvec);
+	return false;
+}
+
+u64 get_kaslr_seed_zkr(void)
+{
+	const int needed_seeds = sizeof(u64) / sizeof(long);
+	int i = 0;
+	u64 seed = 0;
+	long *entropy = (long *)(&seed);
+
+	if (!riscv_has_zkr())
+		return 0;
+
+	for (i = 0; i < needed_seeds; i++) {
+		if (!csr_seed_long(&entropy[i]))
+			return 0;
+	}
+
+	return seed;
+}
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9940171c79f0..8ef1edd2cddd 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1025,6 +1025,7 @@ static void __init pt_ops_set_late(void)
 #ifdef CONFIG_RANDOMIZE_BASE
 extern bool __init __pi_set_nokaslr_from_cmdline(uintptr_t dtb_pa);
 extern u64 __init __pi_get_kaslr_seed(uintptr_t dtb_pa);
+extern u64 __init __pi_get_kaslr_seed_zkr(void);
 
 static int __init print_nokaslr(char *p)
 {
@@ -1049,6 +1050,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 		u32 kernel_size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
 		u32 nr_pos;
 
+		if (kaslr_seed == 0)
+			kaslr_seed = __pi_get_kaslr_seed_zkr();
 		/*
 		 * Compute the number of positions available: we are limited
 		 * by the early page table that only has one PUD and we must
-- 
2.43.0


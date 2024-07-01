Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CCB16F0CB
	for <llvm@lists.linux.dev>; Mon,  1 Jul 2024 18:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719859941; cv=none; b=LR1NwkuUAKPdt0QujjCI0zeYEBOwjshColzRaib1/xItenNo14FxyqkfWzdVV2jQRREaqf1LGHtDWGfMTDfMCPTLy3JLc3IDiD5wvLBLP5DFUdRbMtMq2ClVx2dy9OvrBCg3k4/rRvRBi+vp6LSBAn5REalaAFuhEfZvrrIHELQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719859941; c=relaxed/simple;
	bh=ZcG+b3Dv/SnxxwfzU/Qq9Bc/ThEdYMBG2LbDPkLlC9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TpONiIU1SrsPRZzcazBDR9POamd1CLJqEghaMeQu5QkfXSBwgP4vUEDP4zSHfUemNRJ7ypKzzX+hOAOdVPw+8wkMV/AJK79cvMKka4GF88lkmQHmN9McKhDVJdniTI/yCAIWSKNejsZHvwLJC4p1PAZh/o/DNgTfzHMnO2bz1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jbRUtK8t; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jbRUtK8t"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fab03d2eecso26099645ad.0
        for <llvm@lists.linux.dev>; Mon, 01 Jul 2024 11:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719859939; x=1720464739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itcRXPPZh8Q3BXWaLokMC5j6eLfJ7AJxltwXOVqlQWc=;
        b=jbRUtK8twQ//5SeKMtcUcIdeNUlNAwyI3MlN0sH2sqNrU1Odxy3condGZ1Wanbyoa7
         /TNHJZGUiXbxZBeiG9h7VzcUsYJAmFkdBipbd8ytPVkl/CJDeC5EaQAwZoyBVIEDkjqf
         vkaEIVExB/Fa8+1PXjU0qr4t1f3m+ieI+DLsUk7t9kpN1gtaLKxAEdOqSHiTXfIsdBk6
         ASz3vSZA2sdGcWCfgFo5i48MluJrokQJg4ADWpTT1u/vt7HpejlpYJwrJA+WagrPXVbe
         Re063cLRMogXOmsxsKEc/0lWqC2jNGcOHej2vZ7APcMbjcbM1uLxM5jEVnwqlyKgc34c
         z41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859939; x=1720464739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itcRXPPZh8Q3BXWaLokMC5j6eLfJ7AJxltwXOVqlQWc=;
        b=kDSYy7MyS2gUGXq5zRrP2UtkjMyzcKe3kg/zLF8PcQ96vrc7xTjyRy3JEuVAe3rAWv
         zv41e3bSLms2mwXIsfyCtyDFMrATzWh7R7CS82nTJAsBiQkI5K1nZkUQFEOu+pInpQke
         glRrCjCITII7ULUZRAsNxCN2FN1GXA3df+Wj22p5wuDo2Kx+GO8Li547nZNYkDDhrXbd
         r0J0RCdRtprZRhdpfegU6WOd+nXK+gRPb8Or46p+N4yXxsbiAdxLTtT8cNEzVZ6118Yc
         xSxwbUr0LA3dDGm4HEpJWvIsCxJfa9IhFfkowfmsTBphrLU9wLpNzOkWeNIXxTh1qS+5
         zKLg==
X-Forwarded-Encrypted: i=1; AJvYcCVQb1Zx1xP0TBxgqjGuqWoYRpxLal1ASq4JaGEOpRthe5npGVb5ptPA/g2e4g4J8A0sudd4MwWmmJCFC8QVEULTutAmvg==
X-Gm-Message-State: AOJu0Yx08QvJxvjabpASSKz+s4kZ/eZmYC3dP4oB7LuruAhCnFBexOS7
	RmeZu8mgqHntQulygH3CGrTdNFD9neRa5A2Te7JNb9mQBDXywjtOzAu0M0JoJkQ=
X-Google-Smtp-Source: AGHT+IGIUJjGzCtP0TFRY0kOYr6wkwolnJ7bp8Bd4PCKOWhg54h7MqyOQeiMmVlGODF0WvjecY3/hQ==
X-Received: by 2002:a17:903:32d2:b0:1f6:fe0d:ad47 with SMTP id d9443c01a7336-1fadbd08cbbmr59034325ad.62.1719859939141;
        Mon, 01 Jul 2024 11:52:19 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1ccesm69883375ad.20.2024.07.01.11.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:52:18 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 3/4] RISC-V: pi: Add kernel/pi/pi.h
Date: Mon,  1 Jul 2024 14:51:31 -0400
Message-ID: <20240701185132.319995-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701185132.319995-1-jesse@rivosinc.com>
References: <20240701185132.319995-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pi.h header for declarations of the kernel/pi prefixed functions
and any other related declarations.

Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - Spelling
---
 arch/riscv/kernel/pi/cmdline_early.c | 10 ++--------
 arch/riscv/kernel/pi/fdt_early.c     |  7 +------
 arch/riscv/kernel/pi/pi.h            | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/pi.h

diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/cmdline_early.c
index f6d4dedffb84..fbcdc9e4e143 100644
--- a/arch/riscv/kernel/pi/cmdline_early.c
+++ b/arch/riscv/kernel/pi/cmdline_early.c
@@ -6,15 +6,9 @@
 #include <asm/pgtable.h>
 #include <asm/setup.h>
 
-static char early_cmdline[COMMAND_LINE_SIZE];
+#include "pi.h"
 
-/*
- * Declare the functions that are exported (but prefixed) here so that LLVM
- * does not complain it lacks the 'static' keyword (which, if added, makes
- * LLVM complain because the function is actually unused in this file).
- */
-u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
-bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
+static char early_cmdline[COMMAND_LINE_SIZE];
 
 static char *get_early_cmdline(uintptr_t dtb_pa)
 {
diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
index 899610e042ab..40ee299702bf 100644
--- a/arch/riscv/kernel/pi/fdt_early.c
+++ b/arch/riscv/kernel/pi/fdt_early.c
@@ -3,12 +3,7 @@
 #include <linux/init.h>
 #include <linux/libfdt.h>
 
-/*
- * Declare the functions that are exported (but prefixed) here so that LLVM
- * does not complain it lacks the 'static' keyword (which, if added, makes
- * LLVM complain because the function is actually unused in this file).
- */
-u64 get_kaslr_seed(uintptr_t dtb_pa);
+#include "pi.h"
 
 u64 get_kaslr_seed(uintptr_t dtb_pa)
 {
diff --git a/arch/riscv/kernel/pi/pi.h b/arch/riscv/kernel/pi/pi.h
new file mode 100644
index 000000000000..493c8cb7c0e6
--- /dev/null
+++ b/arch/riscv/kernel/pi/pi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _RISCV_PI_H_
+#define _RISCV_PI_H_
+
+#include <linux/types.h>
+
+/*
+ * The following functions are exported (but prefixed). Declare them here so
+ * that LLVM does not complain it lacks the 'static' keyword (which, if
+ * added, makes LLVM complain because the function is unused).
+ */
+
+u64 get_kaslr_seed(uintptr_t dtb_pa);
+bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
+u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
+
+#endif /* _RISCV_PI_H_ */
-- 
2.45.2


Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C1117B046
	for <llvm@lists.linux.dev>; Tue,  9 Jul 2024 17:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720546785; cv=none; b=OlamjD6AiLEutWgrc5Z/YOhkwq6YbutynW5zZr7osVNWEzA2z0Zme4nu1GZ9Qo8aMbBuT/Gjn1YjaiRB7Ur2Rdfi/rSwGmc9/8xI9Co/lKSw0mRW4jBb0xF9VjfwGw5zLn6DcpHX3I/ogmS/5k4PoGRWHetRQr+WksPqivqsLFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720546785; c=relaxed/simple;
	bh=iZR0NGWR5vQW1Y6XAHVII3rqckWYwV27vJBs+YmWQHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XTNgdKwpNlV5TCExMrEO/pczyI2mo/bPUF5K+BQS2z+rf2DBZP1PLAWugxw3zO6HRDA4WYvp0yc4L5+lHKu+NGyYRJ0AAICqpkn/X57WB4uh3ZCwQNYQO3xGdD0iBSYY4bPY/5/82dQPgUy+aXwlgPw8+eKgSYlQ0wkmxpjl5Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=M3sMJIgU; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="M3sMJIgU"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-79f08b01ba6so246825485a.0
        for <llvm@lists.linux.dev>; Tue, 09 Jul 2024 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720546782; x=1721151582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oe7d24KWB8rzk++ulHp+tuuvOpse+BwjRMWl/Nf52L0=;
        b=M3sMJIgURAfHpik/nS2rteGErKU1mR2x0QsX73auIK9gXOePxasvT9LuhbSlYmb4le
         4lLzy3CNsDWBHuuCyCBAZ8T9QgrRdicfVN+Ry2VAvesRjigG0JnhBf9OvuCl0uHK2VEV
         qLfBqI9WdLHUNjSTq7X6n6/aMU0bm7IONNQbrMN/GUisD2UiU/XlbeXZ87KqUlCq4Gxh
         QwtdBZs/KliOnuq+w9osMRe+5SrPbdcIPviRx2O+bs5HWCOqNa42S0pxzEn9flzWNopX
         jZAfyUcgrhoBc0OnsxXQxJetiUa0D+KYPcLOstS12ZfHC/4A7usC/hsaRs0Chg9eQjWC
         eaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720546782; x=1721151582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oe7d24KWB8rzk++ulHp+tuuvOpse+BwjRMWl/Nf52L0=;
        b=wtF6emMGaLwAJk0Fm/rFwezI9u2oKK14Z5M4rypn9MfX35Dsd1uGJzbCMIfGRj8opV
         z5xFiqSw8ImOdOm4vUaSQxqdRoPiQG7WkWngL6MLBlYOvR8EjVX3ap/IwXZ2LWXjWRGr
         6opgEEmkkYHcQfH2pkoRux1jeuUVNXOpst9m932zVGJxD/tO1E7ikixnlca3KM8YbtDK
         KAV1utCPRWKbbKbckoxYTytvt4Hdm0YX7WAt5vbFBD8yjBaoO8lNKdvsqFef/h2fNpWe
         xzONJ7vXuuwXmLzdaxd3dE07T2dinymNGa6rCH02aa8WE64UtovUWt/S4AMrC0ppzwUh
         R2vg==
X-Forwarded-Encrypted: i=1; AJvYcCXDZvw9k59YiSpI+FsHaftE5yiNC7yAtQNFKfQPtVLyuAJLa0lbKZ+iML9+L7DE2PlJmtf22iQkLMnjK2WKG6vGm0/CPw==
X-Gm-Message-State: AOJu0YxY+Q06/k3gehyWg9DSkYuBtt3Dm0Lz04gcOXPdeE0UlXo4VB6f
	iDRM4vmcunBZEUxQGzy8YeK4eGHN6jZQJoorVcZptYKKEoe0RdtBETN/s8tZ7ig=
X-Google-Smtp-Source: AGHT+IGWO7bA4cK6KdAEt99qo/k1Gyg+6RZq4MQ67Cvy2nU3f5DYdGmozbUGc4IeTVAirQbmHO6UsQ==
X-Received: by 2002:ae9:e411:0:b0:79f:1bb:e7e6 with SMTP id af79cd13be357-79f1b5a9a89mr506394585a.18.1720546781921;
        Tue, 09 Jul 2024 10:39:41 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff6762sm117547785a.10.2024.07.09.10.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:39:41 -0700 (PDT)
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
Subject: [PATCH v4 3/4] RISC-V: pi: Add kernel/pi/pi.h
Date: Tue,  9 Jul 2024 13:39:36 -0400
Message-ID: <20240709173937.510084-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709173937.510084-1-jesse@rivosinc.com>
References: <20240709173937.510084-1-jesse@rivosinc.com>
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
V3 -> V4:
 - No changes
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


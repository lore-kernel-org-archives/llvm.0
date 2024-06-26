Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57063770EC
	for <llvm@lists.linux.dev>; Wed, 26 Jun 2024 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719422240; cv=none; b=rO0sQUWeqvSrBqD5Xw+qC6GZwe3wB37SoI/McQPdkYgSBK47f9pAd9oSDNEAlCIR3r0KV6ccdNMx9ta8EFbgju8oa5xKQgwBieybyqCB6VFJvb2uPKcCfh1KBj4TTKOeTaJMPZhIh1tcfM42JzX8Jbh1bDoqOr+TxCJh58MTsYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719422240; c=relaxed/simple;
	bh=3DZZhmSFMOPavCMPfnNC4cOlShyrQAnClSJBDgY04zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m02MC7jKmKxNqEJ2jOG7o3Pp9waw2ow4D4CYIiVWzWwrsQaeMyXiXAcqTyxgNZzuGnb61W3qBLuZx0Y44MG9wi3W3sPnp6bsLLKVfLXO8NL+moNTLzDgVmcXptu/vBVIYhESIkjkqlb2TpVhx2ueDAIvXrOUXr3YoOvX9uDnNDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=t5oPAlUF; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="t5oPAlUF"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-681bc7f50d0so671715a12.0
        for <llvm@lists.linux.dev>; Wed, 26 Jun 2024 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719422239; x=1720027039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+lAD5jtfoEc4FrM9h7co7KfTqJwWQk8uXEwNnDDNnA=;
        b=t5oPAlUFtseH/dopiHNzePnjjjbLKaHnXbS+TO2rneou0avZs2/OpPmGqSKyFtvPzf
         5SQmtVA0JLfwpNTaA3uOltIQSMa//lq/MrZ0jamqE4Y0L1HoKez2KDXp1LY3Xo0BC2XG
         bNq8UrJ8HHzktrU8Klg+OK2HDuLz5MipF5dIeLvANlHXtrZKQKWKdI97mb1S0J8JctNt
         TynqwncI9xpBHwFI+EJAHPtPmE5CCiTCuizM5WwiEMf6fJYClE1lV/pcAqVI+2U+meoC
         QqZ254p9/4u3XCDhIp02nr1vw+iBhebGl6t1MCOLC09eHLMiT6UPpbXyvdsIKVnU1Wzi
         gcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719422239; x=1720027039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+lAD5jtfoEc4FrM9h7co7KfTqJwWQk8uXEwNnDDNnA=;
        b=OAyLsLdDwhmXT+EVYkk+ddOH7hyypyqEOgT5i5brRElyqtrdmosgr6gFWXaWwfvlSZ
         e5Xzux/erFQcoErOoeBlsJq+vPWeY0Hbi7rch1IkJUeNFvOanlfyIbz6X+IGaLjaS+xj
         8FgDu2DHcx0W3MQObteK1IDztwgG+gI91FkpEIN4JEgOPOIevtoX0i5s4/YWNChF9bP1
         4h0sMFd1g1uFhKO/srfXZdiPnE8waKFCrc71E0sQGKdV/TnQSJZjlZM1xkCbjsiZeiDw
         ONxJPpFIg9K4zmEA3oaE4tqHdbYTBafYoNH78EIab6TGq7UOmFV5+ccdD1hQ5vTDvBdN
         qrEg==
X-Forwarded-Encrypted: i=1; AJvYcCX0zFiStU/Y4A3NLlye3QG4O6XEVgFjsq4gIBRuMuu0GFOHt9anMFRMZ4RicsdbIyNx/yTTTUKi5Burvsc5R8n3ZO9e+g==
X-Gm-Message-State: AOJu0Yze2I1W0IIR5LtedwYCk2YRj1ffdUW5N4VOZ/obaH9DO7qxkueV
	+ReYb+5RjHAHF/P9IZhjtnnn2jxEiyeNpdWMNuLbROfH3Cp2g+n+wfQvjshpTU8=
X-Google-Smtp-Source: AGHT+IGG7s6Oe33J/XmHTMtV5FMqVvWxCk+2M3wpvCrsMnzNwrLwsfiUejeLhxTVumdEvPHZXZpSuQ==
X-Received: by 2002:a17:90a:4094:b0:2c8:2236:e2c3 with SMTP id 98e67ed59e1d1-2c848a4399bmr15456635a91.17.1719422238599;
        Wed, 26 Jun 2024 10:17:18 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8f3b5ad36sm83217a91.26.2024.06.26.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 10:17:18 -0700 (PDT)
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
	Chen Jiahao <chenjiahao16@huawei.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 2/3] RISC-V: pi: Add kernel/pi/pi.h
Date: Wed, 26 Jun 2024 13:16:51 -0400
Message-ID: <20240626171652.366415-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626171652.366415-1-jesse@rivosinc.com>
References: <20240626171652.366415-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pi.h header for declarations of the kernel/pi prefixed functions
and any other related declarations.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
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
index 000000000000..65da99466baf
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
+ * The folowing functions are exported (but prefixed) declare them here so
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


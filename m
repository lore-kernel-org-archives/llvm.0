Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA8A3CAE74
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760863; cv=none; b=L968hr2HLi9zgZHcKhXmO8seWCR/VFp9cF1HkeekvzXunws8ffrS2IwAYOI5S6VAKvqS9W2emqt2AVzI1of4BddtJJNIZje9mobqRy/LgFrDNjoJbCgiqKrpT2qF+DogJ15ZuzM/ThykKUYrZl0Wyax9Uy4ylIuOG9jlGwq42Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760863; c=relaxed/simple;
	bh=K9YIy6nRaPm5AKmuze1Wd8slFCu+Gy4VPtOB1XGNHfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q734xst5kG6A1MFdvJFJNMGefOivMnvcaY/XlMh/1HftCwZRuOSVT6zpE6b9X4AXXBTTXlSotDSNNCI6mIB1l+Oz0KhcigJ6SScCGBSHxG5nOne/TjiwT94r4XWxPmNuFWbiCTFvrCKcuz++V9/H5lDHy20x2KM18LWuJCZObuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DY2HLTgm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DY2HLTgm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-459bf19e87bso2704214f8f.1
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 05:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778760860; x=1779365660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pgj61FBq/UbvmM2TQH6EKEDIV/V9Gcyb7zXKSvEriQc=;
        b=DY2HLTgm2UO2Eb4bwtramJPt7OFIBgfIQL08TW6bpSn46ykVCGXQ/9pIUTXJ4Lz/Jd
         pyzr7z39F8zRLRvAgHtkwyOyFIRbMwnNWC4QSFp71gYChSovVG8xyqFydKYgQQ515N6P
         mbvKvHiDbyAyinfPIXTNxH/IEBt4B9G5wEj3KkAEilVlXFLhRJOE6uw/bN6BjNfzt/kl
         +M18o68EZZI8ANHx340IHHSH+CbjvyPn4CAjzT0wSSgL/3Rcijv7xoDHeS65bgayz/P0
         s4dCKZdoB9h2hgw5II4bI+2i5gXgIDwCcz/PcHtggGejq0LUxGuSSDJsxbFRlTpV4VMQ
         Blcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778760860; x=1779365660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pgj61FBq/UbvmM2TQH6EKEDIV/V9Gcyb7zXKSvEriQc=;
        b=Sd8m3OLmcWAzFUR9aoGGAB9JEfrS5xyKYLjsZR5swcFHm0Te9pYTLB1H1eIyoociuY
         sGVATgG2uXqRh4TUKOh+nxuJuMvJ/S05G88cP+uDyenXcjn8V+a0GJo76nz2jQQtn32u
         64UF+U5fOtCCr360cWpAWMcdmCXebwl5Z02q7uHJr1MRSpxNSdkHAr8pAn6AJUXQqVmB
         pjicjLHoeepfLiJD5womBBQaPRzck7akljsvDSZr2pKEUiFGwXYN7PmEcmcppzlIkgUI
         1eTmoCmn6aSVDvQXyATar3uSkmbbw9QPLtjzRm6il/B3nF3uz0NoMRvjk1e5riE6gT44
         BeJA==
X-Forwarded-Encrypted: i=1; AFNElJ/IssdfcWoI6tN13vvLoyYZkZwRRylXpQaqNBU2WK8TLEwMVLHK1hn2uTn7c92t3JIs5kVP@lists.linux.dev
X-Gm-Message-State: AOJu0YzEqVSE1/qM4ZzdV2w3plU1Kvrzj3TfQq+PRmxscvdkf6F2ByFG
	nSo4XvndEzo4KNrLpRpIfFC//RpWHh7hUTjBKaL9a6MMa8yABm0bgs5P
X-Gm-Gg: Acq92OEiYyNHBP2pxAMhMzkiAvObGkj64sV56YpDN7Flni3wXSfhiecpHVgX7GluAn5
	1QfjliNkqN+2VsloPZgltfOt5M72mFgF0MOmYD1ngET959vAt5Pb5s7uMN7Zahsgv0utkomD+4P
	y1ysq6y7u9Vw654mfp33qY8RdKHYD5N1TRNwZFxJEi1K5az6omUx72ztL8AFZ9pg6syzNzqpQO8
	CWvh272nweDFniwkx16aCkYmgpExfN5jLf9eJsI/PGkDIrYFAiqtFtiOzCXb0mfAQVP2NeQOOtL
	m6CVT0uh8smkTm1zjV0jEXw7PzPwYKfFV8p7K3llaYuKeMe2ZVOcqfz/cYApHGFdYhncQR11XrR
	5EyRXCMIPRC1YneKe5BgQ+qKGFpVlzfSAlc0AIRB0FrcDiVDNI4WfheiKBsEISIVJy6plCJBFpW
	cTkP2id66z1Izm0WV+zxJYhioStErstQHd52KUWGBFfA==
X-Received: by 2002:adf:e884:0:b0:45d:817c:b8b2 with SMTP id ffacd0b85a97d-45d817cb8f7mr4986962f8f.30.1778760859579;
        Thu, 14 May 2026 05:14:19 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([77.243.27.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm6285630f8f.2.2026.05.14.05.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:14:19 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH v2 1/2] riscv: lib: add memcmp() implementation
Date: Thu, 14 May 2026 14:13:57 +0200
Message-ID: <20260514121359.931999-2-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514121359.931999-1-milant2002@gmail.com>
References: <20260514121359.931999-1-milant2002@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

Add an assembly implementation of memcmp() for RISC-V. The implementation
uses the ZBB extension for word-at-a-time comparison and an assembly
fallback for non-ZBB systems.

Benchmark results (QEMU TCG, rv64, Aligned):

  Len   | Default | NoZBB  | ZBB    | %NoZBB | %ZBB
  ------|---------|--------|--------|--------|-------
  1 B   | 20.3    | 25.0   | 20.9   | +23.2% | +3.0%
  7 B   | 88.9    | 107.5  | 155.7  | +20.9% | +75.1%
  8 B   | 89.6    | 110.9  | 176.2  | +23.8% | +96.7%
  16 B  | 134.4   | 172.4  | 334.8  | +28.3% | +149.1%
  31 B  | 163.5   | 220.5  | 606.2  | +34.9% | +270.8%
  64 B  | 203.8   | 235.9  | 968.6  | +15.8% | +375.3%
  127 B | 224.6   | 268.7  | 1362.8 | +19.6% | +506.8%
  512 B | 235.7   | 271.1  | 1913.7 | +15.0% | +711.9%
  1024 B| 256.8   | 290.6  | 2123.6 | +13.2% | +726.9%
  4096 B| 263.8   | 302.9  | 2290.4 | +14.8% | +768.2%
  
Benchmark results (QEMU TCG, rv64, Unaligned - Offset 3):

  Len   | Default | NoZBB  | ZBB    | %NoZBB | %ZBB
  ------|---------|--------|--------|--------|-------
  1 B   | 20.7    | 21.7   | 21.5   | +4.8%  | +3.9%
  7 B   | 96.2    | 99.1   | 96.9   | +3.0%  | +0.7%
  8 B   | 97.5    | 118.5  | 110.5  | +21.5% | +13.3%
  16 B  | 136.7   | 166.6  | 172.8  | +21.9% | +26.4%
  31 B  | 167.6   | 206.5  | 211.9  | +23.2% | +26.4%
  64 B  | 204.4   | 229.9  | 240.3  | +12.5% | +17.6%
  127 B | 229.6   | 261.7  | 269.0  | +14.0% | +17.2%
  512 B | 245.5   | 260.8  | 269.9  | +6.2%  | +9.9%
  1024 B| 246.9   | 261.2  | 283.5  | +5.8%  | +14.8%
  4096 B| 250.7   | 295.8  | 299.7  | +18.0% | +19.5%

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
---
 arch/riscv/include/asm/string.h |   2 +
 arch/riscv/lib/Makefile         |   1 +
 arch/riscv/lib/memcmp.S         | 124 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 4 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/memcmp.S

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 764ffe8f6479..5c5299678c66 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -18,6 +18,8 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
 #define __HAVE_ARCH_MEMMOVE
 extern asmlinkage void *memmove(void *, const void *, size_t);
 extern asmlinkage void *__memmove(void *, const void *, size_t);
+#define __HAVE_ARCH_MEMCMP
+extern asmlinkage int memcmp(const void *, const void *, size_t);
 
 #if !(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
 #define __HAVE_ARCH_STRCMP
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 6f767b2a349d..b529e1be18b2 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,6 +3,7 @@ lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
+lib-y			+= memcmp.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 lib-y			+= strcmp.o
 lib-y			+= strlen.o
diff --git a/arch/riscv/lib/memcmp.S b/arch/riscv/lib/memcmp.S
new file mode 100644
index 000000000000..f7d0eaa08880
--- /dev/null
+++ b/arch/riscv/lib/memcmp.S
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+
+/* int memcmp(const void *cs, const void *ct, size_t n) */
+SYM_FUNC_START(memcmp)
+
+	__ALTERNATIVE_CFG("nop", "j memcmp_zbb", 0, RISCV_ISA_EXT_ZBB,
+		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
+/*
+ * Parameters
+ *	a0 - Pointer to first memory block (cs), also return value
+ *	a1 - Pointer to second memory block (ct)
+ *	a2 - Number of bytes to compare (n), transformed to end pointer (a0 + n)
+ *
+ * Returns
+ *	a0 - 0 if equal, positive if cs > ct, negative if cs < ct
+ *
+ * Clobbers
+ *	t0, t1
+ */
+	beqz	a2, 2f
+	add	a2, a0, a2
+1:
+	lbu	t0, 0(a0)
+	lbu	t1, 0(a1)
+	bne	t0, t1, 3f
+	addi	a0, a0, 1
+	addi	a1, a1, 1
+	bne	a0, a2, 1b
+2:
+	li	a0, 0
+	ret
+3:
+	sub	a0, t0, t1
+	ret
+
+
+memcmp_zbb:
+.option push
+.option arch,+zbb
+/*
+ * Parameters
+ *	a0 - Pointer to first memory block (cs), also return value
+ *	a1 - Pointer to second memory block (ct)
+ *	a2 - Number of bytes to compare (n), decremented during loop
+ *
+ * Returns
+ *	a0 - 0 if equal, positive if cs > ct, negative if cs < ct
+ *
+ * Clobbers
+ *	t0, t1, t2, t3, t4
+ */
+	add	t3, a0, a2
+	or	t0, a0, a1
+	andi	t0, t0, (SZREG - 1)
+	bnez	t0, 5f
+
+	addi	t4, t3, -SZREG
+	bltu	t4, a0, 7f
+
+1:
+	REG_L	t1, 0(a0)
+	REG_L	t2, 0(a1)
+	bne	t1, t2, 2f
+	addi	a0, a0, SZREG
+	addi	a1, a1, SZREG
+	bleu	a0, t4, 1b
+
+7:
+	beq	a0, t3, 4f
+	REG_L	t1, 0(a0)
+	REG_L	t2, 0(a1)
+
+	sub	t0, t3, a0
+	li	t4, SZREG
+	sub	t0, t4, t0
+	slli	t0, t0, 3
+
+#ifndef CONFIG_CPU_BIG_ENDIAN
+	rev8	t1, t1
+	rev8	t2, t2
+#endif
+	srl	t1, t1, t0
+	srl	t2, t2, t0
+
+	bne	t1, t2, 8f
+	li	a0, 0
+	ret
+5:
+	beq	a0, t3, 4f
+6:
+	lbu	t1, 0(a0)
+	lbu	t2, 0(a1)
+	bne	t1, t2, 3f
+	addi	a0, a0, 1
+	addi	a1, a1, 1
+	bne	a0, t3, 6b
+
+4:	li	a0, 0
+	ret
+2:
+#ifndef CONFIG_CPU_BIG_ENDIAN
+	rev8	t1, t1
+	rev8	t2, t2
+#endif
+8:
+	sltu	a0, t2, t1
+	sltu	t0, t1, t2
+	sub	a0, a0, t0
+	ret
+
+3:
+	sub	a0, t1, t2
+	ret
+
+.option pop
+
+SYM_FUNC_END(memcmp)
+SYM_FUNC_ALIAS(__pi_memcmp, memcmp)
+EXPORT_SYMBOL(memcmp)
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index b0358a78f11a..456929971da7 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
+purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o memcmp.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 purgatory-y += strcmp.o strlen.o strncmp.o strnlen.o strchr.o strrchr.o
 endif
@@ -41,6 +41,9 @@ $(obj)/strchr.o: $(srctree)/arch/riscv/lib/strchr.S FORCE
 $(obj)/strrchr.o: $(srctree)/arch/riscv/lib/strrchr.S FORCE
 	$(call if_changed_rule,as_o_S)
 
+$(obj)/memcmp.o: $(srctree)/arch/riscv/lib/memcmp.S FORCE
+	$(call if_changed_rule,as_o_S)
+
 CFLAGS_sha256.o := -D__DISABLE_EXPORTS -D__NO_FORTIFY
 CFLAGS_string.o := -D__DISABLE_EXPORTS
 CFLAGS_ctype.o := -D__DISABLE_EXPORTS
-- 
2.43.0


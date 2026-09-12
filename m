Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2962361976
	for <llvm@lists.linux.dev>; Sat, 12 Sep 2026 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196374; cv=none; b=ljdi4i5Drss5lfiZwIDUhWfC1ZKMlIcx4LB6MEBtsNITlEG5xMdyslNWPAEcrQBB199vLuKxTxV3ZzciMv5iqlpxZkeyJgB08pL9Id4ea88x4uins/F12mJaAi07wbl8w1buK/6yOVdXChPvzHQlbsUif6MaEsw6DONYVCtTcLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196374; c=relaxed/simple;
	bh=z1KffmHhzElZTDIuvQTwdNMYv2soVYtneJDRupzDxGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luHBIv/S5Q/cVOKY7YZTGpWneFvfctasKmNrPNKPx6LMwbMzSbzrUqdUg+BwV88sInZ0OyD1AX1Zl8OL9FrIJi6dTKBpxl9nPz8Slzgxc/E0OiMavx+CGvNdU/dVABJgKRYntgScrRYQaYBgj14w3BQFaBBoLrW6GHv2JznukHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKb6FzoS; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKb6FzoS"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso223711a12.3
        for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 23:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196372; x=1789801172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3JbySDrX7Qe3HLCVmAQbpZ/Bcq5FNjxxg9MbzFzoSM=;
        b=ZKb6FzoS90qNsJwCj0VV1msrpsi8eVQUepzFK5UBNfj4QJlinLXK+FzedOYZjTRUfx
         zGLIOaK+JLvNzVt1ucElayEQ7HgSv44i26J8wX1ZsWHRw49bg6IVl/KxW1WXmWHL6APJ
         DIFlGdNrjeS9g8OBKAOHkDdrUU+sXOTDj4a9DwNr433FZm2qqEe2A2lrBPkwUmH4KMEN
         2HnKDCTKFPle/ZYiGzbBvTgJQ85+4EO0TlhIpww1zL7kmBBROTlC/uPfESX/MWtMB1t3
         1heZH/BPY9f650PNlRbokfPpikIjX/zRM/ig0EwS95Ix0mESGk9cYEzjU9gsGn+RKYUo
         RS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196372; x=1789801172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3JbySDrX7Qe3HLCVmAQbpZ/Bcq5FNjxxg9MbzFzoSM=;
        b=DwxgJS9YE6YZNWZq5Y805X3//dXrx5mIygT0/W+/cV1jLZ9D0KdIig8G9nFYDtpLl/
         /jMrgI/7PgZE4kIp7FRaazO+aEhGc4Gn+LJ95Mh4mJvOB1up6mP4M1AVem+rMZruqtd0
         lCiN6B2kHecpLBywaUIzgxfHmucC950c4enpSwkjWGJux5nd2/4yBEPIAl7/tUT0RN7P
         1OYHfEIOQnn5UjWZeGX9FynplMDIlUxx32YqvQ+Ax5KyaCOE00wSXXLmWXgepu71ghX0
         TXzFMCIkvubmDPX1r8e7IbKkDUtN6IDOmpNHWY+9Vn59ynBxBRLS0ryUJckRNxT6u62B
         lpxg==
X-Forwarded-Encrypted: i=1; AKwUvByanXkycvfSo5D5Ej7no3O5MNOCDU07aGS9teUBM0GDX1/TnMaUvuyr8qI4ycYWL0R0E9Y9@lists.linux.dev
X-Gm-Message-State: AFuF++mYr8ZF07fSu8aWoC3K0PYoa+w7KGTv0cMVjI77fEd806ZzkOVE
	bTh3B4bkTTlgaCwf6sn4Oq8BOsyJvz1VTs5GTwUtws3Bk3EGbwm1Gh/r
X-Gm-Gg: AYBFou040IYvU4nohhYz2qCtVbJ4PLCrTRioPJH8JCXQqrrT799dGKFL8bZZzWkjKx+
	ulcvw9NEeraWM/M2K0QbQBMIndqEIwiqBEi1x9fd0eQmJkQoZHCfmA+WQg+fxaR9AsWgxT28hvZ
	/jArwRKACIZHWZRLC0+gWzydUwXheIed7E0lz/35pR0xidwRLRLZxG6AxUukDujfZalTcnoicg4
	BIBY0k0h03PveH43ZTA1ZzEb0Ch48PJ9hk4l3tZ/uN3rrNhZgW1Mi3YImb5gnCG2JAHqT+nBlYM
	aDzUdCz5Xtl5uZDNMnitXvqXKA4JvwfoQT5oPX14ZpSrC30KWSUi3BHFzvAUtWlbd1D4CwCn4RD
	BFMvhUsZojV9LavylERZluTK1Kthxm5FJOqZ3zohT47xTbKT9fs01EEIRUtPfDEUIO9tCLAyj7Q
	8hHNWP+eUG1aFg0yPLOCukcnnfiFWQQu8GnkV8S5XI7tggfuYJ/HPJI8vb7RooRHRxkXWkr7sFM
	e8BbpOcAPQgzUzntjORR3tjMYZyj3Gg7NkkKWoLLVvu8g==
X-Received: by 2002:a05:6a20:cc8e:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3db0e40edbamr3056849637.17.1789196372133;
        Fri, 11 Sep 2026 23:59:32 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm10777777c88.8.2026.09.11.23.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:59:31 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	mkchauras@gmail.com,
	ynorov@nvidia.com,
	ecourtney@nvidia.com,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Cc: FUJITA Tomonori <tomo@flapping.org>
Subject: [PATCH v4 1/2] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Sat, 12 Sep 2026 12:29:01 +0530
Message-ID: <20260912065902.24017-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912065902.24017-1-mkchauras@gmail.com>
References: <20260912065902.24017-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust kernel infrastructure generates inline asm for WARN() via
ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
arch-specific asm template string for use in Rust's core::arch macros.

powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
Rust builds to fail on powerpc with
```
error: no rules expected `ARCH_WARN_ASM`
   --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
    |
  1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
    |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
    |
   ::: ../rust/kernel/lib.rs:279:1
    |
279 | macro_rules! concat_literals {
    | ---------------------------- when calling this macro
    |
    = note: while trying to match sequence start

error: no rules expected `ARCH_WARN_REACHABLE`
   --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
    |
  1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
    |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
    |
   ::: ../rust/kernel/lib.rs:279:1
    |
279 | macro_rules! concat_literals {
    | ---------------------------- when calling this macro
    |
    = note: while trying to match sequence start

error: aborting due to 2 previous errors
```

To add ARCH_WARN_ASM, _EMIT_BUG_ENTRY first needs to be refactored.
The old definition was a bare macro with no parameters, relying on
positional asm operand references (%0-%3), hardcoding the backward
reference to local label 1b, and including .org/.previous directives
inline. That made it impossible to compose as a plain string outside of
an asm operand context, and left an invisible contract that callers must
always emit their trap at label 1:.

Refactor _EMIT_BUG_ENTRY to take explicit (label, file, line, flags)
string arguments via string concatenation. This removes the dependency
on asm operand numbering and makes the trap label an explicit argument,
so the caller's intent is visible at the call site and a future caller
using a different label cannot silently produce a wrong bug table entry.

Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
each call site, so BUG_ENTRY() can still pass sizeof(struct bug_entry)
as an asm operand while ARCH_WARN_ASM can supply its own size string
independently.

Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
convention, indicating that no additional reachability annotation is
needed after a WARN on powerpc.

This brings powerpc into line with x86, arm64, s390, and riscv, all of
which already define ARCH_WARN_ASM and ARCH_WARN_REACHABLE.

Reported-by: FUJITA Tomonori <tomo@flapping.org>
Closes: https://lore.kernel.org/all/anG67Q6Y59kDqh-c@desktop
Fixes: 73b741adb264 ("rust: Add PowerPC support")
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/bug.h | 36 +++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..6f0f652d9348 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -32,34 +32,38 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLER__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _EMIT_BUG_ENTRY				\
-	".section __bug_table,\"aw\"\n"		\
-	"2:	.4byte 1b - .\n"		\
-	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
-	".previous\n"
+#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
+	".section __bug_table,\"aw\"\n"			\
+	"2:	.4byte " #label " - .\n"		\
+	"	.4byte " file " - .\n"			\
+	"	.short " line ", " flags "\n"
 #else
-#define _EMIT_BUG_ENTRY				\
-	".section __bug_table,\"aw\"\n"		\
-	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
-	".previous\n"
+#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
+	".section __bug_table,\"aw\"\n"			\
+	"2:	.4byte " #label " - .\n"		\
+	"	.short " flags "\n"
 #endif
 
 #define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+		_EMIT_BUG_ENTRY(1b, "%0", "%1", "%2")	\
+		".org 2b+%3\n"				\
+		".previous\n"				\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+		"1:	twi 31, 0, 0\n"			\
+		_EMIT_BUG_ENTRY(1b, file, line, flags)	\
+		".org 2b+" size "\n"			\
+		".previous\n"
+
+#define ARCH_WARN_REACHABLE
+
 /*
  * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
  * optimisations. However depending on the complexity of the condition
-- 
2.55.0


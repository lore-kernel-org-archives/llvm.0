Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B1F32AABC
	for <llvm@lists.linux.dev>; Sat,  4 Apr 2026 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775305017; cv=none; b=raOkZyLHve9ahuLzSAyoJup1OAdZcBWBF+LbPJ2IK101KS8FOAn8Vca+D641/yg3AcjnGJ66QStKXgE0SAeNN1OFcKTfgv36i6zDQt56432Y3j/2xKdDjFQzNuIJ9KVp62Z87oFEIaUC55ObfymXMuTZJDbmy4Io8vNf6Y0UHUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775305017; c=relaxed/simple;
	bh=3bfhmI0iIl4U5PndejMek+59b5mJkP37SyrMSjgmwFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MKflyqBOD/syOC5bY1yvsvnrCX5aWdb4gUkqMrl5jmSRD4tvNGBGLVWcJs72U66gH+DWfWsvDMWqiHunuyYkIKl6n5A8SLiJ4tXVJB4E5taZbOasVOXvtfDdrfD5tsGj/biiiYV+4yT01U6QE3D9V3HSRGkq0ZgQImRdKzIN2+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChKxw6pM; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChKxw6pM"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-356337f058aso1392498a91.2
        for <llvm@lists.linux.dev>; Sat, 04 Apr 2026 05:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775305016; x=1775909816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKm0GCc95U5yVYTop7PGOFzPahS1W34+eH7uQUagHv4=;
        b=ChKxw6pMj+Utp6etpuk0PM51x7pZPJQW3KCgblnJJL/LdrRdPZfH3OS0dPxQMpa/1o
         D7AnCnhlbE5bCAhtzFtklVMdK9Q6yY2U3VoDJn0LOXuFsFnFqN/+kS54IzvBu2Zkh/Ez
         aCn33NJrUeSK/qwLp8CEs/bdCTgFLryy6YtL7cZQ8+kTgTd5q7bsnCVWw0lxbnkAkfrB
         A9HrhQGCsHgLPgdKAYCkHNMpXOQ4f3VH/QBVjS9u9LvA8rgqCOdIBidhiYwlKQJpyotK
         S6Y23KA3cvvuQhj4qBJ6oqFEDVjyVlrKFtUViOKrKweBvy5S43acCHrcsJpqusC777FI
         K2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775305016; x=1775909816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKm0GCc95U5yVYTop7PGOFzPahS1W34+eH7uQUagHv4=;
        b=CePbBvLJWfRLYCrnneZ2ntu8qrMFpkXLtUObWddwu1uPDjuGtZLdpqfV0fIKuTWbUW
         XFa8n955mELt0n51AFxohKN91vGUy5rPShpXNKLCLOV6rCw5XS7rONjhSO4qtC7PTAc6
         zq9xM5pW3MjRpNfNRMYZgkduii2fHrjVPzIAEEsiu8ZHxzCP5zogyGFfVGP1L3+a0d0F
         cLpVrhwR5dPSsXyF92b4B+aFvVFM78BULRvWwlmlk9XRBi3AxMVAemK7lYBt5+HsIS+R
         UDU6y8aFAooerEqjVN7fBaOl0dcqcmlofvBP+JmpW1jnEI32ajlWd/aaYatd5W0Eu/km
         /b4A==
X-Forwarded-Encrypted: i=1; AJvYcCVs8/L9MsViXrR30qdE8ntCY9kxfb4FwUHo3S8ivPZf9Td0w/8v39eLd+psIwZ1+rDVPRV8@lists.linux.dev
X-Gm-Message-State: AOJu0YzafLi0HbRi73h1Vk5gTxPNVwNZmwvqk6I7HqslXd0KNxT0MGeF
	KtdGMIh3bdOXKRc1aisvR8j8Q1ZekMBtYMVJbYGKk2BAmU5cd0+ayM2g
X-Gm-Gg: AeBDiev2k5O8wsDTNPLRdFt2jefVxqoWAhyb3KGzQq/z7GeHbv/x3rX96cV/t6g7BFL
	cH4YvXswB+D4v+TziO4W4W5c9gbOfnyq5w60vKOLhBiY4Q04xbKS9egvWT573ocXCUIhfMWttO6
	IxRlJVSqvKjDrcTGzRgZBj90rfsmO3ClZzKecUDWTLnGkBJTGQAryrjLu8XwC5PyiEZGJ603lZ1
	GTjFXbydN3bvwtNBVwgaAeOxNuLvPkSTK80dbCMK/CLcJQRa4Jji3JLb+BNlDT/FEjCKEKV2poL
	hy1LpCt9dvcto35ysZuA8ZA3xd6yqafaNIo13QSKSYEtlDGuELPLrJCLGrxo42lmfky8VcxVPcs
	L3P1OdgGVkQJDYwGCXzfJ6S7nob8IMDBu3UJov7pfRdYqNfxlFDeFhgef/dA1FJpiZfuKUpf4rO
	8hsvsnkRxp0mteVWnMRdXNvJTHqxy3mKff8jjedALwBGLz+fLMWoxxtqJPoYd8jpqOeP7BomvPU
	p0=
X-Received: by 2002:a17:90b:2888:b0:35b:9894:f6f9 with SMTP id 98e67ed59e1d1-35de68f7f89mr5794773a91.18.1775305015943;
        Sat, 04 Apr 2026 05:16:55 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de500c42fsm2702745a91.0.2026.04.04.05.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:16:55 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V9 3/4] rust: Add PowerPC support
Date: Sat,  4 Apr 2026 17:46:09 +0530
Message-ID: <20260404121610.1956528-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404121610.1956528-1-mkchauras@gmail.com>
References: <20260404121610.1956528-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Link Mauve <linkmauve@linkmauve.fr>

For now only Big Endian 32-bit PowerPC is supported, as that is the only
hardware I have.  This has been tested on the Nintendo Wii so far, but I
plan on also using it on the GameCube, Wii U and Apple G4.

These changes aren’t the only ones required to get the kernel to compile
and link on PowerPC, libcore will also have to be changed to not use
integer division to format u64, u128 and core::time::Duration, otherwise
__udivdi3() and __umoddi3() will have to be added.  I have tested this
change by replacing the three implementations with unimplemented!() and
it linked just fine.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 2 ++
 rust/Makefile         | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 10240cb80904..1246b3add8ff 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -284,6 +284,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_RUST			if PPC32
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..589613eaa5dc 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,6 +61,8 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
+KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
+
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
diff --git a/rust/Makefile b/rust/Makefile
index 5f726a332d9e..04d8a849c6e4 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -410,13 +410,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	-fdiagnostics-show-context -fdiagnostics-show-context=% \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.53.0


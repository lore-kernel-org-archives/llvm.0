Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B996E39FCD1
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228034; cv=none; b=V1Bn7rnm/UkaG6XO0Af/p0q6xpimFIrR/8tHaeirz5ZRYsmd47ZUvYZLNJZlNoGLRrmRn5KjBvOnCTyGOT6j8zsQLsJgC4x/x0GiI0Khn4cR0sCk0acE04+vbx2Z3KN+Q/K5PFZJSVTYEdeexWEz3qwkXnmSPl7o171JImefVgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228034; c=relaxed/simple;
	bh=gAH5/sosVHs04ukM5lyiU/gDdyJ8q4IPrDsf9t768/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R/2atGGVmDD764Y69Th7aa84S5nNx2x00LE+EWoSlrWZetpYAIxeGfvLR0RVjeoJJkCZ7UqqPGeU3ugw/Vv8mNdjbZTn49pS+7IYtQLu75DA3Q2PFZmfODgL97VdrPS+VZXhGIXUUdO+REO/poj+CTl2OLuZ+prJ9qYMfEHcAFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COG5S4TM; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COG5S4TM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82cd98be655so1356577b3a.0
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228032; x=1775832832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mk/c1eJYvsg8D8dqxhQYhJf46vVg1VoFShzT3q2jtfA=;
        b=COG5S4TMHms24+fmSg6wBmb2tjJdB1YjD7P43O82S77fEZNk+78CGMQfvURlu7SqdT
         6fBaODl5DRWhtpCL39EL1zgyolSMvFtqmkvh2zQZ2KnsuR7eIQmqcsJH1AiLnNtI8aSH
         qlGmbwzOou9xKeljC6i9/x6lrxLjceDW7i+lOYE9xjEBFgrECknzqBkNLwD/FRlofylk
         sXvahDE8JEK2TzdoIfSj+GXQ+6NifhxSJwOZVzMsnXlhx2yls2t5LX5rRbDZNE24Ne74
         5D5Lbcv7OgrOU2mSMm/jhIvzHcPL+u7gIEEz0JrPTPNw//uFXTRszewJeHtmNkDOQhMD
         LVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228032; x=1775832832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mk/c1eJYvsg8D8dqxhQYhJf46vVg1VoFShzT3q2jtfA=;
        b=T0A8YAK0i65ojDp+H/JBlKfZlYPXuNF/n5D9YyUqEzJ0tnOS0l0kVf7YKc56H37XoD
         xFzmuW2p+fq/jOGzJzpQrqmM/8C6lRYn3tDpzh7dfF65qbGi8iwuWRGGEAOyoTCE/sNT
         llk9wHn40kke0nV5RLJ4ioZYP8MJZRvlpOFl3SfvJXlpfsEEUwTIDCqsfxTKOcJryeTl
         GEi1gMmgagLx5OOfQQ088sAk1oBCsOvA8h0gbTL0ZmNeW46muFDb3hdsBKWISJfem63f
         dB7wLWO/QYhfjS6fUWxY/GjA99GCeG7hQdLxHMHjOibd2GjDeCcSMrvAls6avxXFnRVv
         asNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6zQbv4UV6HYfy0Za6MuTyB0cmnmOPaw4NsnIryASwbCQ4sRlnR9SmnxAlrwygDgCKjFDK@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9xAJQj8fQUPqcRiYWeuV85TjjI6VH6OYobT97NPKfcw2N4R+1
	OVj2OT6F1RRHcmy9ewwiiiJNceMmyySfH7VLwMWaD9bKfZ52iMo8MjWq
X-Gm-Gg: AeBDieunlEHnNBQhQK6KYFxKSS+wfYVEdzTr8jPwvuTr/4LucdLlHryfkYtcY/iOVWT
	hz77IQ3ZEDNQmF/2h6zkwLdQmBTfQ7X1Jdu/qMwP+QAu7tdSotrrK6o5hn3Gx7fjYLRVABNijTv
	5q4E32xOxnKMhY9ndcj1CSAgiMOq91v9APXzrrUt0trMCFTAHVhcW7qaqDTG6npvmSDPDvYr/ma
	+NjpqoJ/W1g9CK034yrB7MAB3CqUCOsbCfCB497ul3JdcIDSe1oNWZWuLVw7O3Y5cXwEsRKekA/
	+qmkqbxbwUN4/QNrADzvKldapM1jSvff462veUzK9YzctLkNOQu3ZxJdnlx3q8TGSJhHvBS7l4g
	ZXrHBWaRB6XnVi2lLVDJhXrzHWqnBsyQa5ejOMQhZB6acBxRaDxSLHWNmYB78BAoqg1EeLt6cyR
	qCKd83IjnkRk/l5Ope5BhvpwoLKRSV1tubgaaZ1lItIWaochJ4y3Z176Aywz/t3lPnLDdOtefHF
	js=
X-Received: by 2002:a05:6a00:f93:b0:824:a635:4181 with SMTP id d2e1a72fcca58-82d0da84bafmr3123650b3a.15.1775228031997;
        Fri, 03 Apr 2026 07:53:51 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm6301682b3a.61.2026.04.03.07.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:53:51 -0700 (PDT)
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
Subject: [PATCH V8 3/4] rust: Add PowerPC support
Date: Fri,  3 Apr 2026 20:23:07 +0530
Message-ID: <20260403145308.1042622-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403145308.1042622-1-mkchauras@gmail.com>
References: <20260403145308.1042622-1-mkchauras@gmail.com>
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
index 762bddc868e4..d05e76df15a8 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -413,13 +413,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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


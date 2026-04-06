Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C75397E9F
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 20:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775505753; cv=none; b=uA/vuJ0nrZE6N1wA+LgFjV0aSHnuEElZZkgRQuR9TI7Hl6ybvHXvO3w/sojNMfWDJPLWSUnX0fthxYjjrMhB6RSEFB/Gpn80yH3wl5DDNrJPRfOGthrzM3MqqmevYnnUStmPue4wLnTE8Uv8qq2sFY+HbJ5wPKYNlr0tNKWSZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775505753; c=relaxed/simple;
	bh=xtajcHPnDfwbwjYchYSDD1WR29xrrCxSIc9DSK0ZzxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=In4maXmCZGfxjQP5Fu28Tiqqs3qCjkX1qtqsoRbTNFdFdf+UAXvk7wmNncqxjE4e0hLkgVlhaNITEorLrBI04zXHe0F12ypALKKza6Y+tsVMYnJwKkjD+n69c5lcJgEuCL8PBqNDpKhxGRqnVJoSSwc6eelBeKK+sJNM8z2zU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvHqBwYx; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvHqBwYx"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c736261ee8dso1323366a12.1
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 13:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775505751; x=1776110551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epCQc4tGVXz1xefMqDUFYXuettxlTI+7sX4tf8abt7g=;
        b=dvHqBwYx8sgYfYqUE4s1NYDScF7oXNz9ugi3rfsQ+TXc/S9zEbs47xQ+pYRuuOR36m
         LPsJsVWjpDysoheapiDSP14bamxrJrrrnVeX8AoBYPn55Meo7kkq0jc8g1s//Qsts5wP
         Jstc0I5OAlZP4kOz0koCzFDvwrcdzF/ZYkVZFhJRupR0ILcm0xDsObN++hxOwS66lKKB
         PAiJ9fAuqcIwaTt6VQe3iJUSD34u7DDjAKcmsfJerCEosCnxNdJ6pS+zi4IHc41qtlrw
         6Sp/SSvrlCtQLlyTVnzDULEVCrWeXnM6farNWjQaQOJJTsQPU8n6Pr2ENDgu2/GDM/hJ
         5WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775505751; x=1776110551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=epCQc4tGVXz1xefMqDUFYXuettxlTI+7sX4tf8abt7g=;
        b=e50/shJJgALQ5wHgjtczTMWVJtSS9Ov/f+sMSjq6wmwCsjOlrGcNT99f5LKWtJO/QN
         jEvaSuitMf/z16olS2Vff+diSQthM+E5VTVBTQqu3da9xJWvnLVRYn4EFX9BqBh8jIW6
         vdYUsP4WNu7dU3g8qnzh6tUGKZQym06NEV5HhE/+q6yc/TBeCEd1ttzC/7KOGRXOy7em
         iatLoAkWIYA8OBYNeUchbsk0mftLVk2DlAIJIlYheYLEgmmoNEgUYwQE27EK6k1frPih
         xinisPB84+sKQlLie2Q7Yho5dRUlkBU5CHpWQIyAgmtn31aVfDbvDFVE+XeyQ1HM8OSC
         ihEA==
X-Forwarded-Encrypted: i=1; AJvYcCVHSACXQR6pnp4hnftFqO9vZyN9rtxMf7ROA3E/5xBFBNIhm+akcndQXNNpnQXpMAycWwto@lists.linux.dev
X-Gm-Message-State: AOJu0Ywunr9n9VJHgGefAeEl9Ge31G2RRFGjJJyiw4Xhygjq80/+RI7s
	a+yySixZvatmj7amNUhV/lhc2jsi1u9vFkZ2fs+tZHG65ZyuCbxwmbrB
X-Gm-Gg: AeBDievf7neMEtgPem09mxIsCJCsSC6jDpvni630eMvvhAh1IX3jOIvICl1WkEBcluq
	9hzJmsknVk9YpbZzpb6+kvsqVIZNaLQfN+WOaMncRN6fkXwyt8Zun6rXq++pezQcgfrBR3Be3oR
	ngWckGoVmrlEDJXvJN08gCpovg2tAiohuOaNgqOUhOAdn2vtPT51JCOiJUswuPoHBHMXgVJB6av
	EEP+B0hG3Qk+iY1n/nFwrhPlbL7NH023xcVljL35DOoYS1tHWD/QmFRzfBNh7mBjkN5NtA7mQv+
	05uozWvaMq/i5iqjgKC2pIq1eizK1mg1M2uFczdnl93QkTvp3q/L6w3fcbtan1dZ1+TwcBNBcdt
	Q9pvB1K1l7kIgpsRMRgAUGf/obJaevP7hAKCJR90UrpCRf2wTQUCaomrp+ErtAF99t9OOlhcbHC
	7wbDlrcpdDaCnvCt5BI9PLLpgy1sysccPCLQ8ivAuHbrqc6EfctXAp85lQ3f6fsqb/lu5z8dNe9
	/Q=
X-Received: by 2002:a17:903:1968:b0:2b2:4fc1:f657 with SMTP id d9443c01a7336-2b2817d8be9mr145070895ad.6.1775505751253;
        Mon, 06 Apr 2026 13:02:31 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af26sm151098205ad.49.2026.04.06.13.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:02:30 -0700 (PDT)
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
Subject: [PATCH V10 3/4] rust: Add PowerPC support
Date: Tue,  7 Apr 2026 01:31:48 +0530
Message-ID: <20260406200149.3727922-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406200149.3727922-1-mkchauras@gmail.com>
References: <20260406200149.3727922-1-mkchauras@gmail.com>
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
index d8f34c4858b8..e53cb16c06c1 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -405,13 +405,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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


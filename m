Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0753043B2
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773439; cv=none; b=sWwOOYwxBeYbUgnYchjNXgHiq2PHX/sAXu/2snesphIZxxZh1lGKuRYcT2rsJOUhICIZpxubkhH6BWJSmsJRmOUsy5ra5EdtcUcsifJS4YInseRFdUcKJKuSOu6ZN/ORMLdHDCsmssu7bupgh7SZwW4MzED3UBG0RGTU0I/1SXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773439; c=relaxed/simple;
	bh=hGgphpE1DYmiUm/7ovOlTVs3V0qJFy1Wl3p3E1Kd9FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N532gkcgJAmnf3hCCnRIIwjDph8YMR9rBUz4VvluJjm1oDeRFn9b1OIrxEuegB5COUiyFWrHzhLbo8CM+EktQy7U1pM4MNqRGKCu2z6luVevsmsyk/sX5sHGW1YPdGOtFdTlaT5PaTOE11pP0RRG2ruIzkmQJB7SowZLL7TvFLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+o5de3x; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+o5de3x"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c79662668bbso1510847a12.1
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 05:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773437; x=1777378237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BeysMzI6zwGD6joEXhhGssagLKkCvhT6RVRv5CKQ4U=;
        b=H+o5de3x7SaN1k1Ol/RBx7WTHHABqa1f5XsTVyPz/zlWpouQYOI5Bff1gGpw49MSav
         Xrv6CXBaLMZIIO3n03B1GBHqPoFMbVbnFX83mz42o86RxUi3OGxngtxvH7RSrzoc5AyU
         mYE8Xuuu/Sa+NHy+8cu4seSLZB6gFVnKXCVMIyLvGt568iDJNkHeC8adFjX3Sh3qDb6N
         75j1bdJsNrW2QX2uBlBdmRKlkruXzT83HypWF37IpNFz4KnOo64cshhDWyGTqgL1vW3I
         AlgU4VQOiM0tpMO+rJeLviW3QzdzKkt07aKooqUI0pQ3zcDIHH+t/rCs+a68C1lidg9o
         +PiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773437; x=1777378237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3BeysMzI6zwGD6joEXhhGssagLKkCvhT6RVRv5CKQ4U=;
        b=V7tW3NGhF6u7eGBtJqPgHp89lbAXXmnMFXkrOIGtJGbnAxlV6+bbfdnvsx3kc3FgaO
         61gV1xYNxhw7HHJjBjSDw9nfT3h2GtUfmY64r8xNkUhnQoOc6216cCQJXSUXruMG1CXu
         iNdheu+oZdzGkYEh4K/w8Kgx0B0EgzejwckiNBbYbd5drbdAjJh4IZwqWw9pf7hiKeT3
         MgQNIYtyIaHSgTN9Zp9rZG7zsO29A3YnIDgm0r+gk9WRYHXszGgOUYxPkjFLv1vHJ4zy
         sia2w+hcsF1KOW3KzwNyGIQZC/MqALCCsUQIi6awbGBk5xtzT3sTUD7ZXZqyrom4WQ5K
         MoOg==
X-Forwarded-Encrypted: i=1; AFNElJ9g99f+WZtXBYMZafnzf7N2iihD/AR7RAWbSn5n/dHjaKF6QBixiEhtz3N2Nzmdkwsde1sn@lists.linux.dev
X-Gm-Message-State: AOJu0YyyNoP3fOBlzMzJ7i3jF/x65Fwy2AqTFRUMU1XmRntd9FctuE6/
	TWAXNZEcvQz+uZuvKTHKjAqWRmkncv2/U18h7GprbNqG7pcp/vZRjpQI
X-Gm-Gg: AeBDieszNcGnYi8+AnHkIO69cfhjMWb+zECjjQd2oKsnMFhfsjSVl3dwSB7WnqGtNsS
	HoTm0N5epPQfwQxDQjR90Tjh4RsfKm84ldrAT11G0WHZVi25TZZ/0kSpk2vk9bCCfj8QG93F56L
	fCn38U93Y2Cz1hdUVW3Iiif/c3S/mkb6ctJpulkFp3LADhRqB5J+h7BF3Izw2hWwPXwf7YHcQzS
	gx4abtXPnsH0m9ViPCY99DRNKRulEzuk8HpkP8+X5Cpz8zGvqu8avuo8bDY+OLH/ew4eUiR++ZL
	whfxQU+83qYZjEJOW/oZqevmAdPPznnv0pIIBB/tE9Tw+K5L1iMLa47SoshdTJerWVI4DqIi2o0
	3YIGNBGXmWSQa8DHF5bSZoCL6XBDduFeA9wr5jwGRTX341wPp5oOS9p58CjbwBTHCV5KD6H6vih
	h0BUvkKZXrxJITjQtaE2QBM/9RmrVIf7pP32QqCm4bxgubqLnu5BGwwPvyGgdVHQnEiJX8l0Qgf
	/o+BUhTX+aTWe8=
X-Received: by 2002:a05:6a20:e211:b0:39c:783:e42b with SMTP id adf61e73a8af0-3a08d6eee6fmr19057917637.21.1776773436940;
        Tue, 21 Apr 2026 05:10:36 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701d9bfsm10045274a12.16.2026.04.21.05.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:10:36 -0700 (PDT)
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
Subject: [PATCH V12 3/4] rust: Add PowerPC support
Date: Tue, 21 Apr 2026 17:39:57 +0530
Message-ID: <20260421120958.190430-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421120958.190430-1-mkchauras@gmail.com>
References: <20260421120958.190430-1-mkchauras@gmail.com>
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
index e93df95b79e7..4ac897b650d4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,6 +285,7 @@ config PPC
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
index 2a5428a5503d..c90811a2f564 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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


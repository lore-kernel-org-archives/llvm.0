Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8882DF153
	for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439438; cv=none; b=oETg7oFLs9BHw/7Qtf+su83XRJVkxBzdqfrGcC7yqzWHLMNxcxXm8EJ3ainD7rS2ps18ZFGvwOgJsHDrcdPfmP1hDhYn3ZCNysvxITabON2gBkqVy7CtIms1193ORJDxdI8WBXgJ+36LvYz5BgylEDwOWt96zoPxkAhm9LPoMGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439438; c=relaxed/simple;
	bh=pYf+H/saGpsBMW8EFfQgaezWo01ragM5sMbBA4ndTm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OSAzEw21FXfV68611Pm/QVz1uX1+QYrrtEOt4M9hU3IewFjjvOjE3Xptrfrp4+2cJOTQtXzB72irS4+fwImIodosyX3ea2Yid0dotnIGUW+Ew06Jd5VxxcRC4+QnjYefIX7VX3sUS4iPXHHoMZOSi7cJGiFMo7JsKU15XsZH6oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkWjJkW1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkWjJkW1"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82cd5c07f93so359417b3a.1
        for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776439435; x=1777044235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ww02/jkdVLSyp8HOStmgEIcppt5LBeLhIRfQtuTFtSY=;
        b=GkWjJkW1QArPeV2RpDmi1gmsTnug0Mo/Zmp+w5bcMnFXGlzAfObw8+2t49DLi6V/Al
         uJ6MVtJpSMKClH75Srwh9ncaFc34//STaBVoUriG9AwWH+L4Xf204OjkIP9Bgf51Psje
         BJns6UDzwSJeN8t/LgeuWrDvP/cvXGpPg6aHd7wvUnw65gD3jjF9o3hHMcvHgRONL7g1
         s7E8sKivmwFw/049p6/TT8jWj+mYMQbO8LNm4S6o+aQKW9gioZVJlS0miTfdQV2Y4xS4
         Khzbf2QkmRTbS+VZkVoI08CTRWLpvXSDSYFGHpt1sf5tXUsiDdPaJbenXsFzopR0woOv
         3pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439435; x=1777044235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ww02/jkdVLSyp8HOStmgEIcppt5LBeLhIRfQtuTFtSY=;
        b=HN0YxE7oVa/58Jaz/EYw4AGWCpsSDlhaJJM5uBwDSM0o2qOZ08KtL3W4yZ8htS5wXl
         j+45EobEy8V10mwxLNoEC9fDf2QBIGshvcDkEUiarDBGGpGWfUzraZJTEepVJ1snbqx1
         KZQ5GKlv71OCgaUdH3DzkARTANY5lgYTMfvKcNAfIX7CYPPm+pjeyPJAWor8R9O+5+vi
         PKUbLTQLiRK5LjP0oIcXk0SExU/MnTcWFXEeRsYFEZiLWHkzYgL9yBt7FXfSX/SFyMkY
         5ytYqjAtk6qJppVHtdnbHTWaU/F6T641N3h2VVNCiB47UBFiK4f96gvB7Zh+ddQ6NDFQ
         /09w==
X-Forwarded-Encrypted: i=1; AFNElJ/Bow1QjuUai856p+5+RYpiVwh3kUrZFDkz1GUk7c0Tv8JCTZV6jP7ekJ4mca4XKmJ4YPBM@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2bcqiyRvk0BLgiLxk5gz7u1O1ommxieQjBXPn/WmqtV1hqUyx
	fln6ATLc02D+2Cl1jrM1DhwAIFMVYs54Po5NKyaV0U8+8DBHr+5zXPhl
X-Gm-Gg: AeBDiesilRmSnvKcFPHGz/0Qn2pld4RNYmfLSsIXrWW2Yh5gWQXcH3wUMOOvP4t+aAB
	8TUqsJZ96IY+bOgvfNDoG2c8bGAa5V8IIn28YB9prczotd9Xa3I88+XCENKauKaaXgGjvlLwd4T
	zU/vhcFY7THez62HVZ8thb0fLlNZLN/T9A8L7fULU/xKiqO+VdojByWbWb2GWa4F4EMeJPf9NZu
	VUX/MJzdEePb2N6nFvaphU6S/CQF5ncO8v/J0EHzqdB0lAsoGpUyk7pCIOnyAjRsI3cEg1FkDYs
	9rABKQHvi9Z66YMcSO7C66myepzcQdSq+ZVNjd6C2Yy48m1bNW0twmwrLO3x6Rh8oWVpA5qkmxN
	GXqNOOr5TkRj2AXNhpx8tljwATRHBuskyyQvjWFbOY93MHTvk9Hu+vYTdnFOFVPBRSXNM9sHF2A
	mFKqDt2v6lDPZI1W//NDFbpXwWYQfax9IEaa4g8L3pkh3M+QD5AnA8ehZBRFIw7wEsV8KCHtZc1
	5oc0dBgeESH8LY=
X-Received: by 2002:a05:6a00:a883:b0:82c:e09b:3f76 with SMTP id d2e1a72fcca58-82f8c9b6728mr3532095b3a.41.1776439435073;
        Fri, 17 Apr 2026 08:23:55 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3829sm2384373b3a.31.2026.04.17.08.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:23:54 -0700 (PDT)
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
Subject: [PATCH V11 3/4] rust: Add PowerPC support
Date: Fri, 17 Apr 2026 20:52:52 +0530
Message-ID: <20260417152253.2312961-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417152253.2312961-1-mkchauras@gmail.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
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
index e234b8a39358..af0c8ab2e5b6 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -406,13 +406,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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


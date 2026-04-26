Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C95C22AE65
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193938; cv=none; b=iQS+Hz9GWF+D+qNpb11XX2VnfNSRCYWT3i2decuPnTbMwBIzDzfAFIhAe9O/hzbMc8m0Wh+5RBqPQm7x9wBsY3UCSFyQNZfjMX26kdbntj56+phaN92bxlOMnASaChHMz+FGJqVJmoDDByWfFrTIgUM6bJ22vv/Cc48aN1B92rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193938; c=relaxed/simple;
	bh=WhlwkXNuyZCQ6C5N8eUhev/OuBv5UthRFAKgfmLfnq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ppwYHyCZ1k0Koi7ukUNZPJRIXeqLCHtbHaxVCNJLyVe8wNtfL7C58exgpB6VX2QutWZwtDfelu7pQTubJBFX1lERpTULIJKSSkR7sADnaBObR6G5BLHQGBGpTc0kdSDlt3LQPEfp/AKIP2LcYH3CtI73QgsPkTpmiva1DTtrOdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NG7Yexli; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NG7Yexli"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so6231354a91.0
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 01:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193937; x=1777798737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMHiysWjfyDRuRD5lpg8f9BCP2bUjUGrNK0xtp2jPK8=;
        b=NG7Yexli6g3a+eHaJIQyJNQ2NPqfreUVdEpFn+1ukxiKPxJ4/pOC815u/GCzWBBCPd
         kDt5kidrBvZxJBkrNKYv4S11uxrvQfa0EhYoyaf+XK4X6CVRXH2E4ZjnMH/ZD93gMhmn
         R7GRciTYlm4eAUbenxVd7hM4ywymCk5wNTdmLwE6H1mAnLjKjpUbLws/4xyukfxRBsVB
         bbkTC59hcYsxVfzulgXbGBTuUMxXetN65vN+zd39MKTBQ9+Vhmg06sqLLeKLKS65iAIp
         Ybe+a8rjlyMVYUZLi3WNa2eskWG45HaOxF62wDsjJ3ZyVlvRe4A/n2UrTf0t6ljkPwWA
         f7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193937; x=1777798737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AMHiysWjfyDRuRD5lpg8f9BCP2bUjUGrNK0xtp2jPK8=;
        b=TlqdLQPDNF8gF44z2dcindjBnKk5pAHnWtd/R1vXqu30yZseJF6ePlnIgdRCSbnZMf
         5cWgxaAtePuc8j4KvUEJZomnFIN2ip9RA8G2iUrq1WeSnxauhM3edpKo72iE8cnhmhOd
         NIR+TskNkUAGTt0b8GW6DqGO1Mx07AKDwyeLZLVGL0PJCCKuZ2qx40wP5d4eRtR3h8nJ
         Vmy9sLzJDy+vp8y3Xzf5jlGKiPR7GIvhMMNQj+ZtKE4/9YlH0AjRnyDSHd6t9A50QWdy
         teZbUvZHIuDHE+dyUg3XmaFQphAnsl4IiSp3qJgB19lINwFXmfwhuF5NJGTGSh7jYq/z
         Vb3A==
X-Forwarded-Encrypted: i=1; AFNElJ9WPvHKR9SCHLAQO6pIDvKZaq7+CkEvpos9iPQ/EyOpUJQQ53Mski1Y1BumMrXvkdanGH/U@lists.linux.dev
X-Gm-Message-State: AOJu0YxcTBL7tRtUjgsauuWCMyZpkHI5UKhyfp4JKYc6RTrDuWJADS3/
	cvilsgWg9GO8SJVaWDBqBpCwvnbCgWh5mlfnWfeipQKjANZKGM7/FtZD
X-Gm-Gg: AeBDieuXKByoc3381GzRFzJhIkimdeDlCG4Ly3iRvXa6PPYWs3JMF10MTu5vnN47KeD
	WUSFvOP7MymeF+0eACrg3raat+5QnfiREydlmyhC/Dn4s8a45ARuO/05xNAyaG/S6k/AJFiAg2o
	IIHB46k6iUchmj0G22kOex8MjhlXQAUovAcFDYq7ghmBk9Kt5YMaPtTmnlACUW/gSFJ2h/6kX/J
	zW7DFRLQgU0oaKs1cZm4OJaqQNvcVcX1GLJdgYzJy1fxc3Z2znVvINlGRjIyi5rUVYHViITL5xQ
	L4WfVwwze8NFhYHfLrn1lBeFW+CnHymHv45B5Fg+6dMrL3/NWnI36QQuXNf7I2BpbU0u7dG5X2b
	ssJahfg02Cut8KDwm5Ua/oLkYH4D161z9jpbHQMApCzkFDUBs/+mffHh6jL/deFwBzqQYGxZgmn
	V0wJbzGVEfFtbcnS81ABWI9U21Bvebo0xFYsQRX7cvV0MCCeIjOg4cqhbHsWNw5D7HngtwZTbgG
	kAUOB/Xw8gzY7I=
X-Received: by 2002:a17:90b:1809:b0:359:15c8:e8e1 with SMTP id 98e67ed59e1d1-361404a8241mr39217733a91.25.1777193936535;
        Sun, 26 Apr 2026 01:58:56 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:58:56 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V14 6/7] rust: Add PowerPC support
Date: Sun, 26 Apr 2026 14:27:24 +0530
Message-ID: <20260426085725.2090827-7-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426085725.2090827-1-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
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
Acked-by: Gary Guo <gary@garyguo.net>
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
index 9aa18cff2fae..03926a451bac 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -399,13 +399,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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


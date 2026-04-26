Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE36158DCF
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 11:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201272; cv=none; b=bIIPh9KYSE8YNU0jFkHWTgPiGPOxGUtsNRhzCjajdMADXhxUqmWbVf09Z5YLeOwduDVF9BrI5e7fcPjOjmJZ/qBxEmKluRjbu0g98n/4WD2y06Sa1OKDIsaNJu58QuDLJVyIIc17ZWvke2Fzl+3PlHliHHyirp92qWj+UK/ca3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201272; c=relaxed/simple;
	bh=Y35TwnGeAvMsWCZrToGDNiwgBNmhmSkpO5BQeJbV4PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rnbqhrxDLlz5oIkyU1P7sQMlTLtw9QpmcIwiCHd7LAHuvzxyIiOUG2iUkbCjctDoR0NibdeZxAiqGZcYk2DzbsxfUxKpHWEEgm1nuQZiGCv+rVO9f0M8U+57bj1fxZsLyknQLSxW2E9kNw1uxT3HM84yek28HgeDWwvPjzp4+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4LHYfXj; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4LHYfXj"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aaed195901so39906075ad.0
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 04:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201269; x=1777806069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zD1QHbTvqlDponwM5P/F4+a1PSB3+J8FyHG1ndeTEn0=;
        b=N4LHYfXjdrq0fBDVmJVR9cNydnXEDoeGfcOxiHbEg6pLnjotnQfNq07qlOrDy6859T
         lRqzSeEo6tw8+Ht5oQKAXoIWv4v9DgNeUjFcOLzDnBfVA7zMpzaVUZw2i0xFarlnQOIo
         pXSn+l4pL9TQrRW4Lz8tl2euVdeBBLDb1ZErwffIoMizkzwp8wgNspe9/+4GPWv+FSNo
         nZLNMGvzS+c9tXNIa5Xv/wDLMzLee3zpm3cajEw/mcm0KcA077CQwQi/BmYjQUaL79oO
         MOn9Fghpbi9u5xBePXxdiiUa0BQ3l7pj/Oa2tgtfZy8KkPQofPSIw5STXTrfIrvOHKo9
         hkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201269; x=1777806069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zD1QHbTvqlDponwM5P/F4+a1PSB3+J8FyHG1ndeTEn0=;
        b=WA+m5H/aD7iOfNC1s8Zyfm7wh47XZXe+yEzhccnQgJZ63JtfWkgI8QIICOzc5BSeyp
         vLF5fnXAOEkJNHlt2QV/IGIfgbOTjusmCqX1tPTe7On89VQCrCDwdA+JZW3ULiMYRUf0
         ZmA1ZbUcHh1oT57YYLMa1k7MjrOlMIihYqFcwZn77Pgl7JRjxb19Z4EiUNSGeYXPz3gV
         U+SUIZoXE8gn+OC3CTNeTLeBb0YKtkkUr+bkxOSP7SjkjvI6lUMcfZqM16zfz7eeHxA4
         OGjMHTvSfnYzBl/ay7SnJJHW/NTGMAMYlNjGv0OBsZBY0PsQlnelvuCy5tisSnrosAxd
         Ayag==
X-Forwarded-Encrypted: i=1; AFNElJ9JQshI2HJly/At2alskKdncxz05eIF3PITQYTdOBBf6t72Rv/hQ+vtpTYPLqc2SpUEpVzW@lists.linux.dev
X-Gm-Message-State: AOJu0YyWORq41pcUanpz0dgqCTTH7CDOY9Uy7VI9Xm2NkoP0zk1CAJdv
	zU6/dAAO5IfkbjXd+RHiYMGUb9r2oe32Uk6VW28cho3N3Qn/zKSRwD2q
X-Gm-Gg: AeBDievicym9v8aeTLCQ7Nva+qg79z7uKCNFDNzUMic3uz01O/5yr0SKcw9QYpnFBrJ
	3NqwgCpG/FZuet9HNvNT/OTVFnGdR+iOIauPQocNmQHhWj347ks8WqvLuASd2Ycc4FWksIro9Tl
	2VxYVyjKTERoXv50hkeLr/KFKOu6AzTPMnVkaM1uPHf0fEgnVMCuK0yxh6cGAe+1lC+pikewsE5
	P18FZDAgCZUmrcEcW7bGhTgOrUfWTAbDQRcaU4pQCPXdiwyUuclr4Sr46Kb4ySJofVOGnE/IstM
	Cv9DiZIIrKElt6Uo20Bc4t+woYKY0JQV3H3G30yt8/Kmo4MHPqCgDDOsgnAg9hAZOfd1a+qbexW
	qjQwv/KhQXYEy4ZSaimBXSfeT/Cvak1GVLJ67gEYJO8yF/tXu39ZiR023b+7+EK02ZugBNtfb2I
	S5UjrsfqF2l9T2K7LlMpL/dhMu+Dl3q6GMIjm/x3euOnmxOTQymQ0WIMXh687HDBbYVFa96tIh7
	ZRQ1i9JkPoBZ/4=
X-Received: by 2002:a17:903:2287:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2b5f9fdbb6cmr369613895ad.35.1777201269202;
        Sun, 26 Apr 2026 04:01:09 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.04.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:01:08 -0700 (PDT)
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
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V15 6/7] rust: Add PowerPC support
Date: Sun, 26 Apr 2026 16:29:31 +0530
Message-ID: <20260426105932.2270364-7-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426105932.2270364-1-mkchauras@gmail.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
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
index d70fb186cae9..54096ce8a675 100644
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


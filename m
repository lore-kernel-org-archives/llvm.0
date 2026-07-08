Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F2C402B93
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499189; cv=none; b=eeFUks3Zaja5J38kPt9ONylQObyAcYQqfMfJlI+KnWG9qtMcHuSBrMclmvGbAwdFAXOKjToSB13Kgodp3jP/fJP04zvcLyB81OzbR/T1jdN+/2ms03/+fD3Ttd4CHzF+dGWL+FeaGSxlk+SZiqMMV2ljozLG/uc54y43Z4SHswo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499189; c=relaxed/simple;
	bh=jmwwd5SU9J2MW/WA3wWykcEx8852U0Sgm2eiMk2tzG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CI1BHOp+mdskvOrR3D1LqgfudHEB80ko0Y6AHvUC2AES5GZ7jssL3mbzWoTTdf+vcqfBvSHjNGahuEoa3LW30Kv1x7b/B1U52mOIg3t9yJ283dWMkXaUQjoGk/0VEvg9hRZA/k9ixxYU4ECByaJVOpBjvCHxGXmVNbooBXFuRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPGkehxG; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPGkehxG"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8481fb4324aso316031b3a.2
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 01:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499186; x=1784103986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0yp5asYUErIc5N6oB8ZeLiWd9F6L/qUlus8Ea2ATCY=;
        b=NPGkehxGYszoMlLVoonsSJxYKmEuBX0Ng4BFSd+FPmZnceDlZLhnVgrC4cgv3sD1KO
         Sl8JW7oOHhm/m5kMaQXlHngUY1NIFeiWER1Vo1fbeun6Wdvhl9/0nq/5mCBdwtQIX5tY
         qt1krQXwbLUKI4gvkRRz7AGz9tuUgQueSiH3eTC0omQblvPuHN4C02k96+4MpK9S5x8w
         sph/xPmMQmJMGP4QzJEyuErkOWZ9ZTRwhQ5IGdsq2OUa9F0yYr0El0bVk100BzR1zEMX
         F9lmTfEK5ab4krK7q3WT7a87eRNdA15FWiDj4OOxBvaGEOtPvGa9zj8g5vqhlEBx+tsd
         AdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499186; x=1784103986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R0yp5asYUErIc5N6oB8ZeLiWd9F6L/qUlus8Ea2ATCY=;
        b=FC8lNjsVYj3QCXNEya8irQPKyd6glt58Q9rLvIFFduIdYq2RKzBK5ON73rxlWoaFTA
         wMCQPEscM9c6qQJbtyiUja5tbQ+c6QzWSDSlnhhVZ5fQYHl11d3IDMQy7Wrm9Ab6yDcT
         yU59bF+ogdn5KAd9/9YVYTZCOC9hHnLFWApG0QF0069ehs6irjrthHQj0WpuCXq2/b+Y
         VU6g99r8qK6PTRQu3FcOl+5tteM5knPvUBjI0NiqgiIfims9yKrb5vhg8in8ad/N+6hC
         yHb5PU2GC6X5Iwg/rzjoy9t8Vkm2qzvEjLAHteNPUOBQh1pqz9dI4dWiCqBOjMW+ksgo
         s4uA==
X-Forwarded-Encrypted: i=1; AHgh+RpKmm6Rtb7X4Hep/hOLMIMpFLRa0FyC+f6iOytQkDnlBrep4mly/UvCToZgm5XSMrcHsCKE@lists.linux.dev
X-Gm-Message-State: AOJu0YzauwM9CGwQdqj9ANm8DN639RePomV31nvLekC8rDo4QMCxPk9V
	muqRamf0m0jjeW1xyEXwiYfnTxe85PLrnCOg1HwW3qRGklKD1N0BC2GX
X-Gm-Gg: AfdE7cmLf894Is+wLkdBatEOiS4j5OL6URLq+brekPbr7JQE79zkkJp3PGNwpbHfe5r
	N4jsyg6fhFU1fhO2CTPqCewbMqpYC51zhmgtmhq5XaSKM8shke+SyMQbQndeOksDXYgOlQpoDGa
	LCjJpPe6vQdQ8NfKUpCpASCwWcm+Vld2rbJ98joLX9Y2LGeeO+SVb5Q0/YQ+VeFfYBGEbuQPOwM
	cf0sAaQOzwxJFmLjjJzs8MiCPQM9mpulvHjZKwpAKW+bS2uHk53s4CJdvwuiCjb6oZCpsIWxHT+
	hMxkfMcUxS9NhLw0/BQPKFA3fD4x8mPilg56KQ2OcfH2ZfsbZ2K2p2vipyL1ACEObAvWQfDsOla
	pLBFe465lRBlOog75C89aIMTmkC9tZ2E+uOw8y5rnT5rNKMFRMZJcHUIsKC0u4Bz/XAtuRtvpPd
	vPMo2AExapawqUvdXDshnTUXB6VezRIdfGva0kg4HG0I13dqKHoOjMr/yG7r7WzqPRCUN5X7KZm
	o70
X-Received: by 2002:a05:6a20:d499:b0:3c0:9c19:659b with SMTP id adf61e73a8af0-3c0bd1cbb60mr1995199637.67.1783499186505;
        Wed, 08 Jul 2026 01:26:26 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:26:26 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V17 6/7] rust: Add PowerPC support
Date: Wed,  8 Jul 2026 13:54:53 +0530
Message-ID: <20260708082454.1254320-7-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
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
Link: https://github.com/rust-lang/compiler-team/issues/986
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 2 ++
 rust/Makefile         | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f7ce5fff81f0..badd7c99b87f 100644
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
index 7aa8fcad4c43..61e7dc496fe4 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -448,7 +448,8 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	-fdiagnostics-show-context -fdiagnostics-show-context=% \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
@@ -458,6 +459,7 @@ BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
 BINDGEN_TARGET_s390	:= s390x-linux-gnu
 # This is only for i386 UM builds, which need the 32-bit target not -m32
 BINDGEN_TARGET_i386	:= i386-linux-gnu
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.55.0


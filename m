Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DED3451B5
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009745; cv=none; b=F+dV2DpEAeo588ywbg9mfjszu6m0MGJnlZGi4vBm14qg59ONrYQCZI1wtNhrGKyqF75CVo1oareAK2j19tNFYPRPpjSIwQg8RkqbLN140l0m0e6xIfWyFNmclk8rwZ9esGBanO0J/r3rangXzaGbZuROrvcUqi/L+rS1Iv5dwro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009745; c=relaxed/simple;
	bh=QL36iCxJvrAKverR2bsI02V8ii8bfBdNBFY2qQ0lS8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+IHnLh0ew91KyzVoT4XHUyhOCAXetdI7k0O7I+A1zpE4nVUziW7Zs/IhP3h/O5tF4gDh7vf571r3U+5E/nRijeoMmlq9HMvVTSvqMZwuvS5MY2ELFuY7Or4mPjqNlv1Ut7XAIIUEL7gglRVFITXuIDYXwBqwNX8Eltk2Oj5w4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oi4I5Hjb; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oi4I5Hjb"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso2086556a12.3
        for <llvm@lists.linux.dev>; Thu, 23 Apr 2026 22:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009743; x=1777614543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=begHw2Fh55YIAbwVuxIcFKYuQNkyXTaAo0Peazo3t08=;
        b=oi4I5Hjb7+Zg++hWgMuflM7pWar3/YdwpXIzH1MlPWR8e844Vm/HpqU9phDwKsFTi9
         6oLAcFtgTBn/1XM+mN1kvxtv6GXlbAySiTWXXQAdhAar/VscGJkohBRlilJTGUkatXM4
         oS3FQ/So2yzgLcZfcRE5KGu2H7ZiV2k8onLRme05RFecAzQmIdFlmG6bN424lBd7SVC+
         ZSGBPUuDiHV3bcN8Lk/MXHjPn4NKtE4ZGiNduOyFGGSo4R7mIw2YEf8AvV7O2f67YbdP
         qc3h/H0PeXGOLGtiYZ4Nnxdo4+ql3zOb20fdLQjF+MxQ2eMF27bcyRO2wvTtQboYv7cz
         G2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009743; x=1777614543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=begHw2Fh55YIAbwVuxIcFKYuQNkyXTaAo0Peazo3t08=;
        b=ZaQN5X1U7mxYllrgDfvC9eBQO0C300TBY9WX72nZSIoUJ0Mfg1FUQ6JWNCX3x9Jvpi
         XvT3BKU5M1Yb36JiEcDfTZJ93RXX5np5OuX/zwz2fp5zoSeqKhQ8ifx3cKfYs2eSU0d/
         EIFCGiQVvTC5Zh+ZGerwaIMU9ZVmK9HRyW13KjjeYyMRqZcxTDEwjSIBfACzxYeFQbih
         I8VML4oCyTqKmJ02iQw787t9pYZQ4SJlADQEawtgcy+/us+DIs/RU7m4fgzjRobtr3wy
         4owyY6Ix/s0MFAmZvqFbnA6+DVFVvhyWTPP5bekXDL8lwZtNfqkuEUKf0C04z1pKtZo3
         uIVg==
X-Forwarded-Encrypted: i=1; AFNElJ/CK+fHxS9SIR7feicRpYDVfBGoLv86v9uA5KmzGTOTq2C/TeT3/HEA35bxVSh5ZOoYsU1a@lists.linux.dev
X-Gm-Message-State: AOJu0YyunQYlbfDC9Qq5EcZ1qqFyJvq4ua+5nV+O7maQxqTSniu2vuHV
	9k/lVIM8Fn7i49et3LdyHYnMf3cVcCAmSVq8rS6f2BaPlqJcvdY3BqMm
X-Gm-Gg: AeBDieuBdw4OjWamIl+eaiWllcYvwZPrw6AuiupzyrPt2V/LAzOVLnrU5MK+u+dfgjR
	tyujUElbyBL99bUJf1lC30lIV4SYg7ps4HQXffPvKx43y+WWtBp7LFOEI5WWPxi1H2993gRLNVb
	duJFJ8wmzkaOuvq7k1Mol0zAINviRFoameXPWQVmJGMRCf9b+8rfFccA3BWCNcuLX8y52GVC/2r
	dzPECzsKo5NuM47jPNHOYZbxjiPVBud9EqABOS//TmNDqjMixdUAOFrMmj3HOEBWB0QSYj1ylyx
	hXHpjwxCPAR2BJSiHjelOFt44qXrdYuaY1aBv6qBholRSgHfh4OoyA/+YKEhhI5OFkvq+XUeBai
	ACvmQheCoqAld2S5eYjkIJMUGDEeTJjd/S4KOngkoIrQZXGBuCtICwyIbkyFD3/sqzwjhcNcME0
	zvqLaLI/88ln8H3mdRUBCqo3EiVp76f4ZyPkyc2i/yFCHEIPyV3As51A0wd/IgKWNyddL6hnRHz
	xyx/jgRt+hv6ko=
X-Received: by 2002:a17:903:1a45:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b5f9f4f562mr323157805ad.27.1777009743184;
        Thu, 23 Apr 2026 22:49:03 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:49:02 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
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
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V13 6/7] rust: Add PowerPC support
Date: Fri, 24 Apr 2026 11:17:41 +0530
Message-ID: <20260424054742.45832-7-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
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
index ee11fba7a03d..fd9c1bf026ca 100644
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


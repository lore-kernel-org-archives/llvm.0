Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C770B34D4EA
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259685; cv=none; b=B058g/R9HrprDR6YyBx3nsc7sFosXtvicSOett9AnhjWoXPfBLnYvySF0YBiPnbhw3NJ/onzbBO5ikjLBdhHeMj2Gw+c0P3818CJuivF6Id4oaL7jyMNElVfb2cNezKOpAhFvCBCUA6HKwdCINuOx3zROy5UXUdy9KN9l7mmrUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259685; c=relaxed/simple;
	bh=GmJislKektMtg5hUGQI5gihvItELSBBZIOBmfbt3LXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NxYSVhByLmeG7hpYmMizJOvQ5bd5JqInb98LOgKKpg8Qv8HW4YQacxdfTMDxMYAIezwtSgDvchADHXqgoDt0fW+4DtygDRKqxzCkPeNqOFPg//RF+VVIHcynHBfWArLs/1o218wIRGBuQrZSP0hQZyLi7HbAf1sm5Y5Lt73VzoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mgne+sAZ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mgne+sAZ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-369742178f8so2704749a91.0
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 23:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259683; x=1779864483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh45/E2QV0l24qGJ1aJPt1vt91dvBjOv4kmA2J8HuiM=;
        b=Mgne+sAZgvKHKQzdwBbkQLO8YzEqJ8V2nrZeaogtrtlLvJ/7R7TqjuZSCbbMOe63SN
         8/di7iKdHqAJbLy/O5nVwCDQlTjqc4amZOHgXmxzkQwkYsFbL3Z2GVLXBqEdiEV6c/ee
         2dQrrj33HC1WMZK+FC5mzProXqPdZSTWE65/4pICfBQUa68Ph70QQmnUWGipxRPrHSZL
         /9co7jP226P7ZdhQKt+y0LFOwEAoCpgChgkj6acMwFbzPcs/2vQGPTZdYTAy/aXzDLNe
         1HfAh/mzlSDJVjsXkrNKTFvdLgeur2llXFU1Tl5H6gxrNuvt1/7cVS5f0ZLEqlo74zeX
         Bsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259683; x=1779864483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lh45/E2QV0l24qGJ1aJPt1vt91dvBjOv4kmA2J8HuiM=;
        b=UNHGqnL80FVChqbK2T/ezwL6kygIf82LDkeDpJUmQaLP8lV3m2xzNe8SkcBimKGaXk
         QZEk7RrPPV0uApDOaljx9KdFrFu6brdVjXVn4NVDccXoGSKL3AIuJnYskUl5i9+yLqXb
         olJEBtHYf4bwiTHCUCQbTSHucRCrFiJuFdIj3m4ISgPpkg/ut6qSIi1cjJjslJ48ib/E
         je9UD7cy5bpA5nU04g2LpiViLDdlZLo52izrQuHQE5MeEXYJYHgWDDPTWF5mT0Hz8hwS
         iIgTXU0Jspk/aDkwsSLNAdWWhB55nnRjxjOhMrx4XfW2rrJAIi1aNrsAQgbDlO/x/g7j
         wbYA==
X-Forwarded-Encrypted: i=1; AFNElJ8mcLcJMcNcL82ojZoIMn6Rkih2RclXtjChXOrGLTROx0n+Wl+zCoYkGvnQ15qPpWw4CwJG@lists.linux.dev
X-Gm-Message-State: AOJu0Yy97yMqvkuHFQbrEav/A4aUp7VJGSvmBL+rIf4g+WezwZVJ+nuY
	+VWOxbRZJoR1vQ57xUIaC88s6bOREC+9Mv7+uWQXMjikKHFhBXisL+IK
X-Gm-Gg: Acq92OHyuaTc0XEdyutprutuZyO4zRMzOoEL4z+4RP8Rw0LkffQSsPEl3Mj02rDCUse
	TxX16Hco0Nh2/Kx7tL3GeiFy7nAQdgrzBY8dWGQ9v7dBg2A108VfHU8tVDzYrZTVxyAa/Osuenu
	mMdFdG64MHwSzlDbwKOxEGldHYQ4maahlNmLQu3aNSuiEx7ZiuA7ANx2q74QxG1Hd4kWsuB4Bmb
	UuM6hvyEEFuyewZRPR16e2Sn+ItACwW4+wtaiVa9euHorfiWcbRUuQA3wmElPdOBQlQJxusnwrf
	2VFJZ5BWRA6C2feq4T6F1zF/pI6HRDVQGlbkMKIB1W/tQwqxn+wqpituJLF/c/OEtOvZDOHOvCr
	NHMvpbbVhoTGdpHDefO/0LeZ6kd52kcQr5SH53zVYxtaABAtVkaQCnD6PFQC+WxKLnd5QLqMDhF
	Ts8SyJMtCW1kXi/gbGtiY8UPBkZCQAKpSW+rJdceGa5w/puDnBlBlkFp69sMoX/HNFIW6hL3vx0
	+/+
X-Received: by 2002:a17:90a:d44b:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-369518b00d8mr22980948a91.6.1779259683204;
        Tue, 19 May 2026 23:48:03 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:48:02 -0700 (PDT)
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
	acourbot@nvidia.com,
	fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	tamird@kernel.org,
	kees@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V16 6/7] rust: Add PowerPC support
Date: Wed, 20 May 2026 12:16:28 +0530
Message-ID: <20260520064630.1785283-7-mkchauras@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520064630.1785283-1-mkchauras@gmail.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
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
index 8ce4fa0e5e57..d9485f5e95e6 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -400,7 +400,8 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	-fdiagnostics-show-context -fdiagnostics-show-context=% \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
@@ -409,6 +410,7 @@ BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
 # This is only for i386 UM builds, which need the 32-bit target not -m32
 BINDGEN_TARGET_i386	:= i386-linux-gnu
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.54.0


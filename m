Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDBE19E7FE
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276582; cv=none; b=EF5al5zeL24eZHFBgrfDhXtFZCMd8kMmR2TDlMZB0TzPmepEmrpdVRQ88R+TmGmGGe7QRnbdtX0Q3lEiocO/UoeRqnLVPe0dITlaLSMdBTXfnhRXbnSFUdgqSC55ZdInU1D4vernJ77GD7bWJV5XZMShlEKM1s2j7CQlGvGlJng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276582; c=relaxed/simple;
	bh=uKiTAUlG9Mzz44mB3boSUKqgle05lQ6M72q35xSoV8U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n8sxy6rCCwaG9AMd45JLoqSebkNPxAoTAiuDPlK+tLsqYVN1RFeOu/H83JrGH0QvzfU0kR3Tjiy5FWwwo7mMk/g4b5AKl1NSWwY/8yjbjZr7uZpZdmsG1PrQBcDyXuPf8DHZ3Fa3bSOMGg20Sc3wk//GtymVMaYW5UFIFayNoA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nustbCS9; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nustbCS9"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e1fbe2a9a2so52507657b3.1
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276579; x=1727881379; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7IM+8uvbpUOTrNblc27FtujIjdoMKE18YT3ThvhmVkQ=;
        b=nustbCS9O9ElFdsNT6RhddLuCUnyUiq1kGzYP4xybvjPaPPhhs+x04xzzQWdryk0sU
         jEjgpqRDl1Qd4Qrx7ufnAcmCETZITiUM9//HgyKw3JvUGyBAdwj78aUH/JcgNfNnyM+n
         ExVbENTxbTHLUi4zYqYGHPED/aHHXgFVux7cHHISroRyqWE5Pj0YKMkYo1tNnk6g9mNq
         7MsZTnbAzBTSM2Gcd0pRTfFYwYVDTLxK4hlcdVnvJprW/zR3ti+x7BoBUbcdNCojtqO2
         hfMYcquvWPSEOgx7lcVuGt6w+2k6UYdhh6yvaD6N/ksjvxeuG9Yf9WgX+7ETRFNAImbP
         u2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276579; x=1727881379;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IM+8uvbpUOTrNblc27FtujIjdoMKE18YT3ThvhmVkQ=;
        b=G8xDyYWnvf6cOooONdhauYoC15D5/UP+dYcNVQQZgfhAfYt8ijCZ8DCEKBFaNzYPSi
         6IrM7AtKzSXHBgBnu2C4wTSXsawca/gYKdmQQ/tjAxvlVpz878nMUHV6dSC0NcKZ7lf2
         KRdEgScgZ0rl4zkuTYLCmViAJthds0WmGwqOLQvs4bfmv8pF6rx/fP1Bvv7IZqLRxy7A
         cUHcmUe94dsIQMiMMA+FtUlQFzVefRvZ+TTAxu1cJ7uOyHXuKY0FUNiI+fiyYX4eHwEC
         V8DH6Iwb2SbgObvLWTBeSj8rOT1Nz4JeO+PBgJQ4zU+KCYXMWmquiDSLWuI3tcvLggfC
         iGBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4mBgsvQb1mtpCeZwlg38i6uV8nR+ZqncZ9GrcFMM5zcphDichgvJxgABgtGRDE+SCZCal@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0VmpgdgQcWu5FHM4Xu+9YKxmF1mXglp496lM7YHuQzSDVNklB
	tw7mZwAlhL6Eq4YASt1r+lRCLHF3/whgV7DGftyFRLQGH/1yJwxWDtqblYI6wyn7HykQaQ==
X-Google-Smtp-Source: AGHT+IHCtqA+oNLQfmXqpM//kOUUkVuRiayEu9UAQA8X933VnnJ2JGMGIKXjp5QscVvSLG685e3KtDKL
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:6902:1782:b0:e0b:958a:3344 with SMTP id
 3f1490d57ef6-e24da39b0c3mr17940276.10.1727276578847; Wed, 25 Sep 2024
 08:02:58 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:27 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4280; i=ardb@kernel.org;
 h=from:subject; bh=Qfoxr/CYN1brA02vZLn1djUOVE7sfU2DhAxM/gB47SE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6qUIX51znF3nJyzZfmoB13+eT2d+37/IY95y8cys2
 5n+JYzJHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAifvYMv5jZZ0me+ya2VVnU
 Ozku0cJESLKOW+VHtMSKvW8vdx2dKMfIsJzzq0hJkqFDXdOunnmqwir812MtQuf0H13yi9n0fe8 DLgA=
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-57-ardb+git@google.com>
Subject: [RFC PATCH 27/28] x86/kernel: Switch to PIE linking for the core kernel
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Build the kernel as a Position Independent Executable (PIE). This
results in more efficient relocation processing for the virtual
displacement of the kernel (for KASLR). More importantly, it instructs
the linker to generate what is actually needed (a program that can be
moved around in memory before execution), which is better than having to
rely on the linker to create a position dependent binary that happens to
tolerate being moved around after poking it in exactly the right manner.

Note that this means that all codegen should be compatible with PIE,
including Rust objects, so this needs to switch to the small code model
with the PIE relocation model as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/Kconfig                        |  2 +-
 arch/x86/Makefile                       | 11 +++++++----
 arch/x86/boot/compressed/misc.c         |  2 ++
 arch/x86/kernel/vmlinux.lds.S           |  5 +++++
 drivers/firmware/efi/libstub/x86-stub.c |  2 ++
 5 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 54cb1f14218b..dbb4d284b0e1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2187,7 +2187,7 @@ config RANDOMIZE_BASE
 # Relocation on x86 needs some additional build support
 config X86_NEED_RELOCS
 	def_bool y
-	depends on RANDOMIZE_BASE || (X86_32 && RELOCATABLE)
+	depends on X86_32 && RELOCATABLE
 
 config PHYSICAL_ALIGN
 	hex "Alignment value to which kernel should be aligned"
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 83d20f402535..c1dcff444bc8 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -206,9 +206,8 @@ else
                 PIE_CFLAGS-$(CONFIG_SMP) += -mstack-protector-guard-reg=gs
         endif
 
-        # Don't emit relaxable GOTPCREL relocations
-        KBUILD_AFLAGS_KERNEL += -Wa,-mrelax-relocations=no
-        KBUILD_CFLAGS_KERNEL += -Wa,-mrelax-relocations=no $(PIE_CFLAGS-y)
+        KBUILD_CFLAGS_KERNEL	+= $(PIE_CFLAGS-y)
+        KBUILD_RUSTFLAGS_KERNEL	+= -Ccode-model=small -Crelocation-model=pie
 endif
 
 #
@@ -264,12 +263,16 @@ else
 LDFLAGS_vmlinux :=
 endif
 
+ifdef CONFIG_X86_64
+ldflags-pie-$(CONFIG_LD_IS_LLD)	:= --apply-dynamic-relocs
+ldflags-pie-$(CONFIG_LD_IS_BFD)	:= -z call-nop=suffix-nop
+LDFLAGS_vmlinux			+= --pie -z text $(ldflags-pie-y)
+
 #
 # The 64-bit kernel must be aligned to 2MB.  Pass -z max-page-size=0x200000 to
 # the linker to force 2MB page size regardless of the default page size used
 # by the linker.
 #
-ifdef CONFIG_X86_64
 LDFLAGS_vmlinux += -z max-page-size=0x200000
 endif
 
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 89f01375cdb7..79e3ffe16f61 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -495,6 +495,8 @@ asmlinkage __visible void *extract_kernel(void *rmode, unsigned char *output)
 		error("Destination virtual address changed when not relocatable");
 #endif
 
+	boot_params_ptr->kaslr_va_shift = virt_addr - LOAD_PHYSICAL_ADDR;
+
 	debug_putstr("\nDecompressing Linux... ");
 
 	if (init_unaccepted_memory()) {
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index f7e832c2ac61..d172e6e8eaaf 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -459,6 +459,11 @@ xen_elfnote_phys32_entry_offset =
 
 	DISCARDS
 
+	/DISCARD/ : {
+		*(.dynsym .gnu.hash .hash .dynamic .dynstr)
+		*(.interp .dynbss .eh_frame .sframe)
+	}
+
 	/*
 	 * Make sure that the .got.plt is either completely empty or it
 	 * contains only the lazy dispatch entries.
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index f8e465da344d..5c03954924fe 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -912,6 +912,8 @@ static efi_status_t efi_decompress_kernel(unsigned long *kernel_entry)
 	if (status != EFI_SUCCESS)
 		return status;
 
+	boot_params_ptr->kaslr_va_shift = virt_addr - LOAD_PHYSICAL_ADDR;
+
 	entry = decompress_kernel((void *)addr, virt_addr, error);
 	if (entry == ULONG_MAX) {
 		efi_free(alloc_size, addr);
-- 
2.46.0.792.g87dc391469-goog


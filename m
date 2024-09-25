Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4B718C920
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276538; cv=none; b=jr7J+zWAfMIqLSlA4/P5xIlU1ZZL7doW2ZEjerZYnJsmjIsHCqJ/tgfQs7Mg+obROkDvi9jVr/iJEmo6dv2wKFYu5W85l0yi+ZU6vyQoIlKhcu2ZiixAtxtiirnRgTa/gFN2D9UPUzB4R4XsffePqJhjNI1bZEMkJRfnhIxbMFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276538; c=relaxed/simple;
	bh=UKT9SQcfQYmFYYWRpiFhP5glZL5JX0TJEX6TTbNQ3aU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SyOoVc4w8HSnvOI5FU664Oe2L2DxlVB5kM6l4of/nBx3U4d0kzleylrjVxwWzg7Oa08kbH/5xMvrH+aXzBVCkaAf/y0qvTNt2q8xBKO2ly/ZPHvbZ23GVW1P+KjakHtIboR0/x8D4t9NbcKhErmN5jue9NTr71YyT4e46AY2Owk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TK4Q2Pkc; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TK4Q2Pkc"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6d3e062dbeeso14659187b3.0
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276535; x=1727881335; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mwy8kTVjZ/08dn4MFhxsJ/CPkFSWb32MIOuFSl+DFsU=;
        b=TK4Q2PkcGp/Y2/H5a9abnunSJw1m+Hr7IvhfrrRlZadO/Jnkrt3xDSMyz88far7u/N
         6xc2GW11XT+lzrbHTVZEie/QKs9I5ZyxRrzAQLV+Gb1FuHlgX9+g7T0tz3pbB+Auop94
         452xikjEb8D8U8f5xQB56wYrEpIGTmcZ2B1S/nOrus4OkBCQLTaYFlJhJdRAPgpqti7F
         fp/8SO5G7kSjDilZoLVS/h7i89P++wyX69tTBCkTSZlPBB83qGdsBgX6xvtCC5OAoh4Q
         2hvYVISumq1F/lIT4YmSF2N+C+iqlANpIkhGkunfwqb38n0k26MuLfxBG2MXs5Ad5Xvo
         e+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276535; x=1727881335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mwy8kTVjZ/08dn4MFhxsJ/CPkFSWb32MIOuFSl+DFsU=;
        b=peBLbkrzBy1Ep8w7+71MhZ4AzWk/boCe9DoujD1vkdnu1R0NipJoO9Xxml7ibiBHx4
         +mDC5NIzz8jPXKzOQeloJ9dZpa2lTvV3MDq3aqWWvjBR0NoTlkCxFpDCQCuPJcW+T8xd
         VwsRCQ4PcEJek934PD6+5nxMh5YmwOtSWoJpZT4Ov5hc5VeqPO/utMA9g33D6K5v9nVw
         3MK1xQnpgStAR2J+1JL8lIe/ND7HKKP4lU3J+JOdFgIZwEWpx1O12f6qziTSFasfEqt7
         MHw/PQ7yw/JD5H2Kg3nf2n+oTLE7AzISdPWF8A1z2lCleGXU1LyUE5JttRjY4CK8i8G9
         kc2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4LBE53KK2EqGK/JRGDAELIbehYHpX9JUyRZqHXxKW1EXn5c5xfKz9eHcyypoHVyKX6/RB@lists.linux.dev
X-Gm-Message-State: AOJu0YyTCW770Ji4kwaipn1O2D9lFZCInBHmT61IVe8+0tCoRemYKuUY
	mcF7SmSvsUqiBbBJtoUiICpDJxjQrHvGoJjS8Df4B+o3fKpWu7qnLPdOcbYEBA5IiZAFhg==
X-Google-Smtp-Source: AGHT+IEEpXdESu+AVZ5xAH4ocoULrkWfhbmfoqTWPQarKhwafrufRJLTuhlZhXvWoZ56ZcFdzDjPCpOs
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:6a0d:b0:6da:3596:21b8 with SMTP id
 00721157ae682-6e2089c8234mr1848507b3.4.1727276535155; Wed, 25 Sep 2024
 08:02:15 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:10 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4217; i=ardb@kernel.org;
 h=from:subject; bh=umOxUEgpm+XSdzq7sqW2wzWT3DKWlT715fLzy00ZrIc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6q4zMe0fH8zn/6yon+W25vvljx/znOb8fBedfXMvk
 4PJy+hrHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiC5MZGX675CxMX+/71dxB
 RTLX6OaHWScZikUU3t9k3TfnWIl7YijDP8vjN+r/hng3npecsefHgZqi2WFz5zPUNTIeVXy24tT y6awA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-40-ardb+git@google.com>
Subject: [RFC PATCH 10/28] x86/xen: Avoid relocatable quantities in Xen ELF notes
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

Xen puts virtual and physical addresses into ELF notes that are treated
by the linker as relocatable by default. Doing so is not only pointless,
given that the ELF notes are only intended for consumption by Xen before
the kernel boots. It is also a KASLR leak, given that the kernel's ELF
notes are exposed via the world readable /sys/kernel/notes.

So emit these constants in a way that prevents the linker from marking
them as relocatable. This involves place-relative relocations (which
subtract their own virtual address from the symbol value) and linker
provided absolute symbols that add the address of the place to the
desired value.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/vmlinux.lds.S | 13 +++++++++++++
 arch/x86/platform/pvh/head.S  |  6 +++---
 arch/x86/tools/relocs.c       |  1 +
 arch/x86/xen/xen-head.S       |  6 ++++--
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 00f82db7b3e1..52b8db931d0f 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -111,6 +111,19 @@ PHDRS {
 SECTIONS
 {
 	. = __START_KERNEL;
+
+#ifdef CONFIG_XEN_PV
+xen_elfnote_entry_offset =
+	ABSOLUTE(xen_elfnote_entry) + ABSOLUTE(startup_xen);
+xen_elfnote_hypercall_page_offset =
+	ABSOLUTE(xen_elfnote_hypercall_page) + ABSOLUTE(hypercall_page);
+#endif
+
+#ifdef CONFIG_PVH
+xen_elfnote_phys32_entry_offset =
+	ABSOLUTE(xen_elfnote_phys32_entry) + ABSOLUTE(pvh_start_xen - LOAD_OFFSET);
+#endif
+
 #ifdef CONFIG_X86_32
 	phys_startup_32 = ABSOLUTE(startup_32 - LOAD_OFFSET);
 #else
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 11245ecdc08d..adbf57e83e4e 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -50,7 +50,7 @@
 #define PVH_CS_SEL		(PVH_GDT_ENTRY_CS * 8)
 #define PVH_DS_SEL		(PVH_GDT_ENTRY_DS * 8)
 
-SYM_CODE_START_LOCAL(pvh_start_xen)
+SYM_CODE_START(pvh_start_xen)
 	UNWIND_HINT_END_OF_STACK
 	cld
 
@@ -165,5 +165,5 @@ SYM_DATA_START_LOCAL(early_stack)
 	.fill BOOT_STACK_SIZE, 1, 0
 SYM_DATA_END_LABEL(early_stack, SYM_L_LOCAL, early_stack_end)
 
-	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY,
-	             _ASM_PTR (pvh_start_xen - __START_KERNEL_map))
+	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .global xen_elfnote_phys32_entry;
+		xen_elfnote_phys32_entry: _ASM_PTR xen_elfnote_phys32_entry_offset - .)
diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index 942c029a5067..22c2d3f07a57 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -57,6 +57,7 @@ static const char * const	sym_regex_kernel[S_NSYMTYPES] = {
 	[S_ABS] =
 	"^(xen_irq_disable_direct_reloc$|"
 	"xen_save_fl_direct_reloc$|"
+	"xen_elfnote_.+_offset$|"
 	"VDSO|"
 	"__kcfi_typeid_|"
 	"__crc_)",
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index faadac7c29e6..4d246a48a85f 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -88,7 +88,8 @@ SYM_CODE_END(xen_cpu_bringup_again)
 	ELFNOTE(Xen, XEN_ELFNOTE_VIRT_BASE,      _ASM_PTR __START_KERNEL_map)
 	/* Map the p2m table to a 512GB-aligned user address. */
 	ELFNOTE(Xen, XEN_ELFNOTE_INIT_P2M,       .quad (PUD_SIZE * PTRS_PER_PUD))
-	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
+	ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          .globl xen_elfnote_entry;
+		xen_elfnote_entry: _ASM_PTR xen_elfnote_entry_offset - .)
 	ELFNOTE(Xen, XEN_ELFNOTE_FEATURES,       .ascii "!writable_page_tables")
 	ELFNOTE(Xen, XEN_ELFNOTE_PAE_MODE,       .asciz "yes")
 	ELFNOTE(Xen, XEN_ELFNOTE_L1_MFN_VALID,
@@ -109,7 +110,8 @@ SYM_CODE_END(xen_cpu_bringup_again)
 #else
 # define FEATURES_DOM0 0
 #endif
-	ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, _ASM_PTR hypercall_page)
+	ELFNOTE(Xen, XEN_ELFNOTE_HYPERCALL_PAGE, .globl xen_elfnote_hypercall_page;
+		xen_elfnote_hypercall_page: _ASM_PTR xen_elfnote_hypercall_page_offset - .)
 	ELFNOTE(Xen, XEN_ELFNOTE_SUPPORTED_FEATURES,
 		.long FEATURES_PV | FEATURES_PVH | FEATURES_DOM0)
 	ELFNOTE(Xen, XEN_ELFNOTE_LOADER,         .asciz "generic")
-- 
2.46.0.792.g87dc391469-goog


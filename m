Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4616E81F
	for <llvm@lists.linux.dev>; Wed, 10 Jan 2024 01:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kevinloughlin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y6FEDrCq"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-7bad62322f0so413462139f.3
        for <llvm@lists.linux.dev>; Tue, 09 Jan 2024 17:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704850012; x=1705454812; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k5v8oUBjXEAVbu4/vqslVZCTCJ0ygzsKmcB0GfrIu20=;
        b=Y6FEDrCqauaXy350WCcMkpiwMMJjQg0QAsyTleEWWpjf8OjWRvwsJfsz7lcYcUDueC
         G7gSbQDz/XOgJz8/d8ZIKJbezl6R2nsBA9lQ/I9EwiI7U5f7dIHRI3qmfcIRi1qZgres
         YQ6VI8wnhmQgzmp0eqImx2RqwxQapNo/EjYvGU4hiYDL3Mhn+dGpMy3bdr9HQCTNcNj4
         K3AacMIpiu/JtGXnNdp9CETzlpy0JMzYfZmk7le/tk3DJq8rrVytLjFkxK8R0WSYEKBo
         BiJXKXyp8cGMAdUlqFpJMzfauRbOGdM9T90rbj9J3RWm6V5Pl+c5BSQ5QwmphbTY8l52
         tv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704850012; x=1705454812;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k5v8oUBjXEAVbu4/vqslVZCTCJ0ygzsKmcB0GfrIu20=;
        b=nRRldwsLt8Dj7u0QCUpsY+bUWj75Q7P7JXaPLREMSUgsw93/j+X9bWg9zXn4WjWL90
         rjWOdUajNqBf0Q77uIN09PRtQx8eZqtkPsWmDQ2knYyDdAtspo/KDh9N9v1mxlJ0Mn7X
         7g1T2fj4m1DaMmEopw4DUtp0/tauG/HKq2Fo7EQ8o8g/67OwNkcH6a91Fru3vQb9Jel0
         MeqgfaATX5EqPciJtEOXfEqGVThiZwVGduBwEFST2z03KRWuGEa9l7ECi9GNhgh+9Ctt
         wBoktlNz4xlY14K0qOJaOBSRpfsKf+m3JnVy7/mtXFicCx4PSHIC3ZM6MPpbk200QHgH
         8RVg==
X-Gm-Message-State: AOJu0YxS4XJjoRUDv0Djp5hp0W91DhoRm6V8BUDNJcRjscog4pgBVM6d
	64DxPuUVhJVm2n+hj2sLWX1P4bYVNgjjC8y6BphKIbG0fv8=
X-Google-Smtp-Source: AGHT+IFw+G2FQxRDkksoxjc8deUmz4WU+ECeujMhwOD2760Mzm4ZYaoCgZNF2Ucn1CHML3j5eZGJdt5/7obNiAMBn9Jp
X-Received: from loughlin00.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:1b6f])
 (user=kevinloughlin job=sendgmr) by 2002:a05:6638:2645:b0:46e:308a:832 with
 SMTP id n5-20020a056638264500b0046e308a0832mr15553jat.3.1704850012536; Tue,
 09 Jan 2024 17:26:52 -0800 (PST)
Date: Wed, 10 Jan 2024 01:26:39 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240110012640.1335694-1-kevinloughlin@google.com>
Subject: [RFC PATCH] x86/sev: x86/sev: enforce PC-relative addressing in clang
From: Kevin Loughlin <kevinloughlin@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"GitAuthor: Kevin Loughlin" <kevinloughlin@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Kees Cook <keescook@chromium.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Ze Gao <zegao2021@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pengfei Xu <pengfei.xu@intel.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Joerg Roedel <jroedel@suse.de>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-coco@lists.linux.dev
Cc: Adam Dunlap <acdunlap@google.com>, Peter Gonda <pgonda@google.com>, 
	Jacob Xu <jacobhxu@google.com>, Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"

SEV/SME code can execute prior to page table fixups for kernel
relocation. However, as with global variables accessed in
__startup_64(), clang does not currently generate PC-relative accesses
for SEV/SME global variables, causing certain flavors of SEV hosts and
guests to crash.

While an attempt was made to force PC-relative addressing for certain
global SEV/SME variables via inline assembly (see snp_cpuid_get_table()
for example), PC-relative addressing must be pervasively-enforced for
SEV/SME global variables that can be accessed prior to page table
fixups.

To avoid the error-prone approach of manually referencing each SEV/SME
global variable via a general form of snp_cpuid_get_table(), it is
preferable to use compiler flags for position-independent code (ex:
`-fPIE`) that result in PC-relative accesses. While architecture-
specific code for Linux can be pervasively compiled as position-
independent on select architectures (ex: RISC-V), this is not currently
the case for x86-64 and would require extensive changes (see "[PATCH
RFC 00/43] x86/pie: Make kernel image's virtual address flexible" for
example).

Fortunately, the relevant files for SEV/SME code do indeed support
position-independent clang compilation, so we can use this technique to
ensure all global variables in these files are accessed via PC-relative
addressing.

Unlike clang, gcc does not currently allow `-fPIE` in conjunction with
`mcmodel=kernel`. Thus, to preserve existing gcc behavior, this patch
does not remove the (otherwise unnecessary) inline assembly that
already enforces PC-relative addressing for select SEV/SME globals
(mentioned above). If gcc supports these joint options in the future,
we can remove such inline assembly and also apply this patch to gcc
builds.

Tested by successful boot of SEV-SNP guest built with clang, alongside
Adam Dunlap's necessary "[PATCH v2] x86/asm: Force native_apic_mem_read
to use mov".

Fixes: 95d33bfaa3e1 ("x86/sev: Register GHCB memory when SEV-SNP is active")
Fixes: ee0bfa08a345 ("x86/compressed/64: Add support for SEV-SNP CPUID table in #VC handlers")
Fixes: 1cd9c22fee3a ("x86/mm/encrypt: Move page table helpers into separate translation unit")
Fixes: c9f09539e16e ("x86/head/64: Check SEV encryption before switching to kernel page-table")
Fixes: b577f542f93c ("x86/coco: Add API to handle encryption mask")
Tested-by: Kevin Loughlin <kevinloughlin@google.com>
Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
---
 arch/x86/coco/Makefile   | 10 ++++++++++
 arch/x86/kernel/Makefile | 10 ++++++++++
 arch/x86/mm/Makefile     | 13 +++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/x86/coco/Makefile b/arch/x86/coco/Makefile
index c816acf78b6a..286950596ee9 100644
--- a/arch/x86/coco/Makefile
+++ b/arch/x86/coco/Makefile
@@ -5,4 +5,14 @@ CFLAGS_core.o		+= -fno-stack-protector
 
 obj-y += core.o
 
+# clang allows -fPIE with mcmodel=kernel; gcc currently does not.
+ifdef CONFIG_CC_IS_CLANG
+# Enforce PC-relative addressing for SEV/SME global variables.
+CFLAGS_core.o		+= -fPIE
+# Disable relocation relaxation in case the link is not PIE.
+CFLAGS_core.o 		+= $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
+# Avoid unnecessary GOT overhead in PC-relative addressing.
+CFLAGS_core.o 		+= -include $(srctree)/include/linux/hidden.h
+endif
+
 obj-$(CONFIG_INTEL_TDX_GUEST)	+= tdx/
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 0000325ab98f..bf85f9de89e9 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -7,6 +7,16 @@ extra-y	+= vmlinux.lds
 
 CPPFLAGS_vmlinux.lds += -U$(UTS_MACHINE)
 
+# clang allows -fPIE with mcmodel=kernel; gcc currently does not.
+ifdef CONFIG_CC_IS_CLANG
+# Enforce PC-relative addressing for SEV/SME global variables.
+CFLAGS_sev.o += -fPIE
+# Disable relocation relaxation in case the link is not PIE.
+CFLAGS_sev.o += $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
+# Avoid unnecessary GOT overhead in PC-relative addressing.
+CFLAGS_sev.o += -include $(srctree)/include/linux/hidden.h
+endif
+
 ifdef CONFIG_FUNCTION_TRACER
 # Do not profile debug and lowlevel utilities
 CFLAGS_REMOVE_tsc.o = -pg
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index c80febc44cd2..7abf20a94451 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -17,6 +17,19 @@ KCSAN_SANITIZE := n
 # Avoid recursion by not calling KMSAN hooks for CEA code.
 KMSAN_SANITIZE_cpu_entry_area.o := n
 
+# clang allows -fPIE with mcmodel=kernel; gcc currently does not.
+ifdef CONFIG_CC_IS_CLANG
+# Enforce PC-relative addressing for SEV/SME global variables.
+CFLAGS_mem_encrypt_amd.o 	+= -fPIE
+CFLAGS_mem_encrypt_identity.o 	+= -fPIE
+# Disable relocation relaxation in case the link is not PIE.
+CFLAGS_mem_encrypt_amd.o 	+= $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
+CFLAGS_mem_encrypt_identity.o 	+= $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
+# Avoid unnecessary GOT overhead in PC-relative addressing.
+CFLAGS_mem_encrypt_amd.o 	+= -include $(srctree)/include/linux/hidden.h
+CFLAGS_mem_encrypt_identity.o 	+= -include $(srctree)/include/linux/hidden.h
+endif
+
 ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_mem_encrypt.o		= -pg
 CFLAGS_REMOVE_mem_encrypt_amd.o		= -pg
-- 
2.43.0.275.g3460e3d667-goog


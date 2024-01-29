Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3219276024
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 18:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551572; cv=none; b=CkAaKFBu6X0YxwkybOBSWjQ3PLwLKA+GiH1e6q9lDpp5FNBrabiiZ+h1jVQUoPv2WXDGsjVXBxpphM7WwTfbT+6GZCTPJ3NYbzigQORIwijj+MgIfXJjdokhCs2DyevM+UuuIf0fmUc6uDhrCm9iFOxo2Z8VeMajzI0utkB7EjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551572; c=relaxed/simple;
	bh=N7Dqbs6A3xIbAMqCtcMIQ29SguGASEykNJNGXXdKxFI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kNbCIcEEPPrJmYxWm0NkPP+bAOoKkRWTDzlmYE5E1ydf4xpirSSAm4hlVJyzKX4TFemEneH+DjhgxB+n2oeF4XS34z++wc+xxOfSYO55S/OFHJ1ZaV9N+NdAAXfgQIexbMi0NcdZiDn3yLlKI4TSQQiMhleAeabXoUtdSSwqzLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E7+9Nhvb; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E7+9Nhvb"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-33aedf2c31fso549250f8f.0
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 10:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706551569; x=1707156369; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yw+flZGULMSavtLRoK2qSf3V9Gu3GyVCc2w7RxQ06Ro=;
        b=E7+9Nhvbo8jRsQ20qQ0lgRPIKEiQjPXDpkAz8VpXHzIOizGSM95a7dRPbKFbbAFfrb
         qevc+zhDASh7eGLHEvinP/nK2Fzd8l2fLm45V/ZaoGVT5otPobMbOwC9w5nno/C2YA96
         XDPoQO80n67SqlSZ2s23VmQ+nygHYHTBCD9Ar74f+tXSsc0EJFwQK9zRiQ6Jl0Xa/OM4
         Nk8iO4VnznK/bpNkWOwRtTshThGisyk57pCbhAVUrVXomUaXXhCh7lHbi6/Q7SMRiCNj
         q2zFdHb79GQzOLsgUDjRqGSxcIBaxvkF/XX09rwtgMBx1gFT8IDjZcx1oWt9aLNfXZYd
         WhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551569; x=1707156369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yw+flZGULMSavtLRoK2qSf3V9Gu3GyVCc2w7RxQ06Ro=;
        b=v4Q+q9r1iKwoNP50rBqIXIn4hv1oc3wfGiji4FXlJxl+Q4FCTJ5S9Og1P9+9JKTbp1
         enHDKPnvj7u2/Bn09c+spr5/3VfIStwy8OwehIxgYkjBEa0Fn/FwFvfMtUttb9puHkLl
         jvQBTLGnp3IBIa5kYZAXAR3tsidp1pXLpKb6ya66x92OP1s0QuEixyiGvwSM4WzNl04r
         CIoPrFtou4/bCQdkDdGxI11f8smLmqyIGN0ref0xGJd7gsQle7JL1ZYcgpqsoTYKOAMM
         /iVvBbC1I19UWQlbeKaSpSCiyF81c8BKOJLW3I5tKV653nkGHFcEL7w4Ng/vqv4gWwS8
         4lUw==
X-Gm-Message-State: AOJu0YwgdFPFF4BVmXME+agGh/xfAwrEJeXmLkjEZm3KuPhr4ZcYNnJ+
	m1c8YDkCQOQKQ47l0u4J6jdl5CRXI8w7jLyqo0pilmUN1lnhrW/3aOgV3AR3sqitFiIj1Q==
X-Google-Smtp-Source: AGHT+IENcq3eVgTctzbegGvOoo9ucEIbkmBu/hWVgKdlKYbqpqwTZckCmZpKMHsy8T2zaFDU+s/vXnzc
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6000:1708:b0:33a:f0f9:bebc with SMTP id
 n8-20020a056000170800b0033af0f9bebcmr4262wrc.7.1706551569728; Mon, 29 Jan
 2024 10:06:09 -0800 (PST)
Date: Mon, 29 Jan 2024 19:05:20 +0100
In-Reply-To: <20240129180502.4069817-21-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945; i=ardb@kernel.org;
 h=from:subject; bh=gUz2qElRticSrvsvtLUDoN8B1p79LARk6mWyXvU24wE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXX7i4dqvH15HX5Wf/uN1EQe/hE6urU95U1q1p2ZgeqrZ
 6o4OO7sKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOpm8DIsD7idciuqibGy28P
 sYtcmGQ4exvfPMk+4cUb/bhsFEIyljH8L3704rv+6ZWdMRP4FHZsWvXR8MaPtf27Pkm3P9t/x7U 8kBMA
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129180502.4069817-38-ardb+git@google.com>
Subject: [PATCH v3 17/19] x86/sev: Use PIC codegen for early SEV startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Use PIC codegen for the compilation units containing code that may be
called very early during the boot, at which point the CPU still runs
from the 1:1 mapping of memory. This is necessary to prevent the
compiler from emitting absolute symbol references to addresses that are
not mapped yet.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/Makefile      | 2 ++
 arch/x86/kernel/vmlinux.lds.S | 1 +
 arch/x86/mm/Makefile          | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 42db41b04d8e..3819b65c64ec 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -24,7 +24,9 @@ endif
 # head64.c contains C code that may execute from a different virtual address
 # than it was linked at, so we always build it using PIE codegen
 CFLAGS_head64.o += $(PIE_CFLAGS)
+CFLAGS_sev.o += $(PIE_CFLAGS)
 UBSAN_SANITIZE_head64.o					:= n
+UBSAN_SANITIZE_sev.o					:= n
 
 KASAN_SANITIZE_head$(BITS).o				:= n
 KASAN_SANITIZE_dumpstack.o				:= n
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 77262e804250..bbdccb6362a9 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -182,6 +182,7 @@ SECTIONS
 
 		DATA_DATA
 		CONSTRUCTORS
+		*(.data.rel .data.rel.*)
 
 		/* rarely changed data like cpu maps */
 		READ_MOSTLY_DATA(INTERNODE_CACHE_BYTES)
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index c80febc44cd2..f3bb8b415348 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -31,7 +31,7 @@ obj-y				+= pat/
 
 # Make sure __phys_addr has no stackprotector
 CFLAGS_physaddr.o		:= -fno-stack-protector
-CFLAGS_mem_encrypt_identity.o	:= -fno-stack-protector
+CFLAGS_mem_encrypt_identity.o	:= $(PIE_CFLAGS)
 
 CFLAGS_fault.o := -I $(srctree)/$(src)/../include/asm/trace
 
-- 
2.43.0.429.g432eaa2c6b-goog


Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE2D482ED
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828123; cv=none; b=S3BWRr2fZjf41dBSA6+3+9R9WFHPChXjSAMJfQt5D50LEKJGppbjhfbL9Nt6bicszMQvGgXR9JOyvENVA2uAQyyQL8qB0nrMGsIcfgQWOVR8ahkkZ9rCA4D4To+VpRpKF0P5W9PMp8xjQYv8itT2CTyr8T9Fw/AJTXuiPIRRPv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828123; c=relaxed/simple;
	bh=ZVMb7gP145nftz4xlnOVHAtrFJ5WUTtvWVYyLjZEiXc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aR5XDjyRlGZIMXAaQK2zIgtC27R/iNN634SnBHmgT6HmdJ+yMpiIG1LcBG3SdZw0TJGBSJixjEFp2whGayorGNCKS4bp42uIHCI7L7irMae2NLesn90foRUdStbKXFv/KPOpIDTDQHQXe64u3YTCgVWWILypmmUmT+U2n9ECorg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MyHrwb1I; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MyHrwb1I"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcc0bcf9256so1704116276.3
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 04:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707828121; x=1708432921; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4sKQKsqhQHcaBIiQ2PFPv13ZvWeRGhTtRzdxj6QxrA4=;
        b=MyHrwb1IhASF/CYqOURi0VeyPMMiKnf36CoB7FwnsWlNnr27w9I8EA8CaC2ZL16bDT
         4jMYatw3UQFf0B8DVmhG129G3+6t/usGouJVR+Y2hoAYdTHwxEjykegUBsytld022ne8
         tEf1FTEVx9ELIqPH8bFMIBfX5D9mFT0BdPB6cJvwUVYU/5GapEUaO0aEgzfDXVgmf+5Q
         X0LbX+g455BcFpTV9C+nqHdfYYarhDAMTNZrzqPkYhe7TfD2gfnBV2LmWvRsrP/lXp55
         lXQzZnZldyVcnn9Alf+p4rs5xn+FD1O7x7ei8SbSQwQkcYiJZeJZffyn8GrwRBK1Ig73
         enVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707828121; x=1708432921;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4sKQKsqhQHcaBIiQ2PFPv13ZvWeRGhTtRzdxj6QxrA4=;
        b=QPplnaSmHPRDJkcBZyvMKPLPjGX19spUNcZ+9Hd816MnX7MUUipeY0fxVdnI++TuG7
         mkj3LIFS96GRY9QikBCQ9+8TBVnbU9/srPeJK9+Vx0r/LfuwsqC2YCA59B3eF2P3CTsR
         +zepXXxYCTaT2VbmS0B7G8C8vDfSVAfuZYLl5tUgbuPamvpkFYeDqR7TMtbydit2LfeP
         +/qFqZs4ftpn/9tKr4jE936YF9apHL/L4xZ7idrKzUiN9ebNxbLko+TOBLtHUcVZwWwk
         RxDrReH+vVv3MSvJeb0U8KcAbH63P7yZX/ZSlnO818K//V/62vHFRvZDBpONNLc2bOX+
         XovA==
X-Gm-Message-State: AOJu0YwcCglvsLRSDfu9eifpI9vaMI5NvVfmT1N3Yj8sw34gWV5Zec0z
	m6xiSVlILH/nLsC1exCL5ugg+FffIrsDLCSHlcKJhjv+I05d4DyStoWI5zvNp4r1vrkHOQ==
X-Google-Smtp-Source: AGHT+IFsUPajA+uJOUTqCizpG7tc2fhGX8nsZXyDmXGQA0A5u8p94jVknGR04nO4Syv60zafQ6BSfdJh
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6902:2511:b0:dc6:b813:5813 with SMTP id
 dt17-20020a056902251100b00dc6b8135813mr344439ybb.9.1707828120922; Tue, 13 Feb
 2024 04:42:00 -0800 (PST)
Date: Tue, 13 Feb 2024 13:41:44 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5108; i=ardb@kernel.org;
 h=from:subject; bh=OMc84jLqcYdv1xNch4EdvwfbPoPBMHzZEI4gviSqvx4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIfV0cgfjiYONH+z21bRwcN3nOu//4MfTozEPq2RSXLrOa
 m2+rSLVUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbyZiLD/+xkvp3yQe3Tlhxy
 yX94nOf65FfTe6uaG91s7BUVcsJE/zAyHJ9h/9Dv1kHV51q6Ao0yaulO0ZuXN19jqak1Ye4LeCb DDAA=
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213124143.1484862-13-ardb+git@google.com>
Subject: [PATCH v4 00/11] x86: Confine early 1:1 mapped startup code
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

This is a follow-up to [0] which implemented rigorous build time checks
to ensure that any code that is executed during early startup supports
running from the initial 1:1 mapping of memory, which is how the kernel
is entered from the decompressor or the EFI firmware.

Using PIC codegen and introducing new magic sections into generic code
would create a maintenance burden, and more experimentation is needed
there.  One issue with PIC codegen is that it still permits the compiler
to make assumptions about the runtime address of global objects (modulo
runtime relocation), which is incompatible with how the kernel is
entered, i.e., running a fully linked and relocated executable from the
wrong runtime address.

The RIP_REL_REF() macro that was introduced recently [1] is actually
more appropriate for this use case, as it hides the access from the
compiler entirely, and so the compiler can never predict its result.

To make incremental progress on this, this v4 drops the special
instrumentation for .pi.text and PIC codegen, but retains all the
cleanup work on the startup code to make it more maintainable and more
obviously correct.

In particular, this involves:
- getting rid of early accesses to global objects, either by moving them
  to the stack, deferring the access until later, or dropping the
  globals entirely;
- moving all code that runs early via the 1:1 mapping into .head.text,
  and moving code that does not out of it, so that build time checks can
  be added later to ensure that no inadvertent absolute references were
  emitted into code that does not tolerate them;
- removing fixup_pointer() and occurrences of __pa_symbol(), which rely
  on the compiler emitting absolute references, and this is not
  guaranteed. (Without -fpic, the compiler might still use RIP-relative
  references in some cases)

Changes since v3:
- dropped half of the patches and added a couple of new ones
- applied feedback from Boris to patches that were retained, mostly
  related to some minor oversights on my part, and to some style issues

[0] https://lkml.kernel.org/r/20240129180502.4069817-21-ardb%2Bgit%40google.com
[1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=x86/sev&id=1c811d403afd73f0

Cc: Kevin Loughlin <kevinloughlin@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dionna Glaze <dionnaglaze@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: llvm@lists.linux.dev

Ard Biesheuvel (11):
  x86/startup_64: Simplify global variable accesses in GDT/IDT
    programming
  x86/startup_64: Replace pointer fixups with RIP-relative references
  x86/startup_64: Simplify CR4 handling in startup code
  x86/startup_64: Defer assignment of 5-level paging global variables
  x86/startup_64: Simplify calculation of initial page table address
  x86/startup_64: Simplify virtual switch on primary boot
  efi/libstub: Add generic support for parsing mem_encrypt=
  x86/boot: Move mem_encrypt= parsing to the decompressor
  x86/sme: Move early SME kernel encryption handling into .head.text
  x86/sev: Move early startup code into .head.text section
  x86/startup_64: Drop global variables keeping track of LA57 state

 arch/x86/boot/compressed/misc.c                |  15 ++
 arch/x86/boot/compressed/misc.h                |   4 -
 arch/x86/boot/compressed/pgtable_64.c          |  12 --
 arch/x86/boot/compressed/sev.c                 |   3 +
 arch/x86/boot/compressed/vmlinux.lds.S         |   1 +
 arch/x86/include/asm/mem_encrypt.h             |   8 +-
 arch/x86/include/asm/pgtable_64_types.h        |  58 +++----
 arch/x86/include/asm/setup.h                   |   2 +-
 arch/x86/include/asm/sev.h                     |  10 +-
 arch/x86/include/uapi/asm/bootparam.h          |   1 +
 arch/x86/kernel/cpu/common.c                   |   2 -
 arch/x86/kernel/head64.c                       | 172 ++++++--------------
 arch/x86/kernel/head_64.S                      |  91 ++++-------
 arch/x86/kernel/sev-shared.c                   |  23 ++-
 arch/x86/kernel/sev.c                          |  14 +-
 arch/x86/lib/Makefile                          |  13 --
 arch/x86/mm/kasan_init_64.c                    |   3 -
 arch/x86/mm/mem_encrypt_identity.c             |  83 +++-------
 drivers/firmware/efi/libstub/efi-stub-helper.c |   8 +
 drivers/firmware/efi/libstub/efistub.h         |   2 +-
 drivers/firmware/efi/libstub/x86-stub.c        |   3 +
 21 files changed, 186 insertions(+), 342 deletions(-)


base-commit: 1c811d403afd73f04bde82b83b24c754011bd0e8
-- 
2.43.0.687.g38aa6559b0-goog


Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933E82C1B5
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 11:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706182360; cv=none; b=RZrmVzuuokb3GW0lMrPU/ln7+SvOux+gtfc0e6HREDVOtwl4A6F9m7gCJn+Z+OJWjhwrzSY9lCpD20+vkztED/K9mRa1GvdQU8tdDxcxCa2iYypE2bG1sKyuE0yKe1Z/oYgq4RumjcnHm6aLcXSoc3kuYR2ae6XKgABAwnOIlv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706182360; c=relaxed/simple;
	bh=M/dY1K/cDSitauuanlOcuux8g/eo1beeiaI7jh6JUqU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IF1XdsrtI+ElYGObEDEmBvT132/LZhnteSAnJLAK88+krmKC3gM1/1New3kCsvBWyYyMfX1WCizCjpvr9ZhkbDZNZAD+klbstw9AMAPRmRCw1azIcqapZ35uElzrC8V+G/fxYEgoxbRtgJTw/uQhyJMx2wF0qu/d0SOwo9HR3G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t7ypkvaq; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t7ypkvaq"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5e8d2c6903dso120321987b3.0
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 03:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706182357; x=1706787157; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zCvimkwa+N98VxwOiO1HtexFLHWLAuY9mMqDTRppF28=;
        b=t7ypkvaq/XOQBRVHEXZskUomMQXjzrLscoAVeO1hAf1TQ9ytd3/zo0SbJKWPeVPtGs
         s3zbBn4l3wOL5U5tFukT4Z9VCtUZ7rRF3I17HwtfTPku6AY979Lak4AmMW10BEh9ZICo
         geE4Z9EstG2yjAXF5h43zoNdCbYGu5I1XxGWwQ8VvgSc7JxFPz4NhGiZWbz4wDi4dRfy
         LvCMZUIDJP0uWqiDUptpflSXf7LiFOcLR+Gu1GZlBwJoT8x/eMilTO59heBB5k4SuIel
         bumHf2O/3Nyli9g8vSejHLXlvIgE5KfRXM2Xenvyr2NZSIjuZJwP1bZKkgc9Bf7p7lni
         TFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706182357; x=1706787157;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zCvimkwa+N98VxwOiO1HtexFLHWLAuY9mMqDTRppF28=;
        b=G0l2+6EnOzbzQbB7tlLofrivn8V/WMVKt9ovzu85VjR/M87FjAtASNQ0LVeP4kIzRt
         ADRnk9peg7o1Vk7VLZpnVv3DRaHYljgdjU4KYHEBofI4SWHXEOr9BK65xFMQCIP4Wg6u
         EgCEVoQFbuInsabG82rcYAOX3nbjRxBXg1DlTjahGcHQoA1rDmZNgm6ExhBtWQegGyMv
         VYwzaQk4lA0Gz9rzX2r4V5Gdajwkr3aUi1W/n7Dpm6OziW2VaxWE39nBrchrXkDBbiXR
         hqjK4k5mpLvxHHwTTKXYZUyqjpEkTbPVmyTrKWfa7HYsgXsmtLkqgpVKsC6NOYNHVYd2
         OMYQ==
X-Gm-Message-State: AOJu0Yz9QqxnTLMQrGcdr3vvzTHw4O7fFF5SkOf9NWNy8budADhTaFpk
	TWspa9Rluu69Pq5Fau40D59p5GWNPmvHAnyUEIUVmtGCN3udb+m9OnVwBQ4OgZUMeN2evA==
X-Google-Smtp-Source: AGHT+IFQ0bbK3shwDJ7u/hzVC6q8D0IRa114izdEFDZY1s0bcxzImA0cErF4wDNJMJnPQbz7pw5YV1dp
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6902:108f:b0:dc2:23d8:722d with SMTP id
 v15-20020a056902108f00b00dc223d8722dmr436354ybu.13.1706182357559; Thu, 25 Jan
 2024 03:32:37 -0800 (PST)
Date: Thu, 25 Jan 2024 12:28:19 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5573; i=ardb@kernel.org;
 h=from:subject; bh=P2nWyKkk+bKmbsXSPUU8MaF5wQOLstUuyAYPvPpo/kA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXWT62U+gwfimY9VPvwxuG679HpkXe/G1pzuJCbnifbPH
 mhPir/QUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaito7hn7bhinxOHv/dXTuY
 90/6WZGSMuno+9z66QWPF4ussTz8oo/hf2Kr2/vuH4KOUw8y7u819/Wv2+bFtpBnxZyL3Txa/Vw eDAA=
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240125112818.2016733-19-ardb+git@google.com>
Subject: [PATCH v2 00/17] x86: Confine early 1:1 mapped startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This is a follow-up to my RFC [0] that proposed to build the entire core
kernel with -fPIC, to reduce the likelihood that code that runs
extremely early from the 1:1 mapping of memory will misbehave.

This is needed to address reports that SEV boot on Clang built kernels
is broken, due to the fact that this early code attempts to access
virtual kernel address that are not mapped yet. Kevin has suggested some
workarounds to this [1] but this is really something that requires a
more rigorous approach, rather than addressing a couple of symptoms of
the underlying defect.

As it turns out, the use of fPIE for the entire kernel is neither
necessary nor sufficient, and has its own set of problems, including the
fact that the PIE small C code model uses FS rather than GS for the
per-CPU register, and only recent GCC and Clang versions permit this to
be overridden on the command line.

But the real problem is that even position independent code is not
guaranteed to execute correctly at any offset unless all statically
initialized pointer variables use the same translation as the code.

So instead, this v2 proposes another solution, taking the following
approach:
- clean up and refactor the startup code so that the primary startup
  code executes from the 1:1 mapping but nothing else;
- define a new text section type .pi.text and enforce that it can only
  call into other .pi.text sections;
- (tbd) require that objects containing .pi.text sections are built with
  -fPIC, and disallow any absolute references from such objects.

The latter point is not implemented yet in this v2, but this could be
done rather straight-forwardly. (The EFI stub already does something
similar across all architectures)

Patch #13 in particular gives an overview of all the code that gets
pulled into the early 1:1 startup code path due to the fact that memory
encryption needs to be configured before we can even map the kernel.


[0] https://lkml.kernel.org/r/20240122090851.851120-7-ardb%2Bgit%40google.com
[1] https://lore.kernel.org/all/20240111223650.3502633-1-kevinloughlin@google.com/T/#u

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
Cc: Brian Gerst <brgerst@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: llvm@lists.linux.dev

Ard Biesheuvel (17):
  x86/startup_64: Drop long return to initial_code pointer
  x86/startup_64: Simplify calculation of initial page table address
  x86/startup_64: Simplify CR4 handling in startup code
  x86/startup_64: Drop global variables to keep track of LA57 state
  x86/startup_64: Simplify virtual switch on primary boot
  x86/head64: Replace pointer fixups with PIE codegen
  x86/head64: Simplify GDT/IDT initialization code
  asm-generic: Add special .pi.text section for position independent
    code
  x86: Move return_thunk to __pitext section
  x86/head64: Move early startup code into __pitext
  modpost: Warn about calls from __pitext into other text sections
  x86/coco: Make cc_set_mask() static inline
  x86/sev: Make all code reachable from 1:1 mapping __pitext
  x86/sev: Avoid WARN() in early code
  x86/sev: Use PIC codegen for early SEV startup code
  x86/sev: Drop inline asm LEA instructions for RIP-relative references
  x86/startup_64: Don't bother setting up GS before the kernel is mapped

 arch/x86/Makefile                       |   5 +
 arch/x86/boot/compressed/Makefile       |   2 +-
 arch/x86/boot/compressed/pgtable_64.c   |   2 -
 arch/x86/boot/compressed/sev.c          |   3 +
 arch/x86/coco/core.c                    |   7 +-
 arch/x86/include/asm/coco.h             |   8 +-
 arch/x86/include/asm/mem_encrypt.h      |   8 +-
 arch/x86/include/asm/pgtable.h          |   6 +-
 arch/x86/include/asm/pgtable_64_types.h |  15 +-
 arch/x86/include/asm/setup.h            |   4 +-
 arch/x86/include/asm/sev.h              |   6 +-
 arch/x86/kernel/Makefile                |   5 +
 arch/x86/kernel/cpu/common.c            |   2 -
 arch/x86/kernel/head64.c                | 188 ++++++--------------
 arch/x86/kernel/head_64.S               | 156 ++++++----------
 arch/x86/kernel/sev-shared.c            |  26 +--
 arch/x86/kernel/sev.c                   |  27 ++-
 arch/x86/kernel/vmlinux.lds.S           |   3 +-
 arch/x86/lib/Makefile                   |   2 +-
 arch/x86/lib/cmdline.c                  |   6 +-
 arch/x86/lib/memcpy_64.S                |   3 +-
 arch/x86/lib/memset_64.S                |   3 +-
 arch/x86/lib/retpoline.S                |   2 +-
 arch/x86/mm/Makefile                    |   3 +-
 arch/x86/mm/kasan_init_64.c             |   3 -
 arch/x86/mm/mem_encrypt_boot.S          |   3 +-
 arch/x86/mm/mem_encrypt_identity.c      |  94 +++++-----
 arch/x86/mm/pti.c                       |   2 +-
 include/asm-generic/vmlinux.lds.h       |   3 +
 include/linux/init.h                    |  12 ++
 scripts/mod/modpost.c                   |  11 +-
 tools/objtool/check.c                   |  26 ++-
 32 files changed, 262 insertions(+), 384 deletions(-)

-- 
2.43.0.429.g432eaa2c6b-goog


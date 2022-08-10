Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6D4680
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 22:25:06 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-31f58599ad3so137592597b3.20
        for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 15:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=/a7ZitxlSP2ap4ZvM+L6M2uGM3eiBd8X/p1jSaTtmzc=;
        b=gvTf7ZWl7bgrQX0FgmznsVlAjRR5g0jVQaFB10FKWShAdbh17YEHiWK30kSMKm0HPw
         HW4wiUSMa9nQJwRMaKtlXUyElrBe6GmMJ1hgUsNeickejjwUxGYskgRD0+iyqusguQfJ
         Glt8iQ5CGmdxgrxqACQg0AyuU6Px9CD5gHWOneonqQ9KgOtTmlvnWEz7Q0/0bLxwJfPK
         RCgqDE50mbP4rSUtlWQMxC+dVHgEISHSji3ZUSz39ak6+g4xUlnpt73P+XiDWYUtIM1N
         OZ66+phcLM635OtS8AmPwDWiij3da51yMtsdGZyC5aW120qyTHfhNctsQT90i/CQeC1+
         NYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=/a7ZitxlSP2ap4ZvM+L6M2uGM3eiBd8X/p1jSaTtmzc=;
        b=o3xDT07Q8p85oeHJdlSRjxx1or5/OrRb3RabGhfwvli/By+4Dg9yKeOgIQflPQhPws
         H3BFVwPM+Aw4c3S+3Iut4ZBUgSHP2EMJddq/4IMRS8faUiDZpsiJQxD0nL7reIFOiWGf
         1JNloAxRUGA/TR0F5hD53bAzYyZBFv3CNxhsA574pewqkJCTAe0iPI+QaoRCyzyZER05
         dSlBQFJsVCJKobL3wXnkKIUiRkpOvl4AX9vuKjBbUr+d3dZ92/klWZGi3XtoATAMKcjz
         qbypUy3sHhakvAgfJ8ABahksVyBA+KZN0yBBXhUsBBJ6Lf6wPbNA2DRR06k9qeQiF217
         u7WA==
X-Gm-Message-State: ACgBeo1dby/oxaKebBpPQjR6gGJ84v9xLYIR5fNvzWx8rBkkA0fZ8jhk
	wVGknwNMmegbg67dD8zZSSFvoV05y4K0brdgIjI=
X-Google-Smtp-Source: AA6agR6Qx2DutA4B5/VXTeQA7KbB5NrdRwVnd0DdZ3u1U5+FBw3DD1DBKB+bC8qLADZQx4xe6oH7OoSLXsokOOExg6Y=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:88ad:cd41:8dd7:539])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:ea57:0:b0:31f:4ebd:99f7 with SMTP
 id t84-20020a0dea57000000b0031f4ebd99f7mr30093800ywe.280.1660170305693; Wed,
 10 Aug 2022 15:25:05 -0700 (PDT)
Date: Wed, 10 Aug 2022 15:24:42 -0700
In-Reply-To: <20220810222442.2296651-1-ndesaulniers@google.com>
Message-Id: <20220810222442.2296651-3-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220809013653.xtmeekefwkbo46vk@google.com> <20220810222442.2296651-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1660170282; l=1856;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=bGYj2JeGfjSj7Z1PRgZLMWLsr83doiKmqzZ3eFPwnSE=;
 b=hYwaVIszd2RuykHTL5KdXJ9zfQnjr6aWLj4NwCfF0ol4dJZuHX4vCca4b6BWa2I86izYnA8KvTIP
 OhwpBiIsDbYB19eTJQjEYdIBWKFxXd0VwKn+1GMK+DG5i5t6OKnb
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
Subject: [PATCH v2 0/2] link with -z noexecstack --no-warn-rwx-segments
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Fangrui Song <maskray@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nick Clifton <nickc@redhat.com>, axboe@kernel.dk, brijesh.singh@amd.com, hpa@zytor.com, 
	kirill.shutemov@linux.intel.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, michael.roth@amd.com, n.schier@avm.de, 
	nathan@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com, 
	trix@redhat.com, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Users of GNU ld (BFD) from binutils 2.39+ will observe multiple
instances of a new warning when linking kernels in the form:

  ld: warning: vmlinux: missing .note.GNU-stack
  section implies executable stack
  ld: NOTE: This behaviour is deprecated and will be removed in a future
  version of the linker
  ld: warning: vmlinux has a LOAD segment with RWX permissions

Generally, we would like to avoid the stack being executable. Because
there could be a need for the stack to be executable, assembler sources
have to opt-in to this security feature via explicit creation of the
.note.GNU-stack feature (which compilers create by default) or command
line flag --noexecstack. Or we can simply tell the linker the production
of such sections is irrelevant and to link the stack as --noexecstack.

LLVM's LLD linker defaults to -z noexecstack, so this flag isn't
strictly necessary when linking with LLD, only BFD, but it doesn't hurt
to be explicit here for all linkers IMO. --no-warn-rwx-segments is
currently BFD specific and only available in the current latest release,
so it's wrapped in an ld-option check.

While the kernel makes extensive usage of ELF sections, it doesn't use
permissions from ELF segments.

Broken up into 2 patches; one for the top level vmlinux, one x86
specific since a few places in the x86 build reset KBUILD_LDFLAGS.

Nick Desaulniers (2):
  Makefile: link with -z noexecstack --no-warn-rwx-segments
  x86: link vdso and boot with -z noexecstack --no-warn-rwx-segments

 Makefile                          | 5 +++++
 arch/x86/boot/Makefile            | 2 +-
 arch/x86/boot/compressed/Makefile | 4 ++++
 arch/x86/entry/vdso/Makefile      | 2 +-
 4 files changed, 11 insertions(+), 2 deletions(-)


base-commit: 15205c2829ca2cbb5ece5ceaafe1171a8470e62b
-- 
2.37.1.559.g78731f0fdb-goog


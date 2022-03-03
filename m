Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D17A
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 09:06:53 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id z10-20020a634c0a000000b0036c5eb39076so2467338pga.18
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 01:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=2bQdkuF0SOPnoGthP45kPV6bs5nvMHTPUBqrBi7KDmE=;
        b=CwcLSYEWIYkwRIiSSoxKp+6DeCkwVywNCvkORnPKqsNTneqEIEtKoa1z3mwpqSO5W4
         C4EHKgRYdUXjCIOSBiph61mK8NoMu3VVGZdQoh1vzbAAj6PmbcMhAyb+4ErMMn/svnDL
         FP8rthWhTrzh2Va1j3Zfzp+FYQz4qCJD1gVJd7MbjNd/ghRt2JDE69B0eP4rYOZJWtNk
         iy8+/9w5gmFETfLE9rVgJeZuSKmAoHiJKgxbZtHPkGMaD2ChCzD6jJS3mXJoVYXdg2Zb
         Nn0/DhX7zv8c3bY7H6zzF0hk+Q/LD8THdUGTyGynCcth2eoJxJBm37j1FQ/tcNYb/tBi
         a+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=2bQdkuF0SOPnoGthP45kPV6bs5nvMHTPUBqrBi7KDmE=;
        b=ZT/DQ9Gm2ktWmlbegDeRRvU9LaYAPqFV/nAShpeQ0YqSIeVar90u8eziLsdNTLkJ7/
         nSjPNw+mFi5LtANqlG7ownWDxAm041r/welmY91AI9jqttSp5aHkDLlXsxR2lI821cec
         ItdN7V/R4ZFSNkYu2gon6i7zsPnNuJiq1lgKb8zGTGARCHgnWgIUF8sA9yYtU9ofDnlZ
         T8w7b+BhPea/0qIZ2oGmb+itVAs9RWZ7JDZTTUVZmU58oGRonGyq5ZqVMWyaj0exl7M7
         R1iA9qZQt7+KjfeFNH2glCVpEWVOYJVVNBHBA1rlzjHXhbdBLgAx5Q1brgfHwlN4xjaS
         FVZQ==
X-Gm-Message-State: AOAM530LMeIL5j/YF49gk+MMRe4BWLeYJhSSiwceMMIw3zLGW2ukhOgY
	iLskiED7Xx8P8lWWXKo7F7qad0tm+7ne7g==
X-Google-Smtp-Source: ABdhPJxF438b/WEu22WxHZgv3A03n8SRdHWfJx5cX+REUymSJzQW01Ac5BTggzKnp1cW4D9MmVLPr1IGpLealw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:90b:4b52:b0:1bc:b208:dc5c with SMTP
 id mi18-20020a17090b4b5200b001bcb208dc5cmr1023750pjb.1.1646298411425; Thu, 03
 Mar 2022 01:06:51 -0800 (PST)
Date: Thu,  3 Mar 2022 17:06:42 +0800
Message-Id: <20220303090643.241747-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH] um: clang: Strip out -mno-global-merge from USER_CFLAGS
From: David Gow <davidgow@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: David Gow <davidgow@google.com>, Jeff Dike <jdike@addtoit.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-um@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The things built with USER_CFLAGS don't seem to recognise it as a
compiler option, and print a warning:
clang: warning: argument unused during compilation: '-mno-global-merge' [-Wunused-command-line-argument]

Fixes: 744814d2fa ("um: Allow builds with Clang")
Signed-off-by: David Gow <davidgow@google.com>
---

This warning shows up after merging:
https://lore.kernel.org/lkml/20220227184517.504931-6-keescook@chromium.org/

I'm not 100% sure why this is necessary, but it does seem to work. All
the attempts to get rid of -mno-global-merge entirely have been met with
skepticism, but I'm guessing that it's not a problem for just the UML
"user" files, as they shouldn't(?) interact too much with modules.

 arch/um/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index f2fe63bfd819..320b09cd513c 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -75,6 +75,10 @@ USER_CFLAGS = $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \
 		-D_FILE_OFFSET_BITS=64 -idirafter $(srctree)/include \
 		-idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__
 
+ifdef CONFIG_CC_IS_CLANG
+USER_CFLAGS := $(patsubst -mno-global-merge,,$(USER_CFLAGS))
+endif
+
 #This will adjust *FLAGS accordingly to the platform.
 include $(srctree)/$(ARCH_DIR)/Makefile-os-$(OS)
 
-- 
2.35.1.616.g0bdcbb4464-goog


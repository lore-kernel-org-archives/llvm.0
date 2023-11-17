Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C34E545
	for <llvm@lists.linux.dev>; Fri, 17 Nov 2023 19:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EwmdE9/O"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-da2b87dd614so3100910276.2
        for <llvm@lists.linux.dev>; Fri, 17 Nov 2023 11:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700249045; x=1700853845; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HSTC7ZIhM+0E3YkZ4H2RZYaJJgTVqQ3IlDSCu47AzCU=;
        b=EwmdE9/OBA2wYLdD9VxeFLy7jI8KrQnMKl5GznBtMw5Q8UQ5meOepPttcCNqibOYda
         NT1pKtCinCUQStb1oDXHOpn6r7G80gpuRJsbet5joS7GCWAkj7wSGKPvt8GHeUYw0tfh
         Jfy17RD0jfLQzdQgeSIYYpzYp7r4DlZYbPuZBEzVo++n6f2zsxtkIbiU0BL5jXtx4v3q
         PCUkAqZE3UNARmaXSKpibQwDPcDdQFODbeJeDHiBXKb3CAtaGY9zRS+PmJcTYpOEKnXc
         WMRrvvmWDgBuakVLrJi6jOTBf5eXAESjbgC18OQPbqvVbFWvOXNILn/oZaa9zwcVyVF7
         h+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700249045; x=1700853845;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSTC7ZIhM+0E3YkZ4H2RZYaJJgTVqQ3IlDSCu47AzCU=;
        b=Q3yGF8G9ZJFRIOq5t/dzPPnU0g19pTeVxG2cD4FXgGZNv2HBNnsgw21n+jLJd++0Su
         0ckyRZlELnqLtULoMqNg3udWuH9Cj606zS4b4GInJP65zmVywFkKa0+rEKbrp47lQrd9
         0EjfSL3tDbKf+HezVWfPBN5tRYlFc6yIRBCEjXdbJnDyrCeMJxSjqd8YHcIn3Km/fPWf
         LjtublpeJnjzazipR8vUA4P278ub4XCgbT2wvGBmMhfU9xlIPNTuYqbBoZR5p+opkqZ3
         4M/4IEty2LNtHc8DBkqdaY3iJnHwKieKyilg1twi4cFEgO71pvUUnCpvWoFGUN3586Sv
         I2CA==
X-Gm-Message-State: AOJu0YzI+GBBvjw/sJxZzDQYX2RJep02L5dRsPAOJuEKDn16WM9cYgnZ
	I1b3Yg9Xy0p0CloByqrwuGc2ByVb5lhfxyV8ct0=
X-Google-Smtp-Source: AGHT+IF5ejdZ1RJrFSKBwDFrAUrVQQyZZ2P+eh4NOyuZHdmvdsPLA+z6m9r5fxOFPVoeQ9q7OoWN5o2siXIJJlF6AfQ=
X-Received: from ndesaulniers2.svl.corp.google.com ([2620:15c:2d3:205:a112:7ca7:75f7:b362])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:104:b0:daf:bf50:ff66 with
 SMTP id o4-20020a056902010400b00dafbf50ff66mr8516ybh.13.1700249045028; Fri,
 17 Nov 2023 11:24:05 -0800 (PST)
Date: Fri, 17 Nov 2023 11:24:02 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANK9V2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQ0Nz3dzEzLwSIE4tKta1sEhNTDZJNjAySTRUAuooKEpNy6wAmxYdW1s LAKDfkHFdAAAA
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=eMOZeIQ4DYNKvsNmDNzVbQZqpdex34Aww3b8Ah957X4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700249043; l=3212;
 i=ndesaulniers@google.com; s=20230823; h=from:subject:message-id;
 bh=TJDc5k+AKhiQs6dI7oAGZ36HBYs5k33/muh2oeVUkG8=; b=KiNZlZN38egnPaIXbHlMC4o7eK/WY9b8im52Pymwi+jqpS1ynwZWkTtOOEDrikp8NnAv46gXk
 LkeOJFFtiA2DSuiqyRPsNZRUYnPZu6e9QRpncsHp1BnIx/pd3mC7cVH
X-Mailer: b4 0.12.3
Message-ID: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
Subject: [PATCH] MAINTAINERS: refresh LLVM support
From: ndesaulniers@google.com
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

As discussed at the ClangBuiltLinux '23 meetup (co-located with Linux Plumbers
Conf '23), I'll be taking a step back from kernel work to focus on my growing
family and helping Google figure out its libc story. So I think it's time to
formally hand over the reigns to my co-maintainer Nathan.

As such, remove myself from reviewer for:
- CLANG CONTROL FLOW INTEGRITY SUPPORT
- COMPILER ATTRIBUTES
- KERNEL BUILD

For CLANG/LLVM BUILD SUPPORT I'm bumping myself down from maintainer to
reviewer, adding Bill and Justin, and removing Tom (Tom and I confirmed this
via private email; thanks for the work done Tom, ++beers_owed).

It has been my pleasure to work with everyone to improve the toolchain
portability of the Linux kernel, and to help bring LLVM to the table as a
competitor. The work here is not done.  I have a few last LLVM patches in the
works to improve stack usage of clang which has been our longest standing open
issue (getting "rm" inline asm constraints to DTRT is part of that). But
looking back I'm incredibly proud of where we are to today relative to where we
were when we started the ClangBuiltLinux journey, and am confident that the
team and processes we have put in place will continue to be successful. I
continue to believe that a rising tide will lift all boats.

I identify first and foremost as a Linux kernel developer, and an LLVM dev
second. May it be a cold day in hell when that changes.

Wake me when you need me.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 MAINTAINERS | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 482d428472e7..1e6692697167 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5076,7 +5076,6 @@ CLANG CONTROL FLOW INTEGRITY SUPPORT
 M:	Sami Tolvanen <samitolvanen@google.com>
 M:	Kees Cook <keescook@chromium.org>
 R:	Nathan Chancellor <nathan@kernel.org>
-R:	Nick Desaulniers <ndesaulniers@google.com>
 L:	llvm@lists.linux.dev
 S:	Supported
 B:	https://github.com/ClangBuiltLinux/linux/issues
@@ -5091,8 +5090,9 @@ F:	.clang-format
 
 CLANG/LLVM BUILD SUPPORT
 M:	Nathan Chancellor <nathan@kernel.org>
-M:	Nick Desaulniers <ndesaulniers@google.com>
-R:	Tom Rix <trix@redhat.com>
+R:	Nick Desaulniers <ndesaulniers@google.com>
+R:	Bill Wendling <morbo@google.com>
+R:	Justin Stitt <justinstitt@google.com>
 L:	llvm@lists.linux.dev
 S:	Supported
 W:	https://clangbuiltlinux.github.io/
@@ -5242,7 +5242,6 @@ F:	drivers/platform/x86/compal-laptop.c
 
 COMPILER ATTRIBUTES
 M:	Miguel Ojeda <ojeda@kernel.org>
-R:	Nick Desaulniers <ndesaulniers@google.com>
 S:	Maintained
 F:	include/linux/compiler_attributes.h
 
@@ -11516,7 +11515,6 @@ F:	fs/autofs/
 KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
 M:	Masahiro Yamada <masahiroy@kernel.org>
 R:	Nathan Chancellor <nathan@kernel.org>
-R:	Nick Desaulniers <ndesaulniers@google.com>
 R:	Nicolas Schier <nicolas@fjasle.eu>
 L:	linux-kbuild@vger.kernel.org
 S:	Maintained

---
base-commit: 6bc40e44f1ddef16a787f3501b97f1fff909177c
change-id: 20231117-maintainers-88eac4c024a1

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>


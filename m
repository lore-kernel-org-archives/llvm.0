Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4867F2D6E74
	for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880208; cv=none; b=NMztSMHe3qhqxJAoMDX7tFQkVz0xmtQNtTg5zGFL5WXN4Th1Ku3OOcLOJMPojWrM9t5G+eove+oqAeHPHcfOldhlsn1cwSOOjK8LBp6DMwTSq3nBWmTH5qZ7F1kKcbbnbh1I9U9lki/Lgkkz5NBG7kG5XOGEItshEw9QsCJyApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880208; c=relaxed/simple;
	bh=VqUJYBQ58C6qrQny/zWlKznvS902o/Vd6kRWwwqFUDI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BeFtyPGABM4WoTTr8lqbUlcWf9iSR+qKqMcAtNg2ahGLEZsE1XFFyjum2/nC5Wv5uLfDZWETgwT51ZavYFGjCXIlTVB285+otMkH9CSHmjxSZUrBJbCicJyxR1lZhz6snymV4MAb68fvvQRH6ZtuDbEY/AIxk8G9kqTHP6jBA4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JPDe4pA/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JPDe4pA/"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4779da35d27so40675375e9.3
        for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 02:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765880204; x=1766485004; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SlEUOGv/EDetzTwSEetx6NPNK55ugxU1ppzq0yQMVTI=;
        b=JPDe4pA/PiTn2qQVCCq+A+FHGMvl5OgFA9Go58rGt3JTrz8LQ5WGa9nP260TWHuEml
         CVxQlHq73PX6cuajsek6hCveGitO3aFJw5TY+8vZ/7i/XMQMzxitBbwlWGYcg+cURdGy
         IQir8YehMgRXZndEDODvVQNYMpZfVU+A5vni/pHIgczs3dJVItPQCAxOICssQ5U8gdx5
         sPzdhwyPH0M/o7GNNzXBwMnyqAQCmvH3d7mIZYnmC4xx5WC4L4iFoan5yoT7c4ueVuc1
         GhO+8m4851hI6tCC8y4hyqX/t5n35DTR5g136ET2rg+ldbFkkMfZhqujSvFIM0lhPVr3
         m0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765880204; x=1766485004;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlEUOGv/EDetzTwSEetx6NPNK55ugxU1ppzq0yQMVTI=;
        b=GzDr8dGTEoplXBSjm31KGcgRbZPcNDmz4qCIkMivvjw70J15EBgmYUsSxzzZo8fOVT
         3xxpSpc2KfzRBWF6PmDAjZ+Ao2KizRpyrjQPQAYU/r5I4Ba5dqZYhNENWOKDbltXjTVS
         TxIOVbL4xMgGQbJJbYmD0+Gug4ZDgI7NqTFLuDLuV4DUF/vYNinKDBe7gN9qh52UbE1d
         jlv9BoVqzbXEAdlWgzeSv22BwxqyAfcSKWnpvh4y9ug0XNGDT9Y+ou9uAAS3401RXACU
         ZxOn7G7Z5ONlSOCWqas43p3tiX/Skt0aVVina8bHjNEG37WwkOYoJ6iAfZKsO0Wvlois
         OWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVdZhO78nD4s3Ql7IHjikEskohlfmChejkT1JmkWbxEKEG2JunF5RXmvfTMs1QebrqCrMU@lists.linux.dev
X-Gm-Message-State: AOJu0YzKyRC/ziQ3l/EiYKdYIog+uIHEcb17TbJF79H1oiW0mNr+YJCA
	ZdM2fLohan7t4QJO/i54xR4k25jtfS4CS5s2hN7Zo2B9LRXDVFjLpiWX7i8eh1C2xLOC2bSdgYW
	N2/8msRxQwnQWFQ==
X-Google-Smtp-Source: AGHT+IEafnTidOwtlDOnt4txDFlVXSaILOGXG2Jd4diG6s8MlXycmep5WaGPGMc+gxevRQxs0TKButnianxzxA==
X-Received: from wmbjv26.prod.google.com ([2002:a05:600c:571a:b0:475:dfb5:f4be])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b86:b0:477:9cdb:e32e with SMTP id 5b1f17b1804b1-47a8f8bd865mr152390625e9.9.1765880204557;
 Tue, 16 Dec 2025 02:16:44 -0800 (PST)
Date: Tue, 16 Dec 2025 10:16:33 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIExQWkC/33NQQrCMBCF4auUrB1J0kRbV95DXNQ4SQdqUpISl
 NK7m3alIC7/B/PNzBJGwsRO1cwiZkoUfIl6VzHTd94h0L00k1xqIXkDzoQM5AfyCD6QT1MEoTU
 3FlEpbVi5HCNaem7q5Vq6pzSF+NqeZLGu/70sgMNB1kY1ptNHoc4uBDfg3oQHW8EsPxChfyNyR azg/NYq27XtF7IsyxvFNED0/AAAAA==
X-Change-Id: 20251208-gcov-inline-noinstr-1550cfee445c
X-Mailer: b4 0.14.2
Message-ID: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
Subject: [PATCH v3 0/3] Noinstr fixes for K[CA]SAN with GCOV
From: Brendan Jackman <jackmanb@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Marco Elver <elver@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

As discussed in [2], the GCOV+*SAN issue is attacked from two angles:
both adding __always_inline to the instrumentation helpers AND disabling
GCOV for noinstr.c. Only one or the other of these things is needed to
make the build error go away, but they both make sense in their own
right and both may serve to prevent other similar errors from cropping
up in future.

Note I have not annotated !CONFIG_* stubs, only !__SANITIZE_*__ ones.
That's because for global settings (i.e. kconfig) it remains a bug to
call these stubs from the wrong context and we'd probably like to detect
that bug even if it could be eliminated from the current build.=20

Concretely, the above is talking about KMSAN, i.e. stuff like
instrument_copy_from_user().

Other than that, I think everything in include/linux/instrumented.h is
covered now.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
Details:

 - =E2=9D=AF=E2=9D=AF  clang --version
   Debian clang version 19.1.7 (3+build5)
   Target: x86_64-pc-linux-gnu
   Thread model: posix
   InstalledDir: /usr/lib/llvm-19/bin

 - Kernel config:

   https://gist.githubusercontent.com/bjackman/bbfdf4ec2e1dfd0e18657174f053=
7e2c/raw/a88dcc6567d14c69445e7928a7d5dfc23ca9f619/gistfile0.txt

Note I also get this error:

vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3b: relocation to !ENDBR: =
machine_kexec_prepare+0x810

That one's a total mystery to me. I guess it's better to "fix" the SEV
one independently rather than waiting until I know how to fix them both.

Note I also mentioned other similar errors in [0]. Those errors don't
exist in Linus' master and I didn't note down where I saw them. Either
they have since been fixed, or I observed them in Google's internal
codebase where they were instroduced downstream.

Changes in v3:
- Also fix __kcsan_{dis,en}able_current()
- Link to v2: https://lore.kernel.org/r/20251215-gcov-inline-noinstr-v2-0-6=
f100b94fa99@google.com

Changes in v2:
- Also disable GCOV for noinstr.c (i.e. squash in [0]).
- Link to v1: [2]=20

[0] https://lore.kernel.org/all/DERNCQGNRITE.139O331ACPKZ9@google.com/
[1] https://lore.kernel.org/all/20251117-b4-sev-gcov-objtool-v1-1-54f7790d5=
4df@google.com/
[2] https://lore.kernel.org/r/20251208-gcov-inline-noinstr-v1-0-623c48ca571=
4@google.com

---
Brendan Jackman (3):
      kasan: mark !__SANITIZE_ADDRESS__ stubs __always_inline
      kcsan: mark !__SANITIZE_THREAD__ stubs __always_inline
      x86/sev: Disable GCOV on noinstr object

 arch/x86/coco/sev/Makefile   | 2 ++
 include/linux/kasan-checks.h | 4 ++--
 include/linux/kcsan-checks.h | 8 ++++----
 3 files changed, 8 insertions(+), 6 deletions(-)
---
base-commit: 40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
change-id: 20251208-gcov-inline-noinstr-1550cfee445c

Best regards,
--=20
Brendan Jackman <jackmanb@google.com>


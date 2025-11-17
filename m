Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7A027CCEE
	for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 11:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763377883; cv=none; b=lQ4o+bdLv5tIg8mF0wexOz5soORgq1nGdu2sGXfIBKDqxWH0GikN+JYWLimO9XQJJ6OwOJEwNfL4mqzmNIyiBF6i5RXrXvUo7gwpBVLAyvUwAHPdejMqIiAOwYKV9A1fikHAxlTtgwjV0EUr4Px5K8JZ5Vc1/FA93FtL6Cm6iGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763377883; c=relaxed/simple;
	bh=yy3ttJfthnlit7qq/XjBi9+6yy9msg19mI7l/XmPIcY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Caz++aPEsM33ajg4dSU5SU5XKKz4fmjgySCq1D4g1GP4AmCZ2fXVEHNrnhNqmBn96epQxhfOD/mNupjuy4TzfL7Oes4QyhGgcIGcqoa3jxvwTI24K1Y/d1T13FoT4ZU3ecdtpMiN0dHFbIgWkhee9z+5bMwjRwiyaFo2Nnvfcqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rLOl8Iv0; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rLOl8Iv0"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b733b21a138so452173566b.1
        for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 03:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763377880; x=1763982680; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1dBVArd7mJYSTmCE5f6B8F4uwfft+tMBK80V9wiJXm4=;
        b=rLOl8Iv0MbuX1ZHTrpZrIZX1kBDfJBt34TqHr12rQ8Wb7uUwp+55n50CcyjgeEBXW0
         JGSHL32t4E54HYCxLDzxRcpuOI3hPHgXvT7BWhL9WWK/frXxzV6xjsUXuWp1ZFmGpcD+
         IBLH5Zc8czCsV5/GTQN7fQktaTHw9e1wr8YFDA/p146S06JJg/xtKyEXqcF1qOFhgL+z
         yNbyZEbe4Zok57o5n8uPjxzBiUhJt2xcC4bURT4Eim+e7HUyvulckeasPbkcbN0v38aW
         oO9J6lIWK+6s18r285EunVPEvQNNDpH7VakuG4VKUFK+2awmRmHO+lM8kbWcltJgLkov
         1YjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763377880; x=1763982680;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dBVArd7mJYSTmCE5f6B8F4uwfft+tMBK80V9wiJXm4=;
        b=aRbwk/cBxbcfTyub4FvnSXuJWDaUyFOWuOOkiO7H7vi6lPMiaaWen3gKkkjtCGc8Hg
         4lhENZw755r2dNrmTIIX9YxrtMz4kq0E+awYDb7YMLrf5w7rRWLb2+h1/85AOBIQWR7D
         OBx6GIaGSAazESSd11Bj8mQxB/rYZZhydIEJkwj9SXAAzq6/g8RFuPrviAib1atigkbr
         1ntaAHslzZzcfPtbHM7OcqH5Eyoeu74Ya+4aWwriCBD0uq1JEvm6lmqEgQ1O2me4i2WK
         X5BonZqx8mg5bYHdaptUTXJSfxHTWKK+HftYG0fmtpYET1xdQLfrTFU1TnW5IpP27cba
         EB1w==
X-Forwarded-Encrypted: i=1; AJvYcCXrtkXhh2bqyV4eJjFL60vAs9VYJsNrdIbR70tSCgi4dLhLX2KyIrP4AqwC3oKiGoesHUr7@lists.linux.dev
X-Gm-Message-State: AOJu0YwEaRG+zHvDYVi+JSOee9fEFVVpwlDcm1vwjDbZb861sivICYVr
	at8YwT3xTN4QieYS93/F4GR2jpOjGqkW2kBuDXwE7KXxB2JNr0mseLi4SodI11CFsIbd777M49K
	ZJ2WrOxe4uk08gQ==
X-Google-Smtp-Source: AGHT+IEGS45z0l+hi3ZO/M7TNdz92Zhrot8CzIWSAC9H6KdJexA/+kgMYEwfvduedhwP/3cl1ubRuic7XN8dgg==
X-Received: from ejczi12.prod.google.com ([2002:a17:907:e98c:b0:b72:41e4:7568])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d92:b0:b72:614a:ab56 with SMTP id a640c23a62f3a-b73674ea2e1mr1014523866b.0.1763377879966;
 Mon, 17 Nov 2025 03:11:19 -0800 (PST)
Date: Mon, 17 Nov 2025 11:11:17 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANQCG2kC/x3MQQqEMAxA0atI1gZMmVH0KuJC06gRMdJKEcS7T
 5nlW/z/QJSgEqErHgiSNKodGVQWwOt4LILqs8FV7ktEDU4fjJJwYUto03aZ7ejmmj21DfuWIZd nkFnv/7Uf3vcHw1fU62UAAAA=
X-Change-Id: 20251117-b4-sev-gcov-objtool-2f6cd197cd9c
X-Mailer: b4 0.14.2
Message-ID: <20251117-b4-sev-gcov-objtool-v1-1-54f7790d54df@google.com>
Subject: [PATCH] x86/sev: Disable GCOV on noinstr object
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

With Debian clang version 19.1.7 (3+build5) there are calls to
kasan_check_write() from __sev_es_nmi_complete, which violates noinstr.
Fix it by disabling GCOV for the noinstr object, as has been done for
previous such instrumentation issues.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
Details:

 - =E2=9D=AF=E2=9D=AF  clang --version
   Debian clang version 19.1.7 (3+build5)
   Target: x86_64-pc-linux-gnu
   Thread model: posix
   InstalledDir: /usr/lib/llvm-19/bin

 - Compiling from tip/master at 6f85aad74a70d
   =20
 - Kernel config:

   https://gist.githubusercontent.com/bjackman/bbfdf4ec2e1dfd0e18657174f053=
7e2c/raw/a88dcc6567d14c69445e7928a7d5dfc23ca9f619/gistfile0.txt
   =20
Note I also get this error:

vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3b: relocation to !ENDBR: =
machine_kexec_prepare+0x810

That one's a total mystery to me. I guess it's better to "fix" the SEV
one independently rather than waiting until I know how to fix them both.
---
 arch/x86/coco/sev/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makefile
index 3b8ae214a6a64de6bb208eb3b7c8bf12007ccc2c..d2ceae587b6c30b2fb17209a742=
6e7893dea988c 100644
--- a/arch/x86/coco/sev/Makefile
+++ b/arch/x86/coco/sev/Makefile
@@ -8,3 +8,6 @@ UBSAN_SANITIZE_noinstr.o	:=3D n
 # GCC may fail to respect __no_sanitize_address or __no_kcsan when inlinin=
g
 KASAN_SANITIZE_noinstr.o	:=3D n
 KCSAN_SANITIZE_noinstr.o	:=3D n
+
+# Clang 19 and older may fail to respect __no_sanitize_address when inlini=
ng
+GCOV_PROFILE_noinstr.o		:=3D n

---
base-commit: 6f85aad74a70d17919a64ecd93037aa51c08698d
change-id: 20251117-b4-sev-gcov-objtool-2f6cd197cd9c

Best regards,
--=20
Brendan Jackman <jackmanb@google.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789439;
	b=WAfSq0wQQtxvW1Z8uuB/IAii3ATCNFFHzbVPC6KDp267Oo9J8cYsomBtpW2xPcfXlu5C
	 E0PNm7DGZ+zxCQEUIh5I7XGEagZLjnpeAzhHP6NfHig3JAiSZ17ql4Cv6Vde9xj8ZpfKq
	 MskXj0GR/xwtZ+tgnxeQVX9nJ3N2ijWmz4CGPiZNbR0c8FOo6bsgnnFgZew5Gbo7/K0s8
	 scDgv8FrflExb3tzox5D973DCWkKCE4LcPeEoqWov2Je5Yc4vukCApPQgYhzYBGe5TSVH
	 m4OCuvIKBAvTByHwthy8bpFkXwGkxlF5rVIQS6otdcly+5RDItqd3Ve7R4UzyHsfNDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:Subject:
	 From:To:Cc:Content-Type;
	bh=Nr4GHdi8TuNIIYYptR82W4hGTIpm1KHzw93c/HPqhLo=;
	b=LDP6rrgc3D3amnjC3bjneoor0GNgBiG4L8K3QYy9505Rqf0r3O4dQAX7Rw+tAvPhSn62
	 L7e6lHTOwOgYPizVTBeP1xqcTZ2fNXj9/jjKK3JlSezWTDQbEkag7aftpLV2/zETzZr+3
	 iIGAC5URguARzROtp17bYGzg8MOCN3UHMk0A/GARF0mQhDi9GTuyQQZRNqcm3NfSbigtU
	 nZNLS/+ifr6sIT4nKsFOKWyTQCAzyx5Bd1AQU7e4NpYFdRLt7qATUpRnWhFvXVAdjCsWm
	 lsK+pkOTOQUzHSdrMpAigxaMPyqDuRujorPo5EYP/8k68ndUP2DtK9omcdEz1CgnLpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hGjbUMMX;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46491606A31C
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 14:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46491606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hGjbUMMX
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b3f6d9827eso1616419a12.2
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 06:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795789438; x=1796394238; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nr4GHdi8TuNIIYYptR82W4hGTIpm1KHzw93c/HPqhLo=;
        b=hGjbUMMXojX2Jm5ZqHtE2wNcMndVyBulDKtm1kvy80W8Gc9heyjCWN3A2KWLDoni6u
         spwFXJChNSOe2zX/JTdkcKMaSJHlTL935pXkQ70IUubNfObMzVBdtPGzXf1mfMjwlwVp
         qXoqCdvo+kRSJwL5uR+rl9gt/8EtMGzdh0bOCwaKzC9DALgtNygu4dj80sQRBtn5peBc
         MFdWCScsWHsjGTia8z6uwqyQ9TDgCO9agQ3tARftRkZs96sWbhYURkNOOn3AphLlES3Q
         ifxmJZvkQzgVsiLgM3wqjWFycWnrTVKOA6oTQyQp8M67NDtt10KE+Pkxx2EfYp7O2sVw
         gFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789438; x=1796394238;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nr4GHdi8TuNIIYYptR82W4hGTIpm1KHzw93c/HPqhLo=;
        b=AAzxNT0FOKDRy6dVfBMZTk13F3TjGP3rukhRdqMylC/dhWv+OMs3mWgTynttrakF6M
         XTBMx8dZ3LbmSaORgi5v96c7fwQuvHLMJkbIT3yZ7ix0sWHkPeh05N4Ios3rTIMkHyBU
         AyfQ/MlIU5Eshzr0yfL1yQF9jCfzB9zUfYwtrDtGN90RUolcFB2yd05bzmxnaECCuPFQ
         1/rbw5gJ2R9giNls5gpN6U1LS+vWSi3+46V7WroNNyVF5LjduWb1a++VmIoDURSXDx6S
         DtPZIa7R2jrSRG3/ZkBpf+DpNKhYg2AkWdagDS4sgMJeyJ7MZmwnVKjGGs2h8oG2Grr7
         U8JA==
X-Forwarded-Encrypted: i=1; AL+hErGpqcYNjWHwpdMDdAmybO23a3hxDl2+Sxd8lpmNZbabtrIWxlrqRaWnK+XimIgyUgJzMto+@lists.linux.dev
X-Gm-Message-State: APuU4Z+BgNNOuPL8sNl+wohebVawPK7F30Qpz9I5kta6zS0YXaRjNjae
	Hncn0/uawvksdLZToZcfAn67JjvXiGpX18U1cVAdyyqGueH4sTyIyb2m18ZEO49j6aY6P0b1VA=
	=
X-Received: from edqs19.prod.google.com ([2002:aa7:d793:0:b0:6ba:1277:9974])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1e8e:b0:6ba:5993:cec5
 with SMTP id 4fb4d7f45d1cf-6ba5993f458mr16315738a12.35.1795789436818; Fri, 27
 Nov 2026 06:23:56 -0800 (PST)
Date: Fri, 27 Nov 2026 15:23:47 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689; i=ardb@kernel.org;
 h=from:subject; bh=vU/fdwAiBRa6c+OuOUG6Wglb6aTzwZfj0yngfrJ3Py0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZtzUnHE15YDE+sKeLpumrVN02Zszj8hf+2hidvCtln3R
 NdN1VfoKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNh/8PwP01aL0p9oaiew62s
 h+v6Re6yLopRuVVf/3mZSOaFsBRbEYb/IT4PNcPjrG10XSW263//1dqyYmURe9LlhmksT4q2XeV hBAA=
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127142346.788995-4-ardb+git@google.com>
Subject: [PATCH 0/2] x86: replace stack cookie hack with named address space
From: Ard Biesheuvel <ardb+git@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Currently, on x86, the C name of the stack check cookie per-CPU variable
is deliberately different from the one passed to the compiler command
line option -mstack-check-guard-symbol=

This was done to work around a Clang issue, where a non-TLS C
declaration of the variable results in Clang dropping the segment
prefixes.

As it turns out, all Clang versions that Linux supports today have some
support for address space annotations, and annotating the C declaration
with the correct address space is sufficient to coerce Clang into
generating the appropriate prefixes for the memory operands. This means
the linker and asm hacks can be dropped.

Patch #1 makes EXPORT_SYMBOL() work as expected for symbols with an
address space annotation, so that patch #2 can export __stack_chk_guard
normally, rather than from an unrelated .S file.

Cc: Uros Bizjak <ubizjak@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev

Ard Biesheuvel (2):
  compiler.h: Use the symbol's own pointer type in __ADDRESSABLE()
  x86/stackprotector: Use a named address space for the Clang stack
    guard

 arch/x86/Makefile                     |  2 +-
 arch/x86/entry/entry.S                | 14 ----------
 arch/x86/include/asm/asm-prototypes.h |  4 ---
 arch/x86/include/asm/percpu.h         | 10 +++----
 arch/x86/include/asm/stackprotector.h | 29 ++++++++++++++++++--
 arch/x86/kernel/cpu/common.c          |  4 +--
 arch/x86/kernel/vmlinux.lds.S         |  3 --
 include/linux/compiler.h              |  4 +--
 8 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog


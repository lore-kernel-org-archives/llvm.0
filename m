Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670786;
	b=zGuhNkVzWwBlyOpP6/O4Mp7huqagcQpgRfqrYBOL7KYUDCciH1vLPPhbNQUi4qzfJd6D
	 oVSfcI6NAmQoQ71RKGhSDq93nZTAF2HZqcz74r09ioDSC7Qi5nLh5fB2hFO8ZJ4mzsEnr
	 JCOg0/w2NxbTIAL2CymMWeDP/pdd/QFQ+rZdcfzQt3JGamFwcVjew9+KjId8ksyDh+w4k
	 9/e4WcTfjAP65fusuwlDLJ06APyqkzXusXke4ShT2CXZxD6f+FZkothfiHWY6ueiKbRgh
	 NbtbpXbO82dIOXNxLCeQwbEkEz5ot2RtgGBZxhL7HmZzIGrYiOBJSFPEYsSwL2jHyxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670786;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cSlojCbDmCcyPb9HszRWK/S3WxHtRBj4sTOI6ybm4yk=;
	b=OGh/52YHYJZATe5niOgtveZGQ1HgM76HO1dJ/yAlSXNKocoA19AqMbhFsGlB3yuvTss4
	 Ce+O9YZNsvJm616hGgTwpe1spXqkfYuQYPuKJGyNpMQ6SqlGeEWoFk4biVZwJGveDLYCo
	 Zvy7QuQXemaJ9wZSLqRDJSXj9ygWq8UQjgGBt4FDeSLI+KZX8t91hPOqyzQlGU70RfGfH
	 PZhuwrsKFch8/IjyNIdWLuXLC7MBOeCpBNqvnGHcuOOowTSkA/SXkDvDXELaF0Zlhnh9m
	 UCuzIt0ByEpl/iXMePYBG5kHZ5OF2zycu6OaoTYOz8kx8+ujq/SZrNLFSDMVk/aKO7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lC3y9HFf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA6D606A32F;
	Tue,  3 Nov 2026 01:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lC3y9HFf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FAE1F00A16;
	Tue,  3 Nov 2026 01:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670785;
	bh=cSlojCbDmCcyPb9HszRWK/S3WxHtRBj4sTOI6ybm4yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lC3y9HFfwinAcWE/OZ9drxVUk2DneJEUSu+sbb80hp1gn0YujEB9vxw9oIm3h7kAH
	 c2kXWjYRdZhN+ZZuU80mZDxVwSZtjDxMUUrextVSvan/ytS1tGC0q3iVImgtAlI+kR
	 UzN1/nOxhy+sCzoOwxPwQJINlryB1qolsnbVZI5tSV5CLd5R/atf31judm4NGSUCKM
	 DQNWvZiN9aj9l0YNt4Y5faxUP3s+h3qP8LUMx3Eg6IDIkw3o+j2nqmpksakPiSIAP+
	 pjYgtlJMa3/tZ1DS3y09dWTW7UVSUZCfczHidLIFttWLLpqiOO2PjK/K7doeynd3oC
	 wQfZMFTPzavhA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Chuck Wolber <chuck@wolber.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Subject: [PATCH v2 12/20] x86/sev: Stop excluding noinstr.o from code coverage
Date: Mon,  2 Nov 2026 20:52:30 -0500
Message-ID: <20261103015238.3780910-13-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103015238.3780910-1-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

noinstr.o was excluded from gcov after Clang's gcov instrumentation
left calls to kasan_check_write() in __sev_es_nmi_complete(), and
because any coverage instrumentation would violate noinstr.

The GHCB accessors no longer call the KASAN and KCSAN checks, and the
noinstr attribute is now sufficient to keep coverage instrumentation
out of noinstr code, which objtool verifies. Drop the now redundant
exclusion and rely on the attributes, like the rest of the kernel's
noinstr code does.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/coco/sev/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makefile
index be4785d766ec1..fb8ffedfc8b0c 100644
--- a/arch/x86/coco/sev/Makefile
+++ b/arch/x86/coco/sev/Makefile
@@ -8,5 +8,3 @@ UBSAN_SANITIZE_noinstr.o	:= n
 # GCC may fail to respect __no_sanitize_address or __no_kcsan when inlining
 KASAN_SANITIZE_noinstr.o	:= n
 KCSAN_SANITIZE_noinstr.o	:= n
-
-COVERAGE_PROFILE_noinstr.o		:= n
-- 
2.53.0


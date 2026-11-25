Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572398;
	b=Ba1BE/5I3jMrWVGCIZ5C07WBCuadKT5xXoWN9shv1tneTHwL64Gr1FQFfvwNEipz6x4Z
	 BSdzPAGBn3W5il5uLSrjD6KmFlheqQvgRYqkcGqjmKj4CvSJTTZRIZcUFLGTLWscncHui
	 8uItchkNiF2StQoDeJMp3SkYWQAj22uqPzdh2+UVoAZcMTaUHdiGTBoNvogUXwNCIbheS
	 HtU1+Hyaz/0ItOWkYgEgJ/dgTWV3Bl+b7F+ESUijHwa/sxOECqA2FMsYr3nazITa1BUow
	 7k5rGFGmDRcka4xFs1uI8dZ1OfFUistXStsNNKXEIPsrM60Mo138U/Yov04/JYcY/9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572398;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=d6ZMaEzyitygojByFdppk7Kysha1qVDYWlMNB5Ja4vY=;
	b=J4UA0LrTswikXzLGwnOiVC7rXi5NTfQmjf6Yv8JXmRx7U4oo59XKuDdiTt6dJf5/IJqZ
	 jgvHx4nu1vWnWXjYLHh9cTi1fblwjSOhRsqbDl0mHy1QDr6tqIDJWkPfDgsLkRCuM25CO
	 6FS/7J0KqScxgnvehg3pnlbUlON3b4Ug5+n5GPI7b1iPUjT+8U7UDDi4KBuTYenZikdCS
	 7x2ni2SE7a+2ec7KXs6UeO8GCKWYNO5OS40Tolm6l62voqnCmwzjebG3Il5C+h1YUExYE
	 93FFQVC+V7s/N1692BgHCdY86AQ3QMmA8h4wUxNQvKNFhejALnFJarTBCrvUZo/qBhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjMiOH2l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF2606A687;
	Wed, 25 Nov 2026 02:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fjMiOH2l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E3C1F01566;
	Wed, 25 Nov 2026 02:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572398;
	bh=d6ZMaEzyitygojByFdppk7Kysha1qVDYWlMNB5Ja4vY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fjMiOH2lCnhP+fCKBfRksUIPCIRYsQ3d4wYifOQj54OCM4Zqh9dvkWzJuaZF2zBFV
	 6idwRhLTH6FPJZOkvI/D3dNFLR1Y33E3mwPxRCPUfAYe/qegGofy+mNCfbJjl0edBA
	 414TsG6rYUT+oMO0Ehp+RiCoQ8SUyw8CWMmEzK2mnr2pS8ym0g4b/YuaAw6SzZ+ryS
	 SR4G2RfdXlYc2h3uMMaMW/kzokjIpIl2OvZ0/2rwV/mWtS4RO4Rz1tfwqxGZjBlsFk
	 Nye0+CBQUcaQirvpXXel9gSkNaMD88nYqUCRcHVrkooe4fjX0gn/5F06rvULx2yQbj
	 VzcnlLUiHK4Eg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Chuck Wolber <chuck@wolber.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Subject: [PATCH v3 12/19] x86/sev: Stop excluding noinstr.o from code coverage
Date: Tue, 24 Nov 2026 21:05:56 -0500
Message-ID: <20261125020603.3934222-13-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125020603.3934222-1-sashal@kernel.org>
References: <20261125020603.3934222-1-sashal@kernel.org>
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

The GHCB accessors no longer call the KASAN and KCSAN checks, the
noinstr attribute keeps the functions themselves from being
instrumented, and objtool now removes the coverage instrumentation of
what gets inlined into them. Drop the exclusion, so that the file is
handled like the rest of the kernel's noinstr code.

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


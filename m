Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188874;
	b=WiaNJDJFcuXZO+w41jjlxV+QD7SSy+31/qp1B0izDsH5duy9xnfwfeberxriK1o2p9EQ
	 pr2CKPKCR4wWHrLY66LF2bVX1DMM7hjpv4nxvtjrM38p1PfpdJWvSD7c+xpA9p1e4+LRz
	 ouhG2HlqHPIMk9w3fwAkUCG1mRkug4ikRRFdfoVM4GAh+wUWz5Oau4VWjHCeDDb8S+BYk
	 TfrfYhYcUikO+y6gdxwoo5CyPsAS0UO/ZvlkqLeDX1hW0yCcdJvxMEo/QSwtRu8uOkUJg
	 BpLjE2ycwWiUo3N8Hwq+G4S4GSg0BfwM7Irve/xdn4M7YcAgrAXm7DqmiJfGQoDhIag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188874;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cSlojCbDmCcyPb9HszRWK/S3WxHtRBj4sTOI6ybm4yk=;
	b=5A2wIpit69fyPvIPh/zCegqptPHMR5Ceyl8ayxaCzcRr9zJPXi6bCexXk0BgMbwDO9+U
	 9u3OYV+zhkOP1y0TVCV4SmkuHVuHiZ/JKMUlWM0QKXiD0qk20X5hnnVp4Q1z1devanG/D
	 LCngBey+3uAeh+xjDXAyyULTaak9lKELNfkkXszE43Sm6cExKocPJG5aHSIzjeBV/R6kt
	 E8F1JXMdA50C/udf9/hnheckiUqdYoiyS7Za66Bvcg0xbVPDwaVzZdBGP2AMboFWaTo4h
	 EynTzqI2fjo0XQ42cSKKnVEobm5G+f0JglXlzHcYrh923bTfQenBVVB50UT6hRyNsbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iGZ9D+Pk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8672060A3803;
	Wed, 28 Oct 2026 12:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iGZ9D+Pk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358E01F031E8;
	Wed, 28 Oct 2026 12:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188873;
	bh=cSlojCbDmCcyPb9HszRWK/S3WxHtRBj4sTOI6ybm4yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iGZ9D+Pkc2DUT4QLn0VBJ4rMBrVDmOqbAJLpNSt9fb8bmcew1tA6QGqeYCgKOKX+g
	 i9wzNE7Hhy99F/WhkK2vLk3Zdeyw0mmQjvmDKvUXrRyphEeKcGEmmm34VGAcyrq+Ae
	 bPN8fFnU/qLMO7VHHnzsSFX16u3bAd3l1gsYabEStM+9jp6yZ0gzzdM4DRdIe44W1N
	 8ZxcBSSpN+MBhOSdLKXfasTZMJCEOKZJj6iQIlZqD+6EWDttLvvI3KkIls2MeJtA/A
	 gqCDJp7Z0zirb3PMj3iwD9cIN02kPYJ/lnnac7j9h5MSj/P+AA31pJBxEOG9aNi11r
	 f76m1k62fSZWw==
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
Subject: [RFC PATCH 12/20] x86/sev: Stop excluding noinstr.o from code coverage
Date: Wed, 28 Oct 2026 07:59:36 -0400
Message-ID: <20261028120034.871983-13-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028120034.871983-1-sashal@kernel.org>
References: <20261028120034.871983-1-sashal@kernel.org>
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


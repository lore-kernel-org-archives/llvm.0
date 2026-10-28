Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188857;
	b=gCnkOvAr1HBZ+wKa2molhy6TORkk+XzxqJyRj4vseuE10DlJ6VyrGW4H7s3eA1edfk/c
	 3dkiz/vS7GhLtSTDLUh9pC3rKxeH03uAIDgbkbm7UjfrVA+0Rh7lez6OE2W4euuq7ICda
	 hBiURSEzJw9wj1xN8CbwkU83eq4PFX2AX4ix9/nHe+FjMe/7GyS1WrOxstqozcCYli6VA
	 DlT8Y8tR6OoST5gfALYB/anAXiHh62x734AfRFY0Ir8SD4TrKb9is9uTlebM11I916JdU
	 gZ7F3Zi2bf2XYR0Y/ePD+pQcqiRlh9la1fqcRxtCTaDkyAiCgGKot8CkByml2KhsLEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188857;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oJvP74zHNa7esyHCIDWNPqM/NdxLIGO66drSeubOEBs=;
	b=vqnZtlSu1q4r9XRsQyGH83ruepCWDjOxgDjMB2fpxqZT5/3xcACQsgYoLBRmklX6biBc
	 n3wwkTNCZKJE4jyQ8MpWJDWl+gkVV2nUS4kx72wu/PJRRi6ktrFt0T47FmP63pOR/vusX
	 4XFyp8MM71kxGg0B8jmGIqnhudKjp4vRkc6uqcDARq0P+XAWxCNlGGsbCAIYn6Fd+W/SS
	 hQ++W34eo8H5CvZKgEXBxC6bLtujJK7gfS01UAxPf0qt2oBm5BxsbPQ/N/TNCqyaMGhBY
	 J56LIG9Edi7JklVOOVXeksDNMEGf5t18ryqAjBI6LLL3szJzfv6j9eKwmmfhaW3dpTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jvdg6KTs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E987606A32F;
	Wed, 28 Oct 2026 12:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jvdg6KTs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B471F01828;
	Wed, 28 Oct 2026 12:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188857;
	bh=oJvP74zHNa7esyHCIDWNPqM/NdxLIGO66drSeubOEBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jvdg6KTspsCqPfxsz0C/+J/411kIVC5qFq9KjU0FZRNSQvZe8odEw4P8EISwVKlAM
	 3+HaeeaKZ3rBJLBZokDVOAcb8vgy8NdLuORH9A8688I+Nhsof66tPcSnNLmZXf85gk
	 uep8ESRA6+cVtMDuLrOzYvT5FdqqN2Gvn8w46xi3xAUSoYC8yf2QEWnmZ/kPBLs4l5
	 bc2WZiiX6qEjv0uJFSPf0jxR9xCZD8IncLSNb2ckvxyVdZpuqSjflJ7wJaoYycGRF0
	 vUDdmWZGF8jobJ05wH5cW2W2qs9EJhhOETXa47sCWUfu4ztX9l2Wwl4oIlmRCLX7Ol
	 yA8al7AgDYsBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [RFC PATCH 04/20] compiler_types.h: Don't instrument __always_inline functions for coverage
Date: Wed, 28 Oct 2026 07:59:28 -0400
Message-ID: <20261028120034.871983-5-sashal@kernel.org>
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

noinstr code may only call other noinstr functions and __always_inline
functions. gcov and Clang's source-based code coverage insert their
instrumentation before inlining, so the instrumentation of an
__always_inline function ends up in every noinstr function it gets
inlined into. With Clang's source-based coverage on x86, 2500 of the
3449 relocations in .noinstr.text and 333 of the 451 in .cpuidle.text
of vmlinux.o point to coverage counters or MC/DC bitmaps. GCC's gcov
does the same. Since these are plain memory updates rather than calls,
objtool's noinstr validation doesn't notice them.

KCOV doesn't have this problem, as it instruments the code after
inlining and checks the attributes of the function that the code ends
up in.

Make __always_inline imply __no_profile when a code coverage
measurement implementation is enabled, so that no noinstr code carries
coverage instrumentation. The cost is that __always_inline functions
don't show up in the coverage data at all, including at their callers
outside of noinstr code. For an x86_64 configuration built with Clang 22
and MC/DC, that removes 556 of 60788 functions (0.9%), 29261 of 1598305
regions (1.8%), 11067 of 591108 branches (1.9%) and 445 of 36561 MC/DC
conditions (1.2%) from the coverage data.

Leave unoptimized objects alone: GCC refuses to inline an
__always_inline function across a no_profile_instrument_function
mismatch at -O0, and those objects don't contain noinstr code.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/compiler_types.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c5921f1390079..c3298d29a9425 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -246,6 +246,19 @@ struct ftrace_likely_data {
  */
 #define __inline__ inline
 
+/*
+ * noinstr code may only call noinstr and __always_inline functions. Code
+ * coverage instrumentation is added before inlining, so the counters of an
+ * __always_inline function would end up in the noinstr code it gets inlined
+ * into: don't instrument __always_inline functions. GCC refuses to inline
+ * across a no_profile_instrument_function mismatch without optimization, so
+ * leave the rare unoptimized objects alone; they don't contain noinstr code.
+ */
+#if defined(CONFIG_COVERAGE_KERNEL) && defined(__OPTIMIZE__)
+#undef __always_inline
+#define __always_inline inline __attribute__((__always_inline__)) __no_profile
+#endif
+
 /*
  * GCC does not warn about unused static inline functions for -Wunused-function.
  * Suppress the warning in clang as well by using __maybe_unused, but enable it
-- 
2.53.0


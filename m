Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670774;
	b=S+z6dg4oc0S1hRu9gEKTJmY7pRalMnIY1hH0pZm1NbHo2Dh7sejOH6Kuoaw10hl5z+cd
	 Tix2HeR+lNYiq92v75iDsgjDBzfbHqdmCKPPLatSSn8ASnCtFLjyq7B6ArmgMUMVFDjRY
	 CaTpgynQmxSSF9DMWuHIXK6AkmoZW1VOMywKfL6StgisXz2VpCaMUMq/C7gLLtyYiigeQ
	 EmlQF9oSnqXO+7gL9bWJv4QsXvx2i3N1UUxtGzFLCDUinta7sq/zlBdRBGwu2Xiz6djcx
	 Rdvb7hL4dxW665iHJMtq5VJkpmCGobwM6FqjXuhE9iv7g8nVu68oWqQdSrCALgzSVkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670774;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Y4i2DE+i8w1XbeOqn0nMAJFIa6mEhkdFz3surQorcJw=;
	b=sDk7zazK0Q/jDR6dsl4XCww6CgxxFXT6BDQS7Lfbi/IMuiohKs6gqdpJUHD1zmQXXOpB
	 A5+/P3nWiVBXsp81lxoCWii/AZuxnvxN12t8ZJYVzoo25g3wBFVhX06IrjM6nAECDTrVt
	 9rxh6WiWnoyNtqcGThulFyOxKT0NDQgN29sli9TK8WpgWboI7vqouEp6u5wi0p+ECNjRb
	 RNWWbp/1cOmxcl2Kyp5haimgjqe0eL6cyybgvwSwBZzWBAWvbxhOr5YBZnZ311qAPkf16
	 /+2dvNohrqm7NIeiCZLobQxAtt6aRvcSLQQ7kiEwlf9t3HLFNRhNCgAHMILvX7lYZUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUa1CpbI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C73606A326;
	Tue,  3 Nov 2026 01:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BUa1CpbI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B28E1F00A18;
	Tue,  3 Nov 2026 01:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670773;
	bh=Y4i2DE+i8w1XbeOqn0nMAJFIa6mEhkdFz3surQorcJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BUa1CpbIgQky/IIOW9E3DTP07V5hm8Q88O7YPtPslDTA1TykJp3slks8QFLCNj2z2
	 kwJti9BGwoOBu8Sn9oVXf+qOxdXlP1ZLZjIlpTrpaHUiDATlQiNv3vjDEKeQJcUo05
	 clVJ/TdL+V97V7uBxa0EXx8U/IvAi1SOKhvA010vgLM/7YNLit752Tl0r9rESVdGde
	 3qbk37fz4iZs3m1sjr+g0zaab8rsRj3xOvX/9R8DH63zIY6rU8s8r8ZPSi8SFVs4Is
	 hDctmpjHl8OB6qp2u2dQEgweQqH0lJ5AjF9kEw6Q7V4KkRHu658R0xmnGutWGkbYyM
	 R5/IxsK/DVXTQ==
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
Subject: [PATCH v2 04/20] compiler_types.h: Don't instrument __always_inline functions for coverage
Date: Mon,  2 Nov 2026 20:52:22 -0500
Message-ID: <20261103015238.3780910-5-sashal@kernel.org>
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

This works around a limitation shared by both compilers: they lower
the coverage instrumentation before inlining, and let __always_inline
override a no_profile_instrument_function mismatch, so they can't drop
the instrumentation that ends up in a noinstr function. Once they can,
this can be limited to compilers that don't.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/compiler_types.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c5921f1390079..5c8fff84004b4 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -246,6 +246,17 @@ struct ftrace_likely_data {
  */
 #define __inline__ inline
 
+/*
+ * noinstr code may only call noinstr and __always_inline functions. Code
+ * coverage instrumentation is added before inlining, so the counters of an
+ * __always_inline function would end up in the noinstr code it gets inlined
+ * into: don't instrument __always_inline functions.
+ */
+#ifdef CONFIG_COVERAGE_KERNEL
+#undef __always_inline
+#define __always_inline inline __attribute__((__always_inline__)) __no_profile
+#endif
+
 /*
  * GCC does not warn about unused static inline functions for -Wunused-function.
  * Suppress the warning in clang as well by using __maybe_unused, but enable it
-- 
2.53.0


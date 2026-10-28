Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205967;
	b=BR9kgqA1zug7hFuxJdTBJEc/fvRRiYymRKoNsLvNUK89NYQT8VwH0PHi0txhyaLLhr+y
	 2HtnApdqhZr5c9OibGrkUivbSSWqCGBYK0vgGu4Z1WgqGQKsF+OJS9EWmpjJCP6dKQxDO
	 XuqpHlTGHsi4a+irdbdCdKUSHEXemD8MWHvMj00lJXNLPr1b0xXMJ/NUfjs4e6OKzMt0k
	 gzIYXf2qiduvcbj+x6VaT61+WbjSn0DU9+1Yj77xlawCCWHXIKJYGHzeCOaMgEPrgXTFZ
	 PcHVyZGt6MegWSKf6UN0tMWsm/Qj8lEtdQcR5ymfrUmRNI/FvOQX2b00NvG133j34HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205967;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0UL87BPpz/Txn3nRYlhE0bstZ45VXoCY4R89vUK5fGY=;
	b=5cy3dzsg3yzk8bOm8NH7fx3BHC7WhPfHZHsz5MAXMoYVGJpmUp8AAWtGtu6iteCWkPUq
	 ncnEr9fVtoVPH25h+ovYyVxbfbTLyAF97Xk/srGaDK8VC5J2bbiIHl4y3r4II8dejctGn
	 iKIt8C4nNyCqA264B3cOfiDfnoqjnYziJk/m/L7tFCGHuUrzcBsqlzDubtqWaoGNM5uo7
	 mRBsSbW73Dy1ABAdaIBcBNC9I1il9DoaeI2tL73ZK1S2SalyN+mpZLgi8C2O9oYbpVPsZ
	 HDhq76cp1umzV2kI7CmzmBgg+3mWJvlyDJl5SSQwyD6O+0Dx0ayVUNYc12yu6RAJwHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VoiMPYdd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A44606A31E;
	Wed, 28 Oct 2026 16:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VoiMPYdd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDE31F01829;
	Wed, 28 Oct 2026 16:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793205966;
	bh=0UL87BPpz/Txn3nRYlhE0bstZ45VXoCY4R89vUK5fGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VoiMPYddyXVIAat6zPP7nql4MbQMWSQPzOI5mnQ44U2EZnfNTefrmdj7hvMVQRhlm
	 89Ybj+4fElIIhRDExU6dufHsqBU/6dMH8y6rhn0hE5X4qPFLmwP1TJbfXbLO0fhw50
	 e0DZcGxKt+OsQ1Qabyp08URn+8dCJ6A5WZ07u5zLVIU14pEnwXDI61k+GuJyLExu1m
	 FrNzBQimIuzoxuZx8OyNXh5I2Z9mgg0sRxxMUwqCdiKYZNffONqOGZB8rt84gk+wo7
	 NZa/UGEUIFaWrCJw/sxPaagr9t1xl/EGaaH8BUspOFQpEYdo+uzhXwdjHimIx6pthL
	 bTFS7kEwclL0Q==
From: Sasha Levin <sashal@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	wentaoz5@illinois.edu,
	chuck.wolber@boeing.com,
	steven.h.vanderleest@boeing.com,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [RFC PATCH 04/20] compiler_types.h: Don't instrument __always_inline functions for coverage
Date: Wed, 28 Oct 2026 12:45:54 -0400
Message-ID: <20261028164556.1610305-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028140118.GB2669272@noisy.programming.kicks-ass.net>
References: <20261028120034.871983-1-sashal@kernel.org> <20261028120034.871983-5-sashal@kernel.org> <20261028135140.GR2668564@noisy.programming.kicks-ass.net> <20261028140118.GB2669272@noisy.programming.kicks-ass.net>
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

On Wed, Oct 28, 2026 at 02:51:40PM +0100, Peter Zijlstra wrote:
>This is pretty vile. But also, since people were trying to use MC/DC for
>validation efforts and the like, how does this impact them? If I
>understand correctly their previous emails on the topic, this means they
>have to go manually audit every single __always_inline function.

Yes, the __always_inline helpers join noinstr code as something that
has to be justified separately rather than covered by tests. Steve's
answer to your noinstr question in 2024 [1] was that this is workable
as long as the number of distinct categories stays small, and this
adds one (556 functions and 445 MC/DC conditions for the config in the
changelog).

Chuck, Steve, does that match what you'd expect on your side?

>Still, I'm left wondering if these tools should be fixed. For instance,
>while the front-end emits this instrumentation, the backend could easily
>remove it again when it finds itself in the context of a noinstr
>function after inlining.

Yup, we should do that. Both GCC and Clang add the counters before
inlining and let always_inline win over the attribute mismatch, so
neither can do it today. We can look at improving them, but it's probably
outside of what this series can do.

On Wed, Oct 28, 2026 at 03:01:18PM +0100, Peter Zijlstra wrote:
>Ah, also, we have objtool's hack_noinstr :/ But sssh, don't tell Josh
>about that.

I looked at that. NOPing the gcov counter updates would be easy, as
they're all single locked instructions, but Clang's MC/DC bitmap
updates go through registers and would need dataflow analysis. It
would also only help x86, while gcov and noinstr are on arm64, riscv
and s390 too. So I'd rather keep this as the guarantee, with objtool
(patch 11) checking it.

On Wed, Oct 28, 2026 at 02:51:40PM +0100, Peter Zijlstra wrote:
>We have -O0 code? I thought we hard relied on building with at least
>-O1, we often get 'fixes' to enable code to build with -O0.

Only crypto/jitterentropy.c, and lpfc when built with GCOV=y. The check
makes no difference for either (lpfc doesn't build at -O0 regardless),
so I'll drop it in v2.

[1] https://lore.kernel.org/all/20240905180758.1396234-1-wentaoz5@illinois.edu/

-- 
Thanks,
Sasha

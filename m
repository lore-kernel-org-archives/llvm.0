Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582563;
	b=Gge4+pcVj6jtZX9kgkFN/MvpBzJgpolzc/qw1ed8Xt1NSB4okEC3nSte8Fu+R2Q9OEv0
	 S9CAlVt+6f4Z0CAscPWr3wFCG5q9OhYotj213QYRPxldUTx5wole6aqyyBdHF2iMgmefQ
	 nK0G4dH3WuGUWSARVR5kzSTZuAkqkCWJdcmU75yVm1pOPFMKtrEA+shZPM/hSIs/OMvPt
	 IVfcXo39+sZQwHYXK05WsKCwtmlOEnq4qtDq1vmDuxqImy5KMDkXVFn7fOEVJD4X+Fes8
	 reeBpApLtORmrDwb39bZOuRgYWr2S9XzaTLJszl5orMVNv4801X2u3PflIGs8FtsMtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582563;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YhhO7/0iTxjUgYPU7yp0EU2ty4W5aUmJ10rWB1Jk+Xs=;
	b=0S+860hz1VWkTz/B4VjCIoF6G+b/pLLFrNF9Yez7zaY5Wz7DuRos84SNsTYFLwKJWano
	 Qie2Oeva/7KM8jgoxUGSCDxG/1pmdApzSJIsLyCNatnGdD4FvOTKwM2RNFDqRuRnjO7Ds
	 swByQ2SJDitybUBTuXfbjCOiNEQJn6LwfhPBGmlsra6CnhSLcmw2EMw7gKiHc72vQcLEP
	 Kr2xNoDUVNbXOW7vaBMpgr42klKZcyRCGN9hYt2w4zLDWnz4yECv6u8zUbvCTMy8BFzBM
	 jXzdT1j85ynaDaQhEKYCNzCRuBbA5BTlLgwh8CpAQexhccZW59TZ/0268ByOcTtxYOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6bI937m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7A6606A32E;
	Fri, 13 Nov 2026 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6bI937m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1AB1F000C7;
	Fri, 13 Nov 2026 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794582563;
	bh=YhhO7/0iTxjUgYPU7yp0EU2ty4W5aUmJ10rWB1Jk+Xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z6bI937m8Ulwig7JDjeRynydA1/lkmp3/gIgL+ypcTjW0RXidEzforeTutILibm4+
	 cP3sxU96ym9giLSCFBOAwm817Nyx4W5zyzAiUU4WU2bYrtCSYp4tvN2soY/FUKuqr+
	 Y4F1ItBO75utMT+txJOb4CVlD9q+mBUMuD7S11kDXQsZq7TLDziI7hb/Te/0aeK5BB
	 MNI3CGIqt2KGWlxnWwfJaKQZ7NOJx9hljO5D90W6jA8zrwqxxWwh95V7Av0kNFhDZ3
	 HvO6fczbSFDFdvMDy4jb2NFi+pOQfK1XayZFAb0j5izLsRrVz/ikRh2ngBziuz2kYU
	 A3ZXM6UChsO0A==
From: Sasha Levin <sashal@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 11/20] objtool: Detect code coverage instrumentation in noinstr code
Date: Fri, 13 Nov 2026 10:09:20 -0500
Message-ID: <20261113150920.1953634-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avX80WkCFuGyS1y0@jpoimboe>
References: <20261103015238.3780910-1-sashal@kernel.org> <20261103015238.3780910-12-sashal@kernel.org> <avVaaxKUA2ArB6RG@jpoimboe> <20261112130906.1316655-1-sashal@kernel.org> <20261112151232.GC1813469@noisy.programming.kicks-ass.net> <avX80WkCFuGyS1y0@jpoimboe>
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

On Thu, Nov 12, 2026 at 10:41:44AM -0800, Josh Poimboeuf wrote:
>I must be missing something, if somebody sets a watchpoint in
>exc_debug_kernel(), don't they get to keep the pieces?

Fair enough, the watchpoint was just the easiest way to show it. The
real reason is that noinstr isn't supposed to have compiler
instrumentation at all, and inlining sneaks the counters back in.

>It's also not clear why --hack-noinstr can't be extended to either NOP
>out the affected instructions, or change the address relocation to point
>to a dummy variable that won't trap.

I tried it, and I think it works better than patch 4, with some caveats :)

NOPing alone isn't enough: besides MC/DC, Clang sometimes loads a
counter address into a register and increments it later. So I NOP the
plain counter updates and point the rest at a dummy. With GCC that
gets all of them. With Clang, 230 of about 3500 still go to the dummy.

Compared to patch 4, a boot covers about 14% more code, since the
__always_inline helpers it dropped are some of the hottest code we
have. It also fixes a GCC MC/DC build failure and some objtool UACCESS
warnings that patch 4 caused, and it handles modules, which this check
never looked at.

The catch is that it's x86-64 only. Other architectures would stay
where they are today: whatever gets inlined into noinstr keeps its gcov
counters, and nothing checks. Keeping patch 4 just for them doesn't
look worth it to me. It cleans up Clang on arm64, but GCC still has
about 190 counters in noinstr there either way, and the GCC MC/DC
build failure shows up on arm64 too.

Peter, are you OK with fixing this on x86 only and leaving the other
architectures as they are? If so, I'll switch to this in v3 and drop
patch 4.

>And the changelog needs all that background, as the justification is not
>clear at all (to me).

Will do.

--
Thanks,
Sasha

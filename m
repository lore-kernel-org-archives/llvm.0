Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205968;
	b=R7YIFRH7M0r2y9Mb76VgsJfuvMD8GsZJj6ulnRdvI2xdW5Hrcyg4TvjSgjLAaFCUNhc2
	 /CwAfY2PkX7b7+pzH7YlzgPIR4teqE9xfJOcSfGeVmoXl9dNlaScez++QVLMwOCrsexex
	 BoDBO1+fvyitbXOt1mcpOOW+K5WGM2XyyYk7AzlZHD0d7hjL/dqgvZnewmtYB4H6dfZpY
	 DRZm6rQqibejMLniz58juIfsAN088x8FUPwGfP0J29EVFRWN8hUUi1z5Jh6dGC10a4xxB
	 /T5pZgMzC9YhR75AaRH82iRzgDC9CMgB/IiVOPDOebnVFJjrlY5gCNQ0X3VlIFgbR1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205968;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XIGuNeJPh32WIH29/mN7HSaaVp6gT9HWkZHmnflXO4w=;
	b=zagxwvMWLojdO+7Dq/0F/17O7VDt//odBuu5L/1PvJz2ju/qYinQ+3TpTe9QzqQYOxHh
	 Dvs2cVqwg9EFjJa7x9PVp47FPwdhB3UNz0quPGy28mrIAOsxy2T39SYNlzz7QJsCTOPmx
	 dAK0HGHzKCqjzmJmxaM7orNlxAlVDQmrovolYGI/9Tt5XWwAELJYOE4IA1Q2z1AAqws9U
	 NNwlM1wr+BgUIiRRUwUlSjlOLc5OXk8vWz5WhG/pkUZY0tMEtxRwsLOGjJU1f15R8gp17
	 TKr8TJUi3Hlz493DNjZKzFUnxg9BbfAP9tDryFxvLLa6gBBP17ZXqzoIJ3Ai4kydO8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WSlSxx9Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C62606A31F;
	Wed, 28 Oct 2026 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WSlSxx9Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799341F01825;
	Wed, 28 Oct 2026 16:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793205967;
	bh=XIGuNeJPh32WIH29/mN7HSaaVp6gT9HWkZHmnflXO4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WSlSxx9YPmULIjXCwdkBd1khyY9eM2Nxfk+KC67J8IRRaYcDWD7JCHVbSB9Qg8u6v
	 qtnIyTlavBswMru+RafX0LcjQoqSY3xKod10dg/VtK/WwwMSSrgfvSNJZWmVYaN54s
	 /+iIw/JW3+3XwPCwfUu6lJPuMHJcme1w4Uroi9TH32iBS56ECQONuYbJRPkhP9Qspr
	 Az2c79v3mAkITfmWr7HrC+bhNYCVWliSUcE9PovRdBTuE2tyMq++HLWNjn0RKR7amq
	 KxeBqw6ID7x/N/5asCgEI5ZxHlmJ9V1GDzwy3KNu84D55hPo2DuY/Lwsm0O4xLmMxB
	 V2/2H4JhCVESA==
From: Sasha Levin <sashal@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [RFC PATCH 11/20] objtool: Detect code coverage instrumentation in noinstr code
Date: Wed, 28 Oct 2026 12:45:55 -0400
Message-ID: <20261028164556.1610305-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028141148.GT2668564@noisy.programming.kicks-ass.net>
References: <20261028120034.871983-1-sashal@kernel.org> <20261028120034.871983-12-sashal@kernel.org> <20261028141148.GT2668564@noisy.programming.kicks-ass.net>
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

On Wed, Oct 28, 2026 at 03:11:48PM +0100, Peter Zijlstra wrote:
>Since you can have many relocations to the same symbol; does it make
>sense to cache the results of those many strcmp()s in symbol::coverage
>or something? We have plenty bits left in struct symbol.

Sure, I'll throw in a symbol::coverage_counter bit in classify_symbols(). It
has to happen before the is_global_sym() check there, since the counters, and
the section symbols that relocations often point at, are local.

>Perhaps merge with the previous conditional?

Will do.

-- 
Thanks,
Sasha

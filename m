Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488949;
	b=puvgStWLAuK44BEXOP/UBibIcM8O1nnu225QNMwRtlwrGRq67seCNcRo05WbHGWHoBjk
	 q13o7TwE71a8eJsDwu7H2NpyEKuKKAqyxWTUH1DfW9STvLCEFsSpdWFf8eXLEkm7rEAXq
	 RV/kp+kpNXIG46qhzewaRItiamgXlsGfW2Y7FaictpucZ0wQXHpJfsJ7R3Y6MNOd4B1xq
	 b1khT6lM8PacYDifoxkVFwoEAKAgiTmC9hIMYjJCTT2+WU32b64smG5Y3JFx9hFX/o2NS
	 z0B66gdsdr5RtCfwN/OWE44Ad2nVSDDFf4CEjHz80NzNEP0YP3quIgWv/9Ojyk17AfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488949;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=K4jgDnJE+0ITzQkMog3h9looU3w2g3YOfBihzI0+7yE=;
	b=zxZiC6LKYhasZscIAA3mT6+Oqk7l9e2J5KgB4I8+pDQgAalAB096N1ehYeBw/O50mq47
	 AmQaGMYoi3V7F7n03KhP2Q5idmIFXke93LJQd9X2hGhBylC6NY71qUWUXSJrD7cfM+JPw
	 m1DvXs3x8TksIk7jy4pONxhGNUk+3Df6Ds4IzDkCG4ipGRq4VvGZW68y+rS0ZA7qZhDyZ
	 LUhPpVxqVkbu/V+h7pSwf40POqiu9uTObsuHzaggIqBjcD/e59uVohOeYAgOwpCePblQH
	 PLe2CCZRiVHOil7oxPf5UBv2ZgBjvKlO34m0e5AKhZ1XlsMWQcDIeNnv7JKlUmmEqzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a3/UEZbg";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603EA606A31C;
	Thu, 12 Nov 2026 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a3/UEZbg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E891F00A05;
	Thu, 12 Nov 2026 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794488949;
	bh=K4jgDnJE+0ITzQkMog3h9looU3w2g3YOfBihzI0+7yE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a3/UEZbgvrlO+xHBvKe2mnGLHfcgD9kWm3slX1CdhsCcOpafsmF4b4S1J5QWqbozL
	 R4CP+X7RhQhEcJ1+z90RqfFsWooSL9yCTNnS/b/Hu+g3vq2P/v7+WY8H1IuOIh2luS
	 /Fw6mNMPRIjhVZyZpm/CNPhsoSY1SYLA2ORW/BgxsA4ljeqMXF5WdP4LnHHhuXT+yX
	 S3/6pgsFE4soXlBWL9qDRq8HWj6JizPnGMpbHK2JZNX9VRVoHp323mkOYBUeMAetDI
	 4JpvO0Um+Jme4S336EOTrwhn2ExjzGIGrOqbCOOis7KmpaR2uTZiidYDWJIhiD/TTB
	 yQSP7EoaMuGzA==
From: Sasha Levin <sashal@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 11/20] objtool: Detect code coverage instrumentation in noinstr code
Date: Thu, 12 Nov 2026 08:09:06 -0500
Message-ID: <20261112130906.1316655-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avVaaxKUA2ArB6RG@jpoimboe>
References: <20261103015238.3780910-1-sashal@kernel.org> <20261103015238.3780910-12-sashal@kernel.org> <avVaaxKUA2ArB6RG@jpoimboe>
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

On Wed, Nov 11, 2026 at 10:23:41PM -0800, Josh Poimboeuf wrote:
>What exactly is the problem with noinstr code incrementing counters
>inline?

The counter is a memory write, and a memory write can trap. In noinstr
code that can happen before we're ready to take another exception.

With GCOV_PROFILE_ALL today, exc_debug_kernel() bumps a counter before
it clears DR7. Set a watchpoint on that counter and the next kernel #DB
never returns, it just keeps re-entering the handler. I tried it on
v7.4-rc1 in a VM and it hangs.

noinstr is already supposed to keep these out, it has had __no_profile
for years. But that doesn't cover what gets inlined into it, and nothing
checks. This patch adds the check.

-- 
Thanks,
Sasha

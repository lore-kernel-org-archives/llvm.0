Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDAA314D2D;
	Fri, 27 Feb 2026 03:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772162207; cv=none; b=ZXigDZYmR5KNpWFS8MhtoqGATk+iotI8L++k3Yn3BHCjcoxLGSrKl6k6RSN5ftBuJxdAlOIaMYfY91yv6SFIkJjdfo2YwZkmsNzRi6ALGsVBdoF3zs2kfRU4OgdKmXir5OOEA2yiXZAbYijf+JlSw4xIjz2Ha9L75mIgO7HOUA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772162207; c=relaxed/simple;
	bh=OnjWxWiDUb2ugPhY+9hPfDYUS6fPgvEuvJCT2+qrEmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qp3C2fDV5Ez8oz2V3BzNilS5iDrPruZ4LA5JXqVDIT5eQ5EN6JdoGtPvdnC12iN6GblIrCIs09cjKozomefY9ps/e7IfEzXhQXlloZ/E9PCQpmM6LxfIi8AqZKYPoncKVtxIsX2I8DDtcOTRVasbfybU9abO6caXEJYoj4RbNwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c91iEhLR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c91iEhLR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6164C116C6;
	Fri, 27 Feb 2026 03:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772162206;
	bh=OnjWxWiDUb2ugPhY+9hPfDYUS6fPgvEuvJCT2+qrEmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c91iEhLRl70bUvXW3OXDcLUDq2JuJwvxdLNpSyvmnUq9hy+lBM6n80xKSPrVowBpB
	 6GrEV3V+nU21unnxOfE3thZ8s5ylC8FqMw2feI/14faF2V2lqrVJAIibs9MN4hJySx
	 DyRi/VrFzomhowcHtwaKf8qpFF1H8uH4L1NtQxydd1ZmxpLzu57m8wtr6uA4FZ4fya
	 XW3yntiDofMYyEd6sbNzKK4Zqm0awDd1ZBMn/QAeY3WUOqBX1n2ScBO4WZ2ilP7ZNv
	 BvFF++3f2o5UibnnJL6/cEENKeS1i/+DijuBPnHxAIluMwHYyw48+a8SWL9gs66Hnh
	 0yp19p71mWu4A==
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Marco Elver <elver@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>,
	llvm@lists.linux.dev,
	David Laight <david.laight.linux@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v4 0/2] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
Date: Fri, 27 Feb 2026 03:16:31 +0000
Message-ID: <177212898809.385801.8626009504655274507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216142436.2207937-2-elver@google.com>
References: <20260216142436.2207937-2-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 16 Feb 2026 15:16:21 +0100, Marco Elver wrote:
> While investigating a Clang Context Analysis [1] false positive [2], I
> started to dig deeper into arm64's __READ_ONCE() implementation with
> LTO. That rabbit hole led me to find one critical bug with the current
> implementation (fixed already in [3]), and subtle improvements that then
> enabled me to fix the original false positive.
> 
> Patch 1 refactors the macro to use a different way of getting an
> unqualified type and eliminates the ternary conditional.
> 
> [...]

Applied to arm64 (for-next/read-once), thanks!

[1/2] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
      https://git.kernel.org/arm64/c/abf1be684dc2
[2/2] arm64, compiler-context-analysis: Permit alias analysis through __READ_ONCE() with CONFIG_LTO=y
      https://git.kernel.org/arm64/c/773b24bcedc1

Peter -- please don't pull this just yet. I'd like it to get some
exposure to the various build bots and CI systems in case of any nasty
toolchain interactions.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

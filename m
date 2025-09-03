Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DFB2D6E54
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 18:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756925316; cv=none; b=Po3yWIuUHwfZtpEpKdqGrIkVTYiAEqrdJhcrVcRwiIYR/bjFmSJv6PbLkeB5YztIVg6pa5T9Iw6S5/8g6zaGiMBzg2L5s4CZwfy/6P82PEqcXC3L33cYO4EcmiAJ4QQ0sJ/cqnigd5/yKoVPAsv+Eqf1AnErbgn006MTzZC/RZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756925316; c=relaxed/simple;
	bh=w13NCpoyIz+MVs9GCJONudVeBM2fy+jIQB2hgsksJYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNy4mswmjzL2ChYX7OufaNeygVbp630VZazJELo2en0L0aZ8/KYlaxiHRkLUe0SdbUm+e2FfA27qgFu/UlY6ATKroNLl1z08f4H7suY3yX5ABlPMHf0X17zlqBWc3uGViDtHbT7TE9UBw5Oclje4+r54FbhJCkbkzSFHDM30LWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqCnwi7N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqCnwi7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118F6C4CEE7;
	Wed,  3 Sep 2025 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756925315;
	bh=w13NCpoyIz+MVs9GCJONudVeBM2fy+jIQB2hgsksJYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqCnwi7NIvfcmC2zVu1A2TIXpIBlJ8B6qVPzD1+fLnRI1XnvcHoBnMnhtrS9nUnnm
	 s8ZjGQX1kgjzh96HEwvBirTrnY4jeFenYLOlUW9DXVMoCs6X12BNZY1ajQZ+T2CmJd
	 wwvvSfDHUuO7nvvCVgl6/2ZGEdEa3NzFh23qd2a3qXGAZCKAwh/M7HH//277MVFxM+
	 TDXQ1It6h35413b4i/qUw4ZpI7ueYCN2HM56Qykx6h53GqJKsHEs9Mhq362tvDBR/s
	 t5iomFhAZA4TTbHqtIR4wfHcCCL39QkMXXmAcEbc0QjQM5v78Ki9ELP03VmgrSwK/u
	 W7OdW+U1LGBdA==
Date: Wed, 3 Sep 2025 11:48:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: clang-22 -Walloc-size in mm/kfence/kfence_test.c in 6.6 and 6.1
Message-ID: <20250903184831.GA3004824@ax162>
References: <20250903000752.GA2403288@ax162>
 <CANpmjNNV=ZmjcGWvPwHz+To6qVE4s=SY0CrcXFbizMeBrBaX4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNNV=ZmjcGWvPwHz+To6qVE4s=SY0CrcXFbizMeBrBaX4g@mail.gmail.com>

On Wed, Sep 03, 2025 at 08:00:00AM +0200, Marco Elver wrote:
> It should be silenced. I'm surprised that they'd e.g. warn about
> malloc(0), which is well defined, and in the kernel, we also have
> 0-sized kmalloc (incl krealloc) allocations being well-defined. As
> long as the returned pointer isn't used, there's no UB. I guess doing
> an explicit 0-sized alloc is not something anyone should do normally I
> guess, so the warning ought to prevent that, but in the test case we
> explicitly want that.

Heh, just as I was looking at silencing this, I noticed a change to the
warning yesterday that explicitly silences it for 0-sized allocations
based on other feedback from the original thread, which I should have
noticed.

https://github.com/llvm/llvm-project/commit/5f38548c86c3e7bbfce3a739245d8f999e9946b5

So there is nothing to do here now, thanks for the input regardless!

Cheers,
Nathan

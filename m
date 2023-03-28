Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02B08473
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 19:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8272EC433EF;
	Tue, 28 Mar 2023 19:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680030548;
	bh=iEymzBzaU4bQVBwE7T/LgoV6sJObq+3Ajj05E4kG0RA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=bF8B0JBDnMFzkv9fIUcE0kR8rLsBHwVf7frqmpVhrSneq8dovcCMUUXiwI1Ow5JHO
	 isWy9/rwI/nHte6qSaLdC86LqKscxJyX46op3Xlit59JZRzsQxK3XIWND9NfSDAVaf
	 WmVht3Odvelj5/fsHDyMos2qDLk2/PPzXOOic+eE94Hgdm5y1sZEQFKRZFK1YHDJvO
	 94RTD0h6yiOl91X6Js9+fAAJ1zxGs/wg6ijKSOWoYyKPw/Sp9Q51lcBOvGjtYXg12Q
	 WGUWCObNHgt7dWsac+J7Hn284QB8uzgnQ2fuJ/YEuO+zS1lNj5uxyxt+i+yKMBV+QF
	 erdDR75egBz6A==
Date: Tue, 28 Mar 2023 12:09:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Slim and optimized LLVM toolchains for building the Linux kernel
Message-ID: <20230328190906.GB375033@dev-arch.thelio-3990X>
References: <20230319235619.GA18547@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319235619.GA18547@dev-arch.thelio-3990X>

On Sun, Mar 19, 2023 at 04:56:21PM -0700, Nathan Chancellor wrote:
> Hi everyone,
> 
> To make building the Linux kernel with clang/LLVM easier and more
> accessible to people (since distributions tend to only package one
> version at a time and it may be old or have bugs that have since been
> fixed), I have uploaded some slim, profile guided optimized LLVM toolchains
> to my section of kernel.org/pub:
> 
> https://mirrors.edge.kernel.org/pub/linux/kernel/people/nathan/llvm/

This is now

https://mirrors.edge.kernel.org/pub/tools/llvm/

so that they are no longer tied directly to my kernel.org account. I
have updated the README with additional information based on feedback
that I have received thus far.

> The landing page should have all the relevant information but if I need
> to clarify or expand on anything, I am more than happy to do so.
> 
> Due to benchmarking the compilers against the kernel during PGO, they
> can handily beat distribution versions that have not been optimized:
> 
> https://gist.github.com/nathanchance/8d1abed70077ac92cb198ef32389072e
> 
> I aim to keep these up to date with the latest stable versions of LLVM
> as they are released (so 16.0.0 will be replaced with 16.0.1 when it is
> released, etc).

Cheers,
Nathan

Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318E12C80
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 02:59:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 045B66120F;
	Wed,  6 Oct 2021 02:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633489172;
	bh=0XIFkLul9UedGivk2NbrJk7dFALwMkeLUWjr2XAolPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISDx9fA4xyOB2lU21aHzZbkznH7LsUAgc98AMIIJOnrVvAz+XVLd+NV4G6Y3QX2gF
	 bXZQpMuOuRrPqqJl3/A2iaoTO08GGwtHGx2JvvCGF+r/fD/0mz0jhiucHI2w16dAUJ
	 mwBaNQ0Lv8gm752FrXB51Y1te+JsI+tXzdb2blgbbsacX9qRhbOrqZcYQzIYOWSnHN
	 zH4jL5k5LMStkk0LLOdwmuzt1O8ekR+gYm94aInov0/dntaXARA7iBGaIS+EBCgYBN
	 9+GNhddWuZHleI6ZSvfl3S6ZpJT8JnKDFL9rwtjHJy6QQ2q8ClwrdAAIPs9emTvs1a
	 SdIYkqVbWliOQ==
Date: Tue, 5 Oct 2021 19:59:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: llvm@lists.linux.dev, Sylvestre Ledru <sylvestre@debian.org>
Subject: Re: How to check my LLVM toolchain is optimized for PGO and/or
 ThinLTO?
Message-ID: <YV0REIpkY6TkuGA+@archlinux-ax161>
References: <CA+icZUWf5OgQGOKG8jK+mEmSnT9wUGo4WV9wCSmDGwdDAX15TQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUWf5OgQGOKG8jK+mEmSnT9wUGo4WV9wCSmDGwdDAX15TQ@mail.gmail.com>

Hi Sedat,

On Tue, Oct 05, 2021 at 11:33:33PM +0200, Sedat Dilek wrote:
> Hi,
> 
> does anyone have a hint how to check a selfmade or distribution LLVM
> toolchain for optimizations like PGO and/or ThinLTO?

I am not really sure of a way to see that information from the binary
itself unless there is a way to dump the cmake options that were used
after the fact? I know the optimizations are applied properly via
tc-build as I have measured the difference via hyperfine.

> Personally, I use tc-build to generate a selfmade PGO-ThinLTO LLVM
> toolchain which optimizes for my specific hardware (CPU Intel
> SandyBridge) and a Linux x86 64-Bit kernel-config.
> 
> In case of PGO...
> Can I use or better benefit from a distro PGO profile file?

If you only care about using LLVM to build a Linux kernel (in other
words, you are not using it for other projects), in theory, tc-build
should provide you with more benefits/speed over a generic C/C++ profile
that a distribution might build. HOWEVER, if building an optimized
toolchain takes a significant amount of time and you are not building
kernels often enough to make it back up, it might be more useful to use
the optimized distribution variant so that you are only net positive on
time.

> Can I use/benefit from my selfmade (generated) PGO profile file when I
> use an optimized distro LLVM toolchain?

Given that the distribution LLVM is going to be pre-compiled, your own
profile is not going to be useful since it is only used at compile time.

Cheers,
Nathan

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC3368
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 18:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46C3C34600;
	Tue, 14 Dec 2021 18:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639505402;
	bh=SERQS1Iphdy72qEnbrPAj6PSYIpJdhFgGJyK9pnOnRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mR0s+hcKl8IRgGh5JAGwwjWWXyVG+Ya9TSuD7oyIvrOdE9y0T0BPsKLOIoVACANmj
	 +vij9i7luyFnNflu0Ehkr9mLx13U2nqIu4FcNs9WwL9Kkh892PDNjediPTVmys4kUx
	 Ve2an3O+UdiDTxGIn+6e28oB9ly4RkHNdgBXynEM/UBHQkrn8ZyMyIO/wQHLs7vE7m
	 9vIwaMQv3csy8Qo9jGHSFBHNlcd8E7+JUj8q8OwzSNI1LdaHMHOUSJaw7X+0v6qwHq
	 0yKubkvNa96k70B6HsVzjOUAZJayaaHGcbNAqkcsO1XyABylgdnxk+YHnCI4usuC2c
	 CYVnIhpARGxwA==
Date: Tue, 14 Dec 2021 11:09:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nick Desaulniers <ndesaulniers@google.com>, list@opendingux.net,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 3/3] MIPS: Add support for LTO
Message-ID: <Ybjd9qQvYG4pFJYH@archlinux-ax161>
References: <20211213224914.1501303-1-paul@crapouillou.net>
 <20211213224914.1501303-4-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213224914.1501303-4-paul@crapouillou.net>

On Mon, Dec 13, 2021 at 10:49:14PM +0000, Paul Cercueil wrote:
> Allow CONFIG_LTO_CLANG to be enabled. The ThinLTO variant is not yet
> supported.
> 
> While this option allows to build a LTO'd kernel, the result kernel file
> ends up being *bigger* than the non-LTO variant (about 3.6 MiB with LTO
> vs. 3.1 MiB without with a ZSTD-compressed kernel).

I believe this happens because the linker is able to inline more, which
should make the code faster but makes it larger. I believe we limit the
inlining threshold so that it is not too bad but maybe that could be
further tuned.

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/mips/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 0215dc1529e9..6987db8d5f64 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -22,6 +22,7 @@ config MIPS
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select ARCH_USE_QUEUED_SPINLOCKS
>  	select ARCH_SUPPORTS_HUGETLBFS if CPU_SUPPORTS_HUGEPAGES
> +	select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>  	select ARCH_WANT_IPC_PARSE_VERSION
>  	select ARCH_WANT_LD_ORPHAN_WARN
> -- 
> 2.33.0
> 
> 

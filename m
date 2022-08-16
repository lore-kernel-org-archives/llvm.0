Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2791B1111
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 00:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1B1C433D7;
	Tue, 16 Aug 2022 00:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660610773;
	bh=O9rR0Ifut42RrXnNAhJYb4d8tOd2e/S382QI1yeEM3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/76D5CUBfSHPjVl60IOEsKBW5wYg+UZ1o7bXDD/dF/HXLBcKE/TtCshHEagTGyu2
	 s2zwZISd3swYQe10G/T2CGCPlp8zo5Q2ib25520AFotf7sMoMGngc4/fYkKtUODpX3
	 RjU6NmIBqVS7gOvvUocE9u8PCicl3u9C4o+WLvvEE0ytL0WwqWX0GEEii2wv7XeZ4T
	 TvG9T1o8wic4D5LUMF7FHxuludITm0VtnTaHZTZeYsjk1d3qqdPM0PIB7YXE7ncKCG
	 uP987wku94+Oe0HHar6wZmpTTOzEY9vLGZZAoSnXnqbUdQ5wqFIgtArUOw7ON+2XOO
	 OwR9vSvMxqS2g==
Date: Mon, 15 Aug 2022 17:46:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Andre Vieira <andre.simoesdiasvieira@arm.com>, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: [TypePromotion] Search from
 ZExt + PHI
Message-ID: <Yvro06Uid0t0Ou1M@dev-arch.thelio-3990X>
References: <1465164958.6648.1660602445528@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465164958.6648.1660602445528@jenkins.jenkins>

On Mon, Aug 15, 2022 at 10:27:24PM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by llvm: [TypePromotion] Search from ZExt + PHI:
> commit 164067918725d1ee8875e38213b6aee9be13383e
> Author: Andre Vieira <andre.simoesdiasvieira@arm.com>
> 
>     [TypePromotion] Search from ZExt + PHI
> 
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 6329
> # First few build errors in logs:
> # 00:12:33 ld.lld: error: undefined symbol: __aeabi_uldivmod
> # 00:12:33 make: *** [Makefile:1208: vmlinux] Error 1

I noticed this towards the end of last week too:

https://github.com/ClangBuiltLinux/linux/issues/1688

I added some reduced reproducers to that thread. As I note in the
original post of that issue, I am not sure if this error is a standalone
problem or one that comes from another problem we are actively dealing
with:

https://github.com/ClangBuiltLinux/linux/issues/1666
https://github.com/llvm/llvm-project/issues/56153

Cheers,
Nathan

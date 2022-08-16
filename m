Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845016AAE
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 19:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05017C433D6;
	Tue, 16 Aug 2022 19:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660678049;
	bh=2aD0HO8CNlMBNb1AfjUUsYszT8FLwZAGo7dkS4WJmo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1CZEnv2ELbeBhLsNNUaj4N0o4x8B9JtMFFv5L5sJvrxCU+shZKOiJUaLC30OjXcM
	 /omXepm6g/MKwFu/hsz9JCz63/2dbP/uFSFylvxgHaLViD+MlyMt9h9qz10eKpaCuB
	 e+CAUzN91/MX87ZFHoC73lnIQYlzpPN4QbgObS+KS6ubA5LieCishn6Rk3lXB6NOnY
	 3iu+3GJ+5mULoH4NkMYM6UVsAM1Axl+qybILY6tgGOnQnRdIv6+YdLHT9UU9S0Nctg
	 coIj0uEF6u1uAE/XwP5YIt75v5S4SN3qq8kyE5dZ2+0qeM0KbpWDqKN6w2IsIeGAix
	 cmpjhmw0clXSw==
Date: Tue, 16 Aug 2022 12:27:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Shawn Zhong <github@shawnzhong.com>, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: Fix
 -Wbitfield-constant-conversion on 1-bit signed bitfield
Message-ID: <Yvvvn9RxoL9Dcb3r@dev-arch.thelio-3990X>
References: <587965879.6777.1660676874505@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <587965879.6777.1660676874505@jenkins.jenkins>

On Tue, Aug 16, 2022 at 07:07:54PM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by llvm: Fix -Wbitfield-constant-conversion on 1-bit signed bitfield:
> commit 82afc9b169a67e8b8a1862fb9c41a2cd974d6691
> Author: Shawn Zhong <github@shawnzhong.com>
> 
>     Fix -Wbitfield-constant-conversion on 1-bit signed bitfield
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
> 21250
> # First few build errors in logs:
> # 00:07:12 sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to bit-field changes value from 1 to -1 [-Werror,-Wbitfield-constant-conversion]
> # 00:07:12 make[3]: *** [scripts/Makefile.build:249: sound/soc/atmel/mchp-spdiftx.o] Error 1
> # 00:07:32 make[2]: *** [scripts/Makefile.build:465: sound/soc/atmel] Error 2
> # 00:12:27 make[1]: *** [scripts/Makefile.build:465: sound/soc] Error 2
> # 00:12:27 make: *** [Makefile:1855: sound] Error 2

The new warning is correct, fix is pending:

https://git.kernel.org/broonie/sound/c/eab9100d9898cbd37882b04415b12156f8942f18
https://github.com/ClangBuiltLinux/linux/issues/1686

Cheers,
Nathan

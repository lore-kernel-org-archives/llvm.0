Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1C214AD2B;
	Fri,  6 Jun 2025 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749228805; cv=none; b=IhfSnQGUs46I75QUBevjUeBxbvUgyiJZea4+ipjjyeV3nHZ98Pw0+JxRuI7d1pdtEKFo0Dn+WVi5SRnv+yCyBXkRTIkvv3rkEcG5/IMH0Qf4WIcXQl+Bq54eYJ5/21pphL4mp2M5+nSwGEijS/iCzDKaEnbZ544H0axHAxwvtSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749228805; c=relaxed/simple;
	bh=87KZKukrg49ert97Lcx0HLmqACRfuwZpRY6i5mUhJyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXGH/N9a+oGp2lDkmKP/v09DRtPG8Ju1Ey50vvL6eeiKAxrDYPLijqNzc92EHNVJwtKFp/ueub8YrTJ89LbXLBNB9dbo+aIxW2mvp7k54tgGTq3vlz+OivLITC4Ti7Zvffs+sqWfSTIo2cl2nux81TX1P1aYgeO0lyhUU7QYdRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1CKskOl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1CKskOl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836BAC4CEEB;
	Fri,  6 Jun 2025 16:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749228804;
	bh=87KZKukrg49ert97Lcx0HLmqACRfuwZpRY6i5mUhJyI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=D1CKskOlZr5Y7dYfQtYg+PaUdzeERrLIxZM+rb08qw2hoM6TShht6C0meakNN7hYx
	 DbsUYwhKUikG1XxZF0KUUeIPtoxyUG78gJ14R6xxcV82Du/7V8UqHbhGppKO7am2xC
	 OnqQpbXCi20I9AiuJ243x6ONkadmbolWN8M/4w4IOtyEow7BN9hoZ7t/iOMXEYD9pZ
	 VAlvTN0+75VXFBp/4/UIboqHNFTOt062MXMxsL9MWNGe+NON8v77RTP/Op2lMXyXyd
	 TbbCvqVG1zh/ZiAtK9xrMzy7jkRQbttNWcOVUZ8tR50aiMmow+ZSfx6YcvZ2aJc4Kq
	 t+2VbvdoqPjAg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 216CBCE054A; Fri,  6 Jun 2025 09:53:24 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:53:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2025.06.04b 18/36]
 lib/tests/test_ratelimit.c:98:18: error: call to undeclared function
 'ratelimit_state_reset_miss'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <72cced7b-7cbd-4b62-a1c9-88d3960c6a89@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202506070040.aFxmm3vX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506070040.aFxmm3vX-lkp@intel.com>

On Sat, Jun 07, 2025 at 12:50:39AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2025.06.04b
> head:   12a2f572c0040895409bbf5773f80fa08586c01a
> commit: f1d79747fb507820229adfd6f042b9b094a0c75b [18/36] lib: Add stress test for ratelimit
> config: arm-randconfig-001-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070040.aFxmm3vX-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070040.aFxmm3vX-lkp@intel.com/reproduce)

This was me failing to incorporate the lib/ratelimit.c commits,
apologies!

							Thanx, Paul

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506070040.aFxmm3vX-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> lib/tests/test_ratelimit.c:98:18: error: call to undeclared function 'ratelimit_state_reset_miss'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       98 |         sktp->nmissed = ratelimit_state_reset_miss(&stressrl);
>          |                         ^
>    lib/tests/test_ratelimit.c:98:18: note: did you mean 'ratelimit_state_exit'?
>    include/linux/ratelimit.h:25:20: note: 'ratelimit_state_exit' declared here
>       25 | static inline void ratelimit_state_exit(struct ratelimit_state *rs)
>          |                    ^
>    1 error generated.
> 
> 
> vim +/ratelimit_state_reset_miss +98 lib/tests/test_ratelimit.c
> 
>     81	
>     82	static int test_ratelimit_stress_child(void *arg)
>     83	{
>     84		struct stress_kthread *sktp = arg;
>     85	
>     86		set_user_nice(current, MAX_NICE);
>     87		WARN_ON_ONCE(!sktp->tp);
>     88	
>     89		while (!READ_ONCE(doneflag)) {
>     90			sktp->nattempts++;
>     91			if (___ratelimit(&stressrl, __func__))
>     92				sktp->nunlimited++;
>     93			else
>     94				sktp->nlimited++;
>     95			cond_resched();
>     96		}
>     97	
>   > 98		sktp->nmissed = ratelimit_state_reset_miss(&stressrl);
>     99		return 0;
>    100	}
>    101	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

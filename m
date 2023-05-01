Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9362633D2;
	Mon,  1 May 2023 16:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0DEC433D2;
	Mon,  1 May 2023 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682958533;
	bh=eQe5BjstwjDxSkWatIvKMKXf95VAWSpUZA1at5L08gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pTq2pSOgs7ZnmBSgYTO2jLJEusa5tlOTodp/Ye0qtjHeEr8PTeHHa0aWk/GTxz/sS
	 brPriewy7vmjsBBjXzoN/ZvC+0ggMkC8jjEQ2mjYcPc/w+HgXin9bXDuOAEBcG6lok
	 lW5mf/Ri/nm0eGhU+gpTWrJIMHWOyJ/aETp1sozaxwSVp7Y6MbNAldXwUr5cngMRIS
	 0dT2dXmzrJ8VXipSKOkvYD95u6WpnvZ3N9YN4Revf4UfaRUmkDb/GgLdQaAZUssWne
	 YwFnreDNIkMYDM0i2004wvv8/FRawUEyi3SRTG/BkA+NZD4FDbONwWS10IX/s2Cj8q
	 W1PfiHKEMwe6A==
Date: Mon, 1 May 2023 09:28:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Qin Jian <qinjian@cqplus1.com>, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [clk:clk-sunplus 1/1] drivers/clk/clk-sp7021.c:316:8: warning:
 result of comparison of constant 18446744073709551615 with expression of
 type 'typeof (_Generic((_m), char: (unsigned char)0, unsigned char:
 (unsigned char)0, signed char: (unsigned char)0, unsigned short: (unsigne...
Message-ID: <20230501162851.GA2906609@dev-arch.thelio-3990X>
References: <202303221947.pXP2v4xJ-lkp@intel.com>
 <81b2a67f89d7f46dd27f6d05606e753f.sboyd@kernel.org>
 <20230322195933.GA2828949@dev-arch.thelio-3990X>
 <00c24196e5ceb60b7d69967b73910264.sboyd@kernel.org>
 <20230324145056.GA428955@dev-arch.thelio-3990X>
 <e181f270191e30d99554496517bd321d.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e181f270191e30d99554496517bd321d.sboyd@kernel.org>

On Fri, Apr 28, 2023 at 06:13:34PM -0700, Stephen Boyd wrote:
> Quoting Nathan Chancellor (2023-03-24 07:50:56)
> > On Wed, Mar 22, 2023 at 04:48:43PM -0700, Stephen Boyd wrote:
> > > Quoting Nathan Chancellor (2023-03-22 12:59:33)
> > > 
> > > > It looks like clang is
> > > > complaining that mask is an unsigned int and it is being compared
> > > > against ~0ull, which will always be false. This makes the warning go
> > > > away for me, which is similar to commit cfd6fb45cfaf ("crypto: ccree -
> > > > avoid out-of-range warnings from clang"), but I am not sure if that is
> > > > correct or not.
> > > 
> > > Cool thanks. Can you send it as a proper patch?
> > 
> > Sure thing, I will do so when I am back online next week.
> > 
> 
> Did you send the patch?

Ugh, I am so sorry, I never added that to my TOOD list so I never
rememebered after I got back :/ I will make sure to send the patch
today.

Cheers,
Nathan

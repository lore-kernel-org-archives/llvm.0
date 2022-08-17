Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B91E53B8
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 17:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6BAC433C1;
	Wed, 17 Aug 2022 17:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660757005;
	bh=x8AOMYZPjuZI41+BV3yAeAPjkL3cZwXnkl+7Pszeukg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KClupnk/o4y9JmkCvWAynHjt8MxOASHtUGC8Qbo2bFqGsyPVQ1UBa2X4NPQCpYWcU
	 2ToqwR/C6i6YFkuhv/KtxGEmIDs08cNrmDAliM8/35fjezRSuWv1Lr++oWQjt1sliG
	 zT11cYDZ1+j0IDAlTkiQZRnIVHBPYAb91jeznTLBClppiovUY37uSN9qEhdljKkUSs
	 OysHReuCbVCObpllntyjp3vKauPP4/6Te3Ab7PavzKlsVKcLSN86oK5fduZg+l2rb1
	 SIEj57vlvx4GRLvzkJrUMZ9nPHpdkaLa0i1vP3SHwiGb5XN91OQ209ksuKq4kQivtb
	 o8087sqV3a5fw==
Date: Wed, 17 Aug 2022 10:23:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Matt Flax <flatmax@flatmax.com>, kernel test robot <lkp@intel.com>,
	alsa-devel@alsa-project.org, llvm@lists.linux.dev,
	kbuild-all@lists.01.org
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <Yv0kC2jscXISm7Ie@dev-arch.thelio-3990X>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
 <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
 <Yv0Vg2bkmlEqTSVk@sirena.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yv0Vg2bkmlEqTSVk@sirena.org.uk>

On Wed, Aug 17, 2022 at 05:21:23PM +0100, Mark Brown wrote:
> On Tue, Aug 16, 2022 at 11:00:10AM -0700, Nathan Chancellor wrote:
> > On Tue, Aug 09, 2022 at 09:49:38AM +0800, kernel test robot wrote:
> 
> > > config: hexagon-randconfig-r002-20220808 (https://download.01.org/0day-ci/archive/20220809/202208090909.Pg0BZGie-lkp@intel.com/config)
> > > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
> 
> > It doesn't look like these warnings were addressed before the change was
> > applied to -next as commit 4e6bedd3c396 ("ASoC: codecs: add support for
> > the TI SRC4392 codec"). I now see them in next-20220816.
> 
> It's probably worth talking to the 0day people about prioritising what
> they're reporting against, especially given that the reports have
> evolved into a bit of an eye chart - this was reported against a Hexagon
> randconfig with an unreleased compiler which is underselling it rather.

Sure, that might be interesting to have certain architectures and
in-tree configurations prioritized over others (like arm64/x86_64 +
allmodconfig).

At the same time, I would expect developers and maintainers to focus on
the warning text first and foremost, not what architecture,
configuration, or compiler is being used. This issue is very clearly not
architecture or configuration specific, there is no #ifdef in this
function that changes the nature of the warning. While it is compiler
specific (because possible uninitialized variable warnings are disabled
with GCC), it is not dependent on the version (although I guess that
isn't apparent). I suppose I can just comment on future randconfig
reports to point out how they will affect allmodconfig and such.

Cheers,
Nathan

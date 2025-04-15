Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40D5EAC7;
	Tue, 15 Apr 2025 14:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727507; cv=none; b=qdD2nDTDbA5UwPGNPGkUiDk1zHBFwu9Pd0B5DCwaNB/1GEUM9ljbjMfS5bxpHnegAJlC6AvmL/pCtHl5sjUxK3mTlycsDLRKS5ehNfDeVDqDTEEnqjSj0mcHSXoLWIg19sOqs3Qrt+iqZttalRGttb/tiPMLTfs1W5FPMZEvkSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727507; c=relaxed/simple;
	bh=72gu+99OlRCnRbMf/IooEJiDazJGsoVKKKCeiyq5YlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/ZRO3+Y6ycmiM8zTcpCQKA9sIKZfi5IiJVRJVw6DFh+2G70eqfmGHiXj+rPqrKRjN1apMfktag1jPrvvPp2+YeCxV2gcxtCbN7r7HIFNaIL+JlH8OGaGTQOMLuD+jB/BYVJp9YQPvd4ge0Be6aOUbJpeL3zd2q1HtW9sVHvVQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C800C342FA1;
	Tue, 15 Apr 2025 14:31:43 +0000 (UTC)
Date: Tue, 15 Apr 2025 14:31:37 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Haylen Chu <heylenay@4d2.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [spacemit:for-next 4/6] drivers/clk/spacemit/ccu-k1.c:241:1:
 error: initializer element is not a compile-time constant
Message-ID: <20250415143137-GYB30887@gentoo>
References: <202504152107.7ekGPIrF-lkp@intel.com>
 <564eb8e7-a4e1-49e6-a79d-da880a526540@riscstar.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <564eb8e7-a4e1-49e6-a79d-da880a526540@riscstar.com>

Hi Alex,

On 09:16 Tue 15 Apr     , Alex Elder wrote:
> On 4/15/25 8:44 AM, kernel test robot wrote:
> > tree:   https://github.com/spacemit-com/linux for-next
> > head:   9ead3efbc88a21e9a1f38948cc0902518022a2e5
> > commit: e2d238ba301f25a5c8a7d490a36f9cd014d7aecc [4/6] clk: spacemit: Add clock support for SpacemiT K1 SoC
> > config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/config)
> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504152107.7ekGPIrF-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> 
> If I'm interpreting this right, this seems to be a problem on
> a S390 build (under COMPILE_TEST), because there is no constant
> version of the __ffs() for that architecture.  This might be the
> case on other architectures as well.
> 
> On RISC-V, this is fine.
> 
> Any recommendations on how to address this?
> 
it occur to me the __ffs() isn't really necessary, since all input
is constant value (GENMASK here), we then should know the shift..

> 
> 
> > 
> >>> drivers/clk/spacemit/ccu-k1.c:241:1: error: initializer element is not a compile-time constant
> >       241 | CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
> >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
> >        33 |         .num_shift      = __ffs(_num_mask),                                     \
> >           |                           ^~~~~~~~~~~~~~~~
> >     drivers/clk/spacemit/ccu-k1.c:242:1: error: initializer element is not a compile-time constant
> >       242 | CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
> >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
> >        33 |         .num_shift      = __ffs(_num_mask),                                     \
> >           |                           ^~~~~~~~~~~~~~~~
> >     2 errors generated.
> > 
> > 
> > vim +241 drivers/clk/spacemit/ccu-k1.c
> > 
> >     239	
> >     240	CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
> >   > 241	CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
> >     242	CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
> >     243	
> > 
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

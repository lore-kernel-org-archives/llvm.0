Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F12DFA38;
	Tue, 15 Apr 2025 15:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730210; cv=none; b=CHz68E6axJpJnpFHwJhhcfFA34iYLxYEDbbT5vNjWBP30FoySYdHYl9JZntgRG3MPcjJk8+1EsBpoPUIBbv1WyV/5ye48YNwjRxL6ZNmUv4hQTHXvcgjcL6OpUY7aVF0Z/lS2+OsDuJ9RRKlvPVmazmktHbLWxLGq5HNiGqYaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730210; c=relaxed/simple;
	bh=GKtThy1+mBc/YNfZzP0EH+vD9jEpNWTl6UFzAve2gTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pw3YDhWkNDFmESE/oP706vEenfm54QuHZ2FmvKbBnQs4PUKDMemNLqMLyZGxkiKaT6mWePHDswBSMsXvnQ7TpI20TxDUSQj9cXg/gU3M6125NEybyHzeBoSZ8YqmeYIyc618pQ4/Mj2TfPplQy9UctVyb7IAXoYySdBcE2wZhvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4C7BD342F64;
	Tue, 15 Apr 2025 15:16:47 +0000 (UTC)
Date: Tue, 15 Apr 2025 15:16:42 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [spacemit:for-next 4/6] drivers/clk/spacemit/ccu-k1.c:241:1:
 error: initializer element is not a compile-time constant
Message-ID: <20250415151642-GYA31264@gentoo>
References: <202504152107.7ekGPIrF-lkp@intel.com>
 <564eb8e7-a4e1-49e6-a79d-da880a526540@riscstar.com>
 <20250415143137-GYB30887@gentoo>
 <Z_5zudOYiNPJbeUR@ketchup>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5zudOYiNPJbeUR@ketchup>

Hi Haylen,

On 14:56 Tue 15 Apr     , Haylen Chu wrote:
> On Tue, Apr 15, 2025 at 02:31:37PM +0000, Yixun Lan wrote:
> > Hi Alex,
> > 
> > On 09:16 Tue 15 Apr     , Alex Elder wrote:
> > > On 4/15/25 8:44 AM, kernel test robot wrote:
> > > > tree:   https://github.com/spacemit-com/linux for-next
> > > > head:   9ead3efbc88a21e9a1f38948cc0902518022a2e5
> > > > commit: e2d238ba301f25a5c8a7d490a36f9cd014d7aecc [4/6] clk: spacemit: Add clock support for SpacemiT K1 SoC
> > > > config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/config)
> > > > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202504152107.7ekGPIrF-lkp@intel.com/
> > > > 
> > > > All errors (new ones prefixed by >>):
> > > 
> > > If I'm interpreting this right, this seems to be a problem on
> > > a S390 build (under COMPILE_TEST), because there is no constant
> > > version of the __ffs() for that architecture.  This might be the
> > > case on other architectures as well.
> > > 
> > > On RISC-V, this is fine.
> > > 
> > > Any recommendations on how to address this?
> > > 
> > it occur to me the __ffs() isn't really necessary, since all input
> > is constant value (GENMASK here), we then should know the shift..
> 
> I'll second this: instead of calculating the LSB from bitmask in
> compilation time, we could derive bitmask from LSB/MSB of the field:
> taking slow_uart2_48 as example, this means changing current definition
> to
> 
> 	CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1,
> 		       28, 16, 12, 0, 0);
> 
Looks good, can you re-spin a new v8 version (plus collecting all review tags),
As I'd like to have a clean patch set (normally we should only send a new incremental fix),
but this time I'd like to put few more efforts to re-do this series, thanks

> > > 
> > > 
> > > > 
> > > >>> drivers/clk/spacemit/ccu-k1.c:241:1: error: initializer element is not a compile-time constant
> > > >       241 | CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
> > > >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >     drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
> > > >        33 |         .num_shift      = __ffs(_num_mask),                                     \
> > > >           |                           ^~~~~~~~~~~~~~~~
> > > >     drivers/clk/spacemit/ccu-k1.c:242:1: error: initializer element is not a compile-time constant
> > > >       242 | CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
> > > >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >     drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
> > > >        33 |         .num_shift      = __ffs(_num_mask),                                     \
> > > >           |                           ^~~~~~~~~~~~~~~~
> > > >     2 errors generated.
> > > > 
> > > > 
> > > > vim +241 drivers/clk/spacemit/ccu-k1.c
> > > > 
> > > >     239	
> > > >     240	CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
> > > >   > 241	CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
> > > >     242	CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
> > > >     243	
> > > > 
> > > 
> > 
> > -- 
> > Yixun Lan (dlan)
> > Gentoo Linux Developer
> > GPG Key ID AABEFD55
> 
> Regards,
> Haylen Chu

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

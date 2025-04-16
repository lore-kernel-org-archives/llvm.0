Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259E923FC5B;
	Wed, 16 Apr 2025 12:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805494; cv=none; b=VXsLpARRXS+NcFYnMApOG/oUUTKlydgCgBCcwPky7ey7Dw3zo/Q45k8FolS85PsBAffyJhIyTXnrZvm2hmIfcdcNzzIyEdrxgm3Mk7ohWqKp66NyFba07TfRNKeBo1hi6a/NUNKbfX4y+DkSsIIu3Aa2HodRoCzrNpI6cpKqfRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805494; c=relaxed/simple;
	bh=bXrpO89DQ5J1Dz2rOi/AiogrSxoSgwf+eaA/jfzAgAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8LQa+rpg3Q/qENZnUKRamNWBQdOc2wzWQz8vR6YUEpYaaQtYGK2OId3Z9096zVQvADBoIsBTf0W61+CORtmEPOm9yZw/N8RE63Ty5fIKuVS6hzNTbuOKONxrFTkNoGduC3t4oIUUv+USvijVUGWVCzGFEQXA3IcJHftHkHO1X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=QnUWKasC; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=cm4LL+sR; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="QnUWKasC";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="cm4LL+sR"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 4F59C12FB450;
	Wed, 16 Apr 2025 05:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744805483; bh=bXrpO89DQ5J1Dz2rOi/AiogrSxoSgwf+eaA/jfzAgAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnUWKasCXy/8onVoiUsJe53NPIAtuUAiJx85IFAJt4MLWny1oOkwldW5wum+xICEr
	 f4ON3UxBGfveTu/PqZjD+/8tjznqt6Ebp5ypW8TRI0gJVf4aAYKF2hI3Fef7YfjM1A
	 zoidKkKKjSfSwXsLt6kuqIHkkB2oLnCMo/5PTOegLFkmNNo7DV/UjAnZwNTN8tZ1dF
	 WJhDrw13SmiLFe3X8NsDYweH4t7WXHYDtEkOsP+zD636SX/6A1LYQn+8Q40KHg/qid
	 6Hg3Meh58KUcPvAvQ0gGDRYFhleqwFkbRcvHZdq61lNjf78thI7NCUaZ+PUjBZqSE6
	 XZVQnJEhSK/Kw==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6o8Z-jP2ehg; Wed, 16 Apr 2025 05:11:19 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 3C37D12FB435;
	Wed, 16 Apr 2025 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744805479; bh=bXrpO89DQ5J1Dz2rOi/AiogrSxoSgwf+eaA/jfzAgAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cm4LL+sRDGO5GQV43sEjOTJBCx9tJwq3DptI8gfgEX46CJoXCG7YFRhSbX5vExdHD
	 faQWNpDnbBIMjk+x/fQMSWOJQa5erwptXoMJgWmmImyMoNKfhhjbRbDWVl8IOCBlak
	 qhuxvvfj62If1gVFl5cZ9i3x4ZenELOIeb4yfupV0IcKL4x85SJf+KP0kHOKHS33tU
	 h6VxQbWcQInu29rau4IIrWEiP6OYIQoJvsC7WblJHGyjfpXeYZzEI4M2VMbmh7pl+v
	 N1ctZex8ltc/VYYjQegZjomFy260wQQ5bkHyxeAxZ6GvwYQItkesPYMDhpvhw7/UVa
	 79/prMY/7qI2A==
Date: Wed, 16 Apr 2025 12:11:14 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [spacemit:for-next 4/6] drivers/clk/spacemit/ccu-k1.c:241:1:
 error: initializer element is not a compile-time constant
Message-ID: <Z_-eYhc2kZrVoL9m@ketchup>
References: <202504152107.7ekGPIrF-lkp@intel.com>
 <564eb8e7-a4e1-49e6-a79d-da880a526540@riscstar.com>
 <20250415143137-GYB30887@gentoo>
 <9b52f950-9baf-4293-b211-82891b6f349e@riscstar.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b52f950-9baf-4293-b211-82891b6f349e@riscstar.com>

On Tue, Apr 15, 2025 at 11:03:12AM -0500, Alex Elder wrote:
> On 4/15/25 9:31 AM, Yixun Lan wrote:
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
> I asked Haylen to make this change.  Yes, we know the
> shift, but I much prefer specifying only a constant mask
> (which implies both the shift and the width) rather than
> a constant mask and shift (or width and shift).
> 
> If there's no way to avoid this S390 compile error, then
> adding the separate (and redundant) shift value back
> into all these definitions is a solution.

We could avoid the redundancy by specifying only width and shift and
move the call to GENMASK() into the macro, see my previous reply. To me
it doesn't look very different, it's just about where to invoke
GENMASK().

> 					-Alex

Thanks,
Haylen Chu

> 
> > 
> > > 
> > > 
> > > > 
> > > > > > drivers/clk/spacemit/ccu-k1.c:241:1: error: initializer element is not a compile-time constant
> > > >        241 | CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
> > > >            | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >      drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
> > > >         33 |         .num_shift      = __ffs(_num_mask),                                     \
> > > >            |                           ^~~~~~~~~~~~~~~~
> > > >      drivers/clk/spacemit/ccu-k1.c:242:1: error: initializer element is not a compile-time constant
> > > >        242 | CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
> > > >            | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >      drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
> > > >         33 |         .num_shift      = __ffs(_num_mask),                                     \
> > > >            |                           ^~~~~~~~~~~~~~~~
> > > >      2 errors generated.
> > > > 
> > > > 
> > > > vim +241 drivers/clk/spacemit/ccu-k1.c
> > > > 
> > > >      239	
> > > >      240	CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
> > > >    > 241	CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
> > > >      242	CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
> > > >      243	
> > > > 
> > > 
> > 
> 

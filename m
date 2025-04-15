Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F9E1B043F;
	Tue, 15 Apr 2025 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729031; cv=none; b=buGwRqHQWP36QmPizFEsMrQVuejsqYU2tYNAPNgJU+LAypm4qon9aVXAoe5XhjOTlYBU5VHyrufgL/fHXp1egK36v7GJzoe/2UB0CKIiJ+ZqhhT58Wtr1iEGhjqwVKGaoUDX6+3JOr5USINbpvEjpIEphvm/1wLPuSrPkvjgd00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729031; c=relaxed/simple;
	bh=Cyr+EIuO8w+HEM7GU+qBc+u9Xsvl28JimWj8Eo25IFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7wtspfDFgPekJ5RrhVegu6SPz8D3TH1BrcXxE7RXI6KGoHkz3qTEbWrCPMuEiyyKN56fHBCPDEK77VXHC7jwKDyX6IuNMyLq6rY9JcDFdVVr3MDRiID8EusKM6C1bla/nOHIUHX8BFUOHcU6+/24cPkXeMTR8Oi8mhIIhwy/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=b7R6XDv/; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=LqSeviW6; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="b7R6XDv/";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="LqSeviW6"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 703A812FB450;
	Tue, 15 Apr 2025 07:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744729026; bh=Cyr+EIuO8w+HEM7GU+qBc+u9Xsvl28JimWj8Eo25IFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b7R6XDv/s/JXGWCPvHif9fiKA5YVSbV98CzU/YtGEmg10cNBi2TX40ZEMTjtkslgF
	 FRfdp20QdCwO2AsikQiA5NGE8Bkamwjx/iN0Pqytu7kPkeQxCLPhqfZKN521vY7LpH
	 UO3NTRQLzce6lPCV9ahfP0Bm0CBzxgVuRtZMnLeWMFdmQcbH+d8VVk1wB7EoGFerPE
	 asjAM9QMOxlnTS0ZCW4MLkK/44pO+lHqA59ZLomrCMNc/wi19Zm8sVtPH6IWVFr/7I
	 B8CUWtZujGbOz5mCZpITZVkgCDgB86fHORw+rYTElOrflyYMfm3FjKtiMc1BE9tUjw
	 CU/V+BenGOyOA==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewq52a6vPoU5; Tue, 15 Apr 2025 07:57:02 -0700 (PDT)
Received: from ketchup (unknown [183.217.81.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 5A60812FB435;
	Tue, 15 Apr 2025 07:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744729022; bh=Cyr+EIuO8w+HEM7GU+qBc+u9Xsvl28JimWj8Eo25IFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqSeviW6Gs1IqB4xRnoqM6QNG1EGuD+WKNRyfsbBHF6LhZ56tONoDCCze6MYSQ1TG
	 c9jDLjdNDttu8f8ffrkA4dHWBZA6/VSnPadt2IzsELs/q0j8lgXstL64WGreQBL/f4
	 Mf9ULlRvw3eCgTeP2MEXzEHJ4asD/pKC89YsEYqK7qXA6eLAhFfJSGxx4jJNbQAHAQ
	 10ipUxdi3ouZsHi2zXNuUlIHgI6vyDjcpPnFnk7Cf3/vWMqHpNMU5zRiZ5snbBtA2k
	 bGdLcoBrdSRaUsy6vHwd7qaAMimZmrm4anISGag4J2Dhhh/cfxJ8NYgreAsloNr0dW
	 p11FAoEcmTf6w==
Date: Tue, 15 Apr 2025 14:56:57 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [spacemit:for-next 4/6] drivers/clk/spacemit/ccu-k1.c:241:1:
 error: initializer element is not a compile-time constant
Message-ID: <Z_5zudOYiNPJbeUR@ketchup>
References: <202504152107.7ekGPIrF-lkp@intel.com>
 <564eb8e7-a4e1-49e6-a79d-da880a526540@riscstar.com>
 <20250415143137-GYB30887@gentoo>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415143137-GYB30887@gentoo>

On Tue, Apr 15, 2025 at 02:31:37PM +0000, Yixun Lan wrote:
> Hi Alex,
> 
> On 09:16 Tue 15 Apr     , Alex Elder wrote:
> > On 4/15/25 8:44 AM, kernel test robot wrote:
> > > tree:   https://github.com/spacemit-com/linux for-next
> > > head:   9ead3efbc88a21e9a1f38948cc0902518022a2e5
> > > commit: e2d238ba301f25a5c8a7d490a36f9cd014d7aecc [4/6] clk: spacemit: Add clock support for SpacemiT K1 SoC
> > > config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/config)
> > > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202504152107.7ekGPIrF-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > 
> > If I'm interpreting this right, this seems to be a problem on
> > a S390 build (under COMPILE_TEST), because there is no constant
> > version of the __ffs() for that architecture.  This might be the
> > case on other architectures as well.
> > 
> > On RISC-V, this is fine.
> > 
> > Any recommendations on how to address this?
> > 
> it occur to me the __ffs() isn't really necessary, since all input
> is constant value (GENMASK here), we then should know the shift..

I'll second this: instead of calculating the LSB from bitmask in
compilation time, we could derive bitmask from LSB/MSB of the field:
taking slow_uart2_48 as example, this means changing current definition
to

	CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1,
		       28, 16, 12, 0, 0);

> > 
> > 
> > > 
> > >>> drivers/clk/spacemit/ccu-k1.c:241:1: error: initializer element is not a compile-time constant
> > >       241 | CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
> > >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >     drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
> > >        33 |         .num_shift      = __ffs(_num_mask),                                     \
> > >           |                           ^~~~~~~~~~~~~~~~
> > >     drivers/clk/spacemit/ccu-k1.c:242:1: error: initializer element is not a compile-time constant
> > >       242 | CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
> > >           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >     drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
> > >        33 |         .num_shift      = __ffs(_num_mask),                                     \
> > >           |                           ^~~~~~~~~~~~~~~~
> > >     2 errors generated.
> > > 
> > > 
> > > vim +241 drivers/clk/spacemit/ccu-k1.c
> > > 
> > >     239	
> > >     240	CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
> > >   > 241	CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
> > >     242	CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
> > >     243	
> > > 
> > 
> 
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

Regards,
Haylen Chu

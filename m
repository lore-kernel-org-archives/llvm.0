Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76122232A;
	Sun, 23 Jun 2024 20:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176037; cv=none; b=DA/xRuVUSt5/iNDsF8zt0sL2JR17gU6P8sh2qr4LsCJJ0axN+o230bwMBI1hHLaAyJnHULy4W19tk37zBYuhuxG79+G2NHi5Hlb1JMDGt7LZ4gfr99qqd/dceTb05ybrYYTr7Zw7qMGeVgAdGSs7T0uCaxMJuftcAOLb859fX2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176037; c=relaxed/simple;
	bh=kHSQ+DhGcPydWmByZscLjbK/iRG71P9x6ZPTC5iumxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvWO00h/Or6RbA8Ds7O1UtbPtMRspbGx2SUo8EscvBE9dPq3rTMrGDNFU6IC543eEDT7NwFESVXsrE1gDifHEideEA6711RmL2/1l/B8EJfVmpuh37cV141cjtpXwjJ0PUKkPqGil31xaoKGBI7LkAUzefoVRVUHbfoCdGG8iFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875a87.versanet.de ([83.135.90.135] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sLUDb-0005P6-T6; Sun, 23 Jun 2024 22:53:47 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Alex Bee <knaerzche@gmail.com>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject:
 Re: [linux-next:master 4036/7797] drivers/clk/rockchip/clk-rk3128.c:582:40:
 error: use of undeclared identifier 'CLK_NR_CLKS'
Date: Sun, 23 Jun 2024 22:53:47 +0200
Message-ID: <74749310.RN2Pgac3cq@diego>
In-Reply-To: <202406240243.f4Ux9lv5-lkp@intel.com>
References: <202406240243.f4Ux9lv5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 23. Juni 2024, 20:20:48 CEST schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f76698bd9a8ca01d3581236082d786e9a6b72bb7
> commit: 9f22b4fbd4c6d27ca4e5f8fa6632e6d7a846af28 [4036/7797] dt-bindings: clock: rk3128: Drop CLK_NR_CLKS
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20240624/202406240243.f4Ux9lv5-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240624/202406240243.f4Ux9lv5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406240243.f4Ux9lv5-lkp@intel.com/
> 
> Note: the linux-next/master HEAD f76698bd9a8ca01d3581236082d786e9a6b72bb7 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/rockchip/clk-rk3128.c:582:40: error: use of undeclared identifier 'CLK_NR_CLKS'
>            ctx = rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
>                                                  ^
>    1 error generated.

This was caused by the split across branches that was needed for
binding-, dts- and clock driver changes.

So yes when everything came together it build, but caused build-
failures on one of my devicetree branches.
I've restructured things to not cause build failures.



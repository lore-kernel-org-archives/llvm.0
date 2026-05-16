Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB6372ED2;
	Sat, 16 May 2026 06:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778911484; cv=none; b=Feo/oFfJ3yHjPz93fRQmeIIQoetDf/BccIaFf3h8UA/t3Z2y4wWv6aZSrnkjLcpjrwSXSOWP3NpPSefDUObqaDeGpUFW2KG1o7bwM3B951Cxo4OEGVI+ZDSPppUjtq8M4fkkKFWAZUQAH9RKNqgxsh8NzBkqUnOCxbSxcqNU+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778911484; c=relaxed/simple;
	bh=+Nd7NBK9ezZCnoEquVvc+QMIM9bolU/iverW1HEQlyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/HU3jaX2XvssExl6Hor4uh5MvzZ5JRsJrKlYXJz2CCGJcGPrrClLvH/zimiw5C98iQDfFiOK6rTqlvth+bQk5fdpr3WgS/d3JUjWytT7CkvAry5T/mhpaAxIkD9hNN/p7zpmrCZX1MLc3gedkz6Q1vYtXM7StUFeQtXrUqjL+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=r2vHW/Na; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="r2vHW/Na"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+ao6wXEhooVRcnZt4rQmqQJlCn1ZkmaFdC1XVZBi1Zo=; b=r2vHW/NaWRtEH6XNyAcelMkUel
	IwQx8O2c2FhihtX3uFGvkc2SA8vz+1QlOxAIIanG468HM+0EcRlZdNU1kEceOJ8UzUgEZsY10pJxC
	p/zmkfdDWo8t90i+6Tgs2bfvd8F7gUqYu/sUNPdU9iCxrcszhJ8UA227Hql6G3S2LA9b4yhPj8eQv
	2kEk7lPt2CUbT7qjrPcLJxeeEgao6KQam/rh3N84Kb3vrEwxGjNu3mH/NpBP3rK/yBykzn2C8YTaO
	w9b9Xf0HXBtzAoVit4yj+poOHn0Sm3J+1mNumeG0tisK0tk2bC8XpZ/+8d4iSBf/9jmNetFilOpEG
	iB1xjsFQ==;
Received: from [91.102.182.218] (helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wO88c-0000000HYIL-09kZ;
	Sat, 16 May 2026 08:04:38 +0200
Date: Sat, 16 May 2026 08:04:32 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [sunxi:sunxi/dt-for-7.2 2/4] FATAL ERROR: Syntax error parsing
 input tree
Message-ID: <pn7ufcvpsj5yhh5m6oxcrg5yz6sbgtexgrlctip7xs4z226voj@sxd7trehvuq7>
References: <202605111200.am4cLJ4C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605111200.am4cLJ4C-lkp@intel.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl

On Mon, May 11, 2026 at 12:09:06PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/dt-for-7.2
> head:   c6895beaf5eab889ebdaffeb6210ad1111f3e72e
> commit: 7c86694a7b8c9a0b2e29b312b21fcaf61d54b474 [2/4] riscv: dts: allwinner: d1s-t113: add hstimer node
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260511/202605111200.am4cLJ4C-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111200.am4cLJ4C-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605111200.am4cLJ4C-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    Lexical error: arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi:301.18-25 Unexpected 'GIC_SPI'
>    Lexical error: arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi:302.11-18 Unexpected 'GIC_SPI'
> >> FATAL ERROR: Syntax error parsing input tree
>

This appears to be fixed in the current sunxi/dt-for-7.2 branch. The
hstimer node now uses SOC_PERIPHERAL_IRQ() instead of GIC_SPI.

Michal

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

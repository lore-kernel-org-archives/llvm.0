Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC426C3BE
	for <llvm@lists.linux.dev>; Mon,  1 Sep 2025 07:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756711610; cv=none; b=Mylaz0MmzUry/DI9XEry5EI4wqumduSakpxjdrmYFIbyV9zjgqcpHLrOp8ioiHviNc7+zDW6F2jrxJqNOH1esAQfo1HbjU1k9ZXUFfAQ7xomWM1wDOIsWc8It2KzAMaW0miBMqMwlsIUOJ4ATUcq1WYO/e7diyk31VIC+i7MNfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756711610; c=relaxed/simple;
	bh=pSHwAFwOfxOBvMo2kM3V6r4cQ6ye7Bys4JLLOIbr5PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu7kxo6Z72O2oMtfjqEXN6AH6Okynuhfp+hi8txDH7W3hnCRgdAbIb7kIvtd6WEiKpcwC2LCNLPErhmbqAQggnvirjRLkOpF14qFXdQYWkLnEENpLXzFOAp8rFledO4V+44ezTJTpBFgrOvFKmtAyrv7boEizsHQdwiP6MhP9Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rF5xMTXk; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rF5xMTXk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E930A1A0D7C;
	Mon,  1 Sep 2025 07:26:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFF1060699;
	Mon,  1 Sep 2025 07:26:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A0761C22C8BB;
	Mon,  1 Sep 2025 09:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756711599; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=xX3xnbfaXObDKRcnsl31P/YbYD6AiX8y2WIn/LzP6VQ=;
	b=rF5xMTXk0xL8N4aA2p82VmeP5KdoSALmQXlcJp5aOLjhIxxTslGkfghuWytMMJTr7pLOFJ
	V8SB33LvJOhKvd78TOhZ8gO033NN1Fuchh55r9A8IvMRB3LF5OdWqqHbscQZnG8GizfmVm
	B3e4fs6fQ7Vw9w26+gD3Ha5+0529+9BNQEYLk5s1gdaFpFiT49cLzItL1ela11+OMJjDh+
	0Dn0EfXx6MWZkyPmZNQEEkOJ+TG4nMGd61v7xPGcXRfVHa7H9Db5NA2dVVq9O/9SXl5f9j
	EFU55zXk2fdMfJZEqnpBbijIU3CHzfq/7WGsxVnxJ9tgAtLH+v/K002xK+JBFw==
Date: Mon, 1 Sep 2025 09:26:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Jorge Marques <jorge.marques@analog.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: drivers/i3c/master/../internals.h:53:9: error: passing 'const
 void *' to parameter of type 'void *' discards qualifiers
Message-ID: <20250901072635d908c251@mail.local>
References: <202509011442.yweEPWw4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509011442.yweEPWw4-lkp@intel.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 01/09/2025 14:25:03+0800, kernel test robot wrote:
> Hi Jorge,
> 
> FYI, the error/warning still remains.

The issue is not in the i3c code but in the sparc64 code.

> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b320789d6883cc00ac78ce83bccbfe7ed58afcf0
> commit: c20d3fa7049144f519b21616e6020e6939822145 i3c: master: cdns: Use i3c_writel_fifo() and i3c_readl_fifo()
> date:   5 weeks ago
> config: sparc64-randconfig-001-20250901 (https://download.01.org/0day-ci/archive/20250901/202509011442.yweEPWw4-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250901/202509011442.yweEPWw4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509011442.yweEPWw4-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/i3c/master/i3c-master-cdns.c:26:
> >> drivers/i3c/master/../internals.h:53:9: error: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>       53 |         readsl(addr, buf, nbytes / 4);
>          |                ^~~~
>    arch/sparc/include/asm/io_64.h:265:41: note: passing argument to parameter 'port' here
>      265 | static inline void readsl(void __iomem *port, void *buf, unsigned long count)
>          |                                         ^
>    1 error generated.
> 
> 
> vim +53 drivers/i3c/master/../internals.h
> 
> 733b439375b494 Jorge Marques 2025-06-24  43  
> 733b439375b494 Jorge Marques 2025-06-24  44  /**
> 733b439375b494 Jorge Marques 2025-06-24  45   * i3c_readl_fifo - Read data buffer from 32bit FIFO
> 733b439375b494 Jorge Marques 2025-06-24  46   * @addr: FIFO Address to read from
> 733b439375b494 Jorge Marques 2025-06-24  47   * @buf: Pointer to the buffer to store read bytes
> 733b439375b494 Jorge Marques 2025-06-24  48   * @nbytes: Number of bytes to read
> 733b439375b494 Jorge Marques 2025-06-24  49   */
> 733b439375b494 Jorge Marques 2025-06-24  50  static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
> 733b439375b494 Jorge Marques 2025-06-24  51  				  int nbytes)
> 733b439375b494 Jorge Marques 2025-06-24  52  {
> 733b439375b494 Jorge Marques 2025-06-24 @53  	readsl(addr, buf, nbytes / 4);
> 733b439375b494 Jorge Marques 2025-06-24  54  	if (nbytes & 3) {
> 733b439375b494 Jorge Marques 2025-06-24  55  		u32 tmp;
> 733b439375b494 Jorge Marques 2025-06-24  56  
> 733b439375b494 Jorge Marques 2025-06-24  57  		tmp = readl(addr);
> 733b439375b494 Jorge Marques 2025-06-24  58  		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
> 733b439375b494 Jorge Marques 2025-06-24  59  	}
> 733b439375b494 Jorge Marques 2025-06-24  60  }
> 733b439375b494 Jorge Marques 2025-06-24  61  
> 
> :::::: The code at line 53 was first introduced by commit
> :::::: 733b439375b494e8a6950ab47d18a4b615b73cb3 i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()
> 
> :::::: TO: Jorge Marques <jorge.marques@analog.com>
> :::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

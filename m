Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E64A15B0EF;
	Wed, 13 Nov 2024 22:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731538249; cv=none; b=MVzOHa9PQZwIDBW56G1Hd8ir/KMy33EspYQjVIY+NNei9utt+G1zNksQbgHpJR/pAcEh4+N6/Oq9zN97JBFVvpZG5sO3PAcal0I2W0Odvc7raPMe2EEnFSRYcA+9SzOs06moEYFLsihDWt4+LbE+tTOJh7upKSI4MtwzSppWi1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731538249; c=relaxed/simple;
	bh=c6tlelKl4fRAEbGBWpVDnypfAPx1muTJuLUyMuX5Qes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8tM5v1MUaHa3oL8VeYLM4ZIKsJXWmGbIrb0OLsA+wOJdINVHXKReYaq7ecFcHDNzk9ygr8Qalz3SZ7bbGjaxhSbhN4ea50+T0AI8xpd4UbmRpToP5lYkGrV59zHQYdxMhgpXY1Qr29MCU/llPvigJTO0WArDAXcan85FOL7QpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHqW8e7p; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHqW8e7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731538247; x=1763074247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c6tlelKl4fRAEbGBWpVDnypfAPx1muTJuLUyMuX5Qes=;
  b=SHqW8e7po0QjBaXUNOjhB7DBbIFVDFov/aH4jFCZFj47go0YPoe3U6y8
   s9Fs1773FSWjJx4fN9Ee29UGTRBSaTWNg6mUdxoTwGSWbFI8ymmgEWshR
   CvRUOpO0Gb+quKSOX6H2GxZNInhGwuphv9+oJuX0FuyZitSgQjKCxPHgA
   gX893n58JCjUgwobjPvdj0RTHCRU6E2/WSQxCDsvpwZojMDx2Jxx7jBn3
   fvMGE4mrcoF5alPaDkZux7mNJhE+RPDgxK4skH0HKi4HaBMaaabSuhGK5
   LnmBXFO9zK2FCP/LdVPezFFkysq+fAsk1txSTbDsyDxpywa/MummQVZTI
   g==;
X-CSE-ConnectionGUID: sznkE9raQ4CuViClzbck8Q==
X-CSE-MsgGUID: GImWnyHTRviXIDqTY7riGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30862584"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="30862584"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 14:50:46 -0800
X-CSE-ConnectionGUID: YQLVoXNmQRGjLuczOHvMJw==
X-CSE-MsgGUID: lZTBUDS7SGqNplawA5kUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88806291"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2024 14:50:45 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBMCB-0000o2-0Y;
	Wed, 13 Nov 2024 22:50:43 +0000
Date: Thu, 14 Nov 2024 06:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] serial: amba-pl011: Fix RX stall when DMA is used
Message-ID: <202411140617.nkjeHhsK-lkp@intel.com>
References: <20241113092629.60226-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113092629.60226-1-kkartik@nvidia.com>

Hi Kartik,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus soc/for-next linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kartik-Rajput/serial-amba-pl011-Fix-RX-stall-when-DMA-is-used/20241113-172830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20241113092629.60226-1-kkartik%40nvidia.com
patch subject: [PATCH v2] serial: amba-pl011: Fix RX stall when DMA is used
config: arm-randconfig-004-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140617.nkjeHhsK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140617.nkjeHhsK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140617.nkjeHhsK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/amba-pl011.c:1822:11: error: no member named 'using_rx_dma' in 'struct uart_amba_port'
           if (uap->using_rx_dma) {
               ~~~  ^
>> drivers/tty/serial/amba-pl011.c:1823:8: error: no member named 'dmacr' in 'struct uart_amba_port'
                   uap->dmacr |= UART011_RXDMAE;
                   ~~~  ^
   drivers/tty/serial/amba-pl011.c:1824:20: error: no member named 'dmacr' in 'struct uart_amba_port'
                   pl011_write(uap->dmacr, uap, REG_DMACR);
                               ~~~  ^
   3 errors generated.


vim +1822 drivers/tty/serial/amba-pl011.c

  1808	
  1809	static void pl011_unthrottle_rx(struct uart_port *port)
  1810	{
  1811		struct uart_amba_port *uap = container_of(port, struct uart_amba_port, port);
  1812		unsigned long flags;
  1813	
  1814		uart_port_lock_irqsave(&uap->port, &flags);
  1815	
  1816		uap->im = UART011_RTIM;
  1817		if (!pl011_dma_rx_running(uap))
  1818			uap->im |= UART011_RXIM;
  1819	
  1820		pl011_write(uap->im, uap, REG_IMSC);
  1821	
> 1822		if (uap->using_rx_dma) {
> 1823			uap->dmacr |= UART011_RXDMAE;
  1824			pl011_write(uap->dmacr, uap, REG_DMACR);
  1825		}
  1826	
  1827		uart_port_unlock_irqrestore(&uap->port, flags);
  1828	}
  1829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

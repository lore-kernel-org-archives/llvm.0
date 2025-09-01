Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB8A258ED8;
	Mon,  1 Sep 2025 06:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756707957; cv=none; b=n6DxUXv4hIrfKDEkTJlQcqkofuryyHm5pPDBeqaTLW5uLgPYAxHFjRPn729vxKejgVF86LZNOo9wmeq1p7CxRKHNSYgCWbQ5KdfDbU6o4xBz72LkpNm3nV/RN3vzR/NHSvJ5SpE23yvzAAqTaxVsSrmFwcsy93u1OVHIJMQvKYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756707957; c=relaxed/simple;
	bh=0XF0fhL9Q6yHz0dNLpM5f+vC3Vfe1E+LvLHi7lzYfLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/MYA09OITXD7UcnxUNXZETQI+7QWi/utgte6ccs3gUwtSEVHz95qQwcXHtSFcujvL824EZXP0LzDnNBhRxvqkJuvgZXXek8Pic5acditN7Uwjc2iZaLMgdqJDHL5qMpeMHf0w7oj12CcCiJoAIrlZwn/Gc/oMcrgEnU3DLYtF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLVdRAq7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLVdRAq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756707955; x=1788243955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0XF0fhL9Q6yHz0dNLpM5f+vC3Vfe1E+LvLHi7lzYfLQ=;
  b=aLVdRAq7YQokQxt6+R5F1VcFisnBfkIocO5hOh7IjBkhnC6BM6cid8hS
   z5vtW8I2/Jrqnx8jhM/V5ju+OcvEN9+0cjIfjsEJKCX8bbCl/GqSfIzt1
   4l6VHY4YqUidoVsjm2RpOECQOFaYwLvUQcPCASQ+0DvvTV+6ZA20M5ICp
   Q0tej4CdpOvhBH56M1nqhDowN0+b7BV9DFk0yztQ6L7ycGHHo7gCzZclP
   QARNzoKsvT1CftziOMgwJFknuxPEJTO7HPvyy3RcH3UZduoR/pUiZCS6V
   kYKDLTLGC6BmBWPJNt/JeMFEd7uddrgMzAjkUZ5fDIH4yVDGEKuCrK8z2
   g==;
X-CSE-ConnectionGUID: 0+AUXNnVRyGsKe4ksdxCvw==
X-CSE-MsgGUID: UKNFKq3bQOurpPJQReNwMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="76350085"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="76350085"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 23:25:54 -0700
X-CSE-ConnectionGUID: MD+fzlBFRcKqYq5qb9hWsg==
X-CSE-MsgGUID: JsUP8CjNSLudjfSi3DbsZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="176152265"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 Aug 2025 23:25:52 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usxzC-0000Hz-1L;
	Mon, 01 Sep 2025 06:25:50 +0000
Date: Mon, 1 Sep 2025 14:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: drivers/i3c/master/../internals.h:53:9: error: passing 'const void
 *' to parameter of type 'void *' discards qualifiers
Message-ID: <202509011442.yweEPWw4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jorge,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b320789d6883cc00ac78ce83bccbfe7ed58afcf0
commit: c20d3fa7049144f519b21616e6020e6939822145 i3c: master: cdns: Use i3c_writel_fifo() and i3c_readl_fifo()
date:   5 weeks ago
config: sparc64-randconfig-001-20250901 (https://download.01.org/0day-ci/archive/20250901/202509011442.yweEPWw4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250901/202509011442.yweEPWw4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509011442.yweEPWw4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i3c/master/i3c-master-cdns.c:26:
>> drivers/i3c/master/../internals.h:53:9: error: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      53 |         readsl(addr, buf, nbytes / 4);
         |                ^~~~
   arch/sparc/include/asm/io_64.h:265:41: note: passing argument to parameter 'port' here
     265 | static inline void readsl(void __iomem *port, void *buf, unsigned long count)
         |                                         ^
   1 error generated.


vim +53 drivers/i3c/master/../internals.h

733b439375b494 Jorge Marques 2025-06-24  43  
733b439375b494 Jorge Marques 2025-06-24  44  /**
733b439375b494 Jorge Marques 2025-06-24  45   * i3c_readl_fifo - Read data buffer from 32bit FIFO
733b439375b494 Jorge Marques 2025-06-24  46   * @addr: FIFO Address to read from
733b439375b494 Jorge Marques 2025-06-24  47   * @buf: Pointer to the buffer to store read bytes
733b439375b494 Jorge Marques 2025-06-24  48   * @nbytes: Number of bytes to read
733b439375b494 Jorge Marques 2025-06-24  49   */
733b439375b494 Jorge Marques 2025-06-24  50  static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
733b439375b494 Jorge Marques 2025-06-24  51  				  int nbytes)
733b439375b494 Jorge Marques 2025-06-24  52  {
733b439375b494 Jorge Marques 2025-06-24 @53  	readsl(addr, buf, nbytes / 4);
733b439375b494 Jorge Marques 2025-06-24  54  	if (nbytes & 3) {
733b439375b494 Jorge Marques 2025-06-24  55  		u32 tmp;
733b439375b494 Jorge Marques 2025-06-24  56  
733b439375b494 Jorge Marques 2025-06-24  57  		tmp = readl(addr);
733b439375b494 Jorge Marques 2025-06-24  58  		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
733b439375b494 Jorge Marques 2025-06-24  59  	}
733b439375b494 Jorge Marques 2025-06-24  60  }
733b439375b494 Jorge Marques 2025-06-24  61  

:::::: The code at line 53 was first introduced by commit
:::::: 733b439375b494e8a6950ab47d18a4b615b73cb3 i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()

:::::: TO: Jorge Marques <jorge.marques@analog.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F278353A70;
	Sat, 29 Aug 2026 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788043486; cv=none; b=G1vBQKDlgfqAgPVjMIOScdxG5sMC1ED+/V8NgIMxUVUU+3XNBgT7QosrBrQO20jikTFc00QHkoM5Fn2MsCp4vKYIY7whr1W80KRtyzu5nSg2T0d7WxAKaKOSEMt2b6K0CfId7OBec19LOHHUYbGDDy9bb7GNN3NU7ZrEifrHrHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788043486; c=relaxed/simple;
	bh=HfXOPYiQK/YM2QEojyJhce1ISfTgkWFsV0jOgHqE28k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lp9nXUF0BF3TZGK5I/2dDBgl+oaLwaKOBxgDsyZzn3dMVwPsfgSy5vnlSAeZaWXb0e/kyHZXtZ98Awtc7+YKgL6DI3Fd8RRh6/AX3thZ0iLk6TxTTi73e0uKnJbiBs8/4NzuYykNZlUHRimtXUufd+jTpcAwNETxqkz+gdd4GEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egtnIw+M; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egtnIw+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788043483; x=1819579483;
  h=date:from:to:cc:subject:message-id;
  bh=HfXOPYiQK/YM2QEojyJhce1ISfTgkWFsV0jOgHqE28k=;
  b=egtnIw+M+BkAJRNA8s1wWh4ui8/NBb/4BUNlnP54WcD+PtGZAfPBjb9a
   eL4tyxSgT8NawJrPJoK81esA3D5tSFSmTmIgy2bIat5c5jQ0BqDALI2za
   424bWAYc4EW3Y7jLHfoa8VuryuChIGnN9Z3oYZVr5AT9SNa3oNHAsURxE
   CreiacsvdRx+nMI6yJl/OwN+mBJYV6BHVNOR2MfbvqEeXTn8hKaRVUhlA
   OmprSjm2if6ClokXhBcgtMZGnfecS/SBsFyAlBl/WCij0h8yXctYNfLYy
   X6CcJQWcbEL0Qd7D/yDtW/+zUw80VETlPoTPZm9myyE+p2/NV/HzsFLU2
   Q==;
X-CSE-ConnectionGUID: TLWbcsIdQHe0mdRK9HACqQ==
X-CSE-MsgGUID: aWUvbi8jRiCXZvqSrbOkGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="87639343"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="87639343"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 15:44:43 -0700
X-CSE-ConnectionGUID: c+Z8bRaPQJesrCxOtbWCyw==
X-CSE-MsgGUID: q2rtvdrAR3qH/Iva2WC30w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="272261984"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Aug 2026 15:44:41 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0Rmv-00000000DMy-3lAt;
	Sat, 29 Aug 2026 22:44:37 +0000
Date: Sun, 30 Aug 2026 06:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Frank Li <Frank.Li@nxp.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 493/1141]
 drivers/i3c/master/adi-i3c-master.c:138:53: error: too few arguments to
 function call, expected 4, have 3
Message-ID: <202608300626.3C54RrZP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   f383cb113baa454c4d49e574c4c3e56e76d33dbc
commit: 0416cf605b2c4987b4721b145b0cc001cb4cdf3a [493/1141] i3c: master: Add endianness support for i3c_readl_fifo() and i3c_writel_fifo()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260830/202608300626.3C54RrZP-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608300626.3C54RrZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608300626.3C54RrZP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i3c/master/adi-i3c-master.c:138:53: error: too few arguments to function call, expected 4, have 3
     138 |         i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, m);
         |         ~~~~~~~~~~~~~~~                                    ^
   drivers/i3c/master/../internals.h:39:20: note: 'i3c_writel_fifo' declared here
      39 | static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
         |                    ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |                                    int nbytes, enum i3c_fifo_endian endian)
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/adi-i3c-master.c:144:57: error: too few arguments to function call, expected 4, have 3
     144 |         i3c_readl_fifo(master->regs + REG_SDI_FIFO, buf, nbytes);
         |         ~~~~~~~~~~~~~~                                         ^
   drivers/i3c/master/../internals.h:66:20: note: 'i3c_readl_fifo' declared here
      66 | static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
         |                    ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      67 |                                   int nbytes, enum i3c_fifo_endian endian)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/i3c/master/renesas-i3c.c:838:62: error: too few arguments to function call, expected 4, have 3
     838 |                         i3c_writel_fifo(i3c->regs + NTDTBP0, cmd->tx_buf, cmd->len);
         |                         ~~~~~~~~~~~~~~~                                           ^
   drivers/i3c/master/../internals.h:39:20: note: 'i3c_writel_fifo' declared here
      39 | static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
         |                    ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |                                    int nbytes, enum i3c_fifo_endian endian)
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/renesas-i3c.c:1024:62: error: too few arguments to function call, expected 4, have 3
    1024 |                         i3c_writel_fifo(i3c->regs + NTDTBP0, cmd->tx_buf, cmd->len);
         |                         ~~~~~~~~~~~~~~~                                           ^
   drivers/i3c/master/../internals.h:39:20: note: 'i3c_writel_fifo' declared here
      39 | static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
         |                    ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      40 |                                    int nbytes, enum i3c_fifo_endian endian)
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/renesas-i3c.c:1064:68: error: too few arguments to function call, expected 4, have 3
    1064 |                         i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, bytes_remaining);
         |                         ~~~~~~~~~~~~~~                                                  ^
   drivers/i3c/master/../internals.h:66:20: note: 'i3c_readl_fifo' declared here
      66 | static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
         |                    ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      67 |                                   int nbytes, enum i3c_fifo_endian endian)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/renesas-i3c.c:1206:63: error: too few arguments to function call, expected 4, have 3
    1206 |                         i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, read_bytes);
         |                         ~~~~~~~~~~~~~~                                             ^
   drivers/i3c/master/../internals.h:66:20: note: 'i3c_readl_fifo' declared here
      66 | static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
         |                    ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      67 |                                   int nbytes, enum i3c_fifo_endian endian)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +138 drivers/i3c/master/adi-i3c-master.c

a79ac2cdc91d6b Jorge Marques     2025-08-27  130  
a79ac2cdc91d6b Jorge Marques     2025-08-27  131  static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
a79ac2cdc91d6b Jorge Marques     2025-08-27  132  					 const u8 *buf, unsigned int nbytes)
a79ac2cdc91d6b Jorge Marques     2025-08-27  133  {
a79ac2cdc91d6b Jorge Marques     2025-08-27  134  	unsigned int n, m;
a79ac2cdc91d6b Jorge Marques     2025-08-27  135  
a79ac2cdc91d6b Jorge Marques     2025-08-27  136  	n = readl(master->regs + REG_SDO_FIFO_ROOM);
a79ac2cdc91d6b Jorge Marques     2025-08-27  137  	m = min(n, nbytes);
8a1f3fd1a89cd1 Alexandre Belloni 2025-09-24 @138  	i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, m);
a79ac2cdc91d6b Jorge Marques     2025-08-27  139  }
a79ac2cdc91d6b Jorge Marques     2025-08-27  140  

:::::: The code at line 138 was first introduced by commit
:::::: 8a1f3fd1a89cd1d4acccb0181346ad212a275a69 i3c: master: adi: fix number of bytes written to fifo

:::::: TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

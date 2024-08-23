Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF00713FD72;
	Fri, 23 Aug 2024 08:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724401284; cv=none; b=rZ2iCGi9hLXSssR/a4ARi/8KAWtduAu1ssPrnRp0/Fl+XBhbUEFZtJt8Hld+YxmQez3cLZ+qA8DCqUOiiI4eNnrfOLMG8Pu/LxNxxrSroeQmllsv9bwnrDBxbduMIJjCJnQ7v5U/dfPiSF37acHS5DK5xz3Pg5vjHK+Jb7G1N18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724401284; c=relaxed/simple;
	bh=g625q9iLZjr5CiEQXuS8hAeVGvfHv4tJVA/jZRo4WSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jalzBr8NUGcowF4Cql1k5DSwnazCpRq4LBSOUZ6HjOX72bl533wgaNVZSyDVMh8aI35n3t9lBm4BRDkbLkNyHKd7zAtB5j496f4Y4xI7yrIoGOSITxP5MD6LkawBbCwq5xihzuDM37PCdVvzmT2qy2b7kNanF7BFKwBfSoXSEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vs9YRKal; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vs9YRKal"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724401283; x=1755937283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g625q9iLZjr5CiEQXuS8hAeVGvfHv4tJVA/jZRo4WSk=;
  b=Vs9YRKalG6vlpq1aH2D4BDItwcqpADwgRqJvaqxaZ+6maBkDfiZsBI6f
   cpZq9h72baAWLBE/OLsecZkpWcEfvqgdZ2FvUnLtSYsUBCzNRilnQNeXY
   wtyfAXFROCrHGfBXJDEax1j3ICA+cbTmLxbNzO8z25k2/BJRL3CEp8WWw
   0Em5bnEF+lu5qjnFChLRODWrfd+UXUqfkoDuBLyWF6+8CVfETODSJqm5u
   LfJKPk7ReQBet2z9goUtFY3Yly+cpSGINZuxkAy7g3Bdgs/luC+t0J6Pp
   LlbkRxhFCAd4XqolyWwJRR3/mEqcHScuwbjFhZr5vSqh7kRrNNFMRN665
   g==;
X-CSE-ConnectionGUID: sw6x2HP6SBOTmmpvN0eSzg==
X-CSE-MsgGUID: fXeJIbRwT5OTGQ+7aVQIbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34275274"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="34275274"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 01:21:22 -0700
X-CSE-ConnectionGUID: QbmLwHRcQU637XnNuLj6gw==
X-CSE-MsgGUID: 3hY1yftMROmy/jDO/2V3OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="61869761"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Aug 2024 01:21:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shPXq-000DaO-2w;
	Fri, 23 Aug 2024 08:21:18 +0000
Date: Fri, 23 Aug 2024 16:20:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:net-encx24j600-regmap-locking 2/2]
 drivers/net/ethernet/microchip/encx24j600.c:178:24: error: no member named
 'mutex' in 'struct encx24j600_context'
Message-ID: <202408231643.YgUWJsfo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git net-encx24j600-regmap-locking
head:   f0468e3490ad91b1ed822abd6e641017305c9024
commit: f0468e3490ad91b1ed822abd6e641017305c9024 [2/2] net: encx24j600: Use standard regmap locking
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240823/202408231643.YgUWJsfo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231643.YgUWJsfo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231643.YgUWJsfo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/microchip/encx24j600.c:11:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/ethernet/microchip/encx24j600.c:11:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/microchip/encx24j600.c:11:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/microchip/encx24j600.c:11:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/net/ethernet/microchip/encx24j600.c:178:24: error: no member named 'mutex' in 'struct encx24j600_context'
     178 |         mutex_lock(&priv->ctx.mutex);
         |                     ~~~~~~~~~ ^
   include/linux/mutex.h:161:44: note: expanded from macro 'mutex_lock'
     161 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                                            ^~~~
   drivers/net/ethernet/microchip/encx24j600.c:180:26: error: no member named 'mutex' in 'struct encx24j600_context'
     180 |         mutex_unlock(&priv->ctx.mutex);
         |                       ~~~~~~~~~ ^
   drivers/net/ethernet/microchip/encx24j600.c:190:24: error: no member named 'mutex' in 'struct encx24j600_context'
     190 |         mutex_lock(&priv->ctx.mutex);
         |                     ~~~~~~~~~ ^
   include/linux/mutex.h:161:44: note: expanded from macro 'mutex_lock'
     161 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                                            ^~~~
   drivers/net/ethernet/microchip/encx24j600.c:192:26: error: no member named 'mutex' in 'struct encx24j600_context'
     192 |         mutex_unlock(&priv->ctx.mutex);
         |                       ~~~~~~~~~ ^
   7 warnings and 4 errors generated.


vim +178 drivers/net/ethernet/microchip/encx24j600.c

d70e53262f5cfc Jon Ringle        2015-10-06  172  
d70e53262f5cfc Jon Ringle        2015-10-06  173  static int encx24j600_raw_read(struct encx24j600_priv *priv, u8 reg, u8 *data,
d70e53262f5cfc Jon Ringle        2015-10-06  174  			       size_t count)
d70e53262f5cfc Jon Ringle        2015-10-06  175  {
d70e53262f5cfc Jon Ringle        2015-10-06  176  	int ret;
b822ee6c5e5ba1 Jeroen De Wachter 2016-12-12  177  
d70e53262f5cfc Jon Ringle        2015-10-06 @178  	mutex_lock(&priv->ctx.mutex);
d70e53262f5cfc Jon Ringle        2015-10-06  179  	ret = regmap_encx24j600_spi_read(&priv->ctx, reg, data, count);
d70e53262f5cfc Jon Ringle        2015-10-06  180  	mutex_unlock(&priv->ctx.mutex);
d70e53262f5cfc Jon Ringle        2015-10-06  181  
d70e53262f5cfc Jon Ringle        2015-10-06  182  	return ret;
d70e53262f5cfc Jon Ringle        2015-10-06  183  }
d70e53262f5cfc Jon Ringle        2015-10-06  184  

:::::: The code at line 178 was first introduced by commit
:::::: d70e53262f5cfc0b88a211ef9cbd1ca5256f4a6b net: Microchip encx24j600 driver

:::::: TO: Jon Ringle <jringle@gridpoint.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

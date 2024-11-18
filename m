Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B3D198833;
	Mon, 18 Nov 2024 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731927145; cv=none; b=qeLyXFm55kW9yqIAT2tEil7R54TGLVhiHTvRni4A7vp6Lm9gpHgKeEhpewS9dYmoGEdR6tu0sJb3iSsdmhSndC/y/06A4JA4kT/+qOhHuklx0bohoKo8NW4ZWL+45ECrXoPvbm9/BHT88kes/NjiZ5UiFK9/G9gQDFcrlu7b2Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731927145; c=relaxed/simple;
	bh=sy2XdQWkINPlVrNge4ZXjCggURMOzyukq471sQH4hyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MRYtrbbdy/xVnlWjc6OMQLBEbLu4+IImzqF+8MI+TNcvpE7u5v+RzLxC/Ki8KMatdlbRDYbOoLePxw3DtXL5WmEo3zvf4IHwzDgrgAv/rpzwoAXYxvWhEiJ4I3URGGHr10Mupt/UneKeRP9b1MH4BAyEt0E9/HE9W31Gn1hWdMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABxCukzi; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABxCukzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731927144; x=1763463144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sy2XdQWkINPlVrNge4ZXjCggURMOzyukq471sQH4hyI=;
  b=ABxCukzi/ypiiBer0TS3hdijKTVuNCIthxrRcxZCW1i5zAZCLOEYJPnf
   LBaVZIMf2PdT2FoxxReYHlUb8cZyHZDYMATkhLWbIul3q7WozwsDPH/2/
   4zyAN6+b7y84+ezsxeKg3ANm7SQjXy5vdvuonFvw7bdUQTm6iowz+z35p
   bUS6UW6VdX7fN5Uk9Nui7wZZSKzn054J33AoVEHvuUr9Ee1MMMxLIg7dw
   RFcCJTKGwt4Kmp40+KT8dQE36hVxkDb60gsL/Xnswr8hO36vVQMNZbF8b
   MfWABSmqD24hdXjjhYrNRDm707pENFxMCYhR7wZJMx7ke/5aZDYyrq/xd
   w==;
X-CSE-ConnectionGUID: Z7ur9Rt8QyOFij9zLUZsEg==
X-CSE-MsgGUID: gxFZc6KMRmmHNpLK46WIFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31282956"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31282956"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 02:52:21 -0800
X-CSE-ConnectionGUID: ra2IGm4aTd268+6azcYDKw==
X-CSE-MsgGUID: lzWxbg/SQVCf1XvICo4WJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93647304"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Nov 2024 02:52:20 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCzMf-0002OU-1r;
	Mon, 18 Nov 2024 10:52:17 +0000
Date: Mon, 18 Nov 2024 18:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 28/28]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:987:18: warning: format
 specifies type 'long' but the argument has type 'unsigned int'
Message-ID: <202411181823.03vPi4yM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   501868c5f377ff4155041d111e0bea3c499b97a8
commit: 501868c5f377ff4155041d111e0bea3c499b97a8 [28/28] fixup! hid: Add Apple DockChannel HID transport driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20241118/202411181823.03vPi4yM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181823.03vPi4yM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181823.03vPi4yM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/dockchannel-hid/dockchannel-hid.c:11:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/hid/dockchannel-hid/dockchannel-hid.c:11:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/hid/dockchannel-hid/dockchannel-hid.c:11:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/hid/dockchannel-hid/dockchannel-hid.c:11:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
>> drivers/hid/dockchannel-hid/dockchannel-hid.c:987:18: warning: format specifies type 'long' but the argument has type 'unsigned int' [-Wformat]
     986 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                                                         ~~~
         |                                                                         %u
     987 |                         shdr->length, hdr->length - sizeof(*shdr));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   8 warnings generated.


vim +987 drivers/hid/dockchannel-hid/dockchannel-hid.c

c11b68c3111573 Hector Martin 2022-07-08   979  
c11b68c3111573 Hector Martin 2022-07-08   980  static void dchid_handle_ack(struct dchid_iface *iface, struct dchid_hdr *hdr, void *data)
c11b68c3111573 Hector Martin 2022-07-08   981  {
c11b68c3111573 Hector Martin 2022-07-08   982  	struct dchid_subhdr *shdr = (void *)data;
c11b68c3111573 Hector Martin 2022-07-08   983  	u8 *payload = data + sizeof(*shdr);
c11b68c3111573 Hector Martin 2022-07-08   984  
c11b68c3111573 Hector Martin 2022-07-08   985  	if (shdr->length + sizeof(*shdr) > hdr->length) {
c11b68c3111573 Hector Martin 2022-07-08   986  		dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
c11b68c3111573 Hector Martin 2022-07-08  @987  			shdr->length, hdr->length - sizeof(*shdr));
c11b68c3111573 Hector Martin 2022-07-08   988  		return;
c11b68c3111573 Hector Martin 2022-07-08   989  	}
c11b68c3111573 Hector Martin 2022-07-08   990  	if (shdr->flags != iface->out_flags) {
c11b68c3111573 Hector Martin 2022-07-08   991  		dev_err(iface->dchid->dev,
c11b68c3111573 Hector Martin 2022-07-08   992  			"Received unexpected flags 0x%x on ACK channel (expFected 0x%x)\n",
c11b68c3111573 Hector Martin 2022-07-08   993  			shdr->flags, iface->out_flags);
c11b68c3111573 Hector Martin 2022-07-08   994  		return;
c11b68c3111573 Hector Martin 2022-07-08   995  	}
c11b68c3111573 Hector Martin 2022-07-08   996  
c11b68c3111573 Hector Martin 2022-07-08   997  	if (shdr->length < 1) {
c11b68c3111573 Hector Martin 2022-07-08   998  		dev_err(iface->dchid->dev, "Received length 0 output report ack\n");
c11b68c3111573 Hector Martin 2022-07-08   999  		return;
c11b68c3111573 Hector Martin 2022-07-08  1000  	}
c11b68c3111573 Hector Martin 2022-07-08  1001  	if (iface->tx_seq != hdr->seq) {
c11b68c3111573 Hector Martin 2022-07-08  1002  		dev_err(iface->dchid->dev, "Received ACK with bad seq (expected %d, got %d)\n",
c11b68c3111573 Hector Martin 2022-07-08  1003  			iface->tx_seq, hdr->seq);
c11b68c3111573 Hector Martin 2022-07-08  1004  		return;
c11b68c3111573 Hector Martin 2022-07-08  1005  	}
c11b68c3111573 Hector Martin 2022-07-08  1006  	if (iface->out_report != payload[0]) {
c11b68c3111573 Hector Martin 2022-07-08  1007  		dev_err(iface->dchid->dev, "Received ACK with bad report (expected %d, got %d\n",
c11b68c3111573 Hector Martin 2022-07-08  1008  			iface->out_report, payload[0]);
c11b68c3111573 Hector Martin 2022-07-08  1009  		return;
c11b68c3111573 Hector Martin 2022-07-08  1010  	}
c11b68c3111573 Hector Martin 2022-07-08  1011  
c11b68c3111573 Hector Martin 2022-07-08  1012  	if (iface->resp_buf && iface->resp_size)
c11b68c3111573 Hector Martin 2022-07-08  1013  		memcpy(iface->resp_buf, payload + 1, min((size_t)shdr->length - 1, iface->resp_size));
c11b68c3111573 Hector Martin 2022-07-08  1014  
c11b68c3111573 Hector Martin 2022-07-08  1015  	iface->resp_size = shdr->length;
c11b68c3111573 Hector Martin 2022-07-08  1016  	iface->out_report = -1;
c11b68c3111573 Hector Martin 2022-07-08  1017  	iface->retcode = shdr->retcode;
c11b68c3111573 Hector Martin 2022-07-08  1018  	complete(&iface->out_complete);
c11b68c3111573 Hector Martin 2022-07-08  1019  }
c11b68c3111573 Hector Martin 2022-07-08  1020  

:::::: The code at line 987 was first introduced by commit
:::::: c11b68c31115734ab97565fb48c065ea5fd2d1bf hid: Add Apple DockChannel HID transport driver

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

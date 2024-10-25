Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1B8C8DF;
	Fri, 25 Oct 2024 02:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729822061; cv=none; b=B/WBiaQq2o7akblCYSh34da/mzXf0J8s5VAL0Pm3djLvL25anEEmW3QulmoMD1UcIGGLpPkYDZvIOGyfaZQi5XHQ7j0VfgRpsNx0vLSIqA080hly8mjp7YhUo0klXUV6XrHrTMqmZ2+ja1eSHK8b3TSHP3pcfZsvetaVH6JAle4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729822061; c=relaxed/simple;
	bh=FPriCofBVKd8/KfaF/uzlwLyYqIceUG/kFd/DawCwRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgI4Y2QoUY5Eu0/f6t2x96UjlcrK5KDdJ7ltrkccBoIbpOiiErw9gzRM7UVS2cQDriDDP8zRx+S1EK0CR5pqCmFmE9TH25zqgJBOR7zTpnMtPDqzu8dkIArvBlG5blLYdqlBuoXws2EUIk8ZI+2SsvSK8bhCFccA3EC7eTfe3eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgUhXKLo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgUhXKLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729822057; x=1761358057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FPriCofBVKd8/KfaF/uzlwLyYqIceUG/kFd/DawCwRY=;
  b=PgUhXKLobGZRUXFWfP/dhRk84ZPnmMDK0oAIP3JORaAj5mjWsBs9F4Ih
   n4d5smwebFNdwTWHQfb6VncheNPIlmUlLBJsZv53gYf9lgbUKz8P1hdCq
   ZkQJvt/wvvYzuNgUBwK05IxLEYDxcSvm8Y2Lt5AVmC7h5aIjPZuWgvB7d
   xyFqVtq1S0f5da1ICt42KIAGNLAsMSpm03rwMi8p+XQhn6+xeFtXcpu+1
   GfXKrDjOaMN4NysrNWmGGW/sWegOiJ/OFYFSixQhvVoDbobsVxUOc6dKI
   4GrkbkfRN4ihfP7rUnJbtvCGiSp9sEWZeN4gfdjVWH3Bs/sx2R2cblmL2
   w==;
X-CSE-ConnectionGUID: lTOX+3H9Q+6WEu8v9P/qKg==
X-CSE-MsgGUID: N9/anTOwRmmL8MQM8oR3tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54885105"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="54885105"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 19:07:36 -0700
X-CSE-ConnectionGUID: /oc89waTThOgLvu0lAqoPQ==
X-CSE-MsgGUID: bTbeQpUbQmGGxB5qPC9k8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="85328159"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2024 19:07:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t49jf-000XPW-24;
	Fri, 25 Oct 2024 02:07:31 +0000
Date: Fri, 25 Oct 2024 10:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/3] crypto: Add Mediatek EIP-93 crypto engine
 support
Message-ID: <202410250930.Oatsbovo-lkp@intel.com>
References: <20241021145642.16368-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021145642.16368-3-ansuelsmth@gmail.com>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master tip/locking/core robh/for-next linus/master v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-crypto-Add-Inside-Secure-SafeXcel-EIP-93-crypto-engine/20241021-230034
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241021145642.16368-3-ansuelsmth%40gmail.com
patch subject: [RFC PATCH v3 3/3] crypto: Add Mediatek EIP-93 crypto engine support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410250930.Oatsbovo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250930.Oatsbovo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250930.Oatsbovo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/crypto/inside-secure/eip93/eip93-main.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/crypto/inside-secure/eip93/eip93-main.c:12:
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
   In file included from drivers/crypto/inside-secure/eip93/eip93-main.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/crypto/inside-secure/eip93/eip93-main.c:12:
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
>> drivers/crypto/inside-secure/eip93/eip93-main.c:210:12: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     210 |                 } while (FIELD_GET(EIP93_PE_CTRL_PE_READY_DES_TRING_OWN, pe_ctrl_stat) !=
         |                          ^
   drivers/crypto/inside-secure/eip93/eip93-main.c:273:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     273 |         if (FIELD_GET(EIP93_INT_RDR_THRESH, irq_status)) {
         |             ^
>> drivers/crypto/inside-secure/eip93/eip93-main.c:293:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     293 |         val |= EIP93_PE_TARGET_AUTO_RING_MODE;
         |                ^
   drivers/crypto/inside-secure/eip93/eip93-regs.h:102:42: note: expanded from macro 'EIP93_PE_TARGET_AUTO_RING_MODE'
     102 | #define   EIP93_PE_TARGET_AUTO_RING_MODE        FIELD_PREP(EIP93_PE_CONFIG_PE_MODE, 0x3)
         |                                                 ^
   drivers/crypto/inside-secure/eip93/eip93-main.c:378:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     378 |         val = FIELD_PREP(EIP93_PE_RING_SIZE, EIP93_RING_NUM - 1);
         |               ^
   drivers/crypto/inside-secure/eip93/eip93-main.c:460:4: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     460 |                  FIELD_GET(EIP93_PE_REVISION_EIP_NO, ver),
         |                  ^
>> drivers/crypto/inside-secure/eip93/eip93-main.c:460:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                                ~~~
         |                                %d
     460 |                  FIELD_GET(EIP93_PE_REVISION_EIP_NO, ver),
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:461:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                                    ~~~
         |                                    %x
     460 |                  FIELD_GET(EIP93_PE_REVISION_EIP_NO, ver),
     461 |                  FIELD_GET(EIP93_PE_REVISION_MAJ_HW_REV, ver),
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:462:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                                        ~~~
         |                                        %x
     460 |                  FIELD_GET(EIP93_PE_REVISION_EIP_NO, ver),
     461 |                  FIELD_GET(EIP93_PE_REVISION_MAJ_HW_REV, ver),
     462 |                  FIELD_GET(EIP93_PE_REVISION_MIN_HW_REV, ver),
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/crypto/inside-secure/eip93/eip93-main.c:463:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     459 |         dev_info(mtk->dev, "EIP%lu:%lx:%lx:%lx,PE(0x%x:0x%x)\n",
         |                                            ~~~
         |                                            %x
     460 |                  FIELD_GET(EIP93_PE_REVISION_EIP_NO, ver),
     461 |                  FIELD_GET(EIP93_PE_REVISION_MAJ_HW_REV, ver),
     462 |                  FIELD_GET(EIP93_PE_REVISION_MIN_HW_REV, ver),
     463 |                  FIELD_GET(EIP93_PE_REVISION_HW_PATCH, ver),
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   11 warnings and 5 errors generated.
--
   In file included from drivers/crypto/inside-secure/eip93/eip93-common.c:16:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/crypto/inside-secure/eip93/eip93-common.c:16:
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
   In file included from drivers/crypto/inside-secure/eip93/eip93-common.c:16:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/crypto/inside-secure/eip93/eip93-common.c:16:
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
>> drivers/crypto/inside-secure/eip93/eip93-common.c:47:12: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      47 |         ext_err = FIELD_GET(EIP93_PE_CTRL_PE_EXT_ERR_CODE, err);
         |                   ^
>> drivers/crypto/inside-secure/eip93/eip93-common.c:302:29: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     302 |         sa_record->sa_cmd0_word |= EIP93_SA_CMD_IV_FROM_STATE;
         |                                    ^
   drivers/crypto/inside-secure/eip93/eip93-regs.h:207:39: note: expanded from macro 'EIP93_SA_CMD_IV_FROM_STATE'
     207 | #define   EIP93_SA_CMD_IV_FROM_STATE            FIELD_PREP(EIP93_SA_CMD_IV_SOURCE, 0x2)
         |                                                 ^
   drivers/crypto/inside-secure/eip93/eip93-common.c:474:27: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     474 |                 cdesc->pe_length_word = FIELD_PREP(EIP93_PE_LENGTH_HOST_PE_READY,
         |                                         ^
   drivers/crypto/inside-secure/eip93/eip93-common.c:586:28: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     586 |         cdesc.pe_ctrl_stat_word = FIELD_PREP(EIP93_PE_CTRL_PE_READY_DES_TRING_OWN,
         |                                   ^
   7 warnings and 4 errors generated.
--
   In file included from drivers/crypto/inside-secure/eip93/eip93-aead.c:23:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/crypto/inside-secure/eip93/eip93-aead.c:23:
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
   In file included from drivers/crypto/inside-secure/eip93/eip93-aead.c:23:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/crypto/inside-secure/eip93/eip93-aead.c:23:
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
>> drivers/crypto/inside-secure/eip93/eip93-aead.c:132:29: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     132 |         sa_record->sa_cmd0_word |= FIELD_PREP(EIP93_SA_CMD_OPCODE,
         |                                    ^
   drivers/crypto/inside-secure/eip93/eip93-aead.c:159:34: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     159 |         ctx->sa_record->sa_cmd0_word |= FIELD_PREP(EIP93_SA_CMD_DIGEST_LENGTH,
         |                                         ^
   drivers/crypto/inside-secure/eip93/eip93-aead.c:171:29: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     171 |         sa_record->sa_cmd1_word |= FIELD_PREP(EIP93_SA_CMD_HASH_CRYPT_OFFSET,
         |                                    ^
   7 warnings and 3 errors generated.
--
   In file included from drivers/crypto/inside-secure/eip93/eip93-hash.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/crypto/inside-secure/eip93/eip93-hash.c:12:
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
   In file included from drivers/crypto/inside-secure/eip93/eip93-hash.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/crypto/inside-secure/eip93/eip93-hash.c:12:
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
>> drivers/crypto/inside-secure/eip93/eip93-hash.c:140:29: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     140 |         sa_record->sa_cmd0_word |= EIP93_SA_CMD_HASH_FROM_STATE;
         |                                    ^
   drivers/crypto/inside-secure/eip93/eip93-regs.h:203:41: note: expanded from macro 'EIP93_SA_CMD_HASH_FROM_STATE'
     203 | #define   EIP93_SA_CMD_HASH_FROM_STATE          FIELD_PREP(EIP93_SA_CMD_HASH_SOURCE, 0x2)
         |                                                 ^
   drivers/crypto/inside-secure/eip93/eip93-hash.c:257:28: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     257 |         cdesc.pe_ctrl_stat_word = FIELD_PREP(EIP93_PE_CTRL_PE_READY_DES_TRING_OWN,
         |                                   ^
   7 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/FIELD_GET +210 drivers/crypto/inside-secure/eip93/eip93-main.c

   174	
   175	static void eip93_handle_result_descriptor(struct eip93_device *mtk)
   176	{
   177		struct crypto_async_request *async;
   178		struct eip93_descriptor *rdesc;
   179		u16 desc_flags, crypto_idr;
   180		bool last_entry;
   181		int handled, left, err;
   182		u32 pe_ctrl_stat;
   183		u32 pe_length;
   184	
   185	get_more:
   186		handled = 0;
   187	
   188		left = readl(mtk->base + EIP93_REG_PE_RD_COUNT) & EIP93_PE_RD_COUNT;
   189	
   190		if (!left) {
   191			eip93_irq_clear(mtk, EIP93_INT_RDR_THRESH);
   192			eip93_irq_enable(mtk, EIP93_INT_RDR_THRESH);
   193			return;
   194		}
   195	
   196		last_entry = false;
   197	
   198		while (left) {
   199			rdesc = eip93_get_descriptor(mtk);
   200			if (IS_ERR(rdesc)) {
   201				dev_err(mtk->dev, "Ndesc: %d nreq: %d\n",
   202					handled, left);
   203				err = -EIO;
   204				break;
   205			}
   206			/* make sure DMA is finished writing */
   207			do {
   208				pe_ctrl_stat = READ_ONCE(rdesc->pe_ctrl_stat_word);
   209				pe_length = READ_ONCE(rdesc->pe_length_word);
 > 210			} while (FIELD_GET(EIP93_PE_CTRL_PE_READY_DES_TRING_OWN, pe_ctrl_stat) !=
   211				 EIP93_PE_CTRL_PE_READY ||
   212				 FIELD_GET(EIP93_PE_LENGTH_HOST_PE_READY, pe_length) !=
   213				 EIP93_PE_LENGTH_PE_READY);
   214	
   215			err = rdesc->pe_ctrl_stat_word & (EIP93_PE_CTRL_PE_EXT_ERR_CODE |
   216							  EIP93_PE_CTRL_PE_EXT_ERR |
   217							  EIP93_PE_CTRL_PE_SEQNUM_ERR |
   218							  EIP93_PE_CTRL_PE_PAD_ERR |
   219							  EIP93_PE_CTRL_PE_AUTH_ERR);
   220	
   221			desc_flags = FIELD_GET(EIP93_PE_USER_ID_DESC_FLAGS, rdesc->user_id);
   222			crypto_idr = FIELD_GET(EIP93_PE_USER_ID_CRYPTO_IDR, rdesc->user_id);
   223	
   224			writel(1, mtk->base + EIP93_REG_PE_RD_COUNT);
   225			eip93_irq_clear(mtk, EIP93_INT_RDR_THRESH);
   226	
   227			handled++;
   228			left--;
   229	
   230			if (desc_flags & EIP93_DESC_LAST) {
   231				last_entry = true;
   232				break;
   233			}
   234		}
   235	
   236		if (!last_entry)
   237			goto get_more;
   238	
   239		/* Get crypto async ref only for last descriptor */
   240		scoped_guard(spinlock_bh, &mtk->ring->idr_lock) {
   241			async = idr_find(&mtk->ring->crypto_async_idr, crypto_idr);
   242			idr_remove(&mtk->ring->crypto_async_idr, crypto_idr);
   243		}
   244	
   245		/* Parse error in ctrl stat word */
   246		err = eip93_parse_ctrl_stat_err(mtk, err);
   247	
   248		if (desc_flags & EIP93_DESC_SKCIPHER)
   249			eip93_skcipher_handle_result(async, err);
   250	
   251		if (desc_flags & EIP93_DESC_AEAD)
   252			eip93_aead_handle_result(async, err);
   253	
   254		if (desc_flags & EIP93_DESC_HASH)
   255			eip93_hash_handle_result(async, err);
   256	
   257		goto get_more;
   258	}
   259	
   260	static void eip93_done_task(unsigned long data)
   261	{
   262		struct eip93_device *mtk = (struct eip93_device *)data;
   263	
   264		eip93_handle_result_descriptor(mtk);
   265	}
   266	
   267	static irqreturn_t eip93_irq_handler(int irq, void *data)
   268	{
   269		struct eip93_device *mtk = data;
   270		u32 irq_status;
   271	
   272		irq_status = readl(mtk->base + EIP93_REG_INT_MASK_STAT);
   273		if (FIELD_GET(EIP93_INT_RDR_THRESH, irq_status)) {
   274			eip93_irq_disable(mtk, EIP93_INT_RDR_THRESH);
   275			tasklet_schedule(&mtk->ring->done_task);
   276			return IRQ_HANDLED;
   277		}
   278	
   279		/* Ignore errors in AUTO mode, handled by the RDR */
   280		eip93_irq_clear(mtk, irq_status);
   281		if (irq_status)
   282			eip93_irq_disable(mtk, irq_status);
   283	
   284		return IRQ_NONE;
   285	}
   286	
   287	static void eip93_initialize(struct eip93_device *mtk, u32 supported_algo_flags)
   288	{
   289		u32 val;
   290	
   291		/* Reset PE and rings */
   292		val = EIP93_PE_CONFIG_RST_PE | EIP93_PE_CONFIG_RST_RING;
 > 293		val |= EIP93_PE_TARGET_AUTO_RING_MODE;
   294		/* For Auto more, update the CDR ring owner after processing */
   295		val |= EIP93_PE_CONFIG_EN_CDR_UPDATE;
   296		writel(val, mtk->base + EIP93_REG_PE_CONFIG);
   297	
   298		/* Wait for PE and ring to reset */
   299		usleep_range(10, 20);
   300	
   301		/* Release PE and ring reset */
   302		val = readl(mtk->base + EIP93_REG_PE_CONFIG);
   303		val &= ~(EIP93_PE_CONFIG_RST_PE | EIP93_PE_CONFIG_RST_RING);
   304		writel(val, mtk->base + EIP93_REG_PE_CONFIG);
   305	
   306		/* Config Clocks */
   307		val = EIP93_PE_CLOCK_EN_PE_CLK;
   308		if (supported_algo_flags & EIP93_PE_OPTION_TDES)
   309			val |= EIP93_PE_CLOCK_EN_DES_CLK;
   310		if (supported_algo_flags & EIP93_PE_OPTION_AES)
   311			val |= EIP93_PE_CLOCK_EN_AES_CLK;
   312		if (supported_algo_flags &
   313		    (EIP93_PE_OPTION_MD5 | EIP93_PE_OPTION_SHA_1 | EIP93_PE_OPTION_SHA_224 |
   314		     EIP93_PE_OPTION_SHA_256))
   315			val |= EIP93_PE_CLOCK_EN_HASH_CLK;
   316		writel(val, mtk->base + EIP93_REG_PE_CLOCK_CTRL);
   317	
   318		/* Config DMA thresholds */
   319		val = FIELD_PREP(EIP93_PE_OUTBUF_THRESH, 128) |
   320		      FIELD_PREP(EIP93_PE_INBUF_THRESH, 128);
   321		writel(val, mtk->base + EIP93_REG_PE_BUF_THRESH);
   322	
   323		/* Clear/ack all interrupts before disable all */
   324		eip93_irq_clear(mtk, EIP93_INT_ALL);
   325		eip93_irq_disable(mtk, EIP93_INT_ALL);
   326	
   327		/* Setup CRD threshold to trigger interrupt */
   328		val = FIELD_PREP(EIPR93_PE_CDR_THRESH, EIP93_RING_NUM - EIP93_RING_BUSY);
   329		/*
   330		 * Configure RDR interrupt to be triggered if RD counter is not 0
   331		 * for more than 2^(N+10) system clocks.
   332		 */
   333		val |= FIELD_PREP(EIPR93_PE_RD_TIMEOUT, 5) | EIPR93_PE_TIMEROUT_EN;
   334		writel(val, mtk->base + EIP93_REG_PE_RING_THRESH);
   335	}
   336	
   337	static void eip93_desc_free(struct eip93_device *mtk)
   338	{
   339		writel(0, mtk->base + EIP93_REG_PE_RING_CONFIG);
   340		writel(0, mtk->base + EIP93_REG_PE_CDR_BASE);
   341		writel(0, mtk->base + EIP93_REG_PE_RDR_BASE);
   342	}
   343	
   344	static int eip93_set_ring(struct eip93_device *mtk, struct eip93_desc_ring *ring)
   345	{
   346		ring->offset = sizeof(struct eip93_descriptor);
   347		ring->base = dmam_alloc_coherent(mtk->dev,
   348						 sizeof(struct eip93_descriptor) * EIP93_RING_NUM,
   349						 &ring->base_dma, GFP_KERNEL);
   350		if (!ring->base)
   351			return -ENOMEM;
   352	
   353		ring->write = ring->base;
   354		ring->base_end = ring->base + sizeof(struct eip93_descriptor) * (EIP93_RING_NUM - 1);
   355		ring->read  = ring->base;
   356	
   357		return 0;
   358	}
   359	
   360	static int eip93_desc_init(struct eip93_device *mtk)
   361	{
   362		struct eip93_desc_ring *cdr = &mtk->ring->cdr;
   363		struct eip93_desc_ring *rdr = &mtk->ring->rdr;
   364		int ret;
   365		u32 val;
   366	
   367		ret = eip93_set_ring(mtk, cdr);
   368		if (ret)
   369			return ret;
   370	
   371		ret = eip93_set_ring(mtk, rdr);
   372		if (ret)
   373			return ret;
   374	
   375		writel((u32 __force)cdr->base_dma, mtk->base + EIP93_REG_PE_CDR_BASE);
   376		writel((u32 __force)rdr->base_dma, mtk->base + EIP93_REG_PE_RDR_BASE);
   377	
 > 378		val = FIELD_PREP(EIP93_PE_RING_SIZE, EIP93_RING_NUM - 1);
   379		writel(val, mtk->base + EIP93_REG_PE_RING_CONFIG);
   380	
   381		atomic_set(&mtk->ring->free, EIP93_RING_NUM - 1);
   382	
   383		return 0;
   384	}
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

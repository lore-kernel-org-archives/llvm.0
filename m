Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F048D16EC08;
	Fri, 10 May 2024 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715341629; cv=none; b=rmHk5QMTyPBOwtPQLN7lN+YkxxAzNNW9xh9hceUI81ghiJFUwoGvzc5mqjWw1oqWHijVKGUTJAXyml4dPZR9rzq80GRjpxFJ3W7OYJmdHx11asBIRcvu5lExPsLZUiJu4z4rjipsyTsvPHR4J7OJTNgZcg4odYqZM/bUads2quo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715341629; c=relaxed/simple;
	bh=y1Hzi7RxjmEFUZkq02qn1XjEt0hljOHDYwcJqFTlW3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UtDAlmjzXf3OAFZdvxEqRaQVMETu6hnTTAR7w6BaBQZqybq6GQjUeQEKwhQL/bIzPNsB8mRQ5vb14haSaAly6QeWELi5ReuTBXXkQYDMPQy6SY+SiRHBFDoR4ABToZBRp83YVsilys09CtHre1q6hI5iDx1e+k0kat0uMJWNUNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZ7xaGQ9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZ7xaGQ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715341627; x=1746877627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1Hzi7RxjmEFUZkq02qn1XjEt0hljOHDYwcJqFTlW3M=;
  b=iZ7xaGQ9aw1S/wN1xiRoXUKUngEQjetGEBg0JcecesZKeEhw8INdCw9A
   STEs/jhHBsEGeRikpYgQhtvmRIRUolEV+CSRf23ZvedzU+qXEMCe1e0CG
   u+1QYA62H4B4W8zRbJfgM4qkOHo/pK3lyD9jnDRi7RGX9x9/btmaZRIPQ
   8AV3CsinMlguNKbDqvnhHYGzvR05G+7FVQVX5lVkHbP3UN7j61AYQOhF8
   QzXSuuv9yMWm2njmNuRrr0NKq0VUB6msgRstcccrF0HBmlu/mSfJLHy1q
   eabc4szGrYEjEktBXf55EWvtRoNfAaMDZA09474mqybUWPEk0JlO47uzf
   w==;
X-CSE-ConnectionGUID: zD7psIM+QkOG/KTh+iv25A==
X-CSE-MsgGUID: XLuXvX2qR6C9kOnOC3w6hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11481421"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11481421"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 04:47:07 -0700
X-CSE-ConnectionGUID: s++8JIdkTK21zM+VX/iQIw==
X-CSE-MsgGUID: Cte5j+bHSdaTdRfWbT8WjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34130242"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 May 2024 04:47:05 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5OiM-00065p-1r;
	Fri, 10 May 2024 11:47:02 +0000
Date: Fri, 10 May 2024 19:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:net-accept-more 3/6] net/iucv/af_iucv.c:2210:13: error:
 incompatible function pointer types initializing 'int (*)(struct socket *,
 struct socket *, struct proto_accept_arg *)' with an expression of type 'int
 (struct socket *, struct socket *, int, bool)' (aka 'int (struct soc...
Message-ID: <202405101940.hHoBqHcb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git net-accept-more
head:   3b4f987e70b3ba8a6da0a425daf61c9cac61f55d
commit: 11129a54ba83064e7ba3157cb5d12febfdf813df [3/6] net: change proto and proto_ops accept type
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240510/202405101940.hHoBqHcb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101940.hHoBqHcb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101940.hHoBqHcb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/iucv/af_iucv.c:16:
   In file included from include/linux/filter.h:9:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/iucv/af_iucv.c:16:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from net/iucv/af_iucv.c:16:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from net/iucv/af_iucv.c:16:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> net/iucv/af_iucv.c:2210:13: error: incompatible function pointer types initializing 'int (*)(struct socket *, struct socket *, struct proto_accept_arg *)' with an expression of type 'int (struct socket *, struct socket *, int, bool)' (aka 'int (struct socket *, struct socket *, int, _Bool)') [-Wincompatible-function-pointer-types]
    2210 |         .accept         = iucv_sock_accept,
         |                           ^~~~~~~~~~~~~~~~
   17 warnings and 1 error generated.


vim +2210 net/iucv/af_iucv.c

9fbd87d413921f Ursula Braun      2012-03-07  2202  
5708e868dc512f Alexey Dobriyan   2009-09-14  2203  static const struct proto_ops iucv_sock_ops = {
eac3731bd04c71 Jennifer Hunt     2007-02-08  2204  	.family		= PF_IUCV,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2205  	.owner		= THIS_MODULE,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2206  	.release	= iucv_sock_release,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2207  	.bind		= iucv_sock_bind,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2208  	.connect	= iucv_sock_connect,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2209  	.listen		= iucv_sock_listen,
eac3731bd04c71 Jennifer Hunt     2007-02-08 @2210  	.accept		= iucv_sock_accept,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2211  	.getname	= iucv_sock_getname,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2212  	.sendmsg	= iucv_sock_sendmsg,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2213  	.recvmsg	= iucv_sock_recvmsg,
a11e1d432b51f6 Linus Torvalds    2018-06-28  2214  	.poll		= iucv_sock_poll,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2215  	.ioctl		= sock_no_ioctl,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2216  	.mmap		= sock_no_mmap,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2217  	.socketpair	= sock_no_socketpair,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2218  	.shutdown	= iucv_sock_shutdown,
9d5c5d8f4105dc Hendrik Brueckner 2009-04-21  2219  	.setsockopt	= iucv_sock_setsockopt,
9d5c5d8f4105dc Hendrik Brueckner 2009-04-21  2220  	.getsockopt	= iucv_sock_getsockopt,
eac3731bd04c71 Jennifer Hunt     2007-02-08  2221  };
eac3731bd04c71 Jennifer Hunt     2007-02-08  2222  

:::::: The code at line 2210 was first introduced by commit
:::::: eac3731bd04c7131478722a3c148b78774553116 [S390]: Add AF_IUCV socket support

:::::: TO: Jennifer Hunt <jenhunt@us.ibm.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

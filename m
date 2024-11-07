Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57C0189B94;
	Thu,  7 Nov 2024 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730962823; cv=none; b=Mz2q0vGawje/2uTcKsKcoFL4kvgQ72ngxxsr5/cn/BGnjkHZBgKf87GQSuOqtIGmoOHgLo5tDOYp5Za2P8mjJbI4jhmDNg8iQI4DMZMfYgMqhIuk7ad0eegEC0ZitCn+X5WpdGgi+N9bsmOuqVwucVG0jNLdZhgibFuRDptfrUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730962823; c=relaxed/simple;
	bh=DFsf2RFY4TAtDYCgJRWhyyTH9Q3cA6XTsVINxUYPd/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwa9clOlPjNpCtMQJP/HfUKvdefjJRtLflD2K4mqtK6FeYuWmuBp66wTFa9ClDb+fDPNaWXMI8gxlrzoS9uozRfpE82oCF0S07IfbMyez4WdidEV+8m/eUvgBFED9ERjQuGf5mKyFZDaXxeU1Y1poFQJ7CnZ/t6tbiMzRIzKEGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBc+KJ/x; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBc+KJ/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730962813; x=1762498813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DFsf2RFY4TAtDYCgJRWhyyTH9Q3cA6XTsVINxUYPd/M=;
  b=IBc+KJ/xRkQzO8q1N1ws0hbbNGX41KKl7TGZZzAhgUdBH0SBWOa3xrhu
   k7I8F/vaLrlQAyAhPfDW90BX7vVA4AYdon0OY3qIWx0BdsaHkWIUFjjfC
   JpB9wPR/LwlDuB1Pc4Dx8SpI92AbwQDKqzdmOe7Aid1jPSc4Z15z5eeha
   IdqLyF4z+m9JOaVHfeTYW/nJybM/iGBn1NgqcRe+wyzWtfofqOjdMuPdw
   4pvPC+sAelI2jJ0AuSfMyle6OtPyj7/Cg5YfRohIBNcLCJsHXBP4mEZca
   B4cz+wkhzGdVQMeL2EUDcRxaMRabkGtWAUDXH9x0AZyp7A0s6mwRu/aXo
   w==;
X-CSE-ConnectionGUID: eycJas0GSNCGLV/5b8oXUA==
X-CSE-MsgGUID: zZH61/OAQUqlw7yclFLEqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34486537"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34486537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 23:00:00 -0800
X-CSE-ConnectionGUID: mSs4tlqyRsaPqpdEtNLlFA==
X-CSE-MsgGUID: FlXoe0EhQ4qigMO30KL40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="108234754"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2024 22:59:59 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8wUm-000pvH-1p;
	Thu, 07 Nov 2024 06:59:56 +0000
Date: Thu, 7 Nov 2024 14:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/5] net: Convert proto_ops::getname to
 sockaddr_storage
Message-ID: <202411071440.lRm1q7zc-lkp@intel.com>
References: <20241104222513.3469025-5-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104222513.3469025-5-kees@kernel.org>

Hi Kees,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[cannot apply to brauner-vfs/vfs.all trondmy-nfs/linux-next bluetooth/master linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/Revert-net-dev-Convert-sa_data-to-flexible-array-in-struct-sockaddr/20241105-062801
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20241104222513.3469025-5-kees%40kernel.org
patch subject: [PATCH RFC 5/5] net: Convert proto_ops::getname to sockaddr_storage
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241107/202411071440.lRm1q7zc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071440.lRm1q7zc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071440.lRm1q7zc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/iucv/af_iucv.c:16:
   In file included from include/linux/filter.h:9:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/iucv/af_iucv.c:16:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
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
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
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
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> net/iucv/af_iucv.c:858:9: error: no member named 'sa_family' in 'struct sockaddr_iucv'
     858 |         siucv->sa_family = AF_IUCV;
         |         ~~~~~  ^
   16 warnings and 1 error generated.


vim +858 net/iucv/af_iucv.c

   850	
   851	static int iucv_sock_getname(struct socket *sock,
   852				     struct sockaddr_storage *addr, int peer)
   853	{
   854		DECLARE_SOCKADDR(struct sockaddr_iucv *, siucv, addr);
   855		struct sock *sk = sock->sk;
   856		struct iucv_sock *iucv = iucv_sk(sk);
   857	
 > 858		siucv->sa_family = AF_IUCV;
   859	
   860		if (peer) {
   861			memcpy(siucv->siucv_user_id, iucv->dst_user_id, 8);
   862			memcpy(siucv->siucv_name, iucv->dst_name, 8);
   863		} else {
   864			memcpy(siucv->siucv_user_id, iucv->src_user_id, 8);
   865			memcpy(siucv->siucv_name, iucv->src_name, 8);
   866		}
   867		memset(&siucv->siucv_port, 0, sizeof(siucv->siucv_port));
   868		memset(&siucv->siucv_addr, 0, sizeof(siucv->siucv_addr));
   869		memset(&siucv->siucv_nodeid, 0, sizeof(siucv->siucv_nodeid));
   870	
   871		return sizeof(struct sockaddr_iucv);
   872	}
   873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

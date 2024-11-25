Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BFB16D9DF;
	Mon, 25 Nov 2024 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732529743; cv=none; b=Hg1EQYvltfkB6ajeAejCnhAsyRjxr3edDtiWEJY+59ClV9LupdfzZZ/6ixz9Bqo3Usnhe4Dhmwy5e5il6dQVORIUJ6DidYuniuzK6Yt1KK6+ktbDSvxgn5UlCDSU1oqNa560gBz3IbpUJCFoTsNihocspOpLakmpxK/3NN7393I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732529743; c=relaxed/simple;
	bh=eWTPapxiiyPdJ9usGhEk1bwQvXjyEAnoCnOvWS3t2go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdIR5/DAZ72AJffX2ur4xn+rTP7c5Mv0qDIYABq9/UJ1Quy4iZIJtfrQrWMEyvQZf/5F9uzGd/dipEDm9AIhR30wSJB8BQGd2e+GI1T3Z29E+DOwCZbEFrhqmfkNdjJ/MX6qGYesrsZW7rl9Q6q+6hxa/EW3iMU1+1Y7Pp7cQEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8ThzZRu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8ThzZRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732529741; x=1764065741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eWTPapxiiyPdJ9usGhEk1bwQvXjyEAnoCnOvWS3t2go=;
  b=X8ThzZRuw22ctbCaH6HcUrJDENdGDYS29MyjQiIJfcXOSxTtj25UBagc
   tfxeIWT52rVgKPDrBkcM0fKWCyhcJkVZa2VVg9BuB9ZQ+9hZ/wQMtluX9
   SQcGyQOVDpiM7EnTWyOgUhuy7zxkelTbY6/2onm+OvRqXpWWWvaKpgSXO
   RJtirtXlBtURJpJaoIfbetzmmlEHl0qTc9DaapVfLTvqwjsJFdsVrqnxn
   OEm3ZLPlVLXWVvqCOO+M1dm34aiOCTwvZmZLfTECI2P11tg+s4TYD8ZXm
   wG9BQSTVM3l6Ja0e8nzHPESsSSECWZ6cpZahwx/hyM6mtVAzLCynhVEnf
   A==;
X-CSE-ConnectionGUID: n/lURNMfTgqmpf30jgGosw==
X-CSE-MsgGUID: DuO+g/I+SeyiRo7CY4ey3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32775357"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="32775357"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 02:15:38 -0800
X-CSE-ConnectionGUID: YVqlTmNGQnuooxvm3IaM9g==
X-CSE-MsgGUID: k4QXJ/BWRhG7eKX+n4oHhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91404244"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Nov 2024 02:15:36 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFW7y-00068q-2D;
	Mon, 25 Nov 2024 10:15:34 +0000
Date: Mon, 25 Nov 2024 18:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Junxian Huang <huangjunxian6@hisilicon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 07/12] RDMA/siw: Remove deliver net device event
Message-ID: <202411251737.uAecPIOG-lkp@intel.com>
References: <20241122105308.2150505-8-huangjunxian6@hisilicon.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122105308.2150505-8-huangjunxian6@hisilicon.com>

Hi Junxian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rdma/for-next]
[cannot apply to linus/master v6.12 next-20241125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Junxian-Huang/RDMA-core-Add-ib_query_netdev_port-to-query-netdev-port-by-IB-device/20241125-101856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20241122105308.2150505-8-huangjunxian6%40hisilicon.com
patch subject: [PATCH RFC 07/12] RDMA/siw: Remove deliver net device event
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241125/202411251737.uAecPIOG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251737.uAecPIOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251737.uAecPIOG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/infiniband/sw/siw/siw_verbs.c:11:
   In file included from include/net/addrconf.h:65:
   In file included from include/linux/ipv6.h:102:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
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
   In file included from drivers/infiniband/sw/siw/siw_verbs.c:11:
   In file included from include/net/addrconf.h:65:
   In file included from include/linux/ipv6.h:102:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
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
   In file included from drivers/infiniband/sw/siw/siw_verbs.c:11:
   In file included from include/net/addrconf.h:65:
   In file included from include/linux/ipv6.h:102:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/infiniband/sw/siw/siw_verbs.c:11:
   In file included from include/net/addrconf.h:65:
   In file included from include/linux/ipv6.h:102:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
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
>> drivers/infiniband/sw/siw/siw_verbs.c:186:45: error: no member named 'ndev' in 'struct siw_device'
     186 |         attr->state = ib_get_curr_port_state(sdev->ndev);
         |                                              ~~~~  ^
   16 warnings and 1 error generated.


vim +186 drivers/infiniband/sw/siw/siw_verbs.c

   170	
   171	int siw_query_port(struct ib_device *base_dev, u32 port,
   172			   struct ib_port_attr *attr)
   173	{
   174		struct siw_device *sdev = to_siw_dev(base_dev);
   175		int rv;
   176	
   177		memset(attr, 0, sizeof(*attr));
   178	
   179		rv = ib_get_eth_speed(base_dev, port, &attr->active_speed,
   180				 &attr->active_width);
   181		attr->gid_tbl_len = 1;
   182		attr->max_msg_sz = -1;
   183		attr->max_mtu = ib_mtu_int_to_enum(sdev->netdev->mtu);
   184		attr->active_mtu = ib_mtu_int_to_enum(sdev->netdev->mtu);
   185		attr->port_cap_flags = IB_PORT_CM_SUP | IB_PORT_DEVICE_MGMT_SUP;
 > 186		attr->state = ib_get_curr_port_state(sdev->ndev);
   187		attr->phys_state = attr->state == IB_PORT_ACTIVE ?
   188			IB_PORT_PHYS_STATE_LINK_UP : IB_PORT_PHYS_STATE_DISABLED;
   189		/*
   190		 * All zero
   191		 *
   192		 * attr->lid = 0;
   193		 * attr->bad_pkey_cntr = 0;
   194		 * attr->qkey_viol_cntr = 0;
   195		 * attr->sm_lid = 0;
   196		 * attr->lmc = 0;
   197		 * attr->max_vl_num = 0;
   198		 * attr->sm_sl = 0;
   199		 * attr->subnet_timeout = 0;
   200		 * attr->init_type_repy = 0;
   201		 */
   202		return rv;
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

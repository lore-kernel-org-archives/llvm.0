Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BC53A268;
	Thu, 15 Aug 2024 04:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723696199; cv=none; b=h+EfTDacPFYWRxQ2CfPHf0Wsh5N60KQYCPSVTJwqDLWOHJYY7bJsany32d2UhJi5ICGsRQ8alDhPnqTpyfgm0NcBwyHvkR8EYr6JeNJPcqrvHwDWNaBo8v2eciLVFUnbpHz+teYrKdyqPz8oYZ4HQPnbMsc8iXpeEzPIkOPErUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723696199; c=relaxed/simple;
	bh=dm98+fLnz9dpfL7RtOoEweg07OALBP+9mRPaThAxRoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJx89Db92DEoxo0eYuQPvLAUMJffWD5gJtBRKj5LJpW0shn/+vkfKDionhmvFQtEOhHkKTjpUorEEO9HBoUzdwl2oFefKyaNLgy4gJAu0Qq2EGnAd/2b7DdcJcDYZdpvXWFjfgTpNCElmY7OkbCOHtDwctIxpGwgjNzuqprdyiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVNUe/cN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVNUe/cN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723696197; x=1755232197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dm98+fLnz9dpfL7RtOoEweg07OALBP+9mRPaThAxRoM=;
  b=hVNUe/cNHPFAh3Y1GvyZAQA7Q3JRN0bPy2tmwCeeCKPftC5s6d6r8sN3
   AUbKi0nJFNe1bZ1uTWTirBTeWE8aOenExNFaqMN5bvvu2SauMAnFThdWE
   jRZqTubimUG8wRHAJC82d1tMpWEAJz7ofFldzxpaO0cOLnC5psP1tG41b
   XV84sDLuiM5pErBGfh2qID0FKu+5bexQu2w8MYaQQ1CiwhzL7CLNX85DS
   KTL6RxfZ2oTzNyFi4Wx52TDVAaPYcfzz6/iy4ON5OGRJc6Q1GqrZNcRdG
   Ni+xKuD78d06R13H/hLXZSpL510BJPq/W9gp6djbf1D7w/iHd1KpkoIA9
   Q==;
X-CSE-ConnectionGUID: lrVQJGzoRn62tVtXcsDHow==
X-CSE-MsgGUID: Z7u8LIK0RD+hnqE8j6hWmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22092475"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="22092475"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 21:29:56 -0700
X-CSE-ConnectionGUID: H1Loso/+QM6MajhAnqpf6Q==
X-CSE-MsgGUID: JpHVMlWTQ76mCGmVrI70cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="63394770"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Aug 2024 21:29:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seS7U-0003Bm-2j;
	Thu, 15 Aug 2024 04:29:52 +0000
Date: Thu, 15 Aug 2024 12:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v9 11/14] iavf: refactor
 iavf_clean_rx_irq to support legacy and flex descriptors
Message-ID: <202408151257.WUvBzK5D-lkp@intel.com>
References: <20240813125513.8212-12-mateusz.polchlopek@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813125513.8212-12-mateusz.polchlopek@intel.com>

Hi Mateusz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d1815992133ebcc6007009645571f322f4bc7c44]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Polchlopek/virtchnl-add-support-for-enabling-PTP-on-iAVF/20240815-013335
base:   d1815992133ebcc6007009645571f322f4bc7c44
patch link:    https://lore.kernel.org/r/20240813125513.8212-12-mateusz.polchlopek%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v9 11/14] iavf: refactor iavf_clean_rx_irq to support legacy and flex descriptors
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240815/202408151257.WUvBzK5D-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151257.WUvBzK5D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151257.WUvBzK5D-lkp@intel.com/

All warnings (new ones prefixed by >>):

     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/iavf/iavf_txrx.c:5:
   In file included from include/linux/net/intel/libie/rx.h:7:
   In file included from include/net/libeth/rx.h:7:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
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
   In file included from drivers/net/ethernet/intel/iavf/iavf_txrx.c:5:
   In file included from include/linux/net/intel/libie/rx.h:7:
   In file included from include/net/libeth/rx.h:7:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
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
   In file included from drivers/net/ethernet/intel/iavf/iavf_txrx.c:5:
   In file included from include/linux/net/intel/libie/rx.h:7:
   In file included from include/net/libeth/rx.h:7:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
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
>> drivers/net/ethernet/intel/iavf/iavf_txrx.c:965:10: warning: variable 'csum_bits' is uninitialized when used here [-Wuninitialized]
     965 |                 return csum_bits;
         |                        ^~~~~~~~~
   drivers/net/ethernet/intel/iavf/iavf_txrx.c:961:2: note: variable 'csum_bits' is declared here
     961 |         struct libeth_rx_csum csum_bits;
         |         ^
   drivers/net/ethernet/intel/iavf/iavf_txrx.c:997:10: warning: variable 'csum_bits' is uninitialized when used here [-Wuninitialized]
     997 |                 return csum_bits;
         |                        ^~~~~~~~~
   drivers/net/ethernet/intel/iavf/iavf_txrx.c:993:2: note: variable 'csum_bits' is declared here
     993 |         struct libeth_rx_csum csum_bits;
         |         ^
   19 warnings generated.


vim +/csum_bits +965 drivers/net/ethernet/intel/iavf/iavf_txrx.c

   944	
   945	/**
   946	 * iavf_legacy_rx_csum - Indicate in skb if hw indicated a good checksum
   947	 * @vsi: the VSI we care about
   948	 * @rx_desc: the receive descriptor
   949	 * @decoded: decoded packet type
   950	 *
   951	 * This function only operates on the VIRTCHNL_RXDID_1_32B_BASE legacy 32byte
   952	 * descriptor writeback format.
   953	 *
   954	 * Return: decoded checksum bits.
   955	 **/
   956	static struct libeth_rx_csum
   957	iavf_legacy_rx_csum(const struct iavf_vsi *vsi,
   958			    const struct iavf_rx_desc *rx_desc,
   959			    const struct libeth_rx_pt decoded)
   960	{
   961		struct libeth_rx_csum csum_bits;
   962		u64 qw1 = le64_to_cpu(rx_desc->qw1);
   963	
   964		if (!libeth_rx_pt_has_checksum(vsi->netdev, decoded))
 > 965			return csum_bits;
   966	
   967		csum_bits.ipe = FIELD_GET(IAVF_RXD_LEGACY_IPE_M, qw1);
   968		csum_bits.eipe = FIELD_GET(IAVF_RXD_LEGACY_EIPE_M, qw1);
   969		csum_bits.l4e = FIELD_GET(IAVF_RXD_LEGACY_L4E_M, qw1);
   970		csum_bits.pprs = FIELD_GET(IAVF_RXD_LEGACY_PPRS_M, qw1);
   971		csum_bits.l3l4p = FIELD_GET(IAVF_RXD_LEGACY_L3L4P_M, qw1);
   972		csum_bits.ipv6exadd = FIELD_GET(IAVF_RXD_LEGACY_IPV6EXADD_M, qw1);
   973	
   974		return csum_bits;
   975	}
   976	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

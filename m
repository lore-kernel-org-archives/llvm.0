Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3B5199B8;
	Sat, 18 May 2024 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716025736; cv=none; b=LrQf+JZz4yuRruVx1tPA7OPQXuPpcp/3FfcJoQd+eE+R0oj6Kqt8Raqidd4JfnB0SfoMynBqG8sI4GWNL0VrRJkTTAFAnD1z7BvOe72YuqBLHLTWzsd/AFpqCMn7vtvS6kUYe7eJFq+xAMw29rT8a5CBxGirQqH53AmfOfuTXhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716025736; c=relaxed/simple;
	bh=YaTkBMT2YgiEgWhpcFUf/HLJwwZ2wxxLHUpVRDMxy2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeWxPKuxB6O4TAnOrLmRhhE3nvXr12TUP8evgmMP6u7Mpbga7Qp+HkkSlSXAjpoAMHLSOQcKbllITIgId/6lIxQIUsaRVWU0hFm/vrEwdV/udZ/IYF3VghRbr/yqP/HlDtTtFXGzu0m59k7PkMXFzdH/87Kfb+7UMT6Bl6RL2N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fF08RZ/m; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fF08RZ/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716025735; x=1747561735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YaTkBMT2YgiEgWhpcFUf/HLJwwZ2wxxLHUpVRDMxy2c=;
  b=fF08RZ/mpUUoxnesyA31no5nLmf/O8cnwkgqngud1JkhZ1nf9uClJ0BM
   9hFG44CA1gpanlT63nOTWLxnQOvJHG3s4ZOTZxPiHQYSWcyiKpji9debg
   ZHiaMYp/n9xwR1Y2t149dpV/SOawF+OFkEAfDXyySQTsg0I1z5Tn3E65N
   jZZaKcgQG4Jh6vx7SdEH/fM2WQGZrR2fZQpHDI3xqbA23XcNsuEBwdPC/
   EC3m14dLWaAVAQs0cg3b43UBgMiPhWJP0YXMpRPf6UCYbAcNMa8UT6sM3
   O6NBAM06W5qiWVwkHrNrjm7KImdzpYPSDiGVBviG/1gtE7pqChXrMvuxV
   Q==;
X-CSE-ConnectionGUID: YgX5vO13RZ29vafgV0k12Q==
X-CSE-MsgGUID: /fZ1Fyr6S4mLUXYREXiomw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12397471"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12397471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 02:48:54 -0700
X-CSE-ConnectionGUID: r81JVZ5QQOKLZ9tEEV41WA==
X-CSE-MsgGUID: CO4B7G+RQluAErgZ9aNm4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="36448065"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 May 2024 02:48:52 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8GgM-0001zl-19;
	Sat, 18 May 2024 09:48:50 +0000
Date: Sat, 18 May 2024 17:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/5] vsock/virtio: Add support for multi-devices
Message-ID: <202405181709.eZtUowMg-lkp@intel.com>
References: <20240517144607.2595798-3-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517144607.2595798-3-niuxuewei.nxw@antgroup.com>

Hi Xuewei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuewei-Niu/vsock-virtio-Extend-virtio-vsock-spec-with-an-order-field/20240517-225120
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20240517144607.2595798-3-niuxuewei.nxw%40antgroup.com
patch subject: [RFC PATCH 2/5] vsock/virtio: Add support for multi-devices
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240518/202405181709.eZtUowMg-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181709.eZtUowMg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405181709.eZtUowMg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
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
   In file included from net/vmw_vsock/af_vsock.c:92:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:22:
   In file included from include/linux/ip.h:16:
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
   In file included from net/vmw_vsock/af_vsock.c:92:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:22:
   In file included from include/linux/ip.h:16:
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
   In file included from net/vmw_vsock/af_vsock.c:92:
   In file included from include/linux/errqueue.h:6:
   In file included from include/net/ip.h:22:
   In file included from include/linux/ip.h:16:
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
>> net/vmw_vsock/af_vsock.c:549:6: warning: no previous prototype for function 'transport_g2h_verify_cid' [-Wmissing-prototypes]
     549 | bool transport_g2h_verify_cid(unsigned int cid)
         |      ^
   net/vmw_vsock/af_vsock.c:549:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     549 | bool transport_g2h_verify_cid(unsigned int cid)
         | ^
         | static 
>> net/vmw_vsock/af_vsock.c:1235:4: warning: add explicit braces to avoid dangling else [-Wdangling-else]
    1235 |                         else
         |                         ^
   net/vmw_vsock/af_vsock.c:1250:4: warning: add explicit braces to avoid dangling else [-Wdangling-else]
    1250 |                         else
         |                         ^
   20 warnings generated.


vim +/transport_g2h_verify_cid +549 net/vmw_vsock/af_vsock.c

   548	
 > 549	bool transport_g2h_verify_cid(unsigned int cid)
   550	{
   551		/* transports that support multi devices */
   552		rcu_read_lock();
   553		if (transport_g2h->get_virtio_vsock &&
   554		    (cid == VMADDR_CID_ANY || transport_g2h->get_virtio_vsock(cid))) {
   555			rcu_read_unlock();
   556			return true;
   557		}
   558		rcu_read_unlock();
   559		/* other transports */
   560		if (cid == transport_g2h->get_local_cid())
   561			return true;
   562	
   563		return false;
   564	}
   565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

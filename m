Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A9F208A8;
	Sat, 18 May 2024 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716031392; cv=none; b=jrExfpTrd4d4/tnewZB2uMmu4+UznIsq4a7K3PmQO2SR2282j+OZRESyooSWnCVHsxL5UaoFJo94dAmbF/U4ShfKZPXZddyC1qzW2wUvHbEgIC+8dOe56DLbaW2vz4gkhpndtv7qi+Rqpki3SLDn0Qg4lK54nJXB1T2RR9vDYtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716031392; c=relaxed/simple;
	bh=dEMJNL2Lpnt+470FxZ2GNEBsckmX2k3X8MGcnptKIOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReT9bY5WZjbUIa2LdDg9tYh6/EA/woS/+oEK0PGhKpluMzAmtO0GaYEx54Zw78QVw4Y15meVSQ2oDYCQ/ofJy6Xc0lVAnPGOcA0iO5FcsG/QERVIjj7HLqKjMn4EsfbI4yHpHdTev4tQ6hOcrP1JfhGTnnFsx67AafX2Q4kWgSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfLCTpNb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfLCTpNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716031390; x=1747567390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dEMJNL2Lpnt+470FxZ2GNEBsckmX2k3X8MGcnptKIOU=;
  b=VfLCTpNbeQjZl7PSXW1dpff/rOXtjK/1Muny4cuh/klmL/mK0NB/lh1V
   8/gEb+2c+dU593PtPks+FESkg+O5OAreSzybTho2Otn3L+pC9hPCjMAzM
   rI4pvw6DecDIQdPuvOBOoeq4H1LF+k/7gFxkOKcAnQPBMPpfrTa54iLyR
   2WD+ahmlJOYBqpxHik1DVBwUnUUdp7FRLXXaeH57VtJTgseivB05f6FDw
   lrxUptaWkyElXpIgrZ9lXtIk2ONXPUJwKxKuC9IHLgSTNkuBBTEAk/xTJ
   TDZGax57HTeqRhY08c+EiCXKNIuD0DPs1eaH09P3eBWnZ2IGjjGLx4unm
   A==;
X-CSE-ConnectionGUID: pKg/X79qSyWnucASm3htTg==
X-CSE-MsgGUID: 8B3qMNEmRAO9GUdoqNaY+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="23627559"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="23627559"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 04:23:09 -0700
X-CSE-ConnectionGUID: puTl3PrjRMGDLd2p/5o4VQ==
X-CSE-MsgGUID: 2NGrN4PaRCmm+MBOHfUhqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="32631190"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 May 2024 04:23:08 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8I9Z-00028G-2C;
	Sat, 18 May 2024 11:23:05 +0000
Date: Sat, 18 May 2024 19:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/5] vsock: seqpacket_allow adapts to multi-devices
Message-ID: <202405181907.MvWtMsG3-lkp@intel.com>
References: <20240517144607.2595798-5-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517144607.2595798-5-niuxuewei.nxw@antgroup.com>

Hi Xuewei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mst-vhost/linux-next]
[also build test ERROR on linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuewei-Niu/vsock-virtio-Extend-virtio-vsock-spec-with-an-order-field/20240517-225120
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20240517144607.2595798-5-niuxuewei.nxw%40antgroup.com
patch subject: [RFC PATCH 4/5] vsock: seqpacket_allow adapts to multi-devices
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240518/202405181907.MvWtMsG3-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181907.MvWtMsG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405181907.MvWtMsG3-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   In file included from drivers/vhost/vsock.c:14:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
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
   In file included from drivers/vhost/vsock.c:14:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
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
   In file included from drivers/vhost/vsock.c:14:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
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
>> drivers/vhost/vsock.c:436:31: error: incompatible function pointer types initializing 'bool (*)(u32, u32)' (aka '_Bool (*)(unsigned int, unsigned int)') with an expression of type 'bool (u32)' (aka '_Bool (unsigned int)') [-Wincompatible-function-pointer-types]
     436 |                 .seqpacket_allow          = vhost_transport_seqpacket_allow,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   17 warnings and 1 error generated.


vim +436 drivers/vhost/vsock.c

ced7b713711fdd Arseny Krasnov     2021-06-11  407  
4c7246dc45e270 Stefano Garzarella 2019-11-14  408  static struct virtio_transport vhost_transport = {
4c7246dc45e270 Stefano Garzarella 2019-11-14  409  	.transport = {
6a2c0962105ae8 Stefano Garzarella 2019-11-14  410  		.module                   = THIS_MODULE,
6a2c0962105ae8 Stefano Garzarella 2019-11-14  411  
4c7246dc45e270 Stefano Garzarella 2019-11-14  412  		.get_local_cid            = vhost_transport_get_local_cid,
4c7246dc45e270 Stefano Garzarella 2019-11-14  413  
4c7246dc45e270 Stefano Garzarella 2019-11-14  414  		.init                     = virtio_transport_do_socket_init,
4c7246dc45e270 Stefano Garzarella 2019-11-14  415  		.destruct                 = virtio_transport_destruct,
4c7246dc45e270 Stefano Garzarella 2019-11-14  416  		.release                  = virtio_transport_release,
4c7246dc45e270 Stefano Garzarella 2019-11-14  417  		.connect                  = virtio_transport_connect,
4c7246dc45e270 Stefano Garzarella 2019-11-14  418  		.shutdown                 = virtio_transport_shutdown,
4c7246dc45e270 Stefano Garzarella 2019-11-14  419  		.cancel_pkt               = vhost_transport_cancel_pkt,
4c7246dc45e270 Stefano Garzarella 2019-11-14  420  
4c7246dc45e270 Stefano Garzarella 2019-11-14  421  		.dgram_enqueue            = virtio_transport_dgram_enqueue,
4c7246dc45e270 Stefano Garzarella 2019-11-14  422  		.dgram_dequeue            = virtio_transport_dgram_dequeue,
4c7246dc45e270 Stefano Garzarella 2019-11-14  423  		.dgram_bind               = virtio_transport_dgram_bind,
4c7246dc45e270 Stefano Garzarella 2019-11-14  424  		.dgram_allow              = virtio_transport_dgram_allow,
4c7246dc45e270 Stefano Garzarella 2019-11-14  425  
4c7246dc45e270 Stefano Garzarella 2019-11-14  426  		.stream_enqueue           = virtio_transport_stream_enqueue,
4c7246dc45e270 Stefano Garzarella 2019-11-14  427  		.stream_dequeue           = virtio_transport_stream_dequeue,
4c7246dc45e270 Stefano Garzarella 2019-11-14  428  		.stream_has_data          = virtio_transport_stream_has_data,
4c7246dc45e270 Stefano Garzarella 2019-11-14  429  		.stream_has_space         = virtio_transport_stream_has_space,
4c7246dc45e270 Stefano Garzarella 2019-11-14  430  		.stream_rcvhiwat          = virtio_transport_stream_rcvhiwat,
4c7246dc45e270 Stefano Garzarella 2019-11-14  431  		.stream_is_active         = virtio_transport_stream_is_active,
4c7246dc45e270 Stefano Garzarella 2019-11-14  432  		.stream_allow             = virtio_transport_stream_allow,
4c7246dc45e270 Stefano Garzarella 2019-11-14  433  
ced7b713711fdd Arseny Krasnov     2021-06-11  434  		.seqpacket_dequeue        = virtio_transport_seqpacket_dequeue,
ced7b713711fdd Arseny Krasnov     2021-06-11  435  		.seqpacket_enqueue        = virtio_transport_seqpacket_enqueue,
ced7b713711fdd Arseny Krasnov     2021-06-11 @436  		.seqpacket_allow          = vhost_transport_seqpacket_allow,
ced7b713711fdd Arseny Krasnov     2021-06-11  437  		.seqpacket_has_data       = virtio_transport_seqpacket_has_data,
ced7b713711fdd Arseny Krasnov     2021-06-11  438  
3719c48d9a2082 Arseniy Krasnov    2023-10-10  439  		.msgzerocopy_allow        = vhost_transport_msgzerocopy_allow,
3719c48d9a2082 Arseniy Krasnov    2023-10-10  440  
4c7246dc45e270 Stefano Garzarella 2019-11-14  441  		.notify_poll_in           = virtio_transport_notify_poll_in,
4c7246dc45e270 Stefano Garzarella 2019-11-14  442  		.notify_poll_out          = virtio_transport_notify_poll_out,
4c7246dc45e270 Stefano Garzarella 2019-11-14  443  		.notify_recv_init         = virtio_transport_notify_recv_init,
4c7246dc45e270 Stefano Garzarella 2019-11-14  444  		.notify_recv_pre_block    = virtio_transport_notify_recv_pre_block,
4c7246dc45e270 Stefano Garzarella 2019-11-14  445  		.notify_recv_pre_dequeue  = virtio_transport_notify_recv_pre_dequeue,
4c7246dc45e270 Stefano Garzarella 2019-11-14  446  		.notify_recv_post_dequeue = virtio_transport_notify_recv_post_dequeue,
4c7246dc45e270 Stefano Garzarella 2019-11-14  447  		.notify_send_init         = virtio_transport_notify_send_init,
4c7246dc45e270 Stefano Garzarella 2019-11-14  448  		.notify_send_pre_block    = virtio_transport_notify_send_pre_block,
4c7246dc45e270 Stefano Garzarella 2019-11-14  449  		.notify_send_pre_enqueue  = virtio_transport_notify_send_pre_enqueue,
4c7246dc45e270 Stefano Garzarella 2019-11-14  450  		.notify_send_post_enqueue = virtio_transport_notify_send_post_enqueue,
b9f2b0ffde0c9b Stefano Garzarella 2019-11-14  451  		.notify_buffer_size       = virtio_transport_notify_buffer_size,
0fe17989681154 Arseniy Krasnov    2023-12-14  452  		.notify_set_rcvlowat      = virtio_transport_notify_set_rcvlowat,
4c7246dc45e270 Stefano Garzarella 2019-11-14  453  
634f1a7110b439 Bobby Eshleman     2023-03-27  454  		.read_skb = virtio_transport_read_skb,
4c7246dc45e270 Stefano Garzarella 2019-11-14  455  	},
4c7246dc45e270 Stefano Garzarella 2019-11-14  456  
4c7246dc45e270 Stefano Garzarella 2019-11-14  457  	.send_pkt = vhost_transport_send_pkt,
4c7246dc45e270 Stefano Garzarella 2019-11-14  458  };
4c7246dc45e270 Stefano Garzarella 2019-11-14  459  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

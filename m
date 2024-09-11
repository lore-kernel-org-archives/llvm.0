Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6E718C3E;
	Wed, 11 Sep 2024 07:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726038341; cv=none; b=daTnMl2B14EyZiYOif88pWSC/kkr0yLJvy5C0fpTbOFgMAWAajAFv8qPAcklxe6QUcFP7V3OObWU/OzlS1L2vU+jap+g/tTE1VI/yWPExiMOgIqs9zZTKMfw/lWtOj84M8qHSMY1BA/Y0RNG7cPTd6ACk89w7uPsGqPc9Zlq5pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726038341; c=relaxed/simple;
	bh=5bxEgmyrGZ0w781E9sA/P4Mmg/yu9h72frq99nLFJgI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BAHOhnvWO+tqX70CQohtearHc85+k1Jzw6uPzKZfhqvQOhczXXk684CWrTMAUJVx4544p+xAsQ4vG9rQPidpQNeNW/xhwTU06YWIaEVADReWL3RRihBOg0VThs+dYQoM1KM2EanOsTE1ycFYTCOV47BDgLI3B3mbrv8eg1I6n+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IY0QFenQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IY0QFenQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726038339; x=1757574339;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5bxEgmyrGZ0w781E9sA/P4Mmg/yu9h72frq99nLFJgI=;
  b=IY0QFenQYBcRobvxGrjOvptHJzIQ+IHtlTanCPPGCB44TBLZpP5AQNMf
   T0dPaEd7mHFaOHXZh5AkFCYGT2y3lcEPvbssaZmRcKe0Zq/jpOk8zf96B
   FmK2PPPcoRAu2kHsAgm1oZNbE6M0EVXn7Jl8DYQmCYF4cni9Btyqd11/u
   4ofXtY4iEszL0FB5p8Dg91gPnO7KC8sa0ro6bPf9d8GiXETPGcRLSdHcx
   dYHhDxDqM99HUNMUn1RW68dFupkiOnPQ4qSTJysCca8YvxSK9HegmUM/c
   Zc2TZGpVgOSJzvS/vNe4H/HDzclDjIH7CUKhbKjfvgXsMTiQBekHn1BX6
   A==;
X-CSE-ConnectionGUID: pCa2CAqbTReGexfY5edElg==
X-CSE-MsgGUID: hBpCDZ5eSx6NE0aw1nuRVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50232480"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="50232480"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 00:05:37 -0700
X-CSE-ConnectionGUID: kxlg4RgrQx6FZvRyzUQ3RQ==
X-CSE-MsgGUID: qaD1PJ1WSGGp8O7DPxgcWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="66981776"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2024 00:05:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soHPy-0003AK-0A;
	Wed, 11 Sep 2024 07:05:34 +0000
Date: Wed, 11 Sep 2024 15:04:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [mst-vhost:vhost 5/37] drivers/virtio/virtio_balloon.c:372:37:
 warning: arithmetic between different enumeration types ('enum
 vm_event_item' and 'enum zone_type')
Message-ID: <202409111508.O5YtdBhp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: kvm@vger.kernel.org
CC: virtualization@lists.linux-foundation.org
CC: netdev@vger.kernel.org
TO: zhenwei pi <pizhenwei@bytedance.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
head:   025b6cabd88a35947637ffb7613e90c871c3381b
commit: c5b70a26aac39f09a23fd72f44cfbb3d4d5a14d5 [5/37] virtio_balloon: introduce memory allocation stall counter
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240911/202409111508.O5YtdBhp-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111508.O5YtdBhp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111508.O5YtdBhp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_balloon.c:9:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/virtio/virtio_balloon.c:9:
   In file included from include/linux/virtio.h:7:
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
   In file included from drivers/virtio/virtio_balloon.c:9:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/virtio/virtio_balloon.c:9:
   In file included from include/linux/virtio.h:7:
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
>> drivers/virtio/virtio_balloon.c:372:37: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
     372 |                 stall += events[ALLOCSTALL_NORMAL - ZONE_NORMAL + zid];
         |                                 ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   8 warnings generated.


vim +372 drivers/virtio/virtio_balloon.c

   351	
   352	#ifdef CONFIG_VM_EVENT_COUNTERS
   353	/* Return the number of entries filled by vm events */
   354	static inline unsigned int update_balloon_vm_stats(struct virtio_balloon *vb)
   355	{
   356		unsigned long events[NR_VM_EVENT_ITEMS];
   357		unsigned int idx = 0;
   358		unsigned int zid;
   359		unsigned long stall = 0;
   360	
   361		all_vm_events(events);
   362		update_stat(vb, idx++, VIRTIO_BALLOON_S_SWAP_IN,
   363			    pages_to_bytes(events[PSWPIN]));
   364		update_stat(vb, idx++, VIRTIO_BALLOON_S_SWAP_OUT,
   365			    pages_to_bytes(events[PSWPOUT]));
   366		update_stat(vb, idx++, VIRTIO_BALLOON_S_MAJFLT, events[PGMAJFAULT]);
   367		update_stat(vb, idx++, VIRTIO_BALLOON_S_MINFLT, events[PGFAULT]);
   368		update_stat(vb, idx++, VIRTIO_BALLOON_S_OOM_KILL, events[OOM_KILL]);
   369	
   370		/* sum all the stall events */
   371		for (zid = 0; zid < MAX_NR_ZONES; zid++)
 > 372			stall += events[ALLOCSTALL_NORMAL - ZONE_NORMAL + zid];
   373	
   374		update_stat(vb, idx++, VIRTIO_BALLOON_S_ALLOC_STALL, stall);
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEE513B5A0;
	Fri, 10 May 2024 21:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715375976; cv=none; b=HC1xSdlc9JdhFOtBt8rPy/fQ208OLMlrbD5D16XW2Qmrvnq2E54xr5UNPPEV9u/Xif485jShylqGWaqPWKmewz1EMTGtRC0jD8YcTyYjHbVK6Mw4EypisRTIXqy9+7lBuSQGKHgY3VLNTgaF3RKlLUSYCUOwivK2OJM3aygn2K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715375976; c=relaxed/simple;
	bh=Ho06yFWBa7tYsqkxYS/GsL3tWTwpOWSArqCV+Ep/9no=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cFKuqhLQCRniFtY78EECMRbDp9sW1UxqTNHWNgzJBLP15Lsf7Y+kkcgIOWcUaBtB9AdYet1uLdHqnGLD9U2lgss4dMl+ct3455UO5j2dDUWz0P0fD5fZg1kG9q7Pw+YXbrDzetJPKSOqPfRyDeKdUHwSe1+j0CAZGyPZb/l876I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLle/851; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLle/851"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715375975; x=1746911975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ho06yFWBa7tYsqkxYS/GsL3tWTwpOWSArqCV+Ep/9no=;
  b=iLle/851Ssq0rder+ymsRa4MejSnSPdI2VlWHwD+7miPdvRSc7tRqTgB
   C+DoEnKnnbEe4l7f11lA4s0edbF1PjGynYbN0aIjD9/m92CYA4QFN0XNK
   L3n6zSStiNxOdOobAPXg+j11JQzuGrd/1JgR4rdy2ByaUN5L+7BOF2fEK
   U5Tz9jnDHGjeVc6qEiwI5z7X5jI3HSDmUEnENi599gi7jDsjyKnw8QS7j
   8XP0D0+KRRqjwVDea2KP4i2GqpHesvp6FKgi01O4ect/Mn3lkEUGl/82e
   Q2EK1hYbO/iW7grWOOcrYr4EeYofidsUj8vog8n1EnLVg37ZDTk3b1q0t
   A==;
X-CSE-ConnectionGUID: xr0bJ8p1Q4uQdE4/hNiCXA==
X-CSE-MsgGUID: HSIltY8SQBuVIT1W54lTdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28891350"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="28891350"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 14:19:33 -0700
X-CSE-ConnectionGUID: qoc4rqj5SiuXSwoqcYnkzA==
X-CSE-MsgGUID: sZHalN1fTBCenC/xLn724w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="29754078"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 May 2024 14:19:31 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5XeL-0006Zo-0K;
	Fri, 10 May 2024 21:19:29 +0000
Date: Sat, 11 May 2024 05:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:net-accept-more 3/6] net/iucv/af_iucv.c:812:31: error:
 incomplete definition of type 'struct proto_accept_args'
Message-ID: <202405110536.2GopXUt2-lkp@intel.com>
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
head:   f91ebed7e4fc8fa21387924ecd9b6312908b3472
commit: a4b393e6ca8160d2ce71924c22f0cdf47108b1fd [3/6] net: change proto and proto_ops accept type
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240511/202405110536.2GopXUt2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110536.2GopXUt2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110536.2GopXUt2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> net/iucv/af_iucv.c:798:15: warning: declaration of 'struct proto_accept_args' will not be visible outside of this function [-Wvisibility]
     798 |                             struct proto_accept_args *arg)
         |                                    ^
>> net/iucv/af_iucv.c:812:31: error: incomplete definition of type 'struct proto_accept_args'
     812 |         timeo = sock_rcvtimeo(sk, arg->flags & O_NONBLOCK);
         |                                   ~~~^
   net/iucv/af_iucv.c:798:15: note: forward declaration of 'struct proto_accept_args'
     798 |                             struct proto_accept_args *arg)
         |                                    ^
>> net/iucv/af_iucv.c:2210:13: error: incompatible function pointer types initializing 'int (*)(struct socket *, struct socket *, struct proto_accept_arg *)' with an expression of type 'int (struct socket *, struct socket *, struct proto_accept_args *)' [-Wincompatible-function-pointer-types]
    2210 |         .accept         = iucv_sock_accept,
         |                           ^~~~~~~~~~~~~~~~
   18 warnings and 2 errors generated.


vim +812 net/iucv/af_iucv.c

   795	
   796	/* Accept a pending connection */
   797	static int iucv_sock_accept(struct socket *sock, struct socket *newsock,
 > 798				    struct proto_accept_args *arg)
   799	{
   800		DECLARE_WAITQUEUE(wait, current);
   801		struct sock *sk = sock->sk, *nsk;
   802		long timeo;
   803		int err = 0;
   804	
   805		lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
   806	
   807		if (sk->sk_state != IUCV_LISTEN) {
   808			err = -EBADFD;
   809			goto done;
   810		}
   811	
 > 812		timeo = sock_rcvtimeo(sk, arg->flags & O_NONBLOCK);
   813	
   814		/* Wait for an incoming connection */
   815		add_wait_queue_exclusive(sk_sleep(sk), &wait);
   816		while (!(nsk = iucv_accept_dequeue(sk, newsock))) {
   817			set_current_state(TASK_INTERRUPTIBLE);
   818			if (!timeo) {
   819				err = -EAGAIN;
   820				break;
   821			}
   822	
   823			release_sock(sk);
   824			timeo = schedule_timeout(timeo);
   825			lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
   826	
   827			if (sk->sk_state != IUCV_LISTEN) {
   828				err = -EBADFD;
   829				break;
   830			}
   831	
   832			if (signal_pending(current)) {
   833				err = sock_intr_errno(timeo);
   834				break;
   835			}
   836		}
   837	
   838		set_current_state(TASK_RUNNING);
   839		remove_wait_queue(sk_sleep(sk), &wait);
   840	
   841		if (err)
   842			goto done;
   843	
   844		newsock->state = SS_CONNECTED;
   845	
   846	done:
   847		release_sock(sk);
   848		return err;
   849	}
   850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

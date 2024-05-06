Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812831E492;
	Mon,  6 May 2024 23:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715037010; cv=none; b=XoLoBMHsSV9EgQ62DCqFcexJWI9BaWOw+fqZ1LbCfZSXKQwhyjpGBknzsf8w07W8mly/7ivId6QgptXeLcYlcDGeTE4XAIafJx+kVsFsGE2MGPULIQCHfDdnXrXCKx+f5xs4sUZo2LHGLOyLD4ZLIBIxdhRlfDP1QKVBun5BS18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715037010; c=relaxed/simple;
	bh=8IFsR4Q0/wEtjUDOeGHgCpfHoPbJWpnC621sA71+9DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/PeylHnFs2ljlwiSwyzE7iSjU4/Mazf6nWDe3Np9uatC5b1wSayQgN2/egc8baA/FdA9TbhZEd9QQP9J63nKPjocxuN8JyPOzqKYhQCNtQHCOXpnneHeKjrjAPue+lOT5NnO1z5fmi0OJ29m/vQaTBCt4twi27Z0QVkHK/tSMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKorSB5+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKorSB5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715037008; x=1746573008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8IFsR4Q0/wEtjUDOeGHgCpfHoPbJWpnC621sA71+9DQ=;
  b=MKorSB5++z9bl4sb63d/wmj+w9VrJTDus4rF+TjQxfij/ZfKJUEqQ6B1
   BfAbM+yZpYlKjPgPrXao/qaMhzWx0bOmC5Ph7agIKH5aXEY2WwRGaA9u6
   sFdkabNF45CBTRNlAsHKp08cMgok8jBcwXV2KlgumD5H/5OrQXc4Cziwm
   PucPb8Sz2WZhsYR05TFNrX5bnXGFWqDT7YA+RfW3vmSlo1pswcl6wdztq
   y2mJx/6hGbB7OsnNcMsbZtB/noQ2kFKAl+LfG/f798V2k67tzqSVg5DL6
   aCXQ/Ki9jYNpdLHC0Wzbi0/Rr0uuvKKqSr9d4MMk7pIEdCu5sAyCMtcc5
   A==;
X-CSE-ConnectionGUID: QjmEMml3SnuXXtv2kpg5RQ==
X-CSE-MsgGUID: 44RWFdLcTGa6ryTtB4jh/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10968665"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="10968665"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 16:10:08 -0700
X-CSE-ConnectionGUID: T3Do4q8fRl6PmVE7eSkaWg==
X-CSE-MsgGUID: wUrElg0dRZSmGAS1pF0MtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="59489147"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 May 2024 16:10:06 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s47TA-000171-1H;
	Mon, 06 May 2024 23:10:04 +0000
Date: Tue, 7 May 2024 07:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3_test_0506 8/11]
 net/rxrpc/conn_object.c:345:24: error: passing 'struct page_frag_cache' to
 parameter of incompatible type 'struct page_frag_cache *'; take the address
 with &
Message-ID: <202405070703.uZj9fVoB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3_test_0506
head:   99acbf369a16aae2fe03c509c811029881a1ea4d
commit: 15e685b00ff333b0a5355b5617391bd9b029d953 [8/11] mm: page_frag: avoid caller accessing 'page_frag_cache' directly
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240507/202405070703.uZj9fVoB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070703.uZj9fVoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070703.uZj9fVoB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/rxrpc/conn_object.c:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
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
   In file included from net/rxrpc/conn_object.c:13:
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
   In file included from net/rxrpc/conn_object.c:13:
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
   In file included from net/rxrpc/conn_object.c:13:
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
>> net/rxrpc/conn_object.c:345:24: error: passing 'struct page_frag_cache' to parameter of incompatible type 'struct page_frag_cache *'; take the address with &
     345 |         page_frag_cache_drain(conn->tx_data_alloc);
         |                               ^~~~~~~~~~~~~~~~~~~
         |                               &
   include/linux/page_frag_cache.h:36:52: note: passing argument to parameter 'nc' here
      36 | void page_frag_cache_drain(struct page_frag_cache *nc);
         |                                                    ^
   17 warnings and 1 error generated.


vim +345 net/rxrpc/conn_object.c

   305	
   306	/*
   307	 * Clean up a dead connection.
   308	 */
   309	static void rxrpc_clean_up_connection(struct work_struct *work)
   310	{
   311		struct rxrpc_connection *conn =
   312			container_of(work, struct rxrpc_connection, destructor);
   313		struct rxrpc_net *rxnet = conn->rxnet;
   314	
   315		ASSERT(!conn->channels[0].call &&
   316		       !conn->channels[1].call &&
   317		       !conn->channels[2].call &&
   318		       !conn->channels[3].call);
   319		ASSERT(list_empty(&conn->cache_link));
   320	
   321		del_timer_sync(&conn->timer);
   322		cancel_work_sync(&conn->processor); /* Processing may restart the timer */
   323		del_timer_sync(&conn->timer);
   324	
   325		write_lock(&rxnet->conn_lock);
   326		list_del_init(&conn->proc_link);
   327		write_unlock(&rxnet->conn_lock);
   328	
   329		rxrpc_purge_queue(&conn->rx_queue);
   330	
   331		rxrpc_kill_client_conn(conn);
   332	
   333		conn->security->clear(conn);
   334		key_put(conn->key);
   335		rxrpc_put_bundle(conn->bundle, rxrpc_bundle_put_conn);
   336		rxrpc_put_peer(conn->peer, rxrpc_peer_put_conn);
   337		rxrpc_put_local(conn->local, rxrpc_local_put_kill_conn);
   338	
   339		/* Drain the Rx queue.  Note that even though we've unpublished, an
   340		 * incoming packet could still be being added to our Rx queue, so we
   341		 * will need to drain it again in the RCU cleanup handler.
   342		 */
   343		rxrpc_purge_queue(&conn->rx_queue);
   344	
 > 345		page_frag_cache_drain(conn->tx_data_alloc);
   346		call_rcu(&conn->rcu, rxrpc_rcu_free_connection);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

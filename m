Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297DE1369AD;
	Sun,  5 May 2024 21:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714945871; cv=none; b=FltvFZB5G6qGGDxn+MhzlqSKgGa7gJyVlT5Tl3tXG6qDGexRtIERAy+bvILuaGj/OZ6ykDvHzBashPCnd4W2FgtN42qdj0FNGTfRleCIyQNn+zKyiIb9XyxZDH54ThRbFIrSbuwQiY2aTOeuwAU5qdd5+R13YK1PIpzOD3HUgNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714945871; c=relaxed/simple;
	bh=YT+J9QjZxk/DASal2Ipud5sdJsJpoFZefTIP00pUHMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=toGerMnchwTpW7zBJnZC6OlapF5rCMaJ7MxsIwNJDZph7R8HW+NN9gxqlKNmUnC8MgH/gQH4GzNv+cmAVCej671uyzqZmQ2gi/Tpfo2s/2TBZdyBJF3iQ70W1KxTEF6LmO8cSYI/zOO25ausnpJ1VGwNkNlYuXHQrRSXTbFk3m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSfPUE2v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSfPUE2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714945868; x=1746481868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YT+J9QjZxk/DASal2Ipud5sdJsJpoFZefTIP00pUHMc=;
  b=HSfPUE2vSrqvaRp7m05x3lEn3gZtOri2wkw4KwTcVxtwgT/eJfxH4f/M
   Ua9+eF15B25guAMGv/hmNU5YY72lDe7iY0mfV4IEUGwNXOZgRMHJYuSDw
   61lADocQCr0fza7wjdZL4hJ2djv0nwJIfWIfImGDYFK2U+r8qxPW0i53E
   0eo1ritqWypKMyj5Rg4IHO2oGUyWsCd61yomCVvIlY8vlCjNW1+14ZGz3
   WWVyCC5tRVwViCj7q5XLaOwtw87c5vefMvOu3MbEyWDHV/OZG6AzqkZD7
   OYjU7FCle/4K2K5+dQCLE82wI5pa/jSZF0lM1OCC/Rw//A9VR6Pbi6W/t
   A==;
X-CSE-ConnectionGUID: zwHQmrsJRluYh1pVWV3M1g==
X-CSE-MsgGUID: bfBaoyOrSquFjcca7wlKeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21233508"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="21233508"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 14:51:05 -0700
X-CSE-ConnectionGUID: s4RkDRuWRGucmkZ30Uw/xA==
X-CSE-MsgGUID: u1NmaSc2TEStfsTd1aBUmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="32482478"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2024 14:51:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3jl7-0000Ec-0a;
	Sun, 05 May 2024 21:51:01 +0000
Date: Mon, 6 May 2024 05:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3_test 9/9]
 net/rxrpc/conn_object.c:345:26: error: no member named 'va' in 'struct
 page_frag_cache'
Message-ID: <202405060548.S8Hk8GVg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3_test
head:   128485e995fc7e92dfb438c15e97da66fc1d5240
commit: 128485e995fc7e92dfb438c15e97da66fc1d5240 [9/9] mm: page_frag: reuse existing space for 'size' and 'pfmemalloc'
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240506/202405060548.S8Hk8GVg-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060548.S8Hk8GVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060548.S8Hk8GVg-lkp@intel.com/

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
>> net/rxrpc/conn_object.c:345:26: error: no member named 'va' in 'struct page_frag_cache'
     345 |         if (conn->tx_data_alloc.va)
         |             ~~~~~~~~~~~~~~~~~~~ ^
   net/rxrpc/conn_object.c:346:60: error: no member named 'va' in 'struct page_frag_cache'
     346 |                 __page_frag_cache_drain(virt_to_page(conn->tx_data_alloc.va),
         |                                                      ~~~~~~~~~~~~~~~~~~~ ^
   arch/s390/include/asm/page.h:231:53: note: expanded from macro 'virt_to_page'
     231 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                                         ^~~~~
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   17 warnings and 2 errors generated.


vim +345 net/rxrpc/conn_object.c

3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  305  
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  306  /*
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  307   * Clean up a dead connection.
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  308   */
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  309  static void rxrpc_clean_up_connection(struct work_struct *work)
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  310  {
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  311  	struct rxrpc_connection *conn =
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  312  		container_of(work, struct rxrpc_connection, destructor);
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  313  	struct rxrpc_net *rxnet = conn->rxnet;
7fa25105b2d32f net/rxrpc/conn_object.c   David Howells 2022-10-21  314  
9d35d880e0e4a3 net/rxrpc/conn_object.c   David Howells 2022-10-19  315  	ASSERT(!conn->channels[0].call &&
9d35d880e0e4a3 net/rxrpc/conn_object.c   David Howells 2022-10-19  316  	       !conn->channels[1].call &&
9d35d880e0e4a3 net/rxrpc/conn_object.c   David Howells 2022-10-19  317  	       !conn->channels[2].call &&
9d35d880e0e4a3 net/rxrpc/conn_object.c   David Howells 2022-10-19  318  	       !conn->channels[3].call);
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  319  	ASSERT(list_empty(&conn->cache_link));
17926a79320afa net/rxrpc/ar-connection.c David Howells 2007-04-26  320  
3136ef49a14ccc net/rxrpc/conn_object.c   David Howells 2017-11-24  321  	del_timer_sync(&conn->timer);
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  322  	cancel_work_sync(&conn->processor); /* Processing may restart the timer */
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  323  	del_timer_sync(&conn->timer);
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  324  
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  325  	write_lock(&rxnet->conn_lock);
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  326  	list_del_init(&conn->proc_link);
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  327  	write_unlock(&rxnet->conn_lock);
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  328  
17926a79320afa net/rxrpc/ar-connection.c David Howells 2007-04-26  329  	rxrpc_purge_queue(&conn->rx_queue);
17926a79320afa net/rxrpc/ar-connection.c David Howells 2007-04-26  330  
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  331  	rxrpc_kill_client_conn(conn);
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  332  
e0e4d82f3be60c net/rxrpc/ar-connection.c David Howells 2016-04-07  333  	conn->security->clear(conn);
2cc800863c49a1 net/rxrpc/conn_object.c   David Howells 2022-10-19  334  	key_put(conn->key);
fa3492abb64b93 net/rxrpc/conn_object.c   David Howells 2022-11-02  335  	rxrpc_put_bundle(conn->bundle, rxrpc_bundle_put_conn);
47c810a7984446 net/rxrpc/conn_object.c   David Howells 2022-10-21  336  	rxrpc_put_peer(conn->peer, rxrpc_peer_put_conn);
0fde882fc9ee9c net/rxrpc/conn_object.c   David Howells 2022-10-21  337  	rxrpc_put_local(conn->local, rxrpc_local_put_kill_conn);
e0e4d82f3be60c net/rxrpc/ar-connection.c David Howells 2016-04-07  338  
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  339  	/* Drain the Rx queue.  Note that even though we've unpublished, an
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  340  	 * incoming packet could still be being added to our Rx queue, so we
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  341  	 * will need to drain it again in the RCU cleanup handler.
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  342  	 */
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  343  	rxrpc_purge_queue(&conn->rx_queue);
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  344  
49489bb03a5015 net/rxrpc/conn_object.c   David Howells 2024-01-29 @345  	if (conn->tx_data_alloc.va)
49489bb03a5015 net/rxrpc/conn_object.c   David Howells 2024-01-29  346  		__page_frag_cache_drain(virt_to_page(conn->tx_data_alloc.va),
49489bb03a5015 net/rxrpc/conn_object.c   David Howells 2024-01-29  347  					conn->tx_data_alloc.pagecnt_bias);
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  348  	call_rcu(&conn->rcu, rxrpc_rcu_free_connection);
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  349  }
3cec055c56958c net/rxrpc/conn_object.c   David Howells 2022-11-25  350  

:::::: The code at line 345 was first introduced by commit
:::::: 49489bb03a501547450e8fdc6d85d023d8a3b2c4 rxrpc: Do zerocopy using MSG_SPLICE_PAGES and page frags

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE56482D7;
	Sun, 12 May 2024 19:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715541431; cv=none; b=CLsY4tN72nHJizKT2lDu6SkFRfbXEkl+D02Z7P6Xfbn/a0kX0ucI0XLOv00anVYbkVEXjkaxWx8a0ZDjiHhoEg7llynZ032WJT+M/dH8BCRgxQXhmHB2tdTntkt+f9Yi/leHEsZksxeEUA8p2mpXCKSYqtfMEicX1idpbyG6hE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715541431; c=relaxed/simple;
	bh=U8fUA68qemrouLRwVuy+7DihdKlf39kSBPfDjw2FUPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h7m5Q8QHWSDsSd5HfbIkRohbag7p50xvXcF/9guLH1K2wDpwp60kZav90sZwtyZks41VkhUwQEg9HN1YjCSZM7Bl1XgtWElEUVL+sycvQS2PW8qlSd1tdgRaQuRtPfCgLS5kA2mxuuYcNn4gE7H0KvDMXg+dl/Iu+AMvMwAJXl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOASirYA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOASirYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715541429; x=1747077429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U8fUA68qemrouLRwVuy+7DihdKlf39kSBPfDjw2FUPg=;
  b=VOASirYAQW+Mk1R7V3Jkt3FCZJPjaPix2jTG5MwtJa1PoPoJHwzrKyKG
   X2TaLC+/uHXqeyoSg5YRjex95E4VUU1cUk+KMXXRqw1Pwop/3PLLgKpeb
   /1nlSKUysH2zIBCC5xSeXmMcbXmTnsWv04Wxjo/yDKxGDNpQcGzKF7gaH
   ElVD15d3v/hcY5skk9DQb6TOlXnmL+CvPOmFvGfl3IzP+929sWc8EVDQs
   HJhfFUCeeDuvrxMlfEKe5bEcAOv1CnmsDgp6jS2Km9BMtLkhNitE2pz8g
   RT9EHBPX2x8LuiRVkBW5/iJcCTRD0FfIQdjWP+gvbWqPUcrpLSIlYepoN
   g==;
X-CSE-ConnectionGUID: hzrQvl9DQC+xibdzYIpYFQ==
X-CSE-MsgGUID: M5Eff8B2RAaVIMJ5c+22Cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="28986141"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="28986141"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 12:17:08 -0700
X-CSE-ConnectionGUID: DKsoRgJvQHGpTy6bV33T/w==
X-CSE-MsgGUID: ebP+28UKQCG7ybnFjAAFlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="30698850"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 May 2024 12:17:06 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6Egy-0008qh-0q;
	Sun, 12 May 2024 19:17:04 +0000
Date: Mon, 13 May 2024 03:16:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v4_0509 11/13]
 net/mptcp/protocol.c:1852:10: warning: variable 'offset' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202405130320.61VsUSWA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v4_0509
head:   91a2b1a96a0ee263617669cdf8564aac759b0719
commit: c868933189e44e45cf7ff0088d9bc5f77bf63e83 [11/13] net: replace page_frag with page_frag_cache
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240513/202405130320.61VsUSWA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405130320.61VsUSWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405130320.61VsUSWA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/mptcp/protocol.c:10:
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
   In file included from net/mptcp/protocol.c:11:
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
   In file included from net/mptcp/protocol.c:11:
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
   In file included from net/mptcp/protocol.c:11:
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
>> net/mptcp/protocol.c:1852:10: warning: variable 'offset' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1852 |                 page = page_frag_alloc_probe(pfrag, &offset, &size, &va);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page_frag_cache.h:155:6: note: expanded from macro 'page_frag_alloc_probe'
     155 |         if (likely((nc)->remaining >= *fragsz))                         \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:20: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/protocol.c:1853:59: note: uninitialized use occurs here
    1853 |                 dfrag_collapsed = mptcp_frag_can_collapse_to(msk, page, offset,
         |                                                                         ^~~~~~
   net/mptcp/protocol.c:1852:10: note: remove the 'if' if its condition is always true
    1852 |                 page = page_frag_alloc_probe(pfrag, &offset, &size, &va);
         |                        ^
   include/linux/page_frag_cache.h:155:2: note: expanded from macro 'page_frag_alloc_probe'
     155 |         if (likely((nc)->remaining >= *fragsz))                         \
         |         ^
   net/mptcp/protocol.c:1835:22: note: initialize the variable 'offset' to silence this warning
    1835 |                 unsigned int offset, size;
         |                                    ^
         |                                     = 0
   18 warnings generated.


vim +1852 net/mptcp/protocol.c

  1792	
  1793	static int mptcp_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
  1794	{
  1795		struct mptcp_sock *msk = mptcp_sk(sk);
  1796		struct page_frag_cache *pfrag;
  1797		size_t copied = 0;
  1798		int ret = 0;
  1799		long timeo;
  1800	
  1801		/* silently ignore everything else */
  1802		msg->msg_flags &= MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL | MSG_FASTOPEN;
  1803	
  1804		lock_sock(sk);
  1805	
  1806		if (unlikely(inet_test_bit(DEFER_CONNECT, sk) ||
  1807			     msg->msg_flags & MSG_FASTOPEN)) {
  1808			int copied_syn = 0;
  1809	
  1810			ret = mptcp_sendmsg_fastopen(sk, msg, len, &copied_syn);
  1811			copied += copied_syn;
  1812			if (ret == -EINPROGRESS && copied_syn > 0)
  1813				goto out;
  1814			else if (ret)
  1815				goto do_error;
  1816		}
  1817	
  1818		timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
  1819	
  1820		if ((1 << sk->sk_state) & ~(TCPF_ESTABLISHED | TCPF_CLOSE_WAIT)) {
  1821			ret = sk_stream_wait_connect(sk, &timeo);
  1822			if (ret)
  1823				goto do_error;
  1824		}
  1825	
  1826		ret = -EPIPE;
  1827		if (unlikely(sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN)))
  1828			goto do_error;
  1829	
  1830		pfrag = sk_page_frag(sk);
  1831	
  1832		while (msg_data_left(msg)) {
  1833			int total_ts, frag_truesize = 0;
  1834			struct mptcp_data_frag *dfrag;
  1835			unsigned int offset, size;
  1836			bool dfrag_collapsed;
  1837			struct page *page;
  1838			u32 copy_limit;
  1839			size_t psize;
  1840			void *va;
  1841	
  1842			/* ensure fitting the notsent_lowat() constraint */
  1843			copy_limit = mptcp_send_limit(sk);
  1844			if (!copy_limit)
  1845				goto wait_for_memory;
  1846	
  1847			/* reuse tail pfrag, if possible, or carve a new one from the
  1848			 * page allocator
  1849			 */
  1850			dfrag = mptcp_pending_tail(sk);
  1851			size = 1;
> 1852			page = page_frag_alloc_probe(pfrag, &offset, &size, &va);
  1853			dfrag_collapsed = mptcp_frag_can_collapse_to(msk, page, offset,
  1854								     dfrag);
  1855			if (!dfrag_collapsed) {
  1856				size = 32U + sizeof(struct mptcp_data_frag);
  1857				page = mptcp_page_frag_alloc_prepare(sk, pfrag, &offset,
  1858								     &size, &va);
  1859				if (!page)
  1860					goto wait_for_memory;
  1861	
  1862				dfrag = mptcp_carve_data_frag(msk, page, offset);
  1863				frag_truesize = dfrag->overhead;
  1864				va += dfrag->overhead;
  1865			}
  1866	
  1867			/* we do not bound vs wspace, to allow a single packet.
  1868			 * memory accounting will prevent execessive memory usage
  1869			 * anyway
  1870			 */
  1871			psize = size - frag_truesize;
  1872			psize = min_t(size_t, psize, msg_data_left(msg));
  1873			psize = min_t(size_t, psize, copy_limit);
  1874			total_ts = psize + frag_truesize;
  1875	
  1876			if (!sk_wmem_schedule(sk, total_ts))
  1877				goto wait_for_memory;
  1878	
  1879			ret = do_copy_data_nocache(sk, psize, &msg->msg_iter, va);
  1880			if (ret)
  1881				goto do_error;
  1882	
  1883			/* data successfully copied into the write queue */
  1884			sk_forward_alloc_add(sk, -total_ts);
  1885			copied += psize;
  1886			dfrag->data_len += psize;
  1887			frag_truesize += psize;
  1888			WRITE_ONCE(msk->write_seq, msk->write_seq + psize);
  1889	
  1890			/* charge data on mptcp pending queue to the msk socket
  1891			 * Note: we charge such data both to sk and ssk
  1892			 */
  1893			sk_wmem_queued_add(sk, frag_truesize);
  1894			if (!dfrag_collapsed) {
  1895				page_frag_alloc_commit(pfrag, frag_truesize);
  1896				list_add_tail(&dfrag->list, &msk->rtx_queue);
  1897				if (!msk->first_pending)
  1898					WRITE_ONCE(msk->first_pending, dfrag);
  1899			} else {
  1900				page_frag_alloc_commit_noref(pfrag, frag_truesize);
  1901			}
  1902	
  1903			pr_debug("msk=%p dfrag at seq=%llu len=%u sent=%u new=%d", msk,
  1904				 dfrag->data_seq, dfrag->data_len, dfrag->already_sent,
  1905				 !dfrag_collapsed);
  1906	
  1907			continue;
  1908	
  1909	wait_for_memory:
  1910			set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
  1911			__mptcp_push_pending(sk, msg->msg_flags);
  1912			ret = sk_stream_wait_memory(sk, &timeo);
  1913			if (ret)
  1914				goto do_error;
  1915		}
  1916	
  1917		if (copied)
  1918			__mptcp_push_pending(sk, msg->msg_flags);
  1919	
  1920	out:
  1921		release_sock(sk);
  1922		return copied;
  1923	
  1924	do_error:
  1925		if (copied)
  1926			goto out;
  1927	
  1928		copied = sk_stream_error(sk, msg->msg_flags, ret);
  1929		goto out;
  1930	}
  1931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

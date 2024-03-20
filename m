Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02100FC17;
	Wed, 20 Mar 2024 03:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710903901; cv=none; b=kM2Blsk8OdRCz7CpkCPNE3vizIxZAUVWgrekcom2T5yXPI4fLTs2aV8vHXhnUYAUJXFB4bCAxypXbmwZ91QLs3do3ho7Em0tgbu7hndgDNNSINITPsvfA4aRQHi765ZtUtykmmDEUxWyZga6o3tEwyX2mxGbbltmlK7wD1uEUTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710903901; c=relaxed/simple;
	bh=aCyQlbqJpf4YT/vA665jav8TTcuzDASNVNk+M4i9uqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L41a4wdmlDWgw3IOkxitFbE6cR96VqqFUVolr+9Q85t6C65/1lqFOLpMDQY/o9/ngrwwlMA8QJoEG/rOA3Jr18DT1/mFijqZ4gZbnn0dw5SiEVKSTwqs2JLEgJOckEHt5w4tvg7nLJexMZ7EnW2eCx04V0ic7nxkRlE3REQ8AmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAYix+vS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAYix+vS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710903899; x=1742439899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aCyQlbqJpf4YT/vA665jav8TTcuzDASNVNk+M4i9uqE=;
  b=FAYix+vSADen+OAYJfK1Q2LQ8sST2RfFxfJOyF+N7A2LkP1bXZPLRILd
   LMZbsleyH6IcxbmjEmH9bvD3fTdn1V9juL3vnLeZZFZ+fb4A4bWuEnEaQ
   pWWANS4MZQjx7NjIvt92pqP8Vod2V1HwY9xTrqSujy1WuuS5vyxA8aXE0
   NVD1v74mRuQ6V+sUaeR/zNayFs4tW9KM1+mDOeTOcgXMDoKf9o5u23Q1a
   H1wWQeEXh6t+MC6jOURw01nt9L+0dB0RjG1U2Rhu22FBt3abHeuDmB5Oj
   ZrVjGcYAnp1TbAev1L6lrDNaam62dJ6h/fvqejrx4nV9qp4QU285uTUeb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6418373"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="6418373"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 20:04:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="14023626"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Mar 2024 20:04:57 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmmG6-000IHR-1l;
	Wed, 20 Mar 2024 03:04:54 +0000
Date: Wed, 20 Mar 2024 11:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_prototype 78/78]
 net/mptcp/protocol.c:1825:8: error: incompatible pointer types assigning to
 'struct page_frag *' from 'struct page_frag_cache *'
Message-ID: <202403201106.yeRFS1lC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_prototype
head:   7315604eb1d087836123bc9670d2be420a42d37f
commit: 7315604eb1d087836123bc9670d2be420a42d37f [78/78] net: replace page_frag with page_frag_cache
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240320/202403201106.yeRFS1lC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403201106.yeRFS1lC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403201106.yeRFS1lC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/mptcp/protocol.c:10:
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
>> net/mptcp/protocol.c:1825:8: error: incompatible pointer types assigning to 'struct page_frag *' from 'struct page_frag_cache *' [-Werror,-Wincompatible-pointer-types]
    1825 |         pfrag = sk_page_frag(sk);
         |               ^ ~~~~~~~~~~~~~~~~
   17 warnings and 1 error generated.


vim +1825 net/mptcp/protocol.c

29b5e5ef873979 Paolo Abeni      2024-03-01  1787  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1788  static int mptcp_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1789  {
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1790  	struct mptcp_sock *msk = mptcp_sk(sk);
17091708d1e503 Florian Westphal 2020-05-16  1791  	struct page_frag *pfrag;
6d0060f600adfd Mat Martineau    2020-01-21  1792  	size_t copied = 0;
caf971df01b86f Paolo Abeni      2020-11-16  1793  	int ret = 0;
6d0060f600adfd Mat Martineau    2020-01-21  1794  	long timeo;
f870fa0b576884 Mat Martineau    2020-01-21  1795  
987858e5d026d3 Paolo Abeni      2021-04-23  1796  	/* silently ignore everything else */
1e777f39b4d75e Dmytro Shytyi    2022-11-25  1797  	msg->msg_flags &= MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL | MSG_FASTOPEN;
987858e5d026d3 Paolo Abeni      2021-04-23  1798  
6511882cdd82d6 Paolo Abeni      2021-10-26  1799  	lock_sock(sk);
1954b86016cf85 Mat Martineau    2020-02-28  1800  
08e39c0dfa29f2 Eric Dumazet     2023-08-16  1801  	if (unlikely(inet_test_bit(DEFER_CONNECT, sk) ||
08e39c0dfa29f2 Eric Dumazet     2023-08-16  1802  		     msg->msg_flags & MSG_FASTOPEN)) {
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1803  		int copied_syn = 0;
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1804  
a2702a076e7378 Paolo Abeni      2023-04-14  1805  		ret = mptcp_sendmsg_fastopen(sk, msg, len, &copied_syn);
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1806  		copied += copied_syn;
fa9e57468aa10e Paolo Abeni      2022-10-21  1807  		if (ret == -EINPROGRESS && copied_syn > 0)
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1808  			goto out;
fa9e57468aa10e Paolo Abeni      2022-10-21  1809  		else if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1810  			goto do_error;
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1811  	}
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1812  
1954b86016cf85 Mat Martineau    2020-02-28  1813  	timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
1954b86016cf85 Mat Martineau    2020-02-28  1814  
1954b86016cf85 Mat Martineau    2020-02-28  1815  	if ((1 << sk->sk_state) & ~(TCPF_ESTABLISHED | TCPF_CLOSE_WAIT)) {
1954b86016cf85 Mat Martineau    2020-02-28  1816  		ret = sk_stream_wait_connect(sk, &timeo);
1954b86016cf85 Mat Martineau    2020-02-28  1817  		if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1818  			goto do_error;
1954b86016cf85 Mat Martineau    2020-02-28  1819  	}
1954b86016cf85 Mat Martineau    2020-02-28  1820  
69800e516e968f Paolo Abeni      2022-09-30  1821  	ret = -EPIPE;
69800e516e968f Paolo Abeni      2022-09-30  1822  	if (unlikely(sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN)))
69800e516e968f Paolo Abeni      2022-09-30  1823  		goto do_error;
69800e516e968f Paolo Abeni      2022-09-30  1824  
17091708d1e503 Florian Westphal 2020-05-16 @1825  	pfrag = sk_page_frag(sk);
18b683bff89d46 Paolo Abeni      2020-03-27  1826  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1827  	while (msg_data_left(msg)) {
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1828  		int total_ts, frag_truesize = 0;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1829  		struct mptcp_data_frag *dfrag;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1830  		bool dfrag_collapsed;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1831  		size_t psize, offset;
29b5e5ef873979 Paolo Abeni      2024-03-01  1832  		u32 copy_limit;
29b5e5ef873979 Paolo Abeni      2024-03-01  1833  
29b5e5ef873979 Paolo Abeni      2024-03-01  1834  		/* ensure fitting the notsent_lowat() constraint */
29b5e5ef873979 Paolo Abeni      2024-03-01  1835  		copy_limit = mptcp_send_limit(sk);
29b5e5ef873979 Paolo Abeni      2024-03-01  1836  		if (!copy_limit)
29b5e5ef873979 Paolo Abeni      2024-03-01  1837  			goto wait_for_memory;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1838  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1839  		/* reuse tail pfrag, if possible, or carve a new one from the
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1840  		 * page allocator
fb529e62d3f3e8 Florian Westphal 2020-05-16  1841  		 */
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1842  		dfrag = mptcp_pending_tail(sk);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1843  		dfrag_collapsed = mptcp_frag_can_collapse_to(msk, pfrag, dfrag);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1844  		if (!dfrag_collapsed) {
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1845  			if (!mptcp_page_frag_refill(sk, pfrag))
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1846  				goto wait_for_memory;
cec37a6e41aae7 Peter Krystad    2020-01-21  1847  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1848  			dfrag = mptcp_carve_data_frag(msk, pfrag, pfrag->offset);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1849  			frag_truesize = dfrag->overhead;
72511aab95c94d Florian Westphal 2020-05-16  1850  		}
6d0060f600adfd Mat Martineau    2020-01-21  1851  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1852  		/* we do not bound vs wspace, to allow a single packet.
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1853  		 * memory accounting will prevent execessive memory usage
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1854  		 * anyway
d5f49190def61c Paolo Abeni      2020-09-14  1855  		 */
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1856  		offset = dfrag->offset + dfrag->data_len;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1857  		psize = pfrag->size - offset;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1858  		psize = min_t(size_t, psize, msg_data_left(msg));
29b5e5ef873979 Paolo Abeni      2024-03-01  1859  		psize = min_t(size_t, psize, copy_limit);
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1860  		total_ts = psize + frag_truesize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1861  
6511882cdd82d6 Paolo Abeni      2021-10-26  1862  		if (!sk_wmem_schedule(sk, total_ts))
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1863  			goto wait_for_memory;
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1864  
0ffe8e74904027 Paolo Abeni      2023-10-23  1865  		ret = do_copy_data_nocache(sk, psize, &msg->msg_iter,
0ffe8e74904027 Paolo Abeni      2023-10-23  1866  					   page_address(dfrag->page) + offset);
0ffe8e74904027 Paolo Abeni      2023-10-23  1867  		if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1868  			goto do_error;
72511aab95c94d Florian Westphal 2020-05-16  1869  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1870  		/* data successfully copied into the write queue */
5e6300e7b3a4ab Eric Dumazet     2023-08-31  1871  		sk_forward_alloc_add(sk, -total_ts);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1872  		copied += psize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1873  		dfrag->data_len += psize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1874  		frag_truesize += psize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1875  		pfrag->offset += frag_truesize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1876  		WRITE_ONCE(msk->write_seq, msk->write_seq + psize);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1877  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1878  		/* charge data on mptcp pending queue to the msk socket
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1879  		 * Note: we charge such data both to sk and ssk
fb529e62d3f3e8 Florian Westphal 2020-05-16  1880  		 */
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1881  		sk_wmem_queued_add(sk, frag_truesize);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1882  		if (!dfrag_collapsed) {
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1883  			get_page(dfrag->page);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1884  			list_add_tail(&dfrag->list, &msk->rtx_queue);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1885  			if (!msk->first_pending)
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1886  				WRITE_ONCE(msk->first_pending, dfrag);
6d0060f600adfd Mat Martineau    2020-01-21  1887  		}
e4b6135134a75f Geliang Tang     2021-04-16  1888  		pr_debug("msk=%p dfrag at seq=%llu len=%u sent=%u new=%d", msk,
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1889  			 dfrag->data_seq, dfrag->data_len, dfrag->already_sent,
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1890  			 !dfrag_collapsed);
6d0060f600adfd Mat Martineau    2020-01-21  1891  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1892  		continue;
b51f9b80c032e1 Paolo Abeni      2020-03-27  1893  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1894  wait_for_memory:
037db6ea57da7a Paolo Abeni      2024-03-01  1895  		set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
c2e6048fa1cf22 Paolo Abeni      2021-03-04  1896  		__mptcp_push_pending(sk, msg->msg_flags);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1897  		ret = sk_stream_wait_memory(sk, &timeo);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1898  		if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1899  			goto do_error;
57040755a3e43a Paolo Abeni      2020-01-21  1900  	}
6d0060f600adfd Mat Martineau    2020-01-21  1901  
13e1603739e58e Paolo Abeni      2020-12-16  1902  	if (copied)
c2e6048fa1cf22 Paolo Abeni      2021-03-04  1903  		__mptcp_push_pending(sk, msg->msg_flags);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1904  
1954b86016cf85 Mat Martineau    2020-02-28  1905  out:
cec37a6e41aae7 Peter Krystad    2020-01-21  1906  	release_sock(sk);
69800e516e968f Paolo Abeni      2022-09-30  1907  	return copied;
69800e516e968f Paolo Abeni      2022-09-30  1908  
69800e516e968f Paolo Abeni      2022-09-30  1909  do_error:
69800e516e968f Paolo Abeni      2022-09-30  1910  	if (copied)
69800e516e968f Paolo Abeni      2022-09-30  1911  		goto out;
69800e516e968f Paolo Abeni      2022-09-30  1912  
69800e516e968f Paolo Abeni      2022-09-30  1913  	copied = sk_stream_error(sk, msg->msg_flags, ret);
69800e516e968f Paolo Abeni      2022-09-30  1914  	goto out;
f870fa0b576884 Mat Martineau    2020-01-21  1915  }
f870fa0b576884 Mat Martineau    2020-01-21  1916  

:::::: The code at line 1825 was first introduced by commit
:::::: 17091708d1e503383f20934631305ccb375b0eb1 mptcp: fill skb page frag cache outside of mptcp_sendmsg_frag

:::::: TO: Florian Westphal <fw@strlen.de>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

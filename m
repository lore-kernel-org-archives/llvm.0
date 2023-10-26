Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E0E163;
	Thu, 26 Oct 2023 02:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y140UGfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698287875; x=1729823875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Izu7oXybb60DQ3mhCLHJYn0C+zLjdBPuST0SpoLL5iw=;
  b=Y140UGfctp1amBvcTqPewlitKdb+wIM8pafDSmeUq2TTUgMp1xkqdHTS
   +MQp1gFyB7CWozS4F3izIOMR2MVBV0+nr7HV7WPhs0pIcbZVavo/xOqWk
   OvTujz5ZWck4VStF6SobgOrHM0l4oY8W5g6TDQb7vVO0Q7Hfm6dAUet+R
   qrwyVAxkUG8UTkswMqE5p51fiZ+LwT599nhql5qinVAjvAK/4bZIK2wEQ
   ZqXmDnIiroGM4qeN3CBFbX72QRXgqH2u385OhwoLjcHRE5GvbxMUF8fFV
   Udb8oOgv9hVO8HOL/HI9S4akfAJ7zPR/lXd41avFauZl+MnBVQ8CUurWT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="453914180"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="453914180"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 19:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762667649"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="762667649"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Oct 2023 19:37:53 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvqFr-0009Oe-0Z;
	Thu, 26 Oct 2023 02:37:51 +0000
Date: Thu, 26 Oct 2023 10:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/veth2 14/16] io_uring/zc_rx.c:644:93: warning: format
 specifies type 'unsigned long' but the argument has type 'size_t' (aka
 'unsigned int')
Message-ID: <202310261045.4iDfHVTB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth2
head:   731b7375c43d08e971bcafcd9e90c1c0c8250678
commit: 1e65d03befc872b1f243c468fd33761c1a5d253f [14/16] make it work
config: arm-vexpress_defconfig (https://download.01.org/0day-ci/archive/20231026/202310261045.4iDfHVTB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261045.4iDfHVTB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261045.4iDfHVTB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/zc_rx.c:62:51: warning: shift count >= width of type [-Wshift-count-overflow]
      62 |         return PagePrivate(page) && ((page_private(page) >> 48) == 0xface);
         |                                                          ^  ~~
   io_uring/zc_rx.c:186:5: warning: no previous prototype for function 'io_zc_rx_create_pool' [-Wmissing-prototypes]
     186 | int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
         |     ^
   io_uring/zc_rx.c:186:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     186 | int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
         | ^
         | static 
   io_uring/zc_rx.c:262:4: warning: variable 'count' is uninitialized when used here [-Wuninitialized]
     262 |                         count++;
         |                         ^~~~~
   io_uring/zc_rx.c:252:20: note: initialize the variable 'count' to silence this warning
     252 |         int i, refc, count;
         |                           ^
         |                            = 0
>> io_uring/zc_rx.c:644:93: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     644 |         printk("----- zc_rx_recv_skb: start=%d, offset=%d, len=%lu, nr_frags=%d\n", start, offset, len, skb_shinfo(skb)->nr_frags);
         |                                                                ~~~                                 ^~~
         |                                                                %zu
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   4 warnings generated.


vim +644 io_uring/zc_rx.c

   623	
   624	static int
   625	zc_rx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
   626		       unsigned int offset, size_t len)
   627	{
   628		struct io_zc_rx_ifq *ifq;
   629		struct sk_buff *frag_iter;
   630		unsigned start, start_off;
   631		int i, copy, end, off;
   632		int ret = 0;
   633	
   634		ifq = io_zc_rx_ifq_skb(skb);
   635		if (!ifq) {
   636			pr_debug("non zerocopy pages are not supported\n");
   637			return -EFAULT;
   638		}
   639		start = skb_headlen(skb);
   640		start_off = offset;
   641	
   642		// TODO: copy payload in skb linear data */
   643		WARN_ON(offset < start);
 > 644		printk("----- zc_rx_recv_skb: start=%d, offset=%d, len=%lu, nr_frags=%d\n", start, offset, len, skb_shinfo(skb)->nr_frags);
   645	
   646		// TODO: make sure theres at least nr_frags entries in cq ring
   647		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
   648			const skb_frag_t *frag;
   649	
   650			WARN_ON(start > offset + len);
   651	
   652			frag = &skb_shinfo(skb)->frags[i];
   653			end = start + skb_frag_size(frag);
   654			printk("----- zc_rx_recv_skb: skb frag size=%d, end=%d\n", skb_frag_size(frag), end);
   655	
   656			if (offset < end) {
   657				copy = end - offset;
   658				if (copy > len)
   659					copy = len;
   660	
   661				off = offset - start;
   662				ret = zc_rx_recv_frag(ifq, frag, off, copy);
   663				if (ret < 0) {
   664					printk("----- zc_rx_recv_skb: recv_frag err=%d\n", ret);
   665					goto out;
   666				}
   667	
   668				offset += ret;
   669				len -= ret;
   670				if (len == 0 || ret != copy)
   671					goto out;
   672			}
   673			start = end;
   674		}
   675	
   676		skb_walk_frags(skb, frag_iter) {
   677			WARN_ON(start > offset + len);
   678	
   679			end = start + frag_iter->len;
   680			if (offset < end) {
   681				copy = end - offset;
   682				if (copy > len)
   683					copy = len;
   684	
   685				off = offset - start;
   686				ret = zc_rx_recv_skb(desc, frag_iter, off, copy);
   687				if (ret < 0)
   688					goto out;
   689	
   690				offset += ret;
   691				len -= ret;
   692				if (len == 0 || ret != copy)
   693					goto out;
   694			}
   695			start = end;
   696		}
   697	
   698	out:
   699		printk("----- zc_rx_recv_skb: updating tail, tail=%u, cached_tail=%u\n", ifq->ring->cq.tail, ifq->cached_cq_tail);
   700		smp_store_release(&ifq->ring->cq.tail, ifq->cached_cq_tail);
   701		if (offset == start_off)
   702			return ret;
   703		printk("----- zc_rx_recv_skb: out, offset=%d, start_off=%d\n", offset, start_off);
   704		return offset - start_off;
   705	}
   706	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

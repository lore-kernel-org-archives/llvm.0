Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6AE1640F;
	Fri, 30 Jun 2023 14:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688135433; x=1719671433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qAMJ/6ev9BW8+aOspiWi2iJJaPXRhGEiO3XmryT6R7U=;
  b=FXwYq52rM2yEIpe9FjvmczFExu8LJyn4zCvTphhXkEMy4QI+tBDinCTt
   u6PjC+wm+ArIf1NfSSXwEn+l4o6saS8ugwCO8Osxv26RmbvIDDZWBY1iG
   TCvMpf111+SFEWG/1ijAgBeSj8sjqz33Jj1TukoVLJYMx2LLOkd53iODq
   uOFCJSgjaGMD7zHifL6OeBqx7LdIaJdVh2q+M0eKbTfdiXKVOeB2PAqtz
   V9k4FeVQbewmZggUNbkkHLbrAqRv/R8TPu9QyFkGG3uqHxHnSdgQX1vtD
   4773ers9fxadXgzANXOXA2SfE/IBFmjt/aErL2aM3oR/cRNZAm2Gcqpyg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="361255031"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="361255031"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 07:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="783102327"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="783102327"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jun 2023 07:30:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFF8m-000F2V-1y;
	Fri, 30 Jun 2023 14:30:28 +0000
Date: Fri, 30 Jun 2023 22:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-extract 19/20] net/core/datagram.c:689:5: error:
 implicit declaration of function 'page_put_unpin_sub' is invalid in C99
Message-ID: <202306302207.oBNk8ePG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-extract
head:   19ee2529bb48ab3bba1d2cfc7a0811ae08a22505
commit: e22944e2e3e0c62433f2a9cb99594b056bc1f6e5 [19/20] net: [WIP] Make __zerocopy_sg_from_iter() correctly pin or leave pages unref'd
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230630/202306302207.oBNk8ePG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302207.oBNk8ePG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302207.oBNk8ePG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from net/core/datagram.c:42:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from net/core/datagram.c:42:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from net/core/datagram.c:45:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   include/linux/skbuff.h:405:29: error: use of undeclared identifier 'FOLL_PIN'
           cleanup_mode &= FOLL_GET | FOLL_PIN;
                                      ^
   include/linux/skbuff.h:2475:8: error: no member named 'bv_offset' in 'struct skb_frag'; did you mean 'offset'?
           frag->bv_offset = off;
                 ^~~~~~~~~
                 offset
   include/linux/skbuff.h:366:15: note: 'offset' declared here
           unsigned int    offset;
                           ^
   include/linux/skbuff.h:3454:2: error: implicit declaration of function 'try_grab_page' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           try_grab_page(page, skb_frag_cleanup(frag));
           ^
   include/linux/skbuff.h:3454:2: note: did you mean 'try_get_page'?
   include/linux/mm.h:1396:33: note: 'try_get_page' declared here
   static inline __must_check bool try_get_page(struct page *page)
                                   ^
   In file included from net/core/datagram.c:45:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   include/linux/skbuff.h:3478:2: error: implicit declaration of function 'page_put_unpin' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           page_put_unpin(page, skb_frag_cleanup(frag));
           ^
   include/linux/skbuff.h:3478:2: note: did you mean 'page_put_link'?
   include/linux/fs.h:2887:13: note: 'page_put_link' declared here
   extern void page_put_link(void *);
               ^
   net/core/datagram.c:617:64: error: use of undeclared identifier 'SKB_FRAG_PINNED'
           unsigned int cleanup_mode = iov_iter_extract_will_pin(from) ? SKB_FRAG_PINNED : 0;
                                                                         ^
   net/core/datagram.c:638:7: error: use of undeclared identifier 'READ_FROM_ITER'
                                                   READ_FROM_ITER, &start);
                                                   ^
>> net/core/datagram.c:689:5: error: implicit declaration of function 'page_put_unpin_sub' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                   page_put_unpin_sub(last_head, cleanup_mode, refs);
                                   ^
   net/core/datagram.c:696:4: error: implicit declaration of function 'page_put_unpin_sub' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           page_put_unpin_sub(last_head, cleanup_mode, refs);
                           ^
   12 warnings and 8 errors generated.


vim +/page_put_unpin_sub +689 net/core/datagram.c

   612	
   613	int __zerocopy_sg_from_iter(struct msghdr *msg, struct sock *sk,
   614				    struct sk_buff *skb, struct iov_iter *from,
   615				    size_t length)
   616	{
   617		unsigned int cleanup_mode = iov_iter_extract_will_pin(from) ? SKB_FRAG_PINNED : 0;
   618		int frag;
   619	
   620		if (msg && msg->msg_ubuf && msg->sg_from_iter)
   621			return msg->sg_from_iter(sk, skb, from, length);
   622	
   623		frag = skb_shinfo(skb)->nr_frags;
   624	
   625		while (length && iov_iter_count(from)) {
   626			struct page *head, *last_head = NULL;
   627			struct page *pages[MAX_SKB_FRAGS], **ppages = pages;
   628			int refs, order, n = 0;
   629			size_t start;
   630			ssize_t copied;
   631			unsigned long truesize;
   632	
   633			if (frag == MAX_SKB_FRAGS)
   634				return -EMSGSIZE;
   635	
   636			copied = iov_iter_extract_pages(from, &ppages, length,
   637							MAX_SKB_FRAGS - frag,
   638							READ_FROM_ITER, &start);
   639			if (copied < 0)
   640				return -EFAULT;
   641	
   642			length -= copied;
   643	
   644			truesize = PAGE_ALIGN(copied + start);
   645			skb->data_len += copied;
   646			skb->len += copied;
   647			skb->truesize += truesize;
   648			if (sk && sk->sk_type == SOCK_STREAM) {
   649				sk_wmem_queued_add(sk, truesize);
   650				if (!skb_zcopy_pure(skb))
   651					sk_mem_charge(sk, truesize);
   652			} else {
   653				refcount_add(truesize, &skb->sk->sk_wmem_alloc);
   654			}
   655	
   656			head = compound_head(pages[n]);
   657			order = compound_order(head);
   658	
   659			for (refs = 0; copied != 0; start = 0) {
   660				int size = min_t(int, copied, PAGE_SIZE - start);
   661	
   662				if (pages[n] - head > (1UL << order) - 1) {
   663					head = compound_head(pages[n]);
   664					order = compound_order(head);
   665				}
   666	
   667				start += (pages[n] - head) << PAGE_SHIFT;
   668				copied -= size;
   669				n++;
   670				if (frag) {
   671					skb_frag_t *last = &skb_shinfo(skb)->frags[frag - 1];
   672	
   673					if (head == skb_frag_page(last) &&
   674					    cleanup_mode == skb_frag_cleanup(last) &&
   675					    start == skb_frag_off(last) + skb_frag_size(last)) {
   676						skb_frag_size_add(last, size);
   677						/* We combined this page, we need to release
   678						 * a reference or a pin.  Since compound pages
   679						 * refcount is shared among many pages, batch
   680						 * the refcount adjustments to limit false
   681						 * sharing.
   682						 */
   683						last_head = head;
   684						refs++;
   685						continue;
   686					}
   687				}
   688				if (refs) {
 > 689					page_put_unpin_sub(last_head, cleanup_mode, refs);
   690					refs = 0;
   691				}
   692				skb_fill_page_desc_noacc(skb, frag++, head, start, size,
   693							 cleanup_mode);
   694			}
   695			if (refs)
   696				page_put_unpin_sub(last_head, cleanup_mode, refs);
   697		}
   698		return 0;
   699	}
   700	EXPORT_SYMBOL(__zerocopy_sg_from_iter);
   701	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

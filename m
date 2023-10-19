Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A6DDA6;
	Thu, 19 Oct 2023 13:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AiNUoXeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697722033; x=1729258033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7DF7vbTp51Vvi+2dJZngP2aeBjjWnnyYff3z00X0ayE=;
  b=AiNUoXeR8PZVftUDRWczoTb903wlC8j4dcXPjMS2sv22Ef4+Q24Y/NE8
   bo/p8UJ+UaykILcpQc0lSJWNg5fKRjPG8kEXDeUA02M+5+WykgM6IlrhF
   XYbm/tF8lqDlPD8Eq9lTp10n9nOY860zR2omsJdfGbfvQ4+rCXqkC6pjB
   0sNGFeg/M6YE4LNkuyBLD0HQIWSkXh89y08OEapUka+27ppk9q4+TM8w3
   5fv6BRQ7P6+XmD2S5HDlxzIMLNUTu6HxSEzAo3eLaN+YLYp4WhItb2Mkx
   JWqjpI0uXIRZDzggViJM+qv99aUEvb4n7U91etDQiWIfIm0kKxJltbUsh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417362242"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="417362242"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 06:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1088356965"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="1088356965"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Oct 2023 06:27:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtT3N-000290-1K;
	Thu, 19 Oct 2023 13:27:09 +0000
Date: Thu, 19 Oct 2023 21:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 5/7] tun: Support BPF_PROG_TYPE_VNET_HASH
Message-ID: <202310192157.RxEbw0oj-lkp@intel.com>
References: <20231015141644.260646-6-akihiko.odaki@daynix.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231015141644.260646-6-akihiko.odaki@daynix.com>

Hi Akihiko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master mst-vhost/linux-next linus/master v6.6-rc6]
[cannot apply to next-20231019]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akihiko-Odaki/bpf-Introduce-BPF_PROG_TYPE_VNET_HASH/20231017-132222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231015141644.260646-6-akihiko.odaki%40daynix.com
patch subject: [RFC PATCH v2 5/7] tun: Support BPF_PROG_TYPE_VNET_HASH
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231019/202310192157.RxEbw0oj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192157.RxEbw0oj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192157.RxEbw0oj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/tun.c:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/tun.c:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/tun.c:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
>> drivers/net/tun.c:564:10: error: call to undeclared function 'skb_ext_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     564 |                         ext = skb_ext_add(skb, SKB_EXT_TUN_VNET_HASH);
         |                               ^
>> drivers/net/tun.c:564:27: error: use of undeclared identifier 'SKB_EXT_TUN_VNET_HASH'
     564 |                         ext = skb_ext_add(skb, SKB_EXT_TUN_VNET_HASH);
         |                                                ^
>> drivers/net/tun.c:2152:18: error: call to undeclared function 'skb_ext_find'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2152 |                         vnet_hash_p = skb_ext_find(skb, SKB_EXT_TUN_VNET_HASH);
         |                                       ^
   drivers/net/tun.c:2152:36: error: use of undeclared identifier 'SKB_EXT_TUN_VNET_HASH'
    2152 |                         vnet_hash_p = skb_ext_find(skb, SKB_EXT_TUN_VNET_HASH);
         |                                                         ^
   12 warnings and 4 errors generated.


vim +/skb_ext_add +564 drivers/net/tun.c

   543	
   544	static u16 tun_ebpf_select_queue(struct tun_struct *tun, struct sk_buff *skb)
   545	{
   546		struct bpf_skb_vnet_hash_end *cb = (struct bpf_skb_vnet_hash_end *)skb->cb;
   547		struct tun_vnet_hash *ext;
   548		struct tun_prog *prog;
   549		u32 numqueues;
   550		u16 queue = 0;
   551	
   552		BUILD_BUG_ON(sizeof(*cb) > sizeof(skb->cb));
   553	
   554		numqueues = READ_ONCE(tun->numqueues);
   555		if (!numqueues)
   556			return 0;
   557	
   558		prog = rcu_dereference(tun->steering_prog);
   559		if (prog) {
   560			if (prog->prog->type == BPF_PROG_TYPE_VNET_HASH) {
   561				memset(skb->cb, 0, sizeof(*cb) - sizeof(struct qdisc_skb_cb));
   562				bpf_prog_run_clear_cb(prog->prog, skb);
   563	
 > 564				ext = skb_ext_add(skb, SKB_EXT_TUN_VNET_HASH);
   565				if (ext) {
   566					ext->value = cb->hash_value;
   567					ext->report = cb->hash_report;
   568				}
   569	
   570				queue = cb->rss_queue;
   571			} else {
   572				queue = bpf_prog_run_clear_cb(prog->prog, skb);
   573			}
   574		}
   575	
   576		return queue % numqueues;
   577	}
   578	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D304CED8;
	Sat, 11 Nov 2023 00:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXz+41gp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699661654; x=1731197654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tKQl3jn3dUKUqRNMqyKu8VIuNtCfx0A+RlzJAolY92o=;
  b=nXz+41gpGkSmxhOjVK4xydgQ7BcXVgk32lQ0eP0/popfIlr+YOtCYW39
   mszfziMv7x3Ha93YHyOSbwy3GM6Z07/sBD+JyMfPJ7hf2K5ZJjv4Piq5N
   H3NPTqJ5imrFmLDMwNs4jxp2LxFpTJDVeVzIdBPn5HbDn+HfDv33nuorE
   dJCCnCWgJEikPoOqeW0e0SPiFHr6xfFsnS5T8ngyEb41oy8MW/wjn4vqm
   EAoKRcNbNSZ4h7eQfLsDa2dbAFUvCfbLR44E3uGqUedgIJg6tnXq3fixN
   7SRZ17yLJ40YJi2spSqSAcSC02Qitcx/580EorpMWaro6XoTEh189GMFv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="380633661"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="380633661"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 16:14:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="11586444"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Nov 2023 16:14:13 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1bda-000A4K-1r;
	Sat, 11 Nov 2023 00:14:10 +0000
Date: Sat, 11 Nov 2023 08:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Nogueira <victor@mojatatu.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC v5 1/4] net/sched: act_mirred: Separate
 mirror and redirect into two distinct functions
Message-ID: <202311110834.bxpemlwC-lkp@intel.com>
References: <20231110214618.1883611-2-victor@mojatatu.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110214618.1883611-2-victor@mojatatu.com>

Hi Victor,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Victor-Nogueira/net-sched-act_mirred-Separate-mirror-and-redirect-into-two-distinct-functions/20231111-054809
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231110214618.1883611-2-victor%40mojatatu.com
patch subject: [PATCH net-next RFC v5 1/4] net/sched: act_mirred: Separate mirror and redirect into two distinct functions
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311110834.bxpemlwC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110834.bxpemlwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110834.bxpemlwC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/flow_dissector.c:3:
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
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from net/core/flow_dissector.c:3:
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
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from net/core/flow_dissector.c:3:
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
   In file included from net/core/flow_dissector.c:30:
   In file included from include/net/pkt_cls.h:8:
>> include/net/act_api.h:303:9: error: implicit declaration of function 'tcf_dev_queue_xmit' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   err = tcf_dev_queue_xmit(skb, dev_queue_xmit);
                         ^
   include/net/act_api.h:303:9: note: did you mean '__dev_queue_xmit'?
   include/linux/netdevice.h:3107:5: note: '__dev_queue_xmit' declared here
   int __dev_queue_xmit(struct sk_buff *skb, struct net_device *sb_dev);
       ^
   In file included from net/core/flow_dissector.c:30:
   In file included from include/net/pkt_cls.h:8:
   include/net/act_api.h:371:31: error: no member named 'tc_at_ingress' in 'struct sk_buff'
           skb_set_redirected(skb, skb->tc_at_ingress);
                                   ~~~  ^
   12 warnings and 2 errors generated.


vim +/tcf_dev_queue_xmit +303 include/net/act_api.h

   296	
   297	static inline int tcf_mirred_forward(bool to_ingress, bool nested_call,
   298					     struct sk_buff *skb)
   299	{
   300		int err;
   301	
   302		if (!to_ingress)
 > 303			err = tcf_dev_queue_xmit(skb, dev_queue_xmit);
   304		else if (nested_call)
   305			err = netif_rx(skb);
   306		else
   307			err = netif_receive_skb(skb);
   308	
   309		return err;
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

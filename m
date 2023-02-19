Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92BC23DA;
	Sun, 19 Feb 2023 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676818969; x=1708354969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GVqQ3RqeoOguPovESxLZbR8aeWgiWp8aQQIr9UOjWHI=;
  b=PPmens6nqAT4PlPCFGlhyAFedd7x46YiwE/xw0BE2Go6JaKvr1RMgDqL
   zZQZQrgcK3kDvVxYgqVtAdw29kQVLhKXORYuHV/KWC4pKd2B9ChaE20WL
   KaGkJrsk5RWht4dgeXVeaE8kYH0mBTWT2Wrp4ToN5tQqP/mgnYEtdVMqV
   8m0FsNUsFyf601kcBKWUFqisln1Csip+Y030vN57x6SuiEebDtgdZmeRf
   Xyfb9QGm5m1QiU12WG3AghD+6Sve1YsiHyjNHMTtSYAjRSsWgcv38fv7O
   UOi0auLb+jKsJgGjOtZAWXi7xv6F4txuazwWxSdj9OrySQgMvoCElvPiF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="394737511"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="394737511"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 07:02:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="794928803"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="794928803"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Feb 2023 07:02:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTlD4-000DLM-0M;
	Sun, 19 Feb 2023 15:02:38 +0000
Date: Sun, 19 Feb 2023 23:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v3] net/core: add optional threading for backlog processing
Message-ID: <202302192208.zNxGs6wR-lkp@intel.com>
References: <20230219131006.92681-1-nbd@nbd.name>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230219131006.92681-1-nbd@nbd.name>

Hi Felix,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]
[also build test WARNING on horms-ipvs/master linus/master v6.2-rc8]
[cannot apply to net/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Fietkau/net-core-add-optional-threading-for-backlog-processing/20230219-211100
patch link:    https://lore.kernel.org/r/20230219131006.92681-1-nbd%40nbd.name
patch subject: [RFC v3] net/core: add optional threading for backlog processing
config: hexagon-randconfig-r045-20230219 (https://download.01.org/0day-ci/archive/20230219/202302192208.zNxGs6wR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7912164b6828c63b948d6ff9d21599f6cecbf4fc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Felix-Fietkau/net-core-add-optional-threading-for-backlog-processing/20230219-211100
        git checkout 7912164b6828c63b948d6ff9d21599f6cecbf4fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302192208.zNxGs6wR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/dev.c:88:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from net/core/dev.c:88:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from net/core/dev.c:88:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> net/core/dev.c:5812:20: warning: variable 'process_queue_empty' is uninitialized when used here [-Wuninitialized]
                   flush_processq = process_queue_empty == sd->process_queue_empty;
                                    ^~~~~~~~~~~~~~~~~~~
   net/core/dev.c:5773:34: note: initialize the variable 'process_queue_empty' to silence this warning
           unsigned int process_queue_empty;
                                           ^
                                            = 0
   net/core/dev.c:5093:1: warning: unused function 'sch_handle_ingress' [-Wunused-function]
   sch_handle_ingress(struct sk_buff *skb, struct packet_type **pt_prev, int *ret,
   ^
   net/core/dev.c:5246:19: warning: unused function 'nf_ingress' [-Wunused-function]
   static inline int nf_ingress(struct sk_buff *skb, struct packet_type **pt_prev,
                     ^
   9 warnings generated.


vim +/process_queue_empty +5812 net/core/dev.c

  5769	
  5770	/* Network device is going away, flush any packets still pending */
  5771	static void flush_backlog(struct work_struct *work)
  5772	{
  5773		unsigned int process_queue_empty;
  5774		bool threaded, flush_processq;
  5775		struct sk_buff *skb, *tmp;
  5776		struct softnet_data *sd;
  5777	
  5778		local_bh_disable();
  5779		sd = this_cpu_ptr(&softnet_data);
  5780	
  5781		rps_lock_irq_disable(sd);
  5782		skb_queue_walk_safe(&sd->input_pkt_queue, skb, tmp) {
  5783			if (skb->dev->reg_state == NETREG_UNREGISTERING) {
  5784				__skb_unlink(skb, &sd->input_pkt_queue);
  5785				dev_kfree_skb_irq(skb);
  5786				input_queue_head_incr(sd);
  5787			}
  5788		}
  5789	
  5790		threaded = test_bit(NAPI_STATE_THREADED, &sd->backlog.state);
  5791		flush_processq = threaded &&
  5792				 !skb_queue_empty_lockless(&sd->process_queue);
  5793		rps_unlock_irq_enable(sd);
  5794	
  5795		if (threaded)
  5796			goto out;
  5797	
  5798		skb_queue_walk_safe(&sd->process_queue, skb, tmp) {
  5799			if (skb->dev->reg_state == NETREG_UNREGISTERING) {
  5800				__skb_unlink(skb, &sd->process_queue);
  5801				kfree_skb(skb);
  5802				input_queue_head_incr(sd);
  5803			}
  5804		}
  5805	
  5806	out:
  5807		local_bh_enable();
  5808	
  5809		while (flush_processq) {
  5810			msleep(1);
  5811			rps_lock_irq_disable(sd);
> 5812			flush_processq = process_queue_empty == sd->process_queue_empty;
  5813			rps_unlock_irq_enable(sd);
  5814		}
  5815	}
  5816	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

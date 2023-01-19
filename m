Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0962FA922;
	Thu, 19 Jan 2023 16:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674144724; x=1705680724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NsLpaKyJcTWOibQnC7VG8bOq2v1Vb5+vfiwmWU9lcG4=;
  b=Nnx7liCRqwg9Wd4eg4ep35C+fKpwYm+TcddAszazMpUWL/6LCCO/RYAe
   9pVT+k/vCofM7lx1nm5EFxT7UsPrJUUt6Mw0T10L+lsAZajF8P2kDcD0A
   j6XjQ7mmJo8Z+zzy9RhvPbmxwGSZoHNMrDRMwjazNGUQIJ/1lSf+rthtz
   /zODmavuSYefF/cMHUeCiOP71ltg9iPQBkgGPgIcS5/LRkhN3C6/JEz3l
   JQ2TYivld42Lg0aNoJ3HmdTNvRSftJLc7azN7IrSPvcPX7Jb9kykEXGuc
   L7C0pL/eC8hbfH5PybVyesKNUqpLbpiwAkiKJJ6kA04ORICzoyzk3gmux
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305004866"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="305004866"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 08:12:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="905569787"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="905569787"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jan 2023 08:11:59 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIXWA-0001c6-1G;
	Thu, 19 Jan 2023 16:11:58 +0000
Date: Fri, 20 Jan 2023 00:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Blakey <paulb@nvidia.com>, netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Oz Shlomo <ozsh@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
	Roi Dayan <roid@nvidia.com>, Vlad Buslov <vladbu@nvidia.com>
Subject: Re: [PATCH net-next v3 1/6] net/sched: cls_api: Support hardware
 miss to tc action
Message-ID: <202301192318.qKmZxlm0-lkp@intel.com>
References: <20230119082357.21744-2-paulb@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119082357.21744-2-paulb@nvidia.com>

Hi Paul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Blakey/net-sched-cls_api-Support-hardware-miss-to-tc-action/20230119-162743
patch link:    https://lore.kernel.org/r/20230119082357.21744-2-paulb%40nvidia.com
patch subject: [PATCH net-next v3 1/6] net/sched: cls_api: Support hardware miss to tc action
config: hexagon-randconfig-r045-20230119 (https://download.01.org/0day-ci/archive/20230119/202301192318.qKmZxlm0-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5c85cf394445e1140823351fdfdbf3e541b9abb9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Blakey/net-sched-cls_api-Support-hardware-miss-to-tc-action/20230119-162743
        git checkout 5c85cf394445e1140823351fdfdbf3e541b9abb9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from net/sched/cls_api.c:18:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from net/sched/cls_api.c:18:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from net/sched/cls_api.c:18:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
>> net/sched/cls_api.c:1676:4: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                           if (unlikely(!exts || n->exts != exts))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_api.c:1703:7: note: uninitialized use occurs here
                   if (err >= 0)
                       ^~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   net/sched/cls_api.c:1676:4: note: remove the 'if' if its condition is always true
                           if (unlikely(!exts || n->exts != exts))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sched/cls_api.c:1658:10: note: initialize the variable 'err' to silence this warning
                   int err;
                          ^
                           = 0
   net/sched/cls_api.c:3231:9: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
           return err;
                  ^~~
   net/sched/cls_api.c:3200:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   8 warnings generated.


vim +1676 net/sched/cls_api.c

  1635	
  1636	/* Main classifier routine: scans classifier chain attached
  1637	 * to this qdisc, (optionally) tests for protocol and asks
  1638	 * specific classifiers.
  1639	 */
  1640	static inline int __tcf_classify(struct sk_buff *skb,
  1641					 const struct tcf_proto *tp,
  1642					 const struct tcf_proto *orig_tp,
  1643					 struct tcf_result *res,
  1644					 bool compat_mode,
  1645					 struct tcf_exts_miss_cookie_node *n,
  1646					 int act_index,
  1647					 u32 *last_executed_chain)
  1648	{
  1649	#ifdef CONFIG_NET_CLS_ACT
  1650		const int max_reclassify_loop = 16;
  1651		const struct tcf_proto *first_tp;
  1652		int limit = 0;
  1653	
  1654	reclassify:
  1655	#endif
  1656		for (; tp; tp = rcu_dereference_bh(tp->next)) {
  1657			__be16 protocol = skb_protocol(skb, false);
  1658			int err;
  1659	
  1660			if (n) {
  1661				struct tcf_exts *exts;
  1662	
  1663				if (n->tp_prio != tp->prio)
  1664					continue;
  1665	
  1666				/* We re-lookup the tp and chain based on index instead
  1667				 * of having hard refs and locks to them, so do a sanity
  1668				 * check if any of tp,chain,exts was replaced by the
  1669				 * time we got here with a cookie from hardware.
  1670				 */
  1671				if (unlikely(n->tp != tp || n->tp->chain != n->chain ||
  1672					     !tp->ops->get_exts))
  1673					return TC_ACT_SHOT;
  1674	
  1675				exts = tp->ops->get_exts(tp, n->handle);
> 1676				if (unlikely(!exts || n->exts != exts))
  1677					return TC_ACT_SHOT;
  1678	
  1679				n = NULL;
  1680	#ifdef CONFIG_NET_CLS_ACT
  1681				err = tcf_action_exec(skb, exts->actions + act_index,
  1682						      exts->nr_actions - act_index,
  1683						      res);
  1684	#endif
  1685			} else {
  1686				if (tp->protocol != protocol &&
  1687				    tp->protocol != htons(ETH_P_ALL))
  1688					continue;
  1689	
  1690				err = tc_classify(skb, tp, res);
  1691			}
  1692	#ifdef CONFIG_NET_CLS_ACT
  1693			if (unlikely(err == TC_ACT_RECLASSIFY && !compat_mode)) {
  1694				first_tp = orig_tp;
  1695				*last_executed_chain = first_tp->chain->index;
  1696				goto reset;
  1697			} else if (unlikely(TC_ACT_EXT_CMP(err, TC_ACT_GOTO_CHAIN))) {
  1698				first_tp = res->goto_tp;
  1699				*last_executed_chain = err & TC_ACT_EXT_VAL_MASK;
  1700				goto reset;
  1701			}
  1702	#endif
  1703			if (err >= 0)
  1704				return err;
  1705		}
  1706	
  1707		if (unlikely(n))
  1708			return TC_ACT_SHOT;
  1709	
  1710		return TC_ACT_UNSPEC; /* signal: continue lookup */
  1711	#ifdef CONFIG_NET_CLS_ACT
  1712	reset:
  1713		if (unlikely(limit++ >= max_reclassify_loop)) {
  1714			net_notice_ratelimited("%u: reclassify loop, rule prio %u, protocol %02x\n",
  1715					       tp->chain->block->index,
  1716					       tp->prio & 0xffff,
  1717					       ntohs(tp->protocol));
  1718			return TC_ACT_SHOT;
  1719		}
  1720	
  1721		tp = first_tp;
  1722		goto reclassify;
  1723	#endif
  1724	}
  1725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E25D296;
	Thu, 12 Oct 2023 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3nbJVSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697092921; x=1728628921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vF0WG1Mj7+os4Om7QmhqGbhkCL+L4Yw401Jf1PqOjn8=;
  b=C3nbJVSoKW9+UP+IOdjaCFEWf1EXWo3H0oNTEnDjINgC+TqNzqdKY4Nb
   0Nvma1a9gEqxwo9RJVgRQ8hta80j5EH4YjIJSFq3NfJgnBO3Dd6TFtQDQ
   6O8PpOYDSwS9NZm2+eNyE0zc5xH6hnz8qNtdwe85JyqziRBdrJqIb6bec
   4qOx2kOTj+fSMX4GWUbJ/aTWtcj8dMiz0L34fiK4tXNT71ViWzFT91dvq
   dEivAJw/1xgqUmkxhE+JE76G+xKyzFEeVEyZcpXXrD0xsq8Pj4W/AJKsJ
   Rv2VL733pF4FnMSJBXoRMG2LGiO05dvf6C9hiWkWFqvP0uvmU/zj56YKb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471101443"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="471101443"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 23:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1085549662"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="1085549662"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Oct 2023 23:41:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqpON-0003HV-0l;
	Thu, 12 Oct 2023 06:41:55 +0000
Date: Thu, 12 Oct 2023 14:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Roesch <shr@devkernel.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:io_uring-napi 3/9] net/core/dev.c:6214:6: warning: no
 previous prototype for function '__napi_busy_loop'
Message-ID: <202310121423.ikhh9Eyf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-napi
head:   b57e2332bcb91e0740ce2a7cf47bcdb8870b571a
commit: 1f760c8312577ac66150b4c9163c4163a56ed971 [3/9] net: split off __napi_busy_poll from napi_busy_poll
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231012/202310121423.ikhh9Eyf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310121423.ikhh9Eyf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121423.ikhh9Eyf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/dev.c:88:
   In file included from include/linux/interrupt.h:11:
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
   In file included from net/core/dev.c:88:
   In file included from include/linux/interrupt.h:11:
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
   In file included from net/core/dev.c:88:
   In file included from include/linux/interrupt.h:11:
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
>> net/core/dev.c:6214:6: warning: no previous prototype for function '__napi_busy_loop' [-Wmissing-prototypes]
    6214 | void __napi_busy_loop(unsigned int napi_id,
         |      ^
   net/core/dev.c:6214:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    6214 | void __napi_busy_loop(unsigned int napi_id,
         | ^
         | static 
   net/core/dev.c:4075:1: warning: unused function 'sch_handle_ingress' [-Wunused-function]
    4075 | sch_handle_ingress(struct sk_buff *skb, struct packet_type **pt_prev, int *ret,
         | ^
   net/core/dev.c:4082:1: warning: unused function 'sch_handle_egress' [-Wunused-function]
    4082 | sch_handle_egress(struct sk_buff *skb, int *ret, struct net_device *dev)
         | ^
   net/core/dev.c:5292:19: warning: unused function 'nf_ingress' [-Wunused-function]
    5292 | static inline int nf_ingress(struct sk_buff *skb, struct packet_type **pt_prev,
         |                   ^
   16 warnings generated.


vim +/__napi_busy_loop +6214 net/core/dev.c

  6213	
> 6214	void __napi_busy_loop(unsigned int napi_id,
  6215			      bool (*loop_end)(void *, unsigned long),
  6216			      void *loop_end_arg, bool prefer_busy_poll, u16 budget,
  6217			      bool rcu)
  6218	{
  6219		unsigned long start_time = loop_end ? busy_loop_current_time() : 0;
  6220		int (*napi_poll)(struct napi_struct *napi, int budget);
  6221		void *have_poll_lock = NULL;
  6222		struct napi_struct *napi;
  6223	
  6224	restart:
  6225		napi_poll = NULL;
  6226	
  6227		if (!rcu)
  6228			rcu_read_lock();
  6229	
  6230		napi = napi_by_id(napi_id);
  6231		if (!napi)
  6232			goto out;
  6233	
  6234		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  6235			preempt_disable();
  6236		for (;;) {
  6237			int work = 0;
  6238	
  6239			local_bh_disable();
  6240			if (!napi_poll) {
  6241				unsigned long val = READ_ONCE(napi->state);
  6242	
  6243				/* If multiple threads are competing for this napi,
  6244				 * we avoid dirtying napi->state as much as we can.
  6245				 */
  6246				if (val & (NAPIF_STATE_DISABLE | NAPIF_STATE_SCHED |
  6247					   NAPIF_STATE_IN_BUSY_POLL)) {
  6248					if (prefer_busy_poll)
  6249						set_bit(NAPI_STATE_PREFER_BUSY_POLL, &napi->state);
  6250					goto count;
  6251				}
  6252				if (cmpxchg(&napi->state, val,
  6253					    val | NAPIF_STATE_IN_BUSY_POLL |
  6254						  NAPIF_STATE_SCHED) != val) {
  6255					if (prefer_busy_poll)
  6256						set_bit(NAPI_STATE_PREFER_BUSY_POLL, &napi->state);
  6257					goto count;
  6258				}
  6259				have_poll_lock = netpoll_poll_lock(napi);
  6260				napi_poll = napi->poll;
  6261			}
  6262			work = napi_poll(napi, budget);
  6263			trace_napi_poll(napi, work, budget);
  6264			gro_normal_list(napi);
  6265	count:
  6266			if (work > 0)
  6267				__NET_ADD_STATS(dev_net(napi->dev),
  6268						LINUX_MIB_BUSYPOLLRXPACKETS, work);
  6269			local_bh_enable();
  6270	
  6271			if (!loop_end || loop_end(loop_end_arg, start_time))
  6272				break;
  6273	
  6274			if (unlikely(need_resched())) {
  6275				if (rcu)
  6276					break;
  6277				if (napi_poll)
  6278					busy_poll_stop(napi, have_poll_lock, prefer_busy_poll, budget);
  6279				if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  6280					preempt_enable();
  6281				rcu_read_unlock();
  6282				cond_resched();
  6283				if (loop_end(loop_end_arg, start_time))
  6284					return;
  6285				goto restart;
  6286			}
  6287			cpu_relax();
  6288		}
  6289		if (napi_poll)
  6290			busy_poll_stop(napi, have_poll_lock, prefer_busy_poll, budget);
  6291		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  6292			preempt_enable();
  6293	out:
  6294		if (!rcu)
  6295			rcu_read_unlock();
  6296	}
  6297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

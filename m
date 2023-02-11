Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD83882F;
	Sat, 11 Feb 2023 20:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676147006; x=1707683006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WRDHWjCFbkXkleArgpuuSmjaJRp0vX7XUgfa2IcbRT0=;
  b=SqyI4yfL+U9pgroXE+DMeXHzQkaTOPcG+cbB/7e36I81XiblPXjlpHv6
   CtnsnuXLyk3ByVosO2uJfe15dBVNeWyShSpYVGdeG0HnRqo4Zhz9SHnq4
   TeH4kX0pDhVo1AM/uWOOUXy5mh1HbinEUxehETCAyktz24koQn2UzNUKL
   2n//GAqbYhc33ZG69JPwKE6HxA6b4rRe0BqgNvkzprBxt89G3EQRzIjdp
   4RwnyxP2AUoIlVqIQSAbft/I43BiyX373y+MlE8R19MY9ePDJfiC6MvT2
   /IFPjKGUPMtSstvdFFmNnJkNbJRATPzBaou15Jm3P6Mdk9oApT6Bph30U
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="331956868"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="331956868"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 12:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="913880546"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="913880546"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Feb 2023 12:23:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQwP5-0006mL-0l;
	Sat, 11 Feb 2023 20:23:23 +0000
Date: Sun, 12 Feb 2023 04:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.02.03a 73/92]
 net/netfilter/ipvs/ip_vs_est.c:552:3: error: use of undeclared identifier
 'kfree_rcu'; did you mean 'kfree_skb'?
Message-ID: <202302120458.J4M5Suy8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.02.03a
head:   077af4236f06a251931179a46f69d1815ceb4f97
commit: d904447bec170523e97e847d0dfb0d1033ab36da [73/92] rcu/kvfree: Eliminate k[v]free_rcu() single argument macro
config: hexagon-randconfig-r041-20230212 (https://download.01.org/0day-ci/archive/20230212/202302120458.J4M5Suy8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/d904447bec170523e97e847d0dfb0d1033ab36da
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2023.02.03a
        git checkout d904447bec170523e97e847d0dfb0d1033ab36da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/netfilter/ipvs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302120458.J4M5Suy8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/netfilter/ipvs/ip_vs_est.c:21:
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
   In file included from net/netfilter/ipvs/ip_vs_est.c:21:
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
   In file included from net/netfilter/ipvs/ip_vs_est.c:21:
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
>> net/netfilter/ipvs/ip_vs_est.c:552:15: error: too few arguments provided to function-like macro invocation
                   kfree_rcu(td);
                               ^
   include/linux/rcupdate.h:984:9: note: macro 'kfree_rcu' defined here
   #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
           ^
>> net/netfilter/ipvs/ip_vs_est.c:552:3: error: use of undeclared identifier 'kfree_rcu'; did you mean 'kfree_skb'?
                   kfree_rcu(td);
                   ^~~~~~~~~
                   kfree_skb
   include/linux/skbuff.h:1216:20: note: 'kfree_skb' declared here
   static inline void kfree_skb(struct sk_buff *skb)
                      ^
   net/netfilter/ipvs/ip_vs_est.c:552:3: warning: expression result unused [-Wunused-value]
                   kfree_rcu(td);
                   ^~~~~~~~~
   7 warnings and 2 errors generated.


vim +552 net/netfilter/ipvs/ip_vs_est.c

^1da177e4c3f41 net/ipv4/ipvs/ip_vs_est.c      Linus Torvalds    2005-04-16  518  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  519  /* Unlink estimator from chain */
0f34d54bf48892 net/netfilter/ipvs/ip_vs_est.c Eric W. Biederman 2015-09-21  520  void ip_vs_stop_estimator(struct netns_ipvs *ipvs, struct ip_vs_stats *stats)
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_est.c      Linus Torvalds    2005-04-16  521  {
3a14a313f9b406 net/ipv4/ipvs/ip_vs_est.c      Sven Wegener      2008-08-10  522  	struct ip_vs_estimator *est = &stats->est;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  523  	struct ip_vs_est_tick_data *td;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  524  	struct ip_vs_est_kt_data *kd;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  525  	int ktid = est->ktid;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  526  	int row = est->ktrow;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  527  	int cid = est->ktcid;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  528  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  529  	/* Failed to add to chain ? */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  530  	if (hlist_unhashed(&est->list))
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  531  		return;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  532  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  533  	/* On return, estimator can be freed, dequeue it now */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  534  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  535  	/* In est_temp_list ? */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  536  	if (ktid < 0) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  537  		hlist_del(&est->list);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  538  		goto end_kt0;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  539  	}
3a14a313f9b406 net/ipv4/ipvs/ip_vs_est.c      Sven Wegener      2008-08-10  540  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  541  	hlist_del_rcu(&est->list);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  542  	kd = ipvs->est_kt_arr[ktid];
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  543  	td = rcu_dereference_protected(kd->ticks[row], 1);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  544  	__clear_bit(cid, td->full);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  545  	td->chain_len[cid]--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  546  	if (!td->chain_len[cid])
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  547  		__clear_bit(cid, td->present);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  548  	kd->tick_len[row]--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  549  	__set_bit(row, kd->avail);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  550  	if (!kd->tick_len[row]) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  551  		RCU_INIT_POINTER(kd->ticks[row], NULL);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22 @552  		kfree_rcu(td);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  553  	}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  554  	kd->est_count--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  555  	if (kd->est_count) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  556  		/* This kt slot can become available just now, prefer it */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  557  		if (ktid < ipvs->est_add_ktid)
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  558  			ipvs->est_add_ktid = ktid;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  559  		return;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  560  	}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  561  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  562  	if (ktid > 0) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  563  		mutex_lock(&ipvs->est_mutex);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  564  		ip_vs_est_kthread_destroy(kd);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  565  		ipvs->est_kt_arr[ktid] = NULL;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  566  		if (ktid == ipvs->est_kt_count - 1) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  567  			ipvs->est_kt_count--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  568  			while (ipvs->est_kt_count > 1 &&
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  569  			       !ipvs->est_kt_arr[ipvs->est_kt_count - 1])
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  570  				ipvs->est_kt_count--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  571  		}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  572  		mutex_unlock(&ipvs->est_mutex);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  573  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  574  		/* This slot is now empty, prefer another available kt slot */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  575  		if (ktid == ipvs->est_add_ktid)
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  576  			ip_vs_est_update_ktid(ipvs);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  577  	}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  578  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  579  end_kt0:
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  580  	/* kt 0 is freed after all other kthreads and chains are empty */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  581  	if (ipvs->est_kt_count == 1 && hlist_empty(&ipvs->est_temp_list)) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  582  		kd = ipvs->est_kt_arr[0];
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  583  		if (!kd || !kd->est_count) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  584  			mutex_lock(&ipvs->est_mutex);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  585  			if (kd) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  586  				ip_vs_est_kthread_destroy(kd);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  587  				ipvs->est_kt_arr[0] = NULL;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  588  			}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  589  			ipvs->est_kt_count--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  590  			mutex_unlock(&ipvs->est_mutex);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  591  			ipvs->est_add_ktid = 0;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  592  		}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  593  	}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  594  }
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  595  

:::::: The code at line 552 was first introduced by commit
:::::: 705dd34440812735ece298eb5bc153fde9544d42 ipvs: use kthreads for stats estimation

:::::: TO: Julian Anastasov <ja@ssi.bg>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

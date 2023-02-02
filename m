Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C2610FD;
	Thu,  2 Feb 2023 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675329745; x=1706865745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fluxuGG63Hd2mszUMSWlB0368qULtZRFaaksGOjIBNk=;
  b=grgGmfM60SSefu1c8AejRVrClcVQlq2WCRhIk0MtcNmtN17/xyjdfZJ8
   MZxyaSwMTK3Pm5cDtr9zRCb894PmdByTByPNv4cnXI4fk0CBkHfy441M4
   SizAYdnOCJpQnoZVmVfXh+aVt8WjYgoHQjVtZ0rpxHfQzx/pmTHbJGdUi
   3xreAPZIhkDXMWd9nHl/Q5zVdHeQHd8SCccZQTPeT0vATOXb2MKvJ/rgI
   HnpMM0YlsaP4Oyoi07FwVYwf3hcLy0LUWai5Kuk7cEdKONbdZpekXPIAx
   M5jIpwJ0w1lS6ZqU6CfKoROMgJ30K8Oiv+OQzI4RYdFvyb6KiWebok6UA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="392981936"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="392981936"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 01:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="910685092"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="910685092"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Feb 2023 01:22:22 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNVnR-0006NP-2k;
	Thu, 02 Feb 2023 09:22:21 +0000
Date: Thu, 2 Feb 2023 17:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev 80/81]
 net/netfilter/ipvs/ip_vs_est.c:552:3: error: use of undeclared identifier
 'kfree_rcu'; did you mean 'kfree_skb'?
Message-ID: <202302021724.SF7KLCrw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev
head:   bed78d51a1d4688db327b39d21309eee476e562e
commit: 1c6d306af363befca676f61d10bb8e11701e9176 [80/81] rcu/kvfree: Eliminate k[v]free_rcu() single argument macro
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230202/202302021724.SF7KLCrw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/1c6d306af363befca676f61d10bb8e11701e9176
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev
        git checkout 1c6d306af363befca676f61d10bb8e11701e9176
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/netfilter/ipvs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

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
>> net/netfilter/ipvs/ip_vs_est.c:552:3: warning: expression result unused [-Wunused-value]
                   kfree_rcu(td);
                   ^~~~~~~~~
   1 warning and 2 errors generated.


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

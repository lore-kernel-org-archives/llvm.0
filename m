Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594CE1BDCA;
	Wed,  3 Jan 2024 18:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbvBzzKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704306950; x=1735842950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gb+3J5yYCe0XIwRIh1RUMwek4B2SGFnQ6F/zFPpNpN0=;
  b=KbvBzzKFCDNXXb1rS+t7diQSm2PuIF55aeQ4TLpFP/YzblriWTLHVLR0
   4uB8xfbrH9bfu6umQxIbcikReKgXGC/7neZguumM3bZA4HBkbFqaMXHmW
   dbbxSA00MEmeaYgWucxR649GJLEmMb9cGBaMu4S57fTk+gIX3JrDpsa5F
   cIN0adKQSG9shgI8C3haDUrflaUSU9d/d65JZauX0Zvybj1MY8LAIF67R
   7eoiST4NtgBVBDFMaTG+RGp6Yl0+QorXbekq1DnxdBCzmiZzmYyni0/zY
   Lu9ehbifzIGd5PwU7PIMLanr95upiFddNeNAr3vP8WYWE6F+aTS0EaFW4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="15684850"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="15684850"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 10:35:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="21855067"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Jan 2024 10:35:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL65g-000MS4-2E;
	Wed, 03 Jan 2024 18:35:44 +0000
Date: Thu, 4 Jan 2024 02:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Chan <michael.chan@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vasundhara Volam <vasundhara-v.volam@broadcom.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>
Subject: [linux-next:master 11916/12223]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:14028:9: error: call to undeclared
 function 'rps_may_expire_flow'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202401040200.5tvkIIgP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fef202ac2f8e6d9ad21aead648278f1226b9053
commit: 59cde76f33fa4ae5cdc7f51ce87bab9e531ca183 [11916/12223] bnxt_en: Refactor filter insertion logic in bnxt_rx_flow_steer().
config: arm-randconfig-002-20240103 (https://download.01.org/0day-ci/archive/20240104/202401040200.5tvkIIgP-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040200.5tvkIIgP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040200.5tvkIIgP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:14028:9: error: call to undeclared function 'rps_may_expire_flow'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                                   if (rps_may_expire_flow(bp->dev, fltr->base.rxq,
                                       ^
   1 error generated.


vim +/rps_may_expire_flow +14028 drivers/net/ethernet/broadcom/bnxt/bnxt.c

c0c050c58d8409 Michael Chan   2015-10-22  14012  
c0c050c58d8409 Michael Chan   2015-10-22  14013  static void bnxt_cfg_ntp_filters(struct bnxt *bp)
c0c050c58d8409 Michael Chan   2015-10-22  14014  {
c0c050c58d8409 Michael Chan   2015-10-22  14015  	int i;
c0c050c58d8409 Michael Chan   2015-10-22  14016  
c0c050c58d8409 Michael Chan   2015-10-22  14017  	for (i = 0; i < BNXT_NTP_FLTR_HASH_SIZE; i++) {
c0c050c58d8409 Michael Chan   2015-10-22  14018  		struct hlist_head *head;
c0c050c58d8409 Michael Chan   2015-10-22  14019  		struct hlist_node *tmp;
c0c050c58d8409 Michael Chan   2015-10-22  14020  		struct bnxt_ntuple_filter *fltr;
c0c050c58d8409 Michael Chan   2015-10-22  14021  		int rc;
c0c050c58d8409 Michael Chan   2015-10-22  14022  
c0c050c58d8409 Michael Chan   2015-10-22  14023  		head = &bp->ntp_fltr_hash_tbl[i];
992d38d2b988a7 Michael Chan   2023-12-22  14024  		hlist_for_each_entry_safe(fltr, tmp, head, base.hash) {
c0c050c58d8409 Michael Chan   2015-10-22  14025  			bool del = false;
c0c050c58d8409 Michael Chan   2015-10-22  14026  
992d38d2b988a7 Michael Chan   2023-12-22  14027  			if (test_bit(BNXT_FLTR_VALID, &fltr->base.state)) {
992d38d2b988a7 Michael Chan   2023-12-22 @14028  				if (rps_may_expire_flow(bp->dev, fltr->base.rxq,
c0c050c58d8409 Michael Chan   2015-10-22  14029  							fltr->flow_id,
992d38d2b988a7 Michael Chan   2023-12-22  14030  							fltr->base.sw_id)) {
c0c050c58d8409 Michael Chan   2015-10-22  14031  					bnxt_hwrm_cfa_ntuple_filter_free(bp,
c0c050c58d8409 Michael Chan   2015-10-22  14032  									 fltr);
c0c050c58d8409 Michael Chan   2015-10-22  14033  					del = true;
c0c050c58d8409 Michael Chan   2015-10-22  14034  				}
c0c050c58d8409 Michael Chan   2015-10-22  14035  			} else {
c0c050c58d8409 Michael Chan   2015-10-22  14036  				rc = bnxt_hwrm_cfa_ntuple_filter_alloc(bp,
c0c050c58d8409 Michael Chan   2015-10-22  14037  								       fltr);
c0c050c58d8409 Michael Chan   2015-10-22  14038  				if (rc)
c0c050c58d8409 Michael Chan   2015-10-22  14039  					del = true;
c0c050c58d8409 Michael Chan   2015-10-22  14040  				else
992d38d2b988a7 Michael Chan   2023-12-22  14041  					set_bit(BNXT_FLTR_VALID, &fltr->base.state);
c0c050c58d8409 Michael Chan   2015-10-22  14042  			}
c0c050c58d8409 Michael Chan   2015-10-22  14043  
c0c050c58d8409 Michael Chan   2015-10-22  14044  			if (del) {
c0c050c58d8409 Michael Chan   2015-10-22  14045  				spin_lock_bh(&bp->ntp_fltr_lock);
ee908d05dd2acd Michael Chan   2023-12-22  14046  				if (!test_and_clear_bit(BNXT_FLTR_INSERTED, &fltr->base.state)) {
ee908d05dd2acd Michael Chan   2023-12-22  14047  					spin_unlock_bh(&bp->ntp_fltr_lock);
ee908d05dd2acd Michael Chan   2023-12-22  14048  					continue;
ee908d05dd2acd Michael Chan   2023-12-22  14049  				}
992d38d2b988a7 Michael Chan   2023-12-22  14050  				hlist_del_rcu(&fltr->base.hash);
c0c050c58d8409 Michael Chan   2015-10-22  14051  				bp->ntp_fltr_count--;
c0c050c58d8409 Michael Chan   2015-10-22  14052  				spin_unlock_bh(&bp->ntp_fltr_lock);
bfeabf7e4615bf Michael Chan   2023-12-22  14053  				bnxt_del_l2_filter(bp, fltr->l2_fltr);
c0c050c58d8409 Michael Chan   2015-10-22  14054  				synchronize_rcu();
992d38d2b988a7 Michael Chan   2023-12-22  14055  				clear_bit(fltr->base.sw_id, bp->ntp_fltr_bmap);
c0c050c58d8409 Michael Chan   2015-10-22  14056  				kfree(fltr);
c0c050c58d8409 Michael Chan   2015-10-22  14057  			}
c0c050c58d8409 Michael Chan   2015-10-22  14058  		}
c0c050c58d8409 Michael Chan   2015-10-22  14059  	}
19241368443ff9 Jeffrey Huang  2016-02-26  14060  	if (test_and_clear_bit(BNXT_HWRM_PF_UNLOAD_SP_EVENT, &bp->sp_event))
9a005c3898aa07 Jonathan Lemon 2020-02-24  14061  		netdev_info(bp->dev, "Receive PF driver unload event!\n");
c0c050c58d8409 Michael Chan   2015-10-22  14062  }
c0c050c58d8409 Michael Chan   2015-10-22  14063  

:::::: The code at line 14028 was first introduced by commit
:::::: 992d38d2b988a7d71c2416dad9af2b769f51ac25 bnxt_en: Refactor bnxt_ntuple_filter structure.

:::::: TO: Michael Chan <michael.chan@broadcom.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7095F236A70;
	Wed, 26 Feb 2025 19:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740596909; cv=none; b=PfScT0QQvMVRjIHCZzFtXkOObXIU0vfjmXVkRUnPgutmv5gr0xAC4tiCZjL4WBtW5zy9+9yKuj0gb3usj3yGi6xBzFL/bXk76IwlTT3OUZRDPc6TNmjiQ0yP3gbZ7haseZqPG+A6BtLXwa4Ph1dvUS4CktLnVzbIxx+LjTLk7ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740596909; c=relaxed/simple;
	bh=Co4c9pWDt+v4eqGeNst1wVe4Wg3aJ7XoE0K0jU8NNAQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9TX0zBsX6kPXNGciGxHb9ehR28lh0EEiTe28XQXwa0QoWMv0B8yv1yaaTmKsThPQ5iFxP/K1bdCoRoftR2YsA4T0wpxbPL6LunZ2Nxlh41N4vH/uTF4j0GZVpsjv7q27M3OI5LjhxBgVKM3ZuPFLqVFxTUjTOwFlvpJmOXFvgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InLsR5dq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InLsR5dq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740596907; x=1772132907;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Co4c9pWDt+v4eqGeNst1wVe4Wg3aJ7XoE0K0jU8NNAQ=;
  b=InLsR5dqz9g+EkGqfx8QrXtlAy7o55rf2NkttzJA1byZmDOnqGG6/qM+
   uFwdXu0yy/H9o476mZlMuqH8jGGIK6rm6+Opz3RfYZlUJsr8V+JmauiS/
   0RsAV1ToiRnh3MHlLl/mZ50ytc9uXe1eJQKgqCDpoBDBsxfniFEN1tFXl
   ybTS7H04SX+FV3AN1CqaI9t6wFTlxBGbkL8d123+ib+jmBpaAlzJZRwjK
   7w5O39TT9C5JC7geFpxHlNA08I1gNMHCWo1tfKs9HjPNeKLCaAPnwUeZo
   TyEq8ST6W/My0DZn+1mu7IubKZ4MBuFFQ3BZoZf/bgKpDopOILmDs3iGo
   w==;
X-CSE-ConnectionGUID: VCexmewjScqxelLncARa1A==
X-CSE-MsgGUID: tt35y37jTxie323VBKyWEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="29062595"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="29062595"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 11:08:27 -0800
X-CSE-ConnectionGUID: 8/h662g3T7aUuZWAa+kMcA==
X-CSE-MsgGUID: cuCnST8YS3OwTrLl9/CxwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122053785"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Feb 2025 11:08:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnMlU-000CHa-2d;
	Wed, 26 Feb 2025 19:08:18 +0000
Date: Thu, 27 Feb 2025 03:07:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/net/ethernet/pensando/ionic/ionic_lif.c:846:34: warning:
 bitwise operation between different enumeration types ('enum
 ionic_q_feature' and 'enum ionic_txq_feature')
Message-ID: <202502270336.Jl5gbloE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Shannon Nelson <snelson@pensando.io>
CC: Allen Hubbe <allenbh@pensando.io>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7
commit: f0790bcd36063f2850301982f167128139a51f62 ionic: set up hw timestamp queues
date:   3 years, 11 months ago
config: x86_64-buildonly-randconfig-004-20241224 (https://download.01.org/0day-ci/archive/20250227/202502270336.Jl5gbloE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270336.Jl5gbloE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270336.Jl5gbloE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/pensando/ionic/ionic_lif.c:4:
   In file included from include/linux/ethtool.h:18:
   In file included from include/uapi/linux/ethtool.h:19:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:14:
   In file included from include/linux/mm.h:1557:
   include/linux/vmstat.h:423:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     423 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     424 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:430:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     430 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     431 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:437:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     437 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:442:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     442 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     443 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/pensando/ionic/ionic_lif.c:15:
   In file included from drivers/net/ethernet/pensando/ionic/ionic.h:11:
   In file included from drivers/net/ethernet/pensando/ionic/ionic_devlink.h:7:
   include/net/devlink.h:28:19: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      28 |         u32 reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:29:26: warning: arithmetic between different enumeration types ('enum devlink_reload_limit' and 'enum devlink_reload_action') [-Wenum-enum-conversion]
      29 |         u32 remote_reload_stats[DEVLINK_RELOAD_STATS_ARRAY_SIZE];
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/devlink.h:25:30: note: expanded from macro 'DEVLINK_RELOAD_STATS_ARRAY_SIZE'
      25 |         (__DEVLINK_RELOAD_LIMIT_MAX * __DEVLINK_RELOAD_ACTION_MAX)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/pensando/ionic/ionic_lif.c:846:34: warning: bitwise operation between different enumeration types ('enum ionic_q_feature' and 'enum ionic_txq_feature') [-Wenum-enum-conversion]
     846 |         features = IONIC_Q_F_2X_CQ_DESC | IONIC_TXQ_F_HWSTAMP;
         |                    ~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/pensando/ionic/ionic_lif.c:916:34: warning: bitwise operation between different enumeration types ('enum ionic_q_feature' and 'enum ionic_rxq_feature') [-Wenum-enum-conversion]
     916 |         features = IONIC_Q_F_2X_CQ_DESC | IONIC_RXQ_F_HWSTAMP;
         |                    ~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/pensando/ionic/ionic_lif.c:976:46: warning: bitwise operation between different enumeration types ('enum ionic_q_feature' and 'enum ionic_rxq_feature') [-Wenum-enum-conversion]
     976 |                 qparam.rxq_features = IONIC_Q_F_2X_CQ_DESC | IONIC_RXQ_F_HWSTAMP;
         |                                       ~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   9 warnings generated.


vim +846 drivers/net/ethernet/pensando/ionic/ionic_lif.c

   832	
   833	int ionic_lif_create_hwstamp_txq(struct ionic_lif *lif)
   834	{
   835		unsigned int num_desc, desc_sz, comp_sz, sg_desc_sz;
   836		unsigned int txq_i, flags;
   837		struct ionic_qcq *txq;
   838		u64 features;
   839		int err;
   840	
   841		mutex_lock(&lif->queue_lock);
   842	
   843		if (lif->hwstamp_txq)
   844			goto out;
   845	
 > 846		features = IONIC_Q_F_2X_CQ_DESC | IONIC_TXQ_F_HWSTAMP;
   847	
   848		num_desc = IONIC_MIN_TXRX_DESC;
   849		desc_sz = sizeof(struct ionic_txq_desc);
   850		comp_sz = 2 * sizeof(struct ionic_txq_comp);
   851	
   852		if (lif->qtype_info[IONIC_QTYPE_TXQ].version >= 1 &&
   853		    lif->qtype_info[IONIC_QTYPE_TXQ].sg_desc_sz == sizeof(struct ionic_txq_sg_desc_v1))
   854			sg_desc_sz = sizeof(struct ionic_txq_sg_desc_v1);
   855		else
   856			sg_desc_sz = sizeof(struct ionic_txq_sg_desc);
   857	
   858		txq_i = lif->ionic->ntxqs_per_lif;
   859		flags = IONIC_QCQ_F_TX_STATS | IONIC_QCQ_F_SG;
   860	
   861		err = ionic_qcq_alloc(lif, IONIC_QTYPE_TXQ, txq_i, "hwstamp_tx", flags,
   862				      num_desc, desc_sz, comp_sz, sg_desc_sz,
   863				      lif->kern_pid, &txq);
   864		if (err)
   865			goto err_qcq_alloc;
   866	
   867		txq->q.features = features;
   868	
   869		ionic_link_qcq_interrupts(lif->adminqcq, txq);
   870		ionic_debugfs_add_qcq(lif, txq);
   871	
   872		lif->hwstamp_txq = txq;
   873	
   874		if (netif_running(lif->netdev)) {
   875			err = ionic_lif_txq_init(lif, txq);
   876			if (err)
   877				goto err_qcq_init;
   878	
   879			if (test_bit(IONIC_LIF_F_UP, lif->state)) {
   880				err = ionic_qcq_enable(txq);
   881				if (err)
   882					goto err_qcq_enable;
   883			}
   884		}
   885	
   886	out:
   887		mutex_unlock(&lif->queue_lock);
   888	
   889		return 0;
   890	
   891	err_qcq_enable:
   892		ionic_lif_qcq_deinit(lif, txq);
   893	err_qcq_init:
   894		lif->hwstamp_txq = NULL;
   895		ionic_debugfs_del_qcq(txq);
   896		ionic_qcq_free(lif, txq);
   897		devm_kfree(lif->ionic->dev, txq);
   898	err_qcq_alloc:
   899		mutex_unlock(&lif->queue_lock);
   900		return err;
   901	}
   902	
   903	int ionic_lif_create_hwstamp_rxq(struct ionic_lif *lif)
   904	{
   905		unsigned int num_desc, desc_sz, comp_sz, sg_desc_sz;
   906		unsigned int rxq_i, flags;
   907		struct ionic_qcq *rxq;
   908		u64 features;
   909		int err;
   910	
   911		mutex_lock(&lif->queue_lock);
   912	
   913		if (lif->hwstamp_rxq)
   914			goto out;
   915	
 > 916		features = IONIC_Q_F_2X_CQ_DESC | IONIC_RXQ_F_HWSTAMP;
   917	
   918		num_desc = IONIC_MIN_TXRX_DESC;
   919		desc_sz = sizeof(struct ionic_rxq_desc);
   920		comp_sz = 2 * sizeof(struct ionic_rxq_comp);
   921		sg_desc_sz = sizeof(struct ionic_rxq_sg_desc);
   922	
   923		rxq_i = lif->ionic->nrxqs_per_lif;
   924		flags = IONIC_QCQ_F_RX_STATS | IONIC_QCQ_F_SG;
   925	
   926		err = ionic_qcq_alloc(lif, IONIC_QTYPE_RXQ, rxq_i, "hwstamp_rx", flags,
   927				      num_desc, desc_sz, comp_sz, sg_desc_sz,
   928				      lif->kern_pid, &rxq);
   929		if (err)
   930			goto err_qcq_alloc;
   931	
   932		rxq->q.features = features;
   933	
   934		ionic_link_qcq_interrupts(lif->adminqcq, rxq);
   935		ionic_debugfs_add_qcq(lif, rxq);
   936	
   937		lif->hwstamp_rxq = rxq;
   938	
   939		if (netif_running(lif->netdev)) {
   940			err = ionic_lif_rxq_init(lif, rxq);
   941			if (err)
   942				goto err_qcq_init;
   943	
   944			if (test_bit(IONIC_LIF_F_UP, lif->state)) {
   945				ionic_rx_fill(&rxq->q);
   946				err = ionic_qcq_enable(rxq);
   947				if (err)
   948					goto err_qcq_enable;
   949			}
   950		}
   951	
   952	out:
   953		mutex_unlock(&lif->queue_lock);
   954	
   955		return 0;
   956	
   957	err_qcq_enable:
   958		ionic_lif_qcq_deinit(lif, rxq);
   959	err_qcq_init:
   960		lif->hwstamp_rxq = NULL;
   961		ionic_debugfs_del_qcq(rxq);
   962		ionic_qcq_free(lif, rxq);
   963		devm_kfree(lif->ionic->dev, rxq);
   964	err_qcq_alloc:
   965		mutex_unlock(&lif->queue_lock);
   966		return err;
   967	}
   968	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

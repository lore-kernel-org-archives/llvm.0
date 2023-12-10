Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CCD4439;
	Sun, 10 Dec 2023 07:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJi2KsWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702192116; x=1733728116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYTjsV6+Q+/EF0upSPF3C6aw6yGNhUxSvQtWUkU0Y+Y=;
  b=kJi2KsWeSjWAKrf/S9sKhu825NWr+EhIauHLXNcS24yJ5Iz50vvKiSRU
   Dtr2gMgjr5u4W0IrHEJ8DJ2Pbsuf0oTegVDvtivGTYYE+2gNQJl4RhTyc
   UYgZlLKXHcHjasu+N0uNU9vz32xPoktIekYD0RYKOolhemChApkGda4Va
   iM31lBKmPVajyRcSgmxZ41TSc2yK88zLk8awnZHSxmWCKklPfEg2CNiMe
   aMCeudr6oEO3uA33D/ll21yyHLR3s833nP/QqkYyNksWzqvq8VMhA0tre
   WoUJDiJ7W8/Wf9yKTB1/RvbVRRLbF5HE9DMbfX0XzI8iIOSqi/jpcrivL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="480733358"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="480733358"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 23:08:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="806872744"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="806872744"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 09 Dec 2023 23:08:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCDvS-000GVt-2k;
	Sun, 10 Dec 2023 07:08:30 +0000
Date: Sun, 10 Dec 2023 15:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sujuan Chen <sujuan.chen@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Rex Lu <rex.lu@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [nbd168-wireless:mt76 58/62]
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c:947:35: warning: shift count
 >= width of type
Message-ID: <202312101547.cVbg56lN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   0318b308805ea665679297c3f24b243c1b39b292
commit: 6a871112fab64e1ef3e8eb6487cf53167d9f962f [58/62] wifi: mt76: mt7996: set DMA mask to 36 bits for boards with more than 4GB of RAM
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231210/202312101547.cVbg56lN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312101547.cVbg56lN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312101547.cVbg56lN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7996/mac.c:947:35: warning: shift count >= width of type [-Wshift-count-overflow]
                                        tx_info->buf[i + 1].addr >> 32);
                                                                 ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:68:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7996/mac.c:947:35: warning: shift count >= width of type [-Wshift-count-overflow]
                                        tx_info->buf[i + 1].addr >> 32);
                                                                 ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:69:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7996/mac.c:947:35: warning: shift count >= width of type [-Wshift-count-overflow]
                                        tx_info->buf[i + 1].addr >> 32);
                                                                 ^  ~~
   include/linux/bitfield.h:115:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
   3 warnings generated.


vim +947 drivers/net/wireless/mediatek/mt76/mt7996/mac.c

   909	
   910	int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
   911				  enum mt76_txq_id qid, struct mt76_wcid *wcid,
   912				  struct ieee80211_sta *sta,
   913				  struct mt76_tx_info *tx_info)
   914	{
   915		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)tx_info->skb->data;
   916		struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
   917		struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
   918		struct ieee80211_key_conf *key = info->control.hw_key;
   919		struct ieee80211_vif *vif = info->control.vif;
   920		struct mt76_connac_txp_common *txp;
   921		struct mt76_txwi_cache *t;
   922		int id, i, pid, nbuf = tx_info->nbuf - 1;
   923		bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
   924		u8 *txwi = (u8 *)txwi_ptr;
   925	
   926		if (unlikely(tx_info->skb->len <= ETH_HLEN))
   927			return -EINVAL;
   928	
   929		if (!wcid)
   930			wcid = &dev->mt76.global_wcid;
   931	
   932		t = (struct mt76_txwi_cache *)(txwi + mdev->drv->txwi_size);
   933		t->skb = tx_info->skb;
   934	
   935		id = mt76_token_consume(mdev, &t);
   936		if (id < 0)
   937			return id;
   938	
   939		pid = mt76_tx_status_skb_add(mdev, wcid, tx_info->skb);
   940		mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
   941				      pid, qid, 0);
   942	
   943		txp = (struct mt76_connac_txp_common *)(txwi + MT_TXD_SIZE);
   944		for (i = 0; i < nbuf; i++) {
   945			u16 len = FIELD_PREP(MT_TXP_BUF_LEN, tx_info->buf[i + 1].len) |
   946				  FIELD_PREP(MT_TXP_DMA_ADDR_H,
 > 947					     tx_info->buf[i + 1].addr >> 32);
   948	
   949			txp->fw.buf[i] = cpu_to_le32(tx_info->buf[i + 1].addr);
   950			txp->fw.len[i] = cpu_to_le16(len);
   951		}
   952		txp->fw.nbuf = nbuf;
   953	
   954		txp->fw.flags =
   955			cpu_to_le16(MT_CT_INFO_FROM_HOST | MT_CT_INFO_APPLY_TXD);
   956	
   957		if (!key)
   958			txp->fw.flags |= cpu_to_le16(MT_CT_INFO_NONE_CIPHER_FRAME);
   959	
   960		if (!is_8023 && ieee80211_is_mgmt(hdr->frame_control))
   961			txp->fw.flags |= cpu_to_le16(MT_CT_INFO_MGMT_FRAME);
   962	
   963		if (vif) {
   964			struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
   965	
   966			txp->fw.bss_idx = mvif->mt76.idx;
   967		}
   968	
   969		txp->fw.token = cpu_to_le16(id);
   970		txp->fw.rept_wds_wcid = cpu_to_le16(sta ? wcid->idx : 0xfff);
   971	
   972		tx_info->skb = NULL;
   973	
   974		/* pass partial skb header to fw */
   975		tx_info->buf[1].len = MT_CT_PARSE_LEN;
   976		tx_info->buf[1].skip_unmap = true;
   977		tx_info->nbuf = MT_CT_DMA_BUF_NUM;
   978	
   979		return 0;
   980	}
   981	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

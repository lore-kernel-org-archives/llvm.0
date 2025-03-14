Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981C21F4734;
	Fri, 14 Mar 2025 23:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995386; cv=none; b=FGmxRX8JfUYp0uur4Kbl0l7fZKRWqr5MbIMFqtnrSPZT1dt/1ZPG7IVS+718N4p/r++1gnYgiKLOngZq5hcmA/Qyqk9kuIWdG5/8Y0P/4yHDYRQLZXgJf+C5KK6oOBaaiersz0h+FBHc6f30Acd7xKW23YMYJuQpotzsH7FUwjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995386; c=relaxed/simple;
	bh=Eo1x/kSOf+VHZG5TPdM9C4ReXwjPRNHMDcf53xeQ2bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5T4is6pXK14VRNziUAh0bkDMzABNaToPUN277WCw/7XXg5wZU3VPerYeNTpPHBGiQnq4VTR56RJq4vCiQXYmLqpqVSJBVIMjuB0CoRORbweZDDXoZ1V+apHUSzkeI0H/yz9/0Y7chp2U911obeTfBWv0C6Mtj0B6BoCMAgjyg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9Prf/YS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9Prf/YS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741995385; x=1773531385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Eo1x/kSOf+VHZG5TPdM9C4ReXwjPRNHMDcf53xeQ2bQ=;
  b=Q9Prf/YSrkNOYvne9QsJoywap8itlnYAl3KA9YRfn//lXYS8ZmEZtFqo
   c3GWkk8cEwHKvta0kgxCMCcsN0fllQky2o9sXuwPsLZzZA5qD807luHAf
   X2c7IeNyhyX7X5oIUb8ONcXFXWEQ+6vIckUS6UnKigyoD2ad6HxCaOycY
   vVux7IFQG4A0iOjwZk7HUFCpZnn9WX+TMwS9QuFiV3LtHzaWyNAUJqZJ1
   cWW59NttmPF+XtLnvl8FyV0c6PadkdsYbMqp/fILwieYBqbB5lvzec9Kp
   xc9iklpfQ9GHyzbcmdbhb0gsdl75zQNGZEIvRUmj3RA26ityTFmnPK7rs
   A==;
X-CSE-ConnectionGUID: 4vkGSVH0QJKZaWSmtBqlwQ==
X-CSE-MsgGUID: AT+GSAagQpSp76BwCFY0CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43339497"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43339497"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 16:36:25 -0700
X-CSE-ConnectionGUID: /phpn2+/TMer3k8oVOlvlw==
X-CSE-MsgGUID: 8fjGFmchTjOxRYnP9JY0Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121917549"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 14 Mar 2025 16:36:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttEZg-000Avf-2a;
	Fri, 14 Mar 2025 23:36:20 +0000
Date: Sat, 15 Mar 2025 07:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 7/8] wifi: mt76: mt7996: implement driver specific
 get_txpower function
Message-ID: <202503150720.LmGJxnXX-lkp@intel.com>
References: <20250311103646.43346-7-nbd@nbd.name>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311103646.43346-7-nbd@nbd.name>

Hi Felix,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.14-rc6 next-20250314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Fietkau/wifi-mt76-mt7996-fix-SER-reset-trigger-on-WED-reset/20250311-184157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250311103646.43346-7-nbd%40nbd.name
patch subject: [PATCH 7/8] wifi: mt76: mt7996: implement driver specific get_txpower function
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250315/202503150720.LmGJxnXX-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503150720.LmGJxnXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503150720.LmGJxnXX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76/mt7996/main.c:6:
   In file included from drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:11:
   In file included from drivers/net/wireless/mediatek/mt76/mt7996/../mt76_connac.h:7:
   In file included from drivers/net/wireless/mediatek/mt76/mt7996/../mt76.h:12:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/mediatek/mt76/mt7996/main.c:6:
   drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:303:10: warning: arithmetic between different enumeration types ('enum mt76_rxq_id' and 'enum mt76_mcuq_id') [-Wenum-enum-conversion]
     303 |         u8 q_id[MT7996_MAX_QUEUE];
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:84:41: note: expanded from macro 'MT7996_MAX_QUEUE'
      84 | #define MT7996_MAX_QUEUE                (__MT_RXQ_MAX + __MT_MCUQ_MAX + 3)
         |                                          ~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:304:17: warning: arithmetic between different enumeration types ('enum mt76_rxq_id' and 'enum mt76_mcuq_id') [-Wenum-enum-conversion]
     304 |         u32 q_int_mask[MT7996_MAX_QUEUE];
         |                        ^~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:84:41: note: expanded from macro 'MT7996_MAX_QUEUE'
      84 | #define MT7996_MAX_QUEUE                (__MT_RXQ_MAX + __MT_MCUQ_MAX + 3)
         |                                          ~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7996/main.c:1679:17: error: incompatible function pointer types initializing 'int (*)(struct ieee80211_hw *, struct ieee80211_vif *, unsigned int, int *)' with an expression of type 'int (struct ieee80211_hw *, struct ieee80211_vif *, int *)' [-Wincompatible-function-pointer-types]
    1679 |         .get_txpower = mt7996_get_txpower,
         |                        ^~~~~~~~~~~~~~~~~~
   5 warnings and 1 error generated.


vim +1679 drivers/net/wireless/mediatek/mt76/mt7996/main.c

  1650	
  1651	const struct ieee80211_ops mt7996_ops = {
  1652		.add_chanctx = mt76_add_chanctx,
  1653		.remove_chanctx = mt76_remove_chanctx,
  1654		.change_chanctx = mt76_change_chanctx,
  1655		.assign_vif_chanctx = mt76_assign_vif_chanctx,
  1656		.unassign_vif_chanctx = mt76_unassign_vif_chanctx,
  1657		.switch_vif_chanctx = mt76_switch_vif_chanctx,
  1658		.tx = mt7996_tx,
  1659		.start = mt7996_start,
  1660		.stop = mt7996_stop,
  1661		.add_interface = mt7996_add_interface,
  1662		.remove_interface = mt7996_remove_interface,
  1663		.config = mt7996_config,
  1664		.conf_tx = mt7996_conf_tx,
  1665		.configure_filter = mt7996_configure_filter,
  1666		.bss_info_changed = mt7996_bss_info_changed,
  1667		.sta_state = mt76_sta_state,
  1668		.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
  1669		.link_sta_rc_update = mt7996_sta_rc_update,
  1670		.set_key = mt7996_set_key,
  1671		.ampdu_action = mt7996_ampdu_action,
  1672		.set_rts_threshold = mt7996_set_rts_threshold,
  1673		.wake_tx_queue = mt76_wake_tx_queue,
  1674		.hw_scan = mt76_hw_scan,
  1675		.cancel_hw_scan = mt76_cancel_hw_scan,
  1676		.remain_on_channel = mt76_remain_on_channel,
  1677		.cancel_remain_on_channel = mt76_cancel_remain_on_channel,
  1678		.release_buffered_frames = mt76_release_buffered_frames,
> 1679		.get_txpower = mt7996_get_txpower,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

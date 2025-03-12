Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE43B23FC40;
	Wed, 12 Mar 2025 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741785983; cv=none; b=sMU1lGadJ8lBNToqLkhztP+lmJHWBDa/A5GchBoWZRzE9kibxI6qirqek0RdQeMEiiDks8mceo0ssJIqq4hqsh7OkloPdwnrbMkiUzo6TBGK/G4OrGZeT55CzTQxMSNEHHpcxz0rENwEOvOai8Glnn+K4WEiRJb8lQ4qmdgJ5Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741785983; c=relaxed/simple;
	bh=KrChwCCrwWEIgrvhADbjBTRWc3bdvSn9oyVe+ns6uok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dx5pekGzCsgTHa7N99jKnjkvy4fYzCNOcZnuJEddB1GKJ/sOOQntVLFUrxgr5F8GmynmO9C5QmW/Iyz87DzE45sk66Ix4y74GNEjApmVthucRLyEINl/JNd1IJ3Q2fHgaor2qH84qWO4Bm4bLc4P1PuD3Ap0tS97XrAe9GG5eRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haF4G9EY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haF4G9EY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741785982; x=1773321982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KrChwCCrwWEIgrvhADbjBTRWc3bdvSn9oyVe+ns6uok=;
  b=haF4G9EYiXP3GDGo3N/Pe39S/wPg3bYN+fn6WpRPJIemq9hdWsDtKLKK
   9vdiNNAQdUy7g23oDyE70abfyaHI/6sl9uZbd2XtwYOzd85Sqg7s014tl
   sd71q6Gn+MXEZSsh4yz8bwSfUNI3HdMOjhjjRgHbSWQe11Rvw7inxcE0z
   +XsC6RIBhcdyw787IuVH33PHu/J3mgA23w6lpXiZshEB7VYITokPP1us4
   8CaGkC0iy9VUKqGFHP8grDon2Li5NggkQKLHjWHWZdlw+0bF4mdarO0gA
   osA2riQ3Aoaqqxf1N4Ca93MqJFymHcBd8vV4VqMR2oE4bZUW7nlmuthtG
   A==;
X-CSE-ConnectionGUID: ffzKU6w6TIGNPfyEv7BMFA==
X-CSE-MsgGUID: rvAlvQrISxWWX75rUSJc/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53067971"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="53067971"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 06:26:21 -0700
X-CSE-ConnectionGUID: Cu2q78KXR76tONscYkElgQ==
X-CSE-MsgGUID: r0qnwJ3qQTSbfJJtht3vng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="121545053"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Mar 2025 06:26:20 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsM6D-0008Yy-1u;
	Wed, 12 Mar 2025 13:26:17 +0000
Date: Wed, 12 Mar 2025 21:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 7/8] wifi: mt76: mt7996: implement driver specific
 get_txpower function
Message-ID: <202503122115.4cTqxdyV-lkp@intel.com>
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
[also build test ERROR on wireless/main linus/master v6.14-rc6 next-20250311]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Fietkau/wifi-mt76-mt7996-fix-SER-reset-trigger-on-WED-reset/20250311-184157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250311103646.43346-7-nbd%40nbd.name
patch subject: [PATCH 7/8] wifi: mt76: mt7996: implement driver specific get_txpower function
config: i386-buildonly-randconfig-005-20250312 (https://download.01.org/0day-ci/archive/20250312/202503122115.4cTqxdyV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503122115.4cTqxdyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503122115.4cTqxdyV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7996/main.c:1679:24: error: initialization of 'int (*)(struct ieee80211_hw *, struct ieee80211_vif *, unsigned int,  int *)' from incompatible pointer type 'int (*)(struct ieee80211_hw *, struct ieee80211_vif *, int *)' [-Werror=incompatible-pointer-types]
    1679 |         .get_txpower = mt7996_get_txpower,
         |                        ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1679:24: note: (near initialization for 'mt7996_ops.get_txpower')
   cc1: some warnings being treated as errors


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

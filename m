Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66AE42AA6;
	Sun, 23 Mar 2025 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742750543; cv=none; b=VuVFIeMDkS4Mh3Ebc39bK5dX7Etbc+2wfT7+UUbhVJY9AElQZtUKxqkVrKFuL3Hn5vvvxJ8zeWCOFk/lhLznI4MJtFpK95ygN6fK/q3j6+exo4Pj4stpk9Jh17mZKZo3EohenMR+qyzFU41wHcTEkcnQiOUfhSq7VLq1tWPPhv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742750543; c=relaxed/simple;
	bh=iFxhqIf/S9KhBltDLEcS4TSY/Srmtm/aItOAL50xGJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSsUJd483jnppyKCHmgUF90lqTHfep0urhq04jNOPEcJE1yu30p8UvNlNfbc0lEC5yGrybJZ+xWlL5EtbuDD3J9lxhmcCJLLjnUClRtl6BGiNBdTAQu0pKGkqp8+lVXfcvtOA1zSXlp7FSuYi/9VRSlrQfRx+7O2WI5jKvu8AwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDNVfj7N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDNVfj7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742750542; x=1774286542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iFxhqIf/S9KhBltDLEcS4TSY/Srmtm/aItOAL50xGJM=;
  b=dDNVfj7NPSw+VlKfd1atkSGT7NWBXZXO8diYJpyFkETjRyLRjSonAzld
   nqdo8yHbu+dykZBbyzmAoi9OdoK32M9UJZkjhkJwZXc3QYOu4oSR+L3aC
   Yg0DNirgyQDV8i8sTSQFAeY8oTvRYhsw9ZS4vCr6dd/RdBQH1lK5p7Y/l
   2ioJmtMjVqkTOC/6gaUTSg6fLk0UJSDA/tu6msVdnNhPt2SABswzkVBbm
   Kjbzj14trTE72ykeInbiXm0cSaf8OhCpAQVRMTY9nOG29POe80aEi4gmj
   M4HyRYxuSN/v8jukuv9p2J4YqnB/Ya1D54K6NVDcz6gddeH41//MzmFSX
   A==;
X-CSE-ConnectionGUID: EgGvL4ViQxCSZRh5GVdCpA==
X-CSE-MsgGUID: I3KprlV1SxG4UjseKQmyOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="55332193"
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="55332193"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 10:22:21 -0700
X-CSE-ConnectionGUID: vbwlofbpQYCXb8AF8OT9jQ==
X-CSE-MsgGUID: cZ1HFfghQNa/e8+OLzqezQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="124791346"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2025 10:22:21 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twP1d-0002sQ-07;
	Sun, 23 Mar 2025 17:22:17 +0000
Date: Mon, 24 Mar 2025 01:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 3/5] wifi: mac80211: Set RTS threshold on per-radio
 basis
Message-ID: <202503240144.urFDLtwW-lkp@intel.com>
References: <20250323073959.2872641-4-quic_rdevanat@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323073959.2872641-4-quic_rdevanat@quicinc.com>

Hi Roopni,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1794d7ab34d2221ac7eb921b171e75b856e10561]

url:    https://github.com/intel-lab-lkp/linux/commits/Roopni-Devanathan/wifi-cfg80211-Add-Support-to-Set-RTS-Threshold-for-each-Radio/20250323-154228
base:   1794d7ab34d2221ac7eb921b171e75b856e10561
patch link:    https://lore.kernel.org/r/20250323073959.2872641-4-quic_rdevanat%40quicinc.com
patch subject: [PATCH v5 3/5] wifi: mac80211: Set RTS threshold on per-radio basis
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250324/202503240144.urFDLtwW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503240144.urFDLtwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503240144.urFDLtwW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:2618:23: error: incompatible function pointer types initializing 'int (*)(struct ieee80211_hw *, s8, u32)' (aka 'int (*)(struct ieee80211_hw *, signed char, unsigned int)') with an expression of type 'int (struct ieee80211_hw *, u32)' (aka 'int (struct ieee80211_hw *, unsigned int)') [-Wincompatible-function-pointer-types]
    2618 |         .set_rts_threshold = iwl_mld_mac80211_set_rts_threshold,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +2618 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c

d1e879ec600f9b Miri Korenblit 2025-02-16  2600  
d1e879ec600f9b Miri Korenblit 2025-02-16  2601  const struct ieee80211_ops iwl_mld_hw_ops = {
d1e879ec600f9b Miri Korenblit 2025-02-16  2602  	.tx = iwl_mld_mac80211_tx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2603  	.start = iwl_mld_mac80211_start,
d1e879ec600f9b Miri Korenblit 2025-02-16  2604  	.stop = iwl_mld_mac80211_stop,
d1e879ec600f9b Miri Korenblit 2025-02-16  2605  	.config = iwl_mld_mac80211_config,
d1e879ec600f9b Miri Korenblit 2025-02-16  2606  	.add_interface = iwl_mld_mac80211_add_interface,
d1e879ec600f9b Miri Korenblit 2025-02-16  2607  	.remove_interface = iwl_mld_mac80211_remove_interface,
d1e879ec600f9b Miri Korenblit 2025-02-16  2608  	.conf_tx = iwl_mld_mac80211_conf_tx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2609  	.prepare_multicast = iwl_mld_mac80211_prepare_multicast,
d1e879ec600f9b Miri Korenblit 2025-02-16  2610  	.configure_filter = iwl_mld_mac80211_configure_filter,
d1e879ec600f9b Miri Korenblit 2025-02-16  2611  	.reconfig_complete = iwl_mld_mac80211_reconfig_complete,
d1e879ec600f9b Miri Korenblit 2025-02-16  2612  	.wake_tx_queue = iwl_mld_mac80211_wake_tx_queue,
d1e879ec600f9b Miri Korenblit 2025-02-16  2613  	.add_chanctx = iwl_mld_add_chanctx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2614  	.remove_chanctx = iwl_mld_remove_chanctx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2615  	.change_chanctx = iwl_mld_change_chanctx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2616  	.assign_vif_chanctx = iwl_mld_assign_vif_chanctx,
d1e879ec600f9b Miri Korenblit 2025-02-16  2617  	.unassign_vif_chanctx = iwl_mld_unassign_vif_chanctx,
d1e879ec600f9b Miri Korenblit 2025-02-16 @2618  	.set_rts_threshold = iwl_mld_mac80211_set_rts_threshold,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

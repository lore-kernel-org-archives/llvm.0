Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A645A67A01;
	Sun,  3 Mar 2024 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709477996; cv=none; b=pkL/opbGjudWJiJxhbt6SZKXROQEv1g764fB5Ui/ZrlL1MXIzETgZAhtTu0RW53olRGX55gagWV26eJcw70EnmYq2wOGBudC6tLASR8e/dBlEMwIHdTpiDVYzXhcSQZCQbFKLBsFPZMEfYFoZknCrXdBigfWI0yEXTc336w8YAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709477996; c=relaxed/simple;
	bh=GnxGhffnwl/dRdPeJJjkYls826azgfaD6o6hq/rQN98=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m7nHgxf+ZNhntb//caItGQRjIwO0qxr64TCNMRotUH6nZRLJ6m6GY+ZEwjpxM9ysbIaNAStxZ12ENfu0Peu43Ha6qum89uVYoPACDXeiTs+kSyDMjCWKQjS7zFz8Gq0cGDZo2ght1hQpjNMR/nPItZGb8wOV4jL6IcVNyC+7xbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnQYERaO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnQYERaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709477995; x=1741013995;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GnxGhffnwl/dRdPeJJjkYls826azgfaD6o6hq/rQN98=;
  b=bnQYERaOiofs8tdzp38fmu6/ZlU9qs2CfFNf4SxnEjZU3kDcE/GmMr1T
   WfpYVNLOfb/7zUze0n0XGaNdguHtIqiW2YfVYO/K5ahV7C/BE/gbINbsj
   jJ7F+sgXbtm+TQfeO7AbxUOqX+QeAu4YQPswG1KlNXS5N1uAVBO3k2B7x
   FKBpd2Jjf3vrozWWLZOyFMfByKk56uiYxme6hI/4gb2ZNqBIPboSeDGf3
   bdSEMrRMA1/czvX00Nn7Zg4tdmXRHPeIhvfPYzngmBvapMb0vPWcUwWpP
   6PSbEzZuSIOEjdEiZzBDRmgShnEZGW3cjYY4qfS4ywjqNWWIIVDz9MAAR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3828805"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="3828805"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 06:59:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13282099"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2024 06:59:50 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgnJc-0001qQ-1B;
	Sun, 03 Mar 2024 14:59:48 +0000
Date: Sun, 3 Mar 2024 22:59:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/net/wireless/intel/iwlwifi/mvm/rs-fw.c:345:31: warning:
 arithmetic between different enumeration types ('enum IWL_TLC_MCS_PER_BW'
 and 'enum iwl_tlc_mng_cfg_cw')
Message-ID: <202403032202.t5Wm8pfn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Mordechay Goodstein <mordechay.goodstein@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Gregory Greenman <gregory.greenman@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   04b8076df2534f08bb4190f90a24e0f7f8930aca
commit: beddcdc489864e234af844d906547b1cb70e9036 wifi: iwlwifi: rs-fw: break out for unsupported bandwidth
date:   12 months ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20240303/202403032202.t5Wm8pfn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032202.t5Wm8pfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032202.t5Wm8pfn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/mvm/rs-fw.c:6:
   In file included from drivers/net/wireless/intel/iwlwifi/mvm/rs.h:13:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:1862:
   include/linux/vmstat.h:502:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/mvm/rs-fw.c:345:31: warning: arithmetic between different enumeration types ('enum IWL_TLC_MCS_PER_BW' and 'enum iwl_tlc_mng_cfg_cw') [-Wenum-enum-conversion]
     345 |                 if (cmd->max_ch_width < (bw + IWL_TLC_MNG_CH_WIDTH_80MHZ))
         |                                          ~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +345 drivers/net/wireless/intel/iwlwifi/mvm/rs-fw.c

   284	
   285	static void rs_fw_eht_set_enabled_rates(const struct ieee80211_sta *sta,
   286						struct ieee80211_supported_band *sband,
   287						struct iwl_tlc_config_cmd_v4 *cmd)
   288	{
   289		/* peer RX mcs capa */
   290		const struct ieee80211_eht_mcs_nss_supp *eht_rx_mcs =
   291			&sta->deflink.eht_cap.eht_mcs_nss_supp;
   292		/* our TX mcs capa */
   293		const struct ieee80211_eht_mcs_nss_supp *eht_tx_mcs =
   294			&sband->iftype_data->eht_cap.eht_mcs_nss_supp;
   295	
   296		enum IWL_TLC_MCS_PER_BW bw;
   297		struct ieee80211_eht_mcs_nss_supp_20mhz_only mcs_rx_20;
   298		struct ieee80211_eht_mcs_nss_supp_20mhz_only mcs_tx_20;
   299	
   300		/* peer is 20Mhz only */
   301		if (!(sta->deflink.he_cap.he_cap_elem.phy_cap_info[0] &
   302		      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_MASK_ALL)) {
   303			mcs_rx_20 = eht_rx_mcs->only_20mhz;
   304		} else {
   305			mcs_rx_20.rx_tx_mcs7_max_nss = eht_rx_mcs->bw._80.rx_tx_mcs9_max_nss;
   306			mcs_rx_20.rx_tx_mcs9_max_nss = eht_rx_mcs->bw._80.rx_tx_mcs9_max_nss;
   307			mcs_rx_20.rx_tx_mcs11_max_nss = eht_rx_mcs->bw._80.rx_tx_mcs11_max_nss;
   308			mcs_rx_20.rx_tx_mcs13_max_nss = eht_rx_mcs->bw._80.rx_tx_mcs13_max_nss;
   309		}
   310	
   311		/* nic is 20Mhz only */
   312		if (!(sband->iftype_data->he_cap.he_cap_elem.phy_cap_info[0] &
   313		      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_MASK_ALL)) {
   314			mcs_tx_20 = eht_tx_mcs->only_20mhz;
   315		} else {
   316			mcs_tx_20.rx_tx_mcs7_max_nss = eht_tx_mcs->bw._80.rx_tx_mcs9_max_nss;
   317			mcs_tx_20.rx_tx_mcs9_max_nss = eht_tx_mcs->bw._80.rx_tx_mcs9_max_nss;
   318			mcs_tx_20.rx_tx_mcs11_max_nss = eht_tx_mcs->bw._80.rx_tx_mcs11_max_nss;
   319			mcs_tx_20.rx_tx_mcs13_max_nss = eht_tx_mcs->bw._80.rx_tx_mcs13_max_nss;
   320		}
   321	
   322		/* rates for 20/40/80 bw */
   323		bw = IWL_TLC_MCS_PER_BW_80;
   324		rs_fw_set_eht_mcs_nss(cmd->ht_rates, bw,
   325				      MAX_NSS_MCS(7, &mcs_rx_20, &mcs_tx_20), GENMASK(7, 0));
   326		rs_fw_set_eht_mcs_nss(cmd->ht_rates, bw,
   327				      MAX_NSS_MCS(9, &mcs_rx_20, &mcs_tx_20), GENMASK(9, 8));
   328		rs_fw_set_eht_mcs_nss(cmd->ht_rates, bw,
   329				      MAX_NSS_MCS(11, &mcs_rx_20, &mcs_tx_20), GENMASK(11, 10));
   330		rs_fw_set_eht_mcs_nss(cmd->ht_rates, bw,
   331				      MAX_NSS_MCS(13, &mcs_rx_20, &mcs_tx_20), GENMASK(13, 12));
   332	
   333		/* rate for 160/320 bw */
   334		for (bw = IWL_TLC_MCS_PER_BW_160; bw <= IWL_TLC_MCS_PER_BW_320; bw++) {
   335			const struct ieee80211_eht_mcs_nss_supp_bw *mcs_rx =
   336				rs_fw_rs_mcs2eht_mcs(bw, eht_rx_mcs);
   337			const struct ieee80211_eht_mcs_nss_supp_bw *mcs_tx =
   338				rs_fw_rs_mcs2eht_mcs(bw, eht_tx_mcs);
   339	
   340			/* got unsupported index for bw */
   341			if (!mcs_rx || !mcs_tx)
   342				continue;
   343	
   344			/* break out if we don't support the bandwidth */
 > 345			if (cmd->max_ch_width < (bw + IWL_TLC_MNG_CH_WIDTH_80MHZ))
   346				break;
   347	
   348			rs_fw_set_eht_mcs_nss(cmd->ht_rates, bw,
   349					      MAX_NSS_MCS(9, mcs_rx, mcs_tx), GENMASK(9, 0));
   350			rs_fw_set_eht_mcs_nss(cmd->ht_rates, bw,
   351					      MAX_NSS_MCS(11, mcs_rx, mcs_tx), GENMASK(11, 10));
   352			rs_fw_set_eht_mcs_nss(cmd->ht_rates, bw,
   353					      MAX_NSS_MCS(13, mcs_rx, mcs_tx), GENMASK(13, 12));
   354		}
   355	
   356		/* the station support only a single receive chain */
   357		if (sta->deflink.smps_mode == IEEE80211_SMPS_STATIC ||
   358		    sta->deflink.rx_nss < 2)
   359			memset(cmd->ht_rates[IWL_TLC_NSS_2], 0,
   360			       sizeof(cmd->ht_rates[IWL_TLC_NSS_2]));
   361	}
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

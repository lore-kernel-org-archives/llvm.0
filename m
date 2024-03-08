Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C1055E55;
	Fri,  8 Mar 2024 11:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709897332; cv=none; b=VcShxSKPyfo3d3gh5HV1+ekiC57KNJccviAS7xzpOhBmuNzJxpbCmFEk/st4kBlIbhhkcebsHWWErdNJEDwFqupDuVjGGZP2/5kyX2nS1QyzOr1EiGoe0ucIG5VZ54GfuFOqQgYkpmN76Hn2xKakGZTXsyzIqiWnrLY1a5g2Xe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709897332; c=relaxed/simple;
	bh=dpdiP9ICP+tfHBy77MaDRlfPbBpHkiFITT70yJ5xYXg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hYLdODrnspQD5PH+aB0kuAZUDgJEOWHK+eDXEbnZNj5Q14idB/GYyci1QQkZcfjIiHUvK/YrPIieipiiCf6aE4EEgM2xXgh3zkdR/damt2SHEIn4xxWzrd12cnQrMoOv/fj9iYQDsrD265zli+5XczEFPalPa793/D9+Be4E2EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfxVOqZg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfxVOqZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709897331; x=1741433331;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dpdiP9ICP+tfHBy77MaDRlfPbBpHkiFITT70yJ5xYXg=;
  b=mfxVOqZgVIzZjm5z4mev9juT8t6ckEMVexDIfdbUp7WVkKTMcNCrWOwt
   va87WDx/NFOR4nxO6i46Cer3kD2xbPKLVrcOBoOFO7YzKoYKhMcQVERLh
   BICYW4wfvnwZ3BgTKJgYmRupkRgJ5FO4Cw0DOBunavQtV/MRGzs5WrFUw
   EcXbs5uJpspqd43gTCtbKejcnXoLFUdhMrAVG7au2INjRchmACGhdeRUy
   /Uoxthh4cFe2+ebK4NPPk6SsCKKoz4W0xrhWMwPkY2EQcIU1f8f5XKXRl
   3d+IcGw+5IkWlHIoSib5xoin2+le+yQ3htK2KibidK+QzIy1rmdChqbJq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4739764"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4739764"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 03:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10449487"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 03:28:49 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riYP8-0006Kr-1W;
	Fri, 08 Mar 2024 11:28:46 +0000
Date: Fri, 8 Mar 2024 19:28:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/net/wireless/intel/iwlwifi/mvm/sta.c:4307:17: warning:
 conditional expression between different enumeration types ('enum
 iwl_fw_sta_type' and 'enum iwl_sta_type')
Message-ID: <202403081956.M7xiZG39-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Avraham Stern <avraham.stern@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Gregory Greenman <gregory.greenman@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3aaa8ce7a3350d95b241046ae2401103a4384ba2
commit: 0945f9762ec3766186a179f7ccd001a3e160e3a0 wifi: iwlwifi: mvm: support PASN for MLO
date:   9 months ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20240308/202403081956.M7xiZG39-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081956.M7xiZG39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081956.M7xiZG39-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/mvm/sta.c:7:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2105:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/intel/iwlwifi/mvm/sta.c:4307:17: warning: conditional expression between different enumeration types ('enum iwl_fw_sta_type' and 'enum iwl_sta_type') [-Wenum-compare-conditional]
    4307 |         u32 type = mld ? STATION_TYPE_PEER : IWL_STA_LINK;
         |                        ^ ~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~
   6 warnings generated.


vim +4307 drivers/net/wireless/intel/iwlwifi/mvm/sta.c

  4295	
  4296	int iwl_mvm_add_pasn_sta(struct iwl_mvm *mvm, struct ieee80211_vif *vif,
  4297				 struct iwl_mvm_int_sta *sta, u8 *addr, u32 cipher,
  4298				 u8 *key, u32 key_len)
  4299	{
  4300		int ret;
  4301		u16 queue;
  4302		struct iwl_mvm_vif *mvmvif = iwl_mvm_vif_from_mac80211(vif);
  4303		struct ieee80211_key_conf *keyconf;
  4304		unsigned int wdg_timeout =
  4305			iwl_mvm_get_wd_timeout(mvm, vif, false, false);
  4306		bool mld = iwl_mvm_has_mld_api(mvm->fw);
> 4307		u32 type = mld ? STATION_TYPE_PEER : IWL_STA_LINK;
  4308	
  4309		ret = iwl_mvm_allocate_int_sta(mvm, sta, 0,
  4310					       NL80211_IFTYPE_UNSPECIFIED, type);
  4311		if (ret)
  4312			return ret;
  4313	
  4314		if (mld)
  4315			ret = iwl_mvm_mld_add_int_sta_with_queue(mvm, sta, addr,
  4316								 mvmvif->deflink.fw_link_id,
  4317								 &queue,
  4318								 IWL_MAX_TID_COUNT,
  4319								 &wdg_timeout);
  4320		else
  4321			ret = iwl_mvm_add_int_sta_with_queue(mvm, mvmvif->id,
  4322							     mvmvif->color, addr, sta,
  4323							     &queue,
  4324							     IWL_MVM_TX_FIFO_BE);
  4325		if (ret)
  4326			goto out;
  4327	
  4328		keyconf = kzalloc(sizeof(*keyconf) + key_len, GFP_KERNEL);
  4329		if (!keyconf) {
  4330			ret = -ENOBUFS;
  4331			goto out;
  4332		}
  4333	
  4334		keyconf->cipher = cipher;
  4335		memcpy(keyconf->key, key, key_len);
  4336		keyconf->keylen = key_len;
  4337		keyconf->flags = IEEE80211_KEY_FLAG_PAIRWISE;
  4338	
  4339		if (mld) {
  4340			/* The MFP flag is set according to the station mfp field. Since
  4341			 * we don't have a station, set it manually.
  4342			 */
  4343			u32 key_flags =
  4344				iwl_mvm_get_sec_flags(mvm, vif, NULL, keyconf) |
  4345				IWL_SEC_KEY_FLAG_MFP;
  4346			u32 sta_mask = BIT(sta->sta_id);
  4347	
  4348			ret = iwl_mvm_mld_send_key(mvm, sta_mask, key_flags, keyconf);
  4349		} else {
  4350			ret = iwl_mvm_send_sta_key(mvm, sta->sta_id, keyconf, false,
  4351						   0, NULL, 0, 0, true);
  4352		}
  4353	
  4354		kfree(keyconf);
  4355		return 0;
  4356	out:
  4357		iwl_mvm_dealloc_int_sta(mvm, sta);
  4358		return ret;
  4359	}
  4360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

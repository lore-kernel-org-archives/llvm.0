Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0351C2DDD;
	Sun, 15 Sep 2024 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726390722; cv=none; b=DMfmbsUZq4T8CEMs8xu9ApZlvfGcXcV9VIWH+QRhOYn8Rjzdv98OftHDeRYWSLa9m6nTwOVH37tFrwdaT7Qkc7dFNBVA0imNea2TQse6Hd8gqWZNr+AptasoERiQ7M+pKVUo6L5sxw3DZOspv2wDkYVZrqUP3iP6ZZurTGnATCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726390722; c=relaxed/simple;
	bh=0JCWqAAAtrFrC4qrL59M0aoq5123LxZtAxxQxpxgvzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ozlYHUxXzS+JzFCbdQpaewfRJNbosjwYMpl5AAQRN87zl8n75G31l0PgEwcdPEpg0Hy0ZAqqenENVdTtr+xwnY4ODW3ZInwM0c+ZWvQ/fv880sF7aV8EC/AD3g7e2Yydix2uBaYab5px9tpG1rm1bG5i2b48GBfNmhLofX60418=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4mKFUL0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4mKFUL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726390722; x=1757926722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0JCWqAAAtrFrC4qrL59M0aoq5123LxZtAxxQxpxgvzs=;
  b=Z4mKFUL0p4kOV7WJ7SCkSRemu3CYGg2ZTu1tP7hueeXL+t8xI7keyrD0
   vPXBxe2tNPsTvs99oTz2m19bIWCfR0C0ppi3HvBZvXUocykXSA542QTRb
   ualkfHWbRjF1EP0GOk6XrsmG1778xHOPJbwndP5ksRdh4kivyr47wN81k
   LcXWavS0zXPATSB0FjoHt9n2QjjZMhaeLcE/oKB5jtq0I2NNb1FQ7k+rK
   T9FUYW/DIMz+kzje7TEx8fGZdOyMZfGbkMKNvlAi/v2iODOCGrdfxAcf2
   9f+pGHaQBOaJ/QFSChWtsiY4Qx83eV5C1g0Y/z1ZcnmvXn7pEksIoVwg1
   g==;
X-CSE-ConnectionGUID: PIlJ9w7SSqCnjOGl3itEOA==
X-CSE-MsgGUID: H1geoaYwSWua1749sjVObQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="36380612"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="36380612"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 01:58:40 -0700
X-CSE-ConnectionGUID: QC4P9BIHQdOUVxtyfauQpA==
X-CSE-MsgGUID: Ok25cWrrS4KayGPzj0P/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="72678859"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2024 01:58:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spl5X-0008Xe-1O;
	Sun, 15 Sep 2024 08:58:35 +0000
Date: Sun, 15 Sep 2024 16:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>
Subject: [ath:ath12k-mlo 34/63] drivers/net/wireless/ath/ath12k/mac.c:4289:8:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202409151616.hnCxh90B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
head:   8f61af03fddc0a30bdf49e06a13eafff3cec91b0
commit: ec3755e39b7ae8f7ed9853e6169fa5e307b9fb90 [34/63] wifi: ath12k: modify ath12k_mac_op_set_key for MLO
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240915/202409151616.hnCxh90B-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151616.hnCxh90B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151616.hnCxh90B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/mac.c:4289:8: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    4289 |                         if (WARN_ON(!arvif))
         |                             ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:122:28: note: expanded from macro 'WARN_ON'
     122 | #define WARN_ON(condition) ({                                           \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     123 |         int __ret_warn_on = !!(condition);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     124 |         if (unlikely(__ret_warn_on))                                    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     125 |                 __WARN();                                               \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     126 |         unlikely(__ret_warn_on);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     127 | })
         | ~~
   drivers/net/wireless/ath/ath12k/mac.c:4322:9: note: uninitialized use occurs here
    4322 |         return ret;
         |                ^~~
   drivers/net/wireless/ath/ath12k/mac.c:4289:4: note: remove the 'if' if its condition is always false
    4289 |                         if (WARN_ON(!arvif))
         |                         ^~~~~~~~~~~~~~~~~~~~
    4290 |                                 goto out;
         |                                 ~~~~~~~~
   drivers/net/wireless/ath/ath12k/mac.c:4245:9: note: initialize the variable 'ret' to silence this warning
    4245 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +4289 drivers/net/wireless/ath/ath12k/mac.c

  4232	
  4233	static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
  4234					 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
  4235					 struct ieee80211_key_conf *key)
  4236	{
  4237		struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
  4238		struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
  4239		struct ath12k_link_vif *arvif;
  4240		struct ath12k_link_sta *arsta = NULL;
  4241		struct ath12k_vif_cache *cache;
  4242		struct ath12k_sta *ahsta;
  4243		unsigned long links;
  4244		u8 link_id;
  4245		int ret;
  4246	
  4247		mutex_lock(&ah->conf_mutex);
  4248		/* BIP needs to be done in software */
  4249		if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
  4250		    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
  4251		    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
  4252		    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
  4253			mutex_unlock(&ah->conf_mutex);
  4254			return 1;
  4255		}
  4256	
  4257		if (key->keyidx > WMI_MAX_KEY_INDEX) {
  4258			mutex_unlock(&ah->conf_mutex);
  4259			return -ENOSPC;
  4260		}
  4261	
  4262		if (sta) {
  4263			ahsta = ath12k_sta_to_ahsta(sta);
  4264			/* For an ML STA Pairwise key is same for all associated link Stations,
  4265			 * hence do set key for all link STAs.
  4266			 */
  4267			if (sta->mlo) {
  4268				links = sta->valid_links;
  4269				for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
  4270					arvif = rcu_dereference_protected(ahvif->link[link_id],
  4271							lockdep_is_held(&ah->conf_mutex));
  4272					arsta = rcu_dereference_protected(ahsta->link[link_id],
  4273							lockdep_is_held(&ah->conf_mutex));
  4274					/* arvif and arsta are expected to be valid when
  4275					 * STA is present.
  4276					 */
  4277					if (WARN_ON(!arvif || !arsta))
  4278						continue;
  4279					mutex_lock(&arvif->ar->conf_mutex);
  4280					ret = ath12k_mac_set_key(arvif->ar, cmd, arvif,
  4281								 arsta, key);
  4282					mutex_unlock(&arvif->ar->conf_mutex);
  4283					if (ret)
  4284						break;
  4285				}
  4286			} else {
  4287				arsta = &ahsta->deflink;
  4288				arvif = arsta->arvif;
> 4289				if (WARN_ON(!arvif))
  4290					goto out;
  4291				mutex_lock(&arvif->ar->conf_mutex);
  4292				ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, arsta, key);
  4293				mutex_unlock(&arvif->ar->conf_mutex);
  4294			}
  4295		} else {
  4296			if (key->link_id >= 0 && key->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
  4297				link_id = key->link_id;
  4298				arvif = rcu_dereference_protected(ahvif->link[link_id],
  4299						lockdep_is_held(&ah->conf_mutex));
  4300			} else {
  4301				link_id = 0;
  4302				arvif = &ahvif->deflink;
  4303			}
  4304	
  4305			if (!arvif || !arvif->is_created) {
  4306				cache = ath12k_ahvif_get_link_cache(ahvif, link_id);
  4307				if (!cache) {
  4308					mutex_unlock(&ah->conf_mutex);
  4309					return -ENOSPC;
  4310				}
  4311				ret = ath12k_mac_update_key_cache(cache, cmd, sta, key);
  4312				mutex_unlock(&ah->conf_mutex);
  4313				return ret;
  4314			}
  4315	
  4316			mutex_lock(&arvif->ar->conf_mutex);
  4317			ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, NULL, key);
  4318			mutex_unlock(&arvif->ar->conf_mutex);
  4319		}
  4320	out:
  4321		mutex_unlock(&ah->conf_mutex);
  4322		return ret;
  4323	}
  4324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

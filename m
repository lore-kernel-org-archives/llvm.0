Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D8C19A;
	Thu, 27 Mar 2025 01:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743038259; cv=none; b=fusWfwx1ErFVOTLQyqmEDhFTCuvvWqtqwt1nqVofRui6WR9rUm2cMT50YUMo6rSOeF5g2kFEFOUsUZysJzHtuiAnBJbT7Y+4tPruLP1gErvvgnIogpEEGnl4ClLLo8cm7gan88y7BnAWMHErytuquotrV1yYmJMZVGf3vnVej78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743038259; c=relaxed/simple;
	bh=+Hk5s1oFhRBpMBubVZx+RbTQHJlajqYsCNk5c4+OWUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCogd0DEFi14eJV2Q9dFCmrmdPl2pIXm+E/OzpRJgicU9z6D8GRAHsZRWWzlE7gHVLZsMWbFRVOGXRw7HEVoRJfu7SaHFY3bu5CyYewJ27cYaeJqPytzDkVxjvVFlWH8cIClDzOy6i/vw0uohSRiqETmEsbF/ioiqj8vHSN6klc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZExYN+hq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZExYN+hq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743038257; x=1774574257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Hk5s1oFhRBpMBubVZx+RbTQHJlajqYsCNk5c4+OWUI=;
  b=ZExYN+hqkhn3R5cNsXT1xpVi6guTI3CyseI9y/kbsFIG0tN7b+12Rp3x
   1vGf4TiulS2LbUWsMXiHzJVjsm8PfwXAduGh2NJrizboh3d7Qj9/H+CQD
   IgZk4UUhlLRAgenYW13IlHWNMaHCuAOecsVwvxyeBvCY3EIGHWXghAYo4
   GPq8EDAfUBzOErSL14KO5XOvnkg3lA3qCvR0FRPXFFTYkLiMqyoPWre1D
   LkeMjgEUgK8xMfk1xc96xRM1vbifEocMSf+/Rn6MQn2rn8SBRVh8nWmO3
   9msnxV3yJOto3vF5YucMyEPDMyXDlu/Nxpaszt4nMx6yBsQ1tQr1Lwo9x
   A==;
X-CSE-ConnectionGUID: SwiHbuB6ReuTJHlJpx1dbw==
X-CSE-MsgGUID: fwnCqkm/SOaGNu1ONVGS1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44514257"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="44514257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 18:17:36 -0700
X-CSE-ConnectionGUID: w/4s3eZgRC+ZT1jzxWaXRA==
X-CSE-MsgGUID: /81fVfMGQ5SEkWwthIkKaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="155915298"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2025 18:17:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txbsC-0006GV-10;
	Thu, 27 Mar 2025 01:17:32 +0000
Date: Thu, 27 Mar 2025 09:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [linux-next:master 9215/13775]
 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:513:16: warning: variable
 'ret' is uninitialized when used here
Message-ID: <202503271133.8XFKhu8E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0e871365f7f9aeb9b590e345458b2083e067cd13
commit: 834bfc698bf7cee3bf61c0209b410c7f97a54108 [9215/13775] wifi: iwlwifi: mld: fix build with CONFIG_PM_SLEEP undefined
config: x86_64-randconfig-004-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271133.8XFKhu8E-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271133.8XFKhu8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271133.8XFKhu8E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:12:
   drivers/net/wireless/intel/iwlwifi/mld/iface.h:170:5: warning: 'CONFIG_PM_SLEEP' is not defined, evaluates to 0 [-Wundef]
     170 | #if CONFIG_PM_SLEEP
         |     ^
>> drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:513:16: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     513 |         if (!in_d3 || ret) {
         |                       ^~~
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:487:9: note: initialize the variable 'ret' to silence this warning
     487 |         int ret;
         |                ^
         |                 = 0
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1942:13: warning: unused function 'iwl_mld_set_wakeup' [-Wunused-function]
    1942 | static void iwl_mld_set_wakeup(struct ieee80211_hw *hw, bool enabled)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1956:1: warning: unused function 'iwl_mld_suspend' [-Wunused-function]
    1956 | iwl_mld_suspend(struct ieee80211_hw *hw, struct cfg80211_wowlan *wowlan)
         | ^~~~~~~~~~~~~~~
   drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:1978:12: warning: unused function 'iwl_mld_resume' [-Wunused-function]
    1978 | static int iwl_mld_resume(struct ieee80211_hw *hw)
         |            ^~~~~~~~~~~~~~
   5 warnings generated.


vim +/ret +513 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c

d1e879ec600f9b3 Miri Korenblit 2025-02-16  507  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  508  	if (mld->fw_status.in_hw_restart) {
d1e879ec600f9b3 Miri Korenblit 2025-02-16  509  		iwl_mld_stop_fw(mld);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  510  		iwl_mld_restart_cleanup(mld);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  511  	}
d1e879ec600f9b3 Miri Korenblit 2025-02-16  512  
d1e879ec600f9b3 Miri Korenblit 2025-02-16 @513  	if (!in_d3 || ret) {
d1e879ec600f9b3 Miri Korenblit 2025-02-16  514  		ret = iwl_mld_start_fw(mld);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  515  		if (ret)
d1e879ec600f9b3 Miri Korenblit 2025-02-16  516  			goto error;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  517  	}
d1e879ec600f9b3 Miri Korenblit 2025-02-16  518  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  519  	mld->scan.last_start_time_jiffies = jiffies;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  520  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  521  	iwl_dbg_tlv_time_point(&mld->fwrt, IWL_FW_INI_TIME_POINT_POST_INIT,
d1e879ec600f9b3 Miri Korenblit 2025-02-16  522  			       NULL);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  523  	iwl_dbg_tlv_time_point(&mld->fwrt, IWL_FW_INI_TIME_POINT_PERIODIC,
d1e879ec600f9b3 Miri Korenblit 2025-02-16  524  			       NULL);
d1e879ec600f9b3 Miri Korenblit 2025-02-16  525  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  526  	return 0;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  527  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  528  error:
d1e879ec600f9b3 Miri Korenblit 2025-02-16  529  	/* If we failed to restart the hw, there is nothing useful
d1e879ec600f9b3 Miri Korenblit 2025-02-16  530  	 * we can do but indicate we are no longer in restart.
d1e879ec600f9b3 Miri Korenblit 2025-02-16  531  	 */
d1e879ec600f9b3 Miri Korenblit 2025-02-16  532  	mld->fw_status.in_hw_restart = false;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  533  
d1e879ec600f9b3 Miri Korenblit 2025-02-16  534  	return ret;
d1e879ec600f9b3 Miri Korenblit 2025-02-16  535  }
d1e879ec600f9b3 Miri Korenblit 2025-02-16  536  

:::::: The code at line 513 was first introduced by commit
:::::: d1e879ec600f9b3bdd253167533959facfefb17b wifi: iwlwifi: add iwlmld sub-driver

:::::: TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C501B94F;
	Thu, 27 Jun 2024 05:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719465568; cv=none; b=k8uQ2Tmr0h3RUrtFeZW8QODUkmR0d5gdzLgFT/5jzafifBK8uXphhDxTveUa+hpQQQwofy4Qo1/Lvje+UIBx2sjFY/pNyIYmOx3XxiI9cmd3luJB4i2SQZLsGyYxJrUWo1Pkeodv9f/3hXXyOa3QEaiyoJ0+Fa/a4LuHtqB2iTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719465568; c=relaxed/simple;
	bh=4zfwwWRabIBbFALvddxGp1LG99pW+TLYh9OHPV9CgFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kz0KzBmyhOU3ltuFvHs8db9+HavR7iyEgP1pfHHAvKjr2bL5yDiy7TbAz4RdWnslDmycu6VmtfNtbEByLblw4QZkMtv4lAzBGuRsEAYN213UjRDAJaGGAdZWEJQQ4T2RDWvl9+Cb1+PAslKZ3dAB3it4RUF3o1SyCJx9Z83xMas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNaYrHF+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNaYrHF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719465567; x=1751001567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4zfwwWRabIBbFALvddxGp1LG99pW+TLYh9OHPV9CgFg=;
  b=PNaYrHF+/aW9wYwVStbnhqS27Y/GNJGLmHa4n3YA6rQJPLo9CS0qHjRL
   M0gTCQRR5iZCW1xW3MvOb/e5uZGF4yxVBx+VRaMixCISl/Mln2XjkHNfT
   FZvHYu+Wnx1rhp9YpnQPj5UqXl9o6CPYdoC28D8IQXTaSdg91bXzTfbat
   qXKjtcw616ax/CT2Y2pWIOMvvJ7MD3b3pVF1DcTWb8iHZ2SZx+04UHzge
   eMK9rB3OBlPxkZTWpjFR/iP2raFO0jL6qf0+Ki/eLm9kYpVA8HR4/M8LH
   wvB3lMgWajvQ5B3dCNu4ujSQBl9c7nIcbjkiQY0EaXfwjiKoljJW84oNl
   A==;
X-CSE-ConnectionGUID: DZ8dllatSmOmD/wIdqbxPA==
X-CSE-MsgGUID: F/AD4ughQSmT1gAx0uQ47A==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16407275"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="16407275"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 22:19:26 -0700
X-CSE-ConnectionGUID: tvZfU1l2Q/iwPkF2sUs0qg==
X-CSE-MsgGUID: JMh98yKRQJCkTwH9vSXtaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="44087752"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2024 22:19:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMhXW-000FvA-0l;
	Thu, 27 Jun 2024 05:19:22 +0000
Date: Thu, 27 Jun 2024 13:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org,
	Kalle Valo <quic_kvalo@quicinc.com>
Subject: [kvalo-ath:pending 34/37]
 drivers/net/wireless/ath/ath12k/wow.c:982:11: warning: enumeration value
 'ATH12K_HW_STATE_TM' not handled in switch
Message-ID: <202406271317.IYXB6YVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   ff7f6be343c446ec89addc6abb99e83a6b98abfe
commit: 5e4b86c9b76950ec6bf056e17e80d6611df66182 [34/37] wifi: ath12k: add factory test mode support
config: i386-buildonly-randconfig-003-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271317.IYXB6YVE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271317.IYXB6YVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271317.IYXB6YVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/wow.c:982:11: warning: enumeration value 'ATH12K_HW_STATE_TM' not handled in switch [-Wswitch]
     982 |                 switch (ah->state) {
         |                         ^~~~~~~~~
   1 warning generated.


vim +/ATH12K_HW_STATE_TM +982 drivers/net/wireless/ath/ath12k/wow.c

4a3c212eee0e36 Baochen Qiang 2024-06-19   929  
4a3c212eee0e36 Baochen Qiang 2024-06-19   930  int ath12k_wow_op_resume(struct ieee80211_hw *hw)
4a3c212eee0e36 Baochen Qiang 2024-06-19   931  {
4a3c212eee0e36 Baochen Qiang 2024-06-19   932  	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
4a3c212eee0e36 Baochen Qiang 2024-06-19   933  	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
4a3c212eee0e36 Baochen Qiang 2024-06-19   934  	int ret;
4a3c212eee0e36 Baochen Qiang 2024-06-19   935  
4a3c212eee0e36 Baochen Qiang 2024-06-19   936  	mutex_lock(&ar->conf_mutex);
4a3c212eee0e36 Baochen Qiang 2024-06-19   937  
4a3c212eee0e36 Baochen Qiang 2024-06-19   938  	ret = ath12k_hif_resume(ar->ab);
4a3c212eee0e36 Baochen Qiang 2024-06-19   939  	if (ret) {
4a3c212eee0e36 Baochen Qiang 2024-06-19   940  		ath12k_warn(ar->ab, "failed to resume hif: %d\n", ret);
4a3c212eee0e36 Baochen Qiang 2024-06-19   941  		goto exit;
4a3c212eee0e36 Baochen Qiang 2024-06-19   942  	}
4a3c212eee0e36 Baochen Qiang 2024-06-19   943  
4a3c212eee0e36 Baochen Qiang 2024-06-19   944  	ath12k_hif_ce_irq_enable(ar->ab);
4a3c212eee0e36 Baochen Qiang 2024-06-19   945  	ath12k_hif_irq_enable(ar->ab);
4a3c212eee0e36 Baochen Qiang 2024-06-19   946  
4a3c212eee0e36 Baochen Qiang 2024-06-19   947  	ret = ath12k_wow_wakeup(ar);
16f474d6d49db5 Baochen Qiang 2024-06-04   948  	if (ret) {
4a3c212eee0e36 Baochen Qiang 2024-06-19   949  		ath12k_warn(ar->ab, "failed to wakeup from wow: %d\n", ret);
16f474d6d49db5 Baochen Qiang 2024-06-04   950  		goto exit;
16f474d6d49db5 Baochen Qiang 2024-06-04   951  	}
16f474d6d49db5 Baochen Qiang 2024-06-04   952  
16f474d6d49db5 Baochen Qiang 2024-06-04   953  	ret = ath12k_wow_nlo_cleanup(ar);
16f474d6d49db5 Baochen Qiang 2024-06-04   954  	if (ret) {
16f474d6d49db5 Baochen Qiang 2024-06-04   955  		ath12k_warn(ar->ab, "failed to cleanup nlo: %d\n", ret);
16f474d6d49db5 Baochen Qiang 2024-06-04   956  		goto exit;
16f474d6d49db5 Baochen Qiang 2024-06-04   957  	}
4a3c212eee0e36 Baochen Qiang 2024-06-19   958  
66a9448b1b8977 Baochen Qiang 2024-06-19   959  	ret = ath12k_wow_clear_hw_filter(ar);
66a9448b1b8977 Baochen Qiang 2024-06-19   960  	if (ret) {
66a9448b1b8977 Baochen Qiang 2024-06-19   961  		ath12k_warn(ar->ab, "failed to clear hw filter: %d\n", ret);
66a9448b1b8977 Baochen Qiang 2024-06-19   962  		goto exit;
66a9448b1b8977 Baochen Qiang 2024-06-19   963  	}
66a9448b1b8977 Baochen Qiang 2024-06-19   964  
1666108c74c438 Baochen Qiang 2024-06-19   965  	ret = ath12k_wow_protocol_offload(ar, false);
1666108c74c438 Baochen Qiang 2024-06-19   966  	if (ret) {
1666108c74c438 Baochen Qiang 2024-06-19   967  		ath12k_warn(ar->ab, "failed to clear wow protocol offload events: %d\n",
1666108c74c438 Baochen Qiang 2024-06-19   968  			    ret);
1666108c74c438 Baochen Qiang 2024-06-19   969  		goto exit;
1666108c74c438 Baochen Qiang 2024-06-19   970  	}
1666108c74c438 Baochen Qiang 2024-06-19   971  
7af01e56952954 Baochen Qiang 2024-06-19   972  	ret = ath12k_wow_set_keepalive(ar,
7af01e56952954 Baochen Qiang 2024-06-19   973  				       WMI_STA_KEEPALIVE_METHOD_NULL_FRAME,
7af01e56952954 Baochen Qiang 2024-06-19   974  				       WMI_STA_KEEPALIVE_INTERVAL_DISABLE);
7af01e56952954 Baochen Qiang 2024-06-19   975  	if (ret) {
7af01e56952954 Baochen Qiang 2024-06-19   976  		ath12k_warn(ar->ab, "failed to disable wow keepalive: %d\n", ret);
7af01e56952954 Baochen Qiang 2024-06-19   977  		goto exit;
7af01e56952954 Baochen Qiang 2024-06-19   978  	}
7af01e56952954 Baochen Qiang 2024-06-19   979  
4a3c212eee0e36 Baochen Qiang 2024-06-19   980  exit:
4a3c212eee0e36 Baochen Qiang 2024-06-19   981  	if (ret) {
4a3c212eee0e36 Baochen Qiang 2024-06-19  @982  		switch (ah->state) {
4a3c212eee0e36 Baochen Qiang 2024-06-19   983  		case ATH12K_HW_STATE_ON:
4a3c212eee0e36 Baochen Qiang 2024-06-19   984  			ah->state = ATH12K_HW_STATE_RESTARTING;
4a3c212eee0e36 Baochen Qiang 2024-06-19   985  			ret = 1;
4a3c212eee0e36 Baochen Qiang 2024-06-19   986  			break;
4a3c212eee0e36 Baochen Qiang 2024-06-19   987  		case ATH12K_HW_STATE_OFF:
4a3c212eee0e36 Baochen Qiang 2024-06-19   988  		case ATH12K_HW_STATE_RESTARTING:
4a3c212eee0e36 Baochen Qiang 2024-06-19   989  		case ATH12K_HW_STATE_RESTARTED:
4a3c212eee0e36 Baochen Qiang 2024-06-19   990  		case ATH12K_HW_STATE_WEDGED:
4a3c212eee0e36 Baochen Qiang 2024-06-19   991  			ath12k_warn(ar->ab, "encountered unexpected device state %d on resume, cannot recover\n",
4a3c212eee0e36 Baochen Qiang 2024-06-19   992  				    ah->state);
4a3c212eee0e36 Baochen Qiang 2024-06-19   993  			ret = -EIO;
4a3c212eee0e36 Baochen Qiang 2024-06-19   994  			break;
4a3c212eee0e36 Baochen Qiang 2024-06-19   995  		}
4a3c212eee0e36 Baochen Qiang 2024-06-19   996  	}
4a3c212eee0e36 Baochen Qiang 2024-06-19   997  
4a3c212eee0e36 Baochen Qiang 2024-06-19   998  	mutex_unlock(&ar->conf_mutex);
4a3c212eee0e36 Baochen Qiang 2024-06-19   999  	return ret;
4a3c212eee0e36 Baochen Qiang 2024-06-19  1000  }
4a3c212eee0e36 Baochen Qiang 2024-06-19  1001  

:::::: The code at line 982 was first introduced by commit
:::::: 4a3c212eee0e36c1cd55bfbfb94041a0d3ad265b wifi: ath12k: add basic WoW functionalities

:::::: TO: Baochen Qiang <quic_bqiang@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

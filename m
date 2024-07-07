Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D50179AE;
	Sun,  7 Jul 2024 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720347949; cv=none; b=mGWlMOSpgu6c7V528WYIzrO6ItWyqaqEWT+qx/R+bOahmEu6/jlYC9tf7wS7hGVvHVrRnswKg6MLf86QsTRL5bVYBbEUiAyM+PQBZVJYHDW13K+McFAr5YBkdYLsKrJpXo8HPcYxWVqbaQXZwCMRY72YP6BBWzFZ+oCddtMjzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720347949; c=relaxed/simple;
	bh=HndIdzWisuh/Y7RWKrUqmqeHzwSYlhry2F5k5BVeyJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6pEyPExZt24Ft0fZmvyg6vUGQfy7B0g7+z+oYdLLLBvrjgzrQMG92S+K9hRdg748woB8AIhMUuhha0z/0FxPE8/vLuupREBbPeV12YGZFKdX2INvUVFlPvJnvojUNlvR9hA2cWt+ykecyV6HF5sTle5XSvB89EwtwiyqoXcdQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neSx3FXu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neSx3FXu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720347948; x=1751883948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HndIdzWisuh/Y7RWKrUqmqeHzwSYlhry2F5k5BVeyJE=;
  b=neSx3FXuUixBf4RQUwXeKFr7r0fra1SSjLeVRlpj5mxw4xRUQ+fVrqXy
   LeBAyrKN0eFplVdIbB7Mb08ofTPpFPGHVm9ILVQlHn28hvTMO+faYzelK
   S9XLesUKS34DgKayGrcrxB8LsDciqmVxMcjWEuqS3K3V8m3MKkH2NRVWa
   EVGmmOv0c/YAFj7jiagjNDU/3at1RzLbA1RU53s2XMettpjCjn7MO8kQR
   buoUKhBbnSwh1EyShISXBPboX8orNCGK4gGMWKd47k2CC1FK58MARImgg
   5MttFjbZzKUc4RdoMiJtl8ycQyePI/nv/E8jpE7zLhI05kSBC6f2J4aRg
   Q==;
X-CSE-ConnectionGUID: m/rnR7JAQ+20zrK5IqJSeA==
X-CSE-MsgGUID: CTQnCI3yT2erEigFwac7zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="40072460"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="40072460"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 03:25:46 -0700
X-CSE-ConnectionGUID: zXDVPcqBS4ydwMCp/R2GXQ==
X-CSE-MsgGUID: ZmRDwtDuRgOsNCN0aFz1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="52067231"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jul 2024 03:25:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQP5R-000Upv-1P;
	Sun, 07 Jul 2024 10:25:41 +0000
Date: Sun, 7 Jul 2024 18:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>
Subject: [nbd168-wireless:mt76 64/84]
 drivers/net/wireless/mediatek/mt76/mt7925/main.c:958:14: warning: variable
 'sel_links' is used uninitialized whenever 'for' loop exits because its
 condition is false
Message-ID: <202407071840.aHLeLdFK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   67f2e0ed86721f80967ba072a60c53180064be73
commit: 159cb208d02491ada7aeeeaf01b392196ee0e4dc [64/84] wifi: mt76: mt7925: add link handling in mt7925_mac_sta_assoc
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240707/202407071840.aHLeLdFK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071840.aHLeLdFK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071840.aHLeLdFK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:958:14: warning: variable 'sel_links' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
     958 |         for (i = 0; i < n_data; i++) {
         |                     ^~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:974:9: note: uninitialized use occurs here
     974 |         return sel_links;
         |                ^~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:958:14: note: remove the condition if it is always true
     958 |         for (i = 0; i < n_data; i++) {
         |                     ^~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:936:15: note: initialize the variable 'sel_links' to silence this warning
     936 |         u16 sel_links;
         |                      ^
         |                       = 0
   1 warning generated.


vim +958 drivers/net/wireless/mediatek/mt76/mt7925/main.c

   926	
   927	static u16
   928	mt7925_mac_select_links(struct mt76_dev *mdev, struct ieee80211_vif *vif)
   929	{
   930		unsigned long usable_links = ieee80211_vif_usable_links(vif);
   931		struct  {
   932			u8 link_id;
   933			enum nl80211_band band;
   934		} data[IEEE80211_MLD_MAX_NUM_LINKS];
   935		u8 link_id, i, j, n_data = 0;
   936		u16 sel_links;
   937	
   938		if (!ieee80211_vif_is_mld(vif))
   939			return 0;
   940	
   941		if (vif->active_links == usable_links)
   942			return vif->active_links;
   943	
   944		rcu_read_lock();
   945		for_each_set_bit(link_id, &usable_links, IEEE80211_MLD_MAX_NUM_LINKS) {
   946			struct ieee80211_bss_conf *link_conf =
   947				rcu_dereference(vif->link_conf[link_id]);
   948	
   949			if (WARN_ON_ONCE(!link_conf))
   950				continue;
   951	
   952			data[n_data].link_id = link_id;
   953			data[n_data].band = link_conf->chanreq.oper.chan->band;
   954			n_data++;
   955		}
   956		rcu_read_unlock();
   957	
 > 958		for (i = 0; i < n_data; i++) {
   959			if (!(BIT(data[i].link_id) & vif->active_links))
   960				continue;
   961	
   962			sel_links = BIT(data[i].link_id);
   963	
   964			for (j = 0; j < n_data; j++) {
   965				if (data[i].band != data[j].band) {
   966					sel_links |= BIT(data[j].link_id);
   967					break;
   968				}
   969			}
   970	
   971			break;
   972		}
   973	
   974		return sel_links;
   975	}
   976	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

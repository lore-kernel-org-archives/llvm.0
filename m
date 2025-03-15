Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB0078C91;
	Sat, 15 Mar 2025 02:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742004720; cv=none; b=JgrBTQQh37xdJMB1+qdst5z4gzzSdYQaHtKJiPGtNHjU3fnLqqQx/2+9VIMp0JA70hCsiS0+1YTQmA54iJMDc0B47gR9/gMygc1JK7528+xJNw7UqC8o2J+CUMqg9LcXe+v80X+fBIWeeInQyJWlwWJEXRjHYeCJj99SuQ3XN9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742004720; c=relaxed/simple;
	bh=1dGZby3NcTG5d1ppp+jOKH36+9Gbk0rBnUPVsdgiPNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uv8I3+3ZDMWTfhGgJiMyem/XqrSwtKSglg47hREbeWaJBu0+bkf4Q1ai+6978UMLTFtmQQgh8G8H0+0aSML10MTqTilSVE5dn/sKa5xL6rK/Cz5ZRg51zaiZ7xKknGS/tavI7lhKl/y3wOWIXv1aA+1+yTgoY2RCVX28Vm2iZaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9jRn2+X; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9jRn2+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742004719; x=1773540719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1dGZby3NcTG5d1ppp+jOKH36+9Gbk0rBnUPVsdgiPNo=;
  b=Z9jRn2+Xh/2hT+1ZgZxu9EBW0XU6+7acrfZt3szFHcszzo/6ysbNXKN+
   spKVnPYknVi0C61bjJpwlgKMyca10/un+XMptDU3y0/JneEGFrcXzZvqE
   ZUQgVRRkfGjBzmZAT4Et6llmT9HrvWGVOUQIm8hZWbUcLJzbFvmY8plfb
   G8tR5wWcQytIHKr7BId0ckz59ROOa5IhPJL1lCAb2aexnyIysej1JoSzD
   3Q3aakZve4s/+Qt1QhPWp1+9bgKLsi9MiKFInr9MePIjc3b8h+Hfbvhkp
   Bj0lcD55mDMDna1Hn51VS1jbf1GlNUFW2e/BHFvdYMJOhyim54vIDU2Fh
   w==;
X-CSE-ConnectionGUID: CbfPukxHTNOK/PQZX9QqCA==
X-CSE-MsgGUID: C6xXuOGnQK+x+YObP0v49Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="53380628"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="53380628"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 19:11:58 -0700
X-CSE-ConnectionGUID: xujijOMGRVG99iFMYwJrUw==
X-CSE-MsgGUID: I8vAgwIQSsuRZEw9V/dsWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121938833"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Mar 2025 19:11:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttH0C-000AzG-2d;
	Sat, 15 Mar 2025 02:11:52 +0000
Date: Sat, 15 Mar 2025 10:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sarika Sharma <quic_sarishar@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [ath:ath12k-split-phy 144/158]
 drivers/net/wireless/mediatek/mt76/mt792x_core.c:574:9: error: no member
 named 'ack_signal' in 'struct station_info'
Message-ID: <202503151013.F71WON7c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
head:   b8fa5b81fe378ec2bf46db73a2ff7d43151121da
commit: 4ee62a717c5471caf9b50beb6eeefcf4ee0670a8 [144/158] wifi: cfg80211: reorg sinfo structure elements for MLO
config: powerpc-randconfig-003-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151013.F71WON7c-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151013.F71WON7c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151013.F71WON7c-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt792x_core.c:556:10: error: no member named 'txrate' in 'struct station_info'
     556 |                 sinfo->txrate.legacy = txrate->legacy;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:558:10: error: no member named 'txrate' in 'struct station_info'
     558 |                 sinfo->txrate.mcs = txrate->mcs;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:559:10: error: no member named 'txrate' in 'struct station_info'
     559 |                 sinfo->txrate.nss = txrate->nss;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:560:10: error: no member named 'txrate' in 'struct station_info'
     560 |                 sinfo->txrate.bw = txrate->bw;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:561:10: error: no member named 'txrate' in 'struct station_info'
     561 |                 sinfo->txrate.he_gi = txrate->he_gi;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:562:10: error: no member named 'txrate' in 'struct station_info'
     562 |                 sinfo->txrate.he_dcm = txrate->he_dcm;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:563:10: error: no member named 'txrate' in 'struct station_info'
     563 |                 sinfo->txrate.he_ru_alloc = txrate->he_ru_alloc;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:565:9: error: no member named 'tx_failed' in 'struct station_info'
     565 |         sinfo->tx_failed = msta->deflink.wcid.stats.tx_failed;
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:568:9: error: no member named 'tx_retries' in 'struct station_info'
     568 |         sinfo->tx_retries = msta->deflink.wcid.stats.tx_retries;
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt792x_core.c:571:9: error: no member named 'txrate' in 'struct station_info'
     571 |         sinfo->txrate.flags = txrate->flags;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt792x_core.c:574:9: error: no member named 'ack_signal' in 'struct station_info'
     574 |         sinfo->ack_signal = (s8)msta->deflink.ack_signal;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt792x_core.c:577:9: error: no member named 'avg_ack_signal' in 'struct station_info'
     577 |         sinfo->avg_ack_signal = -(s8)ewma_avg_signal_read(&msta->deflink.avg_ack_signal);
         |         ~~~~~  ^
   12 errors generated.
--
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1159:10: error: no member named 'rxrate' in 'struct station_info'
    1159 |                 sinfo->rxrate = rxrate;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1165:11: error: no member named 'txrate' in 'struct station_info'
    1165 |                         sinfo->txrate.legacy = txrate->legacy;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1167:11: error: no member named 'txrate' in 'struct station_info'
    1167 |                         sinfo->txrate.mcs = txrate->mcs;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1168:11: error: no member named 'txrate' in 'struct station_info'
    1168 |                         sinfo->txrate.nss = txrate->nss;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1169:11: error: no member named 'txrate' in 'struct station_info'
    1169 |                         sinfo->txrate.bw = txrate->bw;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1170:11: error: no member named 'txrate' in 'struct station_info'
    1170 |                         sinfo->txrate.he_gi = txrate->he_gi;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1171:11: error: no member named 'txrate' in 'struct station_info'
    1171 |                         sinfo->txrate.he_dcm = txrate->he_dcm;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1172:11: error: no member named 'txrate' in 'struct station_info'
    1172 |                         sinfo->txrate.he_ru_alloc = txrate->he_ru_alloc;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1174:10: error: no member named 'txrate' in 'struct station_info'
    1174 |                 sinfo->txrate.flags = txrate->flags;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1182:10: error: no member named 'tx_bytes' in 'struct station_info'
    1182 |                 sinfo->tx_bytes = msta->wcid.stats.tx_bytes;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1186:11: error: no member named 'tx_packets' in 'struct station_info'
    1186 |                         sinfo->tx_packets = msta->wcid.stats.tx_packets;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1191:11: error: no member named 'rx_bytes' in 'struct station_info'
    1191 |                         sinfo->rx_bytes = msta->wcid.stats.rx_bytes;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1194:11: error: no member named 'rx_packets' in 'struct station_info'
    1194 |                         sinfo->rx_packets = msta->wcid.stats.rx_packets;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1199:9: error: no member named 'tx_failed' in 'struct station_info'
    1199 |         sinfo->tx_failed = msta->wcid.stats.tx_failed;
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7915/main.c:1202:9: error: no member named 'tx_retries' in 'struct station_info'
    1202 |         sinfo->tx_retries = msta->wcid.stats.tx_retries;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:1205:9: error: no member named 'ack_signal' in 'struct station_info'
    1205 |         sinfo->ack_signal = (s8)msta->ack_signal;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:1208:9: error: no member named 'avg_ack_signal' in 'struct station_info'
    1208 |         sinfo->avg_ack_signal = -(s8)ewma_avg_signal_read(&msta->avg_ack_signal);
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:1797:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    1797 |         .sta_statistics = mt7915_sta_statistics,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   18 errors generated.
--
>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:2180:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    2180 |         .sta_statistics = mt792x_sta_statistics,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1152:11: error: no member named 'txrate' in 'struct station_info'
    1152 |                         sinfo->txrate.legacy = txrate->legacy;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1154:11: error: no member named 'txrate' in 'struct station_info'
    1154 |                         sinfo->txrate.mcs = txrate->mcs;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1155:11: error: no member named 'txrate' in 'struct station_info'
    1155 |                         sinfo->txrate.nss = txrate->nss;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1156:11: error: no member named 'txrate' in 'struct station_info'
    1156 |                         sinfo->txrate.bw = txrate->bw;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1157:11: error: no member named 'txrate' in 'struct station_info'
    1157 |                         sinfo->txrate.he_gi = txrate->he_gi;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1158:11: error: no member named 'txrate' in 'struct station_info'
    1158 |                         sinfo->txrate.he_dcm = txrate->he_dcm;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1159:11: error: no member named 'txrate' in 'struct station_info'
    1159 |                         sinfo->txrate.he_ru_alloc = txrate->he_ru_alloc;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1160:11: error: no member named 'txrate' in 'struct station_info'
    1160 |                         sinfo->txrate.eht_gi = txrate->eht_gi;
         |                         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1162:10: error: no member named 'txrate' in 'struct station_info'
    1162 |                 sinfo->txrate.flags = txrate->flags;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1165:9: error: no member named 'txrate' in 'struct station_info'
    1165 |         sinfo->txrate.flags = txrate->flags;
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1168:9: error: no member named 'tx_failed' in 'struct station_info'
    1168 |         sinfo->tx_failed = msta->wcid.stats.tx_failed;
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1171:9: error: no member named 'tx_retries' in 'struct station_info'
    1171 |         sinfo->tx_retries = msta->wcid.stats.tx_retries;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7996/main.c:1174:9: error: no member named 'ack_signal' in 'struct station_info'
    1174 |         sinfo->ack_signal = (s8)msta->ack_signal;
         |         ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7996/main.c:1177:9: error: no member named 'avg_ack_signal' in 'struct station_info'
    1177 |         sinfo->avg_ack_signal = -(s8)ewma_avg_signal_read(&msta->avg_ack_signal);
         |         ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1181:10: error: no member named 'tx_bytes' in 'struct station_info'
    1181 |                 sinfo->tx_bytes = msta->wcid.stats.tx_bytes;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1184:10: error: no member named 'rx_bytes' in 'struct station_info'
    1184 |                 sinfo->rx_bytes = msta->wcid.stats.rx_bytes;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1187:10: error: no member named 'tx_packets' in 'struct station_info'
    1187 |                 sinfo->tx_packets = msta->wcid.stats.tx_packets;
         |                 ~~~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7996/main.c:1190:10: error: no member named 'rx_packets' in 'struct station_info'
    1190 |                 sinfo->rx_packets = msta->wcid.stats.rx_packets;
         |                 ~~~~~  ^
>> drivers/net/wireless/mediatek/mt76/mt7996/main.c:1667:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    1667 |         .sta_statistics = mt7996_sta_statistics,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   19 errors generated.
--
>> drivers/net/wireless/mediatek/mt76/mt7921/main.c:1547:3: error: field designator 'sta_statistics' does not refer to any field in type 'const struct ieee80211_ops'
    1547 |         .sta_statistics = mt792x_sta_statistics,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +574 drivers/net/wireless/mediatek/mt76/mt792x_core.c

c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  543  
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  544  void mt792x_sta_statistics(struct ieee80211_hw *hw,
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  545  			   struct ieee80211_vif *vif,
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  546  			   struct ieee80211_sta *sta,
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  547  			   struct station_info *sinfo)
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  548  {
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  549  	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
4c28c0976ed83c3 Deren Wu         2024-06-12  550  	struct rate_info *txrate = &msta->deflink.wcid.rate;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  551  
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  552  	if (!txrate->legacy && !txrate->flags)
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  553  		return;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  554  
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  555  	if (txrate->legacy) {
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  556  		sinfo->txrate.legacy = txrate->legacy;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  557  	} else {
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  558  		sinfo->txrate.mcs = txrate->mcs;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  559  		sinfo->txrate.nss = txrate->nss;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  560  		sinfo->txrate.bw = txrate->bw;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  561  		sinfo->txrate.he_gi = txrate->he_gi;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  562  		sinfo->txrate.he_dcm = txrate->he_dcm;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  563  		sinfo->txrate.he_ru_alloc = txrate->he_ru_alloc;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  564  	}
4c28c0976ed83c3 Deren Wu         2024-06-12  565  	sinfo->tx_failed = msta->deflink.wcid.stats.tx_failed;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  566  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_FAILED);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  567  
4c28c0976ed83c3 Deren Wu         2024-06-12  568  	sinfo->tx_retries = msta->deflink.wcid.stats.tx_retries;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  569  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  570  
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  571  	sinfo->txrate.flags = txrate->flags;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  572  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  573  
4c28c0976ed83c3 Deren Wu         2024-06-12 @574  	sinfo->ack_signal = (s8)msta->deflink.ack_signal;
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  575  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  576  
4c28c0976ed83c3 Deren Wu         2024-06-12 @577  	sinfo->avg_ack_signal = -(s8)ewma_avg_signal_read(&msta->deflink.avg_ack_signal);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  578  	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_ACK_SIGNAL_AVG);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  579  }
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  580  EXPORT_SYMBOL_GPL(mt792x_sta_statistics);
c74df1c067f2af0 Lorenzo Bianconi 2023-06-28  581  

:::::: The code at line 574 was first introduced by commit
:::::: 4c28c0976ed83c3e8240e80ea918c4d1a3f9c5bc wifi: mt76: mt792x: add struct mt792x_link_sta

:::::: TO: Deren Wu <deren.wu@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

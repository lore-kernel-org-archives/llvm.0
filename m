Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7471CC179;
	Fri,  6 Sep 2024 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725625036; cv=none; b=JoHFcQPRqHxwRzvVwRTsU/Gaad5m4qp2A/xNc86TDxi7XOHfUj3xOxzv5hsYkBdkkfl6Jc0D4mxkYr9qYpgg7HHJ8mthg2hp/48nuCuTKNNoMFGL15fprmf/aLjNSYjA0OyHyXgfAEL3nwUm6MtGL+0WDK838mdOf8333xX45CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725625036; c=relaxed/simple;
	bh=jkARdfGFjKPa7xTSk9XZUCCG8FmUKLT4fQHW2/MAecE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tPwTojDclMI1nyZh9k/eKimIblPO9v7VeQ6NAVGUIO/QmO32n2JzMQ0RF4CEB7bcHcqhumvaAmUzvOWSqj5R/7rNjUScEMUUfrZoraHsFfMZbKaGRX886h2NSFJ4N2rvz+T4UbbvybgKbbIxn98otCOjE7glSMtmAStDygbQsCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1DVmyMf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1DVmyMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725625034; x=1757161034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jkARdfGFjKPa7xTSk9XZUCCG8FmUKLT4fQHW2/MAecE=;
  b=F1DVmyMfz2rvhbBIlQOFbhmYA1S1buOV6ThNM/isBLwKurch5HlYaBG3
   DXYB+yZHXjfVnQAY4Mo6b/athhvJoxnh8WnM62y05S2SrJS0Z11ipFuJs
   daX16gp6lnEsWgJVzF1aWRtp4Hjbk+478fngCmQyE/iUpuo9mCr2EDBOr
   PRSqGoo1YQySlTArJ5V7t+8g0nkf8EnAQFY6qqONfKN6w5rzJ6x44ZDL3
   DmfbDqfoDXYWNj51up6ucYADtyMkhIe4HNvcQgmVYxSa3MFrwKuGvU4Lq
   r5CU2vUeioH1UpzqhjzxcO3NkIuXpkNBQQnEkmGbfzw0H9xbKg9ZvaImy
   w==;
X-CSE-ConnectionGUID: dl/pWmRbT4eyAESe19SQpQ==
X-CSE-MsgGUID: sgLibBd/RfmGeVNdu1FYPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28130055"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="28130055"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 05:17:11 -0700
X-CSE-ConnectionGUID: otLI9PZQTRehcKv0jR7m1A==
X-CSE-MsgGUID: +BtAORS3R3yJRpH1JUsx8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70733573"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Sep 2024 05:17:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smXtk-000BAR-0Q;
	Fri, 06 Sep 2024 12:17:08 +0000
Date: Fri, 6 Sep 2024 20:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [nbd168-wireless:mt76 21/47]
 drivers/net/wireless/mediatek/mt76/tx.c:350:29: error: use of undeclared
 identifier 'IEEE80211_TX_CTRL_SCAN_TX'; did you mean
 'IEEE80211_TX_CTRL_AMSDU'?
Message-ID: <202409062056.p8rImddj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   cbb4ce62a1d578f134d443e7c7348a11044a7990
commit: a462e130db0953e5c21823e764142e3b1d514421 [21/47] wifi: mt76: add separate tx scheduling queue for off-channel tx
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240906/202409062056.p8rImddj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409062056.p8rImddj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409062056.p8rImddj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76/tx.c:6:
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/wireless/mediatek/mt76/tx.c:6:
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/wireless/mediatek/mt76/tx.c:6:
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/net/wireless/mediatek/mt76/tx.c:6:
   In file included from drivers/net/wireless/mediatek/mt76/mt76.h:12:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/net/wireless/mediatek/mt76/tx.c:350:29: error: use of undeclared identifier 'IEEE80211_TX_CTRL_SCAN_TX'; did you mean 'IEEE80211_TX_CTRL_AMSDU'?
     350 |             (info->control.flags & IEEE80211_TX_CTRL_SCAN_TX))
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    IEEE80211_TX_CTRL_AMSDU
   include/net/mac80211.h:1013:2: note: 'IEEE80211_TX_CTRL_AMSDU' declared here
    1013 |         IEEE80211_TX_CTRL_AMSDU                 = BIT(3),
         |         ^
   7 warnings and 1 error generated.


vim +350 drivers/net/wireless/mediatek/mt76/tx.c

   327	
   328	void
   329	mt76_tx(struct mt76_phy *phy, struct ieee80211_sta *sta,
   330		struct mt76_wcid *wcid, struct sk_buff *skb)
   331	{
   332		struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
   333		struct sk_buff_head *head;
   334	
   335		if (mt76_testmode_enabled(phy)) {
   336			ieee80211_free_txskb(phy->hw, skb);
   337			return;
   338		}
   339	
   340		if (WARN_ON(skb_get_queue_mapping(skb) >= MT_TXQ_PSD))
   341			skb_set_queue_mapping(skb, MT_TXQ_BE);
   342	
   343		if (wcid && !(wcid->tx_info & MT_WCID_TX_INFO_SET))
   344			ieee80211_get_tx_rates(info->control.vif, sta, skb,
   345					       info->control.rates, 1);
   346	
   347		info->hw_queue |= FIELD_PREP(MT_TX_HW_QUEUE_PHY, phy->band_idx);
   348	
   349		if ((info->flags & IEEE80211_TX_CTL_TX_OFFCHAN) ||
 > 350		    (info->control.flags & IEEE80211_TX_CTRL_SCAN_TX))
   351			head = &wcid->tx_offchannel;
   352		else
   353			head = &wcid->tx_pending;
   354	
   355		spin_lock_bh(&head->lock);
   356		__skb_queue_tail(head, skb);
   357		spin_unlock_bh(&head->lock);
   358	
   359		spin_lock_bh(&phy->tx_lock);
   360		if (list_empty(&wcid->tx_list))
   361			list_add_tail(&wcid->tx_list, &phy->tx_list);
   362		spin_unlock_bh(&phy->tx_lock);
   363	
   364		mt76_worker_schedule(&phy->dev->tx_worker);
   365	}
   366	EXPORT_SYMBOL_GPL(mt76_tx);
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

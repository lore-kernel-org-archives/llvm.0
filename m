Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF622D7DEF;
	Fri, 20 Feb 2026 20:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771620933; cv=none; b=BunEacpQigBdjFRfvhiRR2YMgo9+7Ku/JaiXf7oXApVqIewJBxLwRJ2m4eRt3Zg6kC6V8KlPjmI82fP0l7GUkcRP2wXbj7YK/n45wV8fNN8rQXBHYLQuIGvOuJziDlTkVSD1+W782ZsxFYt9lXZHEK0LgTD0lYWHUFGgfrUmjoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771620933; c=relaxed/simple;
	bh=2B9PvA9PLOng5t6/3OBjBvwHertpdqOM2x+eyj11d6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZXMw9R8F6Ik75Uyr6Wr2DqYiS6KqF5/XG8oN4U0qTpKcRVVSn3zfJeAx7ZQEIGDpOx3lAufv+We5Udm50TFAAfxpdG5yVK2Bx2IPZ0tCjXDlNlG4woN6u4kTgTEYenQwP9h84NPwRzaA00CN4rT0Euayr5bMJiJwTtYVGtK4oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OW8/T/mj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OW8/T/mj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771620932; x=1803156932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2B9PvA9PLOng5t6/3OBjBvwHertpdqOM2x+eyj11d6I=;
  b=OW8/T/mj514pwED67dHlmjzVgDLyjauf1OKUj9FlN1GjP1K903NuGgdX
   wquiUt3aL1/ldkhCJTqHk6yb8UPEaxR0oW8/943x5o80ca/PIagK2pz9h
   1tyf1bsdCv9pnA1N78Efg0aDaJc8FqKhKf+IQFw3IOO4U2SpO2HVKkvS6
   sZjVVc1ukSjjF/Y4endDJaRGXZKJkO3Ib46c5r5pbuD5CRb6TbaH0y2p8
   AFJCJtXzo/MZmWp5QWtMZ7XGJJbCONY0bmCQbt3niiTWQwojf8xQyeSOt
   Iv+rwy4dolTWhS5dL/U3Tqfft7yC/niKxA4V4Ya+la/A3ssPMHKzTfU25
   A==;
X-CSE-ConnectionGUID: WGNTxhiGQHek6wFOAvndoQ==
X-CSE-MsgGUID: bfp8p0RWSQWk8Z9pr3gVvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="71744235"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="71744235"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:55:31 -0800
X-CSE-ConnectionGUID: VtFnCuqRT/6SOfjIFz5yig==
X-CSE-MsgGUID: g39hb8R2Qs+7Q15tN8xHrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219954445"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Feb 2026 12:55:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtXX5-000000014TM-30Yl;
	Fri, 20 Feb 2026 20:55:27 +0000
Date: Sat, 21 Feb 2026 04:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/8] wifi: mac80211: change public RX API to use link
 stations
Message-ID: <202602210405.02r1qFBA-lkp@intel.com>
References: <20260220151929.61ef722ac889.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220151929.61ef722ac889.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid>

Hi Benjamin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.19 next-20260220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Berg/wifi-iwlwifi-use-link_sta-internally-to-the-driver/20260220-222422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260220151929.61ef722ac889.I4a2d45609e94b52654b10ec572e59a45d09c41f4%40changeid
patch subject: [RFC PATCH 2/8] wifi: mac80211: change public RX API to use link stations
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260221/202602210405.02r1qFBA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210405.02r1qFBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210405.02r1qFBA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mac80211.c:1522:25: error: incompatible pointer types passing 'struct ieee80211_sta *' to parameter of type 'struct ieee80211_link_sta *' [-Werror,-Wincompatible-pointer-types]
    1522 |                 ieee80211_rx_list(hw, sta, skb, &list);
         |                                       ^~~
   include/net/mac80211.h:5221:37: note: passing argument to parameter 'link_sta' here
    5221 |                        struct ieee80211_link_sta *link_sta,
         |                                                   ^
   drivers/net/wireless/mediatek/mt76/mac80211.c:1531:26: error: incompatible pointer types passing 'struct ieee80211_sta *' to parameter of type 'struct ieee80211_link_sta *' [-Werror,-Wincompatible-pointer-types]
    1531 |                         ieee80211_rx_list(hw, sta, skb, &list);
         |                                               ^~~
   include/net/mac80211.h:5221:37: note: passing argument to parameter 'link_sta' here
    5221 |                        struct ieee80211_link_sta *link_sta,
         |                                                   ^
   2 errors generated.
--
>> drivers/net/wireless/ath/ath11k/dp_rx.c:2503:28: error: incompatible pointer types passing 'struct ieee80211_sta *' to parameter of type 'struct ieee80211_link_sta *' [-Werror,-Wincompatible-pointer-types]
    2503 |         ieee80211_rx_napi(ar->hw, pubsta, msdu, napi);
         |                                   ^~~~~~
   include/net/mac80211.h:5250:37: note: passing argument to parameter 'link_sta' here
    5250 |                        struct ieee80211_link_sta *link_sta,
         |                                                   ^
   1 error generated.


vim +1522 drivers/net/wireless/mediatek/mt76/mac80211.c

d71ef28636e435 Felix Fietkau    2018-01-27  1506  
9d9d738b4b54c8 Felix Fietkau    2018-01-24  1507  void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
81e850ef2625cb Lorenzo Bianconi 2018-07-31  1508  		      struct napi_struct *napi)
17f1de56df0512 Felix Fietkau    2017-11-21  1509  {
9c68a57bc22d8c Felix Fietkau    2018-01-24  1510  	struct ieee80211_sta *sta;
bfc394dd65ef47 Felix Fietkau    2019-10-11  1511  	struct ieee80211_hw *hw;
3298b1f866fb41 Felix Fietkau    2020-07-25  1512  	struct sk_buff *skb, *tmp;
3298b1f866fb41 Felix Fietkau    2020-07-25  1513  	LIST_HEAD(list);
9d9d738b4b54c8 Felix Fietkau    2018-01-24  1514  
c3d7c82a8bb017 Felix Fietkau    2018-04-25  1515  	spin_lock(&dev->rx_lock);
9d9d738b4b54c8 Felix Fietkau    2018-01-24  1516  	while ((skb = __skb_dequeue(frames)) != NULL) {
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1517  		struct sk_buff *nskb = skb_shinfo(skb)->frag_list;
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1518  
3c1032e1221723 Felix Fietkau    2022-06-23  1519  		mt76_check_ccmp_pn(skb);
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1520  		skb_shinfo(skb)->frag_list = NULL;
bfc394dd65ef47 Felix Fietkau    2019-10-11  1521  		mt76_rx_convert(dev, skb, &hw, &sta);
3298b1f866fb41 Felix Fietkau    2020-07-25 @1522  		ieee80211_rx_list(hw, sta, skb, &list);
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1523  
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1524  		/* subsequent amsdu frames */
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1525  		while (nskb) {
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1526  			skb = nskb;
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1527  			nskb = nskb->next;
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1528  			skb->next = NULL;
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1529  
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1530  			mt76_rx_convert(dev, skb, &hw, &sta);
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1531  			ieee80211_rx_list(hw, sta, skb, &list);
cc4b3c139ad308 Lorenzo Bianconi 2020-10-11  1532  		}
9d9d738b4b54c8 Felix Fietkau    2018-01-24  1533  	}
c3d7c82a8bb017 Felix Fietkau    2018-04-25  1534  	spin_unlock(&dev->rx_lock);
3298b1f866fb41 Felix Fietkau    2020-07-25  1535  
3298b1f866fb41 Felix Fietkau    2020-07-25  1536  	if (!napi) {
3298b1f866fb41 Felix Fietkau    2020-07-25  1537  		netif_receive_skb_list(&list);
3298b1f866fb41 Felix Fietkau    2020-07-25  1538  		return;
3298b1f866fb41 Felix Fietkau    2020-07-25  1539  	}
3298b1f866fb41 Felix Fietkau    2020-07-25  1540  
3298b1f866fb41 Felix Fietkau    2020-07-25  1541  	list_for_each_entry_safe(skb, tmp, &list, list) {
3298b1f866fb41 Felix Fietkau    2020-07-25  1542  		skb_list_del_init(skb);
3298b1f866fb41 Felix Fietkau    2020-07-25  1543  		napi_gro_receive(napi, skb);
3298b1f866fb41 Felix Fietkau    2020-07-25  1544  	}
9d9d738b4b54c8 Felix Fietkau    2018-01-24  1545  }
9d9d738b4b54c8 Felix Fietkau    2018-01-24  1546  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

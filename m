Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDEF2B761;
	Tue, 24 Oct 2023 16:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBDVSbRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698166695; x=1729702695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1EwDa7coesaBPjJOS2L3hsnRGJdfNvpca2VWPqT6cSE=;
  b=TBDVSbRvfRR/ld2o77FSFYAyhEX3iZl+Ei6VRmgGX442rMf8T5d6ElXk
   0WL0f1e4Kuamd5LbW254AA+lpdoH/MiI3uhNspYiMzEa2l7O7xStTHczF
   84BH+8lF7MpEUxC6IPtr3F3eloj5YXRsaJ0XEU0Atr4jHxfjeTQUjlYz8
   mKAtjGK0MjZ6xyYcYcaE5b6GpvulnGGihTrxe+GUfXOq8si65WjcYb3UR
   ofS6wF7ef5yoEhCTGdyuo0NZXFwzVMGkME+Xy5dVplIDocxuCh7dRF746
   ShFotgnN/9AhvI9/B1dM1xnfKFLnTBJ7/y40vOc/OzSZ24+TtAB8LQptb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="366456350"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="366456350"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 09:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="787847844"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="787847844"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Oct 2023 09:58:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvKjK-00083h-0x;
	Tue, 24 Oct 2023 16:58:10 +0000
Date: Wed, 25 Oct 2023 00:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: greearb@candelatech.com, linux-wireless@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ben Greear <greearb@candelatech.com>
Subject: Re: [PATCH v2] wifi: mac80211: ethtool: use best available link for
 default stats.
Message-ID: <202310250024.SZSqLsNe-lkp@intel.com>
References: <20231020152353.3705759-1-greearb@candelatech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020152353.3705759-1-greearb@candelatech.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.6-rc7 next-20231024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/greearb-candelatech-com/wifi-mac80211-ethtool-use-best-available-link-for-default-stats/20231020-232523
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20231020152353.3705759-1-greearb%40candelatech.com
patch subject: [PATCH v2] wifi: mac80211: ethtool: use best available link for default stats.
config: mips-bmips_stb_defconfig (https://download.01.org/0day-ci/archive/20231025/202310250024.SZSqLsNe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250024.SZSqLsNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250024.SZSqLsNe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/mac80211/link.c:143:7: warning: variable 'sta1' is uninitialized when used here [-Wuninitialized]
     143 |                 if (sta1->sta_state > best_sta->sta_state) {
         |                     ^~~~
   net/mac80211/link.c:131:24: note: initialize the variable 'sta1' to silence this warning
     131 |                 struct sta_info *sta1;
         |                                      ^
         |                                       = NULL
   1 warning generated.


vim +/sta1 +143 net/mac80211/link.c

   117	
   118	/* For cases where we need a link for stats and such, and just want
   119	 * a 'good' one.
   120	 */
   121	struct sta_info *
   122	ieee80211_find_best_sta_link(struct ieee80211_sub_if_data *sdata,
   123				     struct ieee80211_link_data **link)
   124	{
   125		struct ieee80211_link_data *best_link = NULL;
   126		struct sta_info *best_sta = NULL;
   127		int i;
   128	
   129		for (i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
   130			struct ieee80211_link_data *link1;
   131			struct sta_info *sta1;
   132			bool sta1_better = false;
   133	
   134			link1 = sdata_dereference(sdata->link[i], sdata);
   135			if (!link1)
   136				continue;
   137			if (!best_link) {
   138				best_link = link1;
   139				best_sta = sta_info_get_bss(sdata, best_link->u.mgd.bssid);
   140				continue;
   141			}
   142			/* we have two potential best links, find one we like best. */
 > 143			if (sta1->sta_state > best_sta->sta_state) {
   144				sta1_better = true;
   145			} else if (sta1->sta_state == best_sta->sta_state) {
   146				u32 freq_best = 0;
   147				u32 freq1 = 0;
   148	
   149				if (best_link->conf->chandef.chan)
   150					freq_best = best_link->conf->chandef.chan->center_freq;
   151				if (link1->conf->chandef.chan)
   152					freq1 = link1->conf->chandef.chan->center_freq;
   153				if (freq1 > freq_best)
   154					sta1_better = true;
   155			}
   156	
   157			if (sta1_better) {
   158				best_sta = sta1;
   159				best_link = link1;
   160			}
   161		}
   162	
   163		*link = best_link;
   164		if (best_link)
   165			return sta_info_get_bss(sdata, best_link->u.mgd.bssid);
   166		return sta_info_get_bss(sdata, sdata->deflink.u.mgd.bssid);
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

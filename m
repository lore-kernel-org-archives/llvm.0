Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D561E4A1;
	Sat,  3 Aug 2024 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722689343; cv=none; b=osRS0f6lZL9caq0+rzCELF9eD3JmcPOjUBAjTfnqlJ1FF4DZi569grdZJLSKDg7evuRYXbGEI9SBf/ZFuBg2xVl4IHYtzD2V5sb83RLFg0nxXiI5RBxlnpI2DNOmWJuo7mexOgIoOMZ6UUl9m5n8CIdYAncwBycAWbQy4gZnYhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722689343; c=relaxed/simple;
	bh=4ypTbwFaMaAapWVugDJWMw/2z3G7kPHBB2HCQjHWrY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDihoEOfqfnD8fTKFyY1Z+TTxTedj+Y0mssXD/AaJBjy8xqdEgsOxVqTW+gIpy2R3tpItTrqXB3hifkAyunhGNWv8ICL6oeoqHX+IgVCk7g2c9ZJRhQU1JO5s2DHLVtXmGO44eqEHcVJFdhzALx1I9uV3X8HirLJk4gKekrLStI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STJpCAGH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STJpCAGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722689342; x=1754225342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4ypTbwFaMaAapWVugDJWMw/2z3G7kPHBB2HCQjHWrY0=;
  b=STJpCAGH01yjg/ZWLcoNJUSgJi/FLqtBQToRD0wV42S30LH0F78jw9y8
   Ng+xwGSJI7nXMJtGyrssIobDfad5DabI1EEF5PqVmhBHzxAfz2G67zxhc
   Vx3+8G3nJynTA6U9jl24au1Bdq0RNYjWm+YxUwzGocZe4WtwHsh06InoO
   YDaPW0RrQ6ypoxviPbq5eXI2Bg/O/XSJfxGqySxtzd6H2SV67zdbzGiGD
   tggzglLSBA9WqEoARluD+DzRNTBGvMlgINlYBw5PCotr52cHoolbgwp56
   GNRPD6b9Ic7YfE4N2DTOcncbXDGTrXn7/92oHkd17pK+EkYqYNuBTsz9x
   A==;
X-CSE-ConnectionGUID: EhZNA+WOQK2PXaBKmjhOlA==
X-CSE-MsgGUID: kcAJQpH1Sw6M4eD6C1h8hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="46103113"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="46103113"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 05:49:01 -0700
X-CSE-ConnectionGUID: cKw3QkZBQu2k4FBFp9xQ5Q==
X-CSE-MsgGUID: LD7N2yZFSXyjzTNr3I9Bkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60709588"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Aug 2024 05:48:59 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saEBt-0000SE-1h;
	Sat, 03 Aug 2024 12:48:57 +0000
Date: Sat, 3 Aug 2024 20:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Dharanenthiran <quic_mdharane@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 1/2] wifi: cfg80211/mac80211: Introduce nl80211
 commands to support MLD link removal offload
Message-ID: <202408032008.wvh67EBb-lkp@intel.com>
References: <20240731120635.2162332-2-quic_mdharane@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731120635.2162332-2-quic_mdharane@quicinc.com>

Hi Manish,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 338a93cf4a18c2036b567e9f613367f7a52f2511]

url:    https://github.com/intel-lab-lkp/linux/commits/Manish-Dharanenthiran/wifi-cfg80211-mac80211-Introduce-nl80211-commands-to-support-MLD-link-removal-offload/20240802-033454
base:   338a93cf4a18c2036b567e9f613367f7a52f2511
patch link:    https://lore.kernel.org/r/20240731120635.2162332-2-quic_mdharane%40quicinc.com
patch subject: [PATCH RFC v3 1/2] wifi: cfg80211/mac80211: Introduce nl80211 commands to support MLD link removal offload
config: i386-randconfig-003-20240803 (https://download.01.org/0day-ci/archive/20240803/202408032008.wvh67EBb-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408032008.wvh67EBb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408032008.wvh67EBb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/wireless/nl80211.c:20435:6: error: call to undeclared function 'nla_put_32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    20435 |             nla_put_32(msg, NL80211_ATTR_AP_REMOVAL_COUNT, tbtt_count) ||
          |             ^
   1 error generated.
--
   In file included from net/wireless/trace.c:5:
   In file included from net/wireless/trace.h:4151:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
>> net/wireless/trace.h:3060:5: error: use of undeclared identifier 'entry'
    3060 |                   entry->count)
         |                   ^
   1 error generated.


vim +/nla_put_32 +20435 net/wireless/nl80211.c

 20394	
 20395	int
 20396	cfg80211_update_link_reconfig_remove_update(struct net_device *netdev,
 20397						    unsigned int link_id,
 20398						    u32 tbtt_count, u64 tsf,
 20399						    enum nl80211_commands cmd)
 20400	{
 20401		struct wireless_dev *wdev = netdev->ieee80211_ptr;
 20402		struct wiphy *wiphy = wdev->wiphy;
 20403		struct cfg80211_registered_device *rdev = wiphy_to_rdev(wiphy);
 20404		struct sk_buff *msg;
 20405		void *hdr;
 20406	
 20407		/* Only for ML reconfigure link removal offloaded driver, need to
 20408		 * update the status about the ongoing link removal to userspace.
 20409		 */
 20410		if (!wiphy_ext_feature_isset(wiphy,
 20411					     NL80211_EXT_FEATURE_MLD_LINK_REMOVAL_OFFLOAD))
 20412			return -EOPNOTSUPP;
 20413	
 20414		if (link_id >= 0 || !(wdev->valid_links & BIT(link_id)))
 20415			return -EINVAL;
 20416	
 20417		trace_cfg80211_update_link_reconfig_remove_update(wiphy, netdev,
 20418								  link_id, tbtt_count,
 20419								  tsf, cmd);
 20420	
 20421		msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
 20422		if (!msg)
 20423			return -ENOMEM;
 20424	
 20425		hdr = nl80211hdr_put(msg, 0, 0, 0, cmd);
 20426	
 20427		if (!hdr)
 20428			goto nla_put_failure;
 20429	
 20430		if (nla_put_u32(msg, NL80211_ATTR_WIPHY, rdev->wiphy_idx) ||
 20431		    nla_put_u32(msg, NL80211_ATTR_IFINDEX, netdev->ifindex))
 20432			goto nla_put_failure;
 20433	
 20434		if (nla_put_u8(msg, NL80211_ATTR_MLO_LINK_ID, link_id) ||
 20435		    nla_put_32(msg, NL80211_ATTR_AP_REMOVAL_COUNT, tbtt_count) ||
 20436		    nla_put_u64_64bit(msg, NL80211_ATTR_TSF, tsf,
 20437				      NL80211_ATTR_PAD))
 20438			goto nla_put_failure;
 20439	
 20440		genlmsg_end(msg, hdr);
 20441	
 20442		genlmsg_multicast_netns(&nl80211_fam, wiphy_net(wiphy), msg, 0,
 20443					NL80211_MCGRP_MLME, GFP_ATOMIC);
 20444	
 20445		return 0;
 20446	
 20447	 nla_put_failure:
 20448		nlmsg_free(msg);
 20449	
 20450		return -EINVAL;
 20451	}
 20452	EXPORT_SYMBOL(cfg80211_update_link_reconfig_remove_update);
 20453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

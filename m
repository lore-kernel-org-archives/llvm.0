Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F2B2F35;
	Wed, 10 Jan 2024 05:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njCkMutQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704862829; x=1736398829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8A5b/u/MI8jYtPbHYMf6a0UozV2Q/QM1t+Lgaom5y18=;
  b=njCkMutQhXPv+lJYqFvtEGbllb0841D90sJwvoo8hryMpynlqK44m92s
   GnyMj54SbRubfAwLO9KClV6/obli+Gyd7OWef6JeBo+cqiNdVgDTX+alG
   KfJnPy8xZ4AfXxN9LX8wvntpjMWGMEjvucoh0+fW3EsB9xm2t4rOZ/fVM
   sPqTRvuHgYWMnfikksa9PbggiaFE8Cn9xTS5k52cYLIdItGhF/4KHJpU/
   9g5lK26SJ2o7iMi70yWmXfqhKuAUeatfRPFN4XgwBzJk5JnNhLvdRKcY4
   PyoDKtqc+CO14ppC0ssx1Wwv7eoiJ9D2Ik3MheqkIWIdube6cI2VJQBq0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5156142"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5156142"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 21:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="925507097"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="925507097"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2024 21:00:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNQf9-0006cX-19;
	Wed, 10 Jan 2024 04:58:51 +0000
Date: Wed, 10 Jan 2024 12:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5 66/73]
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5320:50: error: use of
 undeclared identifier 'IWL_TM_ATTR_MAX'; did you mean 'DCB_PG_ATTR_MAX'?
Message-ID: <202401101236.A4QoGBIS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git egrumbac_fixes_6.5
head:   62c3c8b5f77cbdf3d8f5cabf61afc9e8be0cfedf
commit: 59489cb42edffc67edbce229e9ac7c33eafb2212 [66/73] TESTMODE
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240110/202401101236.A4QoGBIS-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101236.A4QoGBIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101236.A4QoGBIS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5320:50: error: use of undeclared identifier 'IWL_TM_ATTR_MAX'; did you mean 'DCB_PG_ATTR_MAX'?
    5320 | static const struct nla_policy iwl_mvm_tm_policy[IWL_TM_ATTR_MAX + 1] = {
         |                                                  ^~~~~~~~~~~~~~~
         |                                                  DCB_PG_ATTR_MAX
   include/uapi/linux/dcbnl.h:571:2: note: 'DCB_PG_ATTR_MAX' declared here
     571 |         DCB_PG_ATTR_MAX = __DCB_PG_ATTR_ENUM_MAX - 1,
         |         ^
>> drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5321:3: error: use of undeclared identifier 'IWL_TM_ATTR_CMD'
    5321 |         [IWL_TM_ATTR_CMD] = { .type = NLA_U32 },
         |          ^
>> drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5322:3: error: use of undeclared identifier 'IWL_TM_ATTR_NOA_DURATION'
    5322 |         [IWL_TM_ATTR_NOA_DURATION] = { .type = NLA_U32 },
         |          ^
>> drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5323:3: error: use of undeclared identifier 'IWL_TM_ATTR_BEACON_FILTER_STATE'
    5323 |         [IWL_TM_ATTR_BEACON_FILTER_STATE] = { .type = NLA_U32 },
         |          ^
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5330:20: error: use of undeclared identifier 'IWL_TM_ATTR_MAX'; did you mean 'DCB_PG_ATTR_MAX'?
    5330 |         struct nlattr *tb[IWL_TM_ATTR_MAX + 1];
         |                           ^~~~~~~~~~~~~~~
         |                           DCB_PG_ATTR_MAX
   include/uapi/linux/dcbnl.h:571:2: note: 'DCB_PG_ATTR_MAX' declared here
     571 |         DCB_PG_ATTR_MAX = __DCB_PG_ATTR_ENUM_MAX - 1,
         |         ^
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5334:22: error: use of undeclared identifier 'IWL_TM_ATTR_MAX'; did you mean 'DCB_PG_ATTR_MAX'?
    5334 |         err = nla_parse(tb, IWL_TM_ATTR_MAX, data, len, iwl_mvm_tm_policy,
         |                             ^~~~~~~~~~~~~~~
         |                             DCB_PG_ATTR_MAX
   include/uapi/linux/dcbnl.h:571:2: note: 'DCB_PG_ATTR_MAX' declared here
     571 |         DCB_PG_ATTR_MAX = __DCB_PG_ATTR_ENUM_MAX - 1,
         |         ^
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5339:10: error: use of undeclared identifier 'IWL_TM_ATTR_CMD'
    5339 |         if (!tb[IWL_TM_ATTR_CMD])
         |                 ^
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5342:25: error: use of undeclared identifier 'IWL_TM_ATTR_CMD'
    5342 |         switch (nla_get_u32(tb[IWL_TM_ATTR_CMD])) {
         |                                ^
>> drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5343:7: error: use of undeclared identifier 'IWL_TM_CMD_SET_NOA'
    5343 |         case IWL_TM_CMD_SET_NOA:
         |              ^
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5346:11: error: use of undeclared identifier 'IWL_TM_ATTR_NOA_DURATION'
    5346 |                     !tb[IWL_TM_ATTR_NOA_DURATION])
         |                         ^
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5349:33: error: use of undeclared identifier 'IWL_TM_ATTR_NOA_DURATION'
    5349 |                 noa_duration = nla_get_u32(tb[IWL_TM_ATTR_NOA_DURATION]);
         |                                               ^
>> drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5362:7: error: use of undeclared identifier 'IWL_TM_CMD_SET_BEACON_FILTER'
    5362 |         case IWL_TM_CMD_SET_BEACON_FILTER:
         |              ^
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5366:11: error: use of undeclared identifier 'IWL_TM_ATTR_BEACON_FILTER_STATE'
    5366 |                     !tb[IWL_TM_ATTR_BEACON_FILTER_STATE])
         |                         ^
   drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:5369:22: error: use of undeclared identifier 'IWL_TM_ATTR_BEACON_FILTER_STATE'
    5369 |                 if (nla_get_u32(tb[IWL_TM_ATTR_BEACON_FILTER_STATE]))
         |                                    ^
   14 errors generated.


vim +5320 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c

8ca151b568b67a drivers/net/wireless/iwlwifi/mvm/mac80211.c       Johannes Berg     2013-01-24  5318  
93a3c02830e001 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-08  5319  #ifdef CONFIG_NL80211_TESTMODE
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07 @5320  static const struct nla_policy iwl_mvm_tm_policy[IWL_TM_ATTR_MAX + 1] = {
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07 @5321  	[IWL_TM_ATTR_CMD] = { .type = NLA_U32 },
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07 @5322  	[IWL_TM_ATTR_NOA_DURATION] = { .type = NLA_U32 },
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07 @5323  	[IWL_TM_ATTR_BEACON_FILTER_STATE] = { .type = NLA_U32 },
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5324  };
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5325  
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5326  static int __iwl_mvm_mac_testmode_cmd(struct iwl_mvm *mvm,
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5327  				      struct ieee80211_vif *vif,
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5328  				      void *data, int len)
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5329  {
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5330  	struct nlattr *tb[IWL_TM_ATTR_MAX + 1];
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5331  	int err;
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5332  	u32 noa_duration;
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5333  
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5334  	err = nla_parse(tb, IWL_TM_ATTR_MAX, data, len, iwl_mvm_tm_policy,
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5335  			NULL);
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5336  	if (err)
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5337  		return err;
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5338  
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5339  	if (!tb[IWL_TM_ATTR_CMD])
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5340  		return -EINVAL;
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5341  
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5342  	switch (nla_get_u32(tb[IWL_TM_ATTR_CMD])) {
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07 @5343  	case IWL_TM_CMD_SET_NOA:
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5344  		if (!vif || vif->type != NL80211_IFTYPE_AP || !vif->p2p ||
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5345  		    !vif->bss_conf.enable_beacon ||
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5346  		    !tb[IWL_TM_ATTR_NOA_DURATION])
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5347  			return -EINVAL;
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5348  
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5349  		noa_duration = nla_get_u32(tb[IWL_TM_ATTR_NOA_DURATION]);
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5350  		if (noa_duration >= vif->bss_conf.beacon_int)
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5351  			return -EINVAL;
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5352  
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5353  		mvm->noa_duration = noa_duration;
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5354  		mvm->noa_vif = vif;
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5355  
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5356  		if (fw_has_capa(&mvm->fw->ucode_capa,
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5357  				IWL_UCODE_TLV_CAPA_DYNAMIC_QUOTA)) {
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5358  			return -EOPNOTSUPP;
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5359  		}
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5360  
22b2104193da5e drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Shaul Triebitz    2017-11-30  5361  		return iwl_mvm_update_quotas(mvm, true, NULL);
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07 @5362  	case IWL_TM_CMD_SET_BEACON_FILTER:
f6c6ad42b5e8b1 drivers/net/wireless/iwlwifi/mvm/mac80211.c       Johannes Berg     2013-08-01  5363  		/* must be associated client vif - ignore authorized */
f6c6ad42b5e8b1 drivers/net/wireless/iwlwifi/mvm/mac80211.c       Johannes Berg     2013-08-01  5364  		if (!vif || vif->type != NL80211_IFTYPE_STATION ||
f276e20b182dbf drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Johannes Berg     2022-05-10  5365  		    !vif->cfg.assoc || !vif->bss_conf.dtim_period ||
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5366  		    !tb[IWL_TM_ATTR_BEACON_FILTER_STATE])
f6c6ad42b5e8b1 drivers/net/wireless/iwlwifi/mvm/mac80211.c       Johannes Berg     2013-08-01  5367  			return -EINVAL;
f6c6ad42b5e8b1 drivers/net/wireless/iwlwifi/mvm/mac80211.c       Johannes Berg     2013-08-01  5368  
38ffad1e804808 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c Emmanuel Grumbach 2024-01-07  5369  		if (nla_get_u32(tb[IWL_TM_ATTR_BEACON_FILTER_STATE]))
a1022927194673 drivers/net/wireless/iwlwifi/mvm/mac80211.c       Emmanuel Grumbach 2014-05-12  5370  			return iwl_mvm_enable_beacon_filter(mvm, vif, 0);
a1022927194673 drivers/net/wireless/iwlwifi/mvm/mac80211.c       Emmanuel Grumbach 2014-05-12  5371  		return iwl_mvm_disable_beacon_filter(mvm, vif, 0);
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5372  	}
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5373  
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5374  	return -EOPNOTSUPP;
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5375  }
507cadf262fe67 drivers/net/wireless/iwlwifi/mvm/mac80211.c       David Spinadel    2013-07-31  5376  

:::::: The code at line 5320 was first introduced by commit
:::::: 38ffad1e8048085517946d1230f7e249b6c0db72 MVM_CORE80

:::::: TO: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
:::::: CC: Emmanuel Grumbach <emmanuel.grumbach@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

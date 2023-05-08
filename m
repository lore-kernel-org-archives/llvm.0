Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551DE64C;
	Mon,  8 May 2023 12:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683549934; x=1715085934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+KtEtYBIACKhe7ZemsS23/h6q0xm2gpJKENhwXr8X2k=;
  b=Q5VqoEdIhKNEEnvQc38oQfgWf4XiAwjlf5uLMsj9sEG+9zRZTYFNhMy0
   GecNsONn4h89b2oqEJ8ZVpoO+5Du6kKOXsCVBrxWOnrf2qImS/R/tG8Vb
   3KxQ+47RZ0PQ/nn8Yo3yvvPgjdSyuOowg7HZagcPVjbJHT/vFIHkm+HME
   GYfbivNZUMu3wb/Ob7BlNmwka0NAeu9xNvzX+mI7HiGWNDr/GIWctEbqw
   p9MSAHWzbh7IV5nDrEq7fad52as7PBCwNPyx2xSng1VRAqiW47v0KsxBy
   QaAf9nsknixnH7JZQkE/LBMrLEuSKj3Xwy7b3FdI5GlpOreIdpwSXL/HO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="338855829"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="338855829"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 05:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="822655640"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="822655640"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 May 2023 05:45:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pw0F9-0001EP-2W;
	Mon, 08 May 2023 12:45:31 +0000
Date: Mon, 8 May 2023 20:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: gregory.greenman@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 14/14] wifi: iwlwifi: pass the esr_transition_timeout to
 the firmware
Message-ID: <202305082018.cQc25gTk-lkp@intel.com>
References: <20230508082433.1349733-15-gregory.greenman@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508082433.1349733-15-gregory.greenman@intel.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on linus/master v6.4-rc1 next-20230508]
[cannot apply to wireless/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/gregory-greenman-intel-com/wifi-iwlwifi-cfg-freeze-22500-devices-FW-API/20230508-162844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230508082433.1349733-15-gregory.greenman%40intel.com
patch subject: [PATCH 14/14] wifi: iwlwifi: pass the esr_transition_timeout to the firmware
config: powerpc-randconfig-r021-20230507 (https://download.01.org/0day-ci/archive/20230508/202305082018.cQc25gTk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/1ac56fb6e9434d3a390309308d2c74f112fa1e2a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review gregory-greenman-intel-com/wifi-iwlwifi-cfg-freeze-22500-devices-FW-API/20230508-162844
        git checkout 1ac56fb6e9434d3a390309308d2c74f112fa1e2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/wireless/intel/iwlwifi/mvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305082018.cQc25gTk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c:137:25: error: no member named 'eml_cap' in 'struct ieee80211_vif_cfg'
                   u16_get_bits(vif->cfg.eml_cap,
                                ~~~~~~~~ ^
   1 error generated.


vim +137 drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c

    93	
    94	static int iwl_mvm_mld_mac_ctxt_cmd_sta(struct iwl_mvm *mvm,
    95						struct ieee80211_vif *vif,
    96						u32 action, bool force_assoc_off)
    97	{
    98		struct iwl_mac_config_cmd cmd = {};
    99	
   100		WARN_ON(vif->type != NL80211_IFTYPE_STATION);
   101	
   102		/* Fill the common data for all mac context types */
   103		iwl_mvm_mld_mac_ctxt_cmd_common(mvm, vif, &cmd, action);
   104	
   105		/*
   106		 * We always want to hear MCAST frames, if we're not authorized yet,
   107		 * we'll drop them.
   108		 */
   109		cmd.filter_flags |= cpu_to_le32(MAC_CFG_FILTER_ACCEPT_GRP);
   110	
   111		if (vif->p2p)
   112			cmd.client.ctwin =
   113				iwl_mvm_mac_ctxt_cmd_p2p_sta_get_oppps_ctwin(mvm, vif);
   114	
   115		if (vif->cfg.assoc && !force_assoc_off) {
   116			struct iwl_mvm_vif *mvmvif = iwl_mvm_vif_from_mac80211(vif);
   117	
   118			cmd.client.is_assoc = 1;
   119	
   120			if (!mvmvif->authorized &&
   121			    fw_has_capa(&mvm->fw->ucode_capa,
   122					IWL_UCODE_TLV_CAPA_COEX_HIGH_PRIO))
   123				cmd.client.data_policy |=
   124					cpu_to_le16(COEX_HIGH_PRIORITY_ENABLE);
   125	
   126		} else {
   127			cmd.client.is_assoc = 0;
   128	
   129			/* Allow beacons to pass through as long as we are not
   130			 * associated, or we do not have dtim period information.
   131			 */
   132			cmd.filter_flags |= cpu_to_le32(MAC_CFG_FILTER_ACCEPT_BEACON);
   133		}
   134	
   135		cmd.client.assoc_id = cpu_to_le16(vif->cfg.aid);
   136		cmd.client.esr_transition_timeout =
 > 137			u16_get_bits(vif->cfg.eml_cap,
   138				     IEEE80211_EML_CAP_TRANSITION_TIMEOUT);
   139	
   140		if (vif->probe_req_reg && vif->cfg.assoc && vif->p2p)
   141			cmd.filter_flags |= cpu_to_le32(MAC_CFG_FILTER_ACCEPT_PROBE_REQ);
   142	
   143		if (vif->bss_conf.he_support && !iwlwifi_mod_params.disable_11ax)
   144			cmd.client.data_policy |=
   145				cpu_to_le16(iwl_mvm_mac_ctxt_cmd_sta_get_twt_policy(mvm, vif));
   146	
   147		return iwl_mvm_mld_mac_ctxt_send_cmd(mvm, &cmd);
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

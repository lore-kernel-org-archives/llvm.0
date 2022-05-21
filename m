Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A0517FC
	for <llvm@lists.linux.dev>; Sat, 21 May 2022 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653128138; x=1684664138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Gr3zUd4VttCHVwQpL+PQl+w2BgS1wp1Fe/pd4Fz6kg=;
  b=HHtKiAlx5fEembnCfdsixNXXXqyPSTrmFqQE887Pjpg2LNLUl1znXhC/
   7PKIvxIqBvlpoCtjbr3z5VlM2neKw3JmJohkWRrslLoRpU5ixa0yANZZZ
   jLfki2t+5iRmiLjKKY2MoxYNGdQcz9qTVHYJ3VfOg7X3XxJpUroLqSYym
   jXlC9OP6RlUGo555/tsNayD82rkIEEcxbhIb6aMU1o/rX4PXgsWUjVtMD
   JylURTx+z1o5RoK6Gl452zm3jk61TVfkzlJHW7bInGF9tWqKk7+3KEHvx
   L/dMvtyCKiPkJ+RHrKhr5i1dPH39q28cWMfZAQe/xnl/HCyRQ1IApzKfA
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="253349824"
X-IronPort-AV: E=Sophos;i="5.91,242,1647327600"; 
   d="scan'208";a="253349824"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 03:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,242,1647327600"; 
   d="scan'208";a="743864615"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 May 2022 03:15:35 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nsM91-0006BG-BR;
	Sat, 21 May 2022 10:15:35 +0000
Date: Sat, 21 May 2022 18:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: Wojciech Drewek <wojciech.drewek@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-wired-lan] [PATCH net] ice: Fix switchdev rules book
 keeping
Message-ID: <202205211832.w3XhaNbS-lkp@intel.com>
References: <20220520084527.123885-1-wojciech.drewek@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520084527.123885-1-wojciech.drewek@intel.com>

Hi Wojciech,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Wojciech-Drewek/ice-Fix-switchdev-rules-book-keeping/20220520-164759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 9b80ccda233fa6c59de411bf889cc4d0e028f2c7
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220521/202205211832.w3XhaNbS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e04c52f89a78dfae78ac79a71f0c92df8c409146
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wojciech-Drewek/ice-Fix-switchdev-rules-book-keeping/20220520-164759
        git checkout e04c52f89a78dfae78ac79a71f0c92df8c409146
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/intel/ice/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_tc_lib.c:527:8: error: no member named 'dest_vsi_handle' in 'struct ice_tc_flower_fltr'
           fltr->dest_vsi_handle = rule_added.vsi_handle;
           ~~~~  ^
   1 error generated.


vim +527 drivers/net/ethernet/intel/ice/ice_tc_lib.c

   452	
   453	static int
   454	ice_eswitch_add_tc_fltr(struct ice_vsi *vsi, struct ice_tc_flower_fltr *fltr)
   455	{
   456		struct ice_tc_flower_lyr_2_4_hdrs *headers = &fltr->outer_headers;
   457		struct ice_adv_rule_info rule_info = { 0 };
   458		struct ice_rule_query_data rule_added;
   459		struct ice_hw *hw = &vsi->back->hw;
   460		struct ice_adv_lkup_elem *list;
   461		u32 flags = fltr->flags;
   462		int lkups_cnt;
   463		int ret;
   464		int i;
   465	
   466		if (!flags || (flags & ICE_TC_FLWR_FIELD_ENC_SRC_L4_PORT)) {
   467			NL_SET_ERR_MSG_MOD(fltr->extack, "Unsupported encap field(s)");
   468			return -EOPNOTSUPP;
   469		}
   470	
   471		lkups_cnt = ice_tc_count_lkups(flags, headers, fltr);
   472		list = kcalloc(lkups_cnt, sizeof(*list), GFP_ATOMIC);
   473		if (!list)
   474			return -ENOMEM;
   475	
   476		i = ice_tc_fill_rules(hw, flags, fltr, list, &rule_info, NULL);
   477		if (i != lkups_cnt) {
   478			ret = -EINVAL;
   479			goto exit;
   480		}
   481	
   482		/* egress traffic is always redirect to uplink */
   483		if (fltr->direction == ICE_ESWITCH_FLTR_EGRESS)
   484			fltr->dest_vsi = vsi->back->switchdev.uplink_vsi;
   485	
   486		rule_info.sw_act.fltr_act = fltr->action.fltr_act;
   487		if (fltr->action.fltr_act != ICE_DROP_PACKET)
   488			rule_info.sw_act.vsi_handle = fltr->dest_vsi->idx;
   489		/* For now, making priority to be highest, and it also becomes
   490		 * the priority for recipe which will get created as a result of
   491		 * new extraction sequence based on input set.
   492		 * Priority '7' is max val for switch recipe, higher the number
   493		 * results into order of switch rule evaluation.
   494		 */
   495		rule_info.priority = 7;
   496	
   497		if (fltr->direction == ICE_ESWITCH_FLTR_INGRESS) {
   498			rule_info.sw_act.flag |= ICE_FLTR_RX;
   499			rule_info.sw_act.src = hw->pf_id;
   500			rule_info.rx = true;
   501		} else {
   502			rule_info.sw_act.flag |= ICE_FLTR_TX;
   503			rule_info.sw_act.src = vsi->idx;
   504			rule_info.rx = false;
   505			rule_info.flags_info.act = ICE_SINGLE_ACT_LAN_ENABLE;
   506			rule_info.flags_info.act_valid = true;
   507		}
   508	
   509		/* specify the cookie as filter_rule_id */
   510		rule_info.fltr_rule_id = fltr->cookie;
   511	
   512		ret = ice_add_adv_rule(hw, list, lkups_cnt, &rule_info, &rule_added);
   513		if (ret == -EEXIST) {
   514			NL_SET_ERR_MSG_MOD(fltr->extack, "Unable to add filter because it already exist");
   515			ret = -EINVAL;
   516			goto exit;
   517		} else if (ret) {
   518			NL_SET_ERR_MSG_MOD(fltr->extack, "Unable to add filter due to error");
   519			goto exit;
   520		}
   521	
   522		/* store the output params, which are needed later for removing
   523		 * advanced switch filter
   524		 */
   525		fltr->rid = rule_added.rid;
   526		fltr->rule_id = rule_added.rule_id;
 > 527		fltr->dest_vsi_handle = rule_added.vsi_handle;
   528	
   529	exit:
   530		kfree(list);
   531		return ret;
   532	}
   533	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

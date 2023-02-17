Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F41D7F;
	Fri, 17 Feb 2023 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676652992; x=1708188992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zUzqZHnZap0rlwfa1T1MAtGEVUjSeqORzMeIG9HuwUY=;
  b=AqTwZHXemB9DjMd4ml4PVf8wHyeNf6KMwi0855a4Brwr1mJpzmFhR0+/
   0yH2ps8SOzkaTO7rK/G8EjZf9C1lTQk69DMoyBSutvzXT2ssuz48Xx6G5
   5kRkBwlYPesQrcdYCqDL2I24kFU2l8HWHjv6RfO9WZO6jRr8lUCRN0UzT
   5Z/AHPQE1q+C1TiUj9vDPEFWPB+SJlEiAF+wo+1B2ixOgV4pWcgTP4FVY
   JYMunbTxLQykAv411/2n2yG0zqlClJwhs7fAa3XacB2hSCDLVbJT6ZRPT
   5R5naPsuN5jI9EBdUZewMRLZlaNcFwGtFwnpwoyM9j055pCf2RmAqi/xB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="312399187"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="312399187"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 08:56:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="794450452"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="794450452"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Feb 2023 08:56:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT427-000Bex-1z;
	Fri, 17 Feb 2023 16:56:27 +0000
Date: Sat, 18 Feb 2023 00:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-audio-wsa881x-gpio 70/76]
 drivers/soundwire/qcom.c:843:20: warning: use of logical '&&' with constant
 operand
Message-ID: <202302180056.Rg8FKIwB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
head:   04e5048badb91c86b22993d0d9fd1bf8b79c0d91
commit: a9f731feabf401a6953a6446b8832a02916c6fbe [70/76] soundwire: sample interval 16 bit
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20230218/202302180056.Rg8FKIwB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/a9f731feabf401a6953a6446b8832a02916c6fbe
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
        git checkout a9f731feabf401a6953a6446b8832a02916c6fbe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/soundwire/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180056.Rg8FKIwB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soundwire/qcom.c:331:6: warning: unused variable 'rd_fifo_outstanding_cmds' [-Wunused-variable]
           u32 rd_fifo_outstanding_cmds;
               ^
>> drivers/soundwire/qcom.c:843:20: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
           value |= pcfg->si && 0xff;
                             ^  ~~~~
   drivers/soundwire/qcom.c:843:20: note: use '&' for a bitwise operation
           value |= pcfg->si && 0xff;
                             ^~
                             &
   drivers/soundwire/qcom.c:843:20: note: remove constant to silence this warning
           value |= pcfg->si && 0xff;
                            ~^~~~~~~
   2 warnings generated.


vim +843 drivers/soundwire/qcom.c

   828	
   829	static int qcom_swrm_transport_params(struct sdw_bus *bus,
   830					      struct sdw_transport_params *params,
   831					      enum sdw_reg_bank bank)
   832	{
   833		struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
   834		struct qcom_swrm_port_config *pcfg;
   835		u32 value;
   836		int reg = SWRM_DP_PORT_CTRL_BANK((params->port_num), bank);
   837		int ret;
   838	
   839		pcfg = &ctrl->pconfig[params->port_num];
   840	
   841		value = pcfg->off1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
   842		value |= pcfg->off2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
 > 843		value |= pcfg->si && 0xff;
   844	
   845		ret = ctrl->reg_write(ctrl, reg, value);
   846		if (ret)
   847			goto err;
   848	
   849		if (pcfg->lane_control != SWR_INVALID_PARAM) {
   850			reg = SWRM_DP_PORT_CTRL_2_BANK(params->port_num, bank);
   851			value = pcfg->lane_control;
   852			ret = ctrl->reg_write(ctrl, reg, value);
   853			if (ret)
   854				goto err;
   855		}
   856	
   857		if (pcfg->blk_group_count != SWR_INVALID_PARAM) {
   858			reg = SWRM_DP_BLOCK_CTRL2_BANK(params->port_num, bank);
   859			value = pcfg->blk_group_count;
   860			ret = ctrl->reg_write(ctrl, reg, value);
   861			if (ret)
   862				goto err;
   863		}
   864	
   865		if (pcfg->hstart != SWR_INVALID_PARAM
   866				&& pcfg->hstop != SWR_INVALID_PARAM) {
   867			reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
   868			value = (pcfg->hstop << 4) | pcfg->hstart;
   869			ret = ctrl->reg_write(ctrl, reg, value);
   870		} else {
   871			reg = SWRM_DP_PORT_HCTRL_BANK(params->port_num, bank);
   872			value = (SWR_HSTOP_MAX_VAL << 4) | SWR_HSTART_MIN_VAL;
   873			ret = ctrl->reg_write(ctrl, reg, value);
   874		}
   875	
   876		if (ret)
   877			goto err;
   878	
   879		if (pcfg->bp_mode != SWR_INVALID_PARAM) {
   880			reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
   881			ret = ctrl->reg_write(ctrl, reg, pcfg->bp_mode);
   882		}
   883	
   884	err:
   885		return ret;
   886	}
   887	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

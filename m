Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188452118
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 11:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651662468; x=1683198468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uiLbHLxiGXNW6OESnecCcNJLWQSiF+MKfCJxeylLQB4=;
  b=RiXB7oP6bXt861S2jA8QnpiggBSXV5eFKMRWAczpuv6MOIBQ6sbdBWrY
   1+sn3GwddjL4AKyf6VcJh5EHgHTNpwPaffMf8K1nU/wthuGdL++82+iYo
   EKGLvW7XzMOsOkioNN20ley3MF3NaoefC4k6PPh0zcTtyUwForRyOkGGF
   5m9L8O3gw6WhlIcriReyvNTCGaNGDaw3ks/3QA3dYauqX/XfyvSi0G2FB
   nGlOgYxfA2jgBiebh1FLLZPpigWfKhJHqWKng2QVH936yu+GME3QDPMQL
   +hvJrrcRoQOdZeoHA9kJR5Rz3nub1QB8h6KwuFASutmTThSgy+Xey1HLl
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="354169636"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="354169636"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 04:07:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="548624233"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 May 2022 04:07:45 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmCrA-000BKr-VX;
	Wed, 04 May 2022 11:07:44 +0000
Date: Wed, 4 May 2022 19:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [andersson:wip/sc8180x-next-20220502 6/29]
 drivers/gpu/drm/msm/dp/dp_hpd.c:63:53: warning: converting the enum constant
 to a boolean
Message-ID: <202205041920.TXQhAxL4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/andersson/kernel wip/sc8180x-next-20220502
head:   6199153320a3b7d1dce23ad1ea4d894a86793cb6
commit: be6e31f126bed33f684250905b79d76f7664d985 [6/29] drm/msm/dp: Add typec_mux implementation
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220504/202205041920.TXQhAxL4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/andersson/kernel/commit/be6e31f126bed33f684250905b79d76f7664d985
        git remote add andersson https://github.com/andersson/kernel
        git fetch --no-tags andersson wip/sc8180x-next-20220502
        git checkout be6e31f126bed33f684250905b79d76f7664d985
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dp/dp_hpd.c:63:53: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
                   usbpd->multi_func = pin_assign == DP_PIN_ASSIGN_C || DP_PIN_ASSIGN_E;
                                                                     ^
   1 warning generated.


vim +63 drivers/gpu/drm/msm/dp/dp_hpd.c

    52	
    53	static int dp_hpd_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
    54	{
    55		struct dp_hpd_private *dp_hpd = typec_mux_get_drvdata(mux);
    56		struct dp_usbpd *usbpd = &dp_hpd->dp_usbpd;
    57		struct typec_displayport_data *dp_data = state->data;
    58		int pin_assign = 0;
    59	
    60		if (dp_data) {
    61			pin_assign = DP_CONF_GET_PIN_ASSIGN(dp_data->conf);
    62			usbpd->hpd_irq = !!(dp_data->status & DP_STATUS_IRQ_HPD);
  > 63			usbpd->multi_func = pin_assign == DP_PIN_ASSIGN_C || DP_PIN_ASSIGN_E;
    64		}
    65	
    66		if (!pin_assign) {
    67			if (dp_hpd->connected) {
    68				dp_hpd->connected = false;
    69				dp_hpd->dp_cb->disconnect(dp_hpd->dev);
    70			}
    71		} else if (!dp_hpd->connected) {
    72			dp_hpd->connected = true;
    73			dp_hpd->dp_cb->configure(dp_hpd->dev);
    74		} else {
    75			dp_hpd->dp_cb->attention(dp_hpd->dev);
    76		}
    77	
    78		return 0;
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

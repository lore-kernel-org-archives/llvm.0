Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E342B37A;
	Wed,  8 Feb 2023 00:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675817326; x=1707353326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pl0K1EfCJvRiGHFuIMwtjsM+I02eG8qUaAxD6P8vj9Q=;
  b=BaKo/19mzRJK6uujk9k0xgyOpE1PWbmHxfkecJAd5k2Xd41X0oMbfo/S
   kTnocWrJ3Yqm/Pl51Pt52QykPryzxrs1iaYCkc0tRYG1PSWS9ETkcSpiu
   Dd7O7D/Boy89DQyr2TsaQ3e3JZ9ehOEEmtRAcPRvP239x0IJ+61ziZmoq
   xvXBdmvESo6jSL+OabIugnD+/vEmhHxyBg0O7cAhiHt5f1F0KSmiq2qdJ
   iVBt/lnFySkNvCiiByiQwBiAxzc4zvSCKd4fN/0zwmWpmdp9nrGlrZKxY
   YM/Z+xXgElcTnWwm8B8pW7nLEmsZQUw43vO+71mOHOdaZMuifFkvus23o
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="328322331"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="328322331"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 16:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="809748487"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="809748487"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2023 16:48:41 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPYdc-000414-2s;
	Wed, 08 Feb 2023 00:48:40 +0000
Date: Wed, 8 Feb 2023 08:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk-github:wip/sm8450-2 18/50] drivers/soundwire/qcom.c:331:6:
 warning: unused variable 'rd_fifo_outstanding_cmds'
Message-ID: <202302080849.tOIK5uyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/sm8450-2
head:   750232dcf0dc606e698c8c9644cb079472293a36
commit: 13fd6e2c4ab057e562dd79e1bcba098a1a0febc9 [18/50] soundwire: qcom: wait for fifo to be empty before
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230208/202302080849.tOIK5uyo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/13fd6e2c4ab057e562dd79e1bcba098a1a0febc9
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-2
        git checkout 13fd6e2c4ab057e562dd79e1bcba098a1a0febc9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/soundwire/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/soundwire/qcom.c:331:6: warning: unused variable 'rd_fifo_outstanding_cmds' [-Wunused-variable]
           u32 rd_fifo_outstanding_cmds;
               ^
   1 warning generated.


vim +/rd_fifo_outstanding_cmds +331 drivers/soundwire/qcom.c

   327	
   328	static bool swrm_wait_for_wr_fifo_done(struct qcom_swrm_ctrl *swrm)
   329	{
   330		u32 fifo_outstanding_cmds, value;
 > 331		u32 rd_fifo_outstanding_cmds;
   332		int fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT*2;
   333	
   334		/* Check for fifo overflow during write */
   335		swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
   336		fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
   337	
   338		if (fifo_outstanding_cmds) {
   339			while (fifo_retry_count) {
   340				usleep_range(500, 510);
   341				swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
   342				fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
   343				fifo_retry_count--;
   344				if (fifo_outstanding_cmds == 0)
   345					return true;
   346			}
   347		} else {
   348			return true;
   349		}
   350	
   351	
   352		return false;
   353	}
   354	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

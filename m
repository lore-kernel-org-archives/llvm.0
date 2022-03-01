Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5055CAB
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646151497; x=1677687497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99PDWrnZC+94sUm2Of52rgGL0LZDuPgk1v8mjahoKLg=;
  b=VC+/FWzDcRX23f2yaL0kMHWPJR7eyVx/evQyA8tri+Ze+fKrqDhO85t3
   UB4VmxWx4qiPkFjaFhsURREcyV4RlbCoSfmLhWnLWQ0lqz/KWckvizLix
   rX6WH8R06TOsgro4AvEJhP7MxXqt7C+fKCXd9kW8z/aDtfoK3bsHwO8ft
   Z2DFE7KiSeCfvPSgl3xvb28had6qEBrS13Owj365lbzdc2sEuWDWrRIX/
   UMP3Wq8yar0Zkixz93ZcMb8OcwF9nj/+1jNokfr2a3TofH7G7Z/1X2ZrW
   0X+x8r6MDBo88SD1096xCaVrwKMcMbH/rPe8sXjP4BWqb5Xg94vC/16NT
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="316381392"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="316381392"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 08:17:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="493160719"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Mar 2022 08:17:42 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nP5C1-0000h9-Ub; Tue, 01 Mar 2022 16:17:41 +0000
Date: Wed, 2 Mar 2022 00:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hemant Kumar <hemantk@codeaurora.org>,
	Alex Elder <elder@linaro.org>
Subject: [mani-mhi:mhi-next 12/30] drivers/bus/mhi/host/../common.h:278:28:
 warning: 'const' type qualifier on return type has no effect
Message-ID: <202203020002.8Of9vVDg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
head:   b85d0d28ed263a5421f698d5c7bd513c7b6d8b97
commit: ed97144182117586712c8036ded0bab36898eae0 [12/30] bus: mhi: Make mhi_state_str[] array static inline and move to common.h
config: hexagon-randconfig-r036-20220301 (https://download.01.org/0day-ci/archive/20220302/202203020002.8Of9vVDg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/commit/?id=ed97144182117586712c8036ded0bab36898eae0
        git remote add mani-mhi https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
        git fetch --no-tags mani-mhi mhi-next
        git checkout ed97144182117586712c8036ded0bab36898eae0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/bus/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/bus/mhi/host/init.c:21:
   In file included from drivers/bus/mhi/host/internal.h:10:
>> drivers/bus/mhi/host/../common.h:278:28: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
   static inline const char * const mhi_state_str(enum mhi_state state)
                              ^~~~~~
   1 warning generated.


vim +/const +278 drivers/bus/mhi/host/../common.h

   277	
 > 278	static inline const char * const mhi_state_str(enum mhi_state state)
   279	{
   280		switch (state) {
   281		case MHI_STATE_RESET:
   282			return "RESET";
   283		case MHI_STATE_READY:
   284			return "READY";
   285		case MHI_STATE_M0:
   286			return "M0";
   287		case MHI_STATE_M1:
   288			return "M1";
   289		case MHI_STATE_M2:
   290			return "M2";
   291		case MHI_STATE_M3:
   292			return "M3";
   293		case MHI_STATE_M3_FAST:
   294			return "M3 FAST";
   295		case MHI_STATE_BHI:
   296			return "BHI";
   297		case MHI_STATE_SYS_ERR:
   298			return "SYS ERROR";
   299		default:
   300			return "Unknown state";
   301		}
   302	};
   303	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5056F28E9
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652198907; x=1683734907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bAh3WJmCp5NTIqxc6IUYDZLmG+5NOa+aaHz6HMfWXqM=;
  b=L2/8Nqkz45fCoA+lK18Qsr5IDceZVWJl0a8YZrVZLePlOk24UpQWRHaL
   8XnfcsfhuPtkX1quMrDCjp3r9bVRoqS/wYudL257qWZDrEDNyIHJAd9x3
   4E0Km068yfC/i/DztVMEgdJh8GpXeKz9i3Wdjv3BS2jCtKvDGBbzTOkUk
   35oxu+N6pnSezhoIpWXYNN1GOO8ZpwPBVnANNXty+H4b3BRFY8MHOz1+x
   Ey29HmtM1chHK8mhMk4QPuLA7wAIq673B4q0+dPsj1aUZl2GWNcb7fkSg
   eggmWfh4Ud5GSwfCgBf+GgtI0StYsEGzCA/QtJ1qsjmxkfsu2hT55faXl
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="268262364"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="268262364"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 09:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="552905905"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 May 2022 09:07:10 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noSOE-000I7A-3o;
	Tue, 10 May 2022 16:07:10 +0000
Date: Wed, 11 May 2022 00:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
	mani@kernel.org, jassisinghbrar@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	agross@kernel.org, Prasad Sodagudi <quic_psodagud@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>
Subject: Re: [PATCH] mailbox: qcom-ipcc: Log the pending interrupt during
 resume
Message-ID: <202205102334.mtvIIqAz-lkp@intel.com>
References: <1652168893-11814-1-git-send-email-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652168893-11814-1-git-send-email-quic_sibis@quicinc.com>

Hi Sibi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sibi-Sankar/mailbox-qcom-ipcc-Log-the-pending-interrupt-during-resume/20220510-155032
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9be9ed2612b5aedb52a2c240edb1630b6b743cb6
config: arm-randconfig-r015-20220509 (https://download.01.org/0day-ci/archive/20220510/202205102334.mtvIIqAz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/5389a3f93e441ca9fed19981d15d5e74708aaa4f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sibi-Sankar/mailbox-qcom-ipcc-Log-the-pending-interrupt-during-resume/20220510-155032
        git checkout 5389a3f93e441ca9fed19981d15d5e74708aaa4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "irq_to_desc" [drivers/mailbox/qcom-ipcc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

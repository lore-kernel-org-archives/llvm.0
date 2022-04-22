Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8761FBA
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 00:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650586116; x=1682122116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vKQKRGNX/LjG7VONiUEUdfNSavJK5wTiNpc5+4uauOI=;
  b=XKkUPlgM940M2+zrkbIPIzlyhzfmkLW3Z4/zaVmg0iVBWdD8E5SATcTe
   TaQyvvWQsz4Mv8gDz83HxxI816fq3sVu4vXN03lGrWUojfx/Ht9TZ/biw
   VWMOzHy9euo/tph91Nte9zIjAvpIQ9Ogw1o2gKeO4c51xAUJ3Txp4JpUr
   tY+vd8FxcI1mkhQLEfG+VbuBkWfU5xYqYYOnYcEDCvGLChY25LEkmaz2Z
   LBFkuZ1RlWJwks0Lf3Ve1Fqz6G2jX6MED+OQ3hLWSM2He7aWyEJBtJ78k
   sbPUd+j+vc0n7QcNVWfJEtFraygl5/YlLov0vd3Xfhqw2qs45wBJ6JTa3
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="327429656"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="327429656"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 17:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; 
   d="scan'208";a="562808264"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2022 17:08:28 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhgqZ-0008zc-Hz;
	Fri, 22 Apr 2022 00:08:27 +0000
Date: Fri, 22 Apr 2022 08:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Etienne Carriere <etienne.carriere@linaro.org>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [PATCH v2] firmware: arm_scmi: support optee shared memory in
 optee transport
Message-ID: <202204220711.5cl9KJrB-lkp@intel.com>
References: <20220421074935.7549-1-etienne.carriere@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421074935.7549-1-etienne.carriere@linaro.org>

Hi Etienne,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v5.18-rc3 next-20220421]
[cannot apply to linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Etienne-Carriere/firmware-arm_scmi-support-optee-shared-memory-in-optee-transport/20220421-155132
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: arm64-randconfig-r034-20220421 (https://download.01.org/0day-ci/archive/20220422/202204220711.5cl9KJrB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8baa12e16d3e48bce0e6d86e8c7d0415439b7c98
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Etienne-Carriere/firmware-arm_scmi-support-optee-shared-memory-in-optee-transport/20220421-155132
        git checkout 8baa12e16d3e48bce0e6d86e8c7d0415439b7c98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: msg_tx_prepare
   >>> referenced by optee.c
   >>> firmware/arm_scmi/optee.o:(scmi_optee_send_message) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: msg_command_size
   >>> referenced by optee.c
   >>> firmware/arm_scmi/optee.o:(scmi_optee_send_message) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: msg_fetch_response
   >>> referenced by optee.c
   >>> firmware/arm_scmi/optee.o:(scmi_optee_fetch_response) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

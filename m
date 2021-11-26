Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F6A2C80
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 04:02:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="222829210"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="222829210"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 20:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="475787410"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Nov 2021 20:02:07 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqSR4-0007SM-Hi; Fri, 26 Nov 2021 04:02:06 +0000
Date: Fri, 26 Nov 2021 12:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: John Clements <john.clements@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Guchun Chen <guchun.chen@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:503:6: warning: no previous
 prototype for function 'release_psp_cmd_buf'
Message-ID: <202111261214.H4DeEf8u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ced7ca3570333998ad2088d5a6275701970e28e
commit: 4b296527549853eae8f1f0e010eaaea511ab00d7 drm/amdgpu: added synchronization for psp cmd buf access
date:   4 months ago
config: i386-randconfig-a015-20210927 (https://download.01.org/0day-ci/archive/20211126/202111261214.H4DeEf8u-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8dfdfe7efecfda318d43a06fae18b40eb498)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4b296527549853eae8f1f0e010eaaea511ab00d7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4b296527549853eae8f1f0e010eaaea511ab00d7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:503:6: warning: no previous prototype for function 'release_psp_cmd_buf' [-Wmissing-prototypes]
   void release_psp_cmd_buf(struct psp_context *psp)
        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:503:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void release_psp_cmd_buf(struct psp_context *psp)
   ^
   static 
   1 warning generated.


vim +/release_psp_cmd_buf +503 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c

   502	
 > 503	void release_psp_cmd_buf(struct psp_context *psp)
   504	{
   505		mutex_unlock(&psp->mutex);
   506	}
   507	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

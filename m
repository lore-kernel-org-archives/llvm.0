Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A3ED314;
	Sat, 25 Feb 2023 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677299302; x=1708835302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=te/bLMFC+ad3usrtYehgltClN4zNHNHe7W87Dqj4ZrE=;
  b=TOKmvWYvJseqhqWmxn9fNETQg+haQBhsHj0zlqV+ct3MkhqAJKAzW+uO
   vCjnzIHkjqkHteHohyt5jGvPU9q8FAmA1lK3t27C1692b6lOND09ZaHiu
   AjPPAd/V3hZvOeYWidzPcZ28idG7dLYKv45hQ+rOlkNDPYQZCutAwTN3j
   ZDI67Oqzcm7HXQ8q5p6eyz+l9EgOV7zCoYE1Kg1zeQSMpF3ah9rt17BUR
   yi29BU9cGtDUSDKnbbcEqOVJSvzCzeqYldJlcnCHXUdnU7eOoS9KVRxAg
   ajTYjAIaa4eIbgCepxxEzL/aKQ5IkjynhI1bclee7Nrd7J0L9gT0Zi6Jx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335064544"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="335064544"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 20:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="918639507"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="918639507"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Feb 2023 20:28:18 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVmAT-0002ux-0K;
	Sat, 25 Feb 2023 04:28:17 +0000
Date: Sat, 25 Feb 2023 12:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jun Lei <Jun.Lei@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.17.y 1413/3797]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3758: warning: expecting
 prototype for dc_process_dmub_aux_transfer_async(). Prototype was for
 dc_enable_dmub_notifications() instead
Message-ID: <202302251239.rED0rLbQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.17.y
head:   eed68052d2016d9f96d6656435099762608120e3
commit: aa43167f2b49b3ef03e2f45f1cd281cdc87800a5 [1413/3797] drm/amd/display: Fix for dmub outbox notification enable
config: riscv-randconfig-r042-20230222 (https://download.01.org/0day-ci/archive/20230225/202302251239.rED0rLbQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=aa43167f2b49b3ef03e2f45f1cd281cdc87800a5
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.17.y
        git checkout aa43167f2b49b3ef03e2f45f1cd281cdc87800a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251239.rED0rLbQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:419: warning: Cannot understand  *****************************************************************************
    on line 419 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3758: warning: Function parameter or member 'dc' not described in 'dc_enable_dmub_notifications'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3758: warning: expecting prototype for dc_process_dmub_aux_transfer_async(). Prototype was for dc_enable_dmub_notifications() instead
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3763: warning: Cannot understand  *****************************************************************************
    on line 3763 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3784: warning: Cannot understand  *****************************************************************************
    on line 3784 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3874: warning: Cannot understand  *****************************************************************************
    on line 3874 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3924: warning: Cannot understand  *****************************************************************************
    on line 3924 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3988: warning: Cannot understand  *****************************************************************************
    on line 3988 - I thought it was a doc line


vim +3758 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

  3740	
  3741	/**
  3742	 * dc_process_dmub_aux_transfer_async - Submits aux command to dmub via inbox message
  3743	 *  Function: dc_enable_dmub_notifications
  3744	 *
  3745	 *  @brief
  3746	 *		Calls dc_is_dmub_outbox_supported to check if dmub fw supports outbox
  3747	 *		notifications. All DMs shall switch to dc_is_dmub_outbox_supported.
  3748	 *		This API shall be removed after switching.
  3749	 *
  3750	 *  @param
  3751	 *		[in] dc: dc structure
  3752	 *
  3753	 *  @return
  3754	 *		True if DMUB FW supports outbox notifications, False otherwise
  3755	 *****************************************************************************
  3756	 */
  3757	bool dc_enable_dmub_notifications(struct dc *dc)
> 3758	{
  3759		return dc_is_dmub_outbox_supported(dc);
  3760	}
  3761	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

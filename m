Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD03D70
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 12:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645101891; x=1676637891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6I4uNyQ5OGvawN/1J46NLUeQcTKMzNeP+URspA++iko=;
  b=iK/D4+sMMlmGjMyE9/EOPSJdFhyF5raulnuXMumPMzB+wNQiSFnybRg3
   zWYPLzVLDRT7OzRJ3tuOHO+eY3P7AQ5jvz4mbfm80KNqABiolsh68Ix0i
   J9HQM4ntpAyWd66LCsBZwWA1SFpO+bjuyqZJYtnN6k8NXUhs3Idbof8mE
   HQZV83VWQDrX/ZoBnN8QClLjS+fil8DaKSRRRZOHjttmGSYK1fNSmxbGp
   1xcEf5hjV/PKEpO/b07zv1fYs/SCM9K7xjit26wvRGbUvjmmgvbVZi2TW
   Jgixd/kZ+wtHXdx+TwiyM4Psa8LEJf97t0iUYBv91GV5adfX30v1VvNYD
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="234394515"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="234394515"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 04:44:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="488213072"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Feb 2022 04:44:49 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKg9Q-0000C9-W9; Thu, 17 Feb 2022 12:44:48 +0000
Date: Thu, 17 Feb 2022 20:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Subject: [linux-next:master 6160/6564]
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3757: warning: expecting
 prototype for dc_process_dmub_aux_transfer_async(). Prototype was for
 dc_enable_dmub_notifications() instead
Message-ID: <202202172044.WGiceNKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c30cf91b5ecc7272b3d2942ae0505dd8320b81c
commit: ed7208706448953c6f15009cf139135776c15713 [6160/6564] drm/amd/display: Fix for dmub outbox notification enable
config: s390-randconfig-r044-20220217 (https://download.01.org/0day-ci/archive/20220217/202202172044.WGiceNKS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7cb56526f2572c74449fcf97c1fcda42b41d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ed7208706448953c6f15009cf139135776c15713
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ed7208706448953c6f15009cf139135776c15713
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:419: warning: Cannot understand  *****************************************************************************
    on line 419 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3757: warning: Function parameter or member 'dc' not described in 'dc_enable_dmub_notifications'
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3757: warning: expecting prototype for dc_process_dmub_aux_transfer_async(). Prototype was for dc_enable_dmub_notifications() instead
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3762: warning: Cannot understand  *****************************************************************************
    on line 3762 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3783: warning: Cannot understand  *****************************************************************************
    on line 3783 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3873: warning: Cannot understand  *****************************************************************************
    on line 3873 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3923: warning: Cannot understand  *****************************************************************************
    on line 3923 - I thought it was a doc line
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3987: warning: Cannot understand  *****************************************************************************
    on line 3987 - I thought it was a doc line


vim +3757 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

  3739	
  3740	/**
  3741	 * dc_process_dmub_aux_transfer_async - Submits aux command to dmub via inbox message
  3742	 *  Function: dc_enable_dmub_notifications
  3743	 *
  3744	 *  @brief
  3745	 *		Calls dc_is_dmub_outbox_supported to check if dmub fw supports outbox
  3746	 *		notifications. All DMs shall switch to dc_is_dmub_outbox_supported.
  3747	 *		This API shall be removed after switching.
  3748	 *
  3749	 *  @param
  3750	 *		[in] dc: dc structure
  3751	 *
  3752	 *  @return
  3753	 *		True if DMUB FW supports outbox notifications, False otherwise
  3754	 *****************************************************************************
  3755	 */
  3756	bool dc_enable_dmub_notifications(struct dc *dc)
> 3757	{
  3758		return dc_is_dmub_outbox_supported(dc);
  3759	}
  3760	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413310791;
	Thu, 19 Jan 2023 22:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674165631; x=1705701631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BGvMe5XZTO7EPe0aA0+lFd4ZQG2rCjnj5LJpTL7waa8=;
  b=ZSgrj5Vcr4Rb8+eW9zqHtHUKk+GRoljuKr4UGYVmtGxykH0w7jX1DQeu
   BFUXi8km5+/kQKgC9ti/vsuB0ZhehbH3mNL/FGrQviAUcv4hhdcLmrwdj
   L50FOqvkmDHPkouZUKTyuSUhvQb3L2UpsPXWHBfrHWPErBj0NxYqnU1tm
   DZglVv7vXw/Ftj0kNHNVsJyWMNYsufuSzCZgsMoDsp5oVTXsWucrOKLoU
   7wYYDTALy41Uy2skyA15AZp225IKjSpySWMeupOVV1oClyGjgN/OGNAMB
   qsW6y3uq2l5NtGMLu+jOxjz7gJE8FJPE0c2ZJEbmyt6Fzr0rqTY0uMSP2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323128829"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="323128829"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 14:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="784225128"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="784225128"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jan 2023 14:00:25 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIcxM-0001to-2n;
	Thu, 19 Jan 2023 22:00:24 +0000
Date: Fri, 20 Jan 2023 06:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
	vkoul@kernel.org, alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	Mario.Limonciello@amd.com, Mastan.Katragadda@amd.com,
	arungopal.kondaveeti@amd.com,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/19] soundwire: amd: add soundwire interrupt handling
Message-ID: <202301200537.eS27M0By-lkp@intel.com>
References: <20230111090222.2016499-6-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111090222.2016499-6-Vijendar.Mukunda@amd.com>

Hi Vijendar,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20230119]
[cannot apply to vkoul-dmaengine/next linus/master v6.2-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vijendar-Mukunda/ASoC-amd-ps-create-platform-devices-based-on-acp-config/20230111-170749
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230111090222.2016499-6-Vijendar.Mukunda%40amd.com
patch subject: [PATCH 05/19] soundwire: amd: add soundwire interrupt handling
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230120/202301200537.eS27M0By-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ee04e2b3a1ee45081b430ae161c53aa8964d5c36
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vijendar-Mukunda/ASoC-amd-ps-create-platform-devices-based-on-acp-config/20230111-170749
        git checkout ee04e2b3a1ee45081b430ae161c53aa8964d5c36
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/soundwire/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

                         ^~~~~~~~~
   drivers/soundwire/amd_master.c:610:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/soundwire/amd_master.c:610:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/soundwire/amd_master.c:610:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:358:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/soundwire/amd_master.c:610:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:129:30: note: expanded from macro 'FIELD_GET'
                   (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
                                              ^~~~~
   drivers/soundwire/amd_master.c:610:26: warning: shift count is negative [-Wshift-count-negative]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
                         ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/amd_master.h:184:38: note: expanded from macro 'AMD_SDW_MCP_SLAVE_STAT_4_11'
   #define AMD_SDW_MCP_SLAVE_STAT_4_11             GENMASK(39, 24)
                                                   ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/linux/bitfield.h:129:50: note: expanded from macro 'FIELD_GET'
                   (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
                                                         ~~~~~~~~~^~~~~~
   include/linux/bitfield.h:45:38: note: expanded from macro '__bf_shf'
   #define __bf_shf(x) (__builtin_ffsll(x) - 1)
                                        ^
>> drivers/soundwire/amd_master.c:1223:80: warning: shift count >= width of type [-Wshift-count-overflow]
           slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STATUS_8TO_11, status_change_8to11) << 32;
                                                                                         ^  ~~
   23 warnings generated.


vim +1223 drivers/soundwire/amd_master.c

  1212	
  1213	static void amd_sdwc_update_slave_status(u32 status_change_0to7, u32 status_change_8to11,
  1214						 struct amd_sdwc_ctrl *ctrl)
  1215	{
  1216		u64 slave_stat = 0;
  1217		u32 val = 0;
  1218		int dev_index;
  1219	
  1220		if (status_change_0to7 == AMD_SDW_SLAVE_0_ATTACHED)
  1221			memset(ctrl->status, 0, sizeof(ctrl->status));
  1222		slave_stat = status_change_0to7;
> 1223		slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STATUS_8TO_11, status_change_8to11) << 32;
  1224		dev_dbg(ctrl->dev, "%s: status_change_0to7:0x%x status_change_8to11:0x%x\n",
  1225			__func__, status_change_0to7, status_change_8to11);
  1226		if (slave_stat) {
  1227			for (dev_index = 0; dev_index <= SDW_MAX_DEVICES; ++dev_index) {
  1228				if (slave_stat & AMD_SDW_MCP_SLAVE_STATUS_VALID_MASK(dev_index)) {
  1229					val = (slave_stat >> AMD_SDW_MCP_SLAVE_STAT_SHIFT_MASK(dev_index)) &
  1230					      AMD_SDW_MCP_SLAVE_STATUS_MASK;
  1231					switch (val) {
  1232					case SDW_SLAVE_ATTACHED:
  1233						ctrl->status[dev_index] = SDW_SLAVE_ATTACHED;
  1234						break;
  1235					case SDW_SLAVE_UNATTACHED:
  1236						ctrl->status[dev_index] = SDW_SLAVE_UNATTACHED;
  1237						break;
  1238					case SDW_SLAVE_ALERT:
  1239						ctrl->status[dev_index] = SDW_SLAVE_ALERT;
  1240						break;
  1241					default:
  1242						ctrl->status[dev_index] = SDW_SLAVE_RESERVED;
  1243						break;
  1244					}
  1245				}
  1246			}
  1247		}
  1248	}
  1249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

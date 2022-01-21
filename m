Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8895168
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642763625; x=1674299625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6/XoDsiAEGuHpK+jGVoHx897KAxeOEzK5nRuOM7D7XQ=;
  b=mkWRjHR3zBGUkmTl2mmmnH20rh+6uRM7kKb91LCU8/in+fRq8DjLf1Bt
   Q0+s/uDloxFagmQLzMjmTrPAYxX5V8/RUmhdkinfKCKfx6Zf93NP2+yY9
   owiAwIydjTJxuV3QqayPGvndWTSjKgF6p1JKrHgyrUQzPILNmXR4z5i08
   DqC8pFTBs/9VZQbHE1N801g3Bj6sC3WV6r8FVd2z4Y/FgJsuoNX/5tLVO
   bbpZt3CHHdt7pQ9YglWAbs40Rso0n7fQNfkw6v+BbSJ/F4lr5kV9XEA/l
   nBr74QSsLwnOzfhOSs4VuwmXHbltAsNsc731Zq5hicQUS+wQEzvID0CoO
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="331983752"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="331983752"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 03:13:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="561843357"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Jan 2022 03:13:43 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nArrS-000FEB-UM; Fri, 21 Jan 2022 11:13:42 +0000
Date: Fri, 21 Jan 2022 19:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Beckett <bob.beckett@collabora.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 4/5] drm/i915: add gtt misalignment test
Message-ID: <202201211905.O4FxXbsX-lkp@intel.com>
References: <20220120203721.632424-5-bob.beckett@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120203721.632424-5-bob.beckett@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Robert,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next v5.16 next-20220121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Robert-Beckett/discrete-card-64K-page-support/20220121-044244
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a005-20220117 (https://download.01.org/0day-ci/archive/20220121/202201211905.O4FxXbsX-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e7a6d547c26b78357dbad93dc9d8df90bc51d025
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Robert-Beckett/discrete-card-64K-page-support/20220121-044244
        git checkout e7a6d547c26b78357dbad93dc9d8df90bc51d025
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_gem_gtt.c:296:
>> drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:1146:49: error: implicit conversion from enumeration type 'enum intel_region_id' to different enumeration type 'enum intel_memory_type' [-Werror,-Wenum-conversion]
                   u64 min_alignment = i915_vm_min_alignment(vm, id);
                                       ~~~~~~~~~~~~~~~~~~~~~     ^~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_CS35L41_SPI
   Depends on SOUND && !UML && SND && SND_SOC && SPI_MASTER
   Selected by
   - SND_SOC_AMD_VANGOGH_MACH && SOUND && !UML && SND && SND_SOC && SND_SOC_AMD_ACP5x && I2C


vim +1146 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c

  1131	
  1132	static int misaligned_pin(struct i915_address_space *vm,
  1133				  u64 hole_start, u64 hole_end,
  1134				  unsigned long end_time)
  1135	{
  1136		struct intel_memory_region *mr;
  1137		enum intel_region_id id;
  1138		unsigned long flags = PIN_OFFSET_FIXED | PIN_USER;
  1139		int err = 0;
  1140		u64 hole_size = hole_end - hole_start;
  1141	
  1142		if (i915_is_ggtt(vm))
  1143			flags |= PIN_GLOBAL;
  1144	
  1145		for_each_memory_region(mr, vm->i915, id) {
> 1146			u64 min_alignment = i915_vm_min_alignment(vm, id);
  1147			u64 size = min_alignment;
  1148			u64 addr = round_up(hole_start + (hole_size / 2), min_alignment);
  1149	
  1150			/* we can't test < 4k alignment due to flags being encoded in lower bits */
  1151			if (min_alignment != I915_GTT_PAGE_SIZE_4K) {
  1152				err = misaligned_case(vm, mr, addr + (min_alignment / 2), size, flags);
  1153				/* misaligned should error with -EINVAL*/
  1154				if (!err)
  1155					err = -EBADSLT;
  1156				if (err != -EINVAL)
  1157					return err;
  1158			}
  1159	
  1160			/* test for vma->size expansion to min page size */
  1161			err = misaligned_case(vm, mr, addr, PAGE_SIZE, flags);
  1162			if (min_alignment > hole_size) {
  1163				if (!err)
  1164					err = -EBADSLT;
  1165				else if (err == -ENOSPC)
  1166					err = 0;
  1167			}
  1168			if (err)
  1169				return err;
  1170	
  1171			/* test for intermediate size not expanding vma->size for large alignments */
  1172			err = misaligned_case(vm, mr, addr, size / 2, flags);
  1173			if (min_alignment > hole_size) {
  1174				if (!err)
  1175					err = -EBADSLT;
  1176				else if (err == -ENOSPC)
  1177					err = 0;
  1178			}
  1179			if (err)
  1180				return err;
  1181		}
  1182	
  1183		return 0;
  1184	}
  1185	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C188129CA
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 00:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642724276; x=1674260276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lrAbD2UBE56ko9dBCfVyCmV2sNMRWfCr9MAKgCa/8qo=;
  b=f4EQdNtuhYH0MWqO4DFXx52LglVdtLb4gN9prIRpZXoNL9jmGFiJvE8q
   WgjaaOoUFS3KjeWQKatAtAglBurg2naTgqnZ8Blel3YRozR5ydFIXlHqb
   2yKV6t6YwAATDX5GW4Upx4WuSnJVr/sGUguI50qz8AteWMpR7c74i0go2
   23exb9cOnRxc5JkGjSi1fPYa7ESE80Z5YsgLLceqr0XUh1mbKLteH8cOZ
   kVl5eLTB7OtcMnISZ3sJrlACMOOocg0I1Mh/mX8zTH5wdXJdk4aoNaGRf
   NfmJzDDjopar11zUojhRWLktUzu8qpX9pDzen7oUmrENNENBvLICeJR6a
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245309200"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; 
   d="scan'208";a="245309200"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 16:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; 
   d="scan'208";a="694443790"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2022 16:17:23 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAhcI-000EjG-V9; Fri, 21 Jan 2022 00:17:22 +0000
Date: Fri, 21 Jan 2022 08:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	dri-devel <dri-devel@lists.freedesktop.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add needs_compact_pt flag
Message-ID: <202201210857.CAeUyl4W-lkp@intel.com>
References: <20220120162102.10652-1-ramalingam.c@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220120162102.10652-1-ramalingam.c@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Ramalingam,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm-exynos/exynos-drm-next drm/drm-next next-20220120]
[cannot apply to tegra-drm/drm/tegra/for-next airlied/drm-next v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ramalingam-C/drm-i915-Add-needs_compact_pt-flag/20220121-002256
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220121/202201210857.CAeUyl4W-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/cf1a6660ac07b3b3618b35dccab57042d592ea2c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ramalingam-C/drm-i915-Add-needs_compact_pt-flag/20220121-002256
        git checkout cf1a6660ac07b3b3618b35dccab57042d592ea2c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:18:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc.h:19:
>> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:12:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_gem.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:18:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc.h:19:
   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:13:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_vma.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:18:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
>> drivers/gpu/drm/i915/gt/uc/intel_guc.h:20:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_utils.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:18:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   drivers/gpu/drm/i915/gt/uc/intel_guc.h:21:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_vma.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:18:
>> drivers/gpu/drm/i915/gt/uc/intel_uc.h:10:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_guc_rc.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:18:
   drivers/gpu/drm/i915/gt/uc/intel_uc.h:11:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_guc_submission.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:18:
   drivers/gpu/drm/i915/gt/uc/intel_uc.h:12:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_guc_slpc.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:18:
   drivers/gpu/drm/i915/gt/uc/intel_uc.h:13:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_huc.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:18:
   drivers/gpu/drm/i915/gt/uc/intel_uc.h:14:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_params.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
>> drivers/gpu/drm/i915/gt/intel_gt_types.h:20:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_vma.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   drivers/gpu/drm/i915/gt/intel_gt_types.h:21:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_engine_types.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   drivers/gpu/drm/i915/gt/intel_gt_types.h:22:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_gt_buffer_pool_types.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   drivers/gpu/drm/i915/gt/intel_gt_types.h:23:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_llc_types.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   drivers/gpu/drm/i915/gt/intel_gt_types.h:24:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_reset_types.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   drivers/gpu/drm/i915/gt/intel_gt_types.h:25:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_rc6_types.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   drivers/gpu/drm/i915/gt/intel_gt_types.h:26:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_rps_types.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   drivers/gpu/drm/i915/gt/intel_gt_types.h:27:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_migrate_types.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   drivers/gpu/drm/i915/gt/intel_gt_types.h:28:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_wakeref.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:83:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   drivers/gpu/drm/i915/gt/intel_gt_types.h:29:2: error: embedding a #include directive within macro arguments is not supported
   #include "pxp/intel_pxp_types.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:12:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc.h:19:
>> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:12:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_gem.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:12:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc.h:19:
   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:13:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_vma.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:12:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
>> drivers/gpu/drm/i915/gt/uc/intel_guc.h:20:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_utils.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:12:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   drivers/gpu/drm/i915/gt/uc/intel_guc.h:21:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_vma.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:12:
>> drivers/gpu/drm/i915/gt/uc/intel_uc.h:10:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_guc_rc.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:12:
   drivers/gpu/drm/i915/gt/uc/intel_uc.h:11:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_guc_submission.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:12:
   drivers/gpu/drm/i915/gt/uc/intel_uc.h:12:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_guc_slpc.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:12:
   drivers/gpu/drm/i915/gt/uc/intel_uc.h:13:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_huc.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:12:
   drivers/gpu/drm/i915/gt/uc/intel_uc.h:14:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_params.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
>> drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:13:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_uc_debugfs.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
>> drivers/gpu/drm/i915/intel_device_info.h:201:25: error: unterminated function-like macro invocation
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   drivers/gpu/drm/i915/intel_device_info.h:200:9: note: macro 'DEFINE_FLAG' defined here
   #define DEFINE_FLAG(name) u8 name:1
           ^
>> drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:59:2: error: expected '}'
   }
    ^
   drivers/gpu/drm/i915/intel_device_info.h:179:26: note: to match this '{'
   struct intel_device_info {
                            ^
>> drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c:59:2: error: expected ';' after struct
   }
    ^
   13 errors generated.
--
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:11:
>> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:12:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_gem.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:11:
   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:13:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_vma.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
>> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:12:2: error: embedding a #include directive within macro arguments is not supported
   #include "intel_uc_fw_abi.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:13:2: error: embedding a #include directive within macro arguments is not supported
   #include "i915_drv.h"
    ^
   drivers/gpu/drm/i915/intel_device_info.h:201:25: note: expansion of macro 'DEFINE_FLAG' requested here
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
>> drivers/gpu/drm/i915/intel_device_info.h:201:25: error: unterminated function-like macro invocation
           DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
                                  ^
   drivers/gpu/drm/i915/intel_device_info.h:200:9: note: macro 'DEFINE_FLAG' defined here
   #define DEFINE_FLAG(name) u8 name:1
           ^
>> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:794:2: error: expected '}'
   }
    ^
   drivers/gpu/drm/i915/intel_device_info.h:179:26: note: to match this '{'
   struct intel_device_info {
                            ^
>> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c:794:2: error: expected ';' after struct
   }
    ^
   7 errors generated.
..


vim +201 drivers/gpu/drm/i915/intel_device_info.h

a5b7ef27da60c90 José Roberto de Souza  2021-10-19  178  
b978520d1e35b99 Michal Wajdeczko       2017-12-21  179  struct intel_device_info {
a5b7ef27da60c90 José Roberto de Souza  2021-10-19  180  	struct ip_version graphics;
a5b7ef27da60c90 José Roberto de Souza  2021-10-19  181  	struct ip_version media;
93babb061e2ab5e Lucas De Marchi        2021-04-12  182  
792592e72aba416 Daniele Ceraolo Spurio 2020-07-07  183  	intel_engine_mask_t platform_engine_mask; /* Engines supported by the HW */
b978520d1e35b99 Michal Wajdeczko       2017-12-21  184  
b978520d1e35b99 Michal Wajdeczko       2017-12-21  185  	enum intel_platform platform;
b978520d1e35b99 Michal Wajdeczko       2017-12-21  186  
31a02eb70b8d9e6 Michael J. Ruhl        2020-04-17  187  	unsigned int dma_mask_size; /* available DMA address bits */
31a02eb70b8d9e6 Michael J. Ruhl        2020-04-17  188  
cbecbccaa120fd9 Chris Wilson           2019-03-14  189  	enum intel_ppgtt_type ppgtt_type;
cbecbccaa120fd9 Chris Wilson           2019-03-14  190  	unsigned int ppgtt_size; /* log2, e.g. 31/32/48 bits */
cbecbccaa120fd9 Chris Wilson           2019-03-14  191  
4552f50a439c36f Tvrtko Ursulin         2018-02-22  192  	unsigned int page_sizes; /* page sizes supported by the HW */
3aae9d08532c8e5 Abdiel Janulgue        2019-10-18  193  
3aae9d08532c8e5 Abdiel Janulgue        2019-10-18  194  	u32 memory_regions; /* regions supported by the HW */
4552f50a439c36f Tvrtko Ursulin         2018-02-22  195  
b978520d1e35b99 Michal Wajdeczko       2017-12-21  196  	u32 display_mmio_offset;
b978520d1e35b99 Michal Wajdeczko       2017-12-21  197  
938c778f6a22fa1 John Harrison          2021-07-23  198  	u8 gt; /* GT number, 0 if undefined */
938c778f6a22fa1 John Harrison          2021-07-23  199  
b978520d1e35b99 Michal Wajdeczko       2017-12-21  200  #define DEFINE_FLAG(name) u8 name:1
b978520d1e35b99 Michal Wajdeczko       2017-12-21 @201  	DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
b978520d1e35b99 Michal Wajdeczko       2017-12-21  202  #undef DEFINE_FLAG
d53db442db36fdb José Roberto de Souza  2018-11-30  203  
d53db442db36fdb José Roberto de Souza  2018-11-30  204  	struct {
4df9c1ae7a4bb93 Lucas De Marchi        2021-04-12  205  		u8 ver;
a5b7ef27da60c90 José Roberto de Souza  2021-10-19  206  		u8 rel;
01eb15c9165e416 Matt Roper             2021-03-19  207  
6678916dfa01251 Ville Syrjälä          2021-12-10  208  		u8 pipe_mask;
6678916dfa01251 Ville Syrjälä          2021-12-10  209  		u8 cpu_transcoder_mask;
6678916dfa01251 Ville Syrjälä          2021-12-10  210  		u8 abox_mask;
6678916dfa01251 Ville Syrjälä          2021-12-10  211  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

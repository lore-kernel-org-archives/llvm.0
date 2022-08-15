Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE11C7E
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 00:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660524743; x=1692060743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+NfOhN0dVgYiiX1DcIRM2k48lCAo6dOEeeOeCMznrbE=;
  b=fXvyFzNuPaoTSlFzoOowd7F9o5Jm6Nl3mc39ccLl9wcGp28vx5iQ/ovm
   gN++I1fhkSSDwvjuQ0KUAk9r/9erLX0BoAh9zMtApgn9OwUUnp8ej69vs
   xtHjex4oOjX+SYv2o59gaCf6JUUYWuhLX+wnkx2RhkV7Eb1Gv8LN0A2SX
   dq/0BbD9+31859HAAc7Cnl0jmayolNug1qjUC95PWUVAmAfCr6Qk5EZiY
   HIQQyEnu8jNAAYdWoCSVemnOeWVxF51pg3mS8zmMFiKb8QpzJp+cWxEv2
   rjAa+l5NLcELulicXSeqVxcEsikExzwWPj1fyKc4jYk8cIrpTHOUbVbF+
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="293135546"
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; 
   d="scan'208";a="293135546"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2022 17:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; 
   d="scan'208";a="934313016"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Aug 2022 17:52:22 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oNOL7-0000fR-2b;
	Mon, 15 Aug 2022 00:52:21 +0000
Date: Mon, 15 Aug 2022 08:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [Intel-gfx 2/2] drm/i915/guc: Add delay to disable
 scheduling after pin count goes to zero
Message-ID: <202208150850.JJ4hGJX2-lkp@intel.com>
References: <20220814224331.1427330-3-alan.previn.teres.alexis@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220814224331.1427330-3-alan.previn.teres.alexis@intel.com>

Hi Alan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 1cb5379e17f93685065d8ec54444f1baf9386ffe]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Previn/Delay-disabling-scheduling-on-a-context/20220815-064329
base:   1cb5379e17f93685065d8ec54444f1baf9386ffe
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220815/202208150850.JJ4hGJX2-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6afcc4a459ead8809a0d6d9b4bf7b64bcc13582b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/521d8255b73015ef55e0466508f9f9accf64aba6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alan-Previn/Delay-disabling-scheduling-on-a-context/20220815-064329
        git checkout 521d8255b73015ef55e0466508f9f9accf64aba6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4292:5: warning: no previous prototype for function '__guc_get_non_lrc_num_guc_ids' [-Wmissing-prototypes]
   int __guc_get_non_lrc_num_guc_ids(struct intel_guc *guc)
       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4292:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __guc_get_non_lrc_num_guc_ids(struct intel_guc *guc)
   ^
   static 
>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4297:5: warning: no previous prototype for function '__guc_get_sched_disable_gucid_threshold_default' [-Wmissing-prototypes]
   int __guc_get_sched_disable_gucid_threshold_default(struct intel_guc *guc)
       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4297:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __guc_get_sched_disable_gucid_threshold_default(struct intel_guc *guc)
   ^
   static 
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:353:20: warning: unused function 'context_has_committed_requests' [-Wunused-function]
   static inline bool context_has_committed_requests(struct intel_context *ce)
                      ^
   3 warnings generated.


vim +/__guc_get_non_lrc_num_guc_ids +4292 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

  4291	
> 4292	int __guc_get_non_lrc_num_guc_ids(struct intel_guc *guc)
  4293	{
  4294		return guc->submission_state.num_guc_ids - NUMBER_MULTI_LRC_GUC_ID(guc);
  4295	}
  4296	
> 4297	int __guc_get_sched_disable_gucid_threshold_default(struct intel_guc *guc)
  4298	{
  4299		return (__guc_get_non_lrc_num_guc_ids(guc) / 4 * 3);
  4300	}
  4301	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

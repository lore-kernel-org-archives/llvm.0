Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F394C6A
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645620453; x=1677156453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GD2/iuHvu/gR2KQXdYjQ4OhdGK85kCIQSiVnmJfKdNM=;
  b=D5fXOvGzUY4riI2SPwvICf1goSY6A8cgmGRxtWxuVJqEVUks3y5vsape
   oM29yyQi1KHWYd3z8vCk5kYo5dlSD0gHgAZ5KVvUTxWzl0GWooeDpSNLT
   56Ebj9uHueBou5Z1IWHvb4XOjhK3rk1BEDTRiSgtn2jhpTWPlNjSaJxPw
   zZhZaDv/oAwyynuWNyG05txw71AjanDPAoctlJzvz4ptf6VwaHKcnwx30
   a6c0j7c83tpkcIbEZGPR1Ipvu43zQc1YF2GV0E5FB4H29mxh+wTGB8+nX
   /L5pPiQCJYg7cG/eH54Oai4E9N9a/Yd2W1ttc/AkjS4Hczn0tUDorKNPz
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338391431"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="338391431"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:47:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="505900419"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Feb 2022 04:47:30 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMr3K-0001Ow-1t; Wed, 23 Feb 2022 12:47:30 +0000
Date: Wed, 23 Feb 2022 20:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [RFC PATCH 2/2] drm/i915: Enabling WD Transcoder
Message-ID: <202202231929.Ljqdg1LQ-lkp@intel.com>
References: <20220223062043.8337-3-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223062043.8337-3-suraj.kandpal@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Suraj,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20220222]
[cannot apply to v5.17-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Suraj-Kandpal/Patches-to-enable-writeback-in-i915/20220223-141252
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-a012-20220221 (https://download.01.org/0day-ci/archive/20220223/202202231929.Ljqdg1LQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0bebda2fa91f41b1cd2c0ff7aa92fc6c653bc03c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Suraj-Kandpal/Patches-to-enable-writeback-in-i915/20220223-141252
        git checkout 0bebda2fa91f41b1cd2c0ff7aa92fc6c653bc03c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_wd.c:50:38: error: no member named 'wb_connector' in 'struct drm_connector'
                   intel_wd->attached_connector->base.wb_connector;
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>> drivers/gpu/drm/i915/display/intel_wd.c:66:6: error: no previous prototype for function 'print_connectors' [-Werror,-Wmissing-prototypes]
   void print_connectors(struct drm_i915_private *dev_priv)
        ^
   drivers/gpu/drm/i915/display/intel_wd.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void print_connectors(struct drm_i915_private *dev_priv)
   ^
   static 
   drivers/gpu/drm/i915/display/intel_wd.c:397:16: error: assigning to 'struct drm_connector' from incompatible type 'struct drm_connector *'; remove &
           wb_conn->base = &intel_connector->base;
                         ^ ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_wd.c:398:19: error: assigning to 'struct drm_encoder' from incompatible type 'struct drm_encoder *'; remove &
           wb_conn->encoder = &intel_wd->base.base;
                            ^ ~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_wd.c:430:27: error: passing 'struct drm_connector' to parameter of incompatible type 'struct drm_connector *'; take the address with &
           drm_connector_helper_add(wb_conn->base, &wd_connector_helper_funcs);
                                    ^~~~~~~~~~~~~
                                    &
   include/drm/drm_modeset_helper_vtables.h:1153:67: note: passing argument to parameter 'connector' here
   static inline void drm_connector_helper_add(struct drm_connector *connector,
                                                                     ^
   drivers/gpu/drm/i915/display/intel_wd.c:432:15: error: member reference type 'struct drm_connector' is not a pointer; did you mean to use '.'?
           wb_conn->base->status = connector_status_connected;
           ~~~~~~~~~~~~~^~
                        .
   drivers/gpu/drm/i915/display/intel_wd.c:432:24: error: expression is not assignable
           wb_conn->base->status = connector_status_connected;
           ~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/i915/display/intel_wd.c:444:38: error: no member named 'wb_connector' in 'struct drm_connector'
                   intel_wd->attached_connector->base.wb_connector;
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>> drivers/gpu/drm/i915/display/intel_wd.c:440:6: error: no previous prototype for function 'intel_wd_writeback_complete' [-Werror,-Wmissing-prototypes]
   void intel_wd_writeback_complete(struct intel_wd *intel_wd,
        ^
   drivers/gpu/drm/i915/display/intel_wd.c:440:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void intel_wd_writeback_complete(struct intel_wd *intel_wd,
   ^
   static 
>> drivers/gpu/drm/i915/display/intel_wd.c:448:5: error: no previous prototype for function 'intel_wd_setup_transcoder' [-Werror,-Wmissing-prototypes]
   int intel_wd_setup_transcoder(struct intel_wd *intel_wd,
       ^
   drivers/gpu/drm/i915/display/intel_wd.c:448:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int intel_wd_setup_transcoder(struct intel_wd *intel_wd,
   ^
   static 
>> drivers/gpu/drm/i915/display/intel_wd.c:613:5: error: no previous prototype for function 'intel_wd_capture' [-Werror,-Wmissing-prototypes]
   int intel_wd_capture(struct intel_wd *intel_wd,
       ^
   drivers/gpu/drm/i915/display/intel_wd.c:613:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int intel_wd_capture(struct intel_wd *intel_wd,
   ^
   static 
   11 errors generated.


vim +/print_connectors +66 drivers/gpu/drm/i915/display/intel_wd.c

    65	
  > 66	void print_connectors(struct drm_i915_private *dev_priv)
    67	{
    68		struct drm_connector *connector;
    69		struct drm_connector_list_iter conn_iter;
    70		struct intel_connector *intel_connector;
    71	
    72		drm_modeset_lock_all(&dev_priv->drm);
    73		drm_connector_list_iter_begin(&dev_priv->drm, &conn_iter);
    74		drm_for_each_connector_iter(connector, &conn_iter) {
    75			intel_connector = to_intel_connector(connector);
    76			drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]: status: %s\n",
    77				connector->base.id, connector->name,
    78				drm_get_connector_status_name(connector->status));
    79		}
    80		drm_connector_list_iter_end(&conn_iter);
    81		drm_modeset_unlock_all(&dev_priv->drm);
    82	}
    83	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

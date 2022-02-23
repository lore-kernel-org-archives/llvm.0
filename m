Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A01562A
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645620452; x=1677156452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=40R8y5mfM19mjGFaPRSHjolz9q9P3C6aH+9x9F59J2c=;
  b=KhXcYXEIAnLPG/Vz/LDRUXGWkq0dttK/8llbGcKWm+0VO0odPfKCiIMd
   zC+yz3QMYI3ymSUerkSyOBY/UmdUfbBbuEOZyZiHOkpQ1Q4RbFrGmGnfu
   AEQf08VflsmupobFQnWC8L7PxWaiWwe5plE6TxRRTK1JC8rvOcf9eLOkB
   UABG03k5xYBjqgzujcGefDs/F5NQ1uFjCv52BSZt4NViL3tMUWZ+hIRd7
   v6hSfbrBpNxL9MnY6hmGqLF+BNtmzUA91tMIo/RBmYOD5vk55yUOC8VX9
   lVAeLrM6NRSxDRdwGYjQp2kLPuBj3TTFAITA/aMs7/puSLk0y9kWoKSTh
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="315180169"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="315180169"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:47:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="591689186"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2022 04:47:30 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMr3J-0001Of-UY; Wed, 23 Feb 2022 12:47:29 +0000
Date: Wed, 23 Feb 2022 20:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [RFC PATCH 2/2] drm/i915: Enabling WD Transcoder
Message-ID: <202202231835.QH8Iu0VY-lkp@intel.com>
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
config: i386-randconfig-a014-20220221 (https://download.01.org/0day-ci/archive/20220223/202202231835.QH8Iu0VY-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_display.c:1575:38: error: no member named 'wb_connector' in 'struct drm_connector'
                   drm_writeback_queue_job(connector->wb_connector, new_conn_state);
                                           ~~~~~~~~~  ^
   1 error generated.
--
>> drivers/gpu/drm/i915/display/intel_wd.c:50:38: error: no member named 'wb_connector' in 'struct drm_connector'
                   intel_wd->attached_connector->base.wb_connector;
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>> drivers/gpu/drm/i915/display/intel_wd.c:66:6: warning: no previous prototype for function 'print_connectors' [-Wmissing-prototypes]
   void print_connectors(struct drm_i915_private *dev_priv)
        ^
   drivers/gpu/drm/i915/display/intel_wd.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void print_connectors(struct drm_i915_private *dev_priv)
   ^
   static 
>> drivers/gpu/drm/i915/display/intel_wd.c:397:16: error: assigning to 'struct drm_connector' from incompatible type 'struct drm_connector *'; remove &
           wb_conn->base = &intel_connector->base;
                         ^ ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_wd.c:398:19: error: assigning to 'struct drm_encoder' from incompatible type 'struct drm_encoder *'; remove &
           wb_conn->encoder = &intel_wd->base.base;
                            ^ ~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_wd.c:430:27: error: passing 'struct drm_connector' to parameter of incompatible type 'struct drm_connector *'; take the address with &
           drm_connector_helper_add(wb_conn->base, &wd_connector_helper_funcs);
                                    ^~~~~~~~~~~~~
                                    &
   include/drm/drm_modeset_helper_vtables.h:1153:67: note: passing argument to parameter 'connector' here
   static inline void drm_connector_helper_add(struct drm_connector *connector,
                                                                     ^
>> drivers/gpu/drm/i915/display/intel_wd.c:432:15: error: member reference type 'struct drm_connector' is not a pointer; did you mean to use '.'?
           wb_conn->base->status = connector_status_connected;
           ~~~~~~~~~~~~~^~
                        .
>> drivers/gpu/drm/i915/display/intel_wd.c:432:24: error: expression is not assignable
           wb_conn->base->status = connector_status_connected;
           ~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/i915/display/intel_wd.c:444:38: error: no member named 'wb_connector' in 'struct drm_connector'
                   intel_wd->attached_connector->base.wb_connector;
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>> drivers/gpu/drm/i915/display/intel_wd.c:440:6: warning: no previous prototype for function 'intel_wd_writeback_complete' [-Wmissing-prototypes]
   void intel_wd_writeback_complete(struct intel_wd *intel_wd,
        ^
   drivers/gpu/drm/i915/display/intel_wd.c:440:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void intel_wd_writeback_complete(struct intel_wd *intel_wd,
   ^
   static 
>> drivers/gpu/drm/i915/display/intel_wd.c:448:5: warning: no previous prototype for function 'intel_wd_setup_transcoder' [-Wmissing-prototypes]
   int intel_wd_setup_transcoder(struct intel_wd *intel_wd,
       ^
   drivers/gpu/drm/i915/display/intel_wd.c:448:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int intel_wd_setup_transcoder(struct intel_wd *intel_wd,
   ^
   static 
>> drivers/gpu/drm/i915/display/intel_wd.c:613:5: warning: no previous prototype for function 'intel_wd_capture' [-Wmissing-prototypes]
   int intel_wd_capture(struct intel_wd *intel_wd,
       ^
   drivers/gpu/drm/i915/display/intel_wd.c:613:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int intel_wd_capture(struct intel_wd *intel_wd,
   ^
   static 
   4 warnings and 7 errors generated.


vim +1575 drivers/gpu/drm/i915/display/intel_display.c

  1551	
  1552	static void intel_queue_writeback_job(struct intel_atomic_state *state,
  1553			struct intel_crtc *intel_crtc, struct intel_crtc_state *crtc_state)
  1554	{
  1555		struct drm_connector_state *new_conn_state;
  1556		struct drm_connector *connector;
  1557		struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.dev);
  1558		struct intel_wd *intel_wd;
  1559		struct intel_encoder *encoder;
  1560		int i;
  1561	
  1562		for_each_intel_encoder_with_wd(&dev_priv->drm, encoder) {
  1563			intel_wd = enc_to_intel_wd(encoder);
  1564	
  1565			if (intel_wd->wd_crtc != intel_crtc)
  1566				return;
  1567	
  1568		}
  1569	
  1570		for_each_new_connector_in_state(&state->base, connector, new_conn_state,
  1571						i) {
  1572			if (!new_conn_state->writeback_job)
  1573				continue;
  1574	
> 1575			drm_writeback_queue_job(connector->wb_connector, new_conn_state);
  1576			drm_dbg_kms(&dev_priv->drm, "queueing writeback job\n");
  1577		}
  1578	}
  1579	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2739A4A0F;
	Tue, 14 Jan 2025 00:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736813871; cv=none; b=b1qbXfL0K+g0NaBQ188ZSTrSW4yWhliK1vHWQBWvIfpmL0d/nPm4DubUrZdquFmkeDngEcSsVb2mOUrZUL2CiAWHPhyQ2/27WEU15ge3co2xrEOCP1W/+Due9nHk6Jbrw42bvpkcWCSPsh+MnCzW2vUtyoxgqgXwwGovMQcKeGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736813871; c=relaxed/simple;
	bh=ktP8rKOytdpODgDlF+09VPKxRedJUNpDgelGpETMQMg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WypA+JSKTJSxpWYBGz0/DGZ71L90xa8bdUBOoic08r6O7CDDCuiXhAF72GcIw/+y7Q8sVpWNfp6zBdthTnM4mlHbAi8l9QzoRrzImd7bfRXQGOeo4/v5l3D5LTcAeMGB+Ed8Xabqg1U0UUHVfC1ghTVyn68BTzOEDBggan4ZTj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j13dWLna; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j13dWLna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736813870; x=1768349870;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ktP8rKOytdpODgDlF+09VPKxRedJUNpDgelGpETMQMg=;
  b=j13dWLnazD3hl3f1Q/X+h6JH5wAK0D4tnqeMDwSR6Ck28ZkgC32vgq5P
   loBKOP7hDZg9HTjE2RcsLaukhdmsDKpXQL/xWacp8HKLOVDncE4wDY47C
   bQ/HswJP7jruOQofJmOy2rG5jtXlmgZ2fqv8KPJXBtjp7d1mva6/RR1TZ
   ClDwFkx5Ublazlz+M+4ZKa030Xf4LkN10Qi2Amq8ONI7xl25kjhcwP09j
   kgxiPmYVIgCt5FMhLEfYk0nxQBVOk6MWp8g0f+pyNwau1pxKcW9RGeaq4
   IRD6JJnYRHU6tYLsyPU99AERjDVnJrdqe/hLe6Eztdy9esbJwSExK+FXk
   g==;
X-CSE-ConnectionGUID: afRymjwaRTeFcoeYADsyMA==
X-CSE-MsgGUID: aNX0VdpkQSmMEHhTZP2UJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="54512748"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="54512748"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 16:17:49 -0800
X-CSE-ConnectionGUID: 8ombYY5JR/aJ1HSUcgnt3Q==
X-CSE-MsgGUID: aFoRUH8RTL67Xcwvbh+qYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="104595179"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2025 16:17:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXUcr-000Nsd-1H;
	Tue, 14 Jan 2025 00:17:45 +0000
Date: Tue, 14 Jan 2025 08:17:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/gpu/drm/i915/display/intel_display.c:1255:17: warning:
 arithmetic between different enumeration types ('enum transcoder' and 'enum
 intel_display_power_domain')
Message-ID: <202501140844.cOsz4vIK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

CC: linux-kernel@vger.kernel.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: Chris Wilson <chris@chris-wilson.co.uk>

Hi Jani,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c45323b7560ec87c37c729b703c86ee65f136d75
commit: df0566a641f959108c152be748a0a58794280e0e drm/i915: move modesetting core code under display/
date:   6 years ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250114/202501140844.cOsz4vIK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501140844.cOsz4vIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501140844.cOsz4vIK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_display.c:50:
   In file included from drivers/gpu/drm/i915/display/intel_dsi.h:29:
   In file included from drivers/gpu/drm/i915/intel_drv.h:45:
   In file included from drivers/gpu/drm/i915/i915_drv.h:47:
   In file included from include/linux/shmem_fs.h:7:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:399:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     399 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_display.c:1255:17: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    1255 |         power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:72:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
      72 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_display.c:3865:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    3865 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:67:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
      67 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:6650:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    6650 |         mask = BIT_ULL(POWER_DOMAIN_PIPE(pipe));
         |                ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:67:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
      67 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                         ^ ~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:7:32: note: expanded from macro 'BIT_ULL'
       7 | #define BIT_ULL(nr)             (1ULL << (nr))
         |                                           ^~
   drivers/gpu/drm/i915/display/intel_display.c:6651:18: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    6651 |         mask |= BIT_ULL(POWER_DOMAIN_TRANSCODER(transcoder));
         |                 ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:72:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
      72 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:7:32: note: expanded from macro 'BIT_ULL'
       7 | #define BIT_ULL(nr)             (1ULL << (nr))
         |                                           ^~
   drivers/gpu/drm/i915/display/intel_display.c:6654:19: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    6654 |                 mask |= BIT_ULL(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe));
         |                         ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:69:11: note: expanded from macro 'POWER_DOMAIN_PIPE_PANEL_FITTER'
      69 |                 ((pipe) + POWER_DOMAIN_PIPE_A_PANEL_FITTER)
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:7:32: note: expanded from macro 'BIT_ULL'
       7 | #define BIT_ULL(nr)             (1ULL << (nr))
         |                                           ^~
   drivers/gpu/drm/i915/display/intel_display.c:8626:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    8626 |         power_domain = POWER_DOMAIN_PIPE(crtc->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:67:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
      67 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:9800:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    9800 |         power_domain = POWER_DOMAIN_PIPE(crtc->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:67:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
      67 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:10114:17: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    10114 |         power_domain = POWER_DOMAIN_TRANSCODER(pipe_config->cpu_transcoder);
          |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:72:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
      72 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:10148:18: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    10148 |                 power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
          |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:72:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
      72 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:10241:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    10241 |         power_domain = POWER_DOMAIN_PIPE(crtc->pipe);
          |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:67:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
      67 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:10291:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    10291 |         power_domain = POWER_DOMAIN_PIPE_PANEL_FITTER(crtc->pipe);
          |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:69:11: note: expanded from macro 'POWER_DOMAIN_PIPE_PANEL_FITTER'
      69 |                 ((pipe) + POWER_DOMAIN_PIPE_A_PANEL_FITTER)
         |                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:10591:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    10591 |         power_domain = POWER_DOMAIN_PIPE(PIPE_A);
          |                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:67:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
      67 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:10843:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    10843 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
          |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:67:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
      67 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:17040:5: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    17040 |                                 POWER_DOMAIN_TRANSCODER(cpu_transcoder));
          |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:72:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
      72 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   15 warnings generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_dpll_mgr.c:26:
   In file included from drivers/gpu/drm/i915/intel_drv.h:45:
   In file included from drivers/gpu/drm/i915/i915_drv.h:47:
   In file included from include/linux/shmem_fs.h:7:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:399:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     399 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_dpll_mgr.c:2553:17: warning: arithmetic between different enumeration types ('enum tc_port' and 'enum intel_dpll_id') [-Wenum-enum-conversion]
    2553 |         return tc_port + DPLL_ID_ICL_MGPLL1;
         |                ~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_sprite.c:42:
   In file included from drivers/gpu/drm/i915/i915_drv.h:47:
   In file included from include/linux/shmem_fs.h:7:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:399:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     399 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_sprite.c:672:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
     672 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:67:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
      67 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_sprite.c:950:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
     950 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:67:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
      67 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_sprite.c:1133:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    1133 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:67:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
      67 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_sprite.c:1316:17: warning: arithmetic between different enumeration types ('enum pipe' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
    1316 |         power_domain = POWER_DOMAIN_PIPE(plane->pipe);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:67:41: note: expanded from macro 'POWER_DOMAIN_PIPE'
      67 | #define POWER_DOMAIN_PIPE(pipe) ((pipe) + POWER_DOMAIN_PIPE_A)
         |                                  ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +1255 drivers/gpu/drm/i915/display/intel_display.c

ea0760cfc00b9e drivers/gpu/drm/i915/intel_display.c Jesse Barnes  2011-01-04  1241  
b840d907fcf6d5 drivers/gpu/drm/i915/intel_display.c Jesse Barnes  2011-12-13  1242  void assert_pipe(struct drm_i915_private *dev_priv,
63d7bbe9ded414 drivers/gpu/drm/i915/intel_display.c Jesse Barnes  2011-01-04  1243  		 enum pipe pipe, bool state)
b24e7179887108 drivers/gpu/drm/i915/intel_display.c Jesse Barnes  2011-01-04  1244  {
63d7bbe9ded414 drivers/gpu/drm/i915/intel_display.c Jesse Barnes  2011-01-04  1245  	bool cur_state;
702e7a56af3780 drivers/gpu/drm/i915/intel_display.c Paulo Zanoni  2012-10-23  1246  	enum transcoder cpu_transcoder = intel_pipe_to_cpu_transcoder(dev_priv,
702e7a56af3780 drivers/gpu/drm/i915/intel_display.c Paulo Zanoni  2012-10-23  1247  								      pipe);
4feed0ebfa4587 drivers/gpu/drm/i915/intel_display.c Imre Deak     2016-02-12  1248  	enum intel_display_power_domain power_domain;
0e6e0be4c95237 drivers/gpu/drm/i915/intel_display.c Chris Wilson  2019-01-14  1249  	intel_wakeref_t wakeref;
b24e7179887108 drivers/gpu/drm/i915/intel_display.c Jesse Barnes  2011-01-04  1250  
e56134bc79569d drivers/gpu/drm/i915/intel_display.c Ville Syrjälä 2017-06-01  1251  	/* we keep both pipes enabled on 830 */
e56134bc79569d drivers/gpu/drm/i915/intel_display.c Ville Syrjälä 2017-06-01  1252  	if (IS_I830(dev_priv))
8e636784b6f766 drivers/gpu/drm/i915/intel_display.c Daniel Vetter 2012-01-22  1253  		state = true;
8e636784b6f766 drivers/gpu/drm/i915/intel_display.c Daniel Vetter 2012-01-22  1254  
4feed0ebfa4587 drivers/gpu/drm/i915/intel_display.c Imre Deak     2016-02-12 @1255  	power_domain = POWER_DOMAIN_TRANSCODER(cpu_transcoder);
0e6e0be4c95237 drivers/gpu/drm/i915/intel_display.c Chris Wilson  2019-01-14  1256  	wakeref = intel_display_power_get_if_enabled(dev_priv, power_domain);
0e6e0be4c95237 drivers/gpu/drm/i915/intel_display.c Chris Wilson  2019-01-14  1257  	if (wakeref) {
649636ef8274cb drivers/gpu/drm/i915/intel_display.c Ville Syrjälä 2015-09-22  1258  		u32 val = I915_READ(PIPECONF(cpu_transcoder));
63d7bbe9ded414 drivers/gpu/drm/i915/intel_display.c Jesse Barnes  2011-01-04  1259  		cur_state = !!(val & PIPECONF_ENABLE);
4feed0ebfa4587 drivers/gpu/drm/i915/intel_display.c Imre Deak     2016-02-12  1260  
0e6e0be4c95237 drivers/gpu/drm/i915/intel_display.c Chris Wilson  2019-01-14  1261  		intel_display_power_put(dev_priv, power_domain, wakeref);
4feed0ebfa4587 drivers/gpu/drm/i915/intel_display.c Imre Deak     2016-02-12  1262  	} else {
4feed0ebfa4587 drivers/gpu/drm/i915/intel_display.c Imre Deak     2016-02-12  1263  		cur_state = false;
693101618a4bee drivers/gpu/drm/i915/intel_display.c Paulo Zanoni  2013-01-29  1264  	}
693101618a4bee drivers/gpu/drm/i915/intel_display.c Paulo Zanoni  2013-01-29  1265  
e2c719b75c8c18 drivers/gpu/drm/i915/intel_display.c Rob Clark     2014-12-15  1266  	I915_STATE_WARN(cur_state != state,
63d7bbe9ded414 drivers/gpu/drm/i915/intel_display.c Jesse Barnes  2011-01-04  1267  	     "pipe %c assertion failure (expected %s, current %s)\n",
87ad321287ae99 drivers/gpu/drm/i915/intel_display.c Jani Nikula   2016-01-14  1268  			pipe_name(pipe), onoff(state), onoff(cur_state));
b24e7179887108 drivers/gpu/drm/i915/intel_display.c Jesse Barnes  2011-01-04  1269  }
b24e7179887108 drivers/gpu/drm/i915/intel_display.c Jesse Barnes  2011-01-04  1270  

:::::: The code at line 1255 was first introduced by commit
:::::: 4feed0ebfa45879bc422c9a0bfa3cffec82ea60a drm/i915: Ensure the HW is powered during HW access in assert_pipe

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Imre Deak <imre.deak@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

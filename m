Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA4923EAB0;
	Mon, 26 Jan 2026 14:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438345; cv=none; b=K+CfwuokZz+uwvvG485FqOEpotacNsEoCVuFNDUnPEHS/Z0+7DkLn0Kp4jHefCb4GYK32WeXC1HSHmDThPr10DQBmzJw0zTBBTkCOxr4LXEzFV/YK0HvNahAyUylVNj1erad5iRJn7GbjV5Qa5MKoaiNlHcC3Rai/iQt7Y6Bk/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438345; c=relaxed/simple;
	bh=JdfDs2ocjNl8KruxFZ+gkj0XEJnM3BqHT+l9YPI9310=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zi1EuOwhabXQ1I2aF3SSxphlatR89zoOdleQ44jH34ZhL5zu1bQKocR7Nv6nIrC7P47eCvT6kVgGhRQJSuE9AdFiY++uWUhM4uH047oehyqZ/mJ8rBFUbKe+uFKfhtRKRfhJOtcOg1dg1wWVQaqCFqvLCUKOWspEOGNnCdER7WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtxXMT2y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtxXMT2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769438343; x=1800974343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JdfDs2ocjNl8KruxFZ+gkj0XEJnM3BqHT+l9YPI9310=;
  b=UtxXMT2ySuH79d0nSYEyGCDU40s0WeqvcUJgnSNU4dy6pyEeN3jyBuuu
   Lyy/wjGz5qOZhD1MMNliChH4hcjj0AVRhEQqIgaFJn/xeXytPDHuL2U5B
   dKBvRnrgSyUspfE92wF4/88qCC4lLF5fHWmoF3DvmjiLHvCyK4GGX9mGg
   /VHVUxx8nOsXgdWqsvcCrpWWPjabf1qal/NHbKkTJ89juEEQVpERYyG62
   a99zU/dIV2rOeysWFZbjYKfv4tNeMvipNWIHEQ6d54xuV/V0ALDSiWZpl
   UdSSxq9EffuwXB3GQVYcOWoJTujLI0sEPGl6E0aEMX/q+z0czDty/dHZo
   A==;
X-CSE-ConnectionGUID: 5YZ0mApqS5yGCWym9001Lw==
X-CSE-MsgGUID: MR0c/8rjTI20z1qFOnpeKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74458750"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="74458750"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:39:00 -0800
X-CSE-ConnectionGUID: TJBqp2/zS169Iy4Og2QcgQ==
X-CSE-MsgGUID: oW4Em6aOR9+gjneFTYVKMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207751231"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jan 2026 06:38:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkNjw-00000000XOk-17si;
	Mon, 26 Jan 2026 14:38:52 +0000
Date: Mon, 26 Jan 2026 22:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	alexander.deucher@amd.com, harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	siqueira@igalia.com, dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	tomasz.pakula.oficjalny@gmail.com, bernhard.berger@gmail.com,
	michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: Re: [PATCH v2 16/19] drm/amd/display: Add parameter to control ALLM
 behavior
Message-ID: <202601262238.uxN6zVAN-lkp@intel.com>
References: <20260125183914.459228-17-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260125183914.459228-17-tomasz.pakula.oficjalny@gmail.com>

Hi Tomasz,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260123]
[cannot apply to drm-misc/drm-misc-next v6.19-rc6 v6.19-rc5 v6.19-rc4 linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomasz-Paku-a/drm-amd-display-Return-if-DisplayID-not-found-in-parse_amd_vsdb/20260126-024258
base:   next-20260123
patch link:    https://lore.kernel.org/r/20260125183914.459228-17-tomasz.pakula.oficjalny%40gmail.com
patch subject: [PATCH v2 16/19] drm/amd/display: Add parameter to control ALLM behavior
config: i386-randconfig-012-20260126 (https://download.01.org/0day-ci/archive/20260126/202601262238.uxN6zVAN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262238.uxN6zVAN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601262238.uxN6zVAN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:1129:4: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1129 |  * DOC: hdmi_hpd_debounce_delay_ms (uint)
         |    ^
         |  int
>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:1129:7: error: expected ';' after top level declarator
    1129 |  * DOC: hdmi_hpd_debounce_delay_ms (uint)
         |       ^
         |       ;
>> drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:1130:2: error: expected function body after function declarator
    1130 |  * HDMI HPD disconnect debounce delay in milliseconds.
         |  ^
   3 errors generated.


vim +/int +1129 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c

a96a787d6de732 Alex Deucher  2025-02-18  1127  
ee725b1d954d29 Tomasz Pakuła 2026-01-25  1128  /** */
6a681cd9034587 Ivan Lipski   2026-01-13 @1129   * DOC: hdmi_hpd_debounce_delay_ms (uint)
6a681cd9034587 Ivan Lipski   2026-01-13 @1130   * HDMI HPD disconnect debounce delay in milliseconds.
6a681cd9034587 Ivan Lipski   2026-01-13  1131   *
6a681cd9034587 Ivan Lipski   2026-01-13  1132   * Used to filter short disconnect->reconnect HPD toggles some HDMI sinks
6a681cd9034587 Ivan Lipski   2026-01-13  1133   * generate while entering/leaving power save. Set to 0 to disable by default.
6a681cd9034587 Ivan Lipski   2026-01-13  1134   */
6a681cd9034587 Ivan Lipski   2026-01-13  1135  MODULE_PARM_DESC(hdmi_hpd_debounce_delay_ms, "HDMI HPD disconnect debounce delay in milliseconds (0 to disable (by default), 1500 is common)");
6a681cd9034587 Ivan Lipski   2026-01-13  1136  module_param_named(hdmi_hpd_debounce_delay_ms, amdgpu_hdmi_hpd_debounce_delay_ms, uint, 0644);
6a681cd9034587 Ivan Lipski   2026-01-13  1137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

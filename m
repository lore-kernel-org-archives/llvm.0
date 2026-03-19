Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EEF3A0EA5;
	Thu, 19 Mar 2026 20:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773950638; cv=none; b=uTMxM1bkKTNPB8wrKkXxoFA6FtryH19DOlpRLLFoH3X2gvKUVevMpUKgyLEitZq5zhXXpfUNZT8OHmE4QJEBWiN1BS9CG2MN9SOCO12US9JyKkgcw3j+HWBDAFYEcdgDAAUsgXIycD+LA4mKiwAxA8s2vgcxml3StgNkyCnwYOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773950638; c=relaxed/simple;
	bh=84twx1IuJxAmX0z8cr8kLP+jdhb/SBSb3fL9/I2pxMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5pqwQC/HdDqjPfYesqy8rRVnXVK/0jEXuF4cQ/Si4iXBcgxtGA0OEmyvDsuOUW2wjEblnWDKxT3uPanWG0Ot6POov6aj2bBSB4d9dy2VWv2i9jnXSSmp3A095DX9yJwiBJjcQY22apFRbMttSTw1FvU4Bk9Vr6maWi65rJttHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QohgSYrd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QohgSYrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773950635; x=1805486635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=84twx1IuJxAmX0z8cr8kLP+jdhb/SBSb3fL9/I2pxMU=;
  b=QohgSYrdPlYgEmOgXpHsGEWhAD1KOT+qYRnLuHyZgsxWSyxngrWnc/F0
   5ZHLMiOq73D5RnE6tPFn5+tG4mcCseFU161sqNC8E9s9d9a0o/+HvefMJ
   LC+QujpLqjxQafKXi3QqidREo4xtC47CzQJOwfnaC+TdeV5wcY0MnC2OC
   dlAhDZ5+/mE3o2lMIoViHDdQKkm8+x0cHKHvHy9hMNDtBbg/gcRRgYPlo
   i3eCTLuBydrmaViM/i09FVQQQLdgVz85sG6rM2LuyEn3SEw/B14XBhb1O
   5oSUZGU/GiYz5idvvI9CyCuprvS8Xcsz4CC8mVI4qLJcJ4JB1snZnlrI1
   w==;
X-CSE-ConnectionGUID: ud0elfntQr6sO7dDVOqiwg==
X-CSE-MsgGUID: baJrIU1PTI6OnKk+RPD5Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78892991"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78892991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 13:03:53 -0700
X-CSE-ConnectionGUID: mNU/dcKfRfOK8XzgAB2umA==
X-CSE-MsgGUID: UVHX6Gs7RyO0oan/eG7RTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="222179222"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Mar 2026 13:03:48 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Jar-000000001bh-1Qog;
	Thu, 19 Mar 2026 20:03:45 +0000
Date: Fri, 20 Mar 2026 04:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	andrealmeid@igalia.com, christian.koenig@amd.com, airlied@gmail.com,
	simona.vetter@ffwll.ch, mripard@kernel.org,
	anshuman.gupta@intel.com, badal.nilawar@intel.com,
	riana.tauro@intel.com, karthik.poosa@intel.com,
	sk.anirban@intel.com, raag.jadav@intel.com,
	Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v2 1/5] Introduce Xe Uncorrectable Error Handling
Message-ID: <202603200358.BacRkqob-lkp@intel.com>
References: <20260318064016.374656-8-mallesh.koujalagi@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318064016.374656-8-mallesh.koujalagi@intel.com>

Hi Mallesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-misc/drm-misc-next drm/drm-next next-20260319]
[cannot apply to linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mallesh-Koujalagi/Introduce-Xe-Uncorrectable-Error-Handling/20260318-153303
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260318064016.374656-8-mallesh.koujalagi%40intel.com
patch subject: [PATCH v2 1/5] Introduce Xe Uncorrectable Error Handling
config: i386-randconfig-017-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200358.BacRkqob-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200358.BacRkqob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200358.BacRkqob-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_ras.c:241:4: error: variable 'action' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
     241 |                         default:
         |                         ^~~~~~~
   drivers/gpu/drm/xe/xe_ras.c:250:8: note: uninitialized use occurs here
     250 |                         if (action > final_action)
         |                             ^~~~~~
   drivers/gpu/drm/xe/xe_ras.c:227:4: note: variable 'action' is declared here
     227 |                         enum xe_ras_recovery_action action;
         |                         ^
   1 error generated.


vim +/action +241 drivers/gpu/drm/xe/xe_ras.c

   177	
   178	/**
   179	 * xe_ras_process_errors - Process and contain hardware errors
   180	 * @xe: xe device instance
   181	 *
   182	 * Get error details from system controller and return recovery
   183	 * method. Called only from PCI error handling.
   184	 *
   185	 * Returns: recovery action to be taken
   186	 */
   187	enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
   188	{
   189		struct xe_sysctrl_mailbox_command command = {0};
   190		struct xe_ras_get_error_response response;
   191		enum xe_ras_recovery_action final_action;
   192		size_t rlen;
   193		int ret;
   194	
   195		/* Default action */
   196		final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
   197	
   198		if (!xe->info.has_sysctrl)
   199			return XE_RAS_RECOVERY_ACTION_RESET;
   200	
   201		xe_ras_prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
   202					       &response, sizeof(response));
   203	
   204		do {
   205			memset(&response, 0, sizeof(response));
   206			rlen = 0;
   207	
   208			ret = xe_sysctrl_send_command(xe, &command, &rlen);
   209			if (ret || !rlen) {
   210				xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
   211				goto err;
   212			}
   213	
   214			if (rlen != sizeof(response)) {
   215				xe_err(xe, "[RAS]: Sysctrl response does not match len!!\n");
   216				goto err;
   217			}
   218	
   219			if (response.num_errors > XE_RAS_NUM_ERROR_ARR) {
   220				xe_err(xe, "[RAS]: Number of errors out of bound (%d)\n",
   221				       XE_RAS_NUM_ERROR_ARR);
   222				goto err;
   223			}
   224	
   225			for (int i = 0; i < response.num_errors; i++) {
   226				struct xe_ras_error_array arr = response.error_arr[i];
   227				enum xe_ras_recovery_action action;
   228				struct xe_ras_error_class error_class;
   229				u8 component;
   230	
   231				error_class = arr.error_class;
   232				component = error_class.common.component;
   233	
   234				switch (component) {
   235				case XE_RAS_COMPONENT_CORE_COMPUTE:
   236					action = handle_compute_errors(xe, &arr);
   237					break;
   238				case XE_RAS_COMPONENT_SOC_INTERNAL:
   239					action = handle_soc_internal_errors(xe, &arr);
   240					break;
 > 241				default:
   242					xe_err(xe, "[RAS]: Unknown error component %u\n", component);
   243					break;
   244				}
   245	
   246				/*
   247				 * Retain the highest severity action. Process and log all errors
   248				 * and then take appropriate recovery action
   249				 */
   250				if (action > final_action)
   251					final_action = action;
   252			}
   253	
   254		} while (response.additional_errors);
   255	
   256		return final_action;
   257	
   258	err:
   259		return XE_RAS_RECOVERY_ACTION_RESET;
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

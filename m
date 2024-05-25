Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF5391;
	Sat, 25 May 2024 01:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716600314; cv=none; b=CF3xm7GnhsgWkl//lxiiqQWpeLokDC50+lkGJbQhQjbho5H4UE7LFaz2IAwb9L4/4X7X1gd41OF4jx9h/Eh1JAteI5YJfmMMkxShl2uNxoJAsjPaVFVBcPKTR31d/7kToj85zrTRz+yLmjrdkDfEcFt9zTIn8JqN8nFbQYLcUvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716600314; c=relaxed/simple;
	bh=uprftOU8r+u19t1CX273JBxmldWqGzDeRz55IhNpvKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hc9AS5WZAfaNGvwKfBh9/w4G6Uo+GBiQN+ySeZRqQrzM/JasnnR9BGGvuV8HJUO7as1hu2P4VDJEzC3/0wWaNr492q19Ehe97u24AVPWK4D1m96wznKtiI8fyF/bV3AUd2aM6IyFqymKofgnJcPtnBuYCGB9iZoF/zEPxCbJGHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKSRN8Qk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKSRN8Qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716600312; x=1748136312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uprftOU8r+u19t1CX273JBxmldWqGzDeRz55IhNpvKg=;
  b=DKSRN8QkHb7l+2SgkylpoVQnRANW/r9Tld6w+lSaX1nkTWh8/Antr5u5
   va7izrxcM+Yjnw43qTtQC12x8w9qo4CGLMCFep8dNi1HI/DbPNO4bKOE6
   rwiNMYCrn29J+ikMfmWZX+gh0DGfhw5wznpsRHpSYhVDuARMFWasXRU5f
   XD1exz6KrtZVNVH+zWNWAsoBTQggN8G6drcS9LbnWa1ArI8fd6koLNooP
   ygExTIe7ygHZWMHgKsGRYu02tKO2w9Uif3/tWhlVs4zUDexb5k9ZcJNA/
   7ZHd+qJIYe1SKXWOzBoGk1JY4TEE+E9A/Jix5udJwWJVsJSfT7e3cTMFt
   g==;
X-CSE-ConnectionGUID: lp66/AKISYWUIoPX1H/iMw==
X-CSE-MsgGUID: B8Rw1WHGRWGt4WQ0idNr3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12775736"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="12775736"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 18:25:11 -0700
X-CSE-ConnectionGUID: XrF+eU27S1++i01NgYWprg==
X-CSE-MsgGUID: 0uDWnx2aR0WmKo2ccl2H4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="38612851"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 May 2024 18:25:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAg9k-00065r-14;
	Sat, 25 May 2024 01:25:08 +0000
Date: Sat, 25 May 2024 09:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 3/8] drm/i915: Compute CMRR and calculate vtotal
Message-ID: <202405250934.b3wpZ9NM-lkp@intel.com>
References: <20240524102432.2499104-4-mitulkumar.ajitkumar.golani@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524102432.2499104-4-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20240523]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-Define-and-compute-Transcoder-CMRR-registers/20240524-183131
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240524102432.2499104-4-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [PATCH v9 3/8] drm/i915: Compute CMRR and calculate vtotal
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240525/202405250934.b3wpZ9NM-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250934.b3wpZ9NM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250934.b3wpZ9NM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __divdi3
   >>> referenced by intel_vrr.c
   >>>               drivers/gpu/drm/i915/display/intel_vrr.o:(cmrr_get_vtotal) in archive vmlinux.a
   >>> referenced by intel_vrr.c
   >>>               drivers/gpu/drm/i915/display/intel_vrr.o:(cmrr_get_vtotal) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __udivdi3
   >>> referenced by intel_vrr.c
   >>>               drivers/gpu/drm/i915/display/intel_vrr.o:(cmrr_get_vtotal) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

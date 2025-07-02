Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842BB24728D;
	Wed,  2 Jul 2025 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496152; cv=none; b=uZgZmJDtGrpr9tW3CFGVgTTNXecG5W++pMOmhkSgKqjugd5CAm3a0vZpBAWKLFCoBVmMK7KMCNx1tNzY+eVcpNgnRMRhctTQtCWTbA/HqMRBsWngzgta0dGQJ10cBVWMjZbBs3AarwMtKEF3ygwPJmCRufrRVSoM4rxr1EUg+ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496152; c=relaxed/simple;
	bh=sp/t107nwKHJd8+E02mFpcvD6d9IYkfy2kdjYaXR+N8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qRSy6adu0B92ri80CMF8DyZRtno8uCPkZ0sKVl4e4HTnVgdyMSTNbkU65tRm0TEkgirQAg9pkolowMXm9ZWmKsR04a3HbRky/rC9cD1Zmbh1YGuY14MuADGFoKKO7wIxRZjLbQHNftTHEQA2DT8ft8lSuLxyaIFWSAQCtdckSw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRw2Q8JR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRw2Q8JR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751496149; x=1783032149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sp/t107nwKHJd8+E02mFpcvD6d9IYkfy2kdjYaXR+N8=;
  b=KRw2Q8JRLCm9ktEmVwOy4PkG9WexlbG+0uv+DILVTEQK+Wy8WmPFIu1S
   IwUbwxLwHpoSHto6XIlG4VSJY5PJ17fhUt9mVRHnnFRhAbaUVN6X9w2XO
   VX6rIQHfPof38rNGINj4ZF3AvTR7fj3tB1chNQ9G3GwZHz/5Sg+q3Eywh
   WTC7QxkbldO7lRAYxSpDj0t4gTUhtFafJ2W/88F+C64Lm2x8yhg+Nb15S
   aMivHdc6ckIGy3sF/u5xMGxwrE7xwJj3lnq972zWZKc5sCIC1AEODfTH9
   ZO/sXLMfz5Rt4HjIaHwgSWy/NV5CkZrNqq0v/+QmpmUXgz5OsMbVCi5R7
   A==;
X-CSE-ConnectionGUID: Xw/6Xjz9TpO6lY/T7GuCBg==
X-CSE-MsgGUID: FTh3FhNKQpKT7VUnRG0+rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64408287"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="64408287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 15:42:29 -0700
X-CSE-ConnectionGUID: IYj3H52hTviri0Woeqlyrg==
X-CSE-MsgGUID: DQFFzp7kQBCfSzjRif9PtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="158771061"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Jul 2025 15:42:28 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX69p-00019T-0m;
	Wed, 02 Jul 2025 22:42:25 +0000
Date: Thu, 3 Jul 2025 06:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 3990/6656] ld.lld: error: duplicate symbol:
 intel_pcode_read
Message-ID: <202507030627.L7KRXRFp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   50c8770a42faf8b1c7abe93e7c114337f580a97d
commit: d9465cc8ac2dd36264c274d4e6c99437276c64c8 [3990/6656] drm/xe/pcode: add struct drm_device based interface
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250703/202507030627.L7KRXRFp-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030627.L7KRXRFp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030627.L7KRXRFp-lkp@intel.com/

Note: the linux-next/master HEAD 50c8770a42faf8b1c7abe93e7c114337f580a97d builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: intel_pcode_read
   >>> defined at intel_pcode.c:278 (drivers/gpu/drm/i915/intel_pcode.c:278)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(intel_pcode_read) in archive vmlinux.a
   >>> defined at xe_pcode.c:342 (drivers/gpu/drm/xe/xe_pcode.c:342)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x1640) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_intel_pcode_read
   >>> defined at intel_pcode.c:0 (drivers/gpu/drm/i915/intel_pcode.c:0)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(__cfi_intel_pcode_read) in archive vmlinux.a
   >>> defined at xe_pcode.c:0 (drivers/gpu/drm/xe/xe_pcode.c:0)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x1600) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: intel_pcode_write_timeout
   >>> defined at intel_pcode.c:285 (drivers/gpu/drm/i915/intel_pcode.c:285)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(intel_pcode_write_timeout) in archive vmlinux.a
   >>> defined at xe_pcode.c:350 (drivers/gpu/drm/xe/xe_pcode.c:350)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x16c0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_intel_pcode_write_timeout
   >>> defined at intel_pcode.c:281 (drivers/gpu/drm/i915/intel_pcode.c:281)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(__cfi_intel_pcode_write_timeout) in archive vmlinux.a
   >>> defined at xe_pcode.c:346 (drivers/gpu/drm/xe/xe_pcode.c:346)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x1680) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: intel_pcode_request
   >>> defined at intel_pcode.c:293 (drivers/gpu/drm/i915/intel_pcode.c:293)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(intel_pcode_request) in archive vmlinux.a
   >>> defined at xe_pcode.c:359 (drivers/gpu/drm/xe/xe_pcode.c:359)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x1740) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_intel_pcode_request
   >>> defined at intel_pcode.c:0 (drivers/gpu/drm/i915/intel_pcode.c:0)
   >>>            drivers/gpu/drm/i915/intel_pcode.o:(__cfi_intel_pcode_request) in archive vmlinux.a
   >>> defined at xe_pcode.c:354 (drivers/gpu/drm/xe/xe_pcode.c:354)
   >>>            drivers/gpu/drm/xe/xe_pcode.o:(.text+0x1700) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

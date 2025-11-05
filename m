Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A354221578;
	Wed,  5 Nov 2025 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762355396; cv=none; b=KebsO0jxraXO5AS3FkU641hgs0atz4lV8dzBhoWqP4CvbbIX6UGNjWG6BiX7kNL+zXHTsGc1tjiPQbWbqYSFkqXKrvPRy8mndIJITkmxMu+6Bk1ySKLps7zBwqPb9b/dw/yPzqUNaLkX8zouVbO9RgY5XNQ6Qf+EGDM6ubZ8C9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762355396; c=relaxed/simple;
	bh=RdGTBxo0TQrwdCtgP2P14IP2o9bbj7qMmZt7OkvMQc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rextg6yFpipeP7KMVEmDKInzdmjxVjRBzlb+vPiQOWANEa4b8jDsqBgeR1wzjjefm7nm3PV+Fi14g9yWZ4CwQ67abZjBG2oSTKKAOm2u4AHRVF+Cu+fLccOcBFiajfxJjQjKCcSw+bcc/4DRN6X4FPM7c0OryJpTdKPovuLJme8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1AdXWKy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1AdXWKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762355395; x=1793891395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RdGTBxo0TQrwdCtgP2P14IP2o9bbj7qMmZt7OkvMQc4=;
  b=i1AdXWKyZDnPokuZBF9HJ9SPfOourtKThZPPagnyZzCxuf3Q8CtRQA+R
   VnayWQpHxXv5qylZOVAjzKbtGX8m/rK40JgSlsVF382sHcGw3gfcWjY8O
   f9octEaFKCTtGsnxIT3UndepcoqgCXJ1yFzXo509L/m2DcpBDZzwyf9v3
   hY6zhn1cYwLuYJrBHpXcSfApvp/pg6a/KJPKBkUgkUu+0LB4TkqvnTDIQ
   E93aAGBjaP/kKdova+cCJwHVJIpS85SY/7xQmmqsK9UZdgAoLTnvLydgs
   1i8DIsVhtpUBqsT2PpN6mqotpm9+P7+yQ2g/kEVNMrcnkgqOdfB0xcgU3
   w==;
X-CSE-ConnectionGUID: HZLzYo8nRpWSPjUfyEAdDA==
X-CSE-MsgGUID: b910f7UpRza2iPympIWKuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="67088104"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="67088104"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 07:09:55 -0800
X-CSE-ConnectionGUID: V3gMPdRAQdKJeTKdfvh51g==
X-CSE-MsgGUID: wjCb6WF2QWWl/Oi4a8jeVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="191838126"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2025 07:09:53 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGf86-000Sje-2p;
	Wed, 05 Nov 2025 15:09:13 +0000
Date: Wed, 5 Nov 2025 22:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:measure-error-v1-devel-v2 6/6]
 include/linux/ima.h:56:80: warning: non-void function does not return a
 value
Message-ID: <202511052248.MRv77VjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux measure-error-v1-devel-v2
head:   9a18812bbd152e161681fe65e9414e05c5aa3480
commit: 9a18812bbd152e161681fe65e9414e05c5aa3480 [6/6] ima: Deny file op if a measurement error cannot be recorded in the TPM
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251105/202511052248.MRv77VjH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052248.MRv77VjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052248.MRv77VjH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:15:
>> include/linux/ima.h:56:80: warning: non-void function does not return a value [-Wreturn-type]
      56 | static inline int ima_kexec_cmdline(int kernel_fd, const void *buf, int size) {}
         |                                                                                ^
   1 warning generated.


vim +56 include/linux/ima.h

    55	
  > 56	static inline int ima_kexec_cmdline(int kernel_fd, const void *buf, int size) {}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

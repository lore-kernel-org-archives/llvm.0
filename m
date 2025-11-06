Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154C919CCFC;
	Thu,  6 Nov 2025 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762453032; cv=none; b=QcJp6OCJcWsLcwevphPxF2b14G1Pz1l3L74guCbILyrV6j9b92pw+GBNUKnVrd/46wnd4LtXWvWOm2aevh5rIk+Il7rjbE/q75Dt9IZk0bTfeh7Uh/Rv6zQx3MnKwDS/T3dLRNEjrKnsu0y2Oz1ryjFBa1GLlzQL81k/Pph4hJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762453032; c=relaxed/simple;
	bh=2VzvYyOSlX+aGeXVKAyST+kgdelPqRcD18yE3ECwlmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcYjtz8CSgBEFaXChSjswhJXrMB9E64uTJzYAHlBaL5GSe7JaSnvq/6n28/A4+9wZ+q3iPxjyyajigaDESlGOYiHT9rGIQ3JkMsDNjFxmx5x6MGEUmw6kwXMHksYADMC/QxWEeQImcGaKqFhFRliue0N9Giqx4E5bydgO8wagxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIeP+4xy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIeP+4xy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762453031; x=1793989031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2VzvYyOSlX+aGeXVKAyST+kgdelPqRcD18yE3ECwlmI=;
  b=JIeP+4xytPPD+ocs0Jt8jpOBBMr4JRhVBmalvBMA5OHpYf8ULGG064ip
   ZBo87g9Ir1fhVjN5EQafB0Z8/9Z0JhGEG8qFxM+e2MTcPkW5gashiyi3S
   VdsW/8tK6Jsim73p4VkudHC4Ip0b9Me32Ipg71kUuyk8qEwLSouU8oMPS
   +5sx3gcb6xk8+9otJT3vYC64dOhhNHj8clKYPv2pt7O9wYYzMMPF8v6nP
   EIgQPffzAi2bMh45W3ucAsDMUbiBkPqZyPDfa9Au0W+VYITpxB5r/Jiyh
   gpXdIGgIzvrLp/F+qFfDfsKHL0W1EAP2FsoG9PZZOn/3PnBrF9dlIVW+C
   w==;
X-CSE-ConnectionGUID: BEandWfoTWKMhsQ4fRXN1w==
X-CSE-MsgGUID: NYl7FKzrRMWpsHxZ5iRfWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64516624"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64516624"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 10:17:10 -0800
X-CSE-ConnectionGUID: s7BfGmwoRUCeNcpm1Xxuyg==
X-CSE-MsgGUID: D4CYdoCURh+8qx5nuThNOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187772647"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2025 10:17:10 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vH4Xj-0000000035c-13Pk;
	Thu, 06 Nov 2025 18:17:07 +0000
Date: Thu, 6 Nov 2025 19:17:06 +0100
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:measure-error-v1-devel-v4 6/6]
 include/linux/ima.h:56:80: warning: non-void function does not return a
 value
Message-ID: <202511061945.1ZXB31oq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux measure-error-v1-devel-v4
head:   0439a359fb53048916b67ff651057bc5809d8c6c
commit: 0439a359fb53048916b67ff651057bc5809d8c6c [6/6] ima: Deny file op if a measurement error cannot be recorded in the TPM
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251106/202511061945.1ZXB31oq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061945.1ZXB31oq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061945.1ZXB31oq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/kexec_file.c:21:
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

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6881EB2F;
	Tue, 21 Jan 2025 19:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737489318; cv=none; b=gY0QcNVAelRnuQoqgPOsV8rY+ivxvX/1FJVcrAs16IPvBNwhg2bHh/yVTo277p4ufl7h9PBTqm8iCA0fxDYGpC+px0x1kWDrC0f7hJHXoOqE25IQGSPhFd4CcCQQ0LqGvUH8DIQzBN7tOu7z7Bs0n7OdvA66FXPOjXtZuBndW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737489318; c=relaxed/simple;
	bh=EpU5uKc87Jtb4CxNSIVDnLzZpm4V8fX0q2UO8pT/VTs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FLHI4ZzInGMY+nrjNa5CdA6eOepa5tMfvu3TrzRLKO1CkiFY3LhbcfZO2JvcpJgud4r1r2olNEdd83o3bRZLBQl7rWc7ucWibxfeB28OsOOov4ICZu1MzZxDtPHjiTDBuqlUaZx+z0ZkhZiz9a8tXjAM35bT7SMhcILJ5lHtVCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEsIJdfA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEsIJdfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737489316; x=1769025316;
  h=date:from:cc:subject:message-id:mime-version;
  bh=EpU5uKc87Jtb4CxNSIVDnLzZpm4V8fX0q2UO8pT/VTs=;
  b=kEsIJdfAPTDCFq8O0HlInGvnyqhSjCv9aikIL3T0v3vS8NsqaGQoO4n3
   skIJaNcrwpAefd/ORRCytmG/snkG/Bv8/PwJGb+LZdy4XdiHqTSvIysJJ
   mwSIvuhMEcaBrdCMJ2K58gXnf5FHCfV9ZMQpLU9GnSd1xCYtAp8U3nYiG
   sdANxlOts8Pya2onBxd4Q7K6PLKKDmPCGDbSZNUIn367J3TZZbfi0zHVC
   a3q+3T6eQ2IiuYKMCCQJHhPVVUURyD94GSLiNaBgzw21HFbSVoEbd/k2C
   Que2f464z7I0BrRIQgYo/cRQov4MFcNAQxK2StU3wdm8/mBLVGOrcd8kc
   g==;
X-CSE-ConnectionGUID: 5mGIt8KETmqpW/6Eevjk/g==
X-CSE-MsgGUID: RAw1CpObRuqD7qh31RZVOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="49319745"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="49319745"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 11:55:15 -0800
X-CSE-ConnectionGUID: AeJsLEXQSoOUehV+oG9diw==
X-CSE-MsgGUID: aeq8kFVrR4KxjiyIQzDbzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111992078"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2025 11:55:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taKLA-000YuB-1e;
	Tue, 21 Jan 2025 19:55:12 +0000
Date: Wed, 22 Jan 2025 03:54:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 295/296] ld.lld: error:
 vmlinux.o:(function perf_trace_i2c_write: .text.perf_trace_i2c_write+0x30):
 relocation R_RISCV_HI20 out of range: 531804 is not in [-524288, 524287];
 references '__per_cpu_offset'
Message-ID: <202501220335.ZPneFzfZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   2fae09e2329530b08ec62b44a799cedfb7a0ef22
commit: cb4af57eb5a0046c43df9141f8f0cc7aed9f49c0 [295/296] bcachefs: Scrub
config: riscv-randconfig-002-20250120 (https://download.01.org/0day-ci/archive/20250122/202501220335.ZPneFzfZ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220335.ZPneFzfZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220335.ZPneFzfZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.o:(function perf_trace_i2c_write: .text.perf_trace_i2c_write+0x30): relocation R_RISCV_HI20 out of range: 531804 is not in [-524288, 524287]; references '__per_cpu_offset'
   >>> referenced by i2c.h:25 (include/trace/events/i2c.h:25)
   >>> defined in vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

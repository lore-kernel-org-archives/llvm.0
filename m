Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDCA282F1;
	Thu, 25 Sep 2025 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758803858; cv=none; b=UY/T2AZHET7oh/hnsGWUkIGGgXvvaTLDBcmXCzlkD7ojYzsbRbI2Ob1rKRQawr2pc26eN0GZURxonPxMCKsCL1bDRO3CWO8Sz8r5I79WVXu+3Xuu6PMlC0oOZoQZ5oNx91ML4xMXXL24ZLksjbcbt2nmzgKu/8GKcjdJTXfcDtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758803858; c=relaxed/simple;
	bh=eIniClUu64XIEWzRgCssETWR+Io6GIpmSlNGAx+qkx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQFQOwOBHfkvDdKtOI2Iaiu7BRDISuO18ebqD1TDkI8DejGiRLWV2ZTHx/wjYfHkyQncTFv2F8clLjNxkFj2FH9j9zwTRocTMYIIpvbe7NFclDclImVZ08nUn1KYYCar3VQq46TWuqfw47D/Cp1Rr3kB5Wrft8NwX6Bq0Rp0MY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XI6jbh/7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XI6jbh/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758803857; x=1790339857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eIniClUu64XIEWzRgCssETWR+Io6GIpmSlNGAx+qkx4=;
  b=XI6jbh/7lbziu7cIp1ZEC9SX3c+lhVmgArU+1ysSfF0yAojwrysFM7Mg
   2gI23TwdOWti6AKEfelZm9qG5GSRYYPL6qJSm1byBTyT7iuwi1Mxw/+Ia
   ZWFQvPw6SCarCkTDJtu+UyNS8dhljOKgJuBHqsAWc3ub4Grj3gBIdE6Nk
   39IT/qhlZf0slI1UHhjfnpObey5WoviEX3Plvfn4n31u4SuGCpoq5NV3m
   vOzUb8sEmTR4oodQtlYtFB+YVNRVblZW1LNT+dJ3Vyt3p2C2NwkE0CI9k
   S3x6BffpSRW5Xip4ExlxXB9dXi0JXRIrOO2tYJ1UavjrbZ7QVQKCNVtgx
   A==;
X-CSE-ConnectionGUID: cQmi++UgStOtx6If2oA0cg==
X-CSE-MsgGUID: l7qhASvdT72MiGn12vL2cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="86564915"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="86564915"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 05:37:36 -0700
X-CSE-ConnectionGUID: YTasdw1rT9ifX3Oss7J78Q==
X-CSE-MsgGUID: it6eb0RNS8KySXe8+8DiTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="201004572"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2025 05:37:36 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1lE5-000000004st-15sq;
	Thu, 25 Sep 2025 12:37:33 +0000
Date: Thu, 25 Sep 2025 14:37:04 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 6/9] Warning:
 kernel/trace/ftrace.c:5980 function parameter 'ip' not described in
 'register_ftrace_direct'
Message-ID: <202509251447.sNajLY9D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   512bde773529ffbb0241c282793b7f4641034fe7
commit: ffab58e25f3e8b2c881c0d6ead562ea1cd16ad86 [6/9] ftrace: Use direct hash interface in direct functions
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250925/202509251447.sNajLY9D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251447.sNajLY9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251447.sNajLY9D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/trace/ftrace.c:5980 function parameter 'ip' not described in 'register_ftrace_direct'
>> Warning: kernel/trace/ftrace.c:6011 function parameter 'ip' not described in 'unregister_ftrace_direct'
>> Warning: kernel/trace/ftrace.c:6043 function parameter 'ip' not described in 'modify_ftrace_direct'
>> Warning: kernel/trace/ftrace.c:6043 function parameter 'lock_direct_mutex' not described in 'modify_ftrace_direct'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

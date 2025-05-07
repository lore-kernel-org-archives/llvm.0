Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBFA12CD88;
	Wed,  7 May 2025 04:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746592494; cv=none; b=LKDqgOqAqSvSOLCPFu1XV3vd0y2vY4xPOp1N1tr0091CK2rKjU6ZmyI86ARQRkst7sqb4Uh3a2cDEZuqAwTY2TG671FaOaKq4pwzaoHmv68XJDw1Me1IJoWf5uYbQZhZiAJQ6X+e+SuVsu2w7e9LUbNjbiHRpbG+kYCEBYanS1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746592494; c=relaxed/simple;
	bh=1ZAdWNFGeQwoGsxnppZ4SN/UzhSWSatabnoTQh3owG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZm0Raq7bUKuOj2AqKuO0oppPFM0y74nAhP1PCpkenVNJzzJJRXzNg2YFlxdydUs8IZ9Ak4Blpi3mTH6qesLMj8h1WS7zIGH8eN00yunjVB09a2vJcyeE8fn8Ok+pzOGY8Vm3y3s+DKmJ9+IXnDj8ygjCQxIB1qJYXY+EX+VC08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0dZB9w8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0dZB9w8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746592493; x=1778128493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZAdWNFGeQwoGsxnppZ4SN/UzhSWSatabnoTQh3owG8=;
  b=m0dZB9w8Dmg/yZ+KXnbTycyLpRok8DE5JIgQAJVNBeEAkMHV+/FujWwp
   NBRgf3ceB+p83SXi2GaqXv+h6TS+iFZ0DsTt/8UpoGLVzSHC46xMrplzB
   IMLA0CtpKblKXWK2Wfot1ibhq8OIxKWhCWKcpSCsP1vPWPNxWxQ52NH+q
   IbgxIxYooMgACFag9xtn1+QKGsOSQHHv7euZ3OcgBVQoZ13SFdhVXSbMV
   fOf9jErrKQAG2mYb6aFDW5Nz0FDMsucqM2yZuljkYOqEVXxvVJnj6Uj9Y
   mrVHuPZ1j2K3ECi6L/E68JzRrV7/Q5EBRFrTofWGJZjNi8akUEmY47I1o
   g==;
X-CSE-ConnectionGUID: R/p9PnlqQ3m+gKeG+n2eEA==
X-CSE-MsgGUID: CViVlmI0SaeqbOxZJ4Xdag==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48380914"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48380914"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 21:34:53 -0700
X-CSE-ConnectionGUID: KbO1Ixj8QbqDP3WPtjifcQ==
X-CSE-MsgGUID: UmQWu/SNSkql6Oyn2Do88Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140672475"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 May 2025 21:34:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCWUb-00072n-1U;
	Wed, 07 May 2025 04:34:49 +0000
Date: Wed, 7 May 2025 12:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.x86/cpu 14/15] make[4]: *** No rule to make target
 'arch/x86/um/../lib/cmpxchg8b_emu.o', needed by 'arch/x86/um/built-in.a'.
Message-ID: <202505071230.kASXN9TQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/cpu
head:   b085f7c193bf4a4c65f23a28cb991c965d06a93b
commit: 8d271bff6187fdb45bcae854ca7c673efde564c1 [14/15] x86/atomics: Remove !CONFIG_X86_CX8 methods
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250507/202505071230.kASXN9TQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071230.kASXN9TQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071230.kASXN9TQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/x86/um/../lib/cmpxchg8b_emu.o', needed by 'arch/x86/um/built-in.a'.
>> make[4]: *** No rule to make target 'arch/x86/um/../lib/atomic64_386_32.o', needed by 'arch/x86/um/built-in.a'.
   make[4]: Target 'arch/x86/um/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

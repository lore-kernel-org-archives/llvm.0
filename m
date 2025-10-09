Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C1C25485F;
	Thu,  9 Oct 2025 19:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760036974; cv=none; b=WjxIlA7Tc1vmNlbpaZ/YqJM71tTTtsaiL5Y0VlMuEseCsiCtu0i+4HfOxwlU3K49G8iL/5cAbH+D1GOi+VyzdH9bF+ZPEcVIIIQXXUKHwI3WRKOZ0eurX4fnSxcqy5kzSzzNzvsAoXHLUnIGmyIAkJCqI5Gc2UOhACdkWFScfmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760036974; c=relaxed/simple;
	bh=+zOs09XPR2XqO7DNdNXsF/d9ZWLOIyXeOyzrhxvtuOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XjhivxWbzsX+e3VYSVW9JQBhcQCBJ9YRrlTZ7Vb9DL1lRognTkafOOExiwQweM951PDrm9d0mK2hTrnsQEEv5W81Uh4w7UCbTyfLdgx7vRTcKjb6WxidD185IXmPsYkq/7/d5JkGTVA86yxml+UsV/8l9vw0+wchz0eVU3FOsP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUVch4HF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUVch4HF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760036973; x=1791572973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+zOs09XPR2XqO7DNdNXsF/d9ZWLOIyXeOyzrhxvtuOE=;
  b=dUVch4HFWnKG/g1SMEokojAXPpj4dqhRbX28UWKj9bBS2yu+BTQhVQSJ
   b1q69QkcWxYACJwDLvxzWr5v+418NhdekPB6+eCRJr2EtC/z6S1GbdxOJ
   4xSv92RvSa6vnmnq2FxKuvlrB6Wv5IX4hf4KbKneJMM3HGekxZMT59kSO
   neOz4GrgHT5C00XAOFSkXiHvVB0tjYivp1plhKDkrdXzfNUBFfsxqFO9z
   FrVUuJB+Chy0wAHmjQNpuK754ZZW4MoXTPkqWDLev3afS9k5YPxG55qPY
   LBvqtpTrnWS3/7wtjctvPdtImZbswy59oSgWQ7qXPYnbaWEpm6aAkjqBl
   Q==;
X-CSE-ConnectionGUID: E9E4RKISRTq6r8xfwNjw3Q==
X-CSE-MsgGUID: vxVq5xpjSGeI0ERLk/egvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73362265"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="73362265"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 12:09:30 -0700
X-CSE-ConnectionGUID: 1z74Pl9nQlGShGkTAc++3A==
X-CSE-MsgGUID: XSKz61+cTuKOvi1VgdyMlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="211439776"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2025 12:09:29 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6w10-0001GL-1L;
	Thu, 09 Oct 2025 19:09:26 +0000
Date: Fri, 10 Oct 2025 03:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:stacktrace_test 1/8] ci/diffs/.keep: warning: ignored by
 one of the .gitignore files
Message-ID: <202510100337.cg9Rp6Ur-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git stacktrace_test
head:   47ac1cfc037407f00f6989151bfd59dfcdf1eb38
commit: 55580076aa70f3d3221624e9327d41ba1f6d49e1 [1/8] adding ci files
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251010/202510100337.cg9Rp6Ur-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100337.cg9Rp6Ur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100337.cg9Rp6Ur-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
   .github/scripts/collect-scx-bpf-progs.sh: warning: ignored by one of the .gitignore files
   .github/scripts/compare-veristat-results.sh: warning: ignored by one of the .gitignore files
   .github/scripts/download-gcc-bpf.sh: warning: ignored by one of the .gitignore files
   .github/scripts/matrix.py: warning: ignored by one of the .gitignore files
   .github/scripts/tests/test_veristat_compare.py: warning: ignored by one of the .gitignore files
   .github/scripts/tmpfsify-workspace.sh: warning: ignored by one of the .gitignore files
   .github/scripts/veristat_compare.py: warning: ignored by one of the .gitignore files
   .github/workflows/ai-code-review.yml: warning: ignored by one of the .gitignore files
   .github/workflows/gcc-bpf.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/lint.yml: warning: ignored by one of the .gitignore files
   .github/workflows/test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-kernel.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-meta.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-scx.yml: warning: ignored by one of the .gitignore files
>> ci/diffs/.keep: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-disable-detection-of-llvm-when-buildin.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-work-around-latest-Clang-smartness.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20250718-libbpf-Fix-handling-of-BPF-arena-relocations.patch: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

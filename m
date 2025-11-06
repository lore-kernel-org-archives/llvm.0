Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159FE2F6921;
	Thu,  6 Nov 2025 21:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762466355; cv=none; b=TCtrsUSbQAxm2s+5g9gVvd1T20Yyr/Y0HSgGOw+pXVBG3z3fdojNgHy7WXTkxdTaLAsxWm/Uoxpf1r8scFFZurPhdsoeOB+Eia5g6JVLPQxuEkJ1jOfZlrJNzYQQEQGe7fUzAskWArwN8N4oRaxPzEaQ39knJ5VN/qSvX6qxwOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762466355; c=relaxed/simple;
	bh=f2fgpk/NqhP46BrMUB0iUtUhTu6o3vz5BQ2Yf/vGbGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/GvGxLHKRAuOoZFAwLBnm08f9Ygr3qwaWNMKB99zT4et9YIz/+x5WBNfcchuDrXcCmm68McEALeQ4DUx/7GgKsd+orpZBCZYFuLoMA1IGeUMN3kqleupE9tv+9vdAtLI1oj6gfd4LykSkxTV2463RtL937Ox8FzaF6GaGwLB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ozm5+m+u; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ozm5+m+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762466354; x=1794002354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f2fgpk/NqhP46BrMUB0iUtUhTu6o3vz5BQ2Yf/vGbGA=;
  b=Ozm5+m+uU8maMhru78Yk3UkWbbdI/ueafVQ+VSLkCfDhoyAiumV1KRTN
   7rWLBi2ykcbUnIlF6ouviLSSMAgmrtMPqYd/0rhGgH+Kj0y2+hx8aS57F
   mjUIRbIoJy9g/nmrH30YjEw3oQQrZ6tGNOxWA1pH94cCVkSywXcLFh/F4
   S0QM7t+rhp2+CaLYGwUqPH4g4ZBj3wPGVzK89XCqrOnkT5fG3lElbYbwk
   YiLpW4tltImW7KV/oCKnfI5lNZGTPyLXLzpe55zXN7MMkN51FiNo5F6We
   WaIVImWcY1ZmRq86FMupPj2zTufxXoqZu32WAWiK4ogQO4Ovrflsd1G9g
   A==;
X-CSE-ConnectionGUID: DZDyDAS5RJahhr47gnmBPQ==
X-CSE-MsgGUID: j6kUjTRLTv+PV6MX7Ea/aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64500250"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="64500250"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 13:59:12 -0800
X-CSE-ConnectionGUID: SWGY3dJeSA2hCx0whumAvA==
X-CSE-MsgGUID: OJwoTGrqS2yWbKXS9zVp+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="193045557"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2025 13:59:11 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vH80a-0000000037U-32A3;
	Thu, 06 Nov 2025 21:59:08 +0000
Date: Thu, 6 Nov 2025 22:59:07 +0100
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:override_1 93/95]
 ci/diffs/20251014-selftests-arg_parsing-Ensure-data-is-flushed-to-.patch:
 warning: ignored by one of the .gitignore files
Message-ID: <202511062244.KwR0j6PC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git override_1
head:   6b8d52e68fa760c717bca4fc78061b6695d46dbe
commit: de0745f7cc98146c70a020bc3a1b73c7f3405282 [93/95] adding ci files
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251106/202511062244.KwR0j6PC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511062244.KwR0j6PC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511062244.KwR0j6PC-lkp@intel.com/

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
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
   ci/diffs/.keep: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-disable-detection-of-llvm-when-buildin.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-work-around-latest-Clang-smartness.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20251014-selftests-arg_parsing-Ensure-data-is-flushed-to-.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20251014-selftests-bpf-make-arg_parsing.c-more-robust-to-.patch: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

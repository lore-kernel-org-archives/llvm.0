Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F292E9726;
	Thu,  9 Oct 2025 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760018273; cv=none; b=Y6tVSWmxvy6qhbTtMI8qpKVmC2Ai9Dz9AHMP8KDz8o3x6h5dPBMXdv6Pzy5I05O5KkuIK4n3RC9xP5T8fPl69Ei2Fl6Lj94V1EZS62Eo+R6p/0FJZ/7K4li7HkFyIXL9QIKhpB4t+M91HuTT0l+15pXL28OGlFHMF4Pw8n+9L4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760018273; c=relaxed/simple;
	bh=PUOvhX8OTnkRad/k4dExwTJ/hXmEbVwmp8ViCpR9Sxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TLcNhuBC5LWEQlyio3ksqv2xFCWraW3cxbsIHRG4sYItJIySWIAYLfYyirnKRZS/yDwU0+nGNM8br5WecUxk6OyW8K/Ti21EFeCfMr0BKkOzoPwFxH0udsNhC+JRgEZAegkgdI6+8dPvdvN0ia4E5JbuOWiyi0L4dhvNcjTIcKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvx0yAOw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvx0yAOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760018272; x=1791554272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PUOvhX8OTnkRad/k4dExwTJ/hXmEbVwmp8ViCpR9Sxk=;
  b=hvx0yAOweJ3CYxBP4+KuVbmJUROYOn9TFmA5EB0PUI1IqO5TiI0n42CL
   Us5f5PsLqUuvkrB7fnhDkaBpn1V2cvZesLIRx+GYa5DsgKHftkHcs6JW4
   Ab+Z2yNIRYLwd/qDWgc5BkRdu7m5+5nHmxHMTtVk8akAFAUEIwQWWrUlr
   Afz/+s+D5QnbhIr/Wkp4zfFRVBigr7FnjTvvObxxPmsoJ2SUm3oxKg1ft
   MvJ9AQLIygOyGYXLz1akX+WMSbeewvgQWoWY+rszwwUqTmVafCiV8t96F
   5R7CQVAB0tMs2S/wo/PYUEtrEi214tYCiiCL6GsI0Qa7l2HTILepfFQrM
   A==;
X-CSE-ConnectionGUID: BhIGO/3OR/O+N5k/zPLqlg==
X-CSE-MsgGUID: JcMyKPJWQlyO24wA2V7PpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79873141"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="79873141"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 06:57:51 -0700
X-CSE-ConnectionGUID: Y6JD8NTVR46nxly+gGH4Jg==
X-CSE-MsgGUID: kl1DkrNSTd25N8fReomfnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="211364158"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2025 06:57:48 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v6r9O-000000008CD-0jgx;
	Thu, 09 Oct 2025 13:57:46 +0000
Date: Thu, 9 Oct 2025 15:57:06 +0200
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:stacktrace_test 1/8]
 .github/actions/veristat_baseline_compare/action.yml: warning: ignored by
 one of the .gitignore files
Message-ID: <202510091548.GHCFo8fn-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251009/202510091548.GHCFo8fn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510091548.GHCFo8fn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510091548.GHCFo8fn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
>> .github/scripts/collect-scx-bpf-progs.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/compare-veristat-results.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/download-gcc-bpf.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/matrix.py: warning: ignored by one of the .gitignore files
>> .github/scripts/tests/test_veristat_compare.py: warning: ignored by one of the .gitignore files
>> .github/scripts/tmpfsify-workspace.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/veristat_compare.py: warning: ignored by one of the .gitignore files
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

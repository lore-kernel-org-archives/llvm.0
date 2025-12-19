Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B63246BB2;
	Fri, 19 Dec 2025 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155215; cv=none; b=OM5JuCC3Po13T3DuazCv0RWK7WvboHt7BcfD/DHkl0Ujj9B2MtUh9MlvlbxIkY4vaO3EM4B3ieOrcIRtcglyubbK2vI2yMXu/IIEi75i7/yU8zjvIe2qOVKSQaD2UDrdn6TcXu5tzudTwfhWOOB8uMje7e2U3OGLDZhgRufJROc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155215; c=relaxed/simple;
	bh=dMknMa3Hivq2pMycMjsG6oDFoL3FO+gUmfesAjUuvXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TbIYl5Lx1LyYFOCjq9SeMuTH11od6DVP5pD1Dd0RN8llUwJxG2J9CMUasY0RjEcbIfClk2fvQNGc+EgRT3GLF3ZbIo9b9qEF1HNHk5BG9PyBvOy52jCN2kkSAWsSgfoPUHSYrB7zEOz0VAT65A4JcRelSOPqUaVgUbEkfq7uaYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLiJXxcB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLiJXxcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155213; x=1797691213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMknMa3Hivq2pMycMjsG6oDFoL3FO+gUmfesAjUuvXA=;
  b=fLiJXxcBScmQgfRsfCIuWc5Hszdk+B35f+T1BOfr0H6kl3E3hMl8bHtL
   7Yn9RJvEnTdlXJFYEaFJdygVhbBuPPQMBayPP22gJBaJly1O/FVFZpGbd
   ADGFXtwylP6mpSnsW6/J3yElO4ZmfSkbJ2TRWz8fDXPE5jn9oThUfwU3u
   J0wrb89IyH7QZG9F+vY1DN8MnOuLZGjDoZauCyOfUC8yiTlKLARTNVH7u
   g1mcX1eNb3rJOR3Knbx0w2Gs06Wxjw/bkao08Ss6i/gAACPN2OkMTf18k
   p8cPtRQsFriI7cl8dnKD6UzhULyw84yvLRq53JP9S7sTabgiobk6rvay4
   A==;
X-CSE-ConnectionGUID: 7NmFbDqWRl2hx6tFsD/UfQ==
X-CSE-MsgGUID: SjZ67pICRM68/GWGWbDZgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71975078"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71975078"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:40:13 -0800
X-CSE-ConnectionGUID: R7dI4D1mTtSAQ5O5LlhYmQ==
X-CSE-MsgGUID: JuMKLH3VSLeTgQqK1CMTiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="199125463"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Dec 2025 06:37:29 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWbbj-000000003dV-0MvS;
	Fri, 19 Dec 2025 14:37:27 +0000
Date: Fri, 19 Dec 2025 22:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 2/5] ld.lld: error: undefined symbol:
 kunit_kfree
Message-ID: <202512192201.T9ecWTgW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   9fd0a6b1cdf040215994ff60cdf83b349d5480c4
commit: 7b244ac0f694315794b60badb50cb146f2f5fc8c [2/5] WIP: lib: add basic stacktrace tests
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251219/202512192201.T9ecWTgW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512192201.T9ecWTgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512192201.T9ecWTgW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_kmalloc_array
   >>> referenced by test.h:501 (include/kunit/test.h:501)
   >>>               vmlinux.o:(std_test_init)
--
>> ld.lld: error: undefined symbol: kunit_kfree
   >>> referenced by stacktrace_kunit.c:47 (lib/tests/stacktrace_kunit.c:47)
   >>>               vmlinux.o:(std_test_exit)
--
>> ld.lld: error: undefined symbol: kunit_log_append
   >>> referenced by stacktrace_kunit.c:22 (lib/tests/stacktrace_kunit.c:22)
   >>>               vmlinux.o:(std_test_exit)
   >>> referenced by stacktrace_kunit.c:27 (lib/tests/stacktrace_kunit.c:27)
   >>>               vmlinux.o:(std_test_exit)
   >>> referenced by stacktrace_kunit.c:245 (lib/tests/stacktrace_kunit.c:245)
   >>>               vmlinux.o:(test_unwind_reliable)
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: kunit_binary_ptr_assert_format
   >>> referenced by stacktrace_kunit.c:259 (lib/tests/stacktrace_kunit.c:259)
   >>>               vmlinux.o:(test_nounwind)
   >>> referenced by stacktrace_kunit.c:259 (lib/tests/stacktrace_kunit.c:259)
   >>>               vmlinux.o:(test_nounwind_tail)
   >>> referenced by stacktrace_kunit.c:259 (lib/tests/stacktrace_kunit.c:259)
   >>>               vmlinux.o:(test_nounwind_notail)
   >>> referenced 6 more times
--
>> ld.lld: error: undefined symbol: __kunit_do_failed_assertion
   >>> referenced by stacktrace_kunit.c:259 (lib/tests/stacktrace_kunit.c:259)
   >>>               vmlinux.o:(test_nounwind)
   >>> referenced by stacktrace_kunit.c:259 (lib/tests/stacktrace_kunit.c:259)
   >>>               vmlinux.o:(test_nounwind_tail)
   >>> referenced by stacktrace_kunit.c:259 (lib/tests/stacktrace_kunit.c:259)
   >>>               vmlinux.o:(test_nounwind_notail)
   >>> referenced 10 more times
--
>> ld.lld: error: undefined symbol: kunit_fail_assert_format
   >>> referenced by stacktrace_kunit.c:221 (lib/tests/stacktrace_kunit.c:221)
   >>>               vmlinux.o:(std_expect_callers_present)
   >>> referenced by stacktrace_kunit.c:226 (lib/tests/stacktrace_kunit.c:226)
   >>>               vmlinux.o:(std_expect_callers_present)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

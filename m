Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6228D1373;
	Wed,  5 Jun 2024 21:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717623809; cv=none; b=LGZfNrwDWiCpAMDxZeDcIoBpidSKX1YRmLN3pnwVtQz3BzjehuK6eZDn7VBHc/DH1mN3UlD40Z3MnLwmZXy3+0rh1x9e7XhjReu2JMbNEIhKMHiiea33digwLaucjVkzwNmeBYpj1dIqfWP7pRC4P1WyDhwu1x8jobx46LZ+J2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717623809; c=relaxed/simple;
	bh=T09k4S2kUZFTXncxPkApEbD5zWlwTttZN30wjFoy4mo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suRYHgsO6jsv93kp0mTvfKi8TKWnlUFmsMQnEOzThPuDHIAqYjoVVQyDV7vXhVIN37nNp1vp2abBw3YImopHbHsIy3MBfisE51tLnmoSO1zbdL8zbR2BmZPqE3CoxWi3EyDOmnsxEU+IbywI7+DCqnpDXZgDrMXkHjbAAxCwEjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZrrdjpS1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrrdjpS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717623808; x=1749159808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T09k4S2kUZFTXncxPkApEbD5zWlwTttZN30wjFoy4mo=;
  b=ZrrdjpS1hmzqdhrFm8fpX3WwQLAZH91/ZCP3lPWKTpftm/XnWCo+LT1L
   k2MiufOLXK7U2JHv05xFUEkGibo4aXNIwjn/JyQbBi6QA02MsNDANlsIT
   j4hYlQd7DveB3xYERPwLARTeyI9cw0zBjfgsG8HZoxUQygVTT+zDcr6Ep
   vju8kDpcMOwuTZecPawYlY6XlssyAzwkQhVQ5sHtb8m2w+4KHP3ysVQZ9
   0r+nk06Qc/CuRQ8ThQX8r6/VZdTaYaZDw8Kqv1T1u0szShzB+pq714EG9
   L8j7va2fzHl39WqKGNUp5bAQ2OKkF6KlRvwS1TDojrrCqCYnoi4Xvv3p/
   A==;
X-CSE-ConnectionGUID: ErvspBQqRr+PUVKGfn4pBw==
X-CSE-MsgGUID: F2p/w2cPQvW1+0HADjr5WA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39662633"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="39662633"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 14:43:22 -0700
X-CSE-ConnectionGUID: BnpM9qvoR1mknHAEkVhQ/g==
X-CSE-MsgGUID: /xT3AJb4RdOyLLol3lx4Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="37653654"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Jun 2024 14:43:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEyPc-0002IS-2J;
	Wed, 05 Jun 2024 21:43:16 +0000
Date: Thu, 6 Jun 2024 05:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 30/30] lib/stacktrace_kunit.c:901:40: error:
 use of undeclared identifier 'kp_addr'
Message-ID: <202406060529.9sHU462i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   b355c7c11a4a1cec3478bc7a2f129638d9b5116d
commit: b355c7c11a4a1cec3478bc7a2f129638d9b5116d [30/30] WIP: lib: add more stacktracing tests
config: i386-buildonly-randconfig-005-20240606 (https://download.01.org/0day-ci/archive/20240606/202406060529.9sHU462i-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060529.9sHU462i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060529.9sHU462i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/stacktrace_kunit.c:901:40: error: use of undeclared identifier 'kp_addr'
     901 |         kunit_info(test, "hit kprobe at %pS", kp_addr);
         |                                               ^
>> lib/stacktrace_kunit.c:901:40: error: use of undeclared identifier 'kp_addr'
   2 errors generated.


vim +/kp_addr +901 lib/stacktrace_kunit.c

   884	
   885	static void __do_test_one_async_kp(struct kunit *test,
   886					  callee_t callee,
   887					  const void *tracee,
   888					  kprobe_pre_handler_t kp_handler,
   889					  std_expect_t expect)
   890	{
   891		struct stacktrace_test_data *std = test->priv;
   892	
   893		if (!__do_kprobe_unwind(test, callee, tracee, kp_handler))
   894			return;
   895	
   896		if (!std->hit) {
   897			kunit_info(test, "did not hit kprobe at %pS", tracee);
   898			return;
   899		}
   900	
 > 901		kunit_info(test, "hit kprobe at %pS", kp_addr);
   902	
   903		expect(test, std);
   904	}
   905	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

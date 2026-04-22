Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4687C1624DF;
	Wed, 22 Apr 2026 04:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776831684; cv=none; b=iHyroeAcjxFyiWyMCXT/umwzwWC/1W+ipFgEbmIWiZxqlt/nBLG6FORvPkzJM8wbHD3/ygS17JYNfkE3tTJOm5EfsAVoHGx62spB93BVmjnU3eTTQCg+aJ7N7qRUNjgs08Cq7fnA8ttM5lKBOMPkRcqFnJaSigT0pr9zhNcHHeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776831684; c=relaxed/simple;
	bh=aDt8wDXPoaY1zDrxl3kI+caxm34NbahHmSJfWw18seY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mtyYWicfjOpe92AwOVErBN61L0GgpxQC6/SXfCXsJQNS4OY9iSD46WHU4JJ8A2aNV8+5UUp1fvOUEsOInJxk6oUvXNnjxMu23BVAixT2q4rOdqg5P3mDton6GwYQKPL9PnISy5KfAOEtDkcf09ltQakcOTNslZkKCiU+USQrd1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKl9BypN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKl9BypN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776831682; x=1808367682;
  h=date:from:to:cc:subject:message-id;
  bh=aDt8wDXPoaY1zDrxl3kI+caxm34NbahHmSJfWw18seY=;
  b=fKl9BypNAmjsgY4ISiFwa/NkOCgOZ6nm1uEh++CniRiCGS8STBBwSxZw
   Bs5DcN4tqotDTRhRZggUMlCvrPWt64tMRIHxyMMwvtRPNTv46b/dUpYOa
   IwM/0ErxhuIrviWTeR4lH5bwczf8Q93ML1dlbVGr34/DJO3hRUAq698+c
   PC767TZG3XG+T1ViyTkIe5E8uOy687kwH0uAPMizrPDxMXLjX/nIKkupt
   qwAlrIeU3gEQPtm6123UJ3KhFvkcgF/mXXHDZZCVZiNBgHAsO4PMJg3LE
   5dm12bT2A9egTFC4KuWmKsMJO9inv0ybu6MlhDkbK2cqiht8Jn3m7BCc6
   w==;
X-CSE-ConnectionGUID: KAwhPNj+RGGHBiw3/sFi+Q==
X-CSE-MsgGUID: ml2z33jCRh+F3JLIVLV9ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77963605"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77963605"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 21:21:22 -0700
X-CSE-ConnectionGUID: XzyRC9VmSb2nyDSJk7tcyQ==
X-CSE-MsgGUID: y4uEcKn4Ru2uENbbW3Th1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232155263"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Apr 2026 21:21:21 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFP5S-000000004Ic-0D1u;
	Wed, 22 Apr 2026 04:21:18 +0000
Date: Wed, 22 Apr 2026 12:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 2/4] ld.lld: error: undefined symbol:
 kunit_kfree
Message-ID: <202604221252.wQVekNRg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   224cbf0cef8a49306bab3f8723e83a207d43ad11
commit: 3d53466128c5609a49b1f0e4ae97f3c8e378133d [2/4] WIP: lib: add basic stacktrace tests
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260422/202604221252.wQVekNRg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604221252.wQVekNRg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604221252.wQVekNRg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_kfree
   >>> referenced by stacktrace_kunit.c
   >>>               lib/tests/stacktrace_kunit.o:(std_test_exit) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: kunit_log_append
   >>> referenced by stacktrace_kunit.c
   >>>               lib/tests/stacktrace_kunit.o:(std_test_exit) in archive vmlinux.a
   >>> referenced by stacktrace_kunit.c
   >>>               lib/tests/stacktrace_kunit.o:(std_test_exit) in archive vmlinux.a
   >>> referenced by stacktrace_kunit.c
   >>>               lib/tests/stacktrace_kunit.o:(test_unwind_reliable) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: kunit_binary_ptr_assert_format
   >>> referenced by stacktrace_kunit.c
   >>>               lib/tests/stacktrace_kunit.o:(test_nounwind) in archive vmlinux.a
   >>> referenced by stacktrace_kunit.c
   >>>               lib/tests/stacktrace_kunit.o:(test_nounwind_tail) in archive vmlinux.a
   >>> referenced by stacktrace_kunit.c
   >>>               lib/tests/stacktrace_kunit.o:(test_nounwind_notail) in archive vmlinux.a
   >>> referenced 6 more times
--
>> ld.lld: error: undefined symbol: kunit_fail_assert_format
   >>> referenced by stacktrace_kunit.c
   >>>               lib/tests/stacktrace_kunit.o:(test_unwind) in archive vmlinux.a
   >>> referenced by stacktrace_kunit.c
   >>>               lib/tests/stacktrace_kunit.o:(test_unwind) in archive vmlinux.a
   >>> referenced by stacktrace_kunit.c
   >>>               lib/tests/stacktrace_kunit.o:(test_unwind_tail) in archive vmlinux.a
   >>> referenced 9 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

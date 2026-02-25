Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB23392823;
	Wed, 25 Feb 2026 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027577; cv=none; b=TIbxXrVSpz5At+g6R9z2eMp71Minrm+WJwSbqD2q/z+iSaQA5YdImE+DYYlDQT5eVmNHN1cG/1S1cDL6XXwE9kkFv1bf1XKWv6/FtZuHkS2k9PwYNkq8a6YVnpW0miwLqWHsamjf2yGbC7MXZt+Q5NSwMhXsw0VDtcpcJ/kn/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027577; c=relaxed/simple;
	bh=ZlWxZZDA/SqWM7euxm5n3ABVZ4qfuYRnnIfIxLLvMhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i3MaCbKx+6gQeiYjbi0xcxNCuFoE7tOrovO2RnINzSDrernD17j1iFcZiksg55NlGFaFowWHpiItmjADNBV2hgwn5MzNtzvaPAl+KqOBe+LNA7o2hsf8b7rnmoGMpi8XznaaCgSYiuuvRQ8Hs3wT4gap0qrNa5IqFxK5y5ETyUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+I3LB1E; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+I3LB1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772027576; x=1803563576;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZlWxZZDA/SqWM7euxm5n3ABVZ4qfuYRnnIfIxLLvMhE=;
  b=X+I3LB1EUkjU7rOXDozLZOBbf8AytPpom/XySxS37BVpPxMcPo/FBPP+
   jtMRvbBW7Zo+xUbT/0qazdmkxVdph3pRm1o0k17Fk2sfrmqgoXHWXGZNZ
   SOxvfj0UzfKQrsMMvE8lQfFbPJ5vuvWx7oUAUgQSl4x5BJ2rey/duff/o
   yobWbZaaJeFwf0CEaG+vPtJvUoUOaPfwQSPdEzCy8p8/+utlFO08nQuR3
   Gss7sVFKROIdo++apt1JbtaDQtbVuzw3O6lvQTYHFDgj5azP/XQkMzMB7
   L+tIJynVO/t3qVINoCOhe120B5ujHs4hlTDyhVVFecWKk45JOGtiULF6H
   Q==;
X-CSE-ConnectionGUID: Yo0WybPUSyCXU+DmM1paDQ==
X-CSE-MsgGUID: 2y+kVUV3Q7+MO+khW30+dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90643404"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="90643404"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:52:51 -0800
X-CSE-ConnectionGUID: N8vRWJwSR3CRZwlMU/in0w==
X-CSE-MsgGUID: Dpx2BrPtS+iMS5i9CQPUlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="215342719"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Feb 2026 05:52:50 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvFJn-000000005uR-0fJB;
	Wed, 25 Feb 2026 13:52:47 +0000
Date: Wed, 25 Feb 2026 21:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:sched/preempt-dynamic-optimizations 1/1]
 kernel/sched/core.c:7455:13: warning: no previous prototype for function
 'dynamic_cond_resched'
Message-ID: <202602252156.hrM5Y5Kz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git sche=
d/preempt-dynamic-optimizations
head:   16adb0d62633d31709c26ea63ab9de6ec1bbdf4e
commit: 16adb0d62633d31709c26ea63ab9de6ec1bbdf4e [1/1] sched: Avoid generat=
ing cond_resched() code when CONFIG_ARCH_HAS_PREEMPT_LAZY=3Dy
config: s390-randconfig-002-20260225 (https://download.01.org/0day-ci/archi=
ve/20260225/202602252156.hrM5Y5Kz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a1=
09fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260225/202602252156.hrM5Y5Kz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602252156.hrM5Y5Kz-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:7455:13: warning: no previous prototype for function=
 'dynamic_cond_resched' [-Wmissing-prototypes]
    7455 | int __sched dynamic_cond_resched(void)
         |             ^
   kernel/sched/core.c:7455:1: note: declare 'static' if the function is no=
t intended to be used outside of this translation unit
    7455 | int __sched dynamic_cond_resched(void)
         | ^
         | static=20
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=3Dy] && OF [=3Dy] && HAS_IOMEM [=3Dn]
   Selected by [y]:
   - REGULATOR_RT5133 [=3Dy] && REGULATOR [=3Dy] && I2C [=3Dy] && GPIOLIB [=
=3Dy] && OF [=3Dy]


vim +/dynamic_cond_resched +7455 kernel/sched/core.c

48f24c4da1ee7f kernel/sched.c      Ingo Molnar        2006-07-03  7448 =20
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7449  #  =
define might_resched_dynamic_enabled	__cond_resched
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7450  #  =
define might_resched_dynamic_disabled ((void *)&__static_call_return0)
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7451  DEF=
INE_STATIC_CALL_RET0(might_resched, __cond_resched);
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7452  EXP=
ORT_STATIC_CALL_TRAMP(might_resched);
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7453  # e=
lif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7454  sta=
tic DEFINE_STATIC_KEY_FALSE(sk_dynamic_cond_resched);
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07 @7455  int=
 __sched dynamic_cond_resched(void)
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7456  {
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7457  	if=
 (!static_branch_unlikely(&sk_dynamic_cond_resched))
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7458  		r=
eturn 0;
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7459  	re=
turn __cond_resched();
700a78335fc28a kernel/sched/core.c Christian G=C3=B6ttsche 2022-06-15  7460=
  }
04746ed80bcf31 kernel/sched/core.c Ingo Molnar        2024-04-07  7461  EXP=
ORT_SYMBOL(dynamic_cond_resched);
700a78335fc28a kernel/sched/core.c Christian G=C3=B6ttsche 2022-06-15  7462=
 =20

:::::: The code at line 7455 was first introduced by commit
:::::: 04746ed80bcf3130951ed4d5c1bc5b0bcabdde22 sched/syscalls: Split out k=
ernel/sched/syscalls.c from kernel/sched/core.c

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

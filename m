Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943807;
	b=wKNiqyepB71hldSUmhLt9QpkRRg38qdHpiXdNVNi5dOMQ8H9bgMbyBUWSLM3cFhKmeal
	 /j5ex/DfIRWNQFcBRcvfsYfGpKFKtnyLE8uSy4gpsnTb/uKYPANy088HLGGTyT816ZCCN
	 t/zl67IOB9n0mr9n4YwfYamE70oOkueLLsCJ1EFg4WeroMjHZRnQfzlt99uZEjfm5Yqgg
	 uvdWaNs0QcOhjbuFEB719r43j0it+KPoEP89Zc2QWDWR9g3tChhbopU8EDFKbAZYkwF02
	 kPJ0BkvCzUYlwhJFPgUTxiZyMIYb6FBYX+Brndye2h9J2BYdYMVWB4GlCfhdyu/1nCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943807;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=D+0uTd7Fiz1PdKYJmseZKlTaqxjqpV5wpYTf0qfw+zM=;
	b=pfk1rbZMkVUDkRNtl7XTHXl0PRWpotU8+wOdcNnH6sVEXbSMnTp3bqHu683UTmRoRHH5
	 AkG4E50jpLVtBe68gAse3tz/AhaUSHAx6uR3LYR3rpJgme0/7zZcKCrhKOwfjkfnYuAXd
	 Xo+pcvjg7MHIGpPt0wX3uQakl/ev5ia8/o3Xe7Ibbf48EBzUyWdg0eK4Sfvw9/oYzCdTY
	 pj4nrgxumsCVvAynazVb2W0Xf4TTXbNN+y7h0U7NthSkqzuE45zN1kM17olbO3ElfyU+b
	 eV9jqDhkU7boUWJMMbH45lw4B8TiHt1IKdA5FvHjI/YZzupqCWFWPernXuqnhwf2C6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="BUWLqz//";
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0B4606A31B;
	Sun, 25 Oct 2026 15:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B0B4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BUWLqz//
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792943806; x=1824479806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EawrB5XjZB0XigDCkN5Uy3YrorGxG3YhVJWfxLhFgNA=;
  b=BUWLqz//A4DMUmraVYH2j1vysSKavDBWJp+DxjW8r9U9iGVCUqEpJ6Fg
   RE6VSDn8K4dzXFOJbx9q2YtAfCm53gkiZGWAtg6M51d4ENhBZqpWWsG0T
   ZAP3dSCSONQ8eOOB7Q06WUlBfGbaBYtFZXr8tEg3ALKsY8UHOdmlj3bRU
   AqpyfH7/qMFJFpT8QSy/CEPsREMYB61e6Huo8DFAqwTOubK67hWCi554m
   3T2LRU4OLlpfuR/BbNkBhTRtexFKf6NGIAXKbEgukOT5svIYk95VZTM0l
   MbvrxQFpQpwcpsojDAOVWlwxcSJwVRPBkkty7v8wAP4dc1Fhg3U8ZEPuZ
   w==;
X-CSE-ConnectionGUID: 79IcGH9ORJiFZqkCOzANrQ==
X-CSE-MsgGUID: bM5HmSnhQ5uLl/zKB/rAZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1515174"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1515174"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 08:56:45 -0700
X-CSE-ConnectionGUID: AHxzXgnvTe+0W6sDduprHQ==
X-CSE-MsgGUID: KtU5TZNoQZC5RRgiOwWm4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4403549"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2026 08:56:42 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL0aO-00000000Uss-0G5A;
	Sun, 25 Oct 2026 15:56:40 +0000
Date: Sun, 25 Oct 2026 23:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>, Wei Wang <wvw@google.com>
Subject: Re: [PATCH] sched/uclamp: Fix race condition leading to imbalanced
 uclamp_rq
Message-ID: <202610252327.6QJlXAiY-lkp@intel.com>
References: <20261024233945.74794-1-qyousef@layalina.io>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024233945.74794-1-qyousef@layalina.io>

Hi Qais,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master peterz-queue/sched/core linus/master v7.3 next-20261023]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qais-Yousef/sched-uclamp-Fix-race-condition-leading-to-imbalanced-uclamp_rq/20261025-003945
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20261024233945.74794-1-qyousef%40layalina.io
patch subject: [PATCH] sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261025/202610252327.6QJlXAiY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610252327.6QJlXAiY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610252327.6QJlXAiY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: init_uclamp_rq
   >>> defined at core.c
   >>>            kernel/sched/core.o:(init_uclamp_rq) in archive vmlinux.a
   >>> defined at fair.c
   >>>            kernel/sched/fair.o:(.text+0x1) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: init_uclamp_rq
   >>> defined at core.c
   >>>            kernel/sched/core.o:(init_uclamp_rq) in archive vmlinux.a
   >>> defined at build_utility.c
   >>>            kernel/sched/build_utility.o:(.text+0x1) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: init_uclamp_rq
   >>> defined at core.c
   >>>            kernel/sched/core.o:(init_uclamp_rq) in archive vmlinux.a
   >>> defined at build_policy.c
   >>>            kernel/sched/build_policy.o:(.text+0x1) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

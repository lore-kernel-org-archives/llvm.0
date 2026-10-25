Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792917051;
	b=EVkva+hoilYu8Y19axcOzEXAzCcezTPkpQSePXljyYoDvD7yIowNVTo1VHODUU/81piP
	 kbwKzYoa2No8FrbrGMAj0nZf3WaUdz+G0omsFdcLDk0hiZAdeIB+dctNO6J98SBoBPgBr
	 c+zn774+bYvsSmoU5APi7u+XD9qSKsuNCLYxMPR8dV4pdhlx7X8D0uiADEG4gy573nItY
	 MFTJfbKqxjKWRbb7QxTPj15Y8fDt2FzaYVM+x7ecNa0gccTaEn1IbKJRcXho5HkA8WziA
	 OBOycDJrNPSkTQZSO2RMxjgIAqhlOyzU9hyZ6OkNxnY5L2IlLw4s0BKuWKQqHe+xHRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792917051;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=vu7S66eBR+BMI5j+SHqWsJvnm0TFqBKeL+mz8dKO+oo=;
	b=wDbdFQ+6Lc7FhsSzZR+wbN/cnUnW7R8C2/wyEtc+x8A+AecKTilAl8oGkM2nt+hWNx/L
	 aPmjtMzAxpV1lRy5xr47lRBFuvirpkRqFE0cDb7LeyvkWW0BUy9f/0jwnZTXWAt05ys18
	 k3kYpGPIIKe7H2ErKCzuj0S7MRDP+sgZqIaz01OXJJE+zw4w89ZsghqQ9KNQtFSugSLI0
	 oG1EGzwMHwBi8CObhIZJaVgCY5T3eh7UGmwmvDmo/6Z/H8WZOSAbs939PQ0G7Z0rb27TM
	 O0KixRXFKIi1YchOfthwmYjX6Szp64KNEsTIik6RUMauFQ7TjpLVcMt9V6ZDqc7bkrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tv0TdIYs;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D60606A31F;
	Sun, 25 Oct 2026 08:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D60606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tv0TdIYs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792917050; x=1824453050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vilP+SpyKHNiKB9HI03pA9/WSQ1f6m5twXV5OVV+KFE=;
  b=Tv0TdIYsUFVNlCdVa3ShyurdvAxvrPtVFOgQEy2bZbApJnAUAOp4JFor
   4XOnFQ58Wfj7BrnCP6w1MfeWqXCQeyDfguOgANl935OmE6fNq7+aPuOJI
   84yWhG84A5NlsbMBxzUpg+fvNeQE/BqBayKv5uk8cl7dLHEznse5bMLPJ
   ow7Ex3izCdrNACrSa0IlQTdLFn4lFEUECaY5uDjK+hUU0k3yA83eaN/jo
   6tH0kIbK64FU2Ng8giJ70nbTXcxFtbMHk6B/UYCFveO40/ibMXiI3b8Zn
   UwSCwci4LdN9vy5BTbFH8wh94W38tsAb7lfaLCABBsjaiMbhOVLfI3H77
   A==;
X-CSE-ConnectionGUID: T2SXppzxQ5+QKsD+fsy20A==
X-CSE-MsgGUID: /Ik6YJG6STq+BE+SHeNKQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1636009"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1636009"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 01:30:47 -0700
X-CSE-ConnectionGUID: okoY0pRNSZeT2pH5U3zXzg==
X-CSE-MsgGUID: jjkiaTKeRKGWJ1Wiew2XjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4361350"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2026 01:30:44 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKtcn-00000000Ug2-0SFb;
	Sun, 25 Oct 2026 08:30:41 +0000
Date: Sun, 25 Oct 2026 16:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>, Wei Wang <wvw@google.com>
Subject: Re: [PATCH] sched/uclamp: Fix race condition leading to imbalanced
 uclamp_rq
Message-ID: <202610251644.6weWofAv-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tip/master peterz-queue/sched/core linus/master v7.3 next-20261023]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qais-Yousef/sched-uclamp-Fix-race-condition-leading-to-imbalanced-uclamp_rq/20261025-003945
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20261024233945.74794-1-qyousef%40layalina.io
patch subject: [PATCH] sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261025/202610251644.6weWofAv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251644.6weWofAv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251644.6weWofAv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
>> kernel/sched/sched.h:3833:6: warning: no previous prototype for function 'init_uclamp_rq' [-Wmissing-prototypes]
    3833 | void init_uclamp_rq(struct rq *rq) {}
         |      ^
   kernel/sched/sched.h:3833:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3833 | void init_uclamp_rq(struct rq *rq) {}
         | ^
         | static 
   1 warning generated.
--
   In file included from kernel/sched/rq-offsets.c:5:
>> kernel/sched/sched.h:3833:6: warning: no previous prototype for function 'init_uclamp_rq' [-Wmissing-prototypes]
    3833 | void init_uclamp_rq(struct rq *rq) {}
         |      ^
   kernel/sched/sched.h:3833:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3833 | void init_uclamp_rq(struct rq *rq) {}
         | ^
         | static 
   1 warning generated.


vim +/init_uclamp_rq +3833 kernel/sched/sched.h

  3832	
> 3833	void init_uclamp_rq(struct rq *rq) {}
  3834	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

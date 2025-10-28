Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A9219DF62;
	Tue, 28 Oct 2025 23:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761692925; cv=none; b=fiz9qZwO+5Z6rTyLNIN/RkcUzkfJMh2IYrBcyEZS6HbGpkL53NMl+9cVU+Bz99h+DjNbAx5pb2RWr1mhk0V9TUmdYmr2WsqOBe6x46c9Oql8BLyNc0jB1ZOprJVJi2qprxGd1JmoLZInhokFpHrI4h85xEWGApBEq+ff+vlHR7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761692925; c=relaxed/simple;
	bh=evMq5rDzC51KQXrcy3CfPKW63LeNpech/td6v+Hhg5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBahSryDfCJDt0e0aazro87bedzAOMCOSs65+dUOe1EPHoGAlQUxf67/H4h/m+uP9tdtYs5+ER/++oO1FIpmVMRnzIZUOEgaRPoSI7qPdYKDD60ks9sT3J+Y2AAdLHWXBU8qzAJTFZxYg03n6c79ycmmv51LtCXA9C91hp9Tmik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/saXsgB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/saXsgB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761692924; x=1793228924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=evMq5rDzC51KQXrcy3CfPKW63LeNpech/td6v+Hhg5Y=;
  b=m/saXsgBJ+Bx4V1xjI07WJBt/7pk6j03nvKFcYEPsj/FyRIVDxQKGyDr
   ufVxApfZtrkT4X5Qw+Py1X8B0jiK+PyNC74Hp7Jzq37I8s8ASZj+pyokL
   K0QVR8MUXUEBKdoZ1O27ijUs6E5EHcfcF8yGvwBJKO/d1IjFPkF7Luvie
   5FdPml60UzTLU10/HyBaL5hkkvPVNfaKXZgnbGIhIOV3SUSwrVUHPsULK
   lj9RR51Qt9KMsN1Vi11k5oISgpW/wEsgUE9OqncI6lmfeCb6Ajf7vFwTW
   fLLOMRxPmRSK8kr4RVc8ABQU5+NGPMaIKTUkwbaGLOtSyccPrGlvo709d
   A==;
X-CSE-ConnectionGUID: L0tL4jUfSjy+DvKp103Rng==
X-CSE-MsgGUID: OucHcGZDRz+jKgeuNeli8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74096744"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="74096744"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 16:08:44 -0700
X-CSE-ConnectionGUID: 0SpLiVV9QryXPnwo4JNZKQ==
X-CSE-MsgGUID: YzpAcEb1SK6loevFv1yVBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="190624753"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Oct 2025 16:08:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDsnp-000Jrd-2u;
	Tue, 28 Oct 2025 23:08:33 +0000
Date: Wed, 29 Oct 2025 07:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>, akpm@linux-foundation.org,
	minchan@kernel.org, lorenzo.stoakes@oracle.com, david@redhat.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, pfalcato@suse.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rostedt@goodmis.org, hughd@google.com, kernel-team@android.com,
	android-mm@google.com, Kalesh Singh <kaleshsingh@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v4 3/5] mm: Introduce max_vma_count() to abstract the max
 map count sysctl
Message-ID: <202510290650.ZOY96pTc-lkp@intel.com>
References: <20251028212528.681081-4-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028212528.681081-4-kaleshsingh@google.com>

Hi Kalesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on b227c04932039bccc21a0a89cd6df50fa57e4716]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/mm-Document-lenient-map_count-checks/20251029-052713
base:   b227c04932039bccc21a0a89cd6df50fa57e4716
patch link:    https://lore.kernel.org/r/20251028212528.681081-4-kaleshsingh%40google.com
patch subject: [PATCH v4 3/5] mm: Introduce max_vma_count() to abstract the max map count sysctl
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251029/202510290650.ZOY96pTc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290650.ZOY96pTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290650.ZOY96pTc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: max_vma_count
   >>> referenced by nommu.c
   >>>               mm/nommu.o:(split_vma) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

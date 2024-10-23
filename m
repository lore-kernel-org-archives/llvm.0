Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163723D97A;
	Wed, 23 Oct 2024 02:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729651642; cv=none; b=HnFnbFt6O52zGl26RNVbN5F9Hqe4O4OYuVX83TRcYIM6HiXPWwzEAJfPlIc5zrTeIJQzEaEtRBjNyxwjCf2Hf9PpjC4YSfY3G/IzEcLsQoYmULFVFE/vtRozGiL1ycKr+0FloJz8Xq8Q0BCCwZssgZ3IwgIJ8xEcABizObjBQlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729651642; c=relaxed/simple;
	bh=0jx7Wx/FoLIjWj+Tajn8bC0PCcGz7+nk72J7B6OIaKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAzKtMPVaIN8bWaQdw+NtDXCj1q1t0W1/TlXVivaCVZDYbg5lAS/4nHEKN8FEgCZDtK8frOv0z+aHdc2OtiK458fNkd7zT0eHi68G0dTCvyF5GqOiX5JDNAotmbj7I0zd7f7BE+FrRQEsppucYwUizU/8/oycfVTsCckFBm71Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLBn64Us; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLBn64Us"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729651641; x=1761187641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0jx7Wx/FoLIjWj+Tajn8bC0PCcGz7+nk72J7B6OIaKA=;
  b=RLBn64Us8gob0huyPuXG2pzwMUmM6Gm1Wyd4/uQnkSdMQIbtrVH8jtqw
   ympF3UKdveaDm7RxXZov51ExVppsVyqtBNuKC0UILmyR7ydOdX/i7Mvmg
   nDuK0r2XYH0URRvJFMDx6k7S3D6FQDo3Cqpnfym9SbK2oBjuMDt13P0Sk
   metDzl6fNLB516vrGitJg/gNc0gBaW2+JSnVDrRJI+tQCD8d6rpCajyan
   KYr2ne9liGuuodRLU1mHSHfJzPitarTx3cb9q4d6hMJ+lTjdtlQG4EwVE
   OE3EX0HNRzKpmbJMy1RW3gvc2Wfv7lk8RYn9OtGqF1fISxhdeMfi/lSjE
   g==;
X-CSE-ConnectionGUID: IWFKjD4iS8OUbH88JSoFfg==
X-CSE-MsgGUID: 0YWvOuDAQCSGHDyPpa7/oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29381858"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29381858"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 19:47:21 -0700
X-CSE-ConnectionGUID: zukgPvMZTz+0c9kB9sEVlA==
X-CSE-MsgGUID: Hjv53XWgRguXi6ti0AcrvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80864126"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Oct 2024 19:47:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3RP3-000UNM-0J;
	Wed, 23 Oct 2024 02:47:17 +0000
Date: Wed, 23 Oct 2024 10:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] rseq: Validate read-only fields under DEBUG_RSEQ
 config
Message-ID: <202410231007.2hFp5Cwl-lkp@intel.com>
References: <20241018171219.256647-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018171219.256647-1-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on akpm-mm/mm-everything linus/master v6.12-rc4 next-20241022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/rseq-Validate-read-only-fields-under-DEBUG_RSEQ-config/20241019-011655
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20241018171219.256647-1-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH] rseq: Validate read-only fields under DEBUG_RSEQ config
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241023/202410231007.2hFp5Cwl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231007.2hFp5Cwl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231007.2hFp5Cwl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/purgatory/purgatory.c:10:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/vmcore_info.h:6:
   In file included from include/linux/elfcore.h:7:
   In file included from include/linux/sched/task_stack.h:9:
>> include/linux/sched.h:1368:16: warning: field 'rseq_fields' with variable sized type 'struct rseq' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
    1368 |         struct rseq                     rseq_fields;
         |                                         ^
   1 warning generated.


vim +1368 include/linux/sched.h

  1357	
  1358	#ifdef CONFIG_RSEQ
  1359		struct rseq __user *rseq;
  1360		u32 rseq_len;
  1361		u32 rseq_sig;
  1362		/*
  1363		 * RmW on rseq_event_mask must be performed atomically
  1364		 * with respect to preemption.
  1365		 */
  1366		unsigned long rseq_event_mask;
  1367	# ifdef CONFIG_DEBUG_RSEQ
> 1368		struct rseq			rseq_fields;
  1369	# endif
  1370	#endif
  1371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

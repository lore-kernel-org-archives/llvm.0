Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A226A1DFC5;
	Sat, 13 Jul 2024 19:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720897305; cv=none; b=pKpOiZ0ddnKX18mrAHqbJPt1umhn9VluiyQ4NjbjPg74+fQchoXuP1KG4X57U4BoW7QcLOjIBDesG2XQ2KKErl9pxzuOVYFQcf4Szfw2fPFPY7vWhhlcD83MH6+vv0fNuoGKFsNpL1awkWDtxrxw/F1grc3P/M2sKB7R+kgBSvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720897305; c=relaxed/simple;
	bh=9BY+d/8izjTMVxxww5HYgFKulEppUH8bk0u3aKiLtDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=senvQ7LLQtDLzuXVGvXu3utUbI7qb3Fmbdk23lB6RpSZRUB4MslhHtNScAyxSiTXcWqtnVsTSMjTc/ln6+0EH1ouXTuWKxAMariRa+cAS2D82/wLRdCr+/LNlfvmqgaxQd9uicYv2NBB2nEC6Yp2Lx+r/RLoXiiikJz0ZxnaDbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1dHQIXa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1dHQIXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720897303; x=1752433303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9BY+d/8izjTMVxxww5HYgFKulEppUH8bk0u3aKiLtDE=;
  b=U1dHQIXaicwsWyLZn1FrR8vfrdmYNd9LIveLeVDlP0vPofVa3Nwd5HPy
   unhGIqBat6Lc4AXYWKHCNZ8N37Ucw+ABMVi52G1CLv9ekTJw3hxJcnkYR
   bHWfyRMdVuFXzCBdj+aHRDOj/szh5MshG52NEX8NXyXshZGLvhsnGGo0C
   vmN4iD34or+9aTSEvqtVVQ+Cif/CoN9oDXqwH99A2/3tIMEyTTquRLrXN
   HoS/S0Z2HnidDh52rdVRzY7m36VzPuz8Pga2Q2gyRhDelxpAARCthykKY
   8r8uS9k1CJa/bvvdBT1bJpcQuBhO0bGuPVhDc1ytH2K3UAh+5dDHkeHhf
   g==;
X-CSE-ConnectionGUID: Jky/VoWeTWCQk4ee8vqZkA==
X-CSE-MsgGUID: b6QfDMOvRCOMERQRDCYk3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="18474018"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="18474018"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 12:01:43 -0700
X-CSE-ConnectionGUID: tZCrf5j0QPm1AaFQf17+og==
X-CSE-MsgGUID: Ssmvl4GBQ6OpM5URljpwUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="49866541"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jul 2024 12:01:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSi03-000ceM-2F;
	Sat, 13 Jul 2024 19:01:39 +0000
Date: Sun, 14 Jul 2024 03:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 09/10] sched/fair: Add a class->task_woken
 callback in preparation for per-task throttling
Message-ID: <202407140243.hhdyC70l-lkp@intel.com>
References: <20240711130004.2157737-10-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711130004.2157737-10-vschneid@redhat.com>

Hi Valentin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master]
[cannot apply to paulmck-rcu/dev linus/master tip/auto-latest v6.10-rc7 next-20240712]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Schneider/rcuwait-Split-type-definition-to-its-own-header/20240711-225336
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20240711130004.2157737-10-vschneid%40redhat.com
patch subject: [RFC PATCH v3 09/10] sched/fair: Add a class->task_woken callback in preparation for per-task throttling
config: i386-buildonly-randconfig-006-20240713 (https://download.01.org/0day-ci/archive/20240714/202407140243.hhdyC70l-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407140243.hhdyC70l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407140243.hhdyC70l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:13303:3: error: field designator 'task_woken' does not refer to any field in type 'const struct sched_class'
    13303 |         .task_woken             = task_woken_fair,
          |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +13303 kernel/sched/fair.c

 13301	
 13302	#ifdef CONFIG_CFS_BANDWIDTH
 13303		.task_woken             = task_woken_fair,
 13304	#endif
 13305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

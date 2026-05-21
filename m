Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D151E3E16B1;
	Thu, 21 May 2026 19:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779391287; cv=none; b=sogdXdyElMjKY3/FrWY1oC3JLFJd8mOSsIX3VNKzJ+v5dVeCXXiTdIFrrsKFUoi6u0baxoP78ypkHFG05ZsTDVO0sI6cGbetd7RGrRqfZAJXt0Yss3MKMXYuy0CtuVOmiANZMyMXHXMAEppD1x9atVRk/fIjdfmXc2Lu44LxAEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779391287; c=relaxed/simple;
	bh=b6nOWyTDroqhcDcwZGxCJHxHS25SekWGkaASQS+AZ1o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P0R8cP392JXNl2GMvCgKvCoVs0dp3vbSX1XbLw1sGHHkgLTNUHrtntDOrkedAqyfRg/vFEG/XwM4dhXBgnVDSQCruUesOYPBmfoS4/MiP3XoGE9w9HfXI1cwbh7HhxSjh7WXIhVWbAurQp7/QmODskKLEW/qFe+Qf8hLcfOQ6o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cL2EbLkr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cL2EbLkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779391285; x=1810927285;
  h=date:from:to:cc:subject:message-id;
  bh=b6nOWyTDroqhcDcwZGxCJHxHS25SekWGkaASQS+AZ1o=;
  b=cL2EbLkrk2PMy0ig5gdEjC0Rt5JUgXNm9TUKSGYZQ/AucFzo8Nf2+vJn
   EAK6Vxs7AK9HKYGWdX5MANczVYXadQnN0BizUEdKe8GJUR4wvHZ3wHVGb
   bK+4NKFWo9XGcVFOFW9MS5owvXTOsuojaWYPiA9EUtlNhMS70TaQxLiiW
   CwPRPUaHKFd5+cAoxglS4+rygv9pxl7CixbwDG7OsmOaCcxanHT0ALy6r
   uewNPgKxRx7eEG28ps7jihgwHscftHWfPDiDArvjraREAdwX34SIlcV9J
   1FSOnFVxtmzLHEdYyqD71umHgnVCW/f62K7M4R5as+Gu89YNyJ/8U36+K
   w==;
X-CSE-ConnectionGUID: VNB3oG1mR4KKynLL8f1+mw==
X-CSE-MsgGUID: dePuJYBzTfGMAqmaDt+BWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80375534"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="80375534"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 12:21:24 -0700
X-CSE-ConnectionGUID: DhmOvaGmRu2UMu2R8jea4w==
X-CSE-MsgGUID: v6MYnnG2RR6uNEQd4zKhtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="242438169"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 May 2026 12:21:22 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ8xL-0000000012R-4Bg2;
	Thu, 21 May 2026 19:21:19 +0000
Date: Fri, 22 May 2026 03:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Philipp Stanner <phasta@kernel.org>
Subject: [linux-next:master 445/7547]
 drivers/gpu/drm/scheduler/tests/tests_scheduler.c:675:10: error: initializer
 element is not a compile-time constant
Message-ID: <202605220312.Pu7UO05u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Tvrtko,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   550604d6c9b9efc8d068aff94dc301694a7afdee
commit: 97ef806a53146837f6ca84a1b36763fb3bb67eaa [445/7547] drm/sched: Add some scheduling quality unit tests
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260522/202605220312.Pu7UO05u-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220312.Pu7UO05u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220312.Pu7UO05u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/scheduler/tests/tests_scheduler.c:675:10: error: initializer element is not a compile-time constant
                                 drm_sched_scheduler_two_clients_attr),
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:224:13: note: expanded from macro 'KUNIT_CASE_PARAM_ATTR'
                     .attr = attributes, .module_name = KBUILD_MODNAME}
                             ^~~~~~~~~~
   1 error generated.


vim +675 drivers/gpu/drm/scheduler/tests/tests_scheduler.c

   671	
   672	static struct kunit_case drm_sched_scheduler_two_clients_tests[] = {
   673		KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_two_clients_test,
   674				      drm_sched_scheduler_two_clients_gen_params,
 > 675				      drm_sched_scheduler_two_clients_attr),
   676		{}
   677	};
   678	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

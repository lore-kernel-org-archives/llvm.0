Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47661D61B7;
	Sun,  9 Mar 2025 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741524121; cv=none; b=P0NgcI6hSkqIC/a2HL8OSP5xRJv0pWHYE5pycrHsOoo8vPg+8SFDzPMQx8p0EkCdZ6Ut0boAiBAJx/tkE8wAEM8S5SPQvsWTy3g+wMDCQ7SuEWG7xpm2nHsM5P2UdHaOBjajWd++Axtyn5MJsO5lRMa2VraPkTEOOiCn8iCAiUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741524121; c=relaxed/simple;
	bh=ViCVFRcEyIrzMn8dz3mFPV7p3VWTElchU+Q8wT1rOpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TyEEshuRyxbtd0ASJJp8DBMOdAdnfpaO/MJpBpw5vDpYXbJxZed8Xi4Nv1LFwfMTYguh6EJZa75bJoz2YA5kV2o88p8vAP1u7iY/y4ak8ven5m9jgHyYET7L1m3NAs7l5T9FCmhI6GO5cQhiI8uMmZEcr485fkNa41IGIQTTjwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kl7t93mP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kl7t93mP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741524120; x=1773060120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ViCVFRcEyIrzMn8dz3mFPV7p3VWTElchU+Q8wT1rOpg=;
  b=kl7t93mPXW2kTh2d9c92fAyTP2OWnZMObIZgKr0Emq9XagzQmDDizTgC
   ak6wUXJBS3IC7am5XfJ6R1FpDALiKELKsw9CCO/LmMyCJ/U3G2n6PaQ0v
   K+b1K3kPqeqXogYEPIa5Ul0uefOUJHqRaC9H+690BET6FHLdANxsHV1vt
   CZ3el1k1LQfYSm08RhJXM2Ie/eQydExdMlvOczVNoIFpBaftdn1Qxw31k
   AruIaNz6dnlup7emXIEgDAesepTsN9CCkIS7VWge+I0dPEUVNwHcI4xI1
   Aq2TLbz1DrKkKi2SvgH8cb0ph40EjcZgGW1XXGwGBC/G1zej/TD3H185W
   g==;
X-CSE-ConnectionGUID: hmgk3+neTgWdvrT+0Q3tfA==
X-CSE-MsgGUID: cuwcosh4S9uAwRIWb5Oq6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53506521"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="53506521"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 05:41:59 -0700
X-CSE-ConnectionGUID: rlNe6WtXSJmFMzMT97aITA==
X-CSE-MsgGUID: 27MRRXNFQu6KdGOsk8RyrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="124348971"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 09 Mar 2025 05:41:57 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trFyd-00036C-2Y;
	Sun, 09 Mar 2025 12:41:55 +0000
Date: Sun, 9 Mar 2025 20:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:latency_debug 84/85] /usr/bin/ld:
 kernel/sched/timestats_bt.c:196: undefined reference to `debugfs_sched'
Message-ID: <202503092037.dqtvZzMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs latency_debug
head:   cca62acccd9672466b5ac130434dff2445c0a082
commit: 060b31c10f7654dc7135e974674fc470da458ce7 [84/85] fixup! time_stats: Promote to lib/
config: um-randconfig-002-20250309 (https://download.01.org/0day-ci/archive/20250309/202503092037.dqtvZzMM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503092037.dqtvZzMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503092037.dqtvZzMM-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: kernel/sched/timestats_bt.o: in function `sched_wakeup_backtrace_init':
   kernel/sched/timestats_bt.c:196: undefined reference to `debugfs_sched'
>> /usr/bin/ld: kernel/sched/timestats_bt.c:196: undefined reference to `debugfs_sched'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

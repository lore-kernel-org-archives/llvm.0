Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA7574C14;
	Sat, 20 Sep 2025 05:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758346459; cv=none; b=mxqXj7ea1a8yfblzZnquo6MMVbp60/JGDbGOgPe+ZzQA8k7S2r5kxVxqaVwKmPgSKOa16JdU925Q9k7QNbdZ9/Wk6ljpynpL6ce3V46QuQlg14prmdoaB2EfJG0wQLNoGlpTWD7wP4/VsZ7F7V7cVsO5LVC48ek66xAkd7uL5so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758346459; c=relaxed/simple;
	bh=S3cEpmKIbzopt8ABoWJ6UUjY73Oyss11N7G2FfIJ5WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SI7XHhYFCXoQ4bb7+Ef/vMS1EeKBua+h8yC2/6jKbey27RhUV4ozfXtWPRD0jRP+HHi6UZkDtmFvFsP/0T41RTKxa0ulEsCOi/oJ9FiZpZCG5EOE8zXiBzRxwr7S7kL/ihgOcx32z59mS9qUY1oOm9iMDfufKOUPFt6panCPlm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wwr6Adze; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wwr6Adze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758346457; x=1789882457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S3cEpmKIbzopt8ABoWJ6UUjY73Oyss11N7G2FfIJ5WU=;
  b=Wwr6AdzeLVndJx0QpMTTU3ittqrsx21xLvlVYG8lFZ9zyUA2ByD0sdf8
   Vf7EyIMKY+4aWF5bRmNcKRn7foZpn4IEZlfOaLjifcYVSqbFEoyh85uBc
   QYQ16ZBdKuNsZt/oJ81DsPLHnKSUw0a0rDmY01BEYT1EUUDkCLZZQEbPK
   DyrXDZEbjd3zXKBs4D0tHEEPTkcF99dCF7XmT8dUkYG5fz0vXb3zSB3rg
   xzq13RSCaVsWRRVESv+s0WfyFxCBBn803Ot4ra88FCZfeDw2PTOQLtchI
   4SJHsoAroCI0ijEOBhnGCYYfBn4hxpS+5gLriDoISZz0ThzY+A+fsepKt
   Q==;
X-CSE-ConnectionGUID: MhBDIBXHT7O4SbFwf4Bu3w==
X-CSE-MsgGUID: fKPwPJQaQLCuN8EiTkdNCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="59906702"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="59906702"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 22:34:15 -0700
X-CSE-ConnectionGUID: 1yKNnilbTnCaq80CuzlxTg==
X-CSE-MsgGUID: 8u2zKYD1TvOjvKbhYaEcFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="175256038"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Sep 2025 22:34:14 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzqEd-00054n-0l;
	Sat, 20 Sep 2025 05:34:11 +0000
Date: Sat, 20 Sep 2025 13:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC Patch 1/7] kexec: Introduce multikernel support via kexec
Message-ID: <202509201300.onsuDJUN-lkp@intel.com>
References: <20250918222607.186488-2-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918222607.186488-2-xiyou.wangcong@gmail.com>

Hi Cong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.17-rc6 next-20250919]
[cannot apply to tip/x86/core powerpc/next powerpc/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/kexec-Introduce-multikernel-support-via-kexec/20250919-062852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250918222607.186488-2-xiyou.wangcong%40gmail.com
patch subject: [RFC Patch 1/7] kexec: Introduce multikernel support via kexec
config: x86_64-buildonly-randconfig-002-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201300.onsuDJUN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201300.onsuDJUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201300.onsuDJUN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/kexec_core.c:1352:7: error: call to undeclared function 'multikernel_kick_ap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1352 |         rc = multikernel_kick_ap(cpu, kexec_image->start);
         |              ^
   kernel/kexec_core.c:1352:7: note: did you mean 'multikernel_kexec'?
   kernel/kexec_core.c:1333:5: note: 'multikernel_kexec' declared here
    1333 | int multikernel_kexec(int cpu)
         |     ^
   1 error generated.


vim +/multikernel_kick_ap +1352 kernel/kexec_core.c

  1332	
  1333	int multikernel_kexec(int cpu)
  1334	{
  1335		int rc;
  1336	
  1337		pr_info("multikernel kexec: cpu %d\n", cpu);
  1338	
  1339		if (cpu_online(cpu)) {
  1340			pr_err("The CPU is currently running with this kernel instance.");
  1341			return -EBUSY;
  1342		}
  1343	
  1344		if (!kexec_trylock())
  1345			return -EBUSY;
  1346		if (!kexec_image) {
  1347			rc = -EINVAL;
  1348			goto unlock;
  1349		}
  1350	
  1351		cpus_read_lock();
> 1352		rc = multikernel_kick_ap(cpu, kexec_image->start);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

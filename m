Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42592289E18;
	Wed,  7 May 2025 14:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629818; cv=none; b=lGmf+Go/VrGBDnLvpws/f6CnlIaqHrPdKruJi82zyczTZnFvENvmM8ETDhb6asjlG1jRWA3xcMy2QXU+5DXDHp+ynoD5l2RT/RN7h917AJ97ibWSRej7CdqfX4v1mnmNoJIj78cfqK+rNpSQr6LGlS0Y2MCDNn6mnAyoyK6UIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629818; c=relaxed/simple;
	bh=PWbZF95+4g2ZvrVrtvSS5psq9buLlwHmUVn07mPNOTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOGXhy0Xy1hWl0vAKuc9MWIopfRzwxUG3r26Hf0fuiW4TIE4Hep2WT9BC+EbZr0zeJX+3/Jt4fyisVByBtA27gsfRBOSBZpZLPQHcqvWftSvF65oVYbmnydVE1s+EGtgs4A6mVI9fepdrbRv26+HILMqA7xVpaakFzH5TIhDYC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1pSNzKd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1pSNzKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746629816; x=1778165816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PWbZF95+4g2ZvrVrtvSS5psq9buLlwHmUVn07mPNOTY=;
  b=H1pSNzKdYXbTnTpUnY7laXsSouXHdRWsfxt6/u5qBVcEf5HDechvz/3n
   L8g3eWyvYsGL6+pj9TC+OZCf8fzzUlRvmwY/lJGy+rcpFzpZOeHj3NgkA
   3BBQhzrEN8Se+wYmBDpJfnEHA8e42dGbTt1mXJ5pFrLYwePsEFG/6yJXj
   6e4Dtb5sI3qSnAu5q5JlQGInodSp12zOEwfqU6QCzQU5yAMPswnP2Sbeu
   gfJ94TNrk9YJUuaG3S1uLNuIcIaQ1nYtaeX0qkmeBMd52pKDz0KDFE8ep
   hQnqSQEcuqRu7/NAjzu6ym8K3aELvff0Z1yC5V0qpsJ9no3ASrIXgo5WY
   A==;
X-CSE-ConnectionGUID: jwanPCaLRDSPS5hzw9Cs2A==
X-CSE-MsgGUID: eKYSNoFESkStmf1NQiB/Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48381719"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48381719"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:56:55 -0700
X-CSE-ConnectionGUID: kENyeeXcQ+e37YI9x7MWOQ==
X-CSE-MsgGUID: XcBNM6D/S2uX3h7QJ2EpyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="141101662"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2025 07:56:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCgCa-00081d-0i;
	Wed, 07 May 2025 14:56:52 +0000
Date: Wed, 7 May 2025 22:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: Swapnil Sapkal <swapnil.sapkal@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] amd-pstate-ut: Reset amd-pstate driver mode after
 running selftests
Message-ID: <202505072226.g2QclhaR-lkp@intel.com>
References: <20250430064206.7402-1-swapnil.sapkal@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430064206.7402-1-swapnil.sapkal@amd.com>

Hi Swapnil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Swapnil-Sapkal/amd-pstate-ut-Reset-amd-pstate-driver-mode-after-running-selftests/20250430-144443
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250430064206.7402-1-swapnil.sapkal%40amd.com
patch subject: [PATCH] amd-pstate-ut: Reset amd-pstate driver mode after running selftests
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505072226.g2QclhaR-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072226.g2QclhaR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072226.g2QclhaR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/amd-pstate-ut.c:262:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     262 |         if (ret)
         |             ^~~
   drivers/cpufreq/amd-pstate-ut.c:246:9: note: initialize the variable 'ret' to silence this warning
     246 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +262 drivers/cpufreq/amd-pstate-ut.c

   241	
   242	static int amd_pstate_ut_check_driver(u32 index)
   243	{
   244		enum amd_pstate_mode mode1, mode2 = AMD_PSTATE_DISABLE;
   245		enum amd_pstate_mode orig_mode = amd_pstate_get_status();
   246		int ret;
   247	
   248		for (mode1 = AMD_PSTATE_DISABLE; mode1 < AMD_PSTATE_MAX; mode1++) {
   249			int ret = amd_pstate_set_mode(mode1);
   250			if (ret)
   251				return ret;
   252			for (mode2 = AMD_PSTATE_DISABLE; mode2 < AMD_PSTATE_MAX; mode2++) {
   253				if (mode1 == mode2)
   254					continue;
   255				ret = amd_pstate_set_mode(mode2);
   256				if (ret)
   257					goto out;
   258			}
   259		}
   260	
   261	out:
 > 262		if (ret)
   263			pr_warn("%s: failed to update status for %s->%s: %d\n", __func__,
   264				amd_pstate_get_mode_string(mode1),
   265				amd_pstate_get_mode_string(mode2), ret);
   266	
   267		amd_pstate_set_mode(orig_mode);
   268		return ret;
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

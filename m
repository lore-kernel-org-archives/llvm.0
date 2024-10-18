Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAE520E32D;
	Fri, 18 Oct 2024 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729278362; cv=none; b=bv2WdLrOYO1E+26i4R74t5H13BuW1TUkJllRAbycLFgu4QBg7IRU7dPrMjcsnDHcjPbEYbmE6DbJrIy6LYYv/xy/Yk2JeUmbrdorr2GWh1ZNUMUK8h7TJQwo3fC8rpzaLz5a1ddSje2Exu3/WHKwHC+GvXm/yA2fMzkOkXSfa5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729278362; c=relaxed/simple;
	bh=rsidbJXWRVyi8VIWS4wWcpnhhkzGrsk3s4V2tA0lUa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHT/rftOAqJHEOiBQdEzD2j5XfNn3CzwrEnvb9b7MA/mTlPhYMSw/LLUuyJemY1q4jvc73OV++emecRdDLYvAWnfWVyPzETEr2EXyqKhNoISZIOmlV20ST1Hal4TIRsYuw2QYY0tOyyfS7gV9EGfkCc1/ugBk0w54ubbwJlaehs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5dRm9pC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5dRm9pC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729278360; x=1760814360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rsidbJXWRVyi8VIWS4wWcpnhhkzGrsk3s4V2tA0lUa0=;
  b=d5dRm9pCJq6atkGLN4hlwGunBQYMgtO/WaTQcL0QolUgXeGuZqwuoYEB
   3hlQ9lMtQvo2kJnPOBNLweg4jJEyXoNhEwjPDZmE28jcTh2MujdhZ+9Be
   tdXPHZjjA0W+9tvwa+Q1QSLtC+sG57IMdrd3AD0JjhbaXJenlTbvgXlGe
   WEyPBEKX4GBlIiXFEj3eTZ7sZKaniAcpS/cRf7jx97m1h1n52R4tyIWOb
   xqSOaxVOGQEhPIctXexmlt1ik+1I7Px/12SxJUt0dHwueYbUy76eK0glA
   nOwXQ/aae8z7jc24xLt7gJ2fEe/RR/7Sr4FgYnqHaXQOrJ01Jsx1NaHDS
   g==;
X-CSE-ConnectionGUID: eTtz1NSRRgqIZNrxqcvSDw==
X-CSE-MsgGUID: 14r25LZYTBCvD8eJ7K5ZwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40218962"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="40218962"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 12:05:59 -0700
X-CSE-ConnectionGUID: ThQUX7rYRLOGKNint6jmlA==
X-CSE-MsgGUID: dw8eyjaeQ/Cy8AHS+ollNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="102248179"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2024 12:05:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1sIO-000OCj-10;
	Fri, 18 Oct 2024 19:05:56 +0000
Date: Sat, 19 Oct 2024 03:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] kasan: migrate copy_user_test to kunit
Message-ID: <202410190209.emZVkzss-lkp@intel.com>
References: <20241011071657.3032690-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011071657.3032690-1-snovitoll@gmail.com>

Hi Sabyrzhan,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master v6.12-rc3]
[cannot apply to next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sabyrzhan-Tasbolatov/kasan-migrate-copy_user_test-to-kunit/20241014-062132
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241011071657.3032690-1-snovitoll%40gmail.com
patch subject: [PATCH] kasan: migrate copy_user_test to kunit
config: arm-randconfig-003-20241018 (https://download.01.org/0day-ci/archive/20241019/202410190209.emZVkzss-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190209.emZVkzss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190209.emZVkzss-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'mm/kasan/kasan_test_module.o', needed by 'mm/kasan/modules.order'.
   make[5]: Target 'mm/kasan/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852EB288513;
	Sat, 19 Jul 2025 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752940356; cv=none; b=Zpjv2US+I8vIwFdzoZ4df+20x2QwWk0ZDzhND4RNv6Vjc2Um4rrWvH2d1Unma6awqK5rGO88nJinw1Z3RSHFtm1tfqVmfqMNOx6nfjU7UA03qDFZ5uCu05wt4kYGEplppqYRystKnTa13IF/0B8Nezs1MftVW6FmnGs2nW2/gMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752940356; c=relaxed/simple;
	bh=UidkqvsxXZ23EbL+uSVzWMMFn1qqz3Vu1bgwhn7MH40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXod1+JU6Lm2QqND1eIWwZz2kMu8ZULkKX9sFNu+mY7S20/M7eoiJOOYBxWPplWr0tyEcWxqboJYt3sdFGVCx6yixcFvCEd5LuXgFGFgCWpKaLs3Sz2sdMWJKgMnfKmmwe4rqsczEsLdHvuZIY7dMGYFxp5uHfLdtpoiLz4/XR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZ0ROigb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZ0ROigb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752940354; x=1784476354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UidkqvsxXZ23EbL+uSVzWMMFn1qqz3Vu1bgwhn7MH40=;
  b=gZ0ROigbQLqdgXcHVlb1z9Lwi5xOgjbEdlo30LOT7SyQTF2JgGcYK8Xw
   6FmC4IUwvvguxlfBvZybtoc5/66CTUHBF2/okGsXT+Yw18M6fANTIZT5p
   JTmffBz/KuIbj8WJSNoSVqWDESFo+PCo0WPCIld3wGm9lqBs90iVQGWOb
   QLH/lJOdJWkIhbCUg7ORgyvyK2KoeMkFGBxIEDVjqOTARbZcsGiMD5AXb
   Hs+EE6aPRFZvVsH3EfqTZz7sq9StRcFfE9ckmDy2SOeUA7FAV1p1ZKFSq
   uWDAAUX88cQ45G8t4QjN7YsPmUYZYJf8LjvEcB/qnUupw90FqCzMiVg85
   w==;
X-CSE-ConnectionGUID: B+eXWzDJSNWw81eQqWa/vg==
X-CSE-MsgGUID: yIqKJkY+Q8KslFMpQ9KzhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="55150497"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="55150497"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 08:52:33 -0700
X-CSE-ConnectionGUID: 9WuZpWrwTlac0n0P503WEw==
X-CSE-MsgGUID: aOD/t4vmTy+b6VCvm46k3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="163009719"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jul 2025 08:52:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud9rS-000FaZ-1D;
	Sat, 19 Jul 2025 15:52:30 +0000
Date: Sat, 19 Jul 2025 23:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/4] landlock: implement memfd detection
Message-ID: <202507192321.4t2yliQu-lkp@intel.com>
References: <20250719-memfd-exec-v1-2-0ef7feba5821@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719-memfd-exec-v1-2-0ef7feba5821@gmail.com>

Hi Abhinav,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5b74b2eff1eeefe43584e5b7b348c8cd3b723d38]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhinav-Saxena/landlock-add-LANDLOCK_SCOPE_MEMFD_EXEC-scope/20250719-191556
base:   5b74b2eff1eeefe43584e5b7b348c8cd3b723d38
patch link:    https://lore.kernel.org/r/20250719-memfd-exec-v1-2-0ef7feba5821%40gmail.com
patch subject: [PATCH RFC 2/4] landlock: implement memfd detection
config: i386-buildonly-randconfig-006-20250719 (https://download.01.org/0day-ci/archive/20250719/202507192321.4t2yliQu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507192321.4t2yliQu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507192321.4t2yliQu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: domain_is_scoped
   >>> referenced by task.c:176 (security/landlock/task.c:176)
   >>>               security/landlock/task.o:(hook_unix_stream_connect) in archive vmlinux.a
   >>> referenced by task.c:176 (security/landlock/task.c:176)
   >>>               security/landlock/task.o:(hook_unix_may_send) in archive vmlinux.a
   >>> referenced by task.c:304 (security/landlock/task.c:304)
   >>>               security/landlock/task.o:(hook_task_kill) in archive vmlinux.a
   >>> referenced 1 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

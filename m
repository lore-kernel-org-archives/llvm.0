Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4DD2F5308;
	Fri, 14 Nov 2025 06:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102825; cv=none; b=LV/q5tFqvZQVVQbzGdHfyRfiuZf8gv5hYQlY+QO4KWluhf43/LOeFBoB+DsSWZV/fz6oUjeaFyBfjkF/dQoEPj99+trei5/53mBKn47CC4xgcnA50Ot5ejhDolC0ltY8pLdWjNpZGzFbR4lQiI3DchbkiThe1yhKT9w5eMT53IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102825; c=relaxed/simple;
	bh=BOZ513XatmJkvZmtKSj5kixdV9olzzmk0tLc0ggC01k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tN4Z5aTjAjwKv7Qw0Ejok0U5AId2e2v6aCScU42clKC9yLZQS8u6onL93mh1wrx9jv7d9noga+3M+BWetwfkM5V5dDAbhVfbYaX+fqt50B4PRxLTluLs7Eq+JHCs9nm36PozteXBvuHPPt9FuH5ob4OKB51gOx5QlVYYXti+vaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMv+Ysyu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMv+Ysyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102824; x=1794638824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BOZ513XatmJkvZmtKSj5kixdV9olzzmk0tLc0ggC01k=;
  b=kMv+YsyuMtjyp6rszKDcsExyrsND+/kVk26PUbCvyjNU84GssjLGNITD
   SXJqdZFzEUWdrFSe+krIRLAcT6FwfBjSLzFyIq5p3Q2yhm4ZxclmEQNBw
   TCZSgJfiiJF7wJRjOZxAuYb8q1+cq2B3+k8KHlW2sizA+OCK0Vb/lSVVh
   nDyLDXat+Pv9FOxwXTG9qJvxZvmho+/7SeIZ2/rl98idpBQ5wmi9XwftM
   mZXHncdkEEhvcKPKBOHbRTcz+zk7pzUg5jAmRGDBcmKp9MbA5noXa4zEM
   kZ1R9oSijhrFQry55b3rqTRc872j3sZR0X0c7WOWQ7oMaKcfX++/lf/aX
   w==;
X-CSE-ConnectionGUID: hXKh1YQSS/eVoLeO7S3d5g==
X-CSE-MsgGUID: fFumfK+GR1CF0kfrNtR/jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64400132"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="64400132"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:47:01 -0800
X-CSE-ConnectionGUID: wJWbwT13RceTptKUWciWcA==
X-CSE-MsgGUID: D0mYjNIARDOmxNqglykAjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="220359552"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2025 22:46:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnaD-0006FP-0x;
	Fri, 14 Nov 2025 06:46:57 +0000
Date: Fri, 14 Nov 2025 14:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>
Subject: kernel/trace/trace_branch.o: warning: objtool:
 ftrace_likely_update+0x247: return with UACCESS disabled from a UACCESS-safe
 function
Message-ID: <202511141118.YnsKzPsM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6da43bbeb6918164f7287269881a5f861ae09d7e
commit: 73cfc53cc3b6380eccf013049574485f64cb83ca objtool: Fix C jump table annotations for Clang
date:   9 months ago
config: x86_64-buildonly-randconfig-001-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141118.YnsKzPsM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141118.YnsKzPsM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141118.YnsKzPsM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_branch.o: warning: objtool: ftrace_likely_update+0x247: return with UACCESS disabled from a UACCESS-safe function

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

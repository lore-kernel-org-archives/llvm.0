Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED47B1FF1CF;
	Fri, 23 May 2025 21:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748036447; cv=none; b=htujYQqPNXURhetAHOw9K1ooMvCTrYDyRh6O6VhOzf6kM1iz99PsB0wSj56xh0mYml+cYP21PpOEA6mx3GTZVTs6BMzKTfkuok0xCJ1hePLsMD9Owafk4Y+SOWeufjjfIQ4kVHnqnx5V2JWRr+L1JYSUONn/lKcKsBBy9sfO5vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748036447; c=relaxed/simple;
	bh=FUUWILj8JyJGfLu9IfPs12LltzXfUTkwo5W9rzyaZFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FN3iLX7avrcUNduvLu4ZXdIKx3L4y+2/eWs+Wbmf0B+A1alkv/0dvQCcp4lErXIBpXnHUgQoNRrz+CDFY9MXZFBTleZjh+0ynKQe672Ng2QYcxXHvPLqo0jWIQSQpK3Z076O25Bi7OJUOzVlGHqDwcOz1fSaQgtY3Tqr2/vQgvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYPwE8xv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYPwE8xv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748036446; x=1779572446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FUUWILj8JyJGfLu9IfPs12LltzXfUTkwo5W9rzyaZFM=;
  b=gYPwE8xvQXU3SAWZr/ARVzBwcKTps81Y7GdN9mKEPkQHOdOD8GZtppIG
   aztJCeni/Z9DJu8TFamNO8yLUBeg0Cnyps7n3ANxudZEGV4mlXPa5wCSC
   yMq+79IuHk+l/axbqnHNFGgIZTAZavshSMnMkHfgl2zkQqxKC8/H7Bufu
   2Ju1Xar0Rz5u5WdK3boYjpHzn5kp3zcukDEUsJZpLqiIiqKoV6GZvzJQD
   SUeB6FQyDdvCc1QQZeS6Il6SOJoiMJJtwuw5h4dMCJe/sjpqKzS8XL2xG
   2ulHJN2oWCABzMxSYrAIC7LLJXiiTxDeexKgxN6dYer4uqAk8AsrRoV2Y
   A==;
X-CSE-ConnectionGUID: b+UH4ZAKTWWYA//BMKHQcQ==
X-CSE-MsgGUID: ZG+AdT4xTRihGpoagwnD2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50023782"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="50023782"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 14:40:45 -0700
X-CSE-ConnectionGUID: G1AVr872Q6OakJyyWEgfsA==
X-CSE-MsgGUID: WGSyuGMDTLmSlrKne2BMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="141164749"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 23 May 2025 14:40:44 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIa89-0001ZU-0t;
	Fri, 23 May 2025 21:40:41 +0000
Date: Sat, 24 May 2025 05:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paolo Bonzini <pbonzini@redhat.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: [linux-next:master 517/13331] vmlinux.o: warning: objtool:
 tdh_vp_enter+0x8: call to tdx_tdvpr_pa() leaves .noinstr.text section
Message-ID: <202505240530.5KktQ5mX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   484803582c77061b470ac64a634f25f89715be3f
commit: 69e23faf82b4e7efe3581f9055a9c29d8d6ff9af [517/13331] x86/virt/tdx: Add SEAMCALL wrapper to enter/exit TDX guest
config: x86_64-buildonly-randconfig-2003-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240530.5KktQ5mX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240530.5KktQ5mX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240530.5KktQ5mX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: tdh_vp_enter+0x8: call to tdx_tdvpr_pa() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

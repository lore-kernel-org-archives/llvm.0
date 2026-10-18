Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEB43DE44C;
	Sun, 18 Oct 2026 23:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365523; cv=none; b=P0siTI7cXuO/rheLCb4+M4d+OSxhNWRAnXtW3sVEkglA9+B6QVan10G77HNYF5e5QMhGlg48arX1RWzD/Nzw+Eu1U2mfubQDh0ovyS12oVFQxrOTqm/3IipLQQtret73uPHM9wU+6AnfqvAHuErrEKRNPkc2VtirXsAs5IZIii8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365523; c=relaxed/simple;
	bh=Z54Crm9V/44cQ92OlXGNCkyDlrjOiZZLR9lCkGTTwYg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QJqcpxkZdM/oc3kaFJ1UvDxs4g3m7H+/fIZ8FJxphEXfvGXIZG9XjnCka3dLXHOldpofzXyXlqEGlkXdw4bHTpAa2UYT3xo0x1k82B1hXoqRKHrl3a6CNYaQrUP3bHQy+r9G7RHSIkRhMXQKY4O6WGE1jo9e3tX8emxAZQZj0R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ze7JFcNw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ze7JFcNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792365522; x=1823901522;
  h=date:from:to:cc:subject:message-id;
  bh=Z54Crm9V/44cQ92OlXGNCkyDlrjOiZZLR9lCkGTTwYg=;
  b=Ze7JFcNwR45fUiLF27lNM3p7Z9auy/uHbsuF9SVYM5ud9QB9cQUyT4pz
   blKY9eGQTTAInLMWxTvWYCCaaQombYxQKdjTMlt1AN1UEZsaSYKJYC+Q8
   pdOYWhb3JoSOMQTWDEKXpXl5VBCkFpbfpqRw3MuQgvnaUBENJEJ9j4bvS
   ExPqFCSr7O/0JT1AJHRbFQcOedsZtO+vqCclHrjmkomUSN0hC4mIfDiS7
   MNgBR5p3PbcrYI105M2dNZtsivoAvXvxdz5UeaKBz2ru0j3/gav4OMb7X
   vNF+eqXhcJF+vKpcL90WSMLltu8qPlte6PB+MlQ8jmWk73Y7f1fPmyWsk
   Q==;
X-CSE-ConnectionGUID: tT0OlvzASfib0v2It9rCaw==
X-CSE-MsgGUID: zZ+MqtY/TS+7qJWNjU7e9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1057845"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1057845"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 16:18:39 -0700
X-CSE-ConnectionGUID: EBdMxWCCTnK48L6/Sl+vKw==
X-CSE-MsgGUID: XRSq8MYvQD6fsao3lEqLxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2859054"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2026 16:18:38 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIa9D-000000005LD-0W6W;
	Sun, 18 Oct 2026 23:18:35 +0000
Date: Mon, 19 Oct 2026 01:18:27 +0200
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 45/49]
 kernel/irq_work.c:184:44: warning: omitting the parameter name in a function
 definition is a C23 extension
Message-ID: <202610190133.QqUXgoxv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   6cbb08c40db1f93e15aaef964883729494f3a478
commit: 8b3cdb229529280585c5ac39daa446e735bce900 [45/49] irq_work: Introduce irq_work_kick_cpu()
config: loongarch-randconfig-2000-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190133.QqUXgoxv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 337446dacd2a713010f1c9856c21eb8d899b5613)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190133.QqUXgoxv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190133.QqUXgoxv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq_work.c:184:44: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     184 | static void irq_work_kick(struct irq_work *)
         |                                            ^
   1 warning generated.


vim +184 kernel/irq_work.c

   183	
 > 184	static void irq_work_kick(struct irq_work *)
   185	{
   186		/*
   187		 * Kick the CPU, typically so that it takes action:
   188		 * * On IRQ exit (nohz_full dependency changed and tick must be restarted)
   189		 * * On the idle path so that the next tick is re-evaluated.
   190		 */
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

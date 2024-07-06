Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BF1FC18;
	Sat,  6 Jul 2024 04:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720239809; cv=none; b=MqFcbmNvTNy1yVuScTbvPlf2TNRpoclMOT+8Swkk2dQnBOPI2wd61u7h4XhunU18jhXWYAC8SOUr4LHialkw8IJXOZyqyQjHpNVl1yXjgxnxVdDd+no/Szjggd0k0qxrHhGka0BjNwd2KG3uC7xzSY5kWp7L5sQjL1ku9gSDiXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720239809; c=relaxed/simple;
	bh=M1toomnqG+m5n3Uu1aBzpp995ewKwuxQs6zCrOPs8QY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gn84HWObUfuMM/g7mt7a90je1e33jouiOEwnq31LYfnefnZY++4azj8e+b2ot16Pln5m8Syu1duKr/7FX4Pe35KPWKhM3OiDkGH/zSserUWrnWqTyL29pGtg+cMLtstkfr0KXbP7mOkjHXrEPwx6qzKLlWw63c1sN8kgCp7VwRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaEj0Ipe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaEj0Ipe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720239807; x=1751775807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M1toomnqG+m5n3Uu1aBzpp995ewKwuxQs6zCrOPs8QY=;
  b=AaEj0IpeU/MWdLRM/4jAiOrhoTgdrnQxiduvYfXYfGbxP6suhhANjPTR
   hjy6VGxxJgypXY2W3+mXyo0MBdKctAKnH6dgzmx7PBNtRgOeAPc2Yzq9Y
   ZHRUhauek1KBKy+hLH0ILS1Vhe9WUsRaMiyQRHMrCIf9yJfMxLLXpz1CY
   roH2tZL55TO5DloHQkht9oSvPW06tD3TZEQRui0FjKHGc+upcWmIy+RKl
   hby0BMCluvTSgEZLZ2lf9XQjnh/CSXQTmN8s4iki5Nd5OXrptP1xzS71F
   bq+xfqpi2aZPo3APChBg2wKHnwbU8+umAavQ0AgH4XOZuvbmTAj4esasD
   g==;
X-CSE-ConnectionGUID: 9w4n5gQAS7m7mugj4NhcVQ==
X-CSE-MsgGUID: 3h3OrqEMTNeDqDbj4hEd0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17164384"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; 
   d="scan'208";a="17164384"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 21:23:26 -0700
X-CSE-ConnectionGUID: Cd74fsVBRjyxwmh3tppoWQ==
X-CSE-MsgGUID: koKODRc6TJ6NicQw5g6lWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="46904214"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jul 2024 21:23:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPwxH-000TIe-2F;
	Sat, 06 Jul 2024 04:23:23 +0000
Date: Sat, 6 Jul 2024 12:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 40/64] ld.lld: error: undefined symbol:
 csd_lock_is_stuck
Message-ID: <202407061243.x1jKsINQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   1b9ee36634289bdfe55e5b6e99494239f80ecb98
commit: c9ba6970102a7c706e1203b32ca5c8a840e11a78 [40/64] rcu: Summarize RCU CPU stall warnings during CSD-lock stalls
config: x86_64-randconfig-003-20240705 (https://download.01.org/0day-ci/archive/20240706/202407061243.x1jKsINQ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061243.x1jKsINQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407061243.x1jKsINQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: csd_lock_is_stuck
   >>> referenced by tree_stall.h:798 (kernel/rcu/tree_stall.h:798)
   >>>               vmlinux.o:(rcu_sched_clock_irq)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

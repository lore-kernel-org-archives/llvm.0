Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF72256D;
	Fri,  4 Jul 2025 00:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751588081; cv=none; b=IUz/HCpqa2JHy0hC653gVgP85llpX2rB2LyH+sPpWvFOOWStgcpgGyAuPZWeR9I11SnGu1XBC5oIMzTGzQyyW0z9zQiIQoMlBd+RJuDP4rCBApT3sKIir4IabEeO48rIkMiSZ4Xgrz3C1mQe+R5/ycbtTORE4omb7o2CtKGWVIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751588081; c=relaxed/simple;
	bh=Thcv2lXsolJPolZ8Fw7uZMjPuwda62oe3H32E+swRcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rMsHowYcOLzWAnSOm37b31KNblIu8+wQ88Nu1jp3UHuefqqDhlRg1rpITOZ4+qVgnVsOLdA7r3RqgXNVc4yMP+rcy01UWRGx10H8WWdlB7cl/Ewkt8tecV56XMJ+tqwFDHzdpjHDg7JMmsyh04hLzTIZ7mJo49W62Jql2A9hh7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERqkU6SV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERqkU6SV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751588080; x=1783124080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Thcv2lXsolJPolZ8Fw7uZMjPuwda62oe3H32E+swRcY=;
  b=ERqkU6SVWUehEO/QCEIN+TTw25pNrCoL1JUGtkg6R2iRAQ37NIwTa2rB
   cuCU+TQGtZ63pcDGQOwsGKkrKESQ7oXaf7A85v9wdTqBJN3DuzLM3FJAd
   4zM/tINLJXp2zu4ki548fN63dpEUPDBBS+KYs/4ufLgzzYmz4t4Nb2Kb2
   S74LEQAKAZYt2YfYwhJqOr5Z3D+H+jgvycedwfELLD4gpebbSuzulL+q9
   CW5/UO19MLxsskz5sDkmG2fMEBngOKPnOgcM56+b8Esy5CHoA8FSDPupz
   miFWgK7psUB/gkg5O87SZJkcU5nskADSXtTdZall3tP+M5wlINTeTEpE+
   w==;
X-CSE-ConnectionGUID: qUJ/jiWkSq2EppmHxo7ZuA==
X-CSE-MsgGUID: lPTml1OHTOit+Es9TxcsFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64172773"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="64172773"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 17:14:40 -0700
X-CSE-ConnectionGUID: xLSUPYI5RleM3l1Oz574Tw==
X-CSE-MsgGUID: Rq4987dPSky8bBFjIhm0fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="160023941"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2025 17:14:38 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXU4Z-00038j-2u;
	Fri, 04 Jul 2025 00:14:35 +0000
Date: Fri, 4 Jul 2025 08:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/irq-exit-v2 4/7] Warning: kernel/rcu/tree.c:762 function
 parameter 't' not described in 'rcu_set_blocked'
Message-ID: <202507040850.vVcNFld9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/irq-exit-v2
head:   694abfc6d256d0bb3bbf659527a692224e000d68
commit: 7ccc41afea53b41ec9c8f3d77e877062a23184dc [4/7] rcu: Add helper functions for task and cpu_no_qs flag setting
config: i386-buildonly-randconfig-004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040850.vVcNFld9-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040850.vVcNFld9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040850.vVcNFld9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/rcu/tree.c:734 function parameter 'value' not described in 'rcu_set_exp_qs_needed'
   Warning: kernel/rcu/tree.c:745 function parameter 'rdp' not described in 'rcu_set_exp_qs_needed_cpu'
   Warning: kernel/rcu/tree.c:745 function parameter 'value' not described in 'rcu_set_exp_qs_needed_cpu'
   Warning: kernel/rcu/tree.c:754 function parameter 'rdp' not described in 'rcu_set_norm_qs_needed'
   Warning: kernel/rcu/tree.c:754 function parameter 'value' not described in 'rcu_set_norm_qs_needed'
>> Warning: kernel/rcu/tree.c:762 function parameter 't' not described in 'rcu_set_blocked'
>> Warning: kernel/rcu/tree.c:762 function parameter 'value' not described in 'rcu_set_blocked'
>> Warning: kernel/rcu/tree.c:770 function parameter 't' not described in 'rcu_set_need_qs'
>> Warning: kernel/rcu/tree.c:770 function parameter 'value' not described in 'rcu_set_need_qs'
>> Warning: kernel/rcu/tree.c:778 function parameter 't' not described in 'rcu_set_exp_hint'
>> Warning: kernel/rcu/tree.c:778 function parameter 'value' not described in 'rcu_set_exp_hint'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D55E276049;
	Tue, 29 Apr 2025 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911357; cv=none; b=JG2/DUXqfU+RYfKc4myO+84s6nWDeaqUvshCkAjzZNrVZt2Ee1+c81LTBq+nT38XxPxt63A/NdlcVjm7mydP30vLbI7bgG5nLX7/iz7xYJ4dIhvkz3go8u/kpEC9Vmn21yCIvNrQC+UU2SAWjI7X8TniW7GRWKWtLlOFKiBrhJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911357; c=relaxed/simple;
	bh=LIpEB2IAfl+Mh7AwslOo2Y3K5t74563pO65uTYWscdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=om0tePVc63oZQsFfpjPKCb2lnYmEVvht+Or32AXb8FZEEWLOUVaegznfJw3tyw7rRfkiB2PaYfBu8vQHQo7A4K+ub8+LV1VAp/Rk7PiDx0Re40RG68Rs2xmtjiTSyJ1ndY1thVvlVpQiTQTTHmP365WtHyT4WPCOGXOlV6igHB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFCflsm8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFCflsm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745911355; x=1777447355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LIpEB2IAfl+Mh7AwslOo2Y3K5t74563pO65uTYWscdg=;
  b=UFCflsm8fbSo8ysa+3XzS2RXUQGSa8gOYeGiqQQlDCZRE/tplu3oROf7
   3V2o2t1KtY2KMoc3KqDkECfNvnNLLh1Hmv4EHKDQobN1mwbUYYaSQ+e3D
   wqfjFAufMUQG52+GgG8i3XXv7LKd+VRokU37hxhFINoOrGM+6XcRIc4sF
   SvpyjW8nKeCf/4L56c3k73kxobSMjZQv30rewPB2FJa/u7kSggBj/fMmi
   3NjsFE+6ng/IK956Qm2lFZ8PyeGg8WZy065XHdlQFdhsvBluzsJ81cVkI
   8rjDMhb98Lyo0Xcpjc5NxqxLxZWSSC9dlbdLE1/YaNG7DuI+NgQra6SxI
   A==;
X-CSE-ConnectionGUID: j+XwWg8HSaamB/WSz3g1pQ==
X-CSE-MsgGUID: elFv7lwqRX6rFu/AyLvJaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="72899223"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="72899223"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:22:32 -0700
X-CSE-ConnectionGUID: SkLuooEITnOv/NdQbSfhDg==
X-CSE-MsgGUID: Y+CnaTH/SnuwBftwRyWV+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="164692518"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Apr 2025 00:22:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9fIS-0000Xd-0z;
	Tue, 29 Apr 2025 07:22:28 +0000
Date: Tue, 29 Apr 2025 15:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 4/47] kernel/irq/irqdesc.c:328:2: error: too
 few arguments to function call, single argument 'l' was not specified
Message-ID: <202504291538.F6iTqoKK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   9e1e6415c0b340394bdae9e10d3b0a403b3123d5
commit: 7723e58c0055c0138b4e1726df06bc832530fe4b [4/47] genirq/irqdesc: Switch to lock guards
config: s390-randconfig-001-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291538.F6iTqoKK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291538.F6iTqoKK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291538.F6iTqoKK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/irq/irqdesc.c:328:2: error: too few arguments to function call, single argument 'l' was not specified
     328 |         scoped_guard(raw_spinlock_irq)(&desc->lock) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:343:2: note: expanded from macro 'scoped_guard'
     343 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:334:31: note: expanded from macro '__scoped_guard'
     334 |         for (CLASS(_name, scope)(args);                                 \
         |              ~~~~~~~~~~~~~~~~~~~     ^
   include/linux/spinlock.h:545:1: note: 'class_raw_spinlock_irq_constructor' declared here
     545 | DEFINE_LOCK_GUARD_1(raw_spinlock_irq, raw_spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     546 |                     raw_spin_lock_irq(_T->lock),
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     547 |                     raw_spin_unlock_irq(_T->lock))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:409:60: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     409 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         |                                                                         ^
     410 | __DEFINE_LOCK_GUARD_1(_name, _type, _lock)
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:391:33: note: expanded from macro '\
   __DEFINE_LOCK_GUARD_1'
     391 | static inline class_##_name##_t class_##_name##_constructor(_type *l)   \
         |                                 ^                           ~~~~~~~~
   <scratch space>:22:1: note: expanded from here
      22 | class_raw_spinlock_irq_constructor
         | ^
>> kernel/irq/irqdesc.c:328:45: error: expected ';' after expression
     328 |         scoped_guard(raw_spinlock_irq)(&desc->lock) {
         |                                                    ^
         |                                                    ;
>> kernel/irq/irqdesc.c:328:33: warning: expression result unused [-Wunused-value]
     328 |         scoped_guard(raw_spinlock_irq)(&desc->lock) {
         |                                        ^~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/l +328 kernel/irq/irqdesc.c

   320	
   321	static ssize_t actions_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
   322	{
   323		struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
   324		struct irqaction *action;
   325		ssize_t ret = 0;
   326		char *p = "";
   327	
 > 328		scoped_guard(raw_spinlock_irq)(&desc->lock) {
   329			for_each_action_of_desc(desc, action) {
   330				ret += sysfs_emit_at(buf, ret, "%s%s", p, action->name);
   331				p = ",";
   332			}
   333		}
   334	
   335		if (ret)
   336			ret += sysfs_emit_at(buf, ret, "\n");
   337		return ret;
   338	}
   339	IRQ_ATTR_RO(actions);
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

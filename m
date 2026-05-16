Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38246158DCF;
	Sat, 16 May 2026 03:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778900537; cv=none; b=ZoRqcY8IfxHFgFMMSTUJ/0ltjou1I7tZmfFdXQWwoJU1uvv0hESTLTGEPvcaVla3UQq4/5aB293eEC4vxUHpV7ruw6c9NFUIXafwPAVmpetjJspfQnK8e0S8A7Aqk41CC+qJcDCCld9s3YvkiI8YzldzhnSv6OcGDk9x9jPTfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778900537; c=relaxed/simple;
	bh=kwXlwqUOcIcMc8wfnkrkFcRCoAH8hVt20GrTx9O7BAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bjWDyR9Cgr66p9Jve2q074dvh+NSxkWJO9A9K110mtPr+TW9cX/W9FK68ix6HJ1/P5H69hBI24eOdCNvoVUFqWltrF2ln5DRbj7+JlF7nY+PqqpLWqFwTeg80mV+r4Rs0VrBjcE/BWnpF7KubvOX9ejh16qg06grC7zXkG5SPg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKiQ1ZQy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKiQ1ZQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778900536; x=1810436536;
  h=date:from:to:cc:subject:message-id;
  bh=kwXlwqUOcIcMc8wfnkrkFcRCoAH8hVt20GrTx9O7BAI=;
  b=kKiQ1ZQyKeAcvy/1odIN3bvf1NSxy6cAT8j9Y2a/AztVV6Z9LkDm9bP4
   G54iOziX89JmJhoaJIZNC0JLOYHyL/QM23AUe6wEEsN3rJ6Bs4ZFFiBx7
   s0ikKLYaFWW5rtR2m8iJwUMuH1YBa2l6h/7o0mLIXps5y4CJkrblmd8Lw
   MoFDSWeCH3fR7sYBgkLHAUQxT54D5NrEtZtT3rHRmV/Jx46hyykOqEneM
   tIaKpWot2Wxqdrp0KOT5O399Quc6TrRYJNbqjfw2jZQLKm50/FQghulac
   yVvoiNZpmKWfH3sgS/niee9nO+qc/bt/aBJ1Nxku1vB6tle8VxbIuXJ+d
   w==;
X-CSE-ConnectionGUID: qiEvxZ4eQqe7ZrvUb1ajGQ==
X-CSE-MsgGUID: 8Ut6RnTYRpCOJbiR+CUl/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="78991585"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="78991585"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 20:02:14 -0700
X-CSE-ConnectionGUID: w7PsDrHAQHilScMENjhR2A==
X-CSE-MsgGUID: 4qTW9KDhS4KEd9f+v7yzVA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 May 2026 20:02:12 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO5I1-000000000PX-49Sf;
	Sat, 16 May 2026 03:02:09 +0000
Date: Sat, 16 May 2026 11:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [tglx-devel:irq/proc 15/16] kernel/irq/irqdomain.c:647:28:
 error: use of undeclared identifier 'GOT_YOU_MORON'
Message-ID: <202605161011.z3NBI29G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/proc
head:   5233c5982cba9a3a71013abef4ddce2835d3e493
commit: e58cc4735e7d227ad24307bbb3f9601ee67d44f5 [15/16] genirq/proc: Runtime size the chip name
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260516/202605161011.z3NBI29G-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161011.z3NBI29G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161011.z3NBI29G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/irq/irqdomain.c:647:28: error: use of undeclared identifier 'GOT_YOU_MORON'
     647 |         irq_set_status_flags(irq, IRQ_NOREQUEST);
         |                                   ^
   kernel/irq/settings.h:29:24: note: expanded from macro 'IRQ_NOREQUEST'
      29 | #define IRQ_NOREQUEST           GOT_YOU_MORON
         |                                 ^
   kernel/irq/irqdomain.c:707:31: error: use of undeclared identifier 'GOT_YOU_MORON'
     707 |         irq_clear_status_flags(virq, IRQ_NOREQUEST);
         |                                      ^
   kernel/irq/settings.h:29:24: note: expanded from macro 'IRQ_NOREQUEST'
      29 | #define IRQ_NOREQUEST           GOT_YOU_MORON
         |                                 ^
   kernel/irq/irqdomain.c:1332:31: error: use of undeclared identifier 'GOT_YOU_MORON'
    1332 |         irq_clear_status_flags(virq, IRQ_NOREQUEST);
         |                                      ^
   kernel/irq/settings.h:29:24: note: expanded from macro 'IRQ_NOREQUEST'
      29 | #define IRQ_NOREQUEST           GOT_YOU_MORON
         |                                 ^
   kernel/irq/irqdomain.c:1339:29: error: use of undeclared identifier 'GOT_YOU_MORON'
    1339 |         irq_set_status_flags(virq, IRQ_NOREQUEST);
         |                                    ^
   kernel/irq/settings.h:29:24: note: expanded from macro 'IRQ_NOREQUEST'
      29 | #define IRQ_NOREQUEST           GOT_YOU_MORON
         |                                 ^
   4 errors generated.


vim +/GOT_YOU_MORON +647 kernel/irq/irqdomain.c

b526adfe1b0531fc David Daney     2017-08-17  633  
e906a546bd8653ed Thomas Gleixner 2020-11-14  634  static void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
913af2070731bfc1 Grant Likely    2012-06-03  635  {
913af2070731bfc1 Grant Likely    2012-06-03  636  	struct irq_data *irq_data = irq_get_irq_data(irq);
275e31b10ce20613 Chen Gang       2013-05-14  637  	irq_hw_number_t hwirq;
913af2070731bfc1 Grant Likely    2012-06-03  638  
ddaf144c61da45ae Grant Likely    2013-06-10  639  	if (WARN(!irq_data || irq_data->domain != domain,
ddaf144c61da45ae Grant Likely    2013-06-10  640  		 "virq%i doesn't exist; cannot disassociate\n", irq))
ddaf144c61da45ae Grant Likely    2013-06-10  641  		return;
913af2070731bfc1 Grant Likely    2012-06-03  642  
275e31b10ce20613 Chen Gang       2013-05-14  643  	hwirq = irq_data->hwirq;
3f883c38f5628f46 Johan Hovold    2023-02-13  644  
9dbb8e3452aba34e Johan Hovold    2023-02-13  645  	mutex_lock(&domain->root->mutex);
3f883c38f5628f46 Johan Hovold    2023-02-13  646  
913af2070731bfc1 Grant Likely    2012-06-03 @647  	irq_set_status_flags(irq, IRQ_NOREQUEST);
913af2070731bfc1 Grant Likely    2012-06-03  648  
913af2070731bfc1 Grant Likely    2012-06-03  649  	/* remove chip and handler */
913af2070731bfc1 Grant Likely    2012-06-03  650  	irq_set_chip_and_handler(irq, NULL, NULL);
913af2070731bfc1 Grant Likely    2012-06-03  651  
913af2070731bfc1 Grant Likely    2012-06-03  652  	/* Make sure it's completed */
913af2070731bfc1 Grant Likely    2012-06-03  653  	synchronize_irq(irq);
913af2070731bfc1 Grant Likely    2012-06-03  654  
913af2070731bfc1 Grant Likely    2012-06-03  655  	/* Tell the PIC about it */
913af2070731bfc1 Grant Likely    2012-06-03  656  	if (domain->ops->unmap)
913af2070731bfc1 Grant Likely    2012-06-03  657  		domain->ops->unmap(domain, irq);
913af2070731bfc1 Grant Likely    2012-06-03  658  	smp_mb();
913af2070731bfc1 Grant Likely    2012-06-03  659  
913af2070731bfc1 Grant Likely    2012-06-03  660  	irq_data->domain = NULL;
913af2070731bfc1 Grant Likely    2012-06-03  661  	irq_data->hwirq = 0;
9dc6be3d419398ea Thomas Gleixner 2017-06-20  662  	domain->mapcount--;
913af2070731bfc1 Grant Likely    2012-06-03  663  
cef5075c8c238ffd Grant Likely    2012-07-11  664  	/* Clear reverse map for this hwirq */
b526adfe1b0531fc David Daney     2017-08-17  665  	irq_domain_clear_mapping(domain, hwirq);
3f883c38f5628f46 Johan Hovold    2023-02-13  666  
9dbb8e3452aba34e Johan Hovold    2023-02-13  667  	mutex_unlock(&domain->root->mutex);
913af2070731bfc1 Grant Likely    2012-06-03  668  }
913af2070731bfc1 Grant Likely    2012-06-03  669  

:::::: The code at line 647 was first introduced by commit
:::::: 913af2070731bfc1bd39bb35c5cd2fd66f5eff12 irqdomain: Split disassociating code into separate function

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

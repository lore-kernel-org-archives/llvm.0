Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C9A194099;
	Tue, 30 Jul 2024 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722329555; cv=none; b=YJCFI+gnEJCDYhocguSlUnv9OOGy3WcLFoT1NlktPB7znsRfckQEsnWGTy5HnXwLj9Gug/g5A7rdyX9OZr/5WWmAHKLJXIOCkFd8cco4HIaq6tVQE6NLEd/1Jjt1593jo1o57AKZ/0bgXiNF6Y3Rj2wk1/OGHKclvA6cnG1XB50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722329555; c=relaxed/simple;
	bh=Ea3ve7peZUSUgI1nGhKZ+3SYpfu8k2OjBL5nFNHsu24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ATqUsmViI5m8GPoXwzqFxA/ahle3foQFWBhijlb6VssdeBztffT8t4aUmIL70htCorUNO0W/4O0qbWLutiRX3nuka4Cr5f4kEn33vsiiEMhiZad/C5oiVdeIF0SNezgx3W1ODnidSv4rLaVlBczuwK0OzbnAoCw1PzlhFnzZV9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6v4gkF0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6v4gkF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722329552; x=1753865552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ea3ve7peZUSUgI1nGhKZ+3SYpfu8k2OjBL5nFNHsu24=;
  b=X6v4gkF0QJhx/dMt48332KmGzayRi0ynewGodHB8+srr2TDbq6cWYO7A
   TQ2CpWOhmmot+6yI4rq+x34UpaTWPNrwUYx2bagWTVaKj4mOLcD6SajGw
   C21ybwmPgebbn7t0PlYq9GnV5JnMr0MMGzpxEf2bZnKk7r7CjR6JGMuiE
   dtYrIg5ziXxAT0OvH3XWFe93YnRJppCjCbTt3kL+LrofFUQHentI004k8
   FIWPe27IrXspM8cQftklJ3342rVXx2B3CCJH8Z/pdVMVG6Xwc0YSqjc29
   bjVOAS3zAByrb7hCDOLPFd2Xt6cUWlmfqQvwELmPiOR9/TJRD/kzde+fu
   Q==;
X-CSE-ConnectionGUID: 3tRaEq/QSk+4v0X362tElA==
X-CSE-MsgGUID: KcMPjEh4Twa32oARx0TDLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19932207"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="19932207"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 01:52:32 -0700
X-CSE-ConnectionGUID: Iirznax9QHaRVp0Tpl5m9Q==
X-CSE-MsgGUID: qqAv4ZR1Tc+YBZbN9KiwYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="91765967"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jul 2024 01:52:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYiaq-000sgY-2e;
	Tue, 30 Jul 2024 08:52:28 +0000
Date: Tue, 30 Jul 2024 16:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/fastpath_pi_nv 2/2] arch/x86/kvm/svm/svm.c:4147:39:
 error: expected ';' after expression
Message-ID: <202407301650.BHl33FuL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/fastpath_pi_nv
head:   b2746b169a9de85ccd1760906aadedd71e30497d
commit: b2746b169a9de85ccd1760906aadedd71e30497d [2/2] KVM: x86: Add a fastpath HLT handler
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240730/202407301650.BHl33FuL-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301650.BHl33FuL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301650.BHl33FuL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:4147:39: error: expected ';' after expression
    4147 |         to_svm(vcpu)->vmcb->control.exit_code
         |                                              ^
         |                                              ;
>> arch/x86/kvm/svm/svm.c:4151:6: error: use of undeclared identifier 'exit_code'; did you mean 'exit_creds'?
    4151 |         if (exit_code == SVM_EXIT_MSR &&
         |             ^~~~~~~~~
         |             exit_creds
   include/linux/cred.h:150:13: note: 'exit_creds' declared here
     150 | extern void exit_creds(struct task_struct *);
         |             ^
   arch/x86/kvm/svm/svm.c:4155:6: error: use of undeclared identifier 'exit_code'; did you mean 'exit_creds'?
    4155 |         if (exit_code == SVM_EXIT_HLT)
         |             ^~~~~~~~~
         |             exit_creds
   include/linux/cred.h:150:13: note: 'exit_creds' declared here
     150 | extern void exit_creds(struct task_struct *);
         |             ^
>> arch/x86/kvm/svm/svm.c:4147:30: warning: expression result unused [-Wunused-value]
    4147 |         to_svm(vcpu)->vmcb->control.exit_code
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~
   1 warning and 3 errors generated.


vim +4147 arch/x86/kvm/svm/svm.c

  4144	
  4145	static fastpath_t svm_exit_handlers_fastpath(struct kvm_vcpu *vcpu)
  4146	{
> 4147		to_svm(vcpu)->vmcb->control.exit_code
  4148		if (is_guest_mode(vcpu))
  4149			return EXIT_FASTPATH_NONE;
  4150	
> 4151		if (exit_code == SVM_EXIT_MSR &&
  4152		    to_svm(vcpu)->vmcb->control.exit_info_1)
  4153			return handle_fastpath_set_msr_irqoff(vcpu);
  4154	
  4155		if (exit_code == SVM_EXIT_HLT)
  4156			return handle_fastpath_hlt(vcpu);
  4157	
  4158		return EXIT_FASTPATH_NONE;
  4159	}
  4160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787126D4CE;
	Thu,  2 Oct 2025 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759437772; cv=none; b=C0WnR8Vse7AzPYeppr0ylzEQRAmXbCBwRuHACOUbJSJYDvxZrkIcAQxP5yW6+fO598egETnnYl7jE++N8Nel8gPikdaT9S6MC3apII8vuFtVXJu16QD4/DNqTlExi8gHWJLFTp0xaXWyp1WHnjCWMnUSN6oVB8NkG9AL9m+mDfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759437772; c=relaxed/simple;
	bh=ub6tKF3JibKI0U7TGpu2tFhwhzosEZUngzNr+TlIQ04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ai6D48qBmMJrpobpTPX1OfCPnuleobQok5noV8JNdew4PQpWH+L0qqzIDzzn6CboJga/0fza7WDeJM3TacpMAnbrWC/NQJH+qlnVw91r5POK1rqHDUGuvaBWRpn3GxxEXgVl05F7/LSBHjuEb41Lwi0P1bDm2Od2xTMsiCCeAjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZIgRFpn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZIgRFpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759437771; x=1790973771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ub6tKF3JibKI0U7TGpu2tFhwhzosEZUngzNr+TlIQ04=;
  b=VZIgRFpnmC8o37FGnxsNbQUaT3IZ1sTUltwxNZUTIkFC45M/Nu8So4wP
   xqHq6pGHVNhdzpAtAB2PQ65GpTaoAM7A0gU78R18wfKMrm6rdtS5oorhI
   tQ7bLM/yrOCOp9q4SpzzGvmU68Fxgv39fhSfXd+xf/0v20wTKFtVUGruU
   +Js2RWJusQtcs1FPExY2lfor4lTB6D1ffPkZ989ZHPjDCm6Nf1QBnXsd0
   vTIbH1vZjaMnJCcobMATqt9uL2dspQXxGo2iw/RwQytcB9afpJt1OaWse
   FpkvdoYuR9ZVVdh2EhwGxn8IoEk3UEBGbGGVXGMRF75gmXdc0oz83kMA7
   A==;
X-CSE-ConnectionGUID: Fwc8opWhTSKY/XZgQt2R8A==
X-CSE-MsgGUID: qlVPXFe7Tsml3WiA2TIs5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65555160"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65555160"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 13:42:50 -0700
X-CSE-ConnectionGUID: O4hn0Co+TrSQhMSgp7ADSg==
X-CSE-MsgGUID: Fo9Rv0ebTQW7C4QTA95WFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="184327511"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Oct 2025 13:42:49 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4Q8U-00046y-23;
	Thu, 02 Oct 2025 20:42:46 +0000
Date: Fri, 3 Oct 2025 04:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/gmem_inplace 31/40] ERROR: modpost:
 "__SCT____kvm_get_memory_attributes" [arch/loongarch/kvm/kvm.ko] was
 exported without definition
Message-ID: <202510030435.uqCvOwkT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem_inplace
head:   5c607641a794e16ee49b3512b5cb7894ed47cf14
commit: 795a909ec2f52e8c835726445e2fe725f53639bd [31/40] KVM: Stub in read-only module param to control per-VM memory attribute tracking
config: loongarch-randconfig-002-20251002 (https://download.01.org/0day-ci/archive/20251003/202510030435.uqCvOwkT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030435.uqCvOwkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510030435.uqCvOwkT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__SCT____kvm_get_memory_attributes" [arch/loongarch/kvm/kvm.ko] was exported without definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

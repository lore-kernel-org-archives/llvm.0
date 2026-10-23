Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743774;
	b=fs/zRyNFOOtDDDI33veJsj6inTy2bxm4D1n10kWtEKg1Z2/mZ8BAidK+0P6i84Rnk46M
	 5xHIgQxVYrvTZxqOxdGi+uGpinkj7IrH0TNW3rV82nW6YD8sJyTSOztl7dy/EnRHHftw6
	 TdAImT4XpDI0OYZWzxv+NL1lgt60XomoOQ2p6F6gr4VBL+5oVpTTih24ps78ug8KAlRp0
	 xfT/CKdjrAwixQSXdhtYeWkldGYu83J5jmZKd9+iEsNj1joL7QYVjaC+ZE58RUkwsOVlc
	 7MYjHv5xcz7tp5wXSoCRumPXEEZ8K65c8nQ++9LDhj5dXzDfG3HaOjZwpA2jbN8CIjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743774;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rFwRLuEL800954vZgLUxCOGD08K0kEaYzdU27GRt4rQ=;
	b=THVn9VKeatG+uMh1SL2qYhPFoKnHibfnb2lYWyIRM87z0rp+wEf8+hECkpHuXd9/W3Xb
	 E8XfEKNKS8liRjSrcZCj8AOoX6+gNmQxIfVIkvriWJYpJ5K1goOxPFv94MNF5ts931iho
	 YXAEsEgjrQFpVXhkLll3WgwbyDsQfwZbJfd4XUHwswu7IIzdP1whTUrumtL9k1s1x/bOp
	 QPMGskPw8rhx5vEh7UxkYpUZL8IUUxOm+aAmIyLB/Scyt7Keq0I3F5ORmV0/HZtAF7mz3
	 pDlmhUp/sxATDWsnhGEiIBErqrmZCi9L4j7OLk5jU3S1edKP+KgmcQCGkdLHO+9QvHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cw4EoFat;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5523D606A31B;
	Fri, 23 Oct 2026 08:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5523D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cw4EoFat
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792743774; x=1824279774;
  h=date:from:to:cc:subject:message-id;
  bh=te2N4EHsIew9AcDES7tPdYN3OKpGCFwcOOw9pYOjA0Q=;
  b=Cw4EoFat4vU8fRpqfOidYQVX/pw9OSOrw2MZCrigzKmKtupshDUEyT9+
   vh0jJtNL1thzZAv9k3N7DjcZPoWYNVxzuOD4V0kQTqtYmdyiXolTXihU4
   h29t5d3EIan8lSMUyllPwNQp9j+NDD/qm4zFI1PIRrf+lPM/y5t3QmBhD
   6x9mQw2aCTsxcOKTJjbti4b1RBzqimjb3nGiSU7gUN/sDCm5fNNo4qDgA
   OJHlSFWMZddijP2gCpYxj85d0IiDtqwVYUaraj7sy+pPCtAehjid1QpfO
   4vYmnXiZErR0WOme9MExWvlUVxltJ90BUevnxoElfvChjwYKpN1K+J1wS
   w==;
X-CSE-ConnectionGUID: txT6VECqRNi+WXND8h1U3w==
X-CSE-MsgGUID: xrMYMVBHTAGaAgmMukgVkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1381916"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1381916"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 01:22:53 -0700
X-CSE-ConnectionGUID: vfgmHO08SxmQCWMjUHzbUw==
X-CSE-MsgGUID: sy4UbMw0RPWduvj1mvU1PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3619693"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2026 01:22:51 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKAY4-00000000SLo-1Rf0;
	Fri, 23 Oct 2026 08:22:48 +0000
Date: Fri, 23 Oct 2026 16:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: error: kernel-address sanitizer is not supported for this
 target
Message-ID: <202610231657.7LxpWzaj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
commit: 73b741adb264967093ef4eb59905618a7e0d0de0 rust: Add PowerPC support
date:   3 months ago
config: powerpc-randconfig-1001-20261022 (https://download.01.org/0day-ci/archive/20261023/202610231657.7LxpWzaj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c419645e808a6667eee9dbb16c828f77e2fd2f0)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231657.7LxpWzaj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 73b741adb264 ("rust: Add PowerPC support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231657.7LxpWzaj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: kernel-address sanitizer is not supported for this target

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

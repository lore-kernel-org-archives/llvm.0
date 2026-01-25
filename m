Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980B01C5F1B;
	Sun, 25 Jan 2026 15:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354054; cv=none; b=jj7QJFx3Tw9+LkFVInpOkW226fSzrcfaa3Lnn1pW5kOaUzSxZJQkWAqAFnCFTIyO46fQ8amthDdDxPva7V/xSFG/IeNb135WCq2nuJ2CFDSeqPVwJADNkxvT17YD31CupQhizjizHvTwVsP1UStKF/6ELwDXj68GHDq6Bc6dhEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354054; c=relaxed/simple;
	bh=TvRg3oLluxOaB/6yzZZ/ls865HD83QwhrrCiU5KjEyA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e0DKlBe9LoLe3wojX0DOWjBzkS6eIAhA6TNrd/zISh12w1evwkaGl7P8a2G9rDfgOVopOz+8rUVJA0zz6bkz29qFxaQfBpjUxTfbtYUEENYcWhi57KglxsydbYWhXRLuyLmZsjrkM+wv2MrUVSlZXKIPwuJ6OMf4XsoQTxsdw9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLzwnKAE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLzwnKAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769354053; x=1800890053;
  h=date:from:to:cc:subject:message-id;
  bh=TvRg3oLluxOaB/6yzZZ/ls865HD83QwhrrCiU5KjEyA=;
  b=LLzwnKAENi17bb9WWDntYftouJUm6kk/kYonotnIkGXGmljmqZae3US0
   /MetBAHPMVgohfpSviXuZflxgECnC6+aLxZJlWhgEXjOjJMh+Ra1P+Jif
   ZsXmgHmYr9tKKLJVTV1Tgi2B3JD9nvbjbctZ7bXhfp3zErzL7ft7W8De/
   of99pPZdp+yBcxTAqPMvwx/2p9AnLXEflr4WDI9ADA5SfHzXq7b+5trXy
   HSiGFrsN0LtiCx008Qo+1ReUTPbTivzpWOErhtDvf/kZNzsscHWgtBZQg
   mWaHZ+NgOH5GMCxWotCQji1n8WYlX838KZPNDe/YSMkTyubvjqRoXXLx0
   A==;
X-CSE-ConnectionGUID: qBS400sHTjW3i1nJEdt3wQ==
X-CSE-MsgGUID: mNbqn2ZnT1yPjc5JmXwAow==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="80847186"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="80847186"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 07:14:12 -0800
X-CSE-ConnectionGUID: 1O7uvorlRJa0PiqaAssLtQ==
X-CSE-MsgGUID: nc8ZL+EIQKuQIoQ5RfR8RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="211579023"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Jan 2026 07:14:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk1oW-000000001IH-0SJd;
	Sun, 25 Jan 2026 15:14:08 +0000
Date: Sun, 25 Jan 2026 16:13:24 +0100
From: kernel test robot <lkp@intel.com>
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mike Rapoport <rppt@kernel.org>, Nikita Kalyazin <kalyazin@amazon.com>
Subject: [rppt:uffd+guestmemfd/missing/v0 14/17] ERROR: modpost:
 "filemap_get_entry" [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202601251604.qyqehEV3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd+guestmemfd/missing/v0
head:   4ef69952db49cd0d355a1485070765e8b7006397
commit: 30138ea8730b8b7db50f96e4cee6ffdbb6243052 [14/17] KVM: guest_memfd: implement UFFD minor
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260125/202601251604.qyqehEV3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251604.qyqehEV3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251604.qyqehEV3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "filemap_get_entry" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

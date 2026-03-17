Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9485619D081;
	Tue, 17 Mar 2026 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737059; cv=none; b=UT32ezNsnbruIsqUAgZ099kLjcdjfh4HKV8MoTugk9PIJL4D2TiDrk/h+D9M+VBpQeV6YPBJ2NR3+4UmIzr5jnt2E5I37XInxRL1DuItVV5LXLTJrKoVvBi+YH8/pd2iBWXO5JBm+J+T4UgE7D3YA1GMDP2mDd2ogRwS88gaYeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737059; c=relaxed/simple;
	bh=UCy/wPRSnRVvRCcmLTWm3DCZUBCsWRbfqizdy3YIhiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mqrt4yKodAUMLg6YDYHd8655eRFOOshOm/Urksp3VPCKzPGT6nzqwD++QCiQX3I/+ezZHScqLPonwZ6EynGN6UBBYPUYTevTAndqK3uaLyXNZU12v7a38jOpO8KWaBHkfshdvTq5YMPrFut/tpolpkRZbWnWb3/0szMwiCAX8PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2zRdaVP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2zRdaVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773737057; x=1805273057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UCy/wPRSnRVvRCcmLTWm3DCZUBCsWRbfqizdy3YIhiE=;
  b=c2zRdaVP9r6oZMuCyDrOH8WqQKjCA1yk6seRv3Te+6yHzKQ5b29q/7y+
   WzFQ/0fnGYNG5VPhxnLW3l6ehf4yS0ejrvCpYdBI2jrgAvWxpfcKmxCKL
   miOxisZtXQ8lRxehfVX4HR7Ectd7KspS2ENEBtl5yX6gK7X2v5tuQMqLj
   B8o/qERyi6/lwG8cJ7KRqd7NPhLl3n54JtqxWh34msjLZ/DQ975RpaO8j
   F/U6NWBFYved8F/af12Mu+CdJmPn5aw7MmrM9qjThtL+FWYn2vZBe6QgH
   xkA2u5oGWVfufR6B8jFllBh89N/6LTiKBE4IlXJb1YNixQ+CKV7rMT6ly
   w==;
X-CSE-ConnectionGUID: fMe710StTDu5Fub3Q65C4Q==
X-CSE-MsgGUID: wXYd8Rt0TQOEGqBRHO0DqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74796452"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74796452"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 01:44:17 -0700
X-CSE-ConnectionGUID: 6XFI5ushT3qEB+EPVJnkTg==
X-CSE-MsgGUID: 7ypYJNBSQJCh7psmN+B7Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="252692280"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2026 01:44:16 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Q29-0000000004h-39XS;
	Tue, 17 Mar 2026 08:44:13 +0000
Date: Tue, 17 Mar 2026 16:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 10/43] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
Message-ID: <202603171521.oEqPhbPQ-lkp@intel.com>
References: <20260313-gmem-inplace-conversion-v3-10-5fc12a70ec89@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-gmem-inplace-conversion-v3-10-5fc12a70ec89@google.com>

Hi Ackerley,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on d2ea4ff1ce50787a98a3900b3fb1636f3620b7cf]

url:    https://github.com/intel-lab-lkp/linux/commits/Ackerley-Tng/KVM-guest_memfd-Introduce-per-gmem-attributes-use-to-guard-user-mappings/20260314-175023
base:   d2ea4ff1ce50787a98a3900b3fb1636f3620b7cf
patch link:    https://lore.kernel.org/r/20260313-gmem-inplace-conversion-v3-10-5fc12a70ec89%40google.com
patch subject: [PATCH RFC v3 10/43] KVM: guest_memfd: Handle lru_add fbatch refcounts during conversion safety check
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260317/202603171521.oEqPhbPQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171521.oEqPhbPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171521.oEqPhbPQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "lru_add_drain_all" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

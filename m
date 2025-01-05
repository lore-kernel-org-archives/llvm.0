Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF86EEA6;
	Sun,  5 Jan 2025 04:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736050024; cv=none; b=rQmRE1d8OHdsNL7adfFhHpUD58Ht5wSmjKMAvaKNW9OY1ZtHbIHZ3RmU8HReGeTqfcsNj0BphJsYU/3VrGMyWGwC/AUPTvZjZlTpMMY9A0LTf4Fib3DwnciDlomwSU1VsPU5OA5aMzk3ddCF34OVJtf3eBoIMctKxMszdHabGTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736050024; c=relaxed/simple;
	bh=uTTXcYE2JlL0MwZNF4xf3gPhakQayiJl1mKH6vTKQMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U++ze0L3qOvZXQbwlR1m63y9KGTjVo3+b5DnlLLjOWHPTL/9PLV97Mbohf9gCPQiRoflwGwwylZJVLN7m+0gaLB/icDIuN1whJk6uqcJi90Std2f29LxiBFiTlLTN/BVnGC9eBRHyfAscWPIY/guVYt3jRepESUAWPH1Bmvj0iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVBSEJz+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVBSEJz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736050023; x=1767586023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uTTXcYE2JlL0MwZNF4xf3gPhakQayiJl1mKH6vTKQMI=;
  b=lVBSEJz+cxoGImjGgN6BOmSVyZTx1ArG//vLduNjZIwcM1X6HR/Y2c8h
   laX96GFbE0xdDns6Gm3HyAs9rGI477h4hLvc64hSpXBES9XoVqnBtlEkq
   8RgoCzVfNFo3RpJaqtlpC8EXaUKEAxNBiAghm6scbK+ufrIWLPV1yQAjS
   5Z/hw9J0nynY6sQP2667qlerYuEKStcC/Gl/17z/RPlRVQwxHoZwJFGxR
   GdLeo2KZ6dhCTORsXY2cpaBgR4OyW2lThU1aYgy9cikNRWLB2GeDBs5Hz
   ky6aK2wnLu45zS5IlOZ58DaWJNUZs+wQkOkHZw4bJzNDHDdc2nYqcQh9B
   w==;
X-CSE-ConnectionGUID: iNPmvghQTiGZgFal2de2xw==
X-CSE-MsgGUID: s01wXKheR6SBWq775VdRvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="46906607"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="46906607"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 20:07:01 -0800
X-CSE-ConnectionGUID: s5QBkrq/RlC6x0S1Bzo8Zg==
X-CSE-MsgGUID: T/KGlmm5Qo60f34HgbLZqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="106980210"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jan 2025 20:06:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUHui-000BRL-14;
	Sun, 05 Jan 2025 04:06:56 +0000
Date: Sun, 5 Jan 2025 12:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
Message-ID: <202501051127.3AKt5ZE9-lkp@intel.com>
References: <20250104181305.28185-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104181305.28185-1-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/cpufreq-airoha-Add-EN7581-CPUFreq-SMCCC-driver/20250105-022153
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250104181305.28185-1-ansuelsmth%40gmail.com
patch subject: [PATCH v8 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
config: arm64-randconfig-001-20250105 (https://download.01.org/0day-ci/archive/20250105/202501051127.3AKt5ZE9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051127.3AKt5ZE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051127.3AKt5ZE9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c:135:3: error: field designator 'remove_new' does not refer to any field in type 'struct platform_driver'
     135 |         .remove_new = airoha_cpu_pmdomain_remove,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +135 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c

   132	
   133	static struct platform_driver airoha_cpu_pmdomain_driver = {
   134		.probe = airoha_cpu_pmdomain_probe,
 > 135		.remove_new = airoha_cpu_pmdomain_remove,
   136		.driver = {
   137			.name = "airoha-cpu-pmdomain",
   138			.of_match_table = airoha_cpu_pmdomain_of_match,
   139		},
   140	};
   141	module_platform_driver(airoha_cpu_pmdomain_driver);
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

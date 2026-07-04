Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC8D288BA;
	Sat,  4 Jul 2026 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783174434; cv=none; b=fgqWlhSDWE99immfp6G3UrrvU0nZgr93CkC6lXzPf1HH57jE5lVhj3z4HIVNIizilqd7tj2nZGbI2N9NId6hjFeZHA5UzxUBxhCL1Sxc5bI1qpqRewHSN6v84oF/lvQwjT787BgLRBm99IFG5ZK5vUToQu/ByeiPRe40vLB1eNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783174434; c=relaxed/simple;
	bh=haHFTXmDQ5aiiw5QM8Z1oIYQg5A3tgVLGwdXjbQ0puw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXZkaKpVia4cbdHZ3whdflzZifLD3w0EDoKJomCUTD+RyL6J2oawFg/q6kue3G04n4D55RHbkX3QCkCank3OLL55OpSpeSAWc1oc9CFcGDhq2GzhLuiX93h7mwQ6F97EUTxioEgJyEQeZPR0AB8Um/J5gs2EHV9UZX1p8iQ2CH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PL/ZCsd1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PL/ZCsd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783174432; x=1814710432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=haHFTXmDQ5aiiw5QM8Z1oIYQg5A3tgVLGwdXjbQ0puw=;
  b=PL/ZCsd1IDaxhWOzWnkaxMG2nZ7qp6WmMEGiAE3Iw51vdkslzBAZUP1b
   OSoUuBse0VhvDNgmXdEe9J3UzNN2ctGKkWiGd/lZw2IxCcLNbM0TRa5hC
   lvXzwmBYOwrhn39il2JzDZ65s9B7DAYaKzm28xe5/oKiPNWz9tc/oY/Tx
   9tOotRkjh6O9QjS2017k1Cs5EO7BfnXwVQQ7qsW+b9NQMMOY93Q06z6dB
   cwjhIQz3ssAjJVwvH4nomEu4Mi1p7OYRoY+zkyy5wen6CU8++wgMjCD6H
   VepKXhWQr7BFjwc9JBBXYR7f3h2+xJSQ2IG2Ko9klRrZYksK7zVAKZBRv
   w==;
X-CSE-ConnectionGUID: 1BspFlupStWk/8CtXSyJOA==
X-CSE-MsgGUID: /l99gezbRnGN89SZt9+MNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="86432040"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="86432040"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 07:13:51 -0700
X-CSE-ConnectionGUID: PDxd48G8Rl+ulU/Rsg6ZdQ==
X-CSE-MsgGUID: HyDxZS8JSJuC469nzXvMfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="283392842"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Jul 2026 07:13:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wg17q-00000000D63-05F2;
	Sat, 04 Jul 2026 14:13:46 +0000
Date: Sat, 4 Jul 2026 22:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: adi25charis@gmail.com, vireshk@kernel.org, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari S <adi25charis@gmail.com>
Subject: Re: [PATCH] staging: greybus: bootrom: power off module on timeout
Message-ID: <202607042245.XyM6HiC2-lkp@intel.com>
References: <20260704071926.6606-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704071926.6606-1-adi25charis@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/adi25charis-gmail-com/staging-greybus-bootrom-power-off-module-on-timeout/20260704-152129
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260704071926.6606-1-adi25charis%40gmail.com
patch subject: [PATCH] staging: greybus: bootrom: power off module on timeout
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260704/202607042245.XyM6HiC2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607042245.XyM6HiC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607042245.XyM6HiC2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "gb_svc_intf_eject" [drivers/staging/greybus/gb-bootrom.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3550F156C6A;
	Wed, 22 Oct 2025 00:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761092419; cv=none; b=Nq28fVPzU0xcwqjipCPCCp5vzC6X6Wn40iFx6VZG9tkZyfQtyv6JOVuWon55fL3VALGx3Em1rnc4W3HgtXPgbN1ZMmvjMf4nAGHO6J6lGT6CB1NRMBXCSY8AlqeapJ7x2O2BYa0g0jnqoOv12oEcFxF7KdqALrIXrja3nE/Khlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761092419; c=relaxed/simple;
	bh=QpNUnH1+y2MUz/2TQ/VNyCQxrrkSu52xR3jmkwJWaak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ydq8Vd1uC19e158FlBrj9neL/b2vwfM1Pl5uN+fGCvgfogWqeyxji0pDm20wCl1DzQfsGdkf97grzr5fUXDVP1RHLIdXM+zLnpc9kF6UNud3Ed7mFNK1hntrlLBCpzsMPyeJZ9B92gcY5SQBaT+Yqyo7ftP+ERuol/2YBsdmDNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eke+WBPc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eke+WBPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761092418; x=1792628418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QpNUnH1+y2MUz/2TQ/VNyCQxrrkSu52xR3jmkwJWaak=;
  b=Eke+WBPcDgo9XdR2x0Se6CTlGerfFGmRtncGM5JtmvGrj1fn2sinwyWJ
   dVt8NFsLLxcyRpCBHfFcLpcJe8baxPMSZUe7Z4TOOjONDQWxpebUf9hpn
   BoSgJphQnKtWfzfKc8BqgmvHmIcy409/9yoYhCaLjBUVM+B1/Vc313OxB
   p95FUwgxPGR3z2bl3oQEpv7YFpsK7gXero/9FM6goFgS0kP5gK3gzPsrW
   CM8hGBeHMZlVU7bqyErhJ4pNNgKwYXUWJFSZVxypB/oBf/OatZaZbQl3n
   T0kQt4qS5aPWq6EbnWbWvv8rTpCtmGR8LlQGnYYnqPQm06HMhNwHqWUZv
   Q==;
X-CSE-ConnectionGUID: 2/9UvqHiSUi0zcpT9issUQ==
X-CSE-MsgGUID: TPLDaXFTTNmDwf5/hsEvcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80668856"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="80668856"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 17:20:17 -0700
X-CSE-ConnectionGUID: YOe56Kb9ThSiJAQYW5KhAg==
X-CSE-MsgGUID: tF3wYFwTRQGrvFsPaShS1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="187999986"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Oct 2025 17:20:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBMaK-000Br0-2H;
	Wed, 22 Oct 2025 00:20:12 +0000
Date: Wed, 22 Oct 2025 08:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Simon Trimmer <simont@opensource.cirrus.com>
Subject: [linux-next:master 1024/3056] ERROR: modpost:
 "asoc_sdw_get_codec_info_list_count"
 [sound/soc/sof/intel/snd-sof-intel-hda-generic.ko] undefined!
Message-ID: <202510220819.KrN5gjKL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
commit: 5226d19d4cae5398caeb93a6052bfb614e0099c7 [1024/3056] ASoC: SOF: Intel: use sof_sdw as default SDW machine driver
config: i386-randconfig-011-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220819.KrN5gjKL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220819.KrN5gjKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220819.KrN5gjKL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "asoc_sdw_get_codec_info_list_count" [sound/soc/sof/intel/snd-sof-intel-hda-generic.ko] undefined!
>> ERROR: modpost: "codec_info_list" [sound/soc/sof/intel/snd-sof-intel-hda-generic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

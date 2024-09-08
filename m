Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056E7C8D7;
	Sun,  8 Sep 2024 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725820174; cv=none; b=FgN4qTlcFmSFKzRE15XGbF/YhrQDsWMsgcSWZATLImnqHjx98M7tk/pEJ0WLb0vB+JVK3BCaisDnMIVp2scZ4FE5tDu/SvaD5Nue1O0cv6NBJQXx5wlGUY+EAy8eL5V7weOsVUMmGi7sy1IehLqcwEr7RJ/JVOvK2lzGObvq+jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725820174; c=relaxed/simple;
	bh=9L35pRO9O6reaIetMunMgNY2vpHC1rr73V88dtdTRZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GuD8x5pnlZvzj6OEaHqmQ1dlHA1SOASQwKb4niAOhh9Do0Dnq68sW2Mbohyxjtkto8DQ8qkcewf/jJQ50vzc3p7JNIYWLfXYjkfMPCAHZYnTmwnIjkuPtDj5iqhrHImd1Q3ye6d8RngUOaiMVNBiu7KvdSZnLz7kbAfqHrBPUHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwyRvVWI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwyRvVWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725820172; x=1757356172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9L35pRO9O6reaIetMunMgNY2vpHC1rr73V88dtdTRZ8=;
  b=CwyRvVWI4fVPUg6K0yfOdadWq5DbEd1vxZ0tA/GseNFcAYD2j+HCCH0E
   8IbbCEmVO89i562kmJxynyyGxCBWsSmX7yzDlWXfg0U/lfMEgzhhFQ/yN
   SCgAW0I77ramiN4I4BKbcgEl7mTJ9roaWPVV26ytiLfy/bbN2J+9B/YWu
   seXtNFhwPtehBk4czEtJW4b5y9VknxDRHPzcbiQtP/vuchQEcw+giiKQf
   pOs7+mq7A0ifVX3omPYiBblTy8t3H+gRKu2Jy8WvkD10BI36kzlQrWFYh
   0252OGkZY5amNTapdQpmpnlNkGRW4l2OVZZLMHYFMswwc5Zx77a3FjKjf
   A==;
X-CSE-ConnectionGUID: jy/nJVaFSBiZ1sKcHhHYlw==
X-CSE-MsgGUID: Zy03Zq+LS4Sb8hsBlZPWLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="42018211"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="42018211"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 11:29:32 -0700
X-CSE-ConnectionGUID: x/qy3MMgQ8OBJWOdlIhXmA==
X-CSE-MsgGUID: 5Um0AMeiTjWYPn03FouZfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66445901"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2024 11:29:30 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snMfA-000Doh-1Q;
	Sun, 08 Sep 2024 18:29:28 +0000
Date: Mon, 9 Sep 2024 02:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-pcm-cleanup-2024-09-06 3/10]
 sound/soc/soc-compress.c:545: warning: Excess function parameter 'num'
 description in 'snd_soc_new_compress'
Message-ID: <202409090248.IXLfqQMV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-pcm-cleanup-2024-09-06
head:   46ce7eb32f30081c6c26a57ad12a2b20f9f12d09
commit: 9dc7690e8c84c67ffe3d525e1a5bdf66338f3529 [3/10] ASoC: rename rtd->num to rtd->id
config: i386-buildonly-randconfig-004-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090248.IXLfqQMV-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090248.IXLfqQMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090248.IXLfqQMV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-compress.c:545: warning: Function parameter or struct member 'id' not described in 'snd_soc_new_compress'
>> sound/soc/soc-compress.c:545: warning: Excess function parameter 'num' description in 'snd_soc_new_compress'


vim +545 sound/soc/soc-compress.c

2a99ef0fdb35a0 Liam Girdwood     2014-01-17  535  
6f0c42269f000b Jie Yang          2015-10-13  536  /**
6f0c42269f000b Jie Yang          2015-10-13  537   * snd_soc_new_compress - create a new compress.
6f0c42269f000b Jie Yang          2015-10-13  538   *
6f0c42269f000b Jie Yang          2015-10-13  539   * @rtd: The runtime for which we will create compress
6f0c42269f000b Jie Yang          2015-10-13  540   * @num: the device index number (zero based - shared with normal PCMs)
6f0c42269f000b Jie Yang          2015-10-13  541   *
6f0c42269f000b Jie Yang          2015-10-13  542   * Return: 0 for success, else error.
6f0c42269f000b Jie Yang          2015-10-13  543   */
9dc7690e8c84c6 Kuninori Morimoto 2024-09-06  544  int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int id)
1245b7005de02d Namarta Kohli     2012-08-16 @545  {

:::::: The code at line 545 was first introduced by commit
:::::: 1245b7005de02d5bfa0c321df925f5b6c83c99e1 ASoC: add compress stream support

:::::: TO: Namarta Kohli <namartax.kohli@intel.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

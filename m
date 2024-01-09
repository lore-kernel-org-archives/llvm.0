Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8873B790;
	Tue,  9 Jan 2024 19:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZx7rfd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704826831; x=1736362831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zmAa0KCltHoQ3zl7+mtFEvcvP8OjsOqBbxuXdBDluC0=;
  b=BZx7rfd1tvcAWF28zeykhmVujsjEa96Zr8ZPjSbg1nOd1rTP8VpIMGqO
   78UDli70eQMnTRFSoIdkCccVIhQoJqp6cV4i7tReFiVv2r9o6nxKt1Pr3
   ksHhr+7oY30TxBVsG5BRxbtjv04vZELkyJcXxSJooZ39T1VtkCDCvmhtC
   eg7z4JO0R4zH+cPmASTGRz3s4wjR8HwId7hLkTzyAJLHhoLmlfrg34yQ3
   jbPF9Id4k/ksTyEx1pY3rCwnP7qOGKHPB3rWHNuvut0cNj5dRqxoqOkJU
   Dx9qjuhxcL2oCJZvp4QYHlqTOZ5lmBelrR4EkJtYkfB1Ip4Z5KYjBOjC4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484476987"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="484476987"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 11:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="16376771"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2024 11:00:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNHKs-0006Aw-0q;
	Tue, 09 Jan 2024 19:00:26 +0000
Date: Wed, 10 Jan 2024 03:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steev Klimaszewski <steev@kali.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [steev:c630-linux-v6.7.0-rc8 160/165]
 sound/soc/codecs/wsa884x.c:1782:33: error: no member named 'dev' in 'struct
 sdw_stream_runtime'
Message-ID: <202401100218.KlrV1OaK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux c630-linux-v6.7.0-rc8
head:   ff607c5b78e72a98f85de6a64124da02cca916b9
commit: 36178948b637e43373619370cac68c51fd4fffdd [160/165] ASoC: codecs: wsa884x: check if set_stream is called for proper bus
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240110/202401100218.KlrV1OaK-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401100218.KlrV1OaK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401100218.KlrV1OaK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/wsa884x.c:1782:33: error: no member named 'dev' in 'struct sdw_stream_runtime'
    1782 |         if (sdw->bus->dev != sruntime->dev)
         |                              ~~~~~~~~  ^
   1 error generated.


vim +1782 sound/soc/codecs/wsa884x.c

  1773	
  1774	static int wsa884x_set_stream(struct snd_soc_dai *dai,
  1775				      void *stream, int direction)
  1776	{
  1777		struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
  1778		struct sdw_stream_runtime *sruntime = stream;
  1779		struct sdw_slave *sdw = dev_to_sdw_dev(dai->dev);
  1780	
  1781		/* Check if this belongs to same bus */
> 1782		if (sdw->bus->dev != sruntime->dev)
  1783			return 0;
  1784	
  1785		wsa884x->sruntime = stream;
  1786	
  1787		return 0;
  1788	}
  1789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1890E17BC3;
	Mon, 15 Jan 2024 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jatAhGwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705329739; x=1736865739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u5wMbpTlz7Wcf8NUxZ2HrPiETv3TSAPdjxFz5Luxkp4=;
  b=jatAhGwGAlk3g7B4RZToE0VvO+2bV5wnLLjlXRcdHU4iNLIAN5bENQYb
   gaAbG0nnTdO1nK/jlT0pB1rtULW5hK59JpIy3KdL2qF5RCkX+SRVjzYcF
   tT9cAzhqk8ZHuT1f/2IOfzSKzte6phBXBfhdtEMaXLQfyqdwAWahTsmEQ
   oayOOeUAR0w5O5z6RCVQrSU2fFaHxuKRgJspWoVmG/5uff+NYIhpa4d8D
   jMt0Gigr4tn1pl4qnpOf/RDG/bsCMtduPOV4e/QtzHf6JoZySSXmDC19J
   u9ORLb7b6v2jII0wxO/ik023c4TZvqERw/s0b0EL0bsZnmRQaanIpH3cB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="12984146"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="12984146"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 06:42:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="1030663343"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="1030663343"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jan 2024 06:42:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPO9v-000CXU-1A;
	Mon, 15 Jan 2024 14:41:53 +0000
Date: Mon, 15 Jan 2024 22:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steev Klimaszewski <steev@kali.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [steev:c630-linux-6.7.y 160/172] sound/soc/codecs/wsa884x.c:1782:33:
 error: no member named 'dev' in 'struct sdw_stream_runtime'
Message-ID: <202401152241.JjKK4P38-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux c630-linux-6.7.y
head:   1e38da45fb7002ca38a657441f21dc4c93fb8cf3
commit: 73e51a60212fd2c7e76a32a01b4c22a2cbfc24ad [160/172] ASoC: codecs: wsa884x: check if set_stream is called for proper bus
config: i386-randconfig-013-20240115 (https://download.01.org/0day-ci/archive/20240115/202401152241.JjKK4P38-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401152241.JjKK4P38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401152241.JjKK4P38-lkp@intel.com/

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

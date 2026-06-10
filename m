Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB2322A80D;
	Wed, 10 Jun 2026 02:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781058662; cv=none; b=m4+TlBQtHV9rZC2e2JL3UO61h0pombveQvdv6ZJ0gsFYbGVEG2er/mFAEu1QNGTuxD/YEbGOcRn/ttt6egkLOVneHXkiovYpGDDn4TUp2VFxtHXgt7ffQek1vvKi2Oe2MFAiYFQftyHXvl2vYfQX4dvEpNQM4bj8HT25BqQe/rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781058662; c=relaxed/simple;
	bh=q2X9TjFLi50Te162DjUVbY1kOZzXwOOH5Z1jucpZe+c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SQbNoUY/IbF0pNvBy9t20CFB2Rfq8UfVktcVKxHCCWnDku/TdvUiXCzAEoOzVCnSFPAbg1Yen/kDjlPFbO2D5+1uWlsN5gzLv3Z4LfG+TD3yLkWip/uYwDViUPWJWgriYaYmeEag9uYDlpCrszAkhmmtufMfZZcDOPbbtH5Ax6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7AQDaSK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7AQDaSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781058661; x=1812594661;
  h=date:from:to:cc:subject:message-id;
  bh=q2X9TjFLi50Te162DjUVbY1kOZzXwOOH5Z1jucpZe+c=;
  b=T7AQDaSKkiN4fq5R+tT4XvPgGBIgyR5M+dbthrHnvB/qQnWtMpp1yU9F
   4hRfkaeMBRhst2qVbFex9hDkjSWqKb8nmstMAjA2SNaswZmfpW4BEJWiz
   XKG3KEvi4WJK44YrF6Glp7jTXYjipvo/WQefH8+7PJbwr22YxUHh8gCnh
   RhuSeB0aPXFPgT5p93lJYqNYvpr/s9C13s7vxWutgO8V3Xniic42VkmsU
   5AhreJ0PqefRXE9w5/hg/wP2XkhEtqfB5iz66coqQN1hVvVIkoEwIBV+E
   RWeaHiSQs5CJRnUUo/GtIweX60OIH+9xCQwXC+iqHQKlVAlcuVVgczfeI
   A==;
X-CSE-ConnectionGUID: h3i/FyruRhGuLAUghrvamg==
X-CSE-MsgGUID: R+xuO8keR0C+9qhpwS84xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92407113"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92407113"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:31:00 -0700
X-CSE-ConnectionGUID: GC62w92JRLSYVHmHGv6tQQ==
X-CSE-MsgGUID: cqa4r15ZQxSW0IYG0f931w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245184199"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2026 19:30:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX8iU-00000000Koa-38MI;
	Wed, 10 Jun 2026 02:30:54 +0000
Date: Wed, 10 Jun 2026 10:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [superna9999:topic/sm8650/ayaneo-pocket-s2/wsa2-fix 3/5]
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c:311:2: warning: variable 'sysclk' is
 used uninitialized whenever switch default is taken
Message-ID: <202606101057.hHh1Oz5d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/superna9999/linux topic/sm8650/ayaneo-pocket-s2/wsa2-fix
head:   074a0ec5e0e7c16933371ee131890bacbfee4fdd
commit: 02d9f572535b8da9920f6bae51fcdfc3e3d93cb3 [3/5] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
config: x86_64-buildonly-randconfig-003-20260610 (https://download.01.org/0day-ci/archive/20260610/202606101057.hHh1Oz5d-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101057.hHh1Oz5d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101057.hHh1Oz5d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/qdsp6/q6apm-lpass-dais.c:311:2: warning: variable 'sysclk' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     311 |         default:
         |         ^~~~~~~
   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c:315:6: note: uninitialized use occurs here
     315 |         if (sysclk) {
         |             ^~~~~~
   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c:294:20: note: initialize the variable 'sysclk' to silence this warning
     294 |         struct clk *sysclk;
         |                           ^
         |                            = NULL
   1 warning generated.


vim +/sysclk +311 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c

   290	
   291	static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
   292	{
   293		struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
   294		struct clk *sysclk;
   295		bool *enabled;
   296		int ret = 0;
   297	
   298		switch (clk_id) {
   299		case LPAIF_MI2S_MCLK:
   300			sysclk = dai_data->priv[dai->id].mclk;
   301			enabled = &dai_data->priv[dai->id].mclk_enabled;
   302			break;
   303		case LPAIF_MI2S_BCLK:
   304			sysclk = dai_data->priv[dai->id].bclk;
   305			enabled = &dai_data->priv[dai->id].bclk_enabled;
   306			break;
   307		case LPAIF_MI2S_ECLK:
   308			sysclk = dai_data->priv[dai->id].eclk;
   309			enabled = &dai_data->priv[dai->id].eclk_enabled;
   310			break;
 > 311		default:
   312			break;
   313		}
   314	
   315		if (sysclk) {
   316			clk_set_rate(sysclk, freq);
   317			ret = clk_prepare_enable(sysclk);
   318			if (ret) {
   319				dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
   320				return ret;
   321			}
   322	
   323			*enabled = true;
   324		}
   325	
   326		return ret;
   327	}
   328	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

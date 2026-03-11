Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFF73E8671;
	Wed, 11 Mar 2026 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253613; cv=none; b=GGaRwPtAccINUOH1T4iNiFc5XHMX9yTSBjWnLxdOmcOYrgjYcoGR5JEegfN7bqj3cuHr1bRDmSy68RoiEyui+UMpZQbuJCAMui8N4SW9tVYHYuzOswQSxW6Pd1i5fMFZeS04aYAq/7KMHkK2bZyYCoPiNx0YaQGVBoImHpxMf54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253613; c=relaxed/simple;
	bh=uLhWU+AZ6NFmcqPi+gIdjHiHih6E5Ri12T67mb5+E0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JADMUwMjIbTOAkDxULOcYv3Wx0NW/Q9Tny3IeZrRkVrrZif08kohG8EMiSN/ukKyazQlupfzf0Dw+wodaL9+kx+tA1lMpOEU/B1qlJZzj8Q5thDDlyMV3KZWaL1GOs+65jTFMZMaTTopZrtLeWfrrIJIaoHzR8Ohev43yQKSPUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g0Qi1zlU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g0Qi1zlU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773253612; x=1804789612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uLhWU+AZ6NFmcqPi+gIdjHiHih6E5Ri12T67mb5+E0w=;
  b=g0Qi1zlUezt9E85cMWrR8jxIGtbdqfrE2QF6G4XqONAa+oXVCzv7FXFz
   27H5LwYbwtHlaRivyJiV9+9g0lEih+B8H63Uiv/v2wQClGRtLLmStfxHs
   cndySamCNHt8wCPbYlqZnyOCUf0ooxAQ/9KJQLFSquH41TBztZVTUJ9mn
   9GqKvxxrpzvgrRUNO9Mmr3wzI4tvSdvesKIJFZcjEvnH3FRbaAV615ZeP
   5g/g0bnua2roaF/qegRejyyUJEUpKKw0Nf8hIgqTB1psOgS2vR/t4Sk35
   brLMVcIgT/plPr+EFoVyGh4YP3v9wjbWjLm9fDBK7aZLZQJn+2zNC7Eqr
   w==;
X-CSE-ConnectionGUID: lTzRRfvORPSFEwJONVB3CQ==
X-CSE-MsgGUID: kIzNSfjmRfaMLFT3CPMDgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74414702"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74414702"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 11:26:52 -0700
X-CSE-ConnectionGUID: SbtVNq32RuWx19m5q3vrTQ==
X-CSE-MsgGUID: TZouXnOLRAG2W6IqUeyUFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="218030614"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Mar 2026 11:26:49 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0OGc-000000001Zv-2qlK;
	Wed, 11 Mar 2026 18:26:46 +0000
Date: Thu, 12 Mar 2026 02:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
Message-ID: <202603120247.NRy9LSop-lkp@intel.com>
References: <20260309111300.2484262-4-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309111300.2484262-4-mohammad.rafi.shaik@oss.qualcomm.com>

Hi Mohammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohammad-Rafi-Shaik/ASoC-dt-bindings-qcom-q6apm-lpass-dais-Document-DAI-subnode/20260309-191956
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260309111300.2484262-4-mohammad.rafi.shaik%40oss.qualcomm.com
patch subject: [PATCH v1 3/4] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260312/202603120247.NRy9LSop-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120247.NRy9LSop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120247.NRy9LSop-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/qdsp6/q6apm-lpass-dais.c:298:2: warning: variable 'sysclk' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     298 |         default:
         |         ^~~~~~~
   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c:302:6: note: uninitialized use occurs here
     302 |         if (sysclk) {
         |             ^~~~~~
   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c:281:20: note: initialize the variable 'sysclk' to silence this warning
     281 |         struct clk *sysclk;
         |                           ^
         |                            = NULL
   1 warning generated.


vim +/sysclk +298 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c

   277	
   278	static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
   279	{
   280		struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
   281		struct clk *sysclk;
   282		bool *enabled;
   283		int ret = 0;
   284	
   285		switch (clk_id) {
   286		case LPAIF_MI2S_MCLK:
   287			sysclk = dai_data->priv[dai->id].mclk;
   288			enabled = &dai_data->priv[dai->id].mclk_enabled;
   289			break;
   290		case LPAIF_MI2S_BCLK:
   291			sysclk = dai_data->priv[dai->id].bclk;
   292			enabled = &dai_data->priv[dai->id].bclk_enabled;
   293			break;
   294		case LPAIF_MI2S_ECLK:
   295			sysclk = dai_data->priv[dai->id].eclk;
   296			enabled = &dai_data->priv[dai->id].eclk_enabled;
   297			break;
 > 298		default:
   299			break;
   300		}
   301	
   302		if (sysclk) {
   303			clk_set_rate(sysclk, freq);
   304			ret = clk_prepare_enable(sysclk);
   305			if (ret) {
   306				dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
   307				return ret;
   308			}
   309	
   310			*enabled = true;
   311		}
   312	
   313		return ret;
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

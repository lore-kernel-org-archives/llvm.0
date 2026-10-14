Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E9E569F1B;
	Wed, 14 Oct 2026 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003900; cv=none; b=oqIPDUKzFeqVgvrIT9qavt9JDDAjw0lHk9MfWesgPCe/his8RIyZXhsbYSHnKUr2ZzbtO7gkMtPRZeXaJP7QHIuv/dqIR+vKKGw7YZ9Tww4dZkACSYSOGj7PS6zlxQkPA5Jd89H7pC24cckybR7eGdzJbdbwds6rM6l6y1CFbgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003900; c=relaxed/simple;
	bh=s/i8RPjRgl4wPrFTH5nImV2yVSNtfDmN232WCrWgTBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0h9QLo4vv9fY1EJ9rydMMJmaNGMuPeDYbSUmXOWT0TxW0kMfv53IKcKvsjE7XOU3wfFXPfpFjUr/nUbuVzaRgXPvSc1QQJG0rXBsWTcfi5+y9COnregN+FAFTaokr6zjhrmgQ+y90KVyWG7V6XfZyDnHqIuzrBiOJtXapydqJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBx42HXX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBx42HXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792003899; x=1823539899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s/i8RPjRgl4wPrFTH5nImV2yVSNtfDmN232WCrWgTBQ=;
  b=mBx42HXXXl7LrWCzVhp1YSb8KcxNTuId+1xsDRkvXssCiy2/X9x7CjKb
   1Ndwq7mbLM/n2phF7S1W/+eQYaEHy36oE5V29mPM6i3OeS7VdaO/XJFS+
   ZvD1Bx8hN9tZResj9CLS08vLLLbu4C1Q5eWPJUeiW5z0BJ5Tus772mJOF
   CpB9WELjF4Otrnhf+h5ZU/vaBXUxS6hvumFGXZD0OEwRluzgd7uqi8im/
   ejIzSl8y+vSSE8y97JqLutRwgsBVjb7Zq/MkG+hkYaYPDzwMt3vZDlKDJ
   9oW5Rpnu/ydDOVFvJnNb82GamNeiuwOFhHQo1Vsz+2KFwqOIzNpjL6Srs
   w==;
X-CSE-ConnectionGUID: O3JE/PI/RcaPKNNPzgEqMA==
X-CSE-MsgGUID: pKkkihcxRBWGFAs1Igo3vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="650249"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="650249"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:51:37 -0700
X-CSE-ConnectionGUID: 0eg66OL7RyamEFcMixabuQ==
X-CSE-MsgGUID: dZRf945+SmqDgyMp7XaU7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1522678"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2026 11:51:33 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH44Z-00000000F4d-0i0R;
	Wed, 14 Oct 2026 18:51:31 +0000
Date: Thu, 15 Oct 2026 02:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>,
	andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	sarath.ganapathiraju@oss.qualcomm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	prasad.kumpatla@oss.qualcomm.com
Subject: Re: [PATCH v11 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Message-ID: <202610150244.4heS16Km-lkp@intel.com>
References: <20261012-master-v11-2-15009e3ecac3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-master-v11-2-15009e3ecac3@oss.qualcomm.com>

Hi Sarath,

kernel test robot noticed the following build errors:

[auto build test ERROR on becb95e45ef0dda9ffb35156d909d3da7a2789c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarath-Ganapathiraju-via-B4-Relay/dt-bindings-clock-qcom-Add-LPASS-VA-CSR-HeartBeat-pulse-clock/20261012-172258
base:   becb95e45ef0dda9ffb35156d909d3da7a2789c3
patch link:    https://lore.kernel.org/r/20261012-master-v11-2-15009e3ecac3%40oss.qualcomm.com
patch subject: [PATCH v11 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
config: powerpc64-randconfig-1000-20261014 (https://download.01.org/0day-ci/archive/20261015/202610150244.4heS16Km-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150244.4heS16Km-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150244.4heS16Km-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/lpass-va-csr.c:61:21: error: called object type 'void *' is not a function or function pointer
      61 |         ret = pm_clk_resume(dev);
         |               ~~~~~~~~~~~~~^
   drivers/clk/qcom/lpass-va-csr.c:77:16: error: called object type 'void *' is not a function or function pointer
      77 |         pm_clk_suspend(dev);
         |         ~~~~~~~~~~~~~~^
   drivers/clk/qcom/lpass-va-csr.c:83:23: error: called object type 'void *' is not a function or function pointer
      83 |         return pm_clk_suspend(dev);
         |                ~~~~~~~~~~~~~~^
   3 errors generated.


vim +61 drivers/clk/qcom/lpass-va-csr.c

    54	
    55	static int lpass_va_csr_runtime_resume(struct device *dev)
    56	{
    57		struct lpass_va_csr *csr = dev_get_drvdata(dev);
    58		const struct lpass_va_csr_data *data = csr->data;
    59		int ret;
    60	
  > 61		ret = pm_clk_resume(dev);
    62		if (ret)
    63			return ret;
    64	
    65		ret = regmap_write(csr->hb.regmap, LPASS_RATE_GEN_COUNTER_0,
    66				   data->counter_0);
    67		if (ret)
    68			goto err_pm_clk_suspend;
    69	
    70		ret = regmap_write(csr->hb.regmap, LPASS_RATE_GEN_DELAY, data->delay);
    71		if (ret)
    72			goto err_pm_clk_suspend;
    73	
    74		return 0;
    75	
    76	err_pm_clk_suspend:
    77		pm_clk_suspend(dev);
    78		return ret;
    79	}
    80	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

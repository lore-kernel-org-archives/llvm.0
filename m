Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3484EEDE;
	Tue, 19 Aug 2025 01:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755565827; cv=none; b=D+sx+hVbrFtVNXd+zLdA4I2DgAB54ht490/iLS3HgcWRD5138360TJFnOr7la3o2UmTW3Cs3jzepWGZZs2Grxi6zwDLlpkLR4htEuvSG23iyYxx/fB/7sibP9mXjGng6G6dHxMUEHq2+L8WQD6zc1fBAyWDKt+y4lACoNvyp0QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755565827; c=relaxed/simple;
	bh=8ols7T2y7XVWY3yVV7Yv+BxGxeqnU+Gbg24qYQzUIvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOGHTvTV6a69ZjQjw6HADUDMgSRuhShNeVuJYDniiox3VqAX99p0z3n4Yj+wTPLSxlABVF61KjPC8ONMU6OJ97kLfCeuNLIBQUJq67+awfOXPmkaxpNRuZCFam8jhciu3/2/YsHL/h/4kyhQCVinnlP8qTRRn45tEQivX9b28iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXQvPlql; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXQvPlql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755565826; x=1787101826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ols7T2y7XVWY3yVV7Yv+BxGxeqnU+Gbg24qYQzUIvU=;
  b=ZXQvPlqlxClJTMBmp4eO+TOr0OoaQ94f10M6PaLVGnk0YVL4ZOZXmTny
   PNtCDbxR8vaBL5xaeZxIhcOOX5XYlhXzqGcXOXnlXM4eQnTdIfUzBrMBh
   3mi4FB9NlYR9WsmtciLZxZaWeNmAGas2iSwlIaTo/WkUWBikBNOS6+ocr
   uzQUe3VNDAgBjcqdbpwfpqjTkzIUPp4xVZTHQX3HtAlf0r0YlEDRIC/6W
   TGQm0LssfaOTAeBPOwRSSsQmmtiIuzUpClTPZVE8xruxumFloPhZIun/Y
   XPdg0hz8xxFTBdHW0FK1DZKfVmLHacKHBwA4sgHBA07tte7WFV2IF0xt0
   A==;
X-CSE-ConnectionGUID: kVfMfB/pTnOcA8yIh0fLyg==
X-CSE-MsgGUID: 3YoSTlNMSNWIv4HjsCp1yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68898770"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="68898770"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 18:10:25 -0700
X-CSE-ConnectionGUID: JgGBi5/DTsG97wU9f4HUbA==
X-CSE-MsgGUID: 6XlgjQ9XSO+yyy9xt45L/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="171934282"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Aug 2025 18:10:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoArj-000GMx-1Z;
	Tue, 19 Aug 2025 01:10:19 +0000
Date: Tue, 19 Aug 2025 09:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/6] ASoC: qcom: audioreach: add support for static
 calibration
Message-ID: <202508190818.gTYRlR8x-lkp@intel.com>
References: <20250818125055.1226708-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818125055.1226708-4-srinivas.kandagatla@oss.qualcomm.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.17-rc2 next-20250818]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/srinivas-kandagatla-oss-qualcomm-com/ASoC-qcom-audioreach-deprecate-AR_TKN_U32_MODULE_-IN-OUT-_PORTS/20250818-210034
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250818125055.1226708-4-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH v3 3/6] ASoC: qcom: audioreach: add support for static calibration
config: x86_64-buildonly-randconfig-002-20250819 (https://download.01.org/0day-ci/archive/20250819/202508190818.gTYRlR8x-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508190818.gTYRlR8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508190818.gTYRlR8x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/sound/snd_ar_tokens.h:243:2: error: unknown type name '__le32'
     243 |         __le32 size;    /* size in bytes of the array, including all elements */
         |         ^
   ./usr/include/sound/snd_ar_tokens.h:244:2: error: unknown type name '__le32'
     244 |         __le32 type;    /* SND_SOC_AR_TPLG_MODULE_CFG_TYPE */
         |         ^
   ./usr/include/sound/snd_ar_tokens.h:245:2: error: unknown type name '__le32'
     245 |         __le32 priv[2]; /* Private data for future expansion */
         |         ^
   ./usr/include/sound/snd_ar_tokens.h:246:2: error: unknown type name '__le32'
     246 |         __le32 data[0]; /* config data */
         |         ^
   4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

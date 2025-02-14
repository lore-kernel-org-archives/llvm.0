Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF6E230985;
	Fri, 14 Feb 2025 13:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739541084; cv=none; b=dHJhzzwUhdcZ+5UQOEAB2njYJ4SfGFYizPKqabiACzgy8guNhJdhhrcT9ifOZKkRWZ1dyDE8Bxe6XX/Z6iBaxBkkcoMsB9BSbgNlIQp03TxjuukecKJxKIlRET5ycyO8hHtzJ5pM3uH3hbw7gC7uL225ammGbJzCf/vqPrxn6Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739541084; c=relaxed/simple;
	bh=4RYb0V938Hvh8XfpOfW2FPzt2ThKIlaPfePtmuDjHvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eO86cNIZzl2AW5Cx7wmSoIq4/aVViT/oKTnZ1V30YTh2YKWDWtlm01B5Toqpg0EDQkuT7ljuUsiImV549ppS5yGe9RrJwnEn8qJNlxq2CIWooViNnCGkXLyIH4o8Ep0tOAg0MYtTO2ernnc0KE/kS0S1WNBaI4ShbiKU6tC3I04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvZ4/QjT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvZ4/QjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739541083; x=1771077083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4RYb0V938Hvh8XfpOfW2FPzt2ThKIlaPfePtmuDjHvc=;
  b=DvZ4/QjT84ocToFUbGDrIORM689Re4NDTLn1YBgNjX3/BkbZQxMyl7Ok
   CsX+EJXjHCr4a9hv/iaW5yEUpU9p+3+2NtgZPNFVJ2O4gJzS97XPtCc8S
   Sk2hIZ1zqEiTq9jv8Az3uMtBtUzuXf+oSkH20+62lxNwhufjJDsFOS/FF
   oNwp8n1k8RiET60JioZ/Vk2NUBzUw0kBdElRJZkuPjVBHtdXeOXDX/gZb
   +DEJFjfIISEy4bc7shSvCi0uevl/ncXqLrTJQ4PcPa7r4NjBVJ058H+mP
   IFo2GqvHPqXgaRH38v++obZZ8MEmvRJBm4UezOJjmS6Em9B+h6RhAxnxH
   g==;
X-CSE-ConnectionGUID: dUsX6i7/ReSNS/Z5BnQ8Mg==
X-CSE-MsgGUID: gFY0HzNoTCO7t71rtagN1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40323764"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40323764"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 05:51:23 -0800
X-CSE-ConnectionGUID: PSBcuQ5sRpC62aaIV9z4VQ==
X-CSE-MsgGUID: jEzRNxGUQIiWWnjKYiY9Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113650248"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2025 05:51:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiw69-0019c7-0D;
	Fri, 14 Feb 2025 13:51:17 +0000
Date: Fri, 14 Feb 2025 21:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
	daniel.lezcano@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rui.zhang@intel.com, lukasz.luba@arm.com,
	david.collins@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] thermal: qcom-spmi-temp-alarm: Add temp alarm data
 struct based on HW subtype
Message-ID: <202502142135.ez2QBdYV-lkp@intel.com>
References: <20250213210403.3396392-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213210403.3396392-3-anjelique.melendez@oss.qualcomm.com>

Hi Anjelique,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/thermal]
[also build test ERROR on linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjelique-Melendez/thermal-qcom-spmi-temp-alarm-enable-stage-2-shutdown-when-required/20250214-050700
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20250213210403.3396392-3-anjelique.melendez%40oss.qualcomm.com
patch subject: [PATCH 2/4] thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW subtype
config: i386-buildonly-randconfig-003-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142135.ez2QBdYV-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142135.ez2QBdYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142135.ez2QBdYV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thermal/qcom/qcom-spmi-temp-alarm.c:148:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     148 |         return FIELD_GET(STATUS_GEN1_STAGE_MASK, reg);
         |                ^
   drivers/thermal/qcom/qcom-spmi-temp-alarm.c:169:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     169 |         ret = FIELD_GET(STATUS_GEN2_STATE_MASK, reg);
         |               ^
   2 errors generated.


vim +/FIELD_GET +148 drivers/thermal/qcom/qcom-spmi-temp-alarm.c

   132	
   133	/**
   134	 * qpnp_tm_get_temp_stage() - return over-temperature stage
   135	 * @chip:		Pointer to the qpnp_tm chip
   136	 *
   137	 * Return: stage on success, or errno on failure.
   138	 */
   139	static int qpnp_tm_get_temp_stage(struct qpnp_tm_chip *chip)
   140	{
   141		u8 reg = 0;
   142		int ret;
   143	
   144		ret = qpnp_tm_read(chip, QPNP_TM_REG_STATUS, &reg);
   145		if (ret < 0)
   146			return ret;
   147	
 > 148		return FIELD_GET(STATUS_GEN1_STAGE_MASK, reg);
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

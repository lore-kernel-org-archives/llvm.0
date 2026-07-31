Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C742E45C706;
	Fri, 31 Jul 2026 23:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785540599; cv=none; b=tSZ4bp2mKj7Y0af6qAyqik/9BB0X1rGPvR/YOTuyob8BL9v1KphQmJpDiZrzgA69+/BxsEZtg3FjJS+nFtCuufL9xg7N/WrWweI0Jv9qt76MBSQS/iznCHiObfCl9UlSgmRC1uM5Z6q0At3IUX2DgxYFGFFTt7ZkjxZLs9/xY9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785540599; c=relaxed/simple;
	bh=ncWq/OggOHGE0ae8GOQkWX4eradgkQ9iqmxyZA8G7dw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iX2RejwjMMdcCsiHD9eCpZ/CKT1HCAcKJVPVxKkDyHbgQpQZEkJjr0gXB3Zc497RcMfe5ubzzTTvIRI/XeutzoPpZfckq3pNsCj9wl6BLL2g/V7A1PGzllTxIxloKFbT2Z8XkVMGywC//PgbhMljBu5g3t0/8JLZP2xOQ3XaBUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYd99Fzq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYd99Fzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785540598; x=1817076598;
  h=date:from:to:cc:subject:message-id;
  bh=ncWq/OggOHGE0ae8GOQkWX4eradgkQ9iqmxyZA8G7dw=;
  b=LYd99Fzq/h2L2z8AQMwOlYhWTdAY18liJsSXSmP6Oq3HhMeEwUDBVLm8
   SML7GdxhGw+cjxGqcJuQp9T4Dv+fs+wwg+PWEXf+Vkk4IjjuWzxgng5hq
   1VYjnvvR8lOXjI7uG9dI5OGN0HF5Cr5mTJ3Cu2MmuOwmvtO0IbNlFImYx
   WcIxVI8U4B/4oMpmakH/bhFU7TSjgm3vZUhGMQmg73JnpBrDdocQ+S19V
   x+HetnxoQg/Dw82kzHuCmvhHBKAU6xodl1uVCFo+4fJqnaJorFVxT2sfh
   BPkIlM9OYGVrY3DzMuvmT4CsqaQgSeod09IMKix3jPSQ1fsGDxNc66N3m
   w==;
X-CSE-ConnectionGUID: bCFuGTEUQnSZgz9vnMxJSA==
X-CSE-MsgGUID: RvNIM0jZSmmyLMYo6RWFkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86121033"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="86121033"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 16:29:57 -0700
X-CSE-ConnectionGUID: Z8QuuUYXSy2LtefEOBJGnQ==
X-CSE-MsgGUID: LETPNk1tT2Wh6KsgNvy8ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="258899627"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2026 16:29:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpwfp-000000002O5-1tK6;
	Fri, 31 Jul 2026 23:29:53 +0000
Date: Sat, 01 Aug 2026 07:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 10281/11507] ERROR: modpost:
 "qcom_smem_is_available" [drivers/soc/qcom/ubwc_config.ko] undefined!
Message-ID: <202608010754.im6SvR4B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: 1b445022d1d0ec7431b6f8fe0054ae8ccf33d60a [10281/11507] soc: qcom: ubwc: Get HBB from SMEM
config: arm64-randconfig-001-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010754.im6SvR4B-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010754.im6SvR4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010754.im6SvR4B-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "qcom_smem_is_available" [drivers/soc/qcom/ubwc_config.ko] undefined!
>> ERROR: modpost: "qcom_smem_dram_get_hbb" [drivers/soc/qcom/ubwc_config.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

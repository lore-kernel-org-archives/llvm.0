Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646951;
	b=X0FuRtx95BWOCni9CeGnomEAqMUTSiBCN61ONGhZH2zoOiDFGNGaRDq4fsGarV2KNFzC
	 5tPAtCL3p2DpOKS2SUJChsc+nkGF4y/JUXt/lZBqWNUOM69KR0VZlPZL6P30a81NtnLdc
	 gFq4dsyxLtUs97woVAEmZoriCGvVQrbsYGodhWwFBNzgUk5YEhsYDVoV7+JQvZpMZ3QvS
	 WQuhcxNIzv64qVfXUfPmlnOa0LUT8pBwnVfezM1I6JDmeYnqdoDl7Qe2VXK+B70YZoFj+
	 dtFT58QTXqCLn13hOFFr9WFX2jZ2P56rcpnaxdva4pSRXWAQ4qzx0n4As15mVPMyBTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646951;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dQfaVLwiGfzKWRApDbLS/yWO/nZAUwR0Iibwcn3P/io=;
	b=v4rbGIK+0fNK23xQG5DjAMpzz0HE0tcHxKO/RND4rM73TPWAgZTrkXRXHzirat8StB59
	 TopRFmwOMoWZ9CCdLltez7yuC3BjWMrSE1wvbHZ+K2OTjAFglDDvlcXy9/wE73I2DdnLL
	 X3z8QYHr9DfzZfi9l/WIfoJiJ4GhdJ3mglrK92QJvWNnJ9DT7hhdwSPue1Xv28gXaYI0V
	 geXrzVbqlvTrhJf5OdC4CCFLQwLd1Ik3tAT7hif1n6epaNhaXU3OAq88XlwCXp7n6CgkM
	 IvvHrQLA46sKZEzAlwH1qIPlU94urCE49W7wo+VMTMs3mEHlms5vrUN4MSOrvR9v8gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EDVt59rM;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774E1606A319;
	Thu, 22 Oct 2026 05:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 774E1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EDVt59rM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792646950; x=1824182950;
  h=date:from:to:cc:subject:message-id;
  bh=xOYWz1jstK5+PP0eRGnXHxwYmVroTCZFp2ZH5zBcDSU=;
  b=EDVt59rMnztrl0YtvEApHon3Es8LqpJhJwgRCiWgz8K8dcHO4HlMAHsj
   pj1nHD28woLvwzpKjDr8lU9U9KSMopgOrjw+YXwI+yfkCR9VM11iZIhQX
   FhUWiSHge9Yf+lyrWmUjJVi3dBxnjBgzm6fBwP+Odpz/bstYJ2NoRibyX
   y2s8+7t8mPPi6P83vIJw58kUEfIJGlwJarYSKc3HlX05P9oyUMSMFshyF
   2SoYCRI/PURR1lCPi+Bjrdky9PHH1kGdrV+OB9F24JN64vBgiqW54lxnw
   9no2/RwhBA6SKZv8lGlpAE9gBOg5nwH3n9YhSQCP76skt+NMmZmaY6EdO
   Q==;
X-CSE-ConnectionGUID: Wcmy1Kp2QPqg80MZtWewjg==
X-CSE-MsgGUID: 8aY94/tkS8a6cwniufIupA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1285037"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1285037"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 22:29:09 -0700
X-CSE-ConnectionGUID: AAmwiDHRQOKZlF4efGzlcA==
X-CSE-MsgGUID: pWcFPLHNTh6ClxpA0mqAgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3676598"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2026 22:29:08 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJlMP-00000000Qaw-0Fvs;
	Thu, 22 Oct 2026 05:29:05 +0000
Date: Thu, 22 Oct 2026 13:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: [lumag-msm:venus-8996-vmem 70/173] Warning:
 drivers/cpufreq/qcom-cpufreq-hw.c:118 function parameter 'cpu_dev' not
 described in 'qcom_cpufreq_update_opp'
Message-ID: <202610221320.83iuWIYk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://gitlab.freedesktop.org/lumag/msm venus-8996-vmem
head:   4dff7b31dd13e97b8f7abab7bc115d2875afd5e8
commit: cfa31c4bc448f8442d713de3c9aedba5d810ac88 [70/173] cpufreq: qcom-hw: Add kerneldoc to some functions
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261022/202610221320.83iuWIYk-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610221320.83iuWIYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610221320.83iuWIYk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:118 function parameter 'cpu_dev' not described in 'qcom_cpufreq_update_opp'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:118 Excess function parameter 'policy' description in 'qcom_cpufreq_update_opp'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:118 function parameter 'cpu_dev' not described in 'qcom_cpufreq_update_opp'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:118 Excess function parameter 'policy' description in 'qcom_cpufreq_update_opp'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

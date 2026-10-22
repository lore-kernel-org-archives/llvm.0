Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668960;
	b=qnYqGaMVmP2j6xkuseYHG6w1YwkhebnKLHwBNZKj0XKJACCMdQMlETiJDAZDh0gKKT5A
	 iVD1J3xjXKRRzsE62ORBN4SchxjB353s0aEgIJcS9sSVDjj4QU6AV6HU285+GDq/LoVRc
	 Xrg+9Va4e+sUFblJ8SjLupc1RSnQiFmPbWtQSxNrNja/1SVW4dWSFIlI71YdLXYz89Num
	 PE5Q9/7YHTl+FiHNQoHKuE3k3i5eR/nTdVP3g9UZdp58kPw7v4QWH3MbCTjBySykeOZE+
	 ndNWTq+4vL5zzNKPGi/Q//BaXePN5wldjqK6ps5afMaR3yBK8gvNVj+MM4fFt5YFMmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668960;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=l/uJoZh97KNA8KS5XGZcsBsVOhzLQylaAXwI7FTR4Uw=;
	b=eBnIGhFoQ54uDIhedHmsd11v//rBhYtfZCM7HZopS7KCaEkmc26+KhXZDlLusCVhtTfD
	 xSofKSiJZJxh84nnOeRxb8NY7g/evbLudJj2WCPE1iyCx0PYJHLnWP33r4y2hiMvfwPx7
	 /CDgIbsajyAJw2yfu6sVodREEbwMXYkrEVXeFEcBR2gG3c/jyCrM2XyWKrEAUqzBWDSkr
	 xCNe+Ouuz23ZW6UHkp9OtDuGiJvTgvrrhkPqi76s5pOl0Ul70Q/utCVgWQxa4Q/YEmtyT
	 QnmkaLe3xK0QyG2UIAJ6f7E7MufYzXW3USNr3UhnZiSKYFdkM7XiQ5goKGnXPzLkCTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VMOIRzvW;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D907606A319;
	Thu, 22 Oct 2026 11:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D907606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VMOIRzvW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792668959; x=1824204959;
  h=date:from:to:cc:subject:message-id;
  bh=HMFusN3w/Rdfs2e+wd700w7KcXXZlTUF1n0txwbvpLE=;
  b=VMOIRzvWo0cCddLqGxnvcIA19JS5N/rQSjqUa3RAtaX56zfThzc1kuSM
   xaQz484X9J1Si5AITq5HoYBkSP8AyY5rJ0vwz4/fdlelok7BsfEMprZ90
   Q/TDms69m7c7Mruni4x/CIzz+zZYzWqf+oB9uzbQTKmkzEf4VFHabCCi4
   joI+dlNuVb4bER7v5xRlpcdjgGfxNmHbqPzQCNhsl6JrumxQrCI9ysBGw
   tPv08XXOz2OwgZIPrVc+Pkh5eKCHUNAADU1JfQ2hkgpPlvnGZKxj/Sa6/
   GAZUiJePNDkdsrzmlLr0ZSuwBtujWUJC+FXywB9DnhilAZoTiwo8K62Ua
   g==;
X-CSE-ConnectionGUID: PYfHm2/zQTW28CoGmn0OAg==
X-CSE-MsgGUID: 0WKMhftVQ1SEhcZlnKd/0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1447458"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1447458"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 04:35:59 -0700
X-CSE-ConnectionGUID: tACmicGGRbeGnN5HUbagXA==
X-CSE-MsgGUID: rwCWsMeuQdyNF+kA6kDYvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3219226"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Oct 2026 04:35:57 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJr5N-00000000QyE-3Z07;
	Thu, 22 Oct 2026 11:35:53 +0000
Date: Thu, 22 Oct 2026 19:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [lumag-msm:venus-8996-vmem 71/173] Warning:
 drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'reg_domain_state' not
 described in 'qcom_cpufreq_soc_data'
Message-ID: <202610221921.UCmDqhuq-lkp@intel.com>
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
commit: 4dc52647af19369bf871a1f23a66312351331ec8 [71/173] cpufreq: qcom-hw: Implement CPRh aware OSM programming
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261022/202610221921.UCmDqhuq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610221921.UCmDqhuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610221921.UCmDqhuq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'reg_domain_state' not described in 'qcom_cpufreq_soc_data'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'reg_dcvs_ctrl' not described in 'qcom_cpufreq_soc_data'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'reg_intr_clr' not described in 'qcom_cpufreq_soc_data'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'reg_current_vote' not described in 'qcom_cpufreq_soc_data'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'lut_max_entries' not described in 'qcom_cpufreq_soc_data'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'acd_data' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:416 function parameter 'cpu_dev' not described in 'qcom_cpufreq_update_opp'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:416 Excess function parameter 'policy' description in 'qcom_cpufreq_update_opp'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:587 function parameter 'index' not described in 'qcom_cpufreq_gen_params'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:1545 function parameter 'index' not described in 'qcom_cpufreq_hw_osm_setup'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'reg_domain_state' not described in 'qcom_cpufreq_soc_data'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'reg_dcvs_ctrl' not described in 'qcom_cpufreq_soc_data'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'reg_intr_clr' not described in 'qcom_cpufreq_soc_data'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'reg_current_vote' not described in 'qcom_cpufreq_soc_data'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'lut_max_entries' not described in 'qcom_cpufreq_soc_data'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:342 struct member 'acd_data' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:416 function parameter 'cpu_dev' not described in 'qcom_cpufreq_update_opp'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:416 Excess function parameter 'policy' description in 'qcom_cpufreq_update_opp'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:587 function parameter 'index' not described in 'qcom_cpufreq_gen_params'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:1545 function parameter 'index' not described in 'qcom_cpufreq_hw_osm_setup'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

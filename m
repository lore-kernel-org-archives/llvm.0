Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEC631985C;
	Mon, 22 Dec 2025 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766403578; cv=none; b=TKdjtJWdhaKo6ZUCM8s2ljzc3f067hTXSAz9mCbkVHMJT3aPc67An0M2JXk9XcM3qiJeNmGy+iTR69aLvbGA+gfmCjcYZjKGNRs3KLvZGo6uhfvEuvaMNVV2IRdMQCExDb0418iq6ATXeHwoumJKrwpPPRN6W7ysaCaXqatxyBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766403578; c=relaxed/simple;
	bh=3wkh0wVx0sZCAvgbYz7hM8Op7MWTm5A+cK/lwEF228o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H+0wkLpiDeIBbhwxhJrE+EPq0v5OEzh1uNirEhPETILpYFbFO/3Up6MZIw6wgj6jNuBVprIAqx++fOAjmditfa6kSdLg9m7JU927uHTAItTmUYtSdHT8Z+Lf9bDQaP4zdz8Jv4i+ZNccQbmbeolHrHTuSCicSzFNNgSx1NhsUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6hG4hIn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6hG4hIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766403576; x=1797939576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3wkh0wVx0sZCAvgbYz7hM8Op7MWTm5A+cK/lwEF228o=;
  b=F6hG4hInE0MKw6CYmlxSzp5oBL69rq85oe5oOdCIo4zWZc8Dc0PXYiAM
   e1bXpCT9YxuY9MQltmuZgsKUefwJo7yR39LWq4VuXSlDoxhbb8knOshj7
   FoZ8P+n1Atb9eoYqx/QWZfJypWswKlIMXoYqjum1nxAvHQk4ax6Av8KHu
   rTG1+O8nEAUl4t2iLawGyhZFXtHSjDZufuBvqWhUKpxW7c3NOV39tkt2o
   qYKZwOO+z+ZMJvnputh3IG4F8TmbdBvl6AOQ0BjXmZ5ReFgvlCxgBscp1
   2LNIvFsm03/+J7EODUhMx9EA3CXEdvWMNiZyK4H3wZDtuha4Igt+q0JuD
   w==;
X-CSE-ConnectionGUID: /O59pfowR0uoOAgA5wr59Q==
X-CSE-MsgGUID: 4+3v+a1pT++cQgC1Mh/Xhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="70833225"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="70833225"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 03:39:35 -0800
X-CSE-ConnectionGUID: OX3zdXZWT8CwMd3D73kpFg==
X-CSE-MsgGUID: iLm57nztRrO1E5Rfxic6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199145032"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 03:39:34 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXeG4-000000000Sv-47Yi;
	Mon, 22 Dec 2025 11:39:26 +0000
Date: Mon, 22 Dec 2025 19:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: 
 =?us-ascii?Q?[broonie-ci:v2=5F20251219=5Fkrzysztof=5Fkozlowski=5Fasoc?=
 =?us-ascii?Q?=5Fqcom=5Fconstify=5Ffew=5Fthings=5Fin=5Faudioreach=5Fand=5F?=
 =?us-ascii?Q?topology?= 19/43] ld.lld: error: undefined symbol: __udivdi3
Message-ID: <202512221955.uPWIRmmq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20251219_krzysztof_kozlowski_asoc_qcom_constify_few_things_in_audioreach_and_topology
head:   4ab48cc63e15cb619d641d1edf9a15a0a98875b2
commit: da1682d5e8b53a51072552844c551b1b784e52c2 [19/43] ASoC: rt1320: support calibration and temperature/r0 loading
config: i386-buildonly-randconfig-004-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221955.uPWIRmmq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221955.uPWIRmmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221955.uPWIRmmq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __udivdi3
   >>> referenced by rt1320-sdw.c:1070 (sound/soc/codecs/rt1320-sdw.c:1070)
   >>>               sound/soc/codecs/rt1320-sdw.o:(rt1320_dspfw_load_code) in archive vmlinux.a
   >>> referenced by rt1320-sdw.c:1071 (sound/soc/codecs/rt1320-sdw.c:1071)
   >>>               sound/soc/codecs/rt1320-sdw.o:(rt1320_dspfw_load_code) in archive vmlinux.a
   >>> referenced by rt1320-sdw.c:1098 (sound/soc/codecs/rt1320-sdw.c:1098)
   >>>               sound/soc/codecs/rt1320-sdw.o:(rt1320_r0_cali_put) in archive vmlinux.a
   >>> referenced 3 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

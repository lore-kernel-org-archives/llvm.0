Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA701F2BA4;
	Wed, 22 Oct 2025 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761136617; cv=none; b=U7Pygd9X3TMsVGRPk0utolUCQReXDT3pXoNDOtj5sj9IkOvBOeXHxHwukd6TsP9LzNGqOGfxIdtU0Klqi+NaUYvwMdiKSB2cfhJNL9HqXDs1ibOJhudifJ0g0wDQeLFFd5Gb7yakhaqKRojI8wyygBPOXTRxph5THK/APXPysKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761136617; c=relaxed/simple;
	bh=519d0VeYen3U872nHK3UtETEouG+0WfQUT+bzdECclI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqJPr//LdKHiEBluXwcO0ksqIrGzYxmLQsfj9L+EgdehJKyr2Bo9umBc80hXPz7a7u5qvFBeyxbKVtxYKXHD/RbnwkQHOO6hv9XW6NFD8pC4D27PLl2LmSVI3riiL21c55Vh9juvpQxqn2OxpN6bFsLRQsVFS+Zaem2UUTBjeU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mS1KI9z7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mS1KI9z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761136616; x=1792672616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=519d0VeYen3U872nHK3UtETEouG+0WfQUT+bzdECclI=;
  b=mS1KI9z7iWIwZMrLmJMBp3fTe9H95fmtf7uluYiTjsQ3Fa2JSB3RFrgP
   0f1tC8mVpW8PUiNLgZqwQPdljEz2COIE1+4riEwc4k/VVpHIT5SmRq5eh
   D/p619DFik4S3RYZoKja1J5TYwnB8ERgijn9IFZwbxqFGcPH9Lt1ri1Au
   FL1lJJNKAlXYnWSj8q7b/9BJsoLV4n3ZPxhQ0Fu7zArJYAmwW6QUd9SQJ
   POlSFlGYXhpFdhGCht0FB3Q1tkyzvkNbwuk2HAjARYumB5ZTN9eQcTTnb
   Vl2B5GBspgkMDQUehau/Ky73jiEeAkOnnoG0OMewscola5tSalkdR4OeF
   g==;
X-CSE-ConnectionGUID: O9uKWjxEQV+tLws9/HnDHA==
X-CSE-MsgGUID: ITzI6J38QX+pHsool6H2ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63189296"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="63189296"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 05:36:55 -0700
X-CSE-ConnectionGUID: O2hLd3INQPOD774tkoyccg==
X-CSE-MsgGUID: MLP6/TwuRmqmdl5S69L/3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="189138728"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Oct 2025 05:36:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBY58-000CMN-0Z;
	Wed, 22 Oct 2025 12:36:47 +0000
Date: Wed, 22 Oct 2025 20:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	David Collins <david.collins@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] regulator: qcom-rpmh: Add support to read
 regulator settings
Message-ID: <202510222018.4wv8ONuO-lkp@intel.com>
References: <20251022-add-rpmh-read-support-v2-3-5c7a8e4df601@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-add-rpmh-read-support-v2-3-5c7a8e4df601@oss.qualcomm.com>

Hi Kamal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamal-Wadhwa/regulator-rpmh-regulator-Fix-PMIC5-BOB-bypass-mode-handling/20251022-051042
base:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
patch link:    https://lore.kernel.org/r/20251022-add-rpmh-read-support-v2-3-5c7a8e4df601%40oss.qualcomm.com
patch subject: [PATCH v2 3/4] regulator: qcom-rpmh: Add support to read regulator settings
config: i386-buildonly-randconfig-002-20251022 (https://download.01.org/0day-ci/archive/20251022/202510222018.4wv8ONuO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510222018.4wv8ONuO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510222018.4wv8ONuO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/regulator/qcom-rpmh-regulator.c:177 struct member 'status' not described in 'rpmh_vreg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CDE289379;
	Thu, 31 Jul 2025 23:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754005428; cv=none; b=AZKILGjfeNjeFI7m46gbnUEt4x+7BIrkYZYxFWcLRN7h8o1xQ+jczyEu5aQ5uX5yI4V0SEX1sipsYE9tno/n17CeSqDEIkyP5rkaHZmCuQdOqIH0XyUE/7nD9TDeMF5Tj46pbjlqUhth098NgD4wtcRrTwcXsAzc4UzbdotBqRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754005428; c=relaxed/simple;
	bh=Xv1KFdQFCO2JRvkiFVq3Wh7f6y9Lms7vpIKcr4PRD2M=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jtMbymvKTZ80PRyZHxjzmgWBvAeCHevv2UoE8b0gUWOo6hCXQmZYQVB83Hv4xkgoykzAGZzBOUpY0VgnRlX16yOKOPvSIbC8z6uuA5dfurV1sOL1betnOrfrlX2PXrKwb9eaRxpq3fwg4iVsQJk6LhIPymaoSs3AreQpf3oTvHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsRZGnZX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsRZGnZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754005427; x=1785541427;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Xv1KFdQFCO2JRvkiFVq3Wh7f6y9Lms7vpIKcr4PRD2M=;
  b=SsRZGnZXvgqwdyPeSm0eS9SiOWfuKbSdjxWJM2soN1B207ZKO9F4qhbA
   sTjYqzsxZP28ymUsoAMzIR/gxVYgw+iVrmpDu3BVQ1S/eh/lVyV1fU6+3
   yRa9AaDPOv4gBkoBEfI9okC0SkQrySCKWWLrWBlQfF313xeuistCQVXpC
   m4WX6m7KVGw999MTRFpV4OG/CPi/3wSptlkKFAT+caEeQEsQuNic8JvC7
   jyu9biJVV6i5S3iydZf49/XQ1dVwYVJVAmxsDVxfTwwh3vzAQNwT0xHSu
   eLtaXAx2Pgs15ac9s0OiBBQaldQerNahN5l1PKLaHJ6HOUZKt6oxOVL5P
   g==;
X-CSE-ConnectionGUID: Teoy+WaIT7iuiNXs0LVotQ==
X-CSE-MsgGUID: FllO4icLTtysUTeuvuqnPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56425923"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56425923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 16:43:46 -0700
X-CSE-ConnectionGUID: 6NyZrWJRTumZAJdEj3r27g==
X-CSE-MsgGUID: qts96TBuS4CUT8swHozwGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="194375274"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Jul 2025 16:43:46 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhcw3-0004DI-1u;
	Thu, 31 Jul 2025 23:43:43 +0000
Date: Fri, 1 Aug 2025 07:42:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android15-6.6-2025-03 3/3] clang: error: unknown
 argument: '-enable-fs-discriminator=true'
Message-ID: <202508010749.CE1NTjTR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-03
head:   bab34747f124e034c713a1627b6edfa834f0a7f7
commit: a9ca1e90a4c53304bcc02a4969f353b17f365b31 [3/3] ANDROID: Fix adding cflags for CONFIG_AUTOFDO_CLANG
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250801/202508010749.CE1NTjTR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010749.CE1NTjTR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010749.CE1NTjTR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unknown argument: '-enable-fs-discriminator=true'
>> clang: error: unknown argument: '-improved-fs-discriminator=true'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

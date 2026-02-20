Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1240434E769;
	Fri, 20 Feb 2026 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771605745; cv=none; b=BcSd+LrK+0v4nGmT9zifywWLAwfQoBoT47/qfvwqruCFokn1wqA0cvlG2PIG+pmZZEIxd0EeaFpaY4kqGAn78hMocvsUaVgNHJn4A0tvvPtENcirNmZL8GfDBDaoOsvcv5Tv1Cy96D7M0P5AacToYL9SzEPj89Vp6OhzK5pRrzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771605745; c=relaxed/simple;
	bh=uhw9f2v4TzeYOK6lIfw566BrSUStdeKOQ8jLGXiMlQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2NHNS1McWpl20ZGDuaRwHTIIWSY9JJLmE1xKSYxO/WGQZN12zS1B2/UIXgczz5R6vvCwD/BG1shWMGn3AUANy6+ROv1UvE2gSTJUw0oZIT/b0j3K3v8HQHR1u5w/kvfX/zWZYW2wZa5AiKjUjuxdUQwEj5RneiWHclOWYH9mtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ey/NARgu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ey/NARgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771605743; x=1803141743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uhw9f2v4TzeYOK6lIfw566BrSUStdeKOQ8jLGXiMlQQ=;
  b=Ey/NARgukKHssSVRBlS3FJgwtlBN1YZtkwS3bdHddFsKT6j3rMOfp6fa
   zc1Ya8N60lpAWfkgJKFSwycmpsUmH8JAnZKawsGnT7bS8jI8BJ8Fylctt
   b9D2Qgeet67KjpGKSa/jGSBFA6a9rHTqHbMtT4Ef1uKmCxWKK9C06QwqN
   JmuCYGOfluKYf2zsECHnVk5WsI6EPYD2lpYf9t++wXIRTuUMpKxYZd0XL
   xmzpgl90Zh3cgXPVyVHkdXwVJGdinB1ddSdpkY+uQFN6Il0sNgMuN7zKH
   ETl5DJz9fpn++nXbag88GMfnqllccnEBt7jeTnvvFcbVIC01lcAH3iAfC
   g==;
X-CSE-ConnectionGUID: Sm5G6dq0R+2TRIQ1acIE8A==
X-CSE-MsgGUID: YYs6UZgXQ0eJqvMPV4jeIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90109897"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="90109897"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 08:42:22 -0800
X-CSE-ConnectionGUID: 2pz0DMUBRza0FpYpnC7swQ==
X-CSE-MsgGUID: O23Wbkv8RIW/xEIcqjHabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="214003254"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Feb 2026 08:42:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtTa5-000000014H6-1kmV;
	Fri, 20 Feb 2026 16:42:17 +0000
Date: Sat, 21 Feb 2026 00:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	m.wieczorretman@pm.me,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] x86/process: Add a debug interface to change LAM
 tag width
Message-ID: <202602210040.C4PVoS0u-lkp@intel.com>
References: <5ed38af72848015f3417c462e624e52891dc14ed.1771589807.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ed38af72848015f3417c462e624e52891dc14ed.1771589807.git.m.wieczorretman@pm.me>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on peterz-queue/sched/core akpm-mm/mm-everything linus/master v6.19 next-20260220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/x86-process-Shorten-the-default-LAM-tag-width/20260220-205155
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/5ed38af72848015f3417c462e624e52891dc14ed.1771589807.git.m.wieczorretman%40pm.me
patch subject: [PATCH v1 2/4] x86/process: Add a debug interface to change LAM tag width
config: x86_64-buildonly-randconfig-001-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210040.C4PVoS0u-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210040.C4PVoS0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210040.C4PVoS0u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/process_64.c:812:8: warning: 'sprintf' will always overflow; destination buffer has size 2, but format string expands to at least 3 [-Wformat-overflow]
     812 |         len = sprintf(buf, "%ld\n", lam_available_bits);
         |               ^
>> arch/x86/kernel/process_64.c:827:6: warning: unused variable 'ceiling' [-Wunused-variable]
     827 |         int ceiling;
         |             ^~~~~~~
   2 warnings generated.


vim +/ceiling +827 arch/x86/kernel/process_64.c

   815	
   816	/*
   817	 * Writing a number to this file changes the used lam tag width. Valid values
   818	 * are 4 bit tag width and 6 bit tag width - the second, non-default one is
   819	 * meant mostly for debug and shall be deprecated in the future.
   820	 */
   821	static ssize_t lam_bits_write_file(struct file *file,
   822					   const char __user *user_buf, size_t count,
   823					   loff_t *ppos)
   824	{
   825		char buf[32];
   826		ssize_t len;
 > 827		int ceiling;
   828		u8 bits;
   829	
   830		len = min(count, sizeof(buf) - 1);
   831		if (copy_from_user(buf, user_buf, len))
   832			return -EFAULT;
   833	
   834		buf[len] = '\0';
   835		if (kstrtou8(buf, 0, &bits))
   836			return -EINVAL;
   837	
   838		switch (bits) {
   839		case LAM_DEFAULT_BITS:
   840		case LAM_MAX_BITS:
   841			lam_available_bits = bits;
   842			return count;
   843		default:
   844			return -EINVAL;
   845		}
   846	}
   847	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

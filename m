Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F32545106A;
	Wed, 21 Jan 2026 23:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039844; cv=none; b=mhiW3mU0HQ8Fhuq4iMS9okx1w9umSIUigKbZgRnVSyrgsq+3wGlPUsQZyx+kD48EzNV5PSC8VlYHsww1IiwvleF7e1zD9YJ0ggLQl1MNg8ASbmN+cK2HO/jNJtsUGzIeZRB4KS/bE4Sa1Eiq2qLZGBJVsa2gSjjQn+7fXoc/hfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039844; c=relaxed/simple;
	bh=XtJqA4lxMnUiNq/ANj35j8PXYExbaJ3dQmGTH9bflHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0tdnCx3LoOJK6cWuX8TBcyRLJTtvRwD0GjPOclPxKlPhcUnkXzuw8ykeLKLP/qdrcg44/2FiYJGIHODh+ezmg1aF5bslvhekJ1p7FxUoSG6u2sLi5U7ptZI3qt6HhWpEHr5f+ueMpIHN08OvkVBL7FLwg0pt5RzbxgxLzTIdfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAGb2Hp9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAGb2Hp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769039842; x=1800575842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XtJqA4lxMnUiNq/ANj35j8PXYExbaJ3dQmGTH9bflHY=;
  b=CAGb2Hp99YWN0+6ELAevcUAyMGg9IgFO/QzlJ5fjNirp4QQdxz8CDKPm
   tkvbDTk8UPIH3Toa0goabzbLhUakR812pkJ4YusvLIzkmj38uULLqwzka
   pLPtbPmpZqItLJJeMLuQ9AQ9m0eaxdDCHjd+bY9ClcyDdo1Z5KJHp6YGW
   ogZMXHgCQHSwpa70OnlNDC8dv70Q73ZU1Tn7SWrtxvucMPzPjocM1G6AD
   LmvyEF4zMxk5o6Vnfm6RqL7eqOUv2TOM+i7SuAuuYQOFnb6wVe8vO/jwm
   vhkXdiqmPUP2qkcN7iqGV2+PMSDynietTnZi8J4edlfyE319BQGgS5amA
   w==;
X-CSE-ConnectionGUID: c8ZWKz5xSIOAUHponJxRaQ==
X-CSE-MsgGUID: F3gpeqj3TJmRU0ynaa9nxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57839347"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="57839347"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 15:57:21 -0800
X-CSE-ConnectionGUID: 5PPI9BPBQSqybu2JTGeOrw==
X-CSE-MsgGUID: eTK+GWkWTf6OkFRM3qXpYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="211024389"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2026 15:57:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vii4b-00000000SB7-3rIq;
	Wed, 21 Jan 2026 23:57:17 +0000
Date: Thu, 22 Jan 2026 07:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [i915-rt v5 20/21] PREEMPT_RT injection
Message-ID: <202601220757.XPYUi6Wb-lkp@intel.com>
References: <20260121135318.651622-21-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121135318.651622-21-dev@lankhorst.se>

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20260121]
[cannot apply to drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20260121-223353
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260121135318.651622-21-dev%40lankhorst.se
patch subject: [i915-rt v5 20/21] PREEMPT_RT injection
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260122/202601220757.XPYUi6Wb-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220757.XPYUi6Wb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220757.XPYUi6Wb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/tsm-core.c:16:22: warning: unused variable 'tsm_rwsem' [-Wunused-variable]
   static DECLARE_RWSEM(tsm_rwsem);
                        ^
   1 warning generated.


vim +/tsm_rwsem +16 drivers/virt/coco/tsm-core.c

603c646f001008e Dan Williams 2025-10-31  14  
603c646f001008e Dan Williams 2025-10-31  15  static struct class *tsm_class;
603c646f001008e Dan Williams 2025-10-31 @16  static DECLARE_RWSEM(tsm_rwsem);
603c646f001008e Dan Williams 2025-10-31  17  static DEFINE_IDA(tsm_ida);
603c646f001008e Dan Williams 2025-10-31  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

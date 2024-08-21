Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB13166F00;
	Wed, 21 Aug 2024 05:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724217852; cv=none; b=Gbocu+jdL5653S1flNPwdf/A0rx21CAQkdgnL1Uuy9Zj0M+4CL98lzGT2I7vNEXUu5W3QgJCPhPLaNR+r4E/wZbETd9A16iX2QnqsMZs4ydBI3J9EjqDJdbGHPd3D2wwEVLKO+YR87fDV0KSyBPK589p8Ah/M4fqWoSUvOUQGTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724217852; c=relaxed/simple;
	bh=8mRjRdfIeFDUtIGxoYx7QuE4yCRMP+FLEnYMkkl93uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lk4yvUf/vbtShsCd5jLlMDLm92DefpNO+MfED4vI9W0RH4mauiir1RoCvXC2Q99kSRlsuEeH0vS+VhmPnoIhd1vnk3omUHIiBV+4iZrHJVGurynk8U9RmmofHEYQpwY9oIF/YxlSRRgMK4JLUjU8iyFE982ed0jAlCgRNHGJDCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKjRBo+S; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKjRBo+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724217850; x=1755753850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8mRjRdfIeFDUtIGxoYx7QuE4yCRMP+FLEnYMkkl93uA=;
  b=MKjRBo+SajVoWFtV5E3RhrvsBDOlntjQ4yesTHIef+tkAaidwOZ75zFB
   tSQqETiX+Sxydd2G3+r17rMCRTZQFZ+P7GSzNYnAauB3RB6PcwhhAuET/
   75trpDYJxI07U8CTZQ5eqjjAdNO5GmLrvQVNcQBNhOMFSknWvQVU53fgU
   KaLQN67H/rmiKfLwFhkEC62199MHQKfN/iAiP1DLP4CeEh92R2sXUiCXT
   ecILNjbkdppvLbp0Hdnf091XqjfANmLVeasuynzWw2ccBhp0iT+FdcLfQ
   0DvaY1z3bOYpDc1cwr6xILfk+MVFFi9FEpmbJT/8Uc4L1UvNzOJQWtDlr
   Q==;
X-CSE-ConnectionGUID: 0kmJtamdTkuu7CsZj88n/g==
X-CSE-MsgGUID: r63aNFt+SciGye3kL+bq4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22689752"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22689752"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 22:24:10 -0700
X-CSE-ConnectionGUID: zKL4QYSSSlGrbCexMeYsaA==
X-CSE-MsgGUID: 9Se6h219R/+zc4EOJ04Mvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="60686551"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Aug 2024 22:24:09 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgdpF-000Ava-2t;
	Wed, 21 Aug 2024 05:24:05 +0000
Date: Wed, 21 Aug 2024 13:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/9] Introduce atomic_dec_and_wake_up_var().
Message-ID: <202408211354.SHlpNZbs-lkp@intel.com>
References: <20240819053605.11706-3-neilb@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819053605.11706-3-neilb@suse.de>

Hi NeilBrown,

kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on gfs2/for-next device-mapper-dm/for-next linus/master v6.11-rc4 next-20240820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/i915-remove-wake_up-on-I915_RESET_MODESET/20240819-134414
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20240819053605.11706-3-neilb%40suse.de
patch subject: [PATCH 2/9] Introduce atomic_dec_and_wake_up_var().
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240821/202408211354.SHlpNZbs-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211354.SHlpNZbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211354.SHlpNZbs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_request.c:2277:
>> drivers/gpu/drm/i915/selftests/i915_request.c:1533:9: error: call to undeclared function 'atomic_dec_and_wakeup_var'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1533 |         return atomic_dec_and_wakeup_var(&i915->selftest.counter);
         |                ^
   drivers/gpu/drm/i915/selftests/i915_request.c:1533:9: note: did you mean 'atomic_dec_and_wake_up_var'?
   include/linux/wait_bit.h:338:20: note: 'atomic_dec_and_wake_up_var' declared here
     338 | static inline bool atomic_dec_and_wake_up_var(atomic_t *var)
         |                    ^
   1 error generated.


vim +/atomic_dec_and_wakeup_var +1533 drivers/gpu/drm/i915/selftests/i915_request.c

  1530	
  1531	static bool wake_all(struct drm_i915_private *i915)
  1532	{
> 1533		return atomic_dec_and_wakeup_var(&i915->selftest.counter);
  1534	}
  1535	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

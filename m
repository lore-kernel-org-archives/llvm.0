Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E367244664;
	Sat, 20 Dec 2025 15:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766245462; cv=none; b=FSoJrXIlKW3twYhQbTKRMGpbkPBB0bBbi94m0upFEBm7OkB1ZS8zNoqSLsdMTwkkQUOY/oBb9SwxvEjFWxZJPj3TqfS3K455rt/86SbG+ckMJzwx/rmaOkRMWSea7cIC7zr1hQZJR87wDkhdR5gM3JaiK2Qj9wN35OoV0KVMQx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766245462; c=relaxed/simple;
	bh=cyQKvVQUsfUFBpx8YaykRKpT0aTBA25NUWADHIQEPPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrHk278cBVr75Vssnmvw7fdfqOIqWtjEO8m0P++d1c4XGUz27BK9lbbiDak5ipcL35NEijyPcV2u89MhELYNJPRe4EWYee5eqYoMiEAC3idt+pktAQXR/k2C0IVmnwRkoLZBTvR9Vb9ckL3cDGMLwZBd//YkusGw7+Q74eLxSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtJSaa6l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtJSaa6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766245461; x=1797781461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cyQKvVQUsfUFBpx8YaykRKpT0aTBA25NUWADHIQEPPY=;
  b=mtJSaa6l2YOlBX/8L5at0Qan3vTLF0t01p7gZXmLYXOzk7TZxsq5x8g5
   HhjHNBy3Q0DSaUp9qe0mMCA+B3f6UMmBgSrJXB0Scooe/NizRTt3NAvJO
   q1U0z6MeGTknLzdwMkvoGB3Avi2Aj+aElorib9yzaLltky1D6JUBY5nz0
   5lm5LrqJxVmCbWbWeueYs8HsUlZDkAdcrMT0dPI1NwRMneP6CoS/0Z8GK
   hdzg9iR67+bmQA+6Ri56v6Wx0Jv0k4TR/0RxhVUqEISTcTjF1jUWPl5CV
   ZjQNpbE+CLmtVe/qqCEqngPsLiTgRhdrPEVKX8qzhMPPr7SquujkoyU1e
   Q==;
X-CSE-ConnectionGUID: F7YVTXG2SP+0i1VNkbextg==
X-CSE-MsgGUID: 6AX9p4zmQLOWq8CzLljIJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="90838733"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="90838733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:44:20 -0800
X-CSE-ConnectionGUID: FbqEfdviTDS9pin2HYdybQ==
X-CSE-MsgGUID: IQ7EZ4jvTJ+DSbSByasnRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="222597992"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2025 07:44:18 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWz7v-000000004m5-2bfi;
	Sat, 20 Dec 2025 15:44:15 +0000
Date: Sat, 20 Dec 2025 23:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [i915-rt v4 19/20] drm/i915/display: Do not take uncore lock in
 i915_get_vblank_counter
Message-ID: <202512202303.UVIG27Cq-lkp@intel.com>
References: <20251218163408.97508-20-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218163408.97508-20-dev@lankhorst.se>

Hi Maarten,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-i915/for-linux-next]
[also build test ERROR on drm-i915/for-linux-next-fixes drm-xe/drm-xe-next drm-tip/drm-tip linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20251219-044020
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20251218163408.97508-20-dev%40lankhorst.se
patch subject: [i915-rt v4 19/20] drm/i915/display: Do not take uncore lock in i915_get_vblank_counter
config: i386-defconfig (https://download.01.org/0day-ci/archive/20251220/202512202303.UVIG27Cq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202303.UVIG27Cq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202303.UVIG27Cq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_driver.c:75:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_context.h:9:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:19:
   In file included from drivers/gpu/drm/i915/gt/intel_context_types.h:17:
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:26:
>> drivers/gpu/drm/i915/intel_uncore.h:455:11: error: expected ';' at end of declaration
     455 |         u32 upper lower, old_upper, loop = 0;
         |                  ^
         |                  ;
>> drivers/gpu/drm/i915/intel_uncore.h:456:31: error: use of undeclared identifier 'uncoree'
     456 |         upper = intel_uncore_read_fw(uncoree, upper_reg);
         |                                      ^
>> drivers/gpu/drm/i915/intel_uncore.h:456:40: error: use of undeclared identifier 'upper_reg'
     456 |         upper = intel_uncore_read_fw(uncoree, upper_reg);
         |                                               ^
>> drivers/gpu/drm/i915/intel_uncore.h:458:3: error: use of undeclared identifier 'old_upper'
     458 |                 old_upper = upper;
         |                 ^
>> drivers/gpu/drm/i915/intel_uncore.h:459:3: error: use of undeclared identifier 'lower'
     459 |                 lower = intel_uncore_read_fw(uncore, lower_reg);
         |                 ^
>> drivers/gpu/drm/i915/intel_uncore.h:459:40: error: use of undeclared identifier 'lower_reg'
     459 |                 lower = intel_uncore_read_fw(uncore, lower_reg);
         |                                                      ^
   drivers/gpu/drm/i915/intel_uncore.h:460:40: error: use of undeclared identifier 'upper_reg'
     460 |                 upper = intel_uncore_read_fw(uncore, upper_reg);
         |                                                      ^
   drivers/gpu/drm/i915/intel_uncore.h:461:20: error: use of undeclared identifier 'old_upper'
     461 |         } while (upper != old_upper && loop++ < 2);
         |                           ^
>> drivers/gpu/drm/i915/intel_uncore.h:461:33: error: use of undeclared identifier 'loop'
     461 |         } while (upper != old_upper && loop++ < 2);
         |                                        ^
   drivers/gpu/drm/i915/intel_uncore.h:463:28: error: use of undeclared identifier 'lower'
     463 |         return (u64)upper << 32 | lower;
         |                                   ^
>> drivers/gpu/drm/i915/intel_uncore.h:483:44: error: too many arguments to function call, expected single argument 'uncore', have 3 arguments
     483 |         ret = intel_uncore_read64_2x32_fw(uncore, lower_reg, upper_reg);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_uncore.h:453:1: note: 'intel_uncore_read64_2x32_fw' declared here
     453 | intel_uncore_read64_2x32_fw(struct intel_uncore *uncore)
         | ^                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   11 errors generated.
--
   In file included from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:14:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_context_types.h:19:
   In file included from drivers/gpu/drm/i915/gt/intel_context_types.h:17:
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:26:
>> drivers/gpu/drm/i915/intel_uncore.h:455:11: error: expected ';' at end of declaration
     455 |         u32 upper lower, old_upper, loop = 0;
         |                  ^
         |                  ;
>> drivers/gpu/drm/i915/intel_uncore.h:456:31: error: use of undeclared identifier 'uncoree'
     456 |         upper = intel_uncore_read_fw(uncoree, upper_reg);
         |                                      ^
>> drivers/gpu/drm/i915/intel_uncore.h:456:40: error: use of undeclared identifier 'upper_reg'
     456 |         upper = intel_uncore_read_fw(uncoree, upper_reg);
         |                                               ^
>> drivers/gpu/drm/i915/intel_uncore.h:458:3: error: use of undeclared identifier 'old_upper'
     458 |                 old_upper = upper;
         |                 ^
>> drivers/gpu/drm/i915/intel_uncore.h:459:3: error: use of undeclared identifier 'lower'
     459 |                 lower = intel_uncore_read_fw(uncore, lower_reg);
         |                 ^
>> drivers/gpu/drm/i915/intel_uncore.h:459:40: error: use of undeclared identifier 'lower_reg'
     459 |                 lower = intel_uncore_read_fw(uncore, lower_reg);
         |                                                      ^
   drivers/gpu/drm/i915/intel_uncore.h:460:40: error: use of undeclared identifier 'upper_reg'
     460 |                 upper = intel_uncore_read_fw(uncore, upper_reg);
         |                                                      ^
   drivers/gpu/drm/i915/intel_uncore.h:461:20: error: use of undeclared identifier 'old_upper'
     461 |         } while (upper != old_upper && loop++ < 2);
         |                           ^
>> drivers/gpu/drm/i915/intel_uncore.h:461:33: error: use of undeclared identifier 'loop'
     461 |         } while (upper != old_upper && loop++ < 2);
         |                                        ^
   drivers/gpu/drm/i915/intel_uncore.h:463:28: error: use of undeclared identifier 'lower'
     463 |         return (u64)upper << 32 | lower;
         |                                   ^
>> drivers/gpu/drm/i915/intel_uncore.h:483:44: error: too many arguments to function call, expected single argument 'uncore', have 3 arguments
     483 |         ret = intel_uncore_read64_2x32_fw(uncore, lower_reg, upper_reg);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_uncore.h:453:1: note: 'intel_uncore_read64_2x32_fw' declared here
     453 | intel_uncore_read64_2x32_fw(struct intel_uncore *uncore)
         | ^                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_shmem.c:515:34: warning: result of comparison of constant 17592186040320 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     515 |         if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
         |                                    ~~~~ ^ ~~~~~~~~~~~~~~~~
   1 warning and 11 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/hsw_ips.c:13:
   In file included from drivers/gpu/drm/i915/display/intel_de.h:12:
>> drivers/gpu/drm/i915/intel_uncore.h:455:11: error: expected ';' at end of declaration
     455 |         u32 upper lower, old_upper, loop = 0;
         |                  ^
         |                  ;
>> drivers/gpu/drm/i915/intel_uncore.h:456:31: error: use of undeclared identifier 'uncoree'
     456 |         upper = intel_uncore_read_fw(uncoree, upper_reg);
         |                                      ^
>> drivers/gpu/drm/i915/intel_uncore.h:456:40: error: use of undeclared identifier 'upper_reg'
     456 |         upper = intel_uncore_read_fw(uncoree, upper_reg);
         |                                               ^
>> drivers/gpu/drm/i915/intel_uncore.h:458:3: error: use of undeclared identifier 'old_upper'
     458 |                 old_upper = upper;
         |                 ^
>> drivers/gpu/drm/i915/intel_uncore.h:459:3: error: use of undeclared identifier 'lower'
     459 |                 lower = intel_uncore_read_fw(uncore, lower_reg);
         |                 ^
>> drivers/gpu/drm/i915/intel_uncore.h:459:40: error: use of undeclared identifier 'lower_reg'
     459 |                 lower = intel_uncore_read_fw(uncore, lower_reg);
         |                                                      ^
   drivers/gpu/drm/i915/intel_uncore.h:460:40: error: use of undeclared identifier 'upper_reg'
     460 |                 upper = intel_uncore_read_fw(uncore, upper_reg);
         |                                                      ^
   drivers/gpu/drm/i915/intel_uncore.h:461:20: error: use of undeclared identifier 'old_upper'
     461 |         } while (upper != old_upper && loop++ < 2);
         |                           ^
>> drivers/gpu/drm/i915/intel_uncore.h:461:33: error: use of undeclared identifier 'loop'
     461 |         } while (upper != old_upper && loop++ < 2);
         |                                        ^
   drivers/gpu/drm/i915/intel_uncore.h:463:28: error: use of undeclared identifier 'lower'
     463 |         return (u64)upper << 32 | lower;
         |                                   ^
>> drivers/gpu/drm/i915/intel_uncore.h:483:44: error: too many arguments to function call, expected single argument 'uncore', have 3 arguments
     483 |         ret = intel_uncore_read64_2x32_fw(uncore, lower_reg, upper_reg);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_uncore.h:453:1: note: 'intel_uncore_read64_2x32_fw' declared here
     453 | intel_uncore_read64_2x32_fw(struct intel_uncore *uncore)
         | ^                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/display/hsw_ips.c:13:
>> drivers/gpu/drm/i915/display/intel_de.h:71:9: error: too many arguments to function call, expected single argument 'uncore', have 3 arguments
      70 |         return intel_uncore_read64_2x32_fw(__to_uncore(display),
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~
      71 |                                            lower_reg, upper_reg);
         |                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_uncore.h:453:1: note: 'intel_uncore_read64_2x32_fw' declared here
     453 | intel_uncore_read64_2x32_fw(struct intel_uncore *uncore)
         | ^                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   12 errors generated.


vim +455 drivers/gpu/drm/i915/intel_uncore.h

   451	
   452	static inline u64
   453	intel_uncore_read64_2x32_fw(struct intel_uncore *uncore)
   454	{
 > 455		u32 upper lower, old_upper, loop = 0;
 > 456		upper = intel_uncore_read_fw(uncoree, upper_reg);
   457		do {
 > 458			old_upper = upper;
 > 459			lower = intel_uncore_read_fw(uncore, lower_reg);
   460			upper = intel_uncore_read_fw(uncore, upper_reg);
 > 461		} while (upper != old_upper && loop++ < 2);
   462	
   463		return (u64)upper << 32 | lower;
   464	}
   465	
   466	static inline u64
   467	intel_uncore_read64_2x32(struct intel_uncore *uncore,
   468				 i915_reg_t lower_reg, i915_reg_t upper_reg)
   469	{
   470		enum forcewake_domains fw_domains;
   471		unsigned long flags;
   472		u64 ret;
   473	
   474		fw_domains = intel_uncore_forcewake_for_reg(uncore, lower_reg,
   475							    FW_REG_READ);
   476	
   477		fw_domains |= intel_uncore_forcewake_for_reg(uncore, upper_reg,
   478							    FW_REG_READ);
   479	
   480		spin_lock_irqsave(&uncore->lock, flags);
   481		intel_uncore_forcewake_get__locked(uncore, fw_domains);
   482	
 > 483		ret = intel_uncore_read64_2x32_fw(uncore, lower_reg, upper_reg);
   484	
   485		intel_uncore_forcewake_put__locked(uncore, fw_domains);
   486		spin_unlock_irqrestore(&uncore->lock, flags);
   487	
   488		return ret;
   489	}
   490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

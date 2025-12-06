Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699D6C13B;
	Sat,  6 Dec 2025 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765042253; cv=none; b=LazTfST41Oq6D3CPPpwJD6MihaU3wOZ02zv4POEesFOO0n7nUPZAVPF43wTL4XdJWF7DZEO5f6fC7v/W4sdk6NwKVPYWk4lWZmaNoDqQ2Gv28oerEY67ErHQzuaRnt9FRlKr7zGcz0AB2i1GnFsSHT/SRF/3J7Gim1Y4fkSziVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765042253; c=relaxed/simple;
	bh=KWrxeDOwwj41iBJhalYfFy+HHh0hTCdnw4qgjnxOr9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyFe7EJsfSuuv3O/rG15RnSoZNYwh5A7hSteI39vuAHe05Ps1SAxepvPqqliejArvyJ/yTtb9cTRG4vOV3GcGyLLdBt4Q0UBGgmz30N6DUnuRz2CAoXF35vh3bGn4m5+oK7BcM92464QEXifbo8YpIxw4WjPUnaOxX3pu22EJro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/vkHNII; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/vkHNII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765042251; x=1796578251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KWrxeDOwwj41iBJhalYfFy+HHh0hTCdnw4qgjnxOr9g=;
  b=P/vkHNIIBeL1K7IGBDH4H/B2grfdYhknKys4Q93tFKmPhWZS8y5ChfGN
   DveLAojSle2EuJJ34wvoLseBhFAevuXjS6fAO61KOC7M38PG2r+HBFFIc
   HsN2DG4oT5ORl4dGXY0Mbx+vAvtUeUfcyiA+E9D8PFvJ5nwxUtxDVuc7g
   x2oj2YNL0ANE07pfn2PRHwl/HBkKdz9nRJZfyqfjsoj5jpqo1JrzQhcxh
   O2edE6tJAoX337xKsQCMCcnPFj9PIXL85DihPGyhUcq+x2TOYPOID9Jjb
   Dt8k+ISoA1kmdG5hbH8W9fz5QkTbLZo5Akinqs5Wa0+s24sbwIMAzkH1l
   w==;
X-CSE-ConnectionGUID: xjWQc8JXS2uY2Y2OdiywxA==
X-CSE-MsgGUID: Z8R2ffgoRo+gGFPqwdSFfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67086272"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="67086272"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 09:30:50 -0800
X-CSE-ConnectionGUID: ZaNEfTKCTueNvQhKd9lcgQ==
X-CSE-MsgGUID: JKU7PG9SSnyTMnswmKQmpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="194616259"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Dec 2025 09:30:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRw7L-00000000IbV-0463;
	Sat, 06 Dec 2025 17:30:47 +0000
Date: Sun, 7 Dec 2025 01:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <202512070100.XPSKmmIG-lkp@intel.com>
References: <20251205175237.242022-5-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205175237.242022-5-yury.norov@gmail.com>

Hi Yury,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-i915/for-linux-next]
[also build test ERROR on drm-i915/for-linux-next-fixes driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.18 next-20251205]
[cannot apply to mcgrof/modules-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov-NVIDIA/kernel-h-drop-STACK_MAGIC-macro/20251206-015505
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20251205175237.242022-5-yury.norov%40gmail.com
patch subject: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h to a dedicated header
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251207/202512070100.XPSKmmIG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070100.XPSKmmIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070100.XPSKmmIG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/purgatory/purgatory.c:18:
>> arch/x86/purgatory/../boot/string.h:11:7: error: expected identifier or '('
      11 | void *memmove(void *dst, const void *src, size_t len);
         |       ^
   include/linux/fortify-string.h:694:27: note: expanded from macro 'memmove'
     694 | #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
         |                           ^
   include/linux/fortify-string.h:626:42: note: expanded from macro '__fortify_memcpy_chk'
     626 |                              p_size_field, q_size_field, op) ({         \
         |                                                               ^
   In file included from arch/x86/purgatory/purgatory.c:18:
>> arch/x86/purgatory/../boot/string.h:11:7: error: expected ')'
   include/linux/fortify-string.h:694:27: note: expanded from macro 'memmove'
     694 | #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
         |                           ^
   include/linux/fortify-string.h:626:42: note: expanded from macro '__fortify_memcpy_chk'
     626 |                              p_size_field, q_size_field, op) ({         \
         |                                                               ^
   arch/x86/purgatory/../boot/string.h:11:7: note: to match this '('
   include/linux/fortify-string.h:694:27: note: expanded from macro 'memmove'
     694 | #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
         |                           ^
   include/linux/fortify-string.h:626:41: note: expanded from macro '__fortify_memcpy_chk'
     626 |                              p_size_field, q_size_field, op) ({         \
         |                                                              ^
   In file included from arch/x86/purgatory/purgatory.c:18:
   arch/x86/purgatory/../boot/string.h:23:15: error: expected identifier or '('
      23 | extern size_t strlen(const char *s);
         |               ^
   include/linux/fortify-string.h:258:2: note: expanded from macro 'strlen'
     258 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
         |         ^
   3 errors generated.


vim +11 arch/x86/purgatory/../boot/string.h

c041b5ad8640dd Vivek Goyal 2014-03-18   9  
c041b5ad8640dd Vivek Goyal 2014-03-18  10  void *memcpy(void *dst, const void *src, size_t len);
bc7aaf52f96367 Kees Cook   2021-11-19 @11  void *memmove(void *dst, const void *src, size_t len);
c041b5ad8640dd Vivek Goyal 2014-03-18  12  void *memset(void *dst, int c, size_t len);
fb4cac573ef6dc Vivek Goyal 2014-03-18  13  int memcmp(const void *s1, const void *s2, size_t len);
bc7aaf52f96367 Kees Cook   2021-11-19  14  int bcmp(const void *s1, const void *s2, size_t len);
c041b5ad8640dd Vivek Goyal 2014-03-18  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

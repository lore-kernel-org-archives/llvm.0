Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486D813D891;
	Fri, 16 Jan 2026 23:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768607131; cv=none; b=nFISclcQ4AqGdYXsbfoChrZyOyTF7wSrNAGP+4MrhlIC4a6Dnz/n1R0d7hbmXdu0Ts7175hh98/Q6KNDYxQqpTX17/m0OtyA6oFgkQFhreYSakNg2ydo7VXTjeYUJn0wCDorG7dfXBSRYBF8c1oIOke82KZTmcoZ7/yCumcMffE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768607131; c=relaxed/simple;
	bh=fqiB7HS69jQKKBCbobePPS232WicGP3QukquVXWYYGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=In+6n+JZamka2Jca/BfGmQ37vKrNAY86JOagcznVwSQoY0tmvKRuCvdhFo2iGP1ERy34hzcfUCWaMncN6xU1N1P1ar8ga8aZ44l+QNZTSJGvVp5A6oyKmt+S1VcAa8HfJ9b8QovWWV1JkJ6NY8zLOLL9kQ06oA157JPnUkuMydk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzfEC/G5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzfEC/G5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768607129; x=1800143129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fqiB7HS69jQKKBCbobePPS232WicGP3QukquVXWYYGY=;
  b=fzfEC/G5Jhd30LunEXyPDKa0uKMtyQUAW6indSeQq+DT4ON8+rB8xjqG
   CDW6RhmhjsY92XXhHFWj3e3QJ/jT0wLboTCNX+H/5AgqSEE0zkP3PFsSk
   U98q6M859FkKLsTXfZ7i7uIk916zsXxUoxHi6zF5egsMJgTx81Syp0SwJ
   V5XgQuEClGXDHz3sOsCnkY5oODIlUexKZ34MsWs+lf99q3cPMPL5G7fr8
   b6dsUCHK7FUUbSIcEGtv97fmYd6hTEeOa9Sqe+e/ud5ByJcYqI4N3oBsq
   QRL2GToT6SJuSZAxnVEUeVrX6ypCPtc/YeNSXqV8KDXcEvgWzkrGdL2Ne
   Q==;
X-CSE-ConnectionGUID: nUFWYmTMQYWiNrX/ChAAXA==
X-CSE-MsgGUID: CXwAIG5rQo+zxAleHWW6Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80563684"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="80563684"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 15:45:28 -0800
X-CSE-ConnectionGUID: kJKKiMwXQHyJKNMeN9HyBQ==
X-CSE-MsgGUID: PFyO0FQUQO+EJ28PwovR4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="209500904"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Jan 2026 15:45:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgtVM-00000000LMS-1CRb;
	Fri, 16 Jan 2026 23:45:24 +0000
Date: Sat, 17 Jan 2026 07:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@intel.com
Subject: Re: [PATCH 2/2] drm/{i915,xe}/dsb: move DSB buffer to parent
 interface
Message-ID: <202601170744.TtAKDBe8-lkp@intel.com>
References: <523081095c7da23ce03835687fe6c5cb4ed3c77f.1768575249.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <523081095c7da23ce03835687fe6c5cb4ed3c77f.1768575249.git.jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-i915/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20260116]
[cannot apply to drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-dsb-move-i915-specific-DSB-buffer-implementation-to-i915/20260116-225559
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/523081095c7da23ce03835687fe6c5cb4ed3c77f.1768575249.git.jani.nikula%40intel.com
patch subject: [PATCH 2/2] drm/{i915,xe}/dsb: move DSB buffer to parent interface
config: loongarch-randconfig-001-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170744.TtAKDBe8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170744.TtAKDBe8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170744.TtAKDBe8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dsb.c:107:55: error: too many arguments provided to function-like macro invocation
     107 |         display->parent->dsb->memset(dsb->dsb_buf, idx, val, size);
         |                                                              ^
   include/linux/fortify-string.h:512:9: note: macro 'memset' defined here
     512 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |         ^
>> drivers/gpu/drm/i915/display/intel_dsb.c:107:24: warning: expression result unused [-Wunused-value]
     107 |         display->parent->dsb->memset(dsb->dsb_buf, idx, val, size);
         |         ~~~~~~~~~~~~~~~~~~~~  ^~~~~~
   1 warning and 1 error generated.


vim +107 drivers/gpu/drm/i915/display/intel_dsb.c

   102	
   103	static void dsb_buffer_memset(struct intel_dsb *dsb, u32 idx, u32 val, size_t size)
   104	{
   105		struct intel_display *display = to_intel_display(dsb->crtc);
   106	
 > 107		display->parent->dsb->memset(dsb->dsb_buf, idx, val, size);
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F7C3CE098;
	Thu, 14 May 2026 22:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778799483; cv=none; b=CaWRk9snuKZY1fMdxeRcKCqiyBVdHZT7iDwYGhfnyo8cxlEfmV2TParkln8n91X2v7zUGkCmZR7nwq36HmKdfgxNmj3gOlzfmWeha53PIQcHtkpmMbTAY9v1f6ACdkFVJ5dYHNCxJuy4MTPybdTq+c5xu1u49E5D4EJWVhFYwpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778799483; c=relaxed/simple;
	bh=zrt/EVft95Ds/UkzYPw1Trk/9ucpz1y9K+hzj/3m93A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4gALGFivTPZeq7A/+lz8tj6yBW/kJ+BsloJ9bXKttQ9vcvOwBhguHDa1FIe/7LQQfFwvDjJXvXvpBbNYax0WgOVZjv/ZhAYhyYJZl258AikAZ/s7DJGN9Hykn9PYrsmVqWUdKjKgHfHWO0SSYQNWgqTowhI/N68QRuWq+zYGU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nebQ0sDs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nebQ0sDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778799482; x=1810335482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zrt/EVft95Ds/UkzYPw1Trk/9ucpz1y9K+hzj/3m93A=;
  b=nebQ0sDs+IF8y4NBVPq8Avxqg3bY4u4VNkw2dAG9pP9SBG0ZUe9xPgel
   kCfNdxgNIDK4WjICIRQzTa8Xbd/KASFFjU0yb02QpTgPhpn1TkUhzJH9i
   E3nBraXB03R6shy5VuwJXiRuykpX357iczMIfp+P7Lku4H8Dq8HqNXNhU
   SS457OV6wFH/2emNFaaap3o5FDu/T/zWez3h2HV0EUilDEo/7VjeLco80
   WkGito3Cci5tfs5hLhyyilEh7CwKtle+JFoLcGFyuyHabgUDpxDB9TbBY
   sgmxCIgqs3KkCUFORlfTyrVW0aRP3I9RvWmczS6/M1+9Clz7c/z9glD0x
   Q==;
X-CSE-ConnectionGUID: NcdU0WlxQtOetZg7DFZOdQ==
X-CSE-MsgGUID: 5jeQ1+SkTXuvxDKuakj1Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91137126"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="91137126"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 15:58:01 -0700
X-CSE-ConnectionGUID: oT7pUIg+THWrf70QDjapZQ==
X-CSE-MsgGUID: fLiGfCsgQ+eXLThhEqcRLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="234080232"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 14 May 2026 15:57:56 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNezh-000000000GT-2tmq;
	Thu, 14 May 2026 22:57:35 +0000
Date: Fri, 15 May 2026 06:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>, Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>, Xin Li <xin@zytor.com>
Subject: Re: [PATCH] x86/entry: Read CR2 in asm entry stub to redcue NMI
 clobbering window
Message-ID: <202605150623.VcCzav1N-lkp@intel.com>
References: <20260513121259.0aae7adc@fangorn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513121259.0aae7adc@fangorn>

Hi Rik,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on tip/x86/asm tip/x86/core linus/master v7.1-rc3 next-20260508]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/x86-entry-Read-CR2-in-asm-entry-stub-to-redcue-NMI-clobbering-window/20260514-162554
base:   tip/master
patch link:    https://lore.kernel.org/r/20260513121259.0aae7adc%40fangorn
patch subject: [PATCH] x86/entry: Read CR2 in asm entry stub to redcue NMI clobbering window
config: i386-buildonly-randconfig-006-20260515 (https://download.01.org/0day-ci/archive/20260515/202605150623.VcCzav1N-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150623.VcCzav1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150623.VcCzav1N-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/include/asm/idtentry.h:627:16: error: unexpected token in argument list
   idtentry_pf 14 asm_exc_page_fault exc_page_fault;
                  ^


vim +627 arch/x86/include/asm/idtentry.h

   623	
   624	/* Raw exception entries which need extra work */
   625	DECLARE_IDTENTRY_RAW(X86_TRAP_UD,		exc_invalid_op);
   626	DECLARE_IDTENTRY_RAW(X86_TRAP_BP,		exc_int3);
 > 627	DECLARE_IDTENTRY_PF(X86_TRAP_PF,	exc_page_fault);
   628	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

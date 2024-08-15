Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3902C182;
	Thu, 15 Aug 2024 04:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723696199; cv=none; b=YxlRivoLJDqS3dqOdTxHk/p5Udm9p5GzcUUXN7H0jMgn7rXGgGjTSZlcQv99nOvPu4+yQT00Ugj6O+BRQvEJA6BTdFPOYt0RJ3tvBkxx2eko4OmqRNYiMTXLLaiYKiETMfxOAKsQIJViSX7jZlml+HjtCZNbRqE1IhITqGm4PgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723696199; c=relaxed/simple;
	bh=enZQw208WceuLJrffZlnK/rPJiNVoQ+aBEDsW0Kfvb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVYnPTfTDwbFASrf5/NyIckiR8kX5YCrRe3g51HRgmdyjx3h0YERtEZvNPy7gWLljjmpMz9DmYBgNjk2Oow/9I4kHrgiMnrU3eccWEY3RqgFNBLMkWaBlfgPP3DctzFajv2bAH6f2kDQ4z5sm+3Cp46ntJZnvAqA9r9BpIGcMA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yz9oA6eC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yz9oA6eC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723696197; x=1755232197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=enZQw208WceuLJrffZlnK/rPJiNVoQ+aBEDsW0Kfvb0=;
  b=Yz9oA6eCU6PRAAAJjQ0uApAlqBLzWkD1nk5LYY4Jy3a16kvhw/B9ylG+
   EgF7B6vv2c14fPum9TCzxztDWDPs5S1oB9h4Gu2zBWgeB2I/MzCRZPZ/H
   FnI611fw8kLXi0UR9HAXpp/1PlKXP/LW4Ie10wiM6fqp1hl5ZHS6zn0VD
   P8bCPrICqcE7+R5dxnDsSzqk8C+NYOog/kUODVF9iCoTE/ObHkCqNiy/f
   VG49JEFHLKToN0AJeZVI+JD/vU2hj9hoExIO1ZiENlMV1E9W9dMf1ECsw
   jbRgJgW5+DxucsZEwVdprwi9mdzLMpTceTuabgtEMcHuRVBwQh4UH87KO
   w==;
X-CSE-ConnectionGUID: 7A95EqbuT6eyoSiqDuIEBA==
X-CSE-MsgGUID: +22539yyQvCEtNzM3ZzrKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21911692"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="21911692"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 21:29:56 -0700
X-CSE-ConnectionGUID: ve4qiAXuTwqQ+71r1YL/Dg==
X-CSE-MsgGUID: 5lvQRFI1Tja4mXydXYcZfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="82441832"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2024 21:29:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seS7U-0003Bx-33;
	Thu, 15 Aug 2024 04:29:52 +0000
Date: Thu, 15 Aug 2024 12:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 1/2] err.h: Add ERR_PTR_PCPU(), PTR_ERR_PCPU() and
 IS_ERR_PCPU() functions
Message-ID: <202408151256.8zNulgGN-lkp@intel.com>
References: <20240813172543.38411-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813172543.38411-1-ubizjak@gmail.com>

Hi Uros,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc3 next-20240814]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/mm-kmemleak-Use-IS_ERR_PCPU-for-pointer-in-the-percpu-address-space/20240814-223016
base:   linus/master
patch link:    https://lore.kernel.org/r/20240813172543.38411-1-ubizjak%40gmail.com
patch subject: [PATCH 1/2] err.h: Add ERR_PTR_PCPU(), PTR_ERR_PCPU() and IS_ERR_PCPU() functions
config: powerpc-sequoia_defconfig (https://download.01.org/0day-ci/archive/20240815/202408151256.8zNulgGN-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151256.8zNulgGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151256.8zNulgGN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/include/asm/paca.h:293:15: error: unexpected token
   static inline void allocate_paca(int cpu) { }
                 ^
   arch/powerpc/include/asm/paca.h:294:15: error: unexpected token
   static inline void free_unused_pacas(void) { }
                 ^


vim +293 arch/powerpc/include/asm/paca.h

1426d5a3bd0758 Michael Ellerman 2010-01-28  292  
6c6fdbb2b7002a Chengyang Fan    2021-01-25 @293  static inline void allocate_paca(int cpu) { }
6c6fdbb2b7002a Chengyang Fan    2021-01-25  294  static inline void free_unused_pacas(void) { }
1426d5a3bd0758 Michael Ellerman 2010-01-28  295  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

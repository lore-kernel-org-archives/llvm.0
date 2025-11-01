Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080E25DCE0;
	Sat,  1 Nov 2025 21:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762030804; cv=none; b=dMtwJczfT7hdQQzfdtzK4xYv96+KfWZgggJLZzRR4el+GJUWdKIcO5w+OH+gyH7Jw4T4qF1DvVoIUX6BWYJeMy6eeanWyKvQMTg7Xpvovq/8zUinvvpi4uKNLMXr0HdoB4U5huVRk+z42dtjGAfjvzw0+dX+6wINcQS+2/HalJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762030804; c=relaxed/simple;
	bh=klydvr2ZO3VGv0Pbzb4nCBXbxiw1zZRUG3hwrz4CKLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2g4OjkDtHXajcqFZdHBsxvyVlrHdHXs4YKsoM7xeMNGAqVrCeFn/Hj2G0x4bpVXLi5U5iXJncWNeTjnZD1uUUyFdKQ6I/kWJTIpZJA9rmLeD1UIsGUEbKZpG3iCsXm6u8Noq4/KS6IvJuKFnUyTLYxx8DDlFrfkD6T75fDxIZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGA6ALvf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGA6ALvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762030803; x=1793566803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=klydvr2ZO3VGv0Pbzb4nCBXbxiw1zZRUG3hwrz4CKLY=;
  b=lGA6ALvfmxOl8PIecSGH8cWxHo/2Wx4ZhJfVpOiUf/tA/ky3QMXyB01J
   HqQmJoFm5vYeniDlSjLne48BMPYmbckTFMMeky6Cp7PR6XSKgbd5MD6gk
   lw9og+xP+bu0yB5vcTSMzhlR1mm04aC9POA/kiKSl4WctkgIyIQSaVo/p
   olcDhOek443QmFL2sx4OLXtXNh1W9Gxvj2oNzTGHheIJamHGENl2XVr9P
   2LdCYdVm6mntZzVg6AT0xXjOrxe8fU+HBMGePu/+NFCZZSWbVoIEsRBnQ
   Wh9c1mlWOtsaYwbRdQn5ONUScWkCLcBx46gplhWyNMCP9jbuE0qI01/XD
   w==;
X-CSE-ConnectionGUID: qK4j2Ko2T7yX7gxu405+zg==
X-CSE-MsgGUID: 7FB6S5WpSRy6N279y+YgGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="66776509"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="66776509"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 14:00:02 -0700
X-CSE-ConnectionGUID: 3Iy0IfYfTzCEs3Rp/ozSPw==
X-CSE-MsgGUID: LIwjV3HZST6fJryHpY/N2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="185799930"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Nov 2025 13:59:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFIhX-000OgW-1X;
	Sat, 01 Nov 2025 20:59:55 +0000
Date: Sun, 2 Nov 2025 04:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <david.laight.linux@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com, Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Li RongQing <lirongqing@baidu.com>, Yu Kuai <yukuai3@huawei.com>,
	Khazhismel Kumykov <khazhy@chromium.org>,
	Jens Axboe <axboe@kernel.dk>, x86@kernel.org
Subject: Re: [PATCH v4 next 6/9] lib: test_mul_u64_u64_div_u64: Test both
 generic and arch versions
Message-ID: <202511020421.ZZPBAIIw-lkp@intel.com>
References: <20251029173828.3682-7-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029173828.3682-7-david.laight.linux@gmail.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251029]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/lib-mul_u64_u64_div_u64-rename-parameter-c-to-d/20251030-025633
base:   next-20251029
patch link:    https://lore.kernel.org/r/20251029173828.3682-7-david.laight.linux%40gmail.com
patch subject: [PATCH v4 next 6/9] lib: test_mul_u64_u64_div_u64: Test both generic and arch versions
config: i386-buildonly-randconfig-004-20251102 (https://download.01.org/0day-ci/archive/20251102/202511020421.ZZPBAIIw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020421.ZZPBAIIw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020421.ZZPBAIIw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/math/test_mul_u64_u64_div_u64.c:142:9: warning: '__div64_32' macro redefined [-Wmacro-redefined]
     142 | #define __div64_32 __div64_32
         |         ^
   arch/x86/include/asm/div64.h:78:9: note: previous definition is here
      78 | #define __div64_32
         |         ^
   1 warning generated.


vim +/__div64_32 +142 lib/math/test_mul_u64_u64_div_u64.c

   140	
   141	/* Compile the generic mul_u64_add_u64_div_u64() code */
 > 142	#define __div64_32 __div64_32
   143	#define div_s64_rem div_s64_rem
   144	#define div64_u64_rem div64_u64_rem
   145	#define div64_u64 div64_u64
   146	#define div64_s64 div64_s64
   147	#define iter_div_u64_rem iter_div_u64_rem
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

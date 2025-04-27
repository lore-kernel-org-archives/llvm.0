Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F179E1;
	Sun, 27 Apr 2025 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745725694; cv=none; b=HkIYtP93kQnzMrI+lPhQV2iyWSzQ1UwfetGY3NKtzh6qU96ftJx+p40KmSc3wY2Vwl0wxlJSO9d1+TTuDGxHnhEAhRWzHGCPo2OfYDg9OSUeZoxw20T/iEyQMezuI17DbYPRa+lxthU8rhpMaiTFPHyj4g7GV3JlodzDfH5yGqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745725694; c=relaxed/simple;
	bh=gOxPEKItWYYS/z6lUkWsgyySoOhcKG+igPf/hN0e3UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFYJGwRGiLGDlEKVXOpY0I6GH5H1tmVyMwuKXZcu6FAxOfJ6nk3TSyD3kb+9qAzsG2H8f7MGqu6wFmJu7orB/4cIHQgf2VwtHQ+bJcBYU34ejG3BwOTXV87DHWId3Dk0bYX0h3Q5kTgNexCWh+dsrRlZJMvvFzXkgchwxwOH/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpmpL9Td; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpmpL9Td"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745725692; x=1777261692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gOxPEKItWYYS/z6lUkWsgyySoOhcKG+igPf/hN0e3UQ=;
  b=RpmpL9Tdoc67kh02DQUW7znSmZHidWgIYNsjFrH8y5NiKutTPlkR1lpm
   hIj+gOy6zJn68VY7R9MuJJLLQ+NBto9d3d8BJNOy6dRkDiFwW68Wa+k1P
   yxnekMK0/umzOPnM6F+I3BLz95Mdx9tAcYKOmhbJN0R6u5l4GK6lXTgpw
   vhZLfRPMFQYMgBZxvN1zThihBIdk8lDwtAodo8TXm0mCpRwz5fjkI8NeN
   CIeh6TAHAAz8tRhztbhPo1tK2InB67oO45rUXaUZR+p7AIa8px96NaZ4y
   cTBBzM6ifjqMK5VCu+UbZUu3H4Av0Eq1/NdC0z5XmLHbU/NEKDwezAXa2
   w==;
X-CSE-ConnectionGUID: FaUtgC79TfeUmZ8Rku4ChA==
X-CSE-MsgGUID: QFJE9PuBSnexbHfKkKTE+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47250761"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="47250761"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 20:48:12 -0700
X-CSE-ConnectionGUID: +WTW5eaiQ2ShKZJV44Iq3A==
X-CSE-MsgGUID: 5zFEzJhuQnCBSxzW+pRrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="133194156"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Apr 2025 20:48:07 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8szs-00066J-0d;
	Sun, 27 Apr 2025 03:48:04 +0000
Date: Sun, 27 Apr 2025 11:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kees Cook <kees@kernel.org>, Bill Wendling <morbo@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Petr Mladek <pmladek@suse.com>, David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>, Tamir Duberstein <tamird@gmail.com>,
	Diego Vieira <diego.daniel.professional@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Mark Brown <broonie@kernel.org>, WangYuli <wangyuli@uniontech.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH 2/3] lib/tests: Add randstruct KUnit test
Message-ID: <202504271150.Be642Srg-lkp@intel.com>
References: <20250427013836.877214-2-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427013836.877214-2-kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/hardening]
[also build test WARNING on linus/master v6.15-rc3 next-20250424]
[cannot apply to akpm-mm/mm-nonmm-unstable soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/randstruct-gcc-plugin-Remove-bogus-void-member/20250427-093946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20250427013836.877214-2-kees%40kernel.org
patch subject: [PATCH 2/3] lib/tests: Add randstruct KUnit test
config: riscv-randconfig-001-20250427 (https://download.01.org/0day-ci/archive/20250427/202504271150.Be642Srg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504271150.Be642Srg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271150.Be642Srg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/tests/randstruct_kunit.c:36:36: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
      36 | _Static_assert(MEMBER_NAME_MAX == 8);
         |                                    ^
         |                                    , ""
   1 warning generated.


vim +/_Static_assert +36 lib/tests/randstruct_kunit.c

    19	
    20	#define DO_MANY_MEMBERS(macro, args...)	\
    21		macro(a, args)			\
    22		macro(b, args)			\
    23		macro(c, args)			\
    24		macro(d, args)			\
    25		macro(e, args)			\
    26		macro(f, args)			\
    27		macro(g, args)			\
    28		macro(h, args)
    29	
    30	#define do_enum(x, ignored)	MEMBER_NAME_ ## x,
    31	enum randstruct_member_names {
    32		DO_MANY_MEMBERS(do_enum)
    33		MEMBER_NAME_MAX,
    34	};
    35	/* Make sure the macros are working: want 8 test members. */
  > 36	_Static_assert(MEMBER_NAME_MAX == 8);
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

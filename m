Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446451448D5;
	Sun, 27 Apr 2025 06:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745733925; cv=none; b=NROK/VyLvCrt63QBmc5igscxLdTFAXOd+PRNSGcdz0jz3J72H6PvBz1IRBKkHxasTh0e3IA9qnToIhk4lVjjIF59siMKnynBS+fgrJUbe4uAJX4VxZLI2s/hHKSNCuxj3C60T+cfqBe3qgfz3TZLUq5dKSVDnXPXO1Ki7RS6jS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745733925; c=relaxed/simple;
	bh=ZldK3+fSlzSjRsOdQzFFyxV4omaUhKTuFH+wBprq+/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATHqJciLzd8HoGcKhCJhPSTz+c118yqNByKT2nPWTuIlIdX/C6pVN1cfCmxX25TG/+dt0VQIurF+z1jw9v5bh9HkbXdDlvur/zXT46xGoAubWKzvY+VxlPv3IWAArYJVAO+t/EWXgPXK8QfIdEPcw6LWG+lQeXiDGcE4urNfq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpO9kfxN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpO9kfxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745733923; x=1777269923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZldK3+fSlzSjRsOdQzFFyxV4omaUhKTuFH+wBprq+/w=;
  b=HpO9kfxNUD/LP62iWLGmIh5VVfEOzmKOTHr/3strVK8c4SmY134zhS6N
   ynRZHUghRUrx2J7Fy9QXv/pSYzyZ/v+qhBKELx/VDvPvW9tExM2EWWTbA
   A56qhR/LU5La+4Kk9hQqvsxeEQTnqGiAqtBTXqMvyac9Ukb11sHONeBs7
   rh8C4nd9gRRVFfJqPf2pVGFGuKuIv+b9plJ/8qQhcjDy7bbc17khAxBH9
   7jTT+/h7aSfDh3s6muf2PkFLCytYlmjb+WzFcbQESIy/TYXCeN5IOJYuK
   jCPUnsjtdB3YyPZeX3oCrXURALtf16TaG8CCm1lYl/Vg74x+GXsvZTfNu
   A==;
X-CSE-ConnectionGUID: LaRGkKRCRLaohttu4jicTw==
X-CSE-MsgGUID: XugQ6OLWSt+Z5QkTeRIwbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="58706657"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="58706657"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:05:22 -0700
X-CSE-ConnectionGUID: QYM4ZrilT4G7I63yKlDDFQ==
X-CSE-MsgGUID: KSzi8iNSQUqg49j/SDdZVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="164295196"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Apr 2025 23:05:16 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8v8b-00068j-2a;
	Sun, 27 Apr 2025 06:05:13 +0000
Date: Sun, 27 Apr 2025 14:04:51 +0800
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
Message-ID: <202504271552.T3fbs0XC-lkp@intel.com>
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
config: powerpc64-randconfig-002-20250427 (https://download.01.org/0day-ci/archive/20250427/202504271552.T3fbs0XC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504271552.T3fbs0XC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271552.T3fbs0XC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/tests/randstruct_kunit.c:36:36: warning: '_Static_assert' with no message is a C2x extension [-Wc2x-extensions]
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

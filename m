Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DC7168
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 19:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643052260; x=1674588260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=57iBx07+2dC9WLE/Fz630kKlXfFcbRvrbF+GF9oeaFE=;
  b=Majm5qU3XP6TAMkMjQ2Vb/JLp7naQMCCNnsriaI01rlm1aS7CQT0nPcE
   iLC2XVNEq3rPCJOMdvT4TFKLOmWCFEplZI4oRMaAWkhzZrPIz16YIt8Ny
   y58hESqX6RuB50+uGbWGpIr7vnl4bzUpweUwSoPy+apiuy66jIyxrh7Tg
   swcw5jqP2/v8gqlUmHhM23aljGSdQyP4EgJgyYEDXLD3NVKDB8nK0Fy3f
   FvxPsl2ov2/FQ6FiOjTVbYmu/wJXSgjKlknnRO+fTvnkBgDCrJfnRPwKT
   1GBRFoidny31ObPXUGbFCEbvAmowYD874Owf8FUt19cUwFkWLrPGxBIqy
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="226800306"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="226800306"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 11:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="479201245"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Jan 2022 11:24:03 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nC4wc-000Ina-G3; Mon, 24 Jan 2022 19:24:02 +0000
Date: Tue, 25 Jan 2022 03:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/2] vsprintf: Move space out of string literals in
 fourcc_string()
Message-ID: <202201250142.DtHQRlOS-lkp@intel.com>
References: <20220124144258.34120-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124144258.34120-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on linus/master v5.17-rc1 next-20220124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/vsprintf-Fix-potential-unaligned-access/20220124-224420
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2c271fe77d52a0555161926c232cd5bc07178b39
config: riscv-randconfig-r042-20220124 (https://download.01.org/0day-ci/archive/20220125/202201250142.DtHQRlOS-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2e58a18910867ba6795066e044293e6daf89edf5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/f1895edcabdc5dae0528ffff9c3cb665a937223d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/vsprintf-Fix-potential-unaligned-access/20220124-224420
        git checkout f1895edcabdc5dae0528ffff9c3cb665a937223d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> lib/vsprintf.c:1794:6: error: implicitly declaring library function 'stpcpy' with type 'char *(char *, const char *)' [-Werror,-Wimplicit-function-declaration]
           p = stpcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
               ^
   lib/vsprintf.c:1794:6: note: include the header <string.h> or explicitly provide a declaration for 'stpcpy'
   1 error generated.


vim +1794 lib/vsprintf.c

  1767	
  1768	static noinline_for_stack
  1769	char *fourcc_string(char *buf, char *end, const u32 *fourcc,
  1770			    struct printf_spec spec, const char *fmt)
  1771	{
  1772		char output[sizeof("0123 little-endian (0x01234567)")];
  1773		char *p = output;
  1774		unsigned int i;
  1775		u32 orig, val;
  1776	
  1777		if (fmt[1] != 'c' || fmt[2] != 'c')
  1778			return error_string(buf, end, "(%p4?)", spec);
  1779	
  1780		if (check_pointer(&buf, end, fourcc, spec))
  1781			return buf;
  1782	
  1783		orig = get_unaligned(fourcc);
  1784		val = orig & ~BIT(31);
  1785	
  1786		for (i = 0; i < sizeof(u32); i++) {
  1787			unsigned char c = val >> (i * 8);
  1788	
  1789			/* Print non-control ASCII characters as-is, dot otherwise */
  1790			*p++ = isascii(c) && isprint(c) ? c : '.';
  1791		}
  1792	
  1793		*p++ = ' ';
> 1794		p = stpcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
  1795	
  1796		*p++ = ' ';
  1797		*p++ = '(';
  1798		p = special_hex_number(p, output + sizeof(output) - 2, orig, sizeof(u32));
  1799		*p++ = ')';
  1800		*p = '\0';
  1801	
  1802		return string(buf, end, output, spec);
  1803	}
  1804	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

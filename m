Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E5CEDE
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 03:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663643698; x=1695179698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=noeQyLdjBrKJQycFgfbpDL26zbno8W35OivxmiAO9zE=;
  b=H7+EwmDUVy3f8mb/82Vctqn4yjmjdIQDT2gr5nT8vlIaur4uvLee7DE3
   fL88FHwAnKeI+RaJuSeg9NtOWeoSOCyW2b8Jrao5Krdz2rzp3GPtCNOyb
   dhzyxsjQwtUbv82h8N9LfI3nhoONENSLqgjXOKWKPhGEetxhpRDRCkaWr
   4mZYL0HeH11vA5+X31/9oi6rcjXvlRtOY49vvsr1GeAqVjzK0MkrWgx6G
   tlc3UssYzoe9bIKqqwXrlE4TJNfO4CABCeUjvOlQuA0Rv5yGS/NLqrxZm
   fbA3Df756aqu2MHFRsm8JvLZaPyTsf9UvWigMVF3fJiqHhJCBZyH/vFDp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="286630116"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="286630116"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 20:14:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="707810406"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2022 20:14:54 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaTin-0002RQ-1U;
	Tue, 20 Sep 2022 03:14:53 +0000
Date: Tue, 20 Sep 2022 11:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Zhen Lei <thunder.leizhen@huawei.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v3 8/8] kallsyms: Add self-test facility
Message-ID: <202209201123.hihIfjo1-lkp@intel.com>
References: <20220919151533.1734-9-thunder.leizhen@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919151533.1734-9-thunder.leizhen@huawei.com>

Hi Zhen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on linus/master v6.0-rc6 next-20220919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhen-Lei/kallsyms-Optimizes-the-performance-of-lookup-symbols/20220919-231916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
config: i386-randconfig-a001-20220919 (https://download.01.org/0day-ci/archive/20220920/202209201123.hihIfjo1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/26fdb8f3984ffbdb57da2d1fac7e32ae418bfa96
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhen-Lei/kallsyms-Optimizes-the-performance-of-lookup-symbols/20220919-231916
        git checkout 26fdb8f3984ffbdb57da2d1fac7e32ae418bfa96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/kallsyms.c:196:15: warning: no previous prototype for function 'kallsyms_sym_address' [-Wmissing-prototypes]
   unsigned long kallsyms_sym_address(int idx)
                 ^
   kernel/kallsyms.c:196:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long kallsyms_sym_address(int idx)
   ^
   static 
   kernel/kallsyms.c:668:12: warning: no previous prototype for function 'arch_get_kallsym' [-Wmissing-prototypes]
   int __weak arch_get_kallsym(unsigned int symnum, unsigned long *value,
              ^
   kernel/kallsyms.c:668:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_get_kallsym(unsigned int symnum, unsigned long *value,
   ^
   static 
   2 warnings generated.


vim +/kallsyms_sym_address +196 kernel/kallsyms.c

   195	
 > 196	unsigned long kallsyms_sym_address(int idx)
   197	{
   198		if (!IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE))
   199			return kallsyms_addresses[idx];
   200	
   201		/* values are unsigned offsets if --absolute-percpu is not in effect */
   202		if (!IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU))
   203			return kallsyms_relative_base + (u32)kallsyms_offsets[idx];
   204	
   205		/* ...otherwise, positive offsets are absolute values */
   206		if (kallsyms_offsets[idx] >= 0)
   207			return kallsyms_offsets[idx];
   208	
   209		/* ...and negative offsets are relative to kallsyms_relative_base - 1 */
   210		return kallsyms_relative_base - 1 - kallsyms_offsets[idx];
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4101C3C2A;
	Sun,  2 Jul 2023 19:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688327211; x=1719863211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bjkZcrlCYzUk4zYchWcObPkc5bbNOF9ptg5FMavZJA8=;
  b=khBIVHkv3rkQ6fRv4IXUXpm6+C6+DBnQXnTa8O5/2IWwEoDnuzEYStzx
   UZ61L964R13LsifKydLlVuxkce/AaoZfxWdenhgtJvPcTgitlRhog/+4e
   NZcX+zqno9e7wHq8lfISzt5Db0VNKxyRQT9qxihFLr7JaTnhWHJZTdQE6
   7oQNQ9WitOyI6uImVmUJUibaRZgw/V7eGvYf9KtrKPf9Eh7NUdyibOhvw
   bdVJvaeha5ZbKfLlO9o8HrThGXckLNg/l9oScju2NzmQBq1IGz0mMZYcO
   aOVNpcYWuiS+YGxDqC4hFlbn1t5BWmMsZELSAnUBAabXZj5TviPP2jwT3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="426416411"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="426416411"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 12:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="718395415"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="718395415"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Jul 2023 12:46:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qG31y-000Gr5-1i;
	Sun, 02 Jul 2023 19:46:46 +0000
Date: Mon, 3 Jul 2023 03:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jackie Liu <liu.yun@linux.dev>, olsajiri@gmail.com, andrii@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
	bpf@vger.kernel.org, liuyun01@kylinos.cn
Subject: Re: [PATCH v2 1/2] libbpf: kprobe.multi: cross filter using
 available_filter_functions and kallsyms
Message-ID: <202307030355.TdXOHklM-lkp@intel.com>
References: <20230701080817.1768865-1-liu.yun@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230701080817.1768865-1-liu.yun@linux.dev>

Hi Jackie,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master linus/master v6.4 next-20230630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jackie-Liu/libbpf-kprobe-multi-Filter-with-available_filter_functions_addrs/20230701-161010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230701080817.1768865-1-liu.yun%40linux.dev
patch subject: [PATCH v2 1/2] libbpf: kprobe.multi: cross filter using available_filter_functions and kallsyms
config: x86_64-buildonly-randconfig-r001-20230702 (https://download.01.org/0day-ci/archive/20230703/202307030355.TdXOHklM-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307030355.TdXOHklM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307030355.TdXOHklM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> libbpf.c:10626:57: error: 'fscanf' may overflow; destination buffer in argument 4 has size 256, but the corresponding specifier may require size 500 [-Werror,-Wfortify-source]
                   ret = fscanf(f, "%llx %*c %499s%*[^\n]\n", &sym_addr, sym_name);
                                                                         ^
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:97: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile:157: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2
   make[3]: *** [Makefile:63: tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2
   make[2]: *** [Makefile:76: bpf/resolve_btfids] Error 2 shuffle=967315254
   make[1]: *** [Makefile:1446: tools/bpf/resolve_btfids] Error 2 shuffle=967315254
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2 shuffle=967315254
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665A173
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 04:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640579593; x=1672115593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nol3FYP3LRCZ1YAmW0+Wj7yf3ZmSd3yRMGdzGZs1N1M=;
  b=ITJls5ixbnyJ9rlEeFd6D52KONIJIT6+QHoMstyojRaD+5oA7jBIk1hZ
   1FTmgbIRe0qEt4nwoFd5NPAb6sCQm3pgv5nr12a3q8m2BAMhIDCtD1whl
   9Wsw5OKKoY06gEs99ITukVakDhrY8Gy02Znc96qzp6o4XI+yjGfjTfkL9
   mVxLKss2sh10VDgRNH6yFe6qpOC3xHGQgLMN/Dv9JQ3UF35B8DE9Ke2Sy
   BfZuCSyDv1nb8nqFzjBWeafAIhGw98q509fNJEgGrK2/oH9bB568BQRoY
   jqo0g7uYih5JomtCiwEMO95Ha3x2f+QIdk0xWtjPs9HF7WiNxbwbs7c1i
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="239943381"
X-IronPort-AV: E=Sophos;i="5.88,238,1635231600"; 
   d="scan'208";a="239943381"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2021 20:33:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,238,1635231600"; 
   d="scan'208";a="467758128"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Dec 2021 20:33:10 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1hh7-00063h-OI; Mon, 27 Dec 2021 04:33:09 +0000
Date: Mon, 27 Dec 2021 12:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: grantseltzer <grantseltzer@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH bpf-next v2] libbpf: Add documentation for bpf_map batch
 operations
Message-ID: <202112271230.YWo0e6o5-lkp@intel.com>
References: <20211225203717.35718-1-grantseltzer@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211225203717.35718-1-grantseltzer@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi grantseltzer,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/grantseltzer/libbpf-Add-documentation-for-bpf_map-batch-operations/20211226-043930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: x86_64-randconfig-a004-20211227 (https://download.01.org/0day-ci/archive/20211227/202112271230.YWo0e6o5-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f8daffaa56bc1d00f28a1bc7db7ca91d98ae3c53
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review grantseltzer/libbpf-Add-documentation-for-bpf_map-batch-operations/20211226-043930
        git checkout f8daffaa56bc1d00f28a1bc7db7ca91d98ae3c53
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> bpf.c:698:15: error: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                                       NULL, keys, NULL, count, opts);
                                             ^~~~
   bpf.c:668:28: note: passing argument to parameter 'keys' here
                                   void *out_batch, void *keys, void *values,
                                                          ^
   bpf.c:722:9: error: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                                       keys, values, count, opts);
                                       ^~~~
   bpf.c:668:28: note: passing argument to parameter 'keys' here
                                   void *out_batch, void *keys, void *values,
                                                          ^
   bpf.c:722:15: error: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                                       keys, values, count, opts);
                                             ^~~~~~
   bpf.c:668:40: note: passing argument to parameter 'values' here
                                   void *out_batch, void *keys, void *values,
                                                                      ^
   3 errors generated.
   make[6]: *** [tools/build/Makefile.build:97: kernel/bpf/preload/libbpf/staticobjs/bpf.o] Error 1
   make[6]: Target '__build' not remade because of errors.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

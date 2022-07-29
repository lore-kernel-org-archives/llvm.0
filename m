Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEF91113
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 16:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659113533; x=1690649533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2x/R9wNexv4Obay2FCIpBgurqGgVMkV8TKcU7OF+ndI=;
  b=iLfDMu6mF3mjy4W/ChJjHV1sm6SaoqvXQsdAMYha1Ms3LFOyYFEwfU36
   nZl+6I9PxVMCq8Et33S1vz5gLGs5WrCw0ITZBLI8NJj17VfF6y7q0wq2g
   sJUenbjEpCxU5REfWUZgleofHiK8w/GWX6R4/u/X3M/+Md80pxtol70Yo
   agqJmqtii973SoblyPp6nx0Yw7Whv+jN6u/KntGMaeZbICTJ0pPheVOcb
   QB6/ykX2DDwCmKfyCSxY0rY5moDJf+VtAR9UIOTcuqrYX5IUdXaIcWgyH
   KW8qFvhzxVZXQibh2gs4jx/OxhxfmQih3YTsxLkInmJIeU40uDEf5amCY
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="271846117"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="271846117"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 09:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="669327416"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jul 2022 09:52:11 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHTDf-000BtN-0n;
	Fri, 29 Jul 2022 16:52:11 +0000
Date: Sat, 30 Jul 2022 00:51:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 2/3] netfilter: nf_tables: add string set API
Message-ID: <202207300012.wdJ7MSyA-lkp@intel.com>
References: <20220729093129.3108-3-pablo@netfilter.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729093129.3108-3-pablo@netfilter.org>

Hi Pablo,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on nf/master]
[also build test ERROR on nf-next/master linus/master v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/nf_tables-string-match-support/20220729-173258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf.git master
config: hexagon-randconfig-r021-20220729 (https://download.01.org/0day-ci/archive/20220730/202207300012.wdJ7MSyA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/021bda4d09b7b9be8c40f05b017f885ba3010c02
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pablo-Neira-Ayuso/nf_tables-string-match-support/20220729-173258
        git checkout 021bda4d09b7b9be8c40f05b017f885ba3010c02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ac_destroy
   >>> referenced by nf_tables_api.c:8263 (net/netfilter/nf_tables_api.c:8263)
   >>>               netfilter/nf_tables_api.o:(nft_strset_destroy) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:8263 (net/netfilter/nf_tables_api.c:8263)
   >>>               netfilter/nf_tables_api.o:(nft_strset_destroy) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:8268 (net/netfilter/nf_tables_api.c:8268)
   >>>               netfilter/nf_tables_api.o:(nft_strset_destroy) in archive net/built-in.a
   >>> referenced 9 more times
--
>> ld.lld: error: undefined symbol: ac_resolve_fail
   >>> referenced by nf_tables_api.c:9339 (net/netfilter/nf_tables_api.c:9339)
   >>>               netfilter/nf_tables_api.o:(nf_tables_commit) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:9339 (net/netfilter/nf_tables_api.c:9339)
   >>>               netfilter/nf_tables_api.o:(nf_tables_commit) in archive net/built-in.a
--
>> ld.lld: error: undefined symbol: ac_create
   >>> referenced by nf_tables_api.c:0 (net/netfilter/nf_tables_api.c:0)
   >>>               netfilter/nf_tables_api.o:(nf_tables_newstrset) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:0 (net/netfilter/nf_tables_api.c:0)
   >>>               netfilter/nf_tables_api.o:(nf_tables_newstrset) in archive net/built-in.a
--
>> ld.lld: error: undefined symbol: ac_clone
   >>> referenced by nf_tables_api.c:0 (net/netfilter/nf_tables_api.c:0)
   >>>               netfilter/nf_tables_api.o:(nf_tables_newstr) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:0 (net/netfilter/nf_tables_api.c:0)
   >>>               netfilter/nf_tables_api.o:(nf_tables_newstr) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:0 (net/netfilter/nf_tables_api.c:0)
   >>>               netfilter/nf_tables_api.o:(nf_tables_delstr) in archive net/built-in.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: ac_add
   >>> referenced by nf_tables_api.c:8365 (net/netfilter/nf_tables_api.c:8365)
   >>>               netfilter/nf_tables_api.o:(nf_tables_newstr) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:8365 (net/netfilter/nf_tables_api.c:8365)
   >>>               netfilter/nf_tables_api.o:(nf_tables_newstr) in archive net/built-in.a
--
>> ld.lld: error: undefined symbol: ac_del
   >>> referenced by nf_tables_api.c:8474 (net/netfilter/nf_tables_api.c:8474)
   >>>               netfilter/nf_tables_api.o:(nf_tables_delstr) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:8474 (net/netfilter/nf_tables_api.c:8474)
   >>>               netfilter/nf_tables_api.o:(nf_tables_delstr) in archive net/built-in.a
--
>> ld.lld: error: undefined symbol: ac_iter_create
   >>> referenced by nf_tables_api.c:8567 (net/netfilter/nf_tables_api.c:8567)
   >>>               netfilter/nf_tables_api.o:(nf_tables_dump_str_start) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:8567 (net/netfilter/nf_tables_api.c:8567)
   >>>               netfilter/nf_tables_api.o:(nf_tables_dump_str_start) in archive net/built-in.a
--
>> ld.lld: error: undefined symbol: ac_iter_destroy
   >>> referenced by nf_tables_api.c:8575 (net/netfilter/nf_tables_api.c:8575)
   >>>               netfilter/nf_tables_api.o:(nf_tables_dump_str_start) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:8575 (net/netfilter/nf_tables_api.c:8575)
   >>>               netfilter/nf_tables_api.o:(nf_tables_dump_str_start) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:8592 (net/netfilter/nf_tables_api.c:8592)
   >>>               netfilter/nf_tables_api.o:(nf_tables_dump_str_done) in archive net/built-in.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: ac_iterate
   >>> referenced by nf_tables_api.c:8650 (net/netfilter/nf_tables_api.c:8650)
   >>>               netfilter/nf_tables_api.o:(nf_tables_dump_str) in archive net/built-in.a
   >>> referenced by nf_tables_api.c:8650 (net/netfilter/nf_tables_api.c:8650)
   >>>               netfilter/nf_tables_api.o:(nf_tables_dump_str) in archive net/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

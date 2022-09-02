Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B6FEDF
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 02:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662087235; x=1693623235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FwyR9hMdl684ayilMVL+6KHSWkdMFizQTJkDzfzj/G4=;
  b=GQdpyK3Hi0LNWkSikxFTybTdcLbGVUGBspXEIFEbL9o9/bRlHcrKEmJd
   AIyKaAGgvhytHYssrIBOw043p3Bcj3IbvQ6jpcKQzYmG2gMKM3w5e8Jh/
   rUWaPA+GeKfRNlZEodEwwLaBB3Ec7s7iNckUNL9rd3/SmvWx0js5r6q5Y
   ywdqR8tkn0Z3aXLpca+OdxzS1FII9oyAgH4UPjuNSzW/aGrCXRbNW3FRu
   JJaiUkwhR31WJ14cjALQMWgXCKc0L8oy6xcFuEEkQQq2IXPLdM4OdpeDg
   WMTLfwcKG1W2U6y/40OdSNM+71BFxbPxoFRBOnLV7aBO1Y4EKnqjyq2nq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="293454777"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="293454777"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 19:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="642702707"
Received: from lkp-server02.sh.intel.com (HELO fccc941c3034) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Sep 2022 19:53:48 -0700
Received: from kbuild by fccc941c3034 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTwoW-000035-0j;
	Fri, 02 Sep 2022 02:53:48 +0000
Date: Fri, 2 Sep 2022 10:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Like Xu <like.xu.linux@gmail.com>
Subject: Re: [PATCH v4 1/5] perf/x86/core: Remove unnecessary stubs provided
 for KVM-only helpers
Message-ID: <202209021033.bPC3ttgM-lkp@intel.com>
References: <20220901173258.925729-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901173258.925729-2-seanjc@google.com>

Hi Sean,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 372d07084593dc7a399bf9bee815711b1fb1bcf2]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/KVM-x86-Intel-LBR-related-perf-cleanups/20220902-013352
base:   372d07084593dc7a399bf9bee815711b1fb1bcf2
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220902/202209021033.bPC3ttgM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b1f1d2f5eb44253f5d059757c03e7fd413b2e306
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Christopherson/KVM-x86-Intel-LBR-related-perf-cleanups/20220902-013352
        git checkout b1f1d2f5eb44253f5d059757c03e7fd413b2e306
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/events/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/events/core.c:696:31: warning: no previous prototype for function 'perf_guest_get_msrs' [-Wmissing-prototypes]
   struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr, void *data)
                                 ^
   arch/x86/events/core.c:696:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr, void *data)
   ^
   static 
   1 warning generated.


vim +/perf_guest_get_msrs +696 arch/x86/events/core.c

f87ad35d37fa54 arch/x86/kernel/cpu/perf_counter.c Jaswinder Singh Rajput 2009-02-27  695  
39a4d779546a99 arch/x86/events/core.c             Like Xu                2022-04-11 @696  struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr, void *data)
abd562df94d19d arch/x86/events/core.c             Like Xu                2021-01-25  697  {
39a4d779546a99 arch/x86/events/core.c             Like Xu                2022-04-11  698  	return static_call(x86_pmu_guest_get_msrs)(nr, data);
abd562df94d19d arch/x86/events/core.c             Like Xu                2021-01-25  699  }
abd562df94d19d arch/x86/events/core.c             Like Xu                2021-01-25  700  EXPORT_SYMBOL_GPL(perf_guest_get_msrs);
abd562df94d19d arch/x86/events/core.c             Like Xu                2021-01-25  701  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E650F612D;
	Fri, 21 Apr 2023 19:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682107039; x=1713643039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=og4F4vuOrf2Ixfm0chq8agl9joBvFHLSfSL17IjCupE=;
  b=eDWpLA7skiC5pXICytWMPSh9GLhiYxzs9W8eIiSHxi1iKidsIFPAJOCs
   HZehI+m4ODZGysTDaO7qgTXdfijAG6NxBjK23TcsKNEHa5twJ3AsXg0yw
   htp7Qbf5eAaD1Kv2hPxX/dRRa1kGVePy3Z8bOGCSkVjVeXejr3ggvFqoC
   r3djISku0giCGuoPIEJmz+HMcBlNWre/ikSrH15tJa/F/dmBBSrCoL86P
   /Dy/MHFrgT+meV9G8GzN18EXNS0TyafEgUiXmdJZEmmEvqcdMsjPWuIBl
   RHtDtLmTuOiBOU/iSQzYb3gmh5f+R3bHWK9KeDWLM5VlF6/PxQnbQx4zK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325669317"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="325669317"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 12:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="642620445"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="642620445"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Apr 2023 12:54:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppwpp-000glt-15;
	Fri, 21 Apr 2023 19:54:21 +0000
Date: Sat, 22 Apr 2023 03:53:38 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Eric Dumazet <edumazet@google.com>,
	Waiman Long <longman@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v4 3/3] mm,page_owner: Filter out stacks by a threshold
 counter
Message-ID: <202304220312.gCQb3BRX-lkp@intel.com>
References: <20230421101415.5734-4-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421101415.5734-4-osalvador@suse.de>

Hi Oscar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc7]
[cannot apply to akpm-mm/mm-everything next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/lib-stackdepot-Add-a-refcount-field-in-stack_record/20230421-181709
base:   linus/master
patch link:    https://lore.kernel.org/r/20230421101415.5734-4-osalvador%40suse.de
patch subject: [PATCH v4 3/3] mm,page_owner: Filter out stacks by a threshold counter
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230422/202304220312.gCQb3BRX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/716d3f03add56cf9ed9ae5e49d73cf7e0cbfcb19
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oscar-Salvador/lib-stackdepot-Add-a-refcount-field-in-stack_record/20230421-181709
        git checkout 716d3f03add56cf9ed9ae5e49d73cf7e0cbfcb19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220312.gCQb3BRX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_owner.c:746:1: warning: format specifies type 'unsigned long' but the argument has type 'unsigned long long' [-Wformat]
   DEFINE_SIMPLE_ATTRIBUTE(proc_page_owner_threshold, &page_owner_threshold_get,
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:3079:2: note: expanded from macro 'DEFINE_SIMPLE_ATTRIBUTE'
           DEFINE_SIMPLE_ATTRIBUTE_XSIGNED(__fops, __get, __set, __fmt, false)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:3066:36: note: expanded from macro 'DEFINE_SIMPLE_ATTRIBUTE_XSIGNED'
           __simple_attr_check_format(__fmt, 0ull);                        \
                                      ~~~~~  ^~~~
   1 warning generated.


vim +746 mm/page_owner.c

   745	
 > 746	DEFINE_SIMPLE_ATTRIBUTE(proc_page_owner_threshold, &page_owner_threshold_get,
   747				&page_owner_threshold_set, "%lu");
   748	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

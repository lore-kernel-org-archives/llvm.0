Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D408C63B;
	Tue,  2 May 2023 03:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682998458; x=1714534458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+6dA6KdIKutJxGniT6UriJY7gWQ2DD7E0/cszDATHKI=;
  b=XI71fl8KpqOHUUtsMawlymTY7FfLmsTQUT0CwoIsGK4qTMv3oxFtePZV
   TBNJqmeFydwzDSVAT988c2M0/wkbas2wUCpE5BOkGVUjHuJstWRy+0QoZ
   P7ZHPNAifCQcPJZDBRs1hVmtMp5N0/4IWnmI25F2SL2IfFVg/v84gMF6y
   Bv2dUK+JpH8H7huGLQCZbOVXzK7uS3HtmgVII/CavurSqYeqLyr4hNd21
   //H0jhlPoLVn0DaEZHsvmCZ8MZbTxkg98H/YCp0vof+ouSO0dt1ZDfDAF
   RcdkUOsUmjA55ec2x+M5EjtyMkWMvgdLGKzs6anRHpJJZTstty9ctGw3t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="413734251"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="413734251"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 20:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="1025889706"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="1025889706"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 May 2023 20:34:10 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptgmI-0000oK-0s;
	Tue, 02 May 2023 03:34:10 +0000
Date: Tue, 2 May 2023 11:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lstoakes@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
	Matthew Wilcox <willy@infradead.org>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Leon Romanovsky <leon@kernel.org>,
	Christian Benvenuti <benve@cisco.com>,
	Nelson Escobar <neescoba@cisco.com>,
	Bernard Metzler <bmt@zurich.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Bjorn Topel <bjorn@kernel.org>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v6 3/3] mm/gup: disallow FOLL_LONGTERM GUP-fast writing
 to file-backed mappings
Message-ID: <202305021142.vBYXxxEh-lkp@intel.com>
References: <dee4f4ad6532b0f94d073da263526de334d5d7e0.1682981880.git.lstoakes@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dee4f4ad6532b0f94d073da263526de334d5d7e0.1682981880.git.lstoakes@gmail.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-mmap-separate-writenotify-and-dirty-tracking-logic/20230502-071520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/dee4f4ad6532b0f94d073da263526de334d5d7e0.1682981880.git.lstoakes%40gmail.com
patch subject: [PATCH v6 3/3] mm/gup: disallow FOLL_LONGTERM GUP-fast writing to file-backed mappings
config: arm-randconfig-r013-20230502 (https://download.01.org/0day-ci/archive/20230502/202305021142.vBYXxxEh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/602bb9fab888bd9176b8eeb80a0da68499c343ed
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lorenzo-Stoakes/mm-mmap-separate-writenotify-and-dirty-tracking-logic/20230502-071520
        git checkout 602bb9fab888bd9176b8eeb80a0da68499c343ed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021142.vBYXxxEh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/gup.c:114:49: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static bool stabilise_mapping_rcu(struct folio *)
                                                   ^
   1 warning generated.


vim +114 mm/gup.c

   108	
   109	static void unlock_rcu(void)
   110	{
   111		rcu_read_unlock();
   112	}
   113	#else
 > 114	static bool stabilise_mapping_rcu(struct folio *)
   115	{
   116		return true;
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

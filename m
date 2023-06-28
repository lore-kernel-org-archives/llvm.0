Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A28215A4;
	Wed, 28 Jun 2023 02:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687917636; x=1719453636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eAtorlL9hKbOWTYbIFentcep4Cr94YB9cjfXVwCiIj8=;
  b=H72jGYaRVSMf/RBdFVdgRm33QcUpSW9asBFokfceIL3nb25+3SIFcLue
   evoGEUSAr+X4i9W6XCmwwCUfqvoQUUdcPea02KWmvEQPCvKgFH1gBGjpV
   oJWf00Ez2t18CG9N8jF+byxFFTOtcXcwzyZBGHqvfCdM1WxuOfdQrnkdx
   Ku7VqIPQa1Mq1gAslaCqEPKhcLcw7BFo8xV2NewytjZrvpPkGQwcrPghh
   bd/VVaFLpe5UUjUoevgDtDlYMXUALl4uDonGPTTtdq/ArDH9lZJYSSuXz
   YNpca0nk3WPtsi8M5YKZyU3OT4Ou6RNgPp5p+dkjt9T+/+ELFVs0A+Um+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361768852"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="361768852"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 19:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="694106856"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="694106856"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Jun 2023 19:00:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEKTu-000CSr-2O;
	Wed, 28 Jun 2023 02:00:30 +0000
Date: Wed, 28 Jun 2023 10:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	virtualization@lists.linux-foundation.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Oscar Salvador <osalvador@suse.de>, Michal Hocko <mhocko@suse.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v1 3/5] mm/memory_hotplug: make
 offline_and_remove_memory() timeout instead of failing on fatal signals
Message-ID: <202306280935.dKTWlHFD-lkp@intel.com>
References: <20230627112220.229240-4-david@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627112220.229240-4-david@redhat.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6995e2de6891c724bfeb2db33d7b87775f913ad1]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/mm-memory_hotplug-check-for-fatal-signals-only-in-offline_pages/20230627-192444
base:   6995e2de6891c724bfeb2db33d7b87775f913ad1
patch link:    https://lore.kernel.org/r/20230627112220.229240-4-david%40redhat.com
patch subject: [PATCH v1 3/5] mm/memory_hotplug: make offline_and_remove_memory() timeout instead of failing on fatal signals
config: x86_64-randconfig-x006-20230627 (https://download.01.org/0day-ci/archive/20230628/202306280935.dKTWlHFD-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306280935.dKTWlHFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306280935.dKTWlHFD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory_hotplug.c:163:13: warning: unused variable 'mhp_offlining_timer_active' [-Wunused-variable]
   static bool mhp_offlining_timer_active;
               ^
   mm/memory_hotplug.c:166:13: warning: unused function 'mhp_offline_timer_fn' [-Wunused-function]
   static void mhp_offline_timer_fn(struct timer_list *unused)
               ^
   2 warnings generated.


vim +/mhp_offlining_timer_active +163 mm/memory_hotplug.c

   154	
   155	/*
   156	 * Protected by the device hotplug lock: offline_and_remove_memory()
   157	 * will activate a timer such that offlining cannot be stuck forever.
   158	 *
   159	 * With an active timer, fatal signals will be ignored, because they can be
   160	 * counter-productive when dying user space triggers device unplug/driver
   161	 * unloading that ends up offlining+removing device memory.
   162	 */
 > 163	static bool mhp_offlining_timer_active;
   164	static atomic_t mhp_offlining_timer_expired;
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

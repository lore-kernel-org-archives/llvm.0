Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62259A48
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663605891; x=1695141891;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EZewErbpnJoVBfLJL/c/JW4xu0UtQOz7YRXGFLIeHj8=;
  b=aGmwfTBJ4wq/hQmBeAZtDR4iuPRYf5YviL8prSQIeHxYTg5kwqo0VkrQ
   /Av0eLtMo3UzHd0C6MCkNrqjXTRqBKHrgY0crZVweRJHIaKUDC4USe39i
   Xvh/5IN8guHRDJcy9HwTzextOOOG7AgZvVac3VUfZHEv91cego3e65X3X
   IRc1Y3HVODBBaeEaij6y6uvbYR6xG/EHxd74nT3jxt0DGDLO/XF/JWqD6
   EP41a7HMp7Eb1A89EQpU534F+YnbaTdxlDtCvO8xb+NNrm7glW+mQAI6R
   HN9JDuuywL022l4OV9Fr+QTATG5fvy6YcUsXK3dCQ+YZsfHj1L/kuX0lv
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="361190747"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="361190747"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 09:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="596154581"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Sep 2022 09:44:46 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaJsz-00026H-2f;
	Mon, 19 Sep 2022 16:44:45 +0000
Date: Tue, 20 Sep 2022 00:43:46 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Shixin <liushixin2@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Liu Shixin <liushixin2@huawei.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH 4/9] mm/mmap: use hotplug_memory_notifier() directly
Message-ID: <202209200009.uVNUOZp9-lkp@intel.com>
References: <20220919083152.1824305-5-liushixin2@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919083152.1824305-5-liushixin2@huawei.com>

Hi Liu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Liu-Shixin/mm-Use-hotplug_memory_notifier-instead-of-register_hotmemory_notifier/20220919-160043
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: arm64-randconfig-r036-20220919 (https://download.01.org/0day-ci/archive/20220920/202209200009.uVNUOZp9-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/f147c36bfc42b2f7ee738305544169ddeae003e8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Liu-Shixin/mm-Use-hotplug_memory_notifier-instead-of-register_hotmemory_notifier/20220919-160043
        git checkout f147c36bfc42b2f7ee738305544169ddeae003e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/mmap.c:3749:30: error: expected identifier or '('
           if (hotplug_memory_notifier(&reserve_mem_notifier, 0))
                                       ^
>> mm/mmap.c:3749:6: error: use of undeclared identifier 'reserve_mem_notifier_mem_nb'
           if (hotplug_memory_notifier(&reserve_mem_notifier, 0))
               ^
   include/linux/memory.h:167:28: note: expanded from macro 'hotplug_memory_notifier'
           register_memory_notifier(&fn##_mem_nb);                 \
                                     ^
   <scratch space>:58:1: note: expanded from here
   reserve_mem_notifier_mem_nb
   ^
   2 errors generated.


vim +3749 mm/mmap.c

  3746	
  3747	static int __meminit init_reserve_notifier(void)
  3748	{
> 3749		if (hotplug_memory_notifier(&reserve_mem_notifier, 0))

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

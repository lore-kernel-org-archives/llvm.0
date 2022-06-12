Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CF17C
	for <llvm@lists.linux.dev>; Sun, 12 Jun 2022 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655051595; x=1686587595;
  h=date:from:cc:subject:message-id:mime-version;
  bh=K/M4bUDUHwO6lkaJH+M/rcNeRBg5xEGd5OXppwSYf5E=;
  b=jQlR6cyufHmolQ39RItlBj9jQmKz6LIUCwIqSpKeBJ6MP53Vf/mAwwEA
   SMYxYqO3bMKmeIG3tdQOgqap76yAvcUyiO3W+BY5LYYhqBbUuhLn1wj+c
   8Znvi5+4gwKW2BTzO9lnr4+i2+WyDmAE3PZCMG0SvgfU8iGC/B+tVLEct
   FZ8VoRVMbYi9TZlXku11DNRtm85YCTKtnLllZDeyMunpBvjZy3uLoxo4m
   7Q4/y7mxlDjsUd7xI+cDipyua13CWEPoZWXNWz5dMXfc+3lI2U6Qkxaix
   v0+5KrzarPRuhxO1m7UONcAkt14JP3WvJfkZ0gH8nK5x5N5gb37woAd6X
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="258508093"
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="258508093"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2022 09:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="567557761"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jun 2022 09:33:13 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0QWW-000K3n-T9;
	Sun, 12 Jun 2022 16:33:12 +0000
Date: Mon, 13 Jun 2022 00:33:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [PATCH v6 05/13] mm/demotion: Build demotion targets based on
 explicit memory tiers
Message-ID: <202206130019.hvS3Yhx7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
In-Reply-To: <20220610135229.182859-6-aneesh.kumar@linux.ibm.com>
References: <20220610135229.182859-6-aneesh.kumar@linux.ibm.com>
TO: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
TO: linux-mm@kvack.org
TO: akpm@linux-foundation.org
CC: Wei Xu <weixugc@google.com>
CC: Huang Ying <ying.huang@intel.com>
CC: Greg Thelen <gthelen@google.com>
CC: Yang Shi <shy828301@gmail.com>
CC: Davidlohr Bueso <dave@stgolabs.net>
CC: Tim C Chen <tim.c.chen@intel.com>
CC: Brice Goglin <brice.goglin@gmail.com>
CC: Michal Hocko <mhocko@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
CC: Hesham Almatary <hesham.almatary@huawei.com>
CC: Dave Hansen <dave.hansen@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Alistair Popple <apopple@nvidia.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Feng Tang <feng.tang@intel.com>
CC: Jagdish Gediya <jvgediya@linux.ibm.com>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: David Rientjes <rientjes@google.com>
CC: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

Hi "Aneesh,

I love your patch! Perhaps something to improve:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V/mm-demotion-Memory-tiers-and-demotion/20220610-215800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220613/202206130019.hvS3Yhx7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6466c9abf3674bade1f6ee859f24ebc7aaf9cd88)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cd9f240a55298505b22fca3fec423d8972e3199a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Aneesh-Kumar-K-V/mm-demotion-Memory-tiers-and-demotion/20220610-215800
        git checkout cd9f240a55298505b22fca3fec423d8972e3199a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: shrink_node+0xe3f: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

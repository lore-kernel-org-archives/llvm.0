Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1D5185D
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 05:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660713033; x=1692249033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AvafYqkxq3og1b2wyCNF9KJ/y92RWHvhMeHMG1bWo50=;
  b=Ch/b5fOhpKnjZYllM4xRDK54PxWq/c0LFUiU1EmKRcwE1MG8m0DJfHNH
   RPa4n6FWwgi/Ev9YHhoRpKIRZcChwAYWUoVxWH0+ORhO31nETrMabq3A8
   bU/wgBxqnUgzMu+15RGyFbI7BDF4mKcKucDozIibK2bz98ggevVoEJJVJ
   OuqUOw0lEbPOoq6xKjBpYaZhAU/2H0v9PlmLXePkKr/c/lES56sNY2Krt
   fgzFBsmMeoFuZ0FHAduCHSVXUuiiQsCjyEV9UNBdaYwYU6a/BbBREb+gI
   eHTAYkbHWRWiAheTaJ6fOV9yHk1Bu5LT0RWWuBZXz42OspPYQHbyWA39U
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="354146089"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="354146089"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 22:10:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="557976200"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Aug 2022 22:10:11 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oOBJj-0000bM-07;
	Wed, 17 Aug 2022 05:10:11 +0000
Date: Wed, 17 Aug 2022 13:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Atanasov <alexander.atanasov@virtuozzo.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kernel@openvz.org,
	Alexander Atanasov <alexander.atanasov@virtuozzo.com>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drivers: virtio: balloon - update inflated memory
Message-ID: <202208171338.xAU3O9KJ-lkp@intel.com>
References: <20220816094117.3144881-5-alexander.atanasov@virtuozzo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816094117.3144881-5-alexander.atanasov@virtuozzo.com>

Hi Alexander,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on char-misc/char-misc-testing linus/master v6.0-rc1 next-20220816]
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Atanasov/Make-place-for-common-balloon-code/20220816-184943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220817/202208171338.xAU3O9KJ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d37f8ca37c57eb9e68b55ef33ecfce719f98bfe7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexander-Atanasov/Make-place-for-common-balloon-code/20220816-184943
        git checkout d37f8ca37c57eb9e68b55ef33ecfce719f98bfe7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "balloon_set_inflated_total" [drivers/virtio/virtio_balloon.ko] undefined!
>> ERROR: modpost: "balloon_set_inflated_free" [drivers/virtio/virtio_balloon.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

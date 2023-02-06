Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8CC3C26;
	Mon,  6 Feb 2023 12:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675685817; x=1707221817;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FeYioh6Acn0m6gGvzStZgrQdUvLNuamr9iubwxchJ3M=;
  b=H5jwzeHUhPcdgyFQXnUU7wu03ebE2YrFXMNTH3BqEB63V0IEeM+gb8PG
   ddz7o3MD2lKDrIOK5EE2HdwasWM+fNsjyTu9bOEKAmQjKzIWMmeimmsFK
   vP5FqF9+ipI5rLePavUVh2DL53zN1BCWFt0fcvH5CqE0Nhp81gCkDtVZu
   F7cM7J0BXJKghfV4+THR2VZ1OFWVdDcoj1HtAqq6pQmS+UFz2/o0opdqP
   2qxj41+brHP62Ur6tkkaI6oPgGAQjGaQmQU4jwEZeGqk9tKK7DXyI7cQD
   wIcyOaQ7PW9jBSBrQ132/D6qZAuyVwxbxZ+WV15m6T/2QLgSO1mshakWg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="393789527"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="393789527"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 04:16:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="790417118"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="790417118"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Feb 2023 04:16:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP0QZ-0002X6-0y;
	Mon, 06 Feb 2023 12:16:55 +0000
Date: Mon, 6 Feb 2023 20:16:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 1/25]
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c:4162:6: error: format
 specifies type 'unsigned long' but the argument has type 'size_t' (aka
 'unsigned int')
Message-ID: <202302062055.24gKr6MY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   be535132af28d98d8382ffa03d11c8acd7b5da30
commit: 924fb3ec50f5156d21e4f484358fb36f75b91ca8 [1/25] Merge 6.2-rc7 into usb-next
config: i386-randconfig-a001-20230206 (https://download.01.org/0day-ci/archive/20230206/202302062055.24gKr6MY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=924fb3ec50f5156d21e4f484358fb36f75b91ca8
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 924fb3ec50f5156d21e4f484358fb36f75b91ca8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_execlists_submission.c:4162:6: error: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
                      list_count_nodes(&engine->sched_engine->hold));
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +4162 drivers/gpu/drm/i915/gt/intel_execlists_submission.c

  4150	
  4151	void intel_execlists_dump_active_requests(struct intel_engine_cs *engine,
  4152						  struct i915_request *hung_rq,
  4153						  struct drm_printer *m)
  4154	{
  4155		unsigned long flags;
  4156	
  4157		spin_lock_irqsave(&engine->sched_engine->lock, flags);
  4158	
  4159		intel_engine_dump_active_requests(&engine->sched_engine->requests, hung_rq, m);
  4160	
  4161		drm_printf(m, "\tOn hold?: %lu\n",
> 4162			   list_count_nodes(&engine->sched_engine->hold));
  4163	
  4164		spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
  4165	}
  4166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

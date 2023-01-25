Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CEF10ED;
	Wed, 25 Jan 2023 04:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674620524; x=1706156524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NhOPx0gE0BklEYBntjw2S+n2t7urmONIUgn/cw4sNzQ=;
  b=N7kMwq7wd4OifDaEzAN+VSg1IwEsNIqpM5e/7CiJ+LVQgKgXYyFlmTqg
   I0TXD4SQMu0TwQTV+6x5tRz/NCYWpKoJ1D/ixYd6E2lLXSQZLCYOG0uP6
   hbDIjBP8Byx8vk4oD2eqKuSNjRMxAnEo4iSg6DdJM9WHUAnmxpJM0bs/P
   zUL3ddZ21V4snNvpcxnvLwgOu4Ec0a/LY9+O9w4ybNS24wmPRM7yUWmyX
   BL/A77W/TwEH+RDhnYZ6fvKQe5GGgXa8gvkBTDsPmVFhJ++OqhYetSPch
   aPTCgE9bwkmp8uoKTt1LttRbbmn+gdh6U8vniy5J1h/qFzL2GzPwJws18
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310052480"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="310052480"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 20:21:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="786312481"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="786312481"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Jan 2023 20:21:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKXI5-000720-1T;
	Wed, 25 Jan 2023 04:21:41 +0000
Date: Wed, 25 Jan 2023 12:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: "T.J. Mercier" <tjmercier@google.com>, Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	daniel.vetter@ffwll.ch, android-mm@google.com, jstultz@google.com,
	jeffv@google.com, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, cgroups@vger.kernel.org,
	Hridya Valsaraju <hridya@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] binder: Add flags to relinquish ownership of fds
Message-ID: <202301251234.klClMpZF-lkp@intel.com>
References: <20230123191728.2928839-4-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123191728.2928839-4-tjmercier@google.com>

Hi Mercier",

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 2241ab53cbb5cdb08a6b2d4688feb13971058f65]

url:    https://github.com/intel-lab-lkp/linux/commits/T-J-Mercier/memcg-Track-exported-dma-buffers/20230124-032017
base:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
patch link:    https://lore.kernel.org/r/20230123191728.2928839-4-tjmercier%40google.com
patch subject: [PATCH v2 3/4] binder: Add flags to relinquish ownership of fds
config: x86_64-randconfig-a016-20230123 (https://download.01.org/0day-ci/archive/20230125/202301251234.klClMpZF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/41e80f59d1b70691eefc0490e7f1df800cead9f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review T-J-Mercier/memcg-Track-exported-dma-buffers/20230124-032017
        git checkout 41e80f59d1b70691eefc0490e7f1df800cead9f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dma_buf_transfer_charge
   >>> referenced by binder.c:2280 (drivers/android/binder.c:2280)
   >>>               drivers/android/binder.o:(binder_translate_fd) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

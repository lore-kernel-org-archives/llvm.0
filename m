Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F67138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 21:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652735155; x=1684271155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZYt40Q+PfFSSqQhOuPpZ/jVUPjaP/eVg7/MgNninAro=;
  b=HO3oOj8S6/JvXrTvONXdE7oW1HkUWMW/Lv28Fm3MHYUi+VWj21dlyPZ/
   XMJxefNpJQAM9PYPJkpZEwlJErsiDqubDd/wdJFCNcRZifswXowDZ6n36
   s30YE9yPGGWexM0yYG/ab3e5d9nIHCKxQOFWJBoHdd7ajXUzCNLgfEvEm
   ckdFlpHHmIqXRQC4jC+O56YtTucOwZ31aUWgeq8akzjlhco/MFAF72C7q
   3KYXDo3/aTbx1YT5QatirBR05po1UwUqy90TU4RqrL3z4pW++SdBPqQW+
   VBTkoRP0zN8jhrCQzF9407+vt5kNTvCkhUgXAtz3CKxrJwRpVgB9JwvUk
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="251479236"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="251479236"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 14:05:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="544548627"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 May 2022 14:05:51 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqhuY-0000LC-JA;
	Mon, 16 May 2022 21:05:50 +0000
Date: Tue, 17 May 2022 05:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: Xiubo Li <xiubli@redhat.com>, jlayton@kernel.org,
	viro@zeniv.linux.org.uk
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, idryomov@gmail.com,
	vshankar@redhat.com, ceph-devel@vger.kernel.org, mcgrof@kernel.org,
	akpm@linux-foundation.org, arnd@arndb.de,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo Li <xiubli@redhat.com>
Subject: Re: [PATCH 2/2] ceph: wait the first reply of inflight unlink/rmdir
Message-ID: <202205170402.ez4Z5njh-lkp@intel.com>
References: <20220516122046.40655-3-xiubli@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516122046.40655-3-xiubli@redhat.com>

Hi Xiubo,

I love your patch! Yet something to improve:

[auto build test ERROR on ceph-client/for-linus]
[also build test ERROR on linus/master v5.18-rc7 next-20220516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiubo-Li/ceph-wait-async-unlink-to-finish/20220516-202249
base:   https://github.com/ceph/ceph-client.git for-linus
config: i386-randconfig-a001-20220516 (https://download.01.org/0day-ci/archive/20220517/202205170402.ez4Z5njh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/85d578952d01b70d71fccd86ccb0fdd1dbd0df8b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiubo-Li/ceph-wait-async-unlink-to-finish/20220516-202249
        git checkout 85d578952d01b70d71fccd86ccb0fdd1dbd0df8b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ceph_wait_on_conflict_unlink
   >>> referenced by dir.c
   >>>               ceph/dir.o:(ceph_link) in archive fs/built-in.a
   >>> referenced by dir.c
   >>>               ceph/dir.o:(ceph_symlink) in archive fs/built-in.a
   >>> referenced by dir.c
   >>>               ceph/dir.o:(ceph_mkdir) in archive fs/built-in.a
   >>> referenced 3 more times

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

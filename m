Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED4B28EE
	for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649848215; x=1681384215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ikUuqNwgqvxoQFhY6qHPnt+X97U9cWIPGUZvPDyoX20=;
  b=X++MbdwMlSBU07F7YI8EvFEM3pZPTShlOzUMOUgOK1rvAkukaZFjwiYb
   lSVBVNvZKsrtQrvu7hFoLUxa5+8Ls8gdzHZXdcbv/5nlcA1CU8SnQcF7u
   JGwBUUIdsQtvmZ6vWPXG9HYai9yE0bfU3VGa0TVe9VoBP1QmhH0Qk14l8
   bqlwr9SUykydh//Eqvi6RhtYbDc1l+LtUiCBYxp3wzAUUr9aVu1vnjE8/
   QtFwLn3cLdNdv/QvQl1QEVgbz5p8tAX6nB3kUZdD4nvFPGYzPoLChEFWH
   TBRedQnuxZCNu3RfGAd7GCtwK4nHGFtApQxqwoMUS573qIK5Y+5ea8o6T
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262818728"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="262818728"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 04:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="724860379"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Apr 2022 04:10:13 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neat3-0000F6-1E;
	Wed, 13 Apr 2022 11:10:13 +0000
Date: Wed, 13 Apr 2022 19:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] io_uring: add socket(2) support
Message-ID: <202204131949.Vft3PfEM-lkp@intel.com>
References: <20220412202240.234207-3-axboe@kernel.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412202240.234207-3-axboe@kernel.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jens,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20220412]
[cannot apply to horms-ipvs/master net/master net-next/master linus/master v5.18-rc2 v5.18-rc1 v5.17 v5.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Axboe/Add-io_uring-socket-2-support/20220413-050345
base:    d0c745e7b2d6ce8bcc768b32361ab8ef520821ee
config: arm64-buildonly-randconfig-r001-20220413 (https://download.01.org/0day-ci/archive/20220413/202204131949.Vft3PfEM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8f4e27a291c192076d65f71fcaf34d1b30b892f7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jens-Axboe/Add-io_uring-socket-2-support/20220413-050345
        git checkout 8f4e27a291c192076d65f71fcaf34d1b30b892f7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/io_uring.c:5962:3: error: implicit declaration of function 'io_sock_nolock_set' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   io_sock_nolock_set(file);
                   ^
   1 error generated.


vim +/io_sock_nolock_set +5962 fs/io_uring.c

  5935	
  5936	static int io_socket(struct io_kiocb *req, unsigned int issue_flags)
  5937	{
  5938		struct io_socket *sock = &req->sock;
  5939		bool fixed = !!sock->file_slot;
  5940		struct file *file;
  5941		int ret, fd;
  5942	
  5943		if (!fixed) {
  5944			fd = __get_unused_fd_flags(sock->flags, sock->nofile);
  5945			if (unlikely(fd < 0))
  5946				return fd;
  5947		}
  5948		file = __sys_socket_file(sock->domain, sock->type, sock->protocol);
  5949		if (IS_ERR(file)) {
  5950			if (!fixed)
  5951				put_unused_fd(fd);
  5952			ret = PTR_ERR(file);
  5953			if (ret == -EAGAIN && (issue_flags & IO_URING_F_NONBLOCK))
  5954				return -EAGAIN;
  5955			if (ret == -ERESTARTSYS)
  5956				ret = -EINTR;
  5957			req_set_fail(req);
  5958		} else if (!fixed) {
  5959			fd_install(fd, file);
  5960			ret = fd;
  5961		} else {
> 5962			io_sock_nolock_set(file);
  5963			ret = io_install_fixed_file(req, file, issue_flags,
  5964						    sock->file_slot - 1);
  5965		}
  5966		__io_req_complete(req, issue_flags, ret, 0);
  5967		return 0;
  5968	}
  5969	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

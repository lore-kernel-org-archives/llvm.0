Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406407B
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 23:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654729465; x=1686265465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZuW7d6Hd3qS3fsRXcyOsB5Ocuf1o56M9ckFfDq/pFQk=;
  b=ctZumA4OS8NVNAWF8DvO5VzWSXaUv5J3xREdM+LS2pxxase5xLR9vB8l
   NQzbsOJyxat5XEYs8ncJF42aaWys8w77YKsqoEZXJIGz14DQXlfhgyD5l
   bolzaLPlbSFc3Iqk4Oke4HYIPtYR3dqm7/ItVU9UfU6hX+VaCdGXliO0r
   xJCOfqhRyz1OXInyvKcqEmV83m0W0SL/cnTkQLD4mEn9QEOSXDU1PSHgd
   iE0FRFSCZi3qf1dqpP4dP3nLcKGAq1mOl5LuSgBLDoFPAgkYO24ZlSALm
   0D5jLvCgfKqUWJ6bOVX+tmsfNSygnrq+TOpLKIHhS67v9Wk0H4rbiYMO8
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="277900878"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="277900878"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 16:04:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="609894999"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Jun 2022 16:04:06 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nz4ic-000FD7-0U;
	Wed, 08 Jun 2022 23:04:06 +0000
Date: Thu, 9 Jun 2022 07:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Jason Ekstrand <jason.ekstrand@collabora.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/2] dma-buf: Add an API for exporting sync files (v14)
Message-ID: <202206090608.jRFcxzQE-lkp@intel.com>
References: <20220608152142.14495-2-jason@jlekstrand.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608152142.14495-2-jason@jlekstrand.net>

Hi Jason,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tegra-drm/drm/tegra/for-next]
[cannot apply to drm-tip/drm-tip linus/master v5.19-rc1 next-20220608]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Ekstrand/dma-buf-Add-an-API-for-exporting-sync-files-v15/20220608-232447
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: hexagon-randconfig-r041-20220608 (https://download.01.org/0day-ci/archive/20220609/202206090608.jRFcxzQE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d9d427e1ab310adae7e076f2531d00862d74a120
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jason-Ekstrand/dma-buf-Add-an-API-for-exporting-sync-files-v15/20220608-232447
        git checkout d9d427e1ab310adae7e076f2531d00862d74a120
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:337:22: error: variable has incomplete type 'enum dma_resv_usage'
           enum dma_resv_usage usage;
                               ^
   drivers/dma-buf/dma-buf.c:337:7: note: forward declaration of 'enum dma_resv_usage'
           enum dma_resv_usage usage;
                ^
>> drivers/dma-buf/dma-buf.c:355:10: error: implicit declaration of function 'dma_resv_usage_rw' [-Werror,-Wimplicit-function-declaration]
           usage = dma_resv_usage_rw(arg.flags & DMA_BUF_SYNC_WRITE);
                   ^
>> drivers/dma-buf/dma-buf.c:356:8: error: implicit declaration of function 'dma_resv_get_singleton' [-Werror,-Wimplicit-function-declaration]
           ret = dma_resv_get_singleton(dmabuf->resv, usage, &fence);
                 ^
   3 errors generated.


vim +337 drivers/dma-buf/dma-buf.c

   331	
   332	#if IS_ENABLED(CONFIG_SYNC_FILE)
   333	static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
   334					     void __user *user_data)
   335	{
   336		struct dma_buf_export_sync_file arg;
 > 337		enum dma_resv_usage usage;
   338		struct dma_fence *fence = NULL;
   339		struct sync_file *sync_file;
   340		int fd, ret;
   341	
   342		if (copy_from_user(&arg, user_data, sizeof(arg)))
   343			return -EFAULT;
   344	
   345		if (arg.flags & ~DMA_BUF_SYNC_RW)
   346			return -EINVAL;
   347	
   348		if ((arg.flags & DMA_BUF_SYNC_RW) == 0)
   349			return -EINVAL;
   350	
   351		fd = get_unused_fd_flags(O_CLOEXEC);
   352		if (fd < 0)
   353			return fd;
   354	
 > 355		usage = dma_resv_usage_rw(arg.flags & DMA_BUF_SYNC_WRITE);
 > 356		ret = dma_resv_get_singleton(dmabuf->resv, usage, &fence);
   357		if (ret)
   358			goto err_put_fd;
   359	
   360		if (!fence)
   361			fence = dma_fence_get_stub();
   362	
   363		sync_file = sync_file_create(fence);
   364	
   365		dma_fence_put(fence);
   366	
   367		if (!sync_file) {
   368			ret = -ENOMEM;
   369			goto err_put_fd;
   370		}
   371	
   372		arg.fd = fd;
   373		if (copy_to_user(user_data, &arg, sizeof(arg))) {
   374			ret = -EFAULT;
   375			goto err_put_file;
   376		}
   377	
   378		fd_install(fd, sync_file->file);
   379	
   380		return 0;
   381	
   382	err_put_file:
   383		fput(sync_file->file);
   384	err_put_fd:
   385		put_unused_fd(fd);
   386		return ret;
   387	}
   388	#endif
   389	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

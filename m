Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFF77B
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 04:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649736400; x=1681272400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mf9C6qT7/NO4kJZZHLDFOhQc2xAA3V03tnKvzVhd48s=;
  b=iTahV5uZm7DDy8XDrYlwR4aq2ZPm4UAY55irtou/cE3v8neasgG1vDQx
   NipMuC5K94mfMtHpwpD85iPQnXD1VDrtCefNivacq0SoefoN2oTSbSx8p
   XJU1p16a70384X84oS7QNKSPMjCyW0SKurecFih2KoFsZ5+npEQ4nozxZ
   z0L25kw7WSHGpK1KWNzN/KWWsYqLyIF+siLJzd3iY4biIeZW3Eo8EiKzL
   zMZdKKOhAyH6Yje1u8kl0kl+QA6ETSKA1K/fxQt3tyWG+j/Y4qEJL9YDu
   dXdkauq/g0rElu7++6yjYlbi/pEElUOGhviEJTDniSZFsM8ej6oGqiQi2
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="322716266"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="322716266"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 21:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="507379666"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Apr 2022 21:06:37 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ne7nZ-0002VQ-4w;
	Tue, 12 Apr 2022 04:06:37 +0000
Date: Tue, 12 Apr 2022 12:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Riley <davidriley@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
	Zach Reizner <zachr@chromium.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 4273/6555]
 drivers/gpu/drm/virtio/virtgpu_object.c:176:5: warning: no previous
 prototype for function 'virtio_gpu_dma_buf_to_handle'
Message-ID: <202204121116.G1ASG8mq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: cea7ac75b0485305ef7d58b47c67d4ab82e620a3 [4273/6555] CHROMIUM: drm/virtio: Add interfaces to share dma bufs via virtwl.
config: x86_64-randconfig-a003-20220411 (https://download.01.org/0day-ci/archive/20220412/202204121116.G1ASG8mq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/cea7ac75b0485305ef7d58b47c67d4ab82e620a3
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout cea7ac75b0485305ef7d58b47c67d4ab82e620a3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/virtio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/virtio/virtgpu_object.c:176:5: warning: no previous prototype for function 'virtio_gpu_dma_buf_to_handle' [-Wmissing-prototypes]
   int virtio_gpu_dma_buf_to_handle(struct dma_buf *dma_buf, bool no_wait,
       ^
   drivers/gpu/drm/virtio/virtgpu_object.c:176:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int virtio_gpu_dma_buf_to_handle(struct dma_buf *dma_buf, bool no_wait,
   ^
   static 
   1 warning generated.


vim +/virtio_gpu_dma_buf_to_handle +176 drivers/gpu/drm/virtio/virtgpu_object.c

   175	
 > 176	int virtio_gpu_dma_buf_to_handle(struct dma_buf *dma_buf, bool no_wait,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

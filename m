Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC70F4A02
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 23:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660259601; x=1691795601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cso+kljKDXtgwByuJu5WyCUuLX2kq7rS/XUGJ5gLcsI=;
  b=O1ugOdAy2E2WReKv2OFRDmwO/BdiWYO4u5L13jlfxhUukmD+h0B1GEEx
   6f66NHlvonEbmyrylVJtOWgboFk9Ytb2/tsG4zMq017TWQuwQ3bksQR5p
   TzxkOBoFTAyna/A/2lwxDhuZRr5+UDMEUvQIjlaMyEHp6kIaYD6Im8X9y
   sDw92KwIsoOn8Uy6M/7RI+WqEisGIYUPtP9o+Q828kI3gtwTyURQHnJZ7
   TU4B9HgzzkQTvyF2PR+p0ykOmafxMbrY6Wf/stJsss64b+lczsXFLkWC5
   WiNYjQk4FTGI1tWZzLBGilmZcBtGsJfq/OYWVjkb662k4dAak+pstsw7V
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="292275918"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="292275918"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 16:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="673883992"
Received: from lkp-server02.sh.intel.com (HELO cfab306db114) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2022 16:13:12 -0700
Received: from kbuild by cfab306db114 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMHMV-0000mN-2X;
	Thu, 11 Aug 2022 23:13:11 +0000
Date: Fri, 12 Aug 2022 07:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] virtio_vdpa: support the arg sizes of find_vqs()
Message-ID: <202208120746.SFwH7EXv-lkp@intel.com>
References: <20220810085151.7251-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810085151.7251-1-liubo03@inspur.com>

Hi Bo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19]
[cannot apply to next-20220811]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/virtio_vdpa-support-the-arg-sizes-of-find_vqs/20220810-165406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d4252071b97d2027d246f6a82cbee4d52f618b47
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220812/202208120746.SFwH7EXv-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/49428ec00a2ac66aac1f626fe412aaac952353f3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bo-Liu/virtio_vdpa-support-the-arg-sizes-of-find_vqs/20220810-165406
        git checkout 49428ec00a2ac66aac1f626fe412aaac952353f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/virtio/virtio_vdpa.c:289:27: error: use of undeclared identifier 'sizes'
                                                     names[i], sizes ? sizes[i] : 0,
                                                                       ^
   drivers/virtio/virtio_vdpa.c:289:19: error: use of undeclared identifier 'sizes'
                                                     names[i], sizes ? sizes[i] : 0,
                                                               ^
   2 errors generated.


vim +/sizes +289 drivers/virtio/virtio_vdpa.c

   268	
   269	static int virtio_vdpa_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
   270					struct virtqueue *vqs[],
   271					vq_callback_t *callbacks[],
   272					const char * const names[],
   273					const bool *ctx,
   274					struct irq_affinity *desc)
   275	{
   276		struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vdev);
   277		struct vdpa_device *vdpa = vd_get_vdpa(vdev);
   278		const struct vdpa_config_ops *ops = vdpa->config;
   279		struct vdpa_callback cb;
   280		int i, err, queue_idx = 0;
   281	
   282		for (i = 0; i < nvqs; ++i) {
   283			if (!names[i]) {
   284				vqs[i] = NULL;
   285				continue;
   286			}
   287	
   288			vqs[i] = virtio_vdpa_setup_vq(vdev, queue_idx++, callbacks[i],
 > 289							  names[i], sizes ? sizes[i] : 0,
   290							  ctx ? ctx[i] : false);
   291			if (IS_ERR(vqs[i])) {
   292				err = PTR_ERR(vqs[i]);
   293				goto err_setup_vq;
   294			}
   295		}
   296	
   297		cb.callback = virtio_vdpa_config_cb;
   298		cb.private = vd_dev;
   299		ops->set_config_cb(vdpa, &cb);
   300	
   301		return 0;
   302	
   303	err_setup_vq:
   304		virtio_vdpa_del_vqs(vdev);
   305		return err;
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

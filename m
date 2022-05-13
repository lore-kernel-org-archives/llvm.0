Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2674C3D6A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652456033; x=1683992033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bxCOHTgMjPRivEwKVkz9qMuvmQqtSeJ5mXCRrkbJZ0I=;
  b=S/Fj+D4KgEW7O2L5df/YyKHOA2wb8sJvQrVHaoOBJdQv/5c1TSWVoat9
   qOvE15Mitptwbg56WFk/y6gMQ+M9cRR8KFiupNIEM+VEaxPZtjXmPNuWt
   MNSNAAQsascvtgAZswUGicQopSpVwqkR2IEJ8Y0EyjjW+T/nPNmA7hliO
   lFY6bO3gfhSK9HkDl9bKM7x9adHcUwG7NCak2SyCWxB8li/gVbu2ENhr1
   ImfEcUEuVl6rGLhLmKOQeNcivySL5uaq9fh+uWX05JmKPZ1s+r/U0CzJR
   ea74YbV5oFiUKXulVAzVbzwUjvoNI9uipN7yJYig5QRu1sfWk7pt/0KdN
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="252377596"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="252377596"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 08:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="637325262"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 May 2022 08:33:50 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npXIb-000LsI-Pr;
	Fri, 13 May 2022 15:33:49 +0000
Date: Fri, 13 May 2022 23:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jane Chu <jane.chu@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-nvdimm@lists.01.org, Dan Williams <dan.j.williams@intel.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [nvdimm:libnvdimm-for-next 8/11] fs/fuse/virtio_fs.c:784:19: error:
 incompatible function pointer types initializing 'long (*)(struct dax_device
 *, unsigned long, long, enum dax_access_mode, void **, pfn_t *)' with an
 expression of type 'long (struct dax_device *, unsigned long, long, vo...
Message-ID: <202205132308.wrD99x33-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git libnvdimm-for-next
head:   866f841d312b95a3a0b2de104e8d9c02006e7953
commit: 4676339a70746434e1acb678ffaea164d24dfc9c [8/11] dax: introduce DAX_RECOVERY_WRITE dax access mode
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220513/202205132308.wrD99x33-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git/commit/?id=4676339a70746434e1acb678ffaea164d24dfc9c
        git remote add nvdimm https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git
        git fetch --no-tags nvdimm libnvdimm-for-next
        git checkout 4676339a70746434e1acb678ffaea164d24dfc9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/fuse/virtio_fs.c:775:63: error: too few arguments to function call, expected 6, have 5
           rc = dax_direct_access(dax_dev, pgoff, nr_pages, &kaddr, NULL);
                ~~~~~~~~~~~~~~~~~                                       ^
   include/linux/dax.h:185:6: note: 'dax_direct_access' declared here
   long dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff, long nr_pages,
        ^
>> fs/fuse/virtio_fs.c:784:19: error: incompatible function pointer types initializing 'long (*)(struct dax_device *, unsigned long, long, enum dax_access_mode, void **, pfn_t *)' with an expression of type 'long (struct dax_device *, unsigned long, long, void **, pfn_t *)' [-Werror,-Wincompatible-function-pointer-types]
           .direct_access = virtio_fs_direct_access,
                            ^~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +784 fs/fuse/virtio_fs.c

22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  768  
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  769  static int virtio_fs_zero_page_range(struct dax_device *dax_dev,
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  770  				     pgoff_t pgoff, size_t nr_pages)
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  771  {
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  772  	long rc;
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  773  	void *kaddr;
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  774  
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19 @775  	rc = dax_direct_access(dax_dev, pgoff, nr_pages, &kaddr, NULL);
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  776  	if (rc < 0)
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  777  		return rc;
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  778  	memset(kaddr, 0, nr_pages << PAGE_SHIFT);
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  779  	dax_flush(dax_dev, kaddr, nr_pages << PAGE_SHIFT);
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  780  	return 0;
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  781  }
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  782  
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  783  static const struct dax_operations virtio_fs_dax_ops = {
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19 @784  	.direct_access = virtio_fs_direct_access,
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  785  	.zero_page_range = virtio_fs_zero_page_range,
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  786  };
22f3787e9d95e7 Stefan Hajnoczi 2020-08-19  787  

:::::: The code at line 784 was first introduced by commit
:::::: 22f3787e9d95e72d1f09795f294fb010e2998f43 virtiofs: set up virtio_fs dax_device

:::::: TO: Stefan Hajnoczi <stefanha@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

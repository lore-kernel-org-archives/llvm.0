Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB20E8F6E;
	Mon,  3 Apr 2023 20:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680552522; x=1712088522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KY+e8movsVbN2AE+rqQAZ7aKNk4icNBTSgH572LHEE8=;
  b=IIuKE2nILucj4LRTctlQeoOELKnJ40qKDPtkEibRmwLKJlCjiNjKCULR
   XeYt8n1ascj/RZnXjymLwnU2qcw8XBIDA/Grod2j0UIQZIqeGb6z8whd/
   vEbDDlAGpWXDBZuFbWjo+wviCbwn5NFuTJIX9tM0oRWL/LvVeS+nuYMS/
   lLjdtcb1zILVUq3Bao4fS8129NfVvMfUayPGlXVRjzR9PqdGZgPXiypzv
   +uxfxzeMXAyYnH6R5hK158d+q/w06otNa8NzAoZqTMlMGxgjTO9VUfbfE
   3IN2NxsaR0R+DhkBCho2kpLyEeHIE3DeFb1NRHd96Hizg36UlLltguCiy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330578445"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="330578445"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 13:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="663330386"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="663330386"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Apr 2023 13:08:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjQTl-000Oks-36;
	Mon, 03 Apr 2023 20:08:37 +0000
Date: Tue, 4 Apr 2023 04:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 7/9] fuse: add fuse device
 ioctl(FUSE_DEV_IOC_REINIT)
Message-ID: <202304040311.aS30svxD-lkp@intel.com>
References: <20230403144517.347517-8-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403144517.347517-8-aleksandr.mikhalitsyn@canonical.com>

Hi Alexander,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on c68ea140050e631d24d61b6e399ca8224a4a2219]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Mikhalitsyn/fuse-move-FUSE_DEFAULT_-defines-to-fuse-common-header/20230403-224904
base:   c68ea140050e631d24d61b6e399ca8224a4a2219
patch link:    https://lore.kernel.org/r/20230403144517.347517-8-aleksandr.mikhalitsyn%40canonical.com
patch subject: [RFC PATCH v2 7/9] fuse: add fuse device ioctl(FUSE_DEV_IOC_REINIT)
config: arm-randconfig-r015-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040311.aS30svxD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/64bb2d35a39ce0b44c0154fc882ca8cd1d776bcb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexander-Mikhalitsyn/fuse-move-FUSE_DEFAULT_-defines-to-fuse-common-header/20230403-224904
        git checkout 64bb2d35a39ce0b44c0154fc882ca8cd1d776bcb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash fs/fuse/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304040311.aS30svxD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fuse/dev.c:2412:3: error: expected expression
                   struct fuse_conn *fc;
                   ^
>> fs/fuse/dev.c:2426:4: error: use of undeclared identifier 'fc'
                           fc = fud->fc;
                           ^
   fs/fuse/dev.c:2427:8: error: use of undeclared identifier 'fc'
                           if (fc)
                               ^
   fs/fuse/dev.c:2428:5: error: use of undeclared identifier 'fc'
                                   fc = fuse_conn_get(fc);
                                   ^
   fs/fuse/dev.c:2428:24: error: use of undeclared identifier 'fc'
                                   fc = fuse_conn_get(fc);
                                                      ^
   fs/fuse/dev.c:2431:8: error: use of undeclared identifier 'fc'
                           if (fc) {
                               ^
   fs/fuse/dev.c:2432:28: error: use of undeclared identifier 'fc'
                                   res = fuse_reinit_conn(fc);
                                                          ^
   fs/fuse/dev.c:2433:19: error: use of undeclared identifier 'fc'
                                   fuse_conn_put(fc);
                                                 ^
   8 errors generated.


vim +2412 fs/fuse/dev.c

  2379	
  2380	static long fuse_dev_ioctl(struct file *file, unsigned int cmd,
  2381				   unsigned long arg)
  2382	{
  2383		int res;
  2384		int oldfd;
  2385		struct fuse_dev *fud = NULL;
  2386	
  2387		switch (cmd) {
  2388		case FUSE_DEV_IOC_CLONE:
  2389			res = -EFAULT;
  2390			if (!get_user(oldfd, (__u32 __user *)arg)) {
  2391				struct file *old = fget(oldfd);
  2392	
  2393				res = -EINVAL;
  2394				if (old) {
  2395					/*
  2396					 * Check against file->f_op because CUSE
  2397					 * uses the same ioctl handler.
  2398					 */
  2399					if (old->f_op == file->f_op)
  2400						fud = fuse_get_dev(old);
  2401	
  2402					if (fud) {
  2403						mutex_lock(&fuse_mutex);
  2404						res = fuse_device_clone(fud->fc, file);
  2405						mutex_unlock(&fuse_mutex);
  2406					}
  2407					fput(old);
  2408				}
  2409			}
  2410			break;
  2411		case FUSE_DEV_IOC_REINIT:
> 2412			struct fuse_conn *fc;
  2413	
  2414			if (!checkpoint_restore_ns_capable(file->f_cred->user_ns))
  2415				return -EPERM;
  2416	
  2417			res = -EINVAL;
  2418			fud = fuse_get_dev(file);
  2419	
  2420			/*
  2421			 * Only fuse mounts with an already initialized fuse
  2422			 * connection are supported
  2423			 */
  2424			if (file->f_op == &fuse_dev_operations && fud) {
  2425				mutex_lock(&fuse_mutex);
> 2426				fc = fud->fc;
  2427				if (fc)
  2428					fc = fuse_conn_get(fc);
  2429				mutex_unlock(&fuse_mutex);
  2430	
  2431				if (fc) {
  2432					res = fuse_reinit_conn(fc);
  2433					fuse_conn_put(fc);
  2434				}
  2435			}
  2436			break;
  2437		default:
  2438			res = -ENOTTY;
  2439			break;
  2440		}
  2441		return res;
  2442	}
  2443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

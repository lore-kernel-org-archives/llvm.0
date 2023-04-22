Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C318A7F;
	Sat, 22 Apr 2023 10:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682159864; x=1713695864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8AwCM6Wg1AtxxMng6nySA3ai42uL97jI8NaTtfLIHgA=;
  b=XPNzqpEDgCxqPsA5IOuMfDLt/8rUpiYgbnNfrPDWaFwkHY9/oLWEl8X3
   8lGEWu6yZMDZiMFf7wUJ2+wt3lGKBaiANWzbuGTftXj7ZMu0pNbN1/ay0
   ke58YM0/QBwKyKADTSgqdDchuePTzvoCd3V940NIBDlWMp68N9Hjyo4DG
   8teIVeFDZXG84b81XK77UHWsA/a33nJhkEUE/rDOUNSyo5GmEhBoygI5h
   qZXAzkWZaRKJEWg45QXSetfEG3ccRd680mM/RMuOD3382GMj2G0szpYti
   bfuz+6Ph/d2yTL0byFW7PdohPL3NXouUzm6rAsPHeR8KyOggzvJRty/4h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325744098"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="325744098"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 03:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="816698027"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="816698027"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Apr 2023 03:37:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqAcf-000hFK-2o;
	Sat, 22 Apr 2023 10:37:41 +0000
Date: Sat, 22 Apr 2023 18:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] fs: split off vfs_getdents function of
 getdents64 syscall
Message-ID: <202304221809.YNFmMFTD-lkp@intel.com>
References: <20230422-uring-getdents-v1-1-14c1db36e98c@codewreck.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230422-uring-getdents-v1-1-14c1db36e98c@codewreck.org>

Hi Dominique,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a8f57ae2eb07ab39a6f0ccad60c760743051026]

url:    https://github.com/intel-lab-lkp/linux/commits/Dominique-Martinet/fs-split-off-vfs_getdents-function-of-getdents64-syscall/20230422-164240
base:   6a8f57ae2eb07ab39a6f0ccad60c760743051026
patch link:    https://lore.kernel.org/r/20230422-uring-getdents-v1-1-14c1db36e98c%40codewreck.org
patch subject: [PATCH RFC 1/2] fs: split off vfs_getdents function of getdents64 syscall
config: powerpc-randconfig-r023-20230421 (https://download.01.org/0day-ci/archive/20230422/202304221809.YNFmMFTD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/467765480454254c23e5e98ee66239af7810fdf6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dominique-Martinet/fs-split-off-vfs_getdents-function-of-getdents64-syscall/20230422-164240
        git checkout 467765480454254c23e5e98ee66239af7810fdf6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221809.YNFmMFTD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/readdir.c:361:5: warning: no previous prototype for function 'vfs_getdents' [-Wmissing-prototypes]
   int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
       ^
   fs/readdir.c:361:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
   ^
   static 
   1 warning generated.


vim +/vfs_getdents +361 fs/readdir.c

   353	
   354	
   355	/**
   356	 * vfs_getdents - getdents without fdget
   357	 * @file    : pointer to file struct of directory
   358	 * @dirent  : pointer to user directory structure
   359	 * @count   : size of buffer
   360	 */
 > 361	int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
   362			 unsigned int count)
   363	{
   364		struct getdents_callback64 buf = {
   365			.ctx.actor = filldir64,
   366			.count = count,
   367			.current_dir = dirent
   368		};
   369		int error;
   370	
   371		error = iterate_dir(file, &buf.ctx);
   372		if (error >= 0)
   373			error = buf.error;
   374		if (buf.prev_reclen) {
   375			struct linux_dirent64 __user * lastdirent;
   376			typeof(lastdirent->d_off) d_off = buf.ctx.pos;
   377	
   378			lastdirent = (void __user *) buf.current_dir - buf.prev_reclen;
   379			if (put_user(d_off, &lastdirent->d_off))
   380				error = -EFAULT;
   381			else
   382				error = count - buf.count;
   383		}
   384		return error;
   385	}
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859EA7E0;
	Fri,  3 Mar 2023 00:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677802784; x=1709338784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1qvaxFUR6amwpEZN/48f7oor6QWskfdGAJDBRDtej00=;
  b=gjGkdJceBcj9zzIuaNjcv17svKWKD5UoVot+sr5oM9a2CeumQdL7y74i
   gDD2K8Bh4gRFaG2BpJD5CtK9OyOgMbpo/brWHLXz9d3K0veFKaUGodhVF
   as5A4+FFUQ2zZ1ohEIB+d7fFeazfD1do805jR5fVyEXfQ0SaepBp6bF+e
   JtXpRQxZ9Mb3P+WJLSJsUSp0MJf8QGMfGl78mM8hJhM2Wx3wgtrs1dmgi
   w0t5SwfH21xFa+sSeHtjKV/6B+vXiJ9oeUY8JP8S/08TIjJjIIkoP/d9J
   VpepaG3BszsLGRK6ycPUVFO1xLJlJerQabY3MXDWObsTiomro1J5zRqys
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337216158"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="337216158"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 16:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="799041862"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="799041862"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Mar 2023 16:19:42 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXt9B-00011I-2Z;
	Fri, 03 Mar 2023 00:19:41 +0000
Date: Fri, 3 Mar 2023 08:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: aloktiagi <aloktiagi@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/3] file, epoll: Implement do_replace() and
 eventpoll_replace()
Message-ID: <202303030838.LRAbsGsA-lkp@intel.com>
References: <20230302182207.456311-3-aloktiagi@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302182207.456311-3-aloktiagi@gmail.com>

Hi aloktiagi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kees/for-next/seccomp]
[also build test ERROR on kees/for-next/pstore kees/for-next/kspp linus/master v6.2 next-20230302]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/aloktiagi/file-allow-callers-to-free-the-old-file-descriptor-after-dup2/20230303-022310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/seccomp
patch link:    https://lore.kernel.org/r/20230302182207.456311-3-aloktiagi%40gmail.com
patch subject: [RFC 3/3] file, epoll: Implement do_replace() and eventpoll_replace()
config: arm-randconfig-r014-20230303 (https://download.01.org/0day-ci/archive/20230303/202303030838.LRAbsGsA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/047f007e8195cfe7ed4191b97cf8d2c4ef309f08
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review aloktiagi/file-allow-callers-to-free-the-old-file-descriptor-after-dup2/20230303-022310
        git checkout 047f007e8195cfe7ed4191b97cf8d2c4ef309f08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030838.LRAbsGsA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/file.c:1172:24: error: no member named 'f_ep' in 'struct file'; did you mean 'f_op'?
           if (fdfile && fdfile->f_ep) {
                                 ^~~~
                                 f_op
   include/linux/fs.h:948:32: note: 'f_op' declared here
           const struct file_operations    *f_op;
                                            ^
>> fs/file.c:1173:3: error: call to undeclared function 'eventpoll_replace'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   eventpoll_replace(fdfile, file);
                   ^
   fs/file.c:1173:3: note: did you mean 'eventpoll_release'?
   include/linux/eventpoll.h:85:20: note: 'eventpoll_release' declared here
   static inline void eventpoll_release(struct file *file) {}
                      ^
   2 errors generated.


vim +1172 fs/file.c

  1155	
  1156	static void do_replace(struct files_struct *files,
  1157	        struct file *file, unsigned fd, struct file *fdfile)
  1158	{
  1159		unsigned n = 0;
  1160		struct replace_filefd ffd = {
  1161			.files = files,
  1162			.fd = fd,
  1163			.fdfile = fdfile,
  1164			.file = file
  1165		};
  1166	
  1167		/*
  1168		 * Check if the file referenced by the fd number is linked to the epoll
  1169		 * interface. If yes, replace the reference with the received file in
  1170		 * the epoll interface.
  1171		 */
> 1172		if (fdfile && fdfile->f_ep) {
> 1173			eventpoll_replace(fdfile, file);
  1174		}
  1175		/*
  1176		 * Install the received file in the file descriptor table for all fd
  1177		 * numbers referencing the same file as the one we are trying to
  1178		 * replace. Do not install it for the fd number received since that is
  1179		 * handled in do_dup2()
  1180		 */
  1181		iterate_fd_locked(files, n, do_replace_fd_array, &ffd);
  1182	}
  1183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

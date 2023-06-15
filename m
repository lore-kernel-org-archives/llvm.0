Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D56D15AEF;
	Thu, 15 Jun 2023 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686844180; x=1718380180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QHAwpPDLBnad2rYTFxuWJSJKj5sXgh6TSnP5PSsjbW8=;
  b=Q9Jw3ddQboFTZ5u9cpREOrtyyE6TZanTLaApp/W0ER5STSSm4aQzlOii
   3wFn0e2PfACsp8a2RbpquuVMU2ioNiQfM3bIClkN3jqmCo8OnLKGONuwt
   opPTv/shBsLGkn+EdOg1iNEIeYVwreW6sDD4I5jbj0dVbtJ3FBWelm2IW
   wlQBQnuHykPKtnAa0jPMj8Q/mDRgbGD1cPYpqnuweBY2VMppL+KqhSUn/
   +l3IqQ45xGLSbB1Jhax0ggeMnvlj23W6LsEL+TXwrZTMkpVMyIXAnt6T0
   XSD8jSV85DXGFIVePDTNqp52BhBX8gDfptbNb0WbW6Vrxts8LDkH7T9xM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343680301"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="343680301"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 08:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="712508369"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="712508369"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Jun 2023 08:49:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9pE8-000074-1T;
	Thu, 15 Jun 2023 15:49:36 +0000
Date: Thu, 15 Jun 2023 23:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [stable:linux-4.19.y 2317/9999] fs/select.c:926:12: warning: stack
 frame size (1032) exceeds limit (1024) in 'do_sys_poll'
Message-ID: <202306152308.tdxtNRsg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fangrui,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   c111487599ab513f5a7ae4bb6fedaa077b022ecb
commit: 69c122751164c3c343eea205fd5c3e1d5132f967 [2317/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
config: mips-randconfig-r015-20230614 (https://download.01.org/0day-ci/archive/20230615/202306152308.tdxtNRsg-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=69c122751164c3c343eea205fd5c3e1d5132f967
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 69c122751164c3c343eea205fd5c3e1d5132f967
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306152308.tdxtNRsg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/select.c:594:5: warning: stack frame size (1168) exceeds limit (1024) in 'core_sys_select' [-Wframe-larger-than]
     594 | int core_sys_select(int n, fd_set __user *inp, fd_set __user *outp,
         |     ^
>> fs/select.c:926:12: warning: stack frame size (1032) exceeds limit (1024) in 'do_sys_poll' [-Wframe-larger-than]
     926 | static int do_sys_poll(struct pollfd __user *ufds, unsigned int nfds,
         |            ^
   2 warnings generated.
--
>> net/ceph/messenger.c:2695:12: warning: stack frame size (1232) exceeds limit (1024) in 'try_read' [-Wframe-larger-than]
    2695 | static int try_read(struct ceph_connection *con)
         |            ^
   1 warning generated.
--
   drivers/usb/gadget/function/f_mass_storage.c:953:16: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
     953 |         unsigned long   rc;
         |                         ^
>> drivers/usb/gadget/function/f_mass_storage.c:2445:12: warning: stack frame size (1040) exceeds limit (1024) in 'fsg_main_thread' [-Wframe-larger-than]
    2445 | static int fsg_main_thread(void *common_)
         |            ^
   2 warnings generated.


vim +/do_sys_poll +926 fs/select.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  922  
70674f95c0a2ea Andi Kleen      2006-03-28  923  #define N_STACK_PPS ((sizeof(stack_pps) - sizeof(struct poll_list))  / \
70674f95c0a2ea Andi Kleen      2006-03-28  924  			sizeof(struct pollfd))
70674f95c0a2ea Andi Kleen      2006-03-28  925  
e99ca56ce03dd9 Al Viro         2017-04-08 @926  static int do_sys_poll(struct pollfd __user *ufds, unsigned int nfds,
766b9f928bd5b9 Deepa Dinamani  2016-05-19  927  		struct timespec64 *end_time)
^1da177e4c3f41 Linus Torvalds  2005-04-16  928  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  929  	struct poll_wqueues table;
252e5725cfb55a Oleg Nesterov   2007-10-16  930   	int err = -EFAULT, fdcount, len, size;
30c14e40ed8546 Jes Sorensen    2006-03-31  931  	/* Allocate small arguments on the stack to save memory and be
30c14e40ed8546 Jes Sorensen    2006-03-31  932  	   faster - use long to make sure the buffer is aligned properly
30c14e40ed8546 Jes Sorensen    2006-03-31  933  	   on 64 bit archs to avoid unaligned access */
30c14e40ed8546 Jes Sorensen    2006-03-31  934  	long stack_pps[POLL_STACK_ALLOC/sizeof(long)];
252e5725cfb55a Oleg Nesterov   2007-10-16  935  	struct poll_list *const head = (struct poll_list *)stack_pps;
252e5725cfb55a Oleg Nesterov   2007-10-16  936   	struct poll_list *walk = head;
252e5725cfb55a Oleg Nesterov   2007-10-16  937   	unsigned long todo = nfds;
^1da177e4c3f41 Linus Torvalds  2005-04-16  938  
d554ed895dc8f2 Jiri Slaby      2010-03-05  939  	if (nfds > rlimit(RLIMIT_NOFILE))
^1da177e4c3f41 Linus Torvalds  2005-04-16  940  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  941  
252e5725cfb55a Oleg Nesterov   2007-10-16  942  	len = min_t(unsigned int, nfds, N_STACK_PPS);
252e5725cfb55a Oleg Nesterov   2007-10-16  943  	for (;;) {
252e5725cfb55a Oleg Nesterov   2007-10-16  944  		walk->next = NULL;
252e5725cfb55a Oleg Nesterov   2007-10-16  945  		walk->len = len;
252e5725cfb55a Oleg Nesterov   2007-10-16  946  		if (!len)
252e5725cfb55a Oleg Nesterov   2007-10-16  947  			break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  948  
252e5725cfb55a Oleg Nesterov   2007-10-16  949  		if (copy_from_user(walk->entries, ufds + nfds-todo,
252e5725cfb55a Oleg Nesterov   2007-10-16  950  					sizeof(struct pollfd) * walk->len))
^1da177e4c3f41 Linus Torvalds  2005-04-16  951  			goto out_fds;
^1da177e4c3f41 Linus Torvalds  2005-04-16  952  
252e5725cfb55a Oleg Nesterov   2007-10-16  953  		todo -= walk->len;
252e5725cfb55a Oleg Nesterov   2007-10-16  954  		if (!todo)
252e5725cfb55a Oleg Nesterov   2007-10-16  955  			break;
252e5725cfb55a Oleg Nesterov   2007-10-16  956  
252e5725cfb55a Oleg Nesterov   2007-10-16  957  		len = min(todo, POLLFD_PER_PAGE);
252e5725cfb55a Oleg Nesterov   2007-10-16  958  		size = sizeof(struct poll_list) + sizeof(struct pollfd) * len;
252e5725cfb55a Oleg Nesterov   2007-10-16  959  		walk = walk->next = kmalloc(size, GFP_KERNEL);
252e5725cfb55a Oleg Nesterov   2007-10-16  960  		if (!walk) {
252e5725cfb55a Oleg Nesterov   2007-10-16  961  			err = -ENOMEM;
^1da177e4c3f41 Linus Torvalds  2005-04-16  962  			goto out_fds;
^1da177e4c3f41 Linus Torvalds  2005-04-16  963  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  964  	}
9f72949f679df0 David Woodhouse 2006-01-18  965  
252e5725cfb55a Oleg Nesterov   2007-10-16  966  	poll_initwait(&table);
ccec5ee302d5cb Mateusz Guzik   2016-01-06  967  	fdcount = do_poll(head, &table, end_time);
252e5725cfb55a Oleg Nesterov   2007-10-16  968  	poll_freewait(&table);
^1da177e4c3f41 Linus Torvalds  2005-04-16  969  
252e5725cfb55a Oleg Nesterov   2007-10-16  970  	for (walk = head; walk; walk = walk->next) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  971  		struct pollfd *fds = walk->entries;
^1da177e4c3f41 Linus Torvalds  2005-04-16  972  		int j;
^1da177e4c3f41 Linus Torvalds  2005-04-16  973  
252e5725cfb55a Oleg Nesterov   2007-10-16  974  		for (j = 0; j < walk->len; j++, ufds++)
^1da177e4c3f41 Linus Torvalds  2005-04-16  975  			if (__put_user(fds[j].revents, &ufds->revents))
^1da177e4c3f41 Linus Torvalds  2005-04-16  976  				goto out_fds;
^1da177e4c3f41 Linus Torvalds  2005-04-16  977    	}
252e5725cfb55a Oleg Nesterov   2007-10-16  978  
^1da177e4c3f41 Linus Torvalds  2005-04-16  979  	err = fdcount;
^1da177e4c3f41 Linus Torvalds  2005-04-16  980  out_fds:
252e5725cfb55a Oleg Nesterov   2007-10-16  981  	walk = head->next;
252e5725cfb55a Oleg Nesterov   2007-10-16  982  	while (walk) {
252e5725cfb55a Oleg Nesterov   2007-10-16  983  		struct poll_list *pos = walk;
252e5725cfb55a Oleg Nesterov   2007-10-16  984  		walk = walk->next;
252e5725cfb55a Oleg Nesterov   2007-10-16  985  		kfree(pos);
^1da177e4c3f41 Linus Torvalds  2005-04-16  986  	}
252e5725cfb55a Oleg Nesterov   2007-10-16  987  
^1da177e4c3f41 Linus Torvalds  2005-04-16  988  	return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  989  }
9f72949f679df0 David Woodhouse 2006-01-18  990  

:::::: The code at line 926 was first introduced by commit
:::::: e99ca56ce03dd90991025878152bae8b53484147 move compat select-related syscalls to fs/select.c

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

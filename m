Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB3C742C1;
	Fri, 26 May 2023 10:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685098124; x=1716634124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K3cQ39qdbYc5raP1SoYRiw+70olT9YafeX/JJympAio=;
  b=NWiUtJCu2KTKibL0xzWgnHNSBXm7mvVLEX/P0fkN4A0IYVxPoEhn/kuc
   lLIPsuDDQ4LFFR6zIOSgeQhqadMgDAu5sBII/yNr/VZ3pio97TLBPCub3
   MU25mc7CsmyjEDg4BBf4uAbw/WDwgtVd0D184smNdjLJG1kaZNa1Xcrop
   tkkbb65ejnd+zF6lvupr/hkg3uQE1pvQ5YcCgl11AoFQQzsPwfvqMrdqJ
   TX6oM6gf95A0eWzO6zOxERazf3t2Nfd7brp96Q30PqGXuBXlDt6Ux4DTu
   uFth94V0qnE/AXWftviYWw0shFx/nqxGG6GAtvoWw5ahX9k6dhOlkq5Gb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334526363"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="334526363"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 03:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="951839783"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="951839783"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 May 2023 03:48:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2Uzi-000JGE-13;
	Fri, 26 May 2023 10:48:26 +0000
Date: Fri, 26 May 2023 18:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: aloktiagi <aloktiagi@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v7 2/2] seccomp: replace existing file in the epoll
 interface by a new file injected by the syscall supervisor.
Message-ID: <202305261818.XqOKqvEb-lkp@intel.com>
References: <20230524063933.2339105-2-aloktiagi@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524063933.2339105-2-aloktiagi@gmail.com>

Hi aloktiagi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on kees/for-next/seccomp v6.4-rc3 next-20230525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/aloktiagi/seccomp-replace-existing-file-in-the-epoll-interface-by-a-new-file-injected-by-the-syscall-supervisor/20230524-144337
base:   linus/master
patch link:    https://lore.kernel.org/r/20230524063933.2339105-2-aloktiagi%40gmail.com
patch subject: [RFC v7 2/2] seccomp: replace existing file in the epoll interface by a new file injected by the syscall supervisor.
config: x86_64-buildonly-randconfig-r001-20230525 (https://download.01.org/0day-ci/archive/20230526/202305261818.XqOKqvEb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/190cff52df8da9b0f25db48161a5ed8f93615657
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review aloktiagi/seccomp-replace-existing-file-in-the-epoll-interface-by-a-new-file-injected-by-the-syscall-supervisor/20230524-144337
        git checkout 190cff52df8da9b0f25db48161a5ed8f93615657
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261818.XqOKqvEb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/seccomp.c:1077:10: error: implicit declaration of function 'eventpoll_replace_file' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           ret = eventpoll_replace_file(old_file, addfd->file, addfd->fd);
                                 ^
   kernel/seccomp.c:1077:10: note: did you mean 'eventpoll_release'?
   include/linux/eventpoll.h:69:20: note: 'eventpoll_release' declared here
   static inline void eventpoll_release(struct file *file) {}
                      ^
   kernel/seccomp.c:1086:10: error: implicit declaration of function 'eventpoll_replace_file' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           ret = eventpoll_replace_file(addfd->file, old_file, addfd->fd);
                                 ^
   2 errors generated.


vim +/eventpoll_replace_file +1077 kernel/seccomp.c

  1056	
  1057	static void seccomp_handle_addfd(struct seccomp_kaddfd *addfd, struct seccomp_knotif *n)
  1058	{
  1059		int fd;
  1060		struct file *old_file = NULL;
  1061	
  1062		/*
  1063		 * Remove the notification, and reset the list pointers, indicating
  1064		 * that it has been handled.
  1065		 */
  1066		list_del_init(&addfd->list);
  1067		if (!addfd->setfd)
  1068			fd = receive_fd(addfd->file, addfd->flags);
  1069		else {
  1070			int ret = 0;
  1071			if (addfd->ioctl_flags & SECCOMP_ADDFD_FLAG_REPLACE_REF) {
  1072				old_file = fget(addfd->fd);
  1073				if (!old_file) {
  1074					fd = -EBADF;
  1075					goto error;
  1076				}
> 1077				ret = eventpoll_replace_file(old_file, addfd->file, addfd->fd);
  1078				if (ret < 0) {
  1079					fd = ret;
  1080					goto error;
  1081				}
  1082			}
  1083			fd = receive_fd_replace(addfd->fd, addfd->file, addfd->flags);
  1084			/* In case of error restore all references */
  1085			if (fd < 0 && addfd->ioctl_flags & SECCOMP_ADDFD_FLAG_REPLACE_REF) {
  1086				ret = eventpoll_replace_file(addfd->file, old_file, addfd->fd);
  1087				if (ret < 0) {
  1088					fd = ret;
  1089				}
  1090			}
  1091		}
  1092	error:
  1093		addfd->ret = fd;
  1094	
  1095		if (addfd->ioctl_flags & SECCOMP_ADDFD_FLAG_SEND) {
  1096			/* If we fail reset and return an error to the notifier */
  1097			if (fd < 0) {
  1098				n->state = SECCOMP_NOTIFY_SENT;
  1099			} else {
  1100				/* Return the FD we just added */
  1101				n->flags = 0;
  1102				n->error = 0;
  1103				n->val = fd;
  1104			}
  1105		}
  1106	
  1107		if (old_file)
  1108			fput(old_file);
  1109	
  1110		/*
  1111		 * Mark the notification as completed. From this point, addfd mem
  1112		 * might be invalidated and we can't safely read it anymore.
  1113		 */
  1114		complete(&addfd->completion);
  1115	}
  1116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09747490;
	Wed, 30 Aug 2023 23:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693436851; x=1724972851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QSKYUsFqI+LygtpkrTM9ItsjjZIO3j6QIm+f61dx4hs=;
  b=Urfcq+H8QZ1/aMFLJ47har0U+TqPhmuz7UrEogCcq4DwI/+Bgv1+3KUZ
   YHCWxZUQmb3XVlxmgq97wReG1bvXk9f5zQmzvXJ7jOF0d8xfPJLLPZuBs
   fNi1frFX/oftADGa70NmLavP/SCn45s6VP04A3jTAeYes6VGvDwI2lAPE
   C7Q43OpwR1kkR0YV05Tm12frgeXOclk73GCJqE7K9e+cq/uZ9cAix01YK
   ED3FJ6waTCKGokWuF8jk5nxFWcRIQBDdJkKxqkrDua6LamjwYOCSoNbdA
   mBfU+Vus+u4IVNmNzvPIC7hdA6EkDyqWPun4SZUbNPgYW9ZkcXdXao1It
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360756515"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="360756515"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 16:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="985946636"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="985946636"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2023 16:07:29 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbUHY-000AJL-1I;
	Wed, 30 Aug 2023 23:07:28 +0000
Date: Thu, 31 Aug 2023 07:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctl-next 5/5] kernel/ucount.c:66:2: error: incompatible
 function pointer types initializing 'int (*)(struct inode *, struct file *)'
 with an expression of type 'int (struct inode *, struct file *)'
Message-ID: <202308310731.0LSwarYJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctl-next
head:   5db649a3f876dee97af2da8462e4314424a04675
commit: 5db649a3f876dee97af2da8462e4314424a04675 [5/5] ucounts: Convert user_table to static array [WIP]
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20230831/202308310731.0LSwarYJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310731.0LSwarYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310731.0LSwarYJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/ucount.c:4:
   include/linux/sysctl.h:91:31: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
      91 | ssize_t proc_read_bool(struct file *, char *, size_t *, loff_t *);
         |                               ^
   include/linux/sysctl.h:92:32: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
      92 | ssize_t proc_write_bool(struct file *, char *, size_t *, loff_t *);
         |                                ^
   include/linux/sysctl.h:94:33: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
      94 | ssize_t proc_read_intvec(struct file *, char *, size_t *, loff_t *);
         |                                 ^
   include/linux/sysctl.h:95:34: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
      95 | ssize_t proc_write_intvec(struct file *, char *, size_t *, loff_t *);
         |                                  ^
   include/linux/sysctl.h:97:41: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
      97 | ssize_t proc_read_intvec_jiffies(struct file *, char *, size_t *, loff_t *);
         |                                         ^
   include/linux/sysctl.h:98:42: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
      98 | ssize_t proc_write_intvec_jiffies(struct file *, char *, size_t *, loff_t *);
         |                                          ^
   include/linux/sysctl.h:100:40: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     100 | ssize_t proc_read_intvec_minmax(struct file *, char *, size_t *, loff_t *);
         |                                        ^
   include/linux/sysctl.h:101:41: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     101 | ssize_t proc_write_intvec_minmax(struct file *, char *, size_t *, loff_t *);
         |                                         ^
   include/linux/sysctl.h:103:44: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     103 | ssize_t proc_read_intvec_ms_jiffies(struct file *, char *, size_t *, loff_t *);
         |                                            ^
   include/linux/sysctl.h:104:45: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     104 | ssize_t proc_write_intvec_ms_jiffies(struct file *, char *, size_t *, loff_t *);
         |                                             ^
   include/linux/sysctl.h:106:33: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     106 | ssize_t proc_read_string(struct file *, char *, size_t *, loff_t *);
         |                                 ^
   include/linux/sysctl.h:107:34: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     107 | ssize_t proc_write_string(struct file *, char *, size_t *, loff_t *);
         |                                  ^
   include/linux/sysctl.h:109:39: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     109 | ssize_t proc_read_u8vec_minmax(struct file *, char *, size_t *, loff_t *);
         |                                       ^
   include/linux/sysctl.h:110:40: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     110 | ssize_t proc_write_u8vec_minmax(struct file *, char *, size_t *, loff_t *);
         |                                        ^
   include/linux/sysctl.h:112:34: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     112 | ssize_t proc_read_uintvec(struct file *, char *, size_t *, loff_t *);
         |                                  ^
   include/linux/sysctl.h:113:35: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     113 | ssize_t proc_write_uintvec(struct file *, char *, size_t *, loff_t *);
         |                                   ^
   include/linux/sysctl.h:115:41: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     115 | ssize_t proc_read_uintvec_minmax(struct file *, char *, size_t *, loff_t *);
         |                                         ^
   include/linux/sysctl.h:116:42: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     116 | ssize_t proc_write_uintvec_minmax(struct file *, char *, size_t *, loff_t *);
         |                                          ^
   include/linux/sysctl.h:118:42: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     118 | ssize_t proc_read_ulongvec_minmax(struct file *, char *, size_t *, loff_t *);
         |                                          ^
   include/linux/sysctl.h:119:43: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     119 | ssize_t proc_write_ulongvec_minmax(struct file *, char *, size_t *, loff_t *);
         |                                           ^
   include/linux/sysctl.h:121:53: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     121 | ssize_t proc_read_ulongvec_ms_jiffies_minmax(struct file *, char *, size_t *, loff_t *);
         |                                                     ^
   include/linux/sysctl.h:122:54: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     122 | ssize_t proc_write_ulongvec_ms_jiffies_minmax(struct file *, char *, size_t *, loff_t *);
         |                                                      ^
   include/linux/sysctl.h:181:38: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     181 |         int (*open) (struct inode *, struct file *);
         |                                             ^
   include/linux/sysctl.h:182:41: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     182 |         int (*release) (struct inode *, struct file *);
         |                                                ^
   include/linux/sysctl.h:183:26: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     183 |         ssize_t (*read) (struct file *, char *, size_t *, loff_t *);
         |                                 ^
   include/linux/sysctl.h:184:27: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
     184 |         ssize_t (*write) (struct file *, char *, size_t *, loff_t *);
         |                                  ^
>> kernel/ucount.c:66:2: error: incompatible function pointer types initializing 'int (*)(struct inode *, struct file *)' with an expression of type 'int (struct inode *, struct file *)' [-Wincompatible-function-pointer-types]
      66 |         UCOUNT_ENTRY(SYSCTL_MAX_USER_NAMESPACES, "max_user_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:59:16: note: expanded from macro 'UCOUNT_ENTRY'
      59 |                 .fops.open      = proc_ucount_open,             \
         |                                   ^~~~~~~~~~~~~~~~
   kernel/ucount.c:66:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t *, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long *, long long *)') with an expression of type 'ssize_t (struct file *, char *, size_t *, loff_t *)' (aka 'long (struct file *, char *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
      66 |         UCOUNT_ENTRY(SYSCTL_MAX_USER_NAMESPACES, "max_user_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:60:16: note: expanded from macro 'UCOUNT_ENTRY'
      60 |                 .fops.read      = proc_read_ulongvec_minmax,    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:66:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t *, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long *, long long *)') with an expression of type 'ssize_t (struct file *, char *, size_t *, loff_t *)' (aka 'long (struct file *, char *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
      66 |         UCOUNT_ENTRY(SYSCTL_MAX_USER_NAMESPACES, "max_user_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:61:17: note: expanded from macro 'UCOUNT_ENTRY'
      61 |                 .fops.write     = proc_write_ulongvec_minmax,   \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:67:2: error: incompatible function pointer types initializing 'int (*)(struct inode *, struct file *)' with an expression of type 'int (struct inode *, struct file *)' [-Wincompatible-function-pointer-types]
      67 |         UCOUNT_ENTRY(SYSCTL_MAX_PID_NAMESPACES, "max_pid_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:59:16: note: expanded from macro 'UCOUNT_ENTRY'
      59 |                 .fops.open      = proc_ucount_open,             \
         |                                   ^~~~~~~~~~~~~~~~
   kernel/ucount.c:67:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t *, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long *, long long *)') with an expression of type 'ssize_t (struct file *, char *, size_t *, loff_t *)' (aka 'long (struct file *, char *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
      67 |         UCOUNT_ENTRY(SYSCTL_MAX_PID_NAMESPACES, "max_pid_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:60:16: note: expanded from macro 'UCOUNT_ENTRY'
      60 |                 .fops.read      = proc_read_ulongvec_minmax,    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:67:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t *, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long *, long long *)') with an expression of type 'ssize_t (struct file *, char *, size_t *, loff_t *)' (aka 'long (struct file *, char *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
      67 |         UCOUNT_ENTRY(SYSCTL_MAX_PID_NAMESPACES, "max_pid_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:61:17: note: expanded from macro 'UCOUNT_ENTRY'
      61 |                 .fops.write     = proc_write_ulongvec_minmax,   \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:68:2: error: incompatible function pointer types initializing 'int (*)(struct inode *, struct file *)' with an expression of type 'int (struct inode *, struct file *)' [-Wincompatible-function-pointer-types]
      68 |         UCOUNT_ENTRY(SYSCTL_MAX_UTS_NAMESPACES, "max_uts_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:59:16: note: expanded from macro 'UCOUNT_ENTRY'
      59 |                 .fops.open      = proc_ucount_open,             \
         |                                   ^~~~~~~~~~~~~~~~
   kernel/ucount.c:68:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t *, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long *, long long *)') with an expression of type 'ssize_t (struct file *, char *, size_t *, loff_t *)' (aka 'long (struct file *, char *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
      68 |         UCOUNT_ENTRY(SYSCTL_MAX_UTS_NAMESPACES, "max_uts_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:60:16: note: expanded from macro 'UCOUNT_ENTRY'
      60 |                 .fops.read      = proc_read_ulongvec_minmax,    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:68:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t *, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long *, long long *)') with an expression of type 'ssize_t (struct file *, char *, size_t *, loff_t *)' (aka 'long (struct file *, char *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
      68 |         UCOUNT_ENTRY(SYSCTL_MAX_UTS_NAMESPACES, "max_uts_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:61:17: note: expanded from macro 'UCOUNT_ENTRY'
      61 |                 .fops.write     = proc_write_ulongvec_minmax,   \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:69:2: error: incompatible function pointer types initializing 'int (*)(struct inode *, struct file *)' with an expression of type 'int (struct inode *, struct file *)' [-Wincompatible-function-pointer-types]
      69 |         UCOUNT_ENTRY(SYSCTL_MAX_IPC_NAMESPACES, "max_ipc_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:59:16: note: expanded from macro 'UCOUNT_ENTRY'
      59 |                 .fops.open      = proc_ucount_open,             \
         |                                   ^~~~~~~~~~~~~~~~
   kernel/ucount.c:69:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t *, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long *, long long *)') with an expression of type 'ssize_t (struct file *, char *, size_t *, loff_t *)' (aka 'long (struct file *, char *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
      69 |         UCOUNT_ENTRY(SYSCTL_MAX_IPC_NAMESPACES, "max_ipc_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:60:16: note: expanded from macro 'UCOUNT_ENTRY'
      60 |                 .fops.read      = proc_read_ulongvec_minmax,    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:69:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t *, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long *, long long *)') with an expression of type 'ssize_t (struct file *, char *, size_t *, loff_t *)' (aka 'long (struct file *, char *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
      69 |         UCOUNT_ENTRY(SYSCTL_MAX_IPC_NAMESPACES, "max_ipc_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:61:17: note: expanded from macro 'UCOUNT_ENTRY'
      61 |                 .fops.write     = proc_write_ulongvec_minmax,   \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:70:2: error: incompatible function pointer types initializing 'int (*)(struct inode *, struct file *)' with an expression of type 'int (struct inode *, struct file *)' [-Wincompatible-function-pointer-types]
      70 |         UCOUNT_ENTRY(SYSCTL_MAX_NET_NAMESPACES, "max_net_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:59:16: note: expanded from macro 'UCOUNT_ENTRY'
      59 |                 .fops.open      = proc_ucount_open,             \
         |                                   ^~~~~~~~~~~~~~~~
   kernel/ucount.c:70:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t *, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long *, long long *)') with an expression of type 'ssize_t (struct file *, char *, size_t *, loff_t *)' (aka 'long (struct file *, char *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
      70 |         UCOUNT_ENTRY(SYSCTL_MAX_NET_NAMESPACES, "max_net_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:60:16: note: expanded from macro 'UCOUNT_ENTRY'
      60 |                 .fops.read      = proc_read_ulongvec_minmax,    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:70:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t *, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long *, long long *)') with an expression of type 'ssize_t (struct file *, char *, size_t *, loff_t *)' (aka 'long (struct file *, char *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
      70 |         UCOUNT_ENTRY(SYSCTL_MAX_NET_NAMESPACES, "max_net_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:61:17: note: expanded from macro 'UCOUNT_ENTRY'
      61 |                 .fops.write     = proc_write_ulongvec_minmax,   \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:71:2: error: incompatible function pointer types initializing 'int (*)(struct inode *, struct file *)' with an expression of type 'int (struct inode *, struct file *)' [-Wincompatible-function-pointer-types]
      71 |         UCOUNT_ENTRY(SYSCTL_MAX_MNT_NAMESPACES, "max_mnt_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:59:16: note: expanded from macro 'UCOUNT_ENTRY'
      59 |                 .fops.open      = proc_ucount_open,             \
         |                                   ^~~~~~~~~~~~~~~~
   kernel/ucount.c:71:2: error: incompatible function pointer types initializing 'ssize_t (*)(struct file *, char *, size_t *, loff_t *)' (aka 'long (*)(struct file *, char *, unsigned long *, long long *)') with an expression of type 'ssize_t (struct file *, char *, size_t *, loff_t *)' (aka 'long (struct file *, char *, unsigned long *, long long *)') [-Wincompatible-function-pointer-types]
      71 |         UCOUNT_ENTRY(SYSCTL_MAX_MNT_NAMESPACES, "max_mnt_namespaces"),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:60:16: note: expanded from macro 'UCOUNT_ENTRY'
      60 |                 .fops.read      = proc_read_ulongvec_minmax,    \


vim +66 kernel/ucount.c

    53	
    54	#define UCOUNT_ENTRY(index, name)				\
    55		[index] = {						\
    56			.procname	= name,				\
    57			.maxlen		= sizeof(long),			\
    58			.mode		= 0666,				\
    59			.fops.open	= proc_ucount_open,		\
    60			.fops.read	= proc_read_ulongvec_minmax,	\
    61			.fops.write	= proc_write_ulongvec_minmax,	\
    62			.extra1		= &ue_zero,			\
    63			.extra2		= &ue_int_max,			\
    64		}
    65	static struct ctl_table user_table[] = {
  > 66		UCOUNT_ENTRY(SYSCTL_MAX_USER_NAMESPACES, "max_user_namespaces"),
    67		UCOUNT_ENTRY(SYSCTL_MAX_PID_NAMESPACES, "max_pid_namespaces"),
    68		UCOUNT_ENTRY(SYSCTL_MAX_UTS_NAMESPACES, "max_uts_namespaces"),
    69		UCOUNT_ENTRY(SYSCTL_MAX_IPC_NAMESPACES, "max_ipc_namespaces"),
    70		UCOUNT_ENTRY(SYSCTL_MAX_NET_NAMESPACES, "max_net_namespaces"),
    71		UCOUNT_ENTRY(SYSCTL_MAX_MNT_NAMESPACES, "max_mnt_namespaces"),
    72		UCOUNT_ENTRY(SYSCTL_MAX_CGROUP_NAMESPACES, "max_cgroup_namespaces"),
    73		UCOUNT_ENTRY(SYSCTL_MAX_TIME_NAMESPACES, "max_time_namespaces"),
    74	#ifdef CONFIG_INOTIFY_USER
    75		UCOUNT_ENTRY(SYSCTL_MAX_INOTIFY_INSTANCES, "max_inotify_instances"),
    76		UCOUNT_ENTRY(SYSCTL_MAX_INOTIFY_WATCHES, "max_inotify_watches"),
    77	#endif
    78	#ifdef CONFIG_FANOTIFY
    79		UCOUNT_ENTRY(SYSCTL_MAX_FANOTIFY_GROUPS, "max_fanotify_groups"),
    80		UCOUNT_ENTRY(SYSCTL_MAX_FANOTIFY_MARKS, "max_fanotify_marks"),
    81	#endif
    82		{ }
    83	};
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1123228EB
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 13:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652189626; x=1683725626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Jwxvy0lF6zdOC5YpLdtlEpjTvTfIRz581mxo7GZSW/I=;
  b=dIvqP0igiQmtVPuMEDq42LunDNsUZ9DefCLpnRmcaqr0eKa9udrPEYza
   obnD6Kc4wl/3Ev5Ol3mqNOD3xy3ECWFx+oPkXz6wqkteF+lz7oPIf2OPe
   VlKvPkcOLFmfn/qOr0sQ+pm4rzsoz/d2T0X5ZpMcQMlWtTz+4mayyA1Mi
   NTUtE1a0m13H03LZvW8UTsVWLMNvieYkjm1pLH2JZ3nSsAQ9jQVB0plAd
   b36sJs/UHmP3wX0iwE92q8RJwDZkyg3xdV6FegpIdLU7Iz6fa/JQJQ9Wa
   CJVbhGVq49XXiK8Do8v7QyZ7yz6lxxAPimNupqxIHOOde2kKhvXMnIKb2
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249903956"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="249903956"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 06:33:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="541780311"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 May 2022 06:33:43 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noPzi-000Hwo-Kw;
	Tue, 10 May 2022 13:33:42 +0000
Date: Tue, 10 May 2022 21:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: Francis Laniel <flaniel@linux.microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v1 1/1] arm64: Forget syscall if different from
 execve*()
Message-ID: <202205102109.zw0DOonE-lkp@intel.com>
References: <20220509151958.441240-2-flaniel@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220509151958.441240-2-flaniel@linux.microsoft.com>

Hi Francis,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on arm/for-next kvmarm/next soc/for-next xilinx-xlnx/master v5.18-rc6 next-20220509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Francis-Laniel/Call-forget_syscall-if-different-than-execve/20220509-232317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220510/202205102109.zw0DOonE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3abb68a626160e019c30a4860e569d7bc75e486a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/305717b29c76677b4f8a33adaa9fa36a9edbc35b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Francis-Laniel/Call-forget_syscall-if-different-than-execve/20220509-232317
        git checkout 305717b29c76677b4f8a33adaa9fa36a9edbc35b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:13:9: warning: '__NR_restart_syscall' macro redefined [-Wmacro-redefined]
   #define __NR_restart_syscall 0
           ^
   include/uapi/asm-generic/unistd.h:416:9: note: previous definition is here
   #define __NR_restart_syscall 128
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:15:9: warning: '__NR_exit' macro redefined [-Wmacro-redefined]
   #define __NR_exit 1
           ^
   include/uapi/asm-generic/unistd.h:306:9: note: previous definition is here
   #define __NR_exit 93
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:19:9: warning: '__NR_read' macro redefined [-Wmacro-redefined]
   #define __NR_read 3
           ^
   include/uapi/asm-generic/unistd.h:205:9: note: previous definition is here
   #define __NR_read 63
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:21:9: warning: '__NR_write' macro redefined [-Wmacro-redefined]
   #define __NR_write 4
           ^
   include/uapi/asm-generic/unistd.h:207:9: note: previous definition is here
   #define __NR_write 64
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:25:9: warning: '__NR_close' macro redefined [-Wmacro-redefined]
   #define __NR_close 6
           ^
   include/uapi/asm-generic/unistd.h:185:9: note: previous definition is here
   #define __NR_close 57
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:35:9: warning: '__NR_execve' macro redefined [-Wmacro-redefined]
   #define __NR_execve 11
           ^
   include/uapi/asm-generic/unistd.h:642:9: note: previous definition is here
   #define __NR_execve 221
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:37:9: warning: '__NR_chdir' macro redefined [-Wmacro-redefined]
   #define __NR_chdir 12
           ^
   include/uapi/asm-generic/unistd.h:169:9: note: previous definition is here
   #define __NR_chdir 49
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:51:9: warning: '__NR_lseek' macro redefined [-Wmacro-redefined]
   #define __NR_lseek 19
           ^
   include/uapi/asm-generic/unistd.h:908:9: note: previous definition is here
   #define __NR_lseek __NR3264_lseek
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:53:9: warning: '__NR_getpid' macro redefined [-Wmacro-redefined]
   #define __NR_getpid 20
           ^
   include/uapi/asm-generic/unistd.h:521:9: note: previous definition is here
   #define __NR_getpid 172
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:55:9: warning: '__NR_mount' macro redefined [-Wmacro-redefined]
   #define __NR_mount 21
           ^
   include/uapi/asm-generic/unistd.h:142:9: note: previous definition is here
   #define __NR_mount 40
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:59:9: warning: '__NR_setuid' macro redefined [-Wmacro-redefined]
   #define __NR_setuid 23
           ^
   include/uapi/asm-generic/unistd.h:458:9: note: previous definition is here
   #define __NR_setuid 146
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:61:9: warning: '__NR_getuid' macro redefined [-Wmacro-redefined]
   #define __NR_getuid 24
           ^
   include/uapi/asm-generic/unistd.h:525:9: note: previous definition is here
   #define __NR_getuid 174
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:65:9: warning: '__NR_ptrace' macro redefined [-Wmacro-redefined]
   #define __NR_ptrace 26
           ^
   include/uapi/asm-generic/unistd.h:385:9: note: previous definition is here
   #define __NR_ptrace 117
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:85:9: warning: '__NR_sync' macro redefined [-Wmacro-redefined]
   #define __NR_sync 36
           ^
   include/uapi/asm-generic/unistd.h:257:9: note: previous definition is here
   #define __NR_sync 81
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:87:9: warning: '__NR_kill' macro redefined [-Wmacro-redefined]
   #define __NR_kill 37
           ^
   include/uapi/asm-generic/unistd.h:418:9: note: previous definition is here
   #define __NR_kill 129
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:95:9: warning: '__NR_dup' macro redefined [-Wmacro-redefined]
   #define __NR_dup 41
           ^
   include/uapi/asm-generic/unistd.h:93:9: note: previous definition is here
   #define __NR_dup 23
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:99:9: warning: '__NR_times' macro redefined [-Wmacro-redefined]
   #define __NR_times 43
           ^
   include/uapi/asm-generic/unistd.h:472:9: note: previous definition is here
   #define __NR_times 153
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:103:9: warning: '__NR_brk' macro redefined [-Wmacro-redefined]
   #define __NR_brk 45
           ^
   include/uapi/asm-generic/unistd.h:624:9: note: previous definition is here
   #define __NR_brk 214
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:105:9: warning: '__NR_setgid' macro redefined [-Wmacro-redefined]
   #define __NR_setgid 46
           ^
   include/uapi/asm-generic/unistd.h:454:9: note: previous definition is here
   #define __NR_setgid 144
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
>> arch/arm64/include/asm/unistd32.h:107:9: warning: '__NR_getgid' macro redefined [-Wmacro-redefined]
   #define __NR_getgid 47
           ^
   include/uapi/asm-generic/unistd.h:529:9: note: previous definition is here
   #define __NR_getgid 176
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:111:9: warning: '__NR_geteuid' macro redefined [-Wmacro-redefined]
   #define __NR_geteuid 49
           ^
   include/uapi/asm-generic/unistd.h:527:9: note: previous definition is here
   #define __NR_geteuid 175
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:113:9: warning: '__NR_getegid' macro redefined [-Wmacro-redefined]
   #define __NR_getegid 50
           ^
   include/uapi/asm-generic/unistd.h:531:9: note: previous definition is here
   #define __NR_getegid 177
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:115:9: warning: '__NR_acct' macro redefined [-Wmacro-redefined]
   #define __NR_acct 51
           ^
   include/uapi/asm-generic/unistd.h:292:9: note: previous definition is here
   #define __NR_acct 89
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:117:9: warning: '__NR_umount2' macro redefined [-Wmacro-redefined]
   #define __NR_umount2 52
           ^
   include/uapi/asm-generic/unistd.h:140:9: note: previous definition is here
   #define __NR_umount2 39
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:121:9: warning: '__NR_ioctl' macro redefined [-Wmacro-redefined]
   #define __NR_ioctl 54
           ^
   include/uapi/asm-generic/unistd.h:109:9: note: previous definition is here
   #define __NR_ioctl 29
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:123:9: warning: '__NR_fcntl' macro redefined [-Wmacro-redefined]
   #define __NR_fcntl 55
           ^
   include/uapi/asm-generic/unistd.h:903:9: note: previous definition is here
   #define __NR_fcntl __NR3264_fcntl
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:127:9: warning: '__NR_setpgid' macro redefined [-Wmacro-redefined]
   #define __NR_setpgid 57
           ^
   include/uapi/asm-generic/unistd.h:474:9: note: previous definition is here
   #define __NR_setpgid 154
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:133:9: warning: '__NR_umask' macro redefined [-Wmacro-redefined]
   #define __NR_umask 60
           ^
   include/uapi/asm-generic/unistd.h:503:9: note: previous definition is here
   #define __NR_umask 166
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:135:9: warning: '__NR_chroot' macro redefined [-Wmacro-redefined]
   #define __NR_chroot 61
           ^
   include/uapi/asm-generic/unistd.h:173:9: note: previous definition is here
   #define __NR_chroot 51
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:141:9: warning: '__NR_getppid' macro redefined [-Wmacro-redefined]
   #define __NR_getppid 64
           ^
   include/uapi/asm-generic/unistd.h:523:9: note: previous definition is here
   #define __NR_getppid 173
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:145:9: warning: '__NR_setsid' macro redefined [-Wmacro-redefined]
   #define __NR_setsid 66
           ^
   include/uapi/asm-generic/unistd.h:480:9: note: previous definition is here
   #define __NR_setsid 157
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:153:9: warning: '__NR_setreuid' macro redefined [-Wmacro-redefined]
   #define __NR_setreuid 70
           ^
   include/uapi/asm-generic/unistd.h:456:9: note: previous definition is here
   #define __NR_setreuid 145
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:155:9: warning: '__NR_setregid' macro redefined [-Wmacro-redefined]
   #define __NR_setregid 71
           ^
   include/uapi/asm-generic/unistd.h:452:9: note: previous definition is here
   #define __NR_setregid 143
           ^
   In file included from arch/arm64/kernel/sys32.c:127:
   arch/arm64/include/asm/unistd32.h:161:9: warning: '__NR_sethostname' macro redefined [-Wmacro-redefined]
   #define __NR_sethostname 74
           ^


vim +/__NR_execve +35 arch/arm64/include/asm/unistd32.h

3dd681d944f6d8 Will Deacon        2012-03-05   12  
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @13  #define __NR_restart_syscall 0
f3e5c847ec3d12 Catalin Marinas    2014-01-30   14  __SYSCALL(__NR_restart_syscall, sys_restart_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @15  #define __NR_exit 1
f3e5c847ec3d12 Catalin Marinas    2014-01-30   16  __SYSCALL(__NR_exit, sys_exit)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   17  #define __NR_fork 2
f3e5c847ec3d12 Catalin Marinas    2014-01-30   18  __SYSCALL(__NR_fork, sys_fork)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @19  #define __NR_read 3
f3e5c847ec3d12 Catalin Marinas    2014-01-30   20  __SYSCALL(__NR_read, sys_read)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @21  #define __NR_write 4
f3e5c847ec3d12 Catalin Marinas    2014-01-30   22  __SYSCALL(__NR_write, sys_write)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   23  #define __NR_open 5
f3e5c847ec3d12 Catalin Marinas    2014-01-30   24  __SYSCALL(__NR_open, compat_sys_open)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @25  #define __NR_close 6
f3e5c847ec3d12 Catalin Marinas    2014-01-30   26  __SYSCALL(__NR_close, sys_close)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   27  			/* 7 was sys_waitpid */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   28  __SYSCALL(7, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   29  #define __NR_creat 8
f3e5c847ec3d12 Catalin Marinas    2014-01-30   30  __SYSCALL(__NR_creat, sys_creat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   31  #define __NR_link 9
f3e5c847ec3d12 Catalin Marinas    2014-01-30   32  __SYSCALL(__NR_link, sys_link)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   33  #define __NR_unlink 10
f3e5c847ec3d12 Catalin Marinas    2014-01-30   34  __SYSCALL(__NR_unlink, sys_unlink)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @35  #define __NR_execve 11
f3e5c847ec3d12 Catalin Marinas    2014-01-30   36  __SYSCALL(__NR_execve, compat_sys_execve)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @37  #define __NR_chdir 12
f3e5c847ec3d12 Catalin Marinas    2014-01-30   38  __SYSCALL(__NR_chdir, sys_chdir)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   39  			/* 13 was sys_time */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   40  __SYSCALL(13, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   41  #define __NR_mknod 14
f3e5c847ec3d12 Catalin Marinas    2014-01-30   42  __SYSCALL(__NR_mknod, sys_mknod)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   43  #define __NR_chmod 15
f3e5c847ec3d12 Catalin Marinas    2014-01-30   44  __SYSCALL(__NR_chmod, sys_chmod)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   45  #define __NR_lchown 16
f3e5c847ec3d12 Catalin Marinas    2014-01-30   46  __SYSCALL(__NR_lchown, sys_lchown16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   47  			/* 17 was sys_break */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   48  __SYSCALL(17, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   49  			/* 18 was sys_stat */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   50  __SYSCALL(18, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @51  #define __NR_lseek 19
f3e5c847ec3d12 Catalin Marinas    2014-01-30   52  __SYSCALL(__NR_lseek, compat_sys_lseek)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @53  #define __NR_getpid 20
f3e5c847ec3d12 Catalin Marinas    2014-01-30   54  __SYSCALL(__NR_getpid, sys_getpid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @55  #define __NR_mount 21
028abd9222df0c Christoph Hellwig  2020-09-17   56  __SYSCALL(__NR_mount, sys_mount)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   57  			/* 22 was sys_umount */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   58  __SYSCALL(22, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @59  #define __NR_setuid 23
f3e5c847ec3d12 Catalin Marinas    2014-01-30   60  __SYSCALL(__NR_setuid, sys_setuid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @61  #define __NR_getuid 24
f3e5c847ec3d12 Catalin Marinas    2014-01-30   62  __SYSCALL(__NR_getuid, sys_getuid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   63  			/* 25 was sys_stime */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   64  __SYSCALL(25, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @65  #define __NR_ptrace 26
f3e5c847ec3d12 Catalin Marinas    2014-01-30   66  __SYSCALL(__NR_ptrace, compat_sys_ptrace)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   67  			/* 27 was sys_alarm */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   68  __SYSCALL(27, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   69  			/* 28 was sys_fstat */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   70  __SYSCALL(28, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   71  #define __NR_pause 29
f3e5c847ec3d12 Catalin Marinas    2014-01-30   72  __SYSCALL(__NR_pause, sys_pause)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   73  			/* 30 was sys_utime */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   74  __SYSCALL(30, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   75  			/* 31 was sys_stty */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   76  __SYSCALL(31, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   77  			/* 32 was sys_gtty */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   78  __SYSCALL(32, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   79  #define __NR_access 33
f3e5c847ec3d12 Catalin Marinas    2014-01-30   80  __SYSCALL(__NR_access, sys_access)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   81  #define __NR_nice 34
f3e5c847ec3d12 Catalin Marinas    2014-01-30   82  __SYSCALL(__NR_nice, sys_nice)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   83  			/* 35 was sys_ftime */
f3e5c847ec3d12 Catalin Marinas    2014-01-30   84  __SYSCALL(35, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @85  #define __NR_sync 36
f3e5c847ec3d12 Catalin Marinas    2014-01-30   86  __SYSCALL(__NR_sync, sys_sync)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @87  #define __NR_kill 37
f3e5c847ec3d12 Catalin Marinas    2014-01-30   88  __SYSCALL(__NR_kill, sys_kill)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   89  #define __NR_rename 38
f3e5c847ec3d12 Catalin Marinas    2014-01-30   90  __SYSCALL(__NR_rename, sys_rename)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   91  #define __NR_mkdir 39
f3e5c847ec3d12 Catalin Marinas    2014-01-30   92  __SYSCALL(__NR_mkdir, sys_mkdir)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   93  #define __NR_rmdir 40
f3e5c847ec3d12 Catalin Marinas    2014-01-30   94  __SYSCALL(__NR_rmdir, sys_rmdir)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @95  #define __NR_dup 41
f3e5c847ec3d12 Catalin Marinas    2014-01-30   96  __SYSCALL(__NR_dup, sys_dup)
f3e5c847ec3d12 Catalin Marinas    2014-01-30   97  #define __NR_pipe 42
f3e5c847ec3d12 Catalin Marinas    2014-01-30   98  __SYSCALL(__NR_pipe, sys_pipe)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  @99  #define __NR_times 43
f3e5c847ec3d12 Catalin Marinas    2014-01-30  100  __SYSCALL(__NR_times, compat_sys_times)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  101  			/* 44 was sys_prof */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  102  __SYSCALL(44, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @103  #define __NR_brk 45
f3e5c847ec3d12 Catalin Marinas    2014-01-30  104  __SYSCALL(__NR_brk, sys_brk)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @105  #define __NR_setgid 46
f3e5c847ec3d12 Catalin Marinas    2014-01-30  106  __SYSCALL(__NR_setgid, sys_setgid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @107  #define __NR_getgid 47
f3e5c847ec3d12 Catalin Marinas    2014-01-30  108  __SYSCALL(__NR_getgid, sys_getgid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  109  			/* 48 was sys_signal */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  110  __SYSCALL(48, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @111  #define __NR_geteuid 49
f3e5c847ec3d12 Catalin Marinas    2014-01-30  112  __SYSCALL(__NR_geteuid, sys_geteuid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @113  #define __NR_getegid 50
f3e5c847ec3d12 Catalin Marinas    2014-01-30  114  __SYSCALL(__NR_getegid, sys_getegid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @115  #define __NR_acct 51
f3e5c847ec3d12 Catalin Marinas    2014-01-30  116  __SYSCALL(__NR_acct, sys_acct)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @117  #define __NR_umount2 52
f3e5c847ec3d12 Catalin Marinas    2014-01-30  118  __SYSCALL(__NR_umount2, sys_umount)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  119  			/* 53 was sys_lock */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  120  __SYSCALL(53, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @121  #define __NR_ioctl 54
f3e5c847ec3d12 Catalin Marinas    2014-01-30  122  __SYSCALL(__NR_ioctl, compat_sys_ioctl)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @123  #define __NR_fcntl 55
f3e5c847ec3d12 Catalin Marinas    2014-01-30  124  __SYSCALL(__NR_fcntl, compat_sys_fcntl)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  125  			/* 56 was sys_mpx */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  126  __SYSCALL(56, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @127  #define __NR_setpgid 57
f3e5c847ec3d12 Catalin Marinas    2014-01-30  128  __SYSCALL(__NR_setpgid, sys_setpgid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  129  			/* 58 was sys_ulimit */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  130  __SYSCALL(58, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  131  			/* 59 was sys_olduname */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  132  __SYSCALL(59, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @133  #define __NR_umask 60
f3e5c847ec3d12 Catalin Marinas    2014-01-30  134  __SYSCALL(__NR_umask, sys_umask)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @135  #define __NR_chroot 61
f3e5c847ec3d12 Catalin Marinas    2014-01-30  136  __SYSCALL(__NR_chroot, sys_chroot)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  137  #define __NR_ustat 62
f3e5c847ec3d12 Catalin Marinas    2014-01-30  138  __SYSCALL(__NR_ustat, compat_sys_ustat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  139  #define __NR_dup2 63
f3e5c847ec3d12 Catalin Marinas    2014-01-30  140  __SYSCALL(__NR_dup2, sys_dup2)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @141  #define __NR_getppid 64
f3e5c847ec3d12 Catalin Marinas    2014-01-30  142  __SYSCALL(__NR_getppid, sys_getppid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  143  #define __NR_getpgrp 65
f3e5c847ec3d12 Catalin Marinas    2014-01-30  144  __SYSCALL(__NR_getpgrp, sys_getpgrp)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @145  #define __NR_setsid 66
f3e5c847ec3d12 Catalin Marinas    2014-01-30  146  __SYSCALL(__NR_setsid, sys_setsid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  147  #define __NR_sigaction 67
f3e5c847ec3d12 Catalin Marinas    2014-01-30  148  __SYSCALL(__NR_sigaction, compat_sys_sigaction)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  149  			/* 68 was sys_sgetmask */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  150  __SYSCALL(68, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  151  			/* 69 was sys_ssetmask */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  152  __SYSCALL(69, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @153  #define __NR_setreuid 70
f3e5c847ec3d12 Catalin Marinas    2014-01-30  154  __SYSCALL(__NR_setreuid, sys_setreuid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @155  #define __NR_setregid 71
f3e5c847ec3d12 Catalin Marinas    2014-01-30  156  __SYSCALL(__NR_setregid, sys_setregid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  157  #define __NR_sigsuspend 72
f3e5c847ec3d12 Catalin Marinas    2014-01-30  158  __SYSCALL(__NR_sigsuspend, sys_sigsuspend)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  159  #define __NR_sigpending 73
f3e5c847ec3d12 Catalin Marinas    2014-01-30  160  __SYSCALL(__NR_sigpending, compat_sys_sigpending)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @161  #define __NR_sethostname 74
f3e5c847ec3d12 Catalin Marinas    2014-01-30  162  __SYSCALL(__NR_sethostname, sys_sethostname)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  163  #define __NR_setrlimit 75
f3e5c847ec3d12 Catalin Marinas    2014-01-30  164  __SYSCALL(__NR_setrlimit, compat_sys_setrlimit)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  165  			/* 76 was compat_sys_getrlimit */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  166  __SYSCALL(76, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @167  #define __NR_getrusage 77
f3e5c847ec3d12 Catalin Marinas    2014-01-30  168  __SYSCALL(__NR_getrusage, compat_sys_getrusage)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @169  #define __NR_gettimeofday 78
f3e5c847ec3d12 Catalin Marinas    2014-01-30  170  __SYSCALL(__NR_gettimeofday, compat_sys_gettimeofday)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @171  #define __NR_settimeofday 79
f3e5c847ec3d12 Catalin Marinas    2014-01-30  172  __SYSCALL(__NR_settimeofday, compat_sys_settimeofday)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @173  #define __NR_getgroups 80
f3e5c847ec3d12 Catalin Marinas    2014-01-30  174  __SYSCALL(__NR_getgroups, sys_getgroups16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @175  #define __NR_setgroups 81
f3e5c847ec3d12 Catalin Marinas    2014-01-30  176  __SYSCALL(__NR_setgroups, sys_setgroups16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  177  			/* 82 was compat_sys_select */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  178  __SYSCALL(82, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  179  #define __NR_symlink 83
f3e5c847ec3d12 Catalin Marinas    2014-01-30  180  __SYSCALL(__NR_symlink, sys_symlink)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  181  			/* 84 was sys_lstat */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  182  __SYSCALL(84, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  183  #define __NR_readlink 85
f3e5c847ec3d12 Catalin Marinas    2014-01-30  184  __SYSCALL(__NR_readlink, sys_readlink)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  185  #define __NR_uselib 86
f3e5c847ec3d12 Catalin Marinas    2014-01-30  186  __SYSCALL(__NR_uselib, sys_uselib)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @187  #define __NR_swapon 87
f3e5c847ec3d12 Catalin Marinas    2014-01-30  188  __SYSCALL(__NR_swapon, sys_swapon)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @189  #define __NR_reboot 88
f3e5c847ec3d12 Catalin Marinas    2014-01-30  190  __SYSCALL(__NR_reboot, sys_reboot)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  191  			/* 89 was sys_readdir */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  192  __SYSCALL(89, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  193  			/* 90 was sys_mmap */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  194  __SYSCALL(90, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @195  #define __NR_munmap 91
f3e5c847ec3d12 Catalin Marinas    2014-01-30  196  __SYSCALL(__NR_munmap, sys_munmap)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @197  #define __NR_truncate 92
f3e5c847ec3d12 Catalin Marinas    2014-01-30  198  __SYSCALL(__NR_truncate, compat_sys_truncate)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @199  #define __NR_ftruncate 93
f3e5c847ec3d12 Catalin Marinas    2014-01-30  200  __SYSCALL(__NR_ftruncate, compat_sys_ftruncate)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @201  #define __NR_fchmod 94
f3e5c847ec3d12 Catalin Marinas    2014-01-30  202  __SYSCALL(__NR_fchmod, sys_fchmod)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @203  #define __NR_fchown 95
f3e5c847ec3d12 Catalin Marinas    2014-01-30  204  __SYSCALL(__NR_fchown, sys_fchown16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @205  #define __NR_getpriority 96
f3e5c847ec3d12 Catalin Marinas    2014-01-30  206  __SYSCALL(__NR_getpriority, sys_getpriority)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @207  #define __NR_setpriority 97
f3e5c847ec3d12 Catalin Marinas    2014-01-30  208  __SYSCALL(__NR_setpriority, sys_setpriority)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  209  			/* 98 was sys_profil */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  210  __SYSCALL(98, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @211  #define __NR_statfs 99
f3e5c847ec3d12 Catalin Marinas    2014-01-30  212  __SYSCALL(__NR_statfs, compat_sys_statfs)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @213  #define __NR_fstatfs 100
f3e5c847ec3d12 Catalin Marinas    2014-01-30  214  __SYSCALL(__NR_fstatfs, compat_sys_fstatfs)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  215  			/* 101 was sys_ioperm */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  216  __SYSCALL(101, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  217  			/* 102 was sys_socketcall */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  218  __SYSCALL(102, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @219  #define __NR_syslog 103
f3e5c847ec3d12 Catalin Marinas    2014-01-30  220  __SYSCALL(__NR_syslog, sys_syslog)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @221  #define __NR_setitimer 104
f3e5c847ec3d12 Catalin Marinas    2014-01-30  222  __SYSCALL(__NR_setitimer, compat_sys_setitimer)
f3e5c847ec3d12 Catalin Marinas    2014-01-30 @223  #define __NR_getitimer 105
f3e5c847ec3d12 Catalin Marinas    2014-01-30  224  __SYSCALL(__NR_getitimer, compat_sys_getitimer)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  225  #define __NR_stat 106
f3e5c847ec3d12 Catalin Marinas    2014-01-30  226  __SYSCALL(__NR_stat, compat_sys_newstat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  227  #define __NR_lstat 107
f3e5c847ec3d12 Catalin Marinas    2014-01-30  228  __SYSCALL(__NR_lstat, compat_sys_newlstat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  229  #define __NR_fstat 108
f3e5c847ec3d12 Catalin Marinas    2014-01-30  230  __SYSCALL(__NR_fstat, compat_sys_newfstat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  231  			/* 109 was sys_uname */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  232  __SYSCALL(109, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  233  			/* 110 was sys_iopl */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  234  __SYSCALL(110, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  235  #define __NR_vhangup 111
f3e5c847ec3d12 Catalin Marinas    2014-01-30  236  __SYSCALL(__NR_vhangup, sys_vhangup)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  237  			/* 112 was sys_idle */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  238  __SYSCALL(112, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  239  			/* 113 was sys_syscall */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  240  __SYSCALL(113, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  241  #define __NR_wait4 114
f3e5c847ec3d12 Catalin Marinas    2014-01-30  242  __SYSCALL(__NR_wait4, compat_sys_wait4)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  243  #define __NR_swapoff 115
f3e5c847ec3d12 Catalin Marinas    2014-01-30  244  __SYSCALL(__NR_swapoff, sys_swapoff)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  245  #define __NR_sysinfo 116
f3e5c847ec3d12 Catalin Marinas    2014-01-30  246  __SYSCALL(__NR_sysinfo, compat_sys_sysinfo)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  247  			/* 117 was sys_ipc */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  248  __SYSCALL(117, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  249  #define __NR_fsync 118
f3e5c847ec3d12 Catalin Marinas    2014-01-30  250  __SYSCALL(__NR_fsync, sys_fsync)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  251  #define __NR_sigreturn 119
3085e1645e2388 Mark Rutland       2018-07-11  252  __SYSCALL(__NR_sigreturn, compat_sys_sigreturn)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  253  #define __NR_clone 120
f3e5c847ec3d12 Catalin Marinas    2014-01-30  254  __SYSCALL(__NR_clone, sys_clone)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  255  #define __NR_setdomainname 121
f3e5c847ec3d12 Catalin Marinas    2014-01-30  256  __SYSCALL(__NR_setdomainname, sys_setdomainname)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  257  #define __NR_uname 122
f3e5c847ec3d12 Catalin Marinas    2014-01-30  258  __SYSCALL(__NR_uname, sys_newuname)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  259  			/* 123 was sys_modify_ldt */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  260  __SYSCALL(123, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  261  #define __NR_adjtimex 124
8dabe7245bbc13 Arnd Bergmann      2019-01-07  262  __SYSCALL(__NR_adjtimex, sys_adjtimex_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  263  #define __NR_mprotect 125
f3e5c847ec3d12 Catalin Marinas    2014-01-30  264  __SYSCALL(__NR_mprotect, sys_mprotect)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  265  #define __NR_sigprocmask 126
f3e5c847ec3d12 Catalin Marinas    2014-01-30  266  __SYSCALL(__NR_sigprocmask, compat_sys_sigprocmask)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  267  			/* 127 was sys_create_module */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  268  __SYSCALL(127, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  269  #define __NR_init_module 128
f3e5c847ec3d12 Catalin Marinas    2014-01-30  270  __SYSCALL(__NR_init_module, sys_init_module)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  271  #define __NR_delete_module 129
f3e5c847ec3d12 Catalin Marinas    2014-01-30  272  __SYSCALL(__NR_delete_module, sys_delete_module)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  273  			/* 130 was sys_get_kernel_syms */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  274  __SYSCALL(130, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  275  #define __NR_quotactl 131
f3e5c847ec3d12 Catalin Marinas    2014-01-30  276  __SYSCALL(__NR_quotactl, sys_quotactl)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  277  #define __NR_getpgid 132
f3e5c847ec3d12 Catalin Marinas    2014-01-30  278  __SYSCALL(__NR_getpgid, sys_getpgid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  279  #define __NR_fchdir 133
f3e5c847ec3d12 Catalin Marinas    2014-01-30  280  __SYSCALL(__NR_fchdir, sys_fchdir)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  281  #define __NR_bdflush 134
b48c7236b13cb5 Eric W. Biederman  2021-06-29  282  __SYSCALL(__NR_bdflush, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  283  #define __NR_sysfs 135
f3e5c847ec3d12 Catalin Marinas    2014-01-30  284  __SYSCALL(__NR_sysfs, sys_sysfs)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  285  #define __NR_personality 136
f3e5c847ec3d12 Catalin Marinas    2014-01-30  286  __SYSCALL(__NR_personality, sys_personality)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  287  			/* 137 was sys_afs_syscall */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  288  __SYSCALL(137, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  289  #define __NR_setfsuid 138
f3e5c847ec3d12 Catalin Marinas    2014-01-30  290  __SYSCALL(__NR_setfsuid, sys_setfsuid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  291  #define __NR_setfsgid 139
f3e5c847ec3d12 Catalin Marinas    2014-01-30  292  __SYSCALL(__NR_setfsgid, sys_setfsgid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  293  #define __NR__llseek 140
f3e5c847ec3d12 Catalin Marinas    2014-01-30  294  __SYSCALL(__NR__llseek, sys_llseek)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  295  #define __NR_getdents 141
f3e5c847ec3d12 Catalin Marinas    2014-01-30  296  __SYSCALL(__NR_getdents, compat_sys_getdents)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  297  #define __NR__newselect 142
f3e5c847ec3d12 Catalin Marinas    2014-01-30  298  __SYSCALL(__NR__newselect, compat_sys_select)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  299  #define __NR_flock 143
f3e5c847ec3d12 Catalin Marinas    2014-01-30  300  __SYSCALL(__NR_flock, sys_flock)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  301  #define __NR_msync 144
f3e5c847ec3d12 Catalin Marinas    2014-01-30  302  __SYSCALL(__NR_msync, sys_msync)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  303  #define __NR_readv 145
5f764d624a89d4 Christoph Hellwig  2020-09-25  304  __SYSCALL(__NR_readv, sys_readv)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  305  #define __NR_writev 146
5f764d624a89d4 Christoph Hellwig  2020-09-25  306  __SYSCALL(__NR_writev, sys_writev)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  307  #define __NR_getsid 147
f3e5c847ec3d12 Catalin Marinas    2014-01-30  308  __SYSCALL(__NR_getsid, sys_getsid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  309  #define __NR_fdatasync 148
f3e5c847ec3d12 Catalin Marinas    2014-01-30  310  __SYSCALL(__NR_fdatasync, sys_fdatasync)
88db0aa2421666 Xiaoming Ni        2020-08-14  311  			/* 149 was sys_sysctl */
88db0aa2421666 Xiaoming Ni        2020-08-14  312  __SYSCALL(149, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  313  #define __NR_mlock 150
f3e5c847ec3d12 Catalin Marinas    2014-01-30  314  __SYSCALL(__NR_mlock, sys_mlock)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  315  #define __NR_munlock 151
f3e5c847ec3d12 Catalin Marinas    2014-01-30  316  __SYSCALL(__NR_munlock, sys_munlock)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  317  #define __NR_mlockall 152
f3e5c847ec3d12 Catalin Marinas    2014-01-30  318  __SYSCALL(__NR_mlockall, sys_mlockall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  319  #define __NR_munlockall 153
f3e5c847ec3d12 Catalin Marinas    2014-01-30  320  __SYSCALL(__NR_munlockall, sys_munlockall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  321  #define __NR_sched_setparam 154
f3e5c847ec3d12 Catalin Marinas    2014-01-30  322  __SYSCALL(__NR_sched_setparam, sys_sched_setparam)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  323  #define __NR_sched_getparam 155
f3e5c847ec3d12 Catalin Marinas    2014-01-30  324  __SYSCALL(__NR_sched_getparam, sys_sched_getparam)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  325  #define __NR_sched_setscheduler 156
f3e5c847ec3d12 Catalin Marinas    2014-01-30  326  __SYSCALL(__NR_sched_setscheduler, sys_sched_setscheduler)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  327  #define __NR_sched_getscheduler 157
f3e5c847ec3d12 Catalin Marinas    2014-01-30  328  __SYSCALL(__NR_sched_getscheduler, sys_sched_getscheduler)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  329  #define __NR_sched_yield 158
f3e5c847ec3d12 Catalin Marinas    2014-01-30  330  __SYSCALL(__NR_sched_yield, sys_sched_yield)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  331  #define __NR_sched_get_priority_max 159
f3e5c847ec3d12 Catalin Marinas    2014-01-30  332  __SYSCALL(__NR_sched_get_priority_max, sys_sched_get_priority_max)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  333  #define __NR_sched_get_priority_min 160
f3e5c847ec3d12 Catalin Marinas    2014-01-30  334  __SYSCALL(__NR_sched_get_priority_min, sys_sched_get_priority_min)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  335  #define __NR_sched_rr_get_interval 161
8dabe7245bbc13 Arnd Bergmann      2019-01-07  336  __SYSCALL(__NR_sched_rr_get_interval, sys_sched_rr_get_interval_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  337  #define __NR_nanosleep 162
8dabe7245bbc13 Arnd Bergmann      2019-01-07  338  __SYSCALL(__NR_nanosleep, sys_nanosleep_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  339  #define __NR_mremap 163
f3e5c847ec3d12 Catalin Marinas    2014-01-30  340  __SYSCALL(__NR_mremap, sys_mremap)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  341  #define __NR_setresuid 164
f3e5c847ec3d12 Catalin Marinas    2014-01-30  342  __SYSCALL(__NR_setresuid, sys_setresuid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  343  #define __NR_getresuid 165
f3e5c847ec3d12 Catalin Marinas    2014-01-30  344  __SYSCALL(__NR_getresuid, sys_getresuid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  345  			/* 166 was sys_vm86 */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  346  __SYSCALL(166, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  347  			/* 167 was sys_query_module */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  348  __SYSCALL(167, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  349  #define __NR_poll 168
f3e5c847ec3d12 Catalin Marinas    2014-01-30  350  __SYSCALL(__NR_poll, sys_poll)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  351  #define __NR_nfsservctl 169
f3e5c847ec3d12 Catalin Marinas    2014-01-30  352  __SYSCALL(__NR_nfsservctl, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  353  #define __NR_setresgid 170
f3e5c847ec3d12 Catalin Marinas    2014-01-30  354  __SYSCALL(__NR_setresgid, sys_setresgid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  355  #define __NR_getresgid 171
f3e5c847ec3d12 Catalin Marinas    2014-01-30  356  __SYSCALL(__NR_getresgid, sys_getresgid16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  357  #define __NR_prctl 172
f3e5c847ec3d12 Catalin Marinas    2014-01-30  358  __SYSCALL(__NR_prctl, sys_prctl)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  359  #define __NR_rt_sigreturn 173
3085e1645e2388 Mark Rutland       2018-07-11  360  __SYSCALL(__NR_rt_sigreturn, compat_sys_rt_sigreturn)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  361  #define __NR_rt_sigaction 174
f3e5c847ec3d12 Catalin Marinas    2014-01-30  362  __SYSCALL(__NR_rt_sigaction, compat_sys_rt_sigaction)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  363  #define __NR_rt_sigprocmask 175
f3e5c847ec3d12 Catalin Marinas    2014-01-30  364  __SYSCALL(__NR_rt_sigprocmask, compat_sys_rt_sigprocmask)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  365  #define __NR_rt_sigpending 176
f3e5c847ec3d12 Catalin Marinas    2014-01-30  366  __SYSCALL(__NR_rt_sigpending, compat_sys_rt_sigpending)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  367  #define __NR_rt_sigtimedwait 177
8dabe7245bbc13 Arnd Bergmann      2019-01-07  368  __SYSCALL(__NR_rt_sigtimedwait, compat_sys_rt_sigtimedwait_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  369  #define __NR_rt_sigqueueinfo 178
f3e5c847ec3d12 Catalin Marinas    2014-01-30  370  __SYSCALL(__NR_rt_sigqueueinfo, compat_sys_rt_sigqueueinfo)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  371  #define __NR_rt_sigsuspend 179
f3e5c847ec3d12 Catalin Marinas    2014-01-30  372  __SYSCALL(__NR_rt_sigsuspend, compat_sys_rt_sigsuspend)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  373  #define __NR_pread64 180
55f849265af886 Mark Rutland       2018-07-11  374  __SYSCALL(__NR_pread64, compat_sys_aarch32_pread64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  375  #define __NR_pwrite64 181
55f849265af886 Mark Rutland       2018-07-11  376  __SYSCALL(__NR_pwrite64, compat_sys_aarch32_pwrite64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  377  #define __NR_chown 182
f3e5c847ec3d12 Catalin Marinas    2014-01-30  378  __SYSCALL(__NR_chown, sys_chown16)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  379  #define __NR_getcwd 183
f3e5c847ec3d12 Catalin Marinas    2014-01-30  380  __SYSCALL(__NR_getcwd, sys_getcwd)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  381  #define __NR_capget 184
f3e5c847ec3d12 Catalin Marinas    2014-01-30  382  __SYSCALL(__NR_capget, sys_capget)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  383  #define __NR_capset 185
f3e5c847ec3d12 Catalin Marinas    2014-01-30  384  __SYSCALL(__NR_capset, sys_capset)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  385  #define __NR_sigaltstack 186
f3e5c847ec3d12 Catalin Marinas    2014-01-30  386  __SYSCALL(__NR_sigaltstack, compat_sys_sigaltstack)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  387  #define __NR_sendfile 187
f3e5c847ec3d12 Catalin Marinas    2014-01-30  388  __SYSCALL(__NR_sendfile, compat_sys_sendfile)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  389  			/* 188 reserved */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  390  __SYSCALL(188, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  391  			/* 189 reserved */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  392  __SYSCALL(189, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  393  #define __NR_vfork 190
f3e5c847ec3d12 Catalin Marinas    2014-01-30  394  __SYSCALL(__NR_vfork, sys_vfork)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  395  #define __NR_ugetrlimit 191	/* SuS compliant getrlimit */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  396  __SYSCALL(__NR_ugetrlimit, compat_sys_getrlimit)		/* SuS compliant getrlimit */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  397  #define __NR_mmap2 192
55f849265af886 Mark Rutland       2018-07-11  398  __SYSCALL(__NR_mmap2, compat_sys_aarch32_mmap2)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  399  #define __NR_truncate64 193
55f849265af886 Mark Rutland       2018-07-11  400  __SYSCALL(__NR_truncate64, compat_sys_aarch32_truncate64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  401  #define __NR_ftruncate64 194
55f849265af886 Mark Rutland       2018-07-11  402  __SYSCALL(__NR_ftruncate64, compat_sys_aarch32_ftruncate64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  403  #define __NR_stat64 195
f3e5c847ec3d12 Catalin Marinas    2014-01-30  404  __SYSCALL(__NR_stat64, sys_stat64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  405  #define __NR_lstat64 196
f3e5c847ec3d12 Catalin Marinas    2014-01-30  406  __SYSCALL(__NR_lstat64, sys_lstat64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  407  #define __NR_fstat64 197
f3e5c847ec3d12 Catalin Marinas    2014-01-30  408  __SYSCALL(__NR_fstat64, sys_fstat64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  409  #define __NR_lchown32 198
f3e5c847ec3d12 Catalin Marinas    2014-01-30  410  __SYSCALL(__NR_lchown32, sys_lchown)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  411  #define __NR_getuid32 199
f3e5c847ec3d12 Catalin Marinas    2014-01-30  412  __SYSCALL(__NR_getuid32, sys_getuid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  413  #define __NR_getgid32 200
f3e5c847ec3d12 Catalin Marinas    2014-01-30  414  __SYSCALL(__NR_getgid32, sys_getgid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  415  #define __NR_geteuid32 201
f3e5c847ec3d12 Catalin Marinas    2014-01-30  416  __SYSCALL(__NR_geteuid32, sys_geteuid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  417  #define __NR_getegid32 202
f3e5c847ec3d12 Catalin Marinas    2014-01-30  418  __SYSCALL(__NR_getegid32, sys_getegid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  419  #define __NR_setreuid32 203
f3e5c847ec3d12 Catalin Marinas    2014-01-30  420  __SYSCALL(__NR_setreuid32, sys_setreuid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  421  #define __NR_setregid32 204
f3e5c847ec3d12 Catalin Marinas    2014-01-30  422  __SYSCALL(__NR_setregid32, sys_setregid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  423  #define __NR_getgroups32 205
f3e5c847ec3d12 Catalin Marinas    2014-01-30  424  __SYSCALL(__NR_getgroups32, sys_getgroups)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  425  #define __NR_setgroups32 206
f3e5c847ec3d12 Catalin Marinas    2014-01-30  426  __SYSCALL(__NR_setgroups32, sys_setgroups)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  427  #define __NR_fchown32 207
f3e5c847ec3d12 Catalin Marinas    2014-01-30  428  __SYSCALL(__NR_fchown32, sys_fchown)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  429  #define __NR_setresuid32 208
f3e5c847ec3d12 Catalin Marinas    2014-01-30  430  __SYSCALL(__NR_setresuid32, sys_setresuid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  431  #define __NR_getresuid32 209
f3e5c847ec3d12 Catalin Marinas    2014-01-30  432  __SYSCALL(__NR_getresuid32, sys_getresuid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  433  #define __NR_setresgid32 210
f3e5c847ec3d12 Catalin Marinas    2014-01-30  434  __SYSCALL(__NR_setresgid32, sys_setresgid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  435  #define __NR_getresgid32 211
f3e5c847ec3d12 Catalin Marinas    2014-01-30  436  __SYSCALL(__NR_getresgid32, sys_getresgid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  437  #define __NR_chown32 212
f3e5c847ec3d12 Catalin Marinas    2014-01-30  438  __SYSCALL(__NR_chown32, sys_chown)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  439  #define __NR_setuid32 213
f3e5c847ec3d12 Catalin Marinas    2014-01-30  440  __SYSCALL(__NR_setuid32, sys_setuid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  441  #define __NR_setgid32 214
f3e5c847ec3d12 Catalin Marinas    2014-01-30  442  __SYSCALL(__NR_setgid32, sys_setgid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  443  #define __NR_setfsuid32 215
f3e5c847ec3d12 Catalin Marinas    2014-01-30  444  __SYSCALL(__NR_setfsuid32, sys_setfsuid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  445  #define __NR_setfsgid32 216
f3e5c847ec3d12 Catalin Marinas    2014-01-30  446  __SYSCALL(__NR_setfsgid32, sys_setfsgid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  447  #define __NR_getdents64 217
2611dc19395697 Al Viro            2017-04-08  448  __SYSCALL(__NR_getdents64, sys_getdents64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  449  #define __NR_pivot_root 218
f3e5c847ec3d12 Catalin Marinas    2014-01-30  450  __SYSCALL(__NR_pivot_root, sys_pivot_root)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  451  #define __NR_mincore 219
f3e5c847ec3d12 Catalin Marinas    2014-01-30  452  __SYSCALL(__NR_mincore, sys_mincore)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  453  #define __NR_madvise 220
f3e5c847ec3d12 Catalin Marinas    2014-01-30  454  __SYSCALL(__NR_madvise, sys_madvise)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  455  #define __NR_fcntl64 221
f3e5c847ec3d12 Catalin Marinas    2014-01-30  456  __SYSCALL(__NR_fcntl64, compat_sys_fcntl64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  457  			/* 222 for tux */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  458  __SYSCALL(222, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  459  			/* 223 is unused */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  460  __SYSCALL(223, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  461  #define __NR_gettid 224
f3e5c847ec3d12 Catalin Marinas    2014-01-30  462  __SYSCALL(__NR_gettid, sys_gettid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  463  #define __NR_readahead 225
55f849265af886 Mark Rutland       2018-07-11  464  __SYSCALL(__NR_readahead, compat_sys_aarch32_readahead)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  465  #define __NR_setxattr 226
f3e5c847ec3d12 Catalin Marinas    2014-01-30  466  __SYSCALL(__NR_setxattr, sys_setxattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  467  #define __NR_lsetxattr 227
f3e5c847ec3d12 Catalin Marinas    2014-01-30  468  __SYSCALL(__NR_lsetxattr, sys_lsetxattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  469  #define __NR_fsetxattr 228
f3e5c847ec3d12 Catalin Marinas    2014-01-30  470  __SYSCALL(__NR_fsetxattr, sys_fsetxattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  471  #define __NR_getxattr 229
f3e5c847ec3d12 Catalin Marinas    2014-01-30  472  __SYSCALL(__NR_getxattr, sys_getxattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  473  #define __NR_lgetxattr 230
f3e5c847ec3d12 Catalin Marinas    2014-01-30  474  __SYSCALL(__NR_lgetxattr, sys_lgetxattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  475  #define __NR_fgetxattr 231
f3e5c847ec3d12 Catalin Marinas    2014-01-30  476  __SYSCALL(__NR_fgetxattr, sys_fgetxattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  477  #define __NR_listxattr 232
f3e5c847ec3d12 Catalin Marinas    2014-01-30  478  __SYSCALL(__NR_listxattr, sys_listxattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  479  #define __NR_llistxattr 233
f3e5c847ec3d12 Catalin Marinas    2014-01-30  480  __SYSCALL(__NR_llistxattr, sys_llistxattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  481  #define __NR_flistxattr 234
f3e5c847ec3d12 Catalin Marinas    2014-01-30  482  __SYSCALL(__NR_flistxattr, sys_flistxattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  483  #define __NR_removexattr 235
f3e5c847ec3d12 Catalin Marinas    2014-01-30  484  __SYSCALL(__NR_removexattr, sys_removexattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  485  #define __NR_lremovexattr 236
f3e5c847ec3d12 Catalin Marinas    2014-01-30  486  __SYSCALL(__NR_lremovexattr, sys_lremovexattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  487  #define __NR_fremovexattr 237
f3e5c847ec3d12 Catalin Marinas    2014-01-30  488  __SYSCALL(__NR_fremovexattr, sys_fremovexattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  489  #define __NR_tkill 238
f3e5c847ec3d12 Catalin Marinas    2014-01-30  490  __SYSCALL(__NR_tkill, sys_tkill)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  491  #define __NR_sendfile64 239
f3e5c847ec3d12 Catalin Marinas    2014-01-30  492  __SYSCALL(__NR_sendfile64, sys_sendfile64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  493  #define __NR_futex 240
8dabe7245bbc13 Arnd Bergmann      2019-01-07  494  __SYSCALL(__NR_futex, sys_futex_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  495  #define __NR_sched_setaffinity 241
f3e5c847ec3d12 Catalin Marinas    2014-01-30  496  __SYSCALL(__NR_sched_setaffinity, compat_sys_sched_setaffinity)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  497  #define __NR_sched_getaffinity 242
f3e5c847ec3d12 Catalin Marinas    2014-01-30  498  __SYSCALL(__NR_sched_getaffinity, compat_sys_sched_getaffinity)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  499  #define __NR_io_setup 243
f3e5c847ec3d12 Catalin Marinas    2014-01-30  500  __SYSCALL(__NR_io_setup, compat_sys_io_setup)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  501  #define __NR_io_destroy 244
f3e5c847ec3d12 Catalin Marinas    2014-01-30  502  __SYSCALL(__NR_io_destroy, sys_io_destroy)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  503  #define __NR_io_getevents 245
8dabe7245bbc13 Arnd Bergmann      2019-01-07  504  __SYSCALL(__NR_io_getevents, sys_io_getevents_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  505  #define __NR_io_submit 246
f3e5c847ec3d12 Catalin Marinas    2014-01-30  506  __SYSCALL(__NR_io_submit, compat_sys_io_submit)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  507  #define __NR_io_cancel 247
f3e5c847ec3d12 Catalin Marinas    2014-01-30  508  __SYSCALL(__NR_io_cancel, sys_io_cancel)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  509  #define __NR_exit_group 248
f3e5c847ec3d12 Catalin Marinas    2014-01-30  510  __SYSCALL(__NR_exit_group, sys_exit_group)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  511  #define __NR_lookup_dcookie 249
f3e5c847ec3d12 Catalin Marinas    2014-01-30  512  __SYSCALL(__NR_lookup_dcookie, compat_sys_lookup_dcookie)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  513  #define __NR_epoll_create 250
f3e5c847ec3d12 Catalin Marinas    2014-01-30  514  __SYSCALL(__NR_epoll_create, sys_epoll_create)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  515  #define __NR_epoll_ctl 251
f3e5c847ec3d12 Catalin Marinas    2014-01-30  516  __SYSCALL(__NR_epoll_ctl, sys_epoll_ctl)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  517  #define __NR_epoll_wait 252
f3e5c847ec3d12 Catalin Marinas    2014-01-30  518  __SYSCALL(__NR_epoll_wait, sys_epoll_wait)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  519  #define __NR_remap_file_pages 253
f3e5c847ec3d12 Catalin Marinas    2014-01-30  520  __SYSCALL(__NR_remap_file_pages, sys_remap_file_pages)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  521  			/* 254 for set_thread_area */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  522  __SYSCALL(254, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  523  			/* 255 for get_thread_area */
f3e5c847ec3d12 Catalin Marinas    2014-01-30  524  __SYSCALL(255, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  525  #define __NR_set_tid_address 256
f3e5c847ec3d12 Catalin Marinas    2014-01-30  526  __SYSCALL(__NR_set_tid_address, sys_set_tid_address)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  527  #define __NR_timer_create 257
f3e5c847ec3d12 Catalin Marinas    2014-01-30  528  __SYSCALL(__NR_timer_create, compat_sys_timer_create)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  529  #define __NR_timer_settime 258
8dabe7245bbc13 Arnd Bergmann      2019-01-07  530  __SYSCALL(__NR_timer_settime, sys_timer_settime32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  531  #define __NR_timer_gettime 259
8dabe7245bbc13 Arnd Bergmann      2019-01-07  532  __SYSCALL(__NR_timer_gettime, sys_timer_gettime32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  533  #define __NR_timer_getoverrun 260
f3e5c847ec3d12 Catalin Marinas    2014-01-30  534  __SYSCALL(__NR_timer_getoverrun, sys_timer_getoverrun)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  535  #define __NR_timer_delete 261
f3e5c847ec3d12 Catalin Marinas    2014-01-30  536  __SYSCALL(__NR_timer_delete, sys_timer_delete)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  537  #define __NR_clock_settime 262
8dabe7245bbc13 Arnd Bergmann      2019-01-07  538  __SYSCALL(__NR_clock_settime, sys_clock_settime32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  539  #define __NR_clock_gettime 263
8dabe7245bbc13 Arnd Bergmann      2019-01-07  540  __SYSCALL(__NR_clock_gettime, sys_clock_gettime32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  541  #define __NR_clock_getres 264
8dabe7245bbc13 Arnd Bergmann      2019-01-07  542  __SYSCALL(__NR_clock_getres, sys_clock_getres_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  543  #define __NR_clock_nanosleep 265
8dabe7245bbc13 Arnd Bergmann      2019-01-07  544  __SYSCALL(__NR_clock_nanosleep, sys_clock_nanosleep_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  545  #define __NR_statfs64 266
55f849265af886 Mark Rutland       2018-07-11  546  __SYSCALL(__NR_statfs64, compat_sys_aarch32_statfs64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  547  #define __NR_fstatfs64 267
55f849265af886 Mark Rutland       2018-07-11  548  __SYSCALL(__NR_fstatfs64, compat_sys_aarch32_fstatfs64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  549  #define __NR_tgkill 268
f3e5c847ec3d12 Catalin Marinas    2014-01-30  550  __SYSCALL(__NR_tgkill, sys_tgkill)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  551  #define __NR_utimes 269
8dabe7245bbc13 Arnd Bergmann      2019-01-07  552  __SYSCALL(__NR_utimes, sys_utimes_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  553  #define __NR_arm_fadvise64_64 270
55f849265af886 Mark Rutland       2018-07-11  554  __SYSCALL(__NR_arm_fadvise64_64, compat_sys_aarch32_fadvise64_64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  555  #define __NR_pciconfig_iobase 271
f3e5c847ec3d12 Catalin Marinas    2014-01-30  556  __SYSCALL(__NR_pciconfig_iobase, sys_pciconfig_iobase)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  557  #define __NR_pciconfig_read 272
f3e5c847ec3d12 Catalin Marinas    2014-01-30  558  __SYSCALL(__NR_pciconfig_read, sys_pciconfig_read)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  559  #define __NR_pciconfig_write 273
f3e5c847ec3d12 Catalin Marinas    2014-01-30  560  __SYSCALL(__NR_pciconfig_write, sys_pciconfig_write)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  561  #define __NR_mq_open 274
f3e5c847ec3d12 Catalin Marinas    2014-01-30  562  __SYSCALL(__NR_mq_open, compat_sys_mq_open)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  563  #define __NR_mq_unlink 275
f3e5c847ec3d12 Catalin Marinas    2014-01-30  564  __SYSCALL(__NR_mq_unlink, sys_mq_unlink)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  565  #define __NR_mq_timedsend 276
8dabe7245bbc13 Arnd Bergmann      2019-01-07  566  __SYSCALL(__NR_mq_timedsend, sys_mq_timedsend_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  567  #define __NR_mq_timedreceive 277
8dabe7245bbc13 Arnd Bergmann      2019-01-07  568  __SYSCALL(__NR_mq_timedreceive, sys_mq_timedreceive_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  569  #define __NR_mq_notify 278
f3e5c847ec3d12 Catalin Marinas    2014-01-30  570  __SYSCALL(__NR_mq_notify, compat_sys_mq_notify)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  571  #define __NR_mq_getsetattr 279
f3e5c847ec3d12 Catalin Marinas    2014-01-30  572  __SYSCALL(__NR_mq_getsetattr, compat_sys_mq_getsetattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  573  #define __NR_waitid 280
f3e5c847ec3d12 Catalin Marinas    2014-01-30  574  __SYSCALL(__NR_waitid, compat_sys_waitid)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  575  #define __NR_socket 281
f3e5c847ec3d12 Catalin Marinas    2014-01-30  576  __SYSCALL(__NR_socket, sys_socket)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  577  #define __NR_bind 282
f3e5c847ec3d12 Catalin Marinas    2014-01-30  578  __SYSCALL(__NR_bind, sys_bind)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  579  #define __NR_connect 283
f3e5c847ec3d12 Catalin Marinas    2014-01-30  580  __SYSCALL(__NR_connect, sys_connect)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  581  #define __NR_listen 284
f3e5c847ec3d12 Catalin Marinas    2014-01-30  582  __SYSCALL(__NR_listen, sys_listen)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  583  #define __NR_accept 285
f3e5c847ec3d12 Catalin Marinas    2014-01-30  584  __SYSCALL(__NR_accept, sys_accept)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  585  #define __NR_getsockname 286
f3e5c847ec3d12 Catalin Marinas    2014-01-30  586  __SYSCALL(__NR_getsockname, sys_getsockname)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  587  #define __NR_getpeername 287
f3e5c847ec3d12 Catalin Marinas    2014-01-30  588  __SYSCALL(__NR_getpeername, sys_getpeername)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  589  #define __NR_socketpair 288
f3e5c847ec3d12 Catalin Marinas    2014-01-30  590  __SYSCALL(__NR_socketpair, sys_socketpair)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  591  #define __NR_send 289
f3e5c847ec3d12 Catalin Marinas    2014-01-30  592  __SYSCALL(__NR_send, sys_send)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  593  #define __NR_sendto 290
f3e5c847ec3d12 Catalin Marinas    2014-01-30  594  __SYSCALL(__NR_sendto, sys_sendto)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  595  #define __NR_recv 291
f3e5c847ec3d12 Catalin Marinas    2014-01-30  596  __SYSCALL(__NR_recv, compat_sys_recv)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  597  #define __NR_recvfrom 292
f3e5c847ec3d12 Catalin Marinas    2014-01-30  598  __SYSCALL(__NR_recvfrom, compat_sys_recvfrom)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  599  #define __NR_shutdown 293
f3e5c847ec3d12 Catalin Marinas    2014-01-30  600  __SYSCALL(__NR_shutdown, sys_shutdown)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  601  #define __NR_setsockopt 294
55db9c0e853421 Christoph Hellwig  2020-07-17  602  __SYSCALL(__NR_setsockopt, sys_setsockopt)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  603  #define __NR_getsockopt 295
55db9c0e853421 Christoph Hellwig  2020-07-17  604  __SYSCALL(__NR_getsockopt, sys_getsockopt)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  605  #define __NR_sendmsg 296
f3e5c847ec3d12 Catalin Marinas    2014-01-30  606  __SYSCALL(__NR_sendmsg, compat_sys_sendmsg)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  607  #define __NR_recvmsg 297
f3e5c847ec3d12 Catalin Marinas    2014-01-30  608  __SYSCALL(__NR_recvmsg, compat_sys_recvmsg)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  609  #define __NR_semop 298
f3e5c847ec3d12 Catalin Marinas    2014-01-30  610  __SYSCALL(__NR_semop, sys_semop)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  611  #define __NR_semget 299
f3e5c847ec3d12 Catalin Marinas    2014-01-30  612  __SYSCALL(__NR_semget, sys_semget)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  613  #define __NR_semctl 300
275f22148e8720 Arnd Bergmann      2018-12-31  614  __SYSCALL(__NR_semctl, compat_sys_old_semctl)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  615  #define __NR_msgsnd 301
f3e5c847ec3d12 Catalin Marinas    2014-01-30  616  __SYSCALL(__NR_msgsnd, compat_sys_msgsnd)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  617  #define __NR_msgrcv 302
f3e5c847ec3d12 Catalin Marinas    2014-01-30  618  __SYSCALL(__NR_msgrcv, compat_sys_msgrcv)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  619  #define __NR_msgget 303
f3e5c847ec3d12 Catalin Marinas    2014-01-30  620  __SYSCALL(__NR_msgget, sys_msgget)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  621  #define __NR_msgctl 304
275f22148e8720 Arnd Bergmann      2018-12-31  622  __SYSCALL(__NR_msgctl, compat_sys_old_msgctl)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  623  #define __NR_shmat 305
f3e5c847ec3d12 Catalin Marinas    2014-01-30  624  __SYSCALL(__NR_shmat, compat_sys_shmat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  625  #define __NR_shmdt 306
f3e5c847ec3d12 Catalin Marinas    2014-01-30  626  __SYSCALL(__NR_shmdt, sys_shmdt)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  627  #define __NR_shmget 307
f3e5c847ec3d12 Catalin Marinas    2014-01-30  628  __SYSCALL(__NR_shmget, sys_shmget)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  629  #define __NR_shmctl 308
275f22148e8720 Arnd Bergmann      2018-12-31  630  __SYSCALL(__NR_shmctl, compat_sys_old_shmctl)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  631  #define __NR_add_key 309
f3e5c847ec3d12 Catalin Marinas    2014-01-30  632  __SYSCALL(__NR_add_key, sys_add_key)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  633  #define __NR_request_key 310
f3e5c847ec3d12 Catalin Marinas    2014-01-30  634  __SYSCALL(__NR_request_key, sys_request_key)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  635  #define __NR_keyctl 311
f3e5c847ec3d12 Catalin Marinas    2014-01-30  636  __SYSCALL(__NR_keyctl, compat_sys_keyctl)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  637  #define __NR_semtimedop 312
8dabe7245bbc13 Arnd Bergmann      2019-01-07  638  __SYSCALL(__NR_semtimedop, sys_semtimedop_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  639  #define __NR_vserver 313
f3e5c847ec3d12 Catalin Marinas    2014-01-30  640  __SYSCALL(__NR_vserver, sys_ni_syscall)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  641  #define __NR_ioprio_set 314
f3e5c847ec3d12 Catalin Marinas    2014-01-30  642  __SYSCALL(__NR_ioprio_set, sys_ioprio_set)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  643  #define __NR_ioprio_get 315
f3e5c847ec3d12 Catalin Marinas    2014-01-30  644  __SYSCALL(__NR_ioprio_get, sys_ioprio_get)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  645  #define __NR_inotify_init 316
f3e5c847ec3d12 Catalin Marinas    2014-01-30  646  __SYSCALL(__NR_inotify_init, sys_inotify_init)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  647  #define __NR_inotify_add_watch 317
f3e5c847ec3d12 Catalin Marinas    2014-01-30  648  __SYSCALL(__NR_inotify_add_watch, sys_inotify_add_watch)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  649  #define __NR_inotify_rm_watch 318
f3e5c847ec3d12 Catalin Marinas    2014-01-30  650  __SYSCALL(__NR_inotify_rm_watch, sys_inotify_rm_watch)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  651  #define __NR_mbind 319
59ab844eed9c6b Arnd Bergmann      2021-09-08  652  __SYSCALL(__NR_mbind, sys_mbind)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  653  #define __NR_get_mempolicy 320
59ab844eed9c6b Arnd Bergmann      2021-09-08  654  __SYSCALL(__NR_get_mempolicy, sys_get_mempolicy)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  655  #define __NR_set_mempolicy 321
59ab844eed9c6b Arnd Bergmann      2021-09-08  656  __SYSCALL(__NR_set_mempolicy, sys_set_mempolicy)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  657  #define __NR_openat 322
f3e5c847ec3d12 Catalin Marinas    2014-01-30  658  __SYSCALL(__NR_openat, compat_sys_openat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  659  #define __NR_mkdirat 323
f3e5c847ec3d12 Catalin Marinas    2014-01-30  660  __SYSCALL(__NR_mkdirat, sys_mkdirat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  661  #define __NR_mknodat 324
f3e5c847ec3d12 Catalin Marinas    2014-01-30  662  __SYSCALL(__NR_mknodat, sys_mknodat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  663  #define __NR_fchownat 325
f3e5c847ec3d12 Catalin Marinas    2014-01-30  664  __SYSCALL(__NR_fchownat, sys_fchownat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  665  #define __NR_futimesat 326
8dabe7245bbc13 Arnd Bergmann      2019-01-07  666  __SYSCALL(__NR_futimesat, sys_futimesat_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  667  #define __NR_fstatat64 327
f3e5c847ec3d12 Catalin Marinas    2014-01-30  668  __SYSCALL(__NR_fstatat64, sys_fstatat64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  669  #define __NR_unlinkat 328
f3e5c847ec3d12 Catalin Marinas    2014-01-30  670  __SYSCALL(__NR_unlinkat, sys_unlinkat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  671  #define __NR_renameat 329
f3e5c847ec3d12 Catalin Marinas    2014-01-30  672  __SYSCALL(__NR_renameat, sys_renameat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  673  #define __NR_linkat 330
f3e5c847ec3d12 Catalin Marinas    2014-01-30  674  __SYSCALL(__NR_linkat, sys_linkat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  675  #define __NR_symlinkat 331
f3e5c847ec3d12 Catalin Marinas    2014-01-30  676  __SYSCALL(__NR_symlinkat, sys_symlinkat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  677  #define __NR_readlinkat 332
f3e5c847ec3d12 Catalin Marinas    2014-01-30  678  __SYSCALL(__NR_readlinkat, sys_readlinkat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  679  #define __NR_fchmodat 333
f3e5c847ec3d12 Catalin Marinas    2014-01-30  680  __SYSCALL(__NR_fchmodat, sys_fchmodat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  681  #define __NR_faccessat 334
f3e5c847ec3d12 Catalin Marinas    2014-01-30  682  __SYSCALL(__NR_faccessat, sys_faccessat)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  683  #define __NR_pselect6 335
8dabe7245bbc13 Arnd Bergmann      2019-01-07  684  __SYSCALL(__NR_pselect6, compat_sys_pselect6_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  685  #define __NR_ppoll 336
8dabe7245bbc13 Arnd Bergmann      2019-01-07  686  __SYSCALL(__NR_ppoll, compat_sys_ppoll_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  687  #define __NR_unshare 337
f3e5c847ec3d12 Catalin Marinas    2014-01-30  688  __SYSCALL(__NR_unshare, sys_unshare)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  689  #define __NR_set_robust_list 338
f3e5c847ec3d12 Catalin Marinas    2014-01-30  690  __SYSCALL(__NR_set_robust_list, compat_sys_set_robust_list)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  691  #define __NR_get_robust_list 339
f3e5c847ec3d12 Catalin Marinas    2014-01-30  692  __SYSCALL(__NR_get_robust_list, compat_sys_get_robust_list)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  693  #define __NR_splice 340
f3e5c847ec3d12 Catalin Marinas    2014-01-30  694  __SYSCALL(__NR_splice, sys_splice)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  695  #define __NR_sync_file_range2 341
55f849265af886 Mark Rutland       2018-07-11  696  __SYSCALL(__NR_sync_file_range2, compat_sys_aarch32_sync_file_range2)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  697  #define __NR_tee 342
f3e5c847ec3d12 Catalin Marinas    2014-01-30  698  __SYSCALL(__NR_tee, sys_tee)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  699  #define __NR_vmsplice 343
598b3cec831fd6 Christoph Hellwig  2020-09-25  700  __SYSCALL(__NR_vmsplice, sys_vmsplice)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  701  #define __NR_move_pages 344
59ab844eed9c6b Arnd Bergmann      2021-09-08  702  __SYSCALL(__NR_move_pages, sys_move_pages)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  703  #define __NR_getcpu 345
f3e5c847ec3d12 Catalin Marinas    2014-01-30  704  __SYSCALL(__NR_getcpu, sys_getcpu)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  705  #define __NR_epoll_pwait 346
f3e5c847ec3d12 Catalin Marinas    2014-01-30  706  __SYSCALL(__NR_epoll_pwait, compat_sys_epoll_pwait)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  707  #define __NR_kexec_load 347
f3e5c847ec3d12 Catalin Marinas    2014-01-30  708  __SYSCALL(__NR_kexec_load, compat_sys_kexec_load)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  709  #define __NR_utimensat 348
8dabe7245bbc13 Arnd Bergmann      2019-01-07  710  __SYSCALL(__NR_utimensat, sys_utimensat_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  711  #define __NR_signalfd 349
f3e5c847ec3d12 Catalin Marinas    2014-01-30  712  __SYSCALL(__NR_signalfd, compat_sys_signalfd)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  713  #define __NR_timerfd_create 350
f3e5c847ec3d12 Catalin Marinas    2014-01-30  714  __SYSCALL(__NR_timerfd_create, sys_timerfd_create)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  715  #define __NR_eventfd 351
f3e5c847ec3d12 Catalin Marinas    2014-01-30  716  __SYSCALL(__NR_eventfd, sys_eventfd)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  717  #define __NR_fallocate 352
55f849265af886 Mark Rutland       2018-07-11  718  __SYSCALL(__NR_fallocate, compat_sys_aarch32_fallocate)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  719  #define __NR_timerfd_settime 353
8dabe7245bbc13 Arnd Bergmann      2019-01-07  720  __SYSCALL(__NR_timerfd_settime, sys_timerfd_settime32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  721  #define __NR_timerfd_gettime 354
8dabe7245bbc13 Arnd Bergmann      2019-01-07  722  __SYSCALL(__NR_timerfd_gettime, sys_timerfd_gettime32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  723  #define __NR_signalfd4 355
f3e5c847ec3d12 Catalin Marinas    2014-01-30  724  __SYSCALL(__NR_signalfd4, compat_sys_signalfd4)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  725  #define __NR_eventfd2 356
f3e5c847ec3d12 Catalin Marinas    2014-01-30  726  __SYSCALL(__NR_eventfd2, sys_eventfd2)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  727  #define __NR_epoll_create1 357
f3e5c847ec3d12 Catalin Marinas    2014-01-30  728  __SYSCALL(__NR_epoll_create1, sys_epoll_create1)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  729  #define __NR_dup3 358
f3e5c847ec3d12 Catalin Marinas    2014-01-30  730  __SYSCALL(__NR_dup3, sys_dup3)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  731  #define __NR_pipe2 359
f3e5c847ec3d12 Catalin Marinas    2014-01-30  732  __SYSCALL(__NR_pipe2, sys_pipe2)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  733  #define __NR_inotify_init1 360
f3e5c847ec3d12 Catalin Marinas    2014-01-30  734  __SYSCALL(__NR_inotify_init1, sys_inotify_init1)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  735  #define __NR_preadv 361
f3e5c847ec3d12 Catalin Marinas    2014-01-30  736  __SYSCALL(__NR_preadv, compat_sys_preadv)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  737  #define __NR_pwritev 362
f3e5c847ec3d12 Catalin Marinas    2014-01-30  738  __SYSCALL(__NR_pwritev, compat_sys_pwritev)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  739  #define __NR_rt_tgsigqueueinfo 363
f3e5c847ec3d12 Catalin Marinas    2014-01-30  740  __SYSCALL(__NR_rt_tgsigqueueinfo, compat_sys_rt_tgsigqueueinfo)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  741  #define __NR_perf_event_open 364
f3e5c847ec3d12 Catalin Marinas    2014-01-30  742  __SYSCALL(__NR_perf_event_open, sys_perf_event_open)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  743  #define __NR_recvmmsg 365
8dabe7245bbc13 Arnd Bergmann      2019-01-07  744  __SYSCALL(__NR_recvmmsg, compat_sys_recvmmsg_time32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  745  #define __NR_accept4 366
f3e5c847ec3d12 Catalin Marinas    2014-01-30  746  __SYSCALL(__NR_accept4, sys_accept4)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  747  #define __NR_fanotify_init 367
f3e5c847ec3d12 Catalin Marinas    2014-01-30  748  __SYSCALL(__NR_fanotify_init, sys_fanotify_init)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  749  #define __NR_fanotify_mark 368
f3e5c847ec3d12 Catalin Marinas    2014-01-30  750  __SYSCALL(__NR_fanotify_mark, compat_sys_fanotify_mark)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  751  #define __NR_prlimit64 369
f3e5c847ec3d12 Catalin Marinas    2014-01-30  752  __SYSCALL(__NR_prlimit64, sys_prlimit64)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  753  #define __NR_name_to_handle_at 370
f3e5c847ec3d12 Catalin Marinas    2014-01-30  754  __SYSCALL(__NR_name_to_handle_at, sys_name_to_handle_at)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  755  #define __NR_open_by_handle_at 371
f3e5c847ec3d12 Catalin Marinas    2014-01-30  756  __SYSCALL(__NR_open_by_handle_at, compat_sys_open_by_handle_at)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  757  #define __NR_clock_adjtime 372
8dabe7245bbc13 Arnd Bergmann      2019-01-07  758  __SYSCALL(__NR_clock_adjtime, sys_clock_adjtime32)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  759  #define __NR_syncfs 373
f3e5c847ec3d12 Catalin Marinas    2014-01-30  760  __SYSCALL(__NR_syncfs, sys_syncfs)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  761  #define __NR_sendmmsg 374
f3e5c847ec3d12 Catalin Marinas    2014-01-30  762  __SYSCALL(__NR_sendmmsg, compat_sys_sendmmsg)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  763  #define __NR_setns 375
f3e5c847ec3d12 Catalin Marinas    2014-01-30  764  __SYSCALL(__NR_setns, sys_setns)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  765  #define __NR_process_vm_readv 376
c3973b401ef2b0 Christoph Hellwig  2020-09-25  766  __SYSCALL(__NR_process_vm_readv, sys_process_vm_readv)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  767  #define __NR_process_vm_writev 377
c3973b401ef2b0 Christoph Hellwig  2020-09-25  768  __SYSCALL(__NR_process_vm_writev, sys_process_vm_writev)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  769  #define __NR_kcmp 378
f3e5c847ec3d12 Catalin Marinas    2014-01-30  770  __SYSCALL(__NR_kcmp, sys_kcmp)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  771  #define __NR_finit_module 379
f3e5c847ec3d12 Catalin Marinas    2014-01-30  772  __SYSCALL(__NR_finit_module, sys_finit_module)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  773  #define __NR_sched_setattr 380
f3e5c847ec3d12 Catalin Marinas    2014-01-30  774  __SYSCALL(__NR_sched_setattr, sys_sched_setattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  775  #define __NR_sched_getattr 381
f3e5c847ec3d12 Catalin Marinas    2014-01-30  776  __SYSCALL(__NR_sched_getattr, sys_sched_getattr)
f3e5c847ec3d12 Catalin Marinas    2014-01-30  777  #define __NR_renameat2 382
f3e5c847ec3d12 Catalin Marinas    2014-01-30  778  __SYSCALL(__NR_renameat2, sys_renameat2)
e185fab7e13087 AKASHI Takahiro    2014-11-28  779  #define __NR_seccomp 383
e185fab7e13087 AKASHI Takahiro    2014-11-28  780  __SYSCALL(__NR_seccomp, sys_seccomp)
a97a42c47608d0 Will Deacon        2014-08-11  781  #define __NR_getrandom 384
a97a42c47608d0 Will Deacon        2014-08-11  782  __SYSCALL(__NR_getrandom, sys_getrandom)
a97a42c47608d0 Will Deacon        2014-08-11  783  #define __NR_memfd_create 385
a97a42c47608d0 Will Deacon        2014-08-11  784  __SYSCALL(__NR_memfd_create, sys_memfd_create)
97b56be10352a7 Catalin Marinas    2014-11-05  785  #define __NR_bpf 386
97b56be10352a7 Catalin Marinas    2014-11-05  786  __SYSCALL(__NR_bpf, sys_bpf)
cd25b85ba6ee1f Will Deacon        2015-01-12  787  #define __NR_execveat 387
cd25b85ba6ee1f Will Deacon        2015-01-12  788  __SYSCALL(__NR_execveat, compat_sys_execveat)
eb93ce2cb7a853 Will Deacon        2015-10-14  789  #define __NR_userfaultfd 388
eb93ce2cb7a853 Will Deacon        2015-10-14  790  __SYSCALL(__NR_userfaultfd, sys_userfaultfd)
eb93ce2cb7a853 Will Deacon        2015-10-14  791  #define __NR_membarrier 389
eb93ce2cb7a853 Will Deacon        2015-10-14  792  __SYSCALL(__NR_membarrier, sys_membarrier)
10fdf8513f776c Will Deacon        2016-06-01  793  #define __NR_mlock2 390
10fdf8513f776c Will Deacon        2016-06-01  794  __SYSCALL(__NR_mlock2, sys_mlock2)
10fdf8513f776c Will Deacon        2016-06-01  795  #define __NR_copy_file_range 391
10fdf8513f776c Will Deacon        2016-06-01  796  __SYSCALL(__NR_copy_file_range, sys_copy_file_range)
10fdf8513f776c Will Deacon        2016-06-01  797  #define __NR_preadv2 392
10fdf8513f776c Will Deacon        2016-06-01  798  __SYSCALL(__NR_preadv2, compat_sys_preadv2)
10fdf8513f776c Will Deacon        2016-06-01  799  #define __NR_pwritev2 393
10fdf8513f776c Will Deacon        2016-06-01  800  __SYSCALL(__NR_pwritev2, compat_sys_pwritev2)
713cc9df6473f0 Will Deacon        2017-03-21  801  #define __NR_pkey_mprotect 394
713cc9df6473f0 Will Deacon        2017-03-21  802  __SYSCALL(__NR_pkey_mprotect, sys_pkey_mprotect)
713cc9df6473f0 Will Deacon        2017-03-21  803  #define __NR_pkey_alloc 395
713cc9df6473f0 Will Deacon        2017-03-21  804  __SYSCALL(__NR_pkey_alloc, sys_pkey_alloc)
713cc9df6473f0 Will Deacon        2017-03-21  805  #define __NR_pkey_free 396
713cc9df6473f0 Will Deacon        2017-03-21  806  __SYSCALL(__NR_pkey_free, sys_pkey_free)
713cc9df6473f0 Will Deacon        2017-03-21  807  #define __NR_statx 397
713cc9df6473f0 Will Deacon        2017-03-21  808  __SYSCALL(__NR_statx, sys_statx)
409d5db49867c2 Will Deacon        2018-06-20  809  #define __NR_rseq 398
409d5db49867c2 Will Deacon        2018-06-20  810  __SYSCALL(__NR_rseq, sys_rseq)
7e0b44e870cf26 Will Deacon        2019-01-03  811  #define __NR_io_pgetevents 399
7e0b44e870cf26 Will Deacon        2019-01-03  812  __SYSCALL(__NR_io_pgetevents, compat_sys_io_pgetevents)
78594b95998f14 Arnd Bergmann      2018-12-30  813  #define __NR_migrate_pages 400
59ab844eed9c6b Arnd Bergmann      2021-09-08  814  __SYSCALL(__NR_migrate_pages, sys_migrate_pages)
4ab65ba7a5cbad Arnd Bergmann      2018-12-30  815  #define __NR_kexec_file_load 401
4ab65ba7a5cbad Arnd Bergmann      2018-12-30  816  __SYSCALL(__NR_kexec_file_load, sys_kexec_file_load)
48166e6ea47d23 Arnd Bergmann      2019-01-10  817  /* 402 is unused */
48166e6ea47d23 Arnd Bergmann      2019-01-10  818  #define __NR_clock_gettime64 403
48166e6ea47d23 Arnd Bergmann      2019-01-10  819  __SYSCALL(__NR_clock_gettime64, sys_clock_gettime)
48166e6ea47d23 Arnd Bergmann      2019-01-10  820  #define __NR_clock_settime64 404
48166e6ea47d23 Arnd Bergmann      2019-01-10  821  __SYSCALL(__NR_clock_settime64, sys_clock_settime)
48166e6ea47d23 Arnd Bergmann      2019-01-10  822  #define __NR_clock_adjtime64 405
48166e6ea47d23 Arnd Bergmann      2019-01-10  823  __SYSCALL(__NR_clock_adjtime64, sys_clock_adjtime)
48166e6ea47d23 Arnd Bergmann      2019-01-10  824  #define __NR_clock_getres_time64 406
48166e6ea47d23 Arnd Bergmann      2019-01-10  825  __SYSCALL(__NR_clock_getres_time64, sys_clock_getres)
48166e6ea47d23 Arnd Bergmann      2019-01-10  826  #define __NR_clock_nanosleep_time64 407
48166e6ea47d23 Arnd Bergmann      2019-01-10  827  __SYSCALL(__NR_clock_nanosleep_time64, sys_clock_nanosleep)
48166e6ea47d23 Arnd Bergmann      2019-01-10  828  #define __NR_timer_gettime64 408
48166e6ea47d23 Arnd Bergmann      2019-01-10  829  __SYSCALL(__NR_timer_gettime64, sys_timer_gettime)
48166e6ea47d23 Arnd Bergmann      2019-01-10  830  #define __NR_timer_settime64 409
48166e6ea47d23 Arnd Bergmann      2019-01-10  831  __SYSCALL(__NR_timer_settime64, sys_timer_settime)
48166e6ea47d23 Arnd Bergmann      2019-01-10  832  #define __NR_timerfd_gettime64 410
48166e6ea47d23 Arnd Bergmann      2019-01-10  833  __SYSCALL(__NR_timerfd_gettime64, sys_timerfd_gettime)
48166e6ea47d23 Arnd Bergmann      2019-01-10  834  #define __NR_timerfd_settime64 411
48166e6ea47d23 Arnd Bergmann      2019-01-10  835  __SYSCALL(__NR_timerfd_settime64, sys_timerfd_settime)
48166e6ea47d23 Arnd Bergmann      2019-01-10  836  #define __NR_utimensat_time64 412
48166e6ea47d23 Arnd Bergmann      2019-01-10  837  __SYSCALL(__NR_utimensat_time64, sys_utimensat)
48166e6ea47d23 Arnd Bergmann      2019-01-10  838  #define __NR_pselect6_time64 413
48166e6ea47d23 Arnd Bergmann      2019-01-10  839  __SYSCALL(__NR_pselect6_time64, compat_sys_pselect6_time64)
48166e6ea47d23 Arnd Bergmann      2019-01-10  840  #define __NR_ppoll_time64 414
48166e6ea47d23 Arnd Bergmann      2019-01-10  841  __SYSCALL(__NR_ppoll_time64, compat_sys_ppoll_time64)
48166e6ea47d23 Arnd Bergmann      2019-01-10  842  #define __NR_io_pgetevents_time64 416
48166e6ea47d23 Arnd Bergmann      2019-01-10  843  __SYSCALL(__NR_io_pgetevents_time64, sys_io_pgetevents)
48166e6ea47d23 Arnd Bergmann      2019-01-10  844  #define __NR_recvmmsg_time64 417
48166e6ea47d23 Arnd Bergmann      2019-01-10  845  __SYSCALL(__NR_recvmmsg_time64, compat_sys_recvmmsg_time64)
48166e6ea47d23 Arnd Bergmann      2019-01-10  846  #define __NR_mq_timedsend_time64 418
48166e6ea47d23 Arnd Bergmann      2019-01-10  847  __SYSCALL(__NR_mq_timedsend_time64, sys_mq_timedsend)
48166e6ea47d23 Arnd Bergmann      2019-01-10  848  #define __NR_mq_timedreceive_time64 419
48166e6ea47d23 Arnd Bergmann      2019-01-10  849  __SYSCALL(__NR_mq_timedreceive_time64, sys_mq_timedreceive)
48166e6ea47d23 Arnd Bergmann      2019-01-10  850  #define __NR_semtimedop_time64 420
48166e6ea47d23 Arnd Bergmann      2019-01-10  851  __SYSCALL(__NR_semtimedop_time64, sys_semtimedop)
48166e6ea47d23 Arnd Bergmann      2019-01-10  852  #define __NR_rt_sigtimedwait_time64 421
48166e6ea47d23 Arnd Bergmann      2019-01-10  853  __SYSCALL(__NR_rt_sigtimedwait_time64, compat_sys_rt_sigtimedwait_time64)
48166e6ea47d23 Arnd Bergmann      2019-01-10  854  #define __NR_futex_time64 422
48166e6ea47d23 Arnd Bergmann      2019-01-10  855  __SYSCALL(__NR_futex_time64, sys_futex)
48166e6ea47d23 Arnd Bergmann      2019-01-10  856  #define __NR_sched_rr_get_interval_time64 423
48166e6ea47d23 Arnd Bergmann      2019-01-10  857  __SYSCALL(__NR_sched_rr_get_interval_time64, sys_sched_rr_get_interval)
39036cd2727395 Arnd Bergmann      2019-02-28  858  #define __NR_pidfd_send_signal 424
39036cd2727395 Arnd Bergmann      2019-02-28  859  __SYSCALL(__NR_pidfd_send_signal, sys_pidfd_send_signal)
39036cd2727395 Arnd Bergmann      2019-02-28  860  #define __NR_io_uring_setup 425
39036cd2727395 Arnd Bergmann      2019-02-28  861  __SYSCALL(__NR_io_uring_setup, sys_io_uring_setup)
39036cd2727395 Arnd Bergmann      2019-02-28  862  #define __NR_io_uring_enter 426
39036cd2727395 Arnd Bergmann      2019-02-28  863  __SYSCALL(__NR_io_uring_enter, sys_io_uring_enter)
39036cd2727395 Arnd Bergmann      2019-02-28  864  #define __NR_io_uring_register 427
39036cd2727395 Arnd Bergmann      2019-02-28  865  __SYSCALL(__NR_io_uring_register, sys_io_uring_register)
d8076bdb56af5e David Howells      2019-05-16  866  #define __NR_open_tree 428
d8076bdb56af5e David Howells      2019-05-16  867  __SYSCALL(__NR_open_tree, sys_open_tree)
d8076bdb56af5e David Howells      2019-05-16  868  #define __NR_move_mount 429
d8076bdb56af5e David Howells      2019-05-16  869  __SYSCALL(__NR_move_mount, sys_move_mount)
d8076bdb56af5e David Howells      2019-05-16  870  #define __NR_fsopen 430
d8076bdb56af5e David Howells      2019-05-16  871  __SYSCALL(__NR_fsopen, sys_fsopen)
d8076bdb56af5e David Howells      2019-05-16  872  #define __NR_fsconfig 431
d8076bdb56af5e David Howells      2019-05-16  873  __SYSCALL(__NR_fsconfig, sys_fsconfig)
d8076bdb56af5e David Howells      2019-05-16  874  #define __NR_fsmount 432
d8076bdb56af5e David Howells      2019-05-16  875  __SYSCALL(__NR_fsmount, sys_fsmount)
d8076bdb56af5e David Howells      2019-05-16  876  #define __NR_fspick 433
d8076bdb56af5e David Howells      2019-05-16  877  __SYSCALL(__NR_fspick, sys_fspick)
7615d9e1780e26 Christian Brauner  2019-05-24  878  #define __NR_pidfd_open 434
7615d9e1780e26 Christian Brauner  2019-05-24  879  __SYSCALL(__NR_pidfd_open, sys_pidfd_open)
8f6ccf6159aed1 Linus Torvalds     2019-07-11  880  #define __NR_clone3 435
8f3220a8065454 Christian Brauner  2019-05-25  881  __SYSCALL(__NR_clone3, sys_clone3)
9b4feb630e8e98 Christian Brauner  2019-05-24  882  #define __NR_close_range 436
9b4feb630e8e98 Christian Brauner  2019-05-24  883  __SYSCALL(__NR_close_range, sys_close_range)
fddb5d430ad9fa Aleksa Sarai       2020-01-18  884  #define __NR_openat2 437
fddb5d430ad9fa Aleksa Sarai       2020-01-18  885  __SYSCALL(__NR_openat2, sys_openat2)
9a2cef09c801de Sargun Dhillon     2020-01-07  886  #define __NR_pidfd_getfd 438
9a2cef09c801de Sargun Dhillon     2020-01-07  887  __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
c8ffd8bcdd2829 Miklos Szeredi     2020-05-14  888  #define __NR_faccessat2 439
c8ffd8bcdd2829 Miklos Szeredi     2020-05-14  889  __SYSCALL(__NR_faccessat2, sys_faccessat2)
ecb8ac8b1f1469 Minchan Kim        2020-10-17  890  #define __NR_process_madvise 440
ecb8ac8b1f1469 Minchan Kim        2020-10-17  891  __SYSCALL(__NR_process_madvise, sys_process_madvise)
b0a0c2615f6f19 Willem de Bruijn   2020-12-18  892  #define __NR_epoll_pwait2 441
450f68e2425e63 Heiko Carstens     2020-12-20  893  __SYSCALL(__NR_epoll_pwait2, compat_sys_epoll_pwait2)
2a1867219c7b27 Christian Brauner  2021-01-21  894  #define __NR_mount_setattr 442
2a1867219c7b27 Christian Brauner  2021-01-21  895  __SYSCALL(__NR_mount_setattr, sys_mount_setattr)
65ffb3d69ed3da Jan Kara           2021-05-31  896  #define __NR_quotactl_fd 443
65ffb3d69ed3da Jan Kara           2021-05-31  897  __SYSCALL(__NR_quotactl_fd, sys_quotactl_fd)
a49f4f81cb4892 Mickaël Salaün     2021-04-22  898  #define __NR_landlock_create_ruleset 444
a49f4f81cb4892 Mickaël Salaün     2021-04-22  899  __SYSCALL(__NR_landlock_create_ruleset, sys_landlock_create_ruleset)
a49f4f81cb4892 Mickaël Salaün     2021-04-22  900  #define __NR_landlock_add_rule 445
a49f4f81cb4892 Mickaël Salaün     2021-04-22  901  __SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
a49f4f81cb4892 Mickaël Salaün     2021-04-22  902  #define __NR_landlock_restrict_self 446
a49f4f81cb4892 Mickaël Salaün     2021-04-22  903  __SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
dce49103962840 Suren Baghdasaryan 2021-09-02  904  #define __NR_process_mrelease 448
dce49103962840 Suren Baghdasaryan 2021-09-02  905  __SYSCALL(__NR_process_mrelease, sys_process_mrelease)
ea7c45fde5aa3e André Almeida      2021-09-23  906  #define __NR_futex_waitv 449
ea7c45fde5aa3e André Almeida      2021-09-23  907  __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
21b084fdf2a49c Aneesh Kumar K.V   2022-01-14  908  #define __NR_set_mempolicy_home_node 450
21b084fdf2a49c Aneesh Kumar K.V   2022-01-14  909  __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
eb93ce2cb7a853 Will Deacon        2015-10-14  910  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

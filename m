Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8D84501A;
	Mon,  4 Nov 2024 05:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730698787; cv=none; b=TOu/vTH0Pk89Ri+ctGKB7kZUC/gfIj6I9RFZX9evVfCbm73mYyobCkdypT5XsJGet1Ge0Djf9Zbhp6Vq+SlTcEBtlo1u7vrXQ4PfeYD7E/1M+Hq6X4bgWq1OzFtkMycDsOQTfgG/nqqLLmGi5gBlToDWs6pKi0LkFIEdfXlp3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730698787; c=relaxed/simple;
	bh=nYKwZu5o2MpzZ6EUmFit14huww+3Z3dm/KJ6R2eDUJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnF+7LYe21iR1x31pPHXpcYgkiJ2Uwe0BDaif/8OjyHJSJxGZqXa+rTsncK6/NbailbP2TM5mut9flNI+nxAr73x0IZGqc22GAKG8uoCjwSH06cJc1uAbwgJbohgtgPhpuzawMZmfOWeqDbNOvYLYxYW4eVE0SM1xQTLj8/YXmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbgACOks; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbgACOks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730698786; x=1762234786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nYKwZu5o2MpzZ6EUmFit14huww+3Z3dm/KJ6R2eDUJc=;
  b=nbgACOkscHqzv9kDyortBjoAUFm+fMcdkcQ7q/VUEs5HUQKzIi9mjWwD
   Tp0tFhK7OPd/QhlONA2v0BcxD8XJzzNlZfkFJMQvH3paPhXecQkee0CKL
   zhv/wxdqgaVg5lMaSBSx+Rqm0vtIihqTsVBtgoHh38homhEY3PmdajAx9
   e+9v/bhglZOJHp5SlEwMUAMTUVqfZUazDszb2bC0+BoiUv3DBgm99BXPw
   OQUmYAuSXVluyUmxuyG4x3aqMGZCPwH9Op54i4igxzRahiMxQdSJQl67M
   bZ/izWVXnY7NCu/h6WRTX81mUFBooo1m5/TjXo/JehamCWl2FSyYNQpsB
   w==;
X-CSE-ConnectionGUID: bKk9anB8TOWQYgqree19wQ==
X-CSE-MsgGUID: nEwcRAZhQCeNw0T47HpC7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30485350"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30485350"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 21:39:45 -0800
X-CSE-ConnectionGUID: 9e9wRJHVSai3yMXMOgOxDg==
X-CSE-MsgGUID: M//P+pYRQdSui+4Y3BbGeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83645583"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Nov 2024 21:39:43 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7poT-000kUz-0V;
	Mon, 04 Nov 2024 05:39:41 +0000
Date: Mon, 4 Nov 2024 13:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Stas Sergeev <stsp2@yandex.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [POC, RFC] scheme for transferring group_list between processes
Message-ID: <202411041326.woRrfweJ-lkp@intel.com>
References: <20241101202657.468595-1-stsp2@yandex.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101202657.468595-1-stsp2@yandex.ru>

Hi Stas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.12-rc6]
[cannot apply to brauner-vfs/vfs.all next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stas-Sergeev/scheme-for-transferring-group_list-between-processes/20241102-043615
base:   linus/master
patch link:    https://lore.kernel.org/r/20241101202657.468595-1-stsp2%40yandex.ru
patch subject: [POC, RFC] scheme for transferring group_list between processes
config: hexagon-randconfig-001-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041326.woRrfweJ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041326.woRrfweJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041326.woRrfweJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/pidfs.c:13:
   In file included from include/linux/pseudo_fs.h:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/pidfs.c:13:
   In file included from include/linux/pseudo_fs.h:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/pidfs.c:13:
   In file included from include/linux/pseudo_fs.h:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/pidfs.c:241:3: error: implicit declaration of function 'set_current_groups' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   set_current_groups(file->f_cred->group_info);
                   ^
   fs/pidfs.c:241:3: note: did you mean 'set_current_blocked'?
   include/linux/signal.h:289:13: note: 'set_current_blocked' declared here
   extern void set_current_blocked(sigset_t *);
               ^
   6 warnings and 1 error generated.


vim +/set_current_groups +241 fs/pidfs.c

   170	
   171		switch (cmd) {
   172		/* Namespaces that hang of nsproxy. */
   173		case PIDFD_GET_CGROUP_NAMESPACE:
   174			if (IS_ENABLED(CONFIG_CGROUPS)) {
   175				get_cgroup_ns(nsp->cgroup_ns);
   176				ns_common = to_ns_common(nsp->cgroup_ns);
   177			}
   178			break;
   179		case PIDFD_GET_IPC_NAMESPACE:
   180			if (IS_ENABLED(CONFIG_IPC_NS)) {
   181				get_ipc_ns(nsp->ipc_ns);
   182				ns_common = to_ns_common(nsp->ipc_ns);
   183			}
   184			break;
   185		case PIDFD_GET_MNT_NAMESPACE:
   186			get_mnt_ns(nsp->mnt_ns);
   187			ns_common = to_ns_common(nsp->mnt_ns);
   188			break;
   189		case PIDFD_GET_NET_NAMESPACE:
   190			if (IS_ENABLED(CONFIG_NET_NS)) {
   191				ns_common = to_ns_common(nsp->net_ns);
   192				get_net_ns(ns_common);
   193			}
   194			break;
   195		case PIDFD_GET_PID_FOR_CHILDREN_NAMESPACE:
   196			if (IS_ENABLED(CONFIG_PID_NS)) {
   197				get_pid_ns(nsp->pid_ns_for_children);
   198				ns_common = to_ns_common(nsp->pid_ns_for_children);
   199			}
   200			break;
   201		case PIDFD_GET_TIME_NAMESPACE:
   202			if (IS_ENABLED(CONFIG_TIME_NS)) {
   203				get_time_ns(nsp->time_ns);
   204				ns_common = to_ns_common(nsp->time_ns);
   205			}
   206			break;
   207		case PIDFD_GET_TIME_FOR_CHILDREN_NAMESPACE:
   208			if (IS_ENABLED(CONFIG_TIME_NS)) {
   209				get_time_ns(nsp->time_ns_for_children);
   210				ns_common = to_ns_common(nsp->time_ns_for_children);
   211			}
   212			break;
   213		case PIDFD_GET_UTS_NAMESPACE:
   214			if (IS_ENABLED(CONFIG_UTS_NS)) {
   215				get_uts_ns(nsp->uts_ns);
   216				ns_common = to_ns_common(nsp->uts_ns);
   217			}
   218			break;
   219		/* Namespaces that don't hang of nsproxy. */
   220		case PIDFD_GET_USER_NAMESPACE:
   221			if (IS_ENABLED(CONFIG_USER_NS)) {
   222				rcu_read_lock();
   223				ns_common = to_ns_common(get_user_ns(task_cred_xxx(task, user_ns)));
   224				rcu_read_unlock();
   225			}
   226			break;
   227		case PIDFD_GET_PID_NAMESPACE:
   228			if (IS_ENABLED(CONFIG_PID_NS)) {
   229				rcu_read_lock();
   230				pid_ns = task_active_pid_ns(task);
   231				if (pid_ns)
   232					ns_common = to_ns_common(get_pid_ns(pid_ns));
   233				rcu_read_unlock();
   234			}
   235			break;
   236		case PIDFD_BORROW_GROUPS:
   237			if (task == current)
   238				return 0;
   239			if (!can_borrow_groups(file->f_cred))
   240				return -EPERM;
 > 241			set_current_groups(file->f_cred->group_info);
   242			return 0;
   243		default:
   244			return -ENOIOCTLCMD;
   245		}
   246	
   247		if (!ns_common)
   248			return -EOPNOTSUPP;
   249	
   250		/* open_namespace() unconditionally consumes the reference */
   251		return open_namespace(ns_common);
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

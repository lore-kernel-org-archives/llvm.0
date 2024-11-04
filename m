Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9F4C6C;
	Mon,  4 Nov 2024 04:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730695063; cv=none; b=ub31eWUtaWocbonugqzb7SAPUojR6Jy2U9m7wX6wSYRaYHpHfVFv7Fwb5aH0JwnPoyWHeCuDH+17/vNWEkau9FQmsNk0+r/yrYEdBOoJhGE3/tEGq8N1OBhM6Ir2uGI9DD/5zsNoSq2AQvBf7ldlo/ObpQD1Bv9y6VjAc4Lx6jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730695063; c=relaxed/simple;
	bh=2Gc9lIhSWjtAKvZ/LeEZ0KWffLa+kWDbApLGli6gJVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9xsSbG0jQExdZTgy5TMk3zDywSpBYRCG1RrhhkvW6LJBwSW101uU1cOODHWL98fT/RQj/NXE+YNEQ1OTY+ubE8vPRjfVL8xws5JcvFdjgn76QdzE9/XS5Jd8wacvxrplk5KN9rAIukc5CiwNWmk/ID31LPnrfmamQ8v8CYWBH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifbehhQL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifbehhQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730695062; x=1762231062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Gc9lIhSWjtAKvZ/LeEZ0KWffLa+kWDbApLGli6gJVw=;
  b=ifbehhQLaGW9cuuxfUR3mwW/NjoznixApeyF0Gff7lvr45aWUuGydCH/
   +PVPy0tW307rmT0nnHjVsu7wOEQusz8Zv6tHVSsmlcvCOZeAMwHn1OyMl
   6HSD3uiYtruJkLRSSsnuatMMmvjVrAX9JUNobAJ5RjYdowOPLbCUmeYne
   vFXzNzU8BmYFiB/xjuvdbfwDLDUS6AxOCjWXG/gLrQi5r2ovGs1l6C4s7
   Z3dZoCYg6bwmba58d6Sts/mBrHv5nQfpaRfnr153JXJ0raQDC3wDCkhyP
   ouX0o3Hcq4ujetVVyQLzkzaQsUwucfX8wrVE32KIls4yMjsSd7RvOa03X
   Q==;
X-CSE-ConnectionGUID: gz8zpoQnQc2PET9Tl5LQZA==
X-CSE-MsgGUID: ahzmKenvTsW6mGkpBWpW+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30489047"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30489047"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 20:37:41 -0800
X-CSE-ConnectionGUID: 21BNG7BCSJ2/N4gKqKnE+Q==
X-CSE-MsgGUID: ep04dIoiRFi9weTdx0a9nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88050418"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Nov 2024 20:37:41 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7oqQ-000kT3-0p;
	Mon, 04 Nov 2024 04:37:38 +0000
Date: Mon, 4 Nov 2024 12:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Stas Sergeev <stsp2@yandex.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [POC, RFC] scheme for transferring group_list between processes
Message-ID: <202411041232.3FkRU2FO-lkp@intel.com>
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
config: arm-randconfig-004-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041232.3FkRU2FO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041232.3FkRU2FO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041232.3FkRU2FO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/pidfs.c:9:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/pidfs.c:241:3: error: call to undeclared function 'set_current_groups'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     241 |                 set_current_groups(file->f_cred->group_info);
         |                 ^
   fs/pidfs.c:241:3: note: did you mean 'set_current_blocked'?
   include/linux/signal.h:289:13: note: 'set_current_blocked' declared here
     289 | extern void set_current_blocked(sigset_t *);
         |             ^
   1 warning and 1 error generated.


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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B430762C1;
	Wed, 19 Jun 2024 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839383; cv=none; b=RsmJkh6wmUGzjY+ixV1kjDiYWaaMFeu8uQZ2/43/J1/ikJG7SEEO13gJh0CmoP/ba61j2Os2uxVgFQVh3iZP0gtlTxNYYIubvDqxcT3TcXQlthL5sTGUTtpTS9mfn3lvMs+VVysUq3IqUDngGsDgJRlIBiN6lItnG2E63O6VtFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839383; c=relaxed/simple;
	bh=dElkyoVGCLUinOzGAjwp16Dbh0p9jpIRdluJ7xncyRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOCUkC9VZVy1Y7ZyEKQU6X1Y2pHvaMJPuQIG9zE8/A5OAb0nY9lG0zpninr1OxrWULfO5hnquurHAzjQO/3289YkT0Mb14wepRoEgxH75R7OTlPtLp5cb1QX9yIuSbrJYx5EN4XzkSXDSY0ZKeB9eLkAXSzOqXuaWOheiOatrdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIzAs59H; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIzAs59H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718839381; x=1750375381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dElkyoVGCLUinOzGAjwp16Dbh0p9jpIRdluJ7xncyRg=;
  b=IIzAs59HRXgosrex+BXJf7cSfGsd8DhAaLz66rfmTllsXdbddDQTGLbw
   XwNpFCmfnpb87JQfqceerPP6MFS3xicVfpuRMBW7tdM3OIrUMY3srCoOk
   tXbfiEIVBzI4wIeoBbeHp3+qn59q1DiAnJlY9j7Y9k6rmdyDIUwBPrw5b
   FIS6i0v3fr9npHqFL1h5qSQfa7/8P+BkSusfWC5ZvypgVhW1rQhJYWMPP
   nXnUH9iynNlPJ+NKjxP6PWjX88T2ErNipJFhq8Z9h8pLx2iFrzAKgSSI3
   aiScOOOn5P95MIPIZyHU8qOV+GXv/mIxuwNdIQodBFDq6qlz4PHZvm9nb
   Q==;
X-CSE-ConnectionGUID: 1HalVnMNTQ23wKIJcgvxWQ==
X-CSE-MsgGUID: VNQ61LoBTt+PNu9GDdX8+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19674311"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="19674311"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 16:23:00 -0700
X-CSE-ConnectionGUID: nNzXvhCjQbCNcl2KSe78/A==
X-CSE-MsgGUID: TRQoGMUBSs+ayKP+KsSOJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42717010"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jun 2024 16:22:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK4dk-00075i-2e;
	Wed, 19 Jun 2024 23:22:56 +0000
Date: Thu, 20 Jun 2024 07:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nsfs: add pid translation ioctls
Message-ID: <202406200732.CNSrrOEG-lkp@intel.com>
References: <20240619-work-ns_ioctl-v1-1-7c0097e6bb6b@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-work-ns_ioctl-v1-1-7c0097e6bb6b@kernel.org>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/nsfs-add-pid-translation-ioctls/20240619-215147
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240619-work-ns_ioctl-v1-1-7c0097e6bb6b%40kernel.org
patch subject: [PATCH] nsfs: add pid translation ioctls
config: i386-buildonly-randconfig-002-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200732.CNSrrOEG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200732.CNSrrOEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200732.CNSrrOEG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nsfs.c:193:2: error: cannot jump from switch statement to this case label
     193 |         default:
         |         ^
   fs/nsfs.c:163:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
     163 |                 guard(rcu)();
         |                 ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:95:1: note: expanded from here
      95 | __UNIQUE_ID_guard305
         | ^
   1 error generated.


vim +193 fs/nsfs.c

6786741dbf99e4 Andrey Vagin                2016-09-06  123  
6786741dbf99e4 Andrey Vagin                2016-09-06  124  static long ns_ioctl(struct file *filp, unsigned int ioctl,
6786741dbf99e4 Andrey Vagin                2016-09-06  125  			unsigned long arg)
6786741dbf99e4 Andrey Vagin                2016-09-06  126  {
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  127) 	struct user_namespace *user_ns;
db2704dabb53ec Christian Brauner           2024-06-19  128  	struct pid_namespace *pid_ns;
db2704dabb53ec Christian Brauner           2024-06-19  129  	struct task_struct *tsk;
6786741dbf99e4 Andrey Vagin                2016-09-06  130  	struct ns_common *ns = get_proc_ns(file_inode(filp));
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  131) 	uid_t __user *argp;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  132) 	uid_t uid;
db2704dabb53ec Christian Brauner           2024-06-19  133  	pid_t pid_nr;
6786741dbf99e4 Andrey Vagin                2016-09-06  134  
6786741dbf99e4 Andrey Vagin                2016-09-06  135  	switch (ioctl) {
6786741dbf99e4 Andrey Vagin                2016-09-06  136  	case NS_GET_USERNS:
6786741dbf99e4 Andrey Vagin                2016-09-06  137  		return open_related_ns(ns, ns_get_owner);
a7306ed8d94af7 Andrey Vagin                2016-09-06  138  	case NS_GET_PARENT:
a7306ed8d94af7 Andrey Vagin                2016-09-06  139  		if (!ns->ops->get_parent)
a7306ed8d94af7 Andrey Vagin                2016-09-06  140  			return -EINVAL;
a7306ed8d94af7 Andrey Vagin                2016-09-06  141  		return open_related_ns(ns, ns->ops->get_parent);
e5ff5ce6e20ee2 Michael Kerrisk (man-pages  2017-01-25  142) 	case NS_GET_NSTYPE:
e5ff5ce6e20ee2 Michael Kerrisk (man-pages  2017-01-25  143) 		return ns->ops->type;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  144) 	case NS_GET_OWNER_UID:
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  145) 		if (ns->ops->type != CLONE_NEWUSER)
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  146) 			return -EINVAL;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  147) 		user_ns = container_of(ns, struct user_namespace, ns);
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  148) 		argp = (uid_t __user *) arg;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  149) 		uid = from_kuid_munged(current_user_ns(), user_ns->owner);
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  150) 		return put_user(uid, argp);
db2704dabb53ec Christian Brauner           2024-06-19  151  	case NS_GET_PID_FROM_PIDNS:
db2704dabb53ec Christian Brauner           2024-06-19  152  		fallthrough;
db2704dabb53ec Christian Brauner           2024-06-19  153  	case NS_GET_TGID_FROM_PIDNS:
db2704dabb53ec Christian Brauner           2024-06-19  154  		fallthrough;
db2704dabb53ec Christian Brauner           2024-06-19  155  	case NS_GET_PID_IN_PIDNS:
db2704dabb53ec Christian Brauner           2024-06-19  156  		fallthrough;
db2704dabb53ec Christian Brauner           2024-06-19  157  	case NS_GET_TGID_IN_PIDNS:
db2704dabb53ec Christian Brauner           2024-06-19  158  		if (ns->ops->type != CLONE_NEWPID)
db2704dabb53ec Christian Brauner           2024-06-19  159  			return -EINVAL;
db2704dabb53ec Christian Brauner           2024-06-19  160  
db2704dabb53ec Christian Brauner           2024-06-19  161  		pid_ns = container_of(ns, struct pid_namespace, ns);
db2704dabb53ec Christian Brauner           2024-06-19  162  
db2704dabb53ec Christian Brauner           2024-06-19  163  		guard(rcu)();
db2704dabb53ec Christian Brauner           2024-06-19  164  		if (ioctl == NS_GET_PID_IN_PIDNS ||
db2704dabb53ec Christian Brauner           2024-06-19  165  		    ioctl == NS_GET_TGID_IN_PIDNS)
db2704dabb53ec Christian Brauner           2024-06-19  166  			tsk = find_task_by_vpid(arg);
db2704dabb53ec Christian Brauner           2024-06-19  167  		else
db2704dabb53ec Christian Brauner           2024-06-19  168  			tsk = find_task_by_pid_ns(arg, pid_ns);
db2704dabb53ec Christian Brauner           2024-06-19  169  		if (!tsk)
db2704dabb53ec Christian Brauner           2024-06-19  170  			return -ESRCH;
db2704dabb53ec Christian Brauner           2024-06-19  171  
db2704dabb53ec Christian Brauner           2024-06-19  172  		switch (ioctl) {
db2704dabb53ec Christian Brauner           2024-06-19  173  		case NS_GET_PID_FROM_PIDNS:
db2704dabb53ec Christian Brauner           2024-06-19  174  			pid_nr = task_pid_vnr(tsk);
db2704dabb53ec Christian Brauner           2024-06-19  175  			break;
db2704dabb53ec Christian Brauner           2024-06-19  176  		case NS_GET_TGID_FROM_PIDNS:
db2704dabb53ec Christian Brauner           2024-06-19  177  			pid_nr = task_tgid_vnr(tsk);
db2704dabb53ec Christian Brauner           2024-06-19  178  			break;
db2704dabb53ec Christian Brauner           2024-06-19  179  		case NS_GET_PID_IN_PIDNS:
db2704dabb53ec Christian Brauner           2024-06-19  180  			pid_nr = task_pid_nr_ns(tsk, pid_ns);
db2704dabb53ec Christian Brauner           2024-06-19  181  			break;
db2704dabb53ec Christian Brauner           2024-06-19  182  		case NS_GET_TGID_IN_PIDNS:
db2704dabb53ec Christian Brauner           2024-06-19  183  			pid_nr = task_tgid_nr_ns(tsk, pid_ns);
db2704dabb53ec Christian Brauner           2024-06-19  184  			break;
db2704dabb53ec Christian Brauner           2024-06-19  185  		default:
db2704dabb53ec Christian Brauner           2024-06-19  186  			pid_nr = 0;
db2704dabb53ec Christian Brauner           2024-06-19  187  			break;
db2704dabb53ec Christian Brauner           2024-06-19  188  		}
db2704dabb53ec Christian Brauner           2024-06-19  189  		if (!pid_nr)
db2704dabb53ec Christian Brauner           2024-06-19  190  			return -ESRCH;
db2704dabb53ec Christian Brauner           2024-06-19  191  
db2704dabb53ec Christian Brauner           2024-06-19  192  		return pid_nr;
6786741dbf99e4 Andrey Vagin                2016-09-06 @193  	default:
6786741dbf99e4 Andrey Vagin                2016-09-06  194  		return -ENOTTY;
6786741dbf99e4 Andrey Vagin                2016-09-06  195  	}
6786741dbf99e4 Andrey Vagin                2016-09-06  196  }
6786741dbf99e4 Andrey Vagin                2016-09-06  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

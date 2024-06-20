Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866121B4C43;
	Thu, 20 Jun 2024 18:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718907319; cv=none; b=gxWtNB/0pxHivBfXUSHYjYi3YzfNHteNcPp9kwcbpW5xsILIuvQgEYnlqF2V1NDiT5zhPd6Zi0gViAr5RGEJg4eG+6wjlTES0z7B4Rhcq2+QgoFOC2SEOSJrDulxpL/zlpIdeoaS8/TuQlGF3RluDVs8dNSmKcQEIJvxnqnSdos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718907319; c=relaxed/simple;
	bh=xAvdfexxR7l2luPqmnxY/bYHVyDzxNXg8SzyuJ6+GC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lHj7eO/JNyRs47KkBcnoKqreUaVvZ0NN2RZ8MRH8NoAaZ4lPbp/Lp+aZjmND8kGG6nf5ED7unwuzawHhDP42GGnFMDLszpEUHcX2D/gYe1Kj4nMou5od+uY3NPVJNkdlzyJipp+Pc/4kxpGC/eiU+csYUD1JEBazuolwm0Nmi4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtgcUUht; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtgcUUht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718907317; x=1750443317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xAvdfexxR7l2luPqmnxY/bYHVyDzxNXg8SzyuJ6+GC0=;
  b=CtgcUUhtDc2C4dhxYor7pIPtQ9bHlDcqWHlblrcN39iVBZPmZIaWi5ud
   cf9gWSnMGooj6VOnvRsHvyAXbR9u0QsvoQfQ1fXgwVhPnTe71+BS5ghet
   31bk+fptzLxAz/xzX3mf/FWudgxyg8Mv/tbqzpizopcbsnSDmR+RhQJXo
   zibMhmO0ddZkGI9jFU6A16TKJMnH/1MwsSzRmuqPR8Cnqo9SOnREoSiyv
   Rjapd89t9u+PNn9Cx3omQLMPHnLE9tXAuisdbSZMcQYcoskAy7bBAHZUM
   HkhULVJX7vGRyhp4jrxCwjl3aWOs205tln3zpwLjPlen+9Vswg1gPZI6E
   g==;
X-CSE-ConnectionGUID: LKG4JM8QRyCdZ4t2ngVb1Q==
X-CSE-MsgGUID: cpwkToWNSyyGrq2fbfNERg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16143099"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="16143099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 11:15:17 -0700
X-CSE-ConnectionGUID: nI5D1bHcS6K7U4tb4YwVRw==
X-CSE-MsgGUID: 5R8PNDwoS6yUUT7hSlUlkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="43019124"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jun 2024 11:15:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKMJV-0007ow-0i;
	Thu, 20 Jun 2024 18:15:13 +0000
Date: Fri, 21 Jun 2024 02:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.ns_ioctl 2/2] fs/nsfs.c:199:1: warning: non-void
 function does not return a value in all control paths
Message-ID: <202406210212.G9bLsUTj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.ns_ioctl
head:   8677ab84123aeb7a4ecb3b911d28e7bd547495df
commit: 8677ab84123aeb7a4ecb3b911d28e7bd547495df [2/2] nsfs: add pid translation ioctls
config: i386-buildonly-randconfig-002-20240620 (https://download.01.org/0day-ci/archive/20240621/202406210212.G9bLsUTj-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210212.G9bLsUTj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210212.G9bLsUTj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nsfs.c:199:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
     199 | }
         | ^
   1 warning generated.


vim +199 fs/nsfs.c

6786741dbf99e4 Andrey Vagin                2016-09-06  122  
6786741dbf99e4 Andrey Vagin                2016-09-06  123  static long ns_ioctl(struct file *filp, unsigned int ioctl,
6786741dbf99e4 Andrey Vagin                2016-09-06  124  			unsigned long arg)
6786741dbf99e4 Andrey Vagin                2016-09-06  125  {
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  126) 	struct user_namespace *user_ns;
8677ab84123aeb Christian Brauner           2020-06-07  127  	struct pid_namespace *pid_ns;
8677ab84123aeb Christian Brauner           2020-06-07  128  	struct task_struct *tsk;
6786741dbf99e4 Andrey Vagin                2016-09-06  129  	struct ns_common *ns = get_proc_ns(file_inode(filp));
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  130) 	uid_t __user *argp;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  131) 	uid_t uid;
8677ab84123aeb Christian Brauner           2020-06-07  132  	pid_t pid_nr;
6786741dbf99e4 Andrey Vagin                2016-09-06  133  
6786741dbf99e4 Andrey Vagin                2016-09-06  134  	switch (ioctl) {
6786741dbf99e4 Andrey Vagin                2016-09-06  135  	case NS_GET_USERNS:
6786741dbf99e4 Andrey Vagin                2016-09-06  136  		return open_related_ns(ns, ns_get_owner);
a7306ed8d94af7 Andrey Vagin                2016-09-06  137  	case NS_GET_PARENT:
a7306ed8d94af7 Andrey Vagin                2016-09-06  138  		if (!ns->ops->get_parent)
a7306ed8d94af7 Andrey Vagin                2016-09-06  139  			return -EINVAL;
a7306ed8d94af7 Andrey Vagin                2016-09-06  140  		return open_related_ns(ns, ns->ops->get_parent);
e5ff5ce6e20ee2 Michael Kerrisk (man-pages  2017-01-25  141) 	case NS_GET_NSTYPE:
e5ff5ce6e20ee2 Michael Kerrisk (man-pages  2017-01-25  142) 		return ns->ops->type;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  143) 	case NS_GET_OWNER_UID:
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  144) 		if (ns->ops->type != CLONE_NEWUSER)
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  145) 			return -EINVAL;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  146) 		user_ns = container_of(ns, struct user_namespace, ns);
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  147) 		argp = (uid_t __user *) arg;
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  148) 		uid = from_kuid_munged(current_user_ns(), user_ns->owner);
d95fa3c76a66b6 Michael Kerrisk (man-pages  2017-01-25  149) 		return put_user(uid, argp);
8677ab84123aeb Christian Brauner           2020-06-07  150  	case NS_GET_PID_FROM_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  151  		fallthrough;
8677ab84123aeb Christian Brauner           2020-06-07  152  	case NS_GET_TGID_FROM_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  153  		fallthrough;
8677ab84123aeb Christian Brauner           2020-06-07  154  	case NS_GET_PID_IN_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  155  		fallthrough;
8677ab84123aeb Christian Brauner           2020-06-07  156  	case NS_GET_TGID_IN_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  157  		if (ns->ops->type != CLONE_NEWPID)
8677ab84123aeb Christian Brauner           2020-06-07  158  			return -EINVAL;
8677ab84123aeb Christian Brauner           2020-06-07  159  
8677ab84123aeb Christian Brauner           2020-06-07  160  		pid_nr = -ESRCH;
8677ab84123aeb Christian Brauner           2020-06-07  161  		pid_ns = container_of(ns, struct pid_namespace, ns);
8677ab84123aeb Christian Brauner           2020-06-07  162  
8677ab84123aeb Christian Brauner           2020-06-07  163  		rcu_read_lock();
8677ab84123aeb Christian Brauner           2020-06-07  164  
8677ab84123aeb Christian Brauner           2020-06-07  165  		if (ioctl == NS_GET_PID_IN_PIDNS ||
8677ab84123aeb Christian Brauner           2020-06-07  166  		    ioctl == NS_GET_TGID_IN_PIDNS)
8677ab84123aeb Christian Brauner           2020-06-07  167  			tsk = find_task_by_vpid(arg);
8677ab84123aeb Christian Brauner           2020-06-07  168  		else
8677ab84123aeb Christian Brauner           2020-06-07  169  			tsk = find_task_by_pid_ns(arg, pid_ns);
8677ab84123aeb Christian Brauner           2020-06-07  170  		if (!tsk)
8677ab84123aeb Christian Brauner           2020-06-07  171  			break;
8677ab84123aeb Christian Brauner           2020-06-07  172  
8677ab84123aeb Christian Brauner           2020-06-07  173  		switch (ioctl) {
8677ab84123aeb Christian Brauner           2020-06-07  174  		case NS_GET_PID_FROM_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  175  			pid_nr = task_pid_vnr(tsk);
8677ab84123aeb Christian Brauner           2020-06-07  176  			break;
8677ab84123aeb Christian Brauner           2020-06-07  177  		case NS_GET_TGID_FROM_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  178  			pid_nr = task_tgid_vnr(tsk);
8677ab84123aeb Christian Brauner           2020-06-07  179  			break;
8677ab84123aeb Christian Brauner           2020-06-07  180  		case NS_GET_PID_IN_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  181  			pid_nr = task_pid_nr_ns(tsk, pid_ns);
8677ab84123aeb Christian Brauner           2020-06-07  182  			break;
8677ab84123aeb Christian Brauner           2020-06-07  183  		case NS_GET_TGID_IN_PIDNS:
8677ab84123aeb Christian Brauner           2020-06-07  184  			pid_nr = task_tgid_nr_ns(tsk, pid_ns);
8677ab84123aeb Christian Brauner           2020-06-07  185  			break;
8677ab84123aeb Christian Brauner           2020-06-07  186  		default:
8677ab84123aeb Christian Brauner           2020-06-07  187  			pid_nr = 0;
8677ab84123aeb Christian Brauner           2020-06-07  188  			break;
8677ab84123aeb Christian Brauner           2020-06-07  189  		}
8677ab84123aeb Christian Brauner           2020-06-07  190  		rcu_read_unlock();
8677ab84123aeb Christian Brauner           2020-06-07  191  
8677ab84123aeb Christian Brauner           2020-06-07  192  		if (!pid_nr)
8677ab84123aeb Christian Brauner           2020-06-07  193  			return -ESRCH;
8677ab84123aeb Christian Brauner           2020-06-07  194  
8677ab84123aeb Christian Brauner           2020-06-07  195  		return pid_nr;
6786741dbf99e4 Andrey Vagin                2016-09-06  196  	default:
6786741dbf99e4 Andrey Vagin                2016-09-06  197  		return -ENOTTY;
6786741dbf99e4 Andrey Vagin                2016-09-06  198  	}
6786741dbf99e4 Andrey Vagin                2016-09-06 @199  }
6786741dbf99e4 Andrey Vagin                2016-09-06  200  

:::::: The code at line 199 was first introduced by commit
:::::: 6786741dbf99e44fb0c0ed85a37582b8a26f1c3b nsfs: add ioctl to get an owning user namespace for ns file descriptor

:::::: TO: Andrey Vagin <avagin@openvz.org>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

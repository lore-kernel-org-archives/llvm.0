Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C2030275C;
	Tue, 18 Nov 2025 20:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763498898; cv=none; b=J/CVg1K/yKxN5gh6AnhThG0RclQT3QIvv6d6xtAGDZkPcflYalTdGjkkZRajtUwOWJBO73Szpzv8OWvtHQQr7uh8Un1OM/XckGf0OAHnZy7thpo6VJDT7yQX6zhs0mA5W6zivL1vIWuCCy5vwQgwDE18cAli2TJQ7a3Ty2sGvEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763498898; c=relaxed/simple;
	bh=zjviLzNJhgWtvZ9qNkwMTBL6D2BGi1CiOvJ6I070N5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tUHMXWqe0MzvutHHqQV8vEi2noD2YOqtAFpXnvdUPbOHPEh1Jr4ivAWuW36xZl+kqJmkvM2eoSBp7bOkaZqN++uKUrOrTYnMow+mtegxXzSXz6U2fA5IbbGx2u9oCwwR/f0Y8kMalA6+Zc9ZAfV5oYH/79+pdTc3qMfet4MfFKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iShsArIV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iShsArIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763498896; x=1795034896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zjviLzNJhgWtvZ9qNkwMTBL6D2BGi1CiOvJ6I070N5Y=;
  b=iShsArIVK3qHRLViq4LD16TJzDzOuGH4OCvoNIExKDkeRADspOMUUhCR
   wwvXoIrt0APcjKUe1Grc+Zr4hZXBNL+znH87SK9sUlw3IeY99CmM75ql2
   LDNiJgGCyhJSUR72UZ6esEdi1BAtulVK0jfZpext2RrM1ECcwHoFpcz8g
   AaAlPGNncQOdokCRQvli0IV4zLG71Fuq9wBUJNDPE+1RtbDNaU7S1i+Vr
   sJVYkdkwgoUr8QyetpWfmnlZ+U9wMm7bJjXfc1kErjbTXpBPLd+vAme+V
   /7E0IIGzWQmfdVD35NN63z8hrAd/EBYmXQ8abL8pcXu0i/FxrJCMYgUlf
   g==;
X-CSE-ConnectionGUID: G4xEGYUOTpu7BQjh0Oq1mg==
X-CSE-MsgGUID: XVjH3uHrQnGKts2I7nCxVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88186444"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="88186444"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 12:48:16 -0800
X-CSE-ConnectionGUID: OeBNf/Y5RGOQnuNl4Yrg/A==
X-CSE-MsgGUID: xoQdfvbHQBSZ+giBiy58/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190136898"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 12:48:14 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLScV-00029j-2f;
	Tue, 18 Nov 2025 20:48:11 +0000
Date: Wed, 19 Nov 2025 04:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare 32/43]
 fs/notify/fanotify/fanotify_user.c:1754:4: error: cannot jump from this goto
 statement to its label
Message-ID: <202511190445.EU6ziOp5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.fd.prepare
head:   7eb06f9f7a76175a82d3c6b9d94219d7b64b6bce
commit: c864ed37933e9ae9b91669588b41795afe7d39dd [32/43] fs: fanotify
config: arm-randconfig-003-20251119 (https://download.01.org/0day-ci/archive/20251119/202511190445.EU6ziOp5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190445.EU6ziOp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190445.EU6ziOp5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/notify/fanotify/fanotify_user.c:1754:4: error: cannot jump from this goto statement to its label
    1754 |                         goto out_destroy_group;
         |                         ^
   fs/notify/fanotify/fanotify_user.c:1757:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1757 |         FD_PREPARE(fdprep, f_flags,
         |                    ^
   fs/notify/fanotify/fanotify_user.c:1741:3: error: cannot jump from this goto statement to its label
    1741 |                 goto out_destroy_group;
         |                 ^
   fs/notify/fanotify/fanotify_user.c:1757:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1757 |         FD_PREPARE(fdprep, f_flags,
         |                    ^
   fs/notify/fanotify/fanotify_user.c:1720:3: error: cannot jump from this goto statement to its label
    1720 |                 goto out_destroy_group;
         |                 ^
   fs/notify/fanotify/fanotify_user.c:1757:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1757 |         FD_PREPARE(fdprep, f_flags,
         |                    ^
   fs/notify/fanotify/fanotify_user.c:1714:3: error: cannot jump from this goto statement to its label
    1714 |                 goto out_destroy_group;
         |                 ^
   fs/notify/fanotify/fanotify_user.c:1757:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1757 |         FD_PREPARE(fdprep, f_flags,
         |                    ^
   fs/notify/fanotify/fanotify_user.c:1704:3: error: cannot jump from this goto statement to its label
    1704 |                 goto out_destroy_group;
         |                 ^
   fs/notify/fanotify/fanotify_user.c:1757:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1757 |         FD_PREPARE(fdprep, f_flags,
         |                    ^
   5 errors generated.


vim +1754 fs/notify/fanotify/fanotify_user.c

94e00d28a680df Amir Goldstein      2021-03-04  1599  
52c923dd079df4 Eric Paris          2009-12-17  1600  /* fanotify syscalls */
08ae89380a8210 Eric Paris          2010-05-27  1601  SYSCALL_DEFINE2(fanotify_init, unsigned int, flags, unsigned int, event_f_flags)
11637e4b7dc098 Eric Paris          2009-12-17  1602  {
58f5fbeb367ff6 Amir Goldstein      2025-05-16  1603  	struct user_namespace *user_ns = current_user_ns();
52c923dd079df4 Eric Paris          2009-12-17  1604  	struct fsnotify_group *group;
52c923dd079df4 Eric Paris          2009-12-17  1605  	int f_flags, fd;
83b7a59896dd24 Amir Goldstein      2020-07-16  1606  	unsigned int fid_mode = flags & FANOTIFY_FID_BITS;
83b7a59896dd24 Amir Goldstein      2020-07-16  1607  	unsigned int class = flags & FANOTIFY_CLASS_BITS;
a8b98c808eab3e Amir Goldstein      2021-05-24  1608  	unsigned int internal_flags = 0;
52c923dd079df4 Eric Paris          2009-12-17  1609  
96a71f21ef1fcc Amir Goldstein      2018-09-21  1610  	pr_debug("%s: flags=%x event_f_flags=%x\n",
08ae89380a8210 Eric Paris          2010-05-27  1611  		 __func__, flags, event_f_flags);
52c923dd079df4 Eric Paris          2009-12-17  1612  
7cea2a3c505e87 Amir Goldstein      2021-03-04  1613  	if (!capable(CAP_SYS_ADMIN)) {
7cea2a3c505e87 Amir Goldstein      2021-03-04  1614  		/*
7cea2a3c505e87 Amir Goldstein      2021-03-04  1615  		 * An unprivileged user can setup an fanotify group with
7cea2a3c505e87 Amir Goldstein      2021-03-04  1616  		 * limited functionality - an unprivileged group is limited to
58f5fbeb367ff6 Amir Goldstein      2025-05-16  1617  		 * notification events with file handles or mount ids and it
58f5fbeb367ff6 Amir Goldstein      2025-05-16  1618  		 * cannot use unlimited queue/marks.
7cea2a3c505e87 Amir Goldstein      2021-03-04  1619  		 */
58f5fbeb367ff6 Amir Goldstein      2025-05-16  1620  		if ((flags & FANOTIFY_ADMIN_INIT_FLAGS) ||
58f5fbeb367ff6 Amir Goldstein      2025-05-16  1621  		    !(flags & (FANOTIFY_FID_BITS | FAN_REPORT_MNT)))
a2f13ad0ba5d94 Andreas Gruenbacher 2010-08-24  1622  			return -EPERM;
a8b98c808eab3e Amir Goldstein      2021-05-24  1623  
a8b98c808eab3e Amir Goldstein      2021-05-24  1624  		/*
a8b98c808eab3e Amir Goldstein      2021-05-24  1625  		 * Setting the internal flag FANOTIFY_UNPRIV on the group
a8b98c808eab3e Amir Goldstein      2021-05-24  1626  		 * prevents setting mount/filesystem marks on this group and
a8b98c808eab3e Amir Goldstein      2021-05-24  1627  		 * prevents reporting pid and open fd in events.
a8b98c808eab3e Amir Goldstein      2021-05-24  1628  		 */
a8b98c808eab3e Amir Goldstein      2021-05-24  1629  		internal_flags |= FANOTIFY_UNPRIV;
7cea2a3c505e87 Amir Goldstein      2021-03-04  1630  	}
52c923dd079df4 Eric Paris          2009-12-17  1631  
de8cd83e91bc3e Steve Grubb         2017-10-02  1632  #ifdef CONFIG_AUDITSYSCALL
23c9deeb3285d3 Amir Goldstein      2018-10-04  1633  	if (flags & ~(FANOTIFY_INIT_FLAGS | FAN_ENABLE_AUDIT))
de8cd83e91bc3e Steve Grubb         2017-10-02  1634  #else
23c9deeb3285d3 Amir Goldstein      2018-10-04  1635  	if (flags & ~FANOTIFY_INIT_FLAGS)
de8cd83e91bc3e Steve Grubb         2017-10-02  1636  #endif
52c923dd079df4 Eric Paris          2009-12-17  1637  		return -EINVAL;
52c923dd079df4 Eric Paris          2009-12-17  1638  
af579beb666aef Matthew Bobrowski   2021-08-08  1639  	/*
af579beb666aef Matthew Bobrowski   2021-08-08  1640  	 * A pidfd can only be returned for a thread-group leader; thus
af579beb666aef Matthew Bobrowski   2021-08-08  1641  	 * FAN_REPORT_PIDFD and FAN_REPORT_TID need to remain mutually
af579beb666aef Matthew Bobrowski   2021-08-08  1642  	 * exclusive.
af579beb666aef Matthew Bobrowski   2021-08-08  1643  	 */
af579beb666aef Matthew Bobrowski   2021-08-08  1644  	if ((flags & FAN_REPORT_PIDFD) && (flags & FAN_REPORT_TID))
af579beb666aef Matthew Bobrowski   2021-08-08  1645  		return -EINVAL;
af579beb666aef Matthew Bobrowski   2021-08-08  1646  
0f46d81f2bce97 Miklos Szeredi      2025-01-29  1647  	/* Don't allow mixing mnt events with inode events for now */
0f46d81f2bce97 Miklos Szeredi      2025-01-29  1648  	if (flags & FAN_REPORT_MNT) {
0f46d81f2bce97 Miklos Szeredi      2025-01-29  1649  		if (class != FAN_CLASS_NOTIF)
0f46d81f2bce97 Miklos Szeredi      2025-01-29  1650  			return -EINVAL;
0f46d81f2bce97 Miklos Szeredi      2025-01-29  1651  		if (flags & (FANOTIFY_FID_BITS | FAN_REPORT_FD_ERROR))
0f46d81f2bce97 Miklos Szeredi      2025-01-29  1652  			return -EINVAL;
0f46d81f2bce97 Miklos Szeredi      2025-01-29  1653  	}
0f46d81f2bce97 Miklos Szeredi      2025-01-29  1654  
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1655  	if (event_f_flags & ~FANOTIFY_INIT_ALL_EVENT_F_BITS)
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1656  		return -EINVAL;
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1657  
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1658  	switch (event_f_flags & O_ACCMODE) {
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1659  	case O_RDONLY:
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1660  	case O_RDWR:
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1661  	case O_WRONLY:
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1662  		break;
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1663  	default:
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1664  		return -EINVAL;
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1665  	}
48149e9d3a7e92 Heinrich Schuchardt 2014-06-04  1666  
83b7a59896dd24 Amir Goldstein      2020-07-16  1667  	if (fid_mode && class != FAN_CLASS_NOTIF)
a8b13aa20afb69 Amir Goldstein      2019-01-10  1668  		return -EINVAL;
a8b13aa20afb69 Amir Goldstein      2019-01-10  1669  
929943b38daf81 Amir Goldstein      2020-07-16  1670  	/*
929943b38daf81 Amir Goldstein      2020-07-16  1671  	 * Child name is reported with parent fid so requires dir fid.
691d976352c73f Amir Goldstein      2020-07-16  1672  	 * We can report both child fid and dir fid with or without name.
929943b38daf81 Amir Goldstein      2020-07-16  1673  	 */
691d976352c73f Amir Goldstein      2020-07-16  1674  	if ((fid_mode & FAN_REPORT_NAME) && !(fid_mode & FAN_REPORT_DIR_FID))
83b7a59896dd24 Amir Goldstein      2020-07-16  1675  		return -EINVAL;
83b7a59896dd24 Amir Goldstein      2020-07-16  1676  
d61fd650e9d206 Amir Goldstein      2021-11-29  1677  	/*
d61fd650e9d206 Amir Goldstein      2021-11-29  1678  	 * FAN_REPORT_TARGET_FID requires FAN_REPORT_NAME and FAN_REPORT_FID
d61fd650e9d206 Amir Goldstein      2021-11-29  1679  	 * and is used as an indication to report both dir and child fid on all
d61fd650e9d206 Amir Goldstein      2021-11-29  1680  	 * dirent events.
d61fd650e9d206 Amir Goldstein      2021-11-29  1681  	 */
d61fd650e9d206 Amir Goldstein      2021-11-29  1682  	if ((fid_mode & FAN_REPORT_TARGET_FID) &&
d61fd650e9d206 Amir Goldstein      2021-11-29  1683  	    (!(fid_mode & FAN_REPORT_NAME) || !(fid_mode & FAN_REPORT_FID)))
d61fd650e9d206 Amir Goldstein      2021-11-29  1684  		return -EINVAL;
d61fd650e9d206 Amir Goldstein      2021-11-29  1685  
ebe559609d7829 Al Viro             2024-11-15  1686  	f_flags = O_RDWR;
52c923dd079df4 Eric Paris          2009-12-17  1687  	if (flags & FAN_CLOEXEC)
52c923dd079df4 Eric Paris          2009-12-17  1688  		f_flags |= O_CLOEXEC;
52c923dd079df4 Eric Paris          2009-12-17  1689  	if (flags & FAN_NONBLOCK)
52c923dd079df4 Eric Paris          2009-12-17  1690  		f_flags |= O_NONBLOCK;
52c923dd079df4 Eric Paris          2009-12-17  1691  
52c923dd079df4 Eric Paris          2009-12-17  1692  	/* fsnotify_alloc_group takes a ref.  Dropped in fanotify_release */
867a448d587e7f Amir Goldstein      2022-04-22  1693  	group = fsnotify_alloc_group(&fanotify_fsnotify_ops,
cad3f4a22cfa40 Lizhi Xu            2024-09-27  1694  				     FSNOTIFY_GROUP_USER);
26379198937fcc Eric Paris          2010-11-23  1695  	if (IS_ERR(group)) {
52c923dd079df4 Eric Paris          2009-12-17  1696  		return PTR_ERR(group);
26379198937fcc Eric Paris          2010-11-23  1697  	}
52c923dd079df4 Eric Paris          2009-12-17  1698  
5b8fea65d197f4 Amir Goldstein      2021-03-04  1699  	/* Enforce groups limits per user in all containing user ns */
58f5fbeb367ff6 Amir Goldstein      2025-05-16  1700  	group->fanotify_data.ucounts = inc_ucount(user_ns, current_euid(),
5b8fea65d197f4 Amir Goldstein      2021-03-04  1701  						  UCOUNT_FANOTIFY_GROUPS);
5b8fea65d197f4 Amir Goldstein      2021-03-04  1702  	if (!group->fanotify_data.ucounts) {
5b8fea65d197f4 Amir Goldstein      2021-03-04  1703  		fd = -EMFILE;
5b8fea65d197f4 Amir Goldstein      2021-03-04  1704  		goto out_destroy_group;
5b8fea65d197f4 Amir Goldstein      2021-03-04  1705  	}
5b8fea65d197f4 Amir Goldstein      2021-03-04  1706  
a8b98c808eab3e Amir Goldstein      2021-05-24  1707  	group->fanotify_data.flags = flags | internal_flags;
d46eb14b735b11 Shakeel Butt        2018-08-17  1708  	group->memcg = get_mem_cgroup_from_mm(current->mm);
58f5fbeb367ff6 Amir Goldstein      2025-05-16  1709  	group->user_ns = get_user_ns(user_ns);
4afeff8505cb8a Eric Paris          2010-10-28  1710  
94e00d28a680df Amir Goldstein      2021-03-04  1711  	group->fanotify_data.merge_hash = fanotify_alloc_merge_hash();
94e00d28a680df Amir Goldstein      2021-03-04  1712  	if (!group->fanotify_data.merge_hash) {
94e00d28a680df Amir Goldstein      2021-03-04  1713  		fd = -ENOMEM;
94e00d28a680df Amir Goldstein      2021-03-04  1714  		goto out_destroy_group;
94e00d28a680df Amir Goldstein      2021-03-04  1715  	}
94e00d28a680df Amir Goldstein      2021-03-04  1716  
b8a6c3a2f0ae4d Amir Goldstein      2020-07-08  1717  	group->overflow_event = fanotify_alloc_overflow_event();
b8a6c3a2f0ae4d Amir Goldstein      2020-07-08  1718  	if (unlikely(!group->overflow_event)) {
ff57cd5863cf30 Jan Kara            2014-02-21  1719  		fd = -ENOMEM;
ff57cd5863cf30 Jan Kara            2014-02-21  1720  		goto out_destroy_group;
ff57cd5863cf30 Jan Kara            2014-02-21  1721  	}
ff57cd5863cf30 Jan Kara            2014-02-21  1722  
1e2ee49f7f1b79 Will Woods          2014-05-06  1723  	if (force_o_largefile())
1e2ee49f7f1b79 Will Woods          2014-05-06  1724  		event_f_flags |= O_LARGEFILE;
80af2588676483 Eric Paris          2010-07-28  1725  	group->fanotify_data.f_flags = event_f_flags;
9e66e4233db9c7 Eric Paris          2009-12-17  1726  	init_waitqueue_head(&group->fanotify_data.access_waitq);
9e66e4233db9c7 Eric Paris          2009-12-17  1727  	INIT_LIST_HEAD(&group->fanotify_data.access_list);
b8cf8fda522d5a Miklos Szeredi      2025-09-09  1728  	INIT_LIST_HEAD(&group->fanotify_data.perm_grp_list);
83b7a59896dd24 Amir Goldstein      2020-07-16  1729  	switch (class) {
4231a23530a30e Eric Paris          2010-10-28  1730  	case FAN_CLASS_NOTIF:
477cf917dd0285 Amir Goldstein      2024-03-17  1731  		group->priority = FSNOTIFY_PRIO_NORMAL;
4231a23530a30e Eric Paris          2010-10-28  1732  		break;
4231a23530a30e Eric Paris          2010-10-28  1733  	case FAN_CLASS_CONTENT:
477cf917dd0285 Amir Goldstein      2024-03-17  1734  		group->priority = FSNOTIFY_PRIO_CONTENT;
4231a23530a30e Eric Paris          2010-10-28  1735  		break;
4231a23530a30e Eric Paris          2010-10-28  1736  	case FAN_CLASS_PRE_CONTENT:
477cf917dd0285 Amir Goldstein      2024-03-17  1737  		group->priority = FSNOTIFY_PRIO_PRE_CONTENT;
4231a23530a30e Eric Paris          2010-10-28  1738  		break;
4231a23530a30e Eric Paris          2010-10-28  1739  	default:
4231a23530a30e Eric Paris          2010-10-28  1740  		fd = -EINVAL;
d8153d4d8b7b61 Lino Sanfilippo     2011-06-14  1741  		goto out_destroy_group;
4231a23530a30e Eric Paris          2010-10-28  1742  	}
cb2d429faf2cae Eric Paris          2009-12-17  1743  
90d1238047a647 Amir Goldstein      2025-05-16  1744  	BUILD_BUG_ON(!(FANOTIFY_ADMIN_INIT_FLAGS & FAN_UNLIMITED_QUEUE));
5dd03f55fd2f21 Eric Paris          2010-10-28  1745  	if (flags & FAN_UNLIMITED_QUEUE) {
5dd03f55fd2f21 Eric Paris          2010-10-28  1746  		group->max_events = UINT_MAX;
5dd03f55fd2f21 Eric Paris          2010-10-28  1747  	} else {
5b8fea65d197f4 Amir Goldstein      2021-03-04  1748  		group->max_events = fanotify_max_queued_events;
5dd03f55fd2f21 Eric Paris          2010-10-28  1749  	}
2529a0df0f64da Eric Paris          2010-10-28  1750  
de8cd83e91bc3e Steve Grubb         2017-10-02  1751  	if (flags & FAN_ENABLE_AUDIT) {
de8cd83e91bc3e Steve Grubb         2017-10-02  1752  		fd = -EPERM;
de8cd83e91bc3e Steve Grubb         2017-10-02  1753  		if (!capable(CAP_AUDIT_WRITE))
de8cd83e91bc3e Steve Grubb         2017-10-02 @1754  			goto out_destroy_group;
de8cd83e91bc3e Steve Grubb         2017-10-02  1755  	}
de8cd83e91bc3e Steve Grubb         2017-10-02  1756  
c864ed37933e9a Christian Brauner   2025-11-18  1757  	FD_PREPARE(fdprep, f_flags,
c864ed37933e9a Christian Brauner   2025-11-18  1758  		   anon_inode_getfile_fmode("[fanotify]", &fanotify_fops, group,
c864ed37933e9a Christian Brauner   2025-11-18  1759  					    f_flags, FMODE_NONOTIFY));
c864ed37933e9a Christian Brauner   2025-11-18  1760  	if (!fd_prepare_failed(fdprep))
c864ed37933e9a Christian Brauner   2025-11-18  1761  		return fd_publish(fdprep);
52c923dd079df4 Eric Paris          2009-12-17  1762  
c864ed37933e9a Christian Brauner   2025-11-18  1763  	fd = fd_prepare_error(fdprep);
52c923dd079df4 Eric Paris          2009-12-17  1764  
d8153d4d8b7b61 Lino Sanfilippo     2011-06-14  1765  out_destroy_group:
d8153d4d8b7b61 Lino Sanfilippo     2011-06-14  1766  	fsnotify_destroy_group(group);
52c923dd079df4 Eric Paris          2009-12-17  1767  	return fd;
11637e4b7dc098 Eric Paris          2009-12-17  1768  }
bbaa4168b2d2d8 Eric Paris          2009-12-17  1769  

:::::: The code at line 1754 was first introduced by commit
:::::: de8cd83e91bc3ee212b3e6ec6e4283af9e4ab269 audit: Record fanotify access control decisions

:::::: TO: Steve Grubb <sgrubb@redhat.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

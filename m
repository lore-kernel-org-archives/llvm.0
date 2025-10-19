Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63932E0904;
	Sun, 19 Oct 2025 10:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760868210; cv=none; b=Ha9IRbg6Xq7AhnJxUcB6QGr+S/jKaEccSwwGlMY7z8l+QPoH0ZMnMkfF9bTwLY0AgLunpFGg3NTLPaAmRyKFWqY0sZlQ+2KEEOaMopflY1SQL+DnUzn9yRB9j0YBTSWcrgruY5Fcvon+9HhSnDzcUjLTzH6h2iMe39tjBF6lEIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760868210; c=relaxed/simple;
	bh=qjnnVTxk2B390CDnwKDmnb7U1eo1KGBlaJ4ey+uNxEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jfXtmv69bJe7ko+BLCTs/QKTol9kRYgm/5c0NM4FjLP8WcCDGBeEC4gsL+8dG+5d5P6NqpJCQQEV/2qpWvkI5dl6nYLsWzvj7yfHAqEuSnb/1XAxMOys82tN6VFswJf92p6agQqmorTHAQOU8WvTYsfGOlnNihqh1LN8n966eiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4EJLYgu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4EJLYgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760868209; x=1792404209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qjnnVTxk2B390CDnwKDmnb7U1eo1KGBlaJ4ey+uNxEs=;
  b=f4EJLYgud1fJNqqT8Lf1zNmzP6IrbbQEXMo4Xubl9645sp/As+h3E8aj
   UI9Rj0DsMa33tUNUgVsri4+9vWgZ3aKSIsfHQgpql6uQkFCYeWgS17xEr
   YaT/eYUa5VyemVnZN6JTFBl8fwRG5e1k5mMq3fb1RGpNUcBL4VMwci9h+
   A5vFjKGj07rfoziICrq6MNiV8LIFhKBSwb/aXLZEgj9RH7UP3MAwGtWar
   cc6Xzy4/5WVU3xSpCpNuckN31SoDOiiKYLHIeJh0kkk4qlzjPkiG7rgtl
   K8Vom2vdjDKYj+DkRExVmtwSXjKZxvwNHgabX1pL4Kbxb0mbIVlW35GSQ
   A==;
X-CSE-ConnectionGUID: /+UAw3BAS9Wchxcd85VyPQ==
X-CSE-MsgGUID: XlfOCkQVS9KlMHcXD8u+3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62229510"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="62229510"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 03:03:28 -0700
X-CSE-ConnectionGUID: 8L0tdeMLTSmLMA5uZ1cYKg==
X-CSE-MsgGUID: s7hySJmJTEi19zHxn0Xn5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="187525548"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2025 03:03:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAQG2-00090j-01;
	Sun, 19 Oct 2025 10:03:22 +0000
Date: Sun, 19 Oct 2025 18:02:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:balloon 2/23] drivers/misc/vmw_balloon.c:1857:2:
 error: use of undeclared identifier 'b'
Message-ID: <202510191700.boNYIVSd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux balloon
head:   7eef08e97c0bed3ecf03a02e2283be82b9bce389
commit: 754bcc13125987809bf134f12b7d8db0bf74934c [2/23] vmw_balloon: remove vmballoon_compaction_init()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251019/202510191700.boNYIVSd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191700.boNYIVSd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510191700.boNYIVSd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/vmw_balloon.c:1857:2: error: use of undeclared identifier 'b'
    1857 |         b->b_dev_info.migratepage = vmballoon_migratepage;
         |         ^
   1 error generated.


vim +/b +1857 drivers/misc/vmw_balloon.c

  1837	
  1838	static int __init vmballoon_init(void)
  1839	{
  1840		int error;
  1841	
  1842		/*
  1843		 * Check if we are running on VMware's hypervisor and bail out
  1844		 * if we are not.
  1845		 */
  1846		if (x86_hyper_type != X86_HYPER_VMWARE)
  1847			return -ENODEV;
  1848	
  1849		INIT_DELAYED_WORK(&balloon.dwork, vmballoon_work);
  1850	
  1851		error = vmballoon_register_shrinker(&balloon);
  1852		if (error)
  1853			return error;
  1854	
  1855		balloon_devinfo_init(&balloon.b_dev_info);
  1856	#ifdef CONFIG_BALLOON_COMPACTION
> 1857		b->b_dev_info.migratepage = vmballoon_migratepage;
  1858	#endif /* CONFIG_BALLOON_COMPACTION */
  1859	
  1860		INIT_LIST_HEAD(&balloon.huge_pages);
  1861		spin_lock_init(&balloon.comm_lock);
  1862		init_rwsem(&balloon.conf_sem);
  1863		balloon.vmci_doorbell = VMCI_INVALID_HANDLE;
  1864		balloon.batch_page = NULL;
  1865		balloon.page = NULL;
  1866		balloon.reset_required = true;
  1867	
  1868		queue_delayed_work(system_freezable_wq, &balloon.dwork, 0);
  1869	
  1870		vmballoon_debugfs_init(&balloon);
  1871	
  1872		return 0;
  1873	}
  1874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD74E623;
	Sun, 16 Jul 2023 02:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689475813; x=1721011813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4EZOjBcxwX2CQ/nuj7+yVPS1mMeJ3reTHcqQf+D7yRI=;
  b=TYjUdS+4G6EM3J0r8gSA/RtLw3TCPbFPL/yY2zNGpGcwfPZdcsG28mMx
   5yOv/8JloEJx9pUVnxb+11G2KKxQ9wL5SVpIc5kIDWAPJRki7/HGQu2xw
   NxOMSvqzPYT+JP+ztO3Jo5pzduMyAYj1wKZ8RyMU8bwouY/MPAmSO0GNg
   c/XtPxU6MiJkvQsD8mYheM3k7AezhYj9I8R9qu1idy7zYvS8VgEhIZ7qf
   rcvrDH09aJFr83BX6ROFDN2mBns55iOudSrNo4xf2HRbCmy1Zqk/9KUcN
   rIn8kEiT34XLWqlvMeRzmnpPTVlLP5d2AX1lYxsVpGd4dYV/JXoNTXCJn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="363186868"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="363186868"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 19:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="722813085"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="722813085"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Jul 2023 19:50:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKrpq-0008Un-0N;
	Sun, 16 Jul 2023 02:50:10 +0000
Date: Sun, 16 Jul 2023 10:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 349/365] mm/hugetlb.c:6843:
 warning: expecting prototype for Reserves pages between vma indices @from
 and @to by handling accounting in(). Prototype was for
 hugetlb_reserve_pages() instead
Message-ID: <202307161004.GyQulszL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: c8c40c9db949fdf0d8844aaf62ddd4a02febdb42 [349/365] mm: hugetlb: Decouple hstate, subpool from inode
config: riscv-randconfig-r042-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161004.GyQulszL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161004.GyQulszL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161004.GyQulszL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb.c:6843: warning: Function parameter or member 'h' not described in 'hugetlb_reserve_pages'
   mm/hugetlb.c:6843: warning: Function parameter or member 'spool' not described in 'hugetlb_reserve_pages'
   mm/hugetlb.c:6843: warning: Function parameter or member 'inode' not described in 'hugetlb_reserve_pages'
   mm/hugetlb.c:6843: warning: Function parameter or member 'from' not described in 'hugetlb_reserve_pages'
   mm/hugetlb.c:6843: warning: Function parameter or member 'to' not described in 'hugetlb_reserve_pages'
   mm/hugetlb.c:6843: warning: Function parameter or member 'vma' not described in 'hugetlb_reserve_pages'
   mm/hugetlb.c:6843: warning: Function parameter or member 'vm_flags' not described in 'hugetlb_reserve_pages'
>> mm/hugetlb.c:6843: warning: expecting prototype for Reserves pages between vma indices @from and @to by handling accounting in(). Prototype was for hugetlb_reserve_pages() instead
>> mm/hugetlb.c:6996: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Unreserves pages between vma indices @start and @end by handling accounting
--
>> fs/hugetlbfs/inode.c:554: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Remove folio from page_cache and userspace mappings. Also unreserves pages,


vim +6843 mm/hugetlb.c

8f860591ffb297 Zhang, Yanmin   2006-03-22  6828  
c8c40c9db949fd Ackerley Tng    2023-06-06  6829  /**
c8c40c9db949fd Ackerley Tng    2023-06-06  6830   * Reserves pages between vma indices @from and @to by handling accounting in:
c8c40c9db949fd Ackerley Tng    2023-06-06  6831   * + hstate @h (required)
c8c40c9db949fd Ackerley Tng    2023-06-06  6832   * + subpool @spool (can be NULL)
c8c40c9db949fd Ackerley Tng    2023-06-06  6833   * + @inode (required if @vma is NULL)
c8c40c9db949fd Ackerley Tng    2023-06-06  6834   *
c8c40c9db949fd Ackerley Tng    2023-06-06  6835   * Will setup resv_map in @vma if necessary.
c8c40c9db949fd Ackerley Tng    2023-06-06  6836   * Return true if reservation was successful, false otherwise.
c8c40c9db949fd Ackerley Tng    2023-06-06  6837   */
c8c40c9db949fd Ackerley Tng    2023-06-06  6838  bool hugetlb_reserve_pages(struct hstate *h, struct hugepage_subpool *spool,
c8c40c9db949fd Ackerley Tng    2023-06-06  6839  			   struct inode *inode,
a1e78772d72b26 Mel Gorman      2008-07-23  6840  			   long from, long to,
5a6fe125950676 Mel Gorman      2009-02-10  6841  			   struct vm_area_struct *vma,
ca16d140af91fe KOSAKI Motohiro 2011-05-26  6842  			   vm_flags_t vm_flags)
e4e574b767ba63 Adam Litke      2007-10-16 @6843  {
c5094ec79cbe48 Mike Kravetz    2022-12-16  6844  	long chg = -1, add = -1;
9119a41e9091fb Joonsoo Kim     2014-04-03  6845  	struct resv_map *resv_map;
075a61d07a8eca Mina Almasry    2020-04-01  6846  	struct hugetlb_cgroup *h_cg = NULL;
0db9d74ed8845a Mina Almasry    2020-04-01  6847  	long gbl_reserve, regions_needed = 0;
e4e574b767ba63 Adam Litke      2007-10-16  6848  
63489f8e821144 Mike Kravetz    2018-03-22  6849  	/* This should never happen */
63489f8e821144 Mike Kravetz    2018-03-22  6850  	if (from > to) {
63489f8e821144 Mike Kravetz    2018-03-22  6851  		VM_WARN(1, "%s called with a negative range\n", __func__);
33b8f84a4ee784 Mike Kravetz    2021-02-24  6852  		return false;
63489f8e821144 Mike Kravetz    2018-03-22  6853  	}
63489f8e821144 Mike Kravetz    2018-03-22  6854  
8d9bfb2608145c Mike Kravetz    2022-09-14  6855  	/*
e700898fa075c6 Mike Kravetz    2022-12-12  6856  	 * vma specific semaphore used for pmd sharing and fault/truncation
e700898fa075c6 Mike Kravetz    2022-12-12  6857  	 * synchronization
8d9bfb2608145c Mike Kravetz    2022-09-14  6858  	 */
8d9bfb2608145c Mike Kravetz    2022-09-14  6859  	hugetlb_vma_lock_alloc(vma);
8d9bfb2608145c Mike Kravetz    2022-09-14  6860  
17c9d12e126cb0 Mel Gorman      2009-02-11  6861  	/*
17c9d12e126cb0 Mel Gorman      2009-02-11  6862  	 * Only apply hugepage reservation if asked. At fault time, an
17c9d12e126cb0 Mel Gorman      2009-02-11  6863  	 * attempt will be made for VM_NORESERVE to allocate a page
90481622d75715 David Gibson    2012-03-21  6864  	 * without using reserves
17c9d12e126cb0 Mel Gorman      2009-02-11  6865  	 */
ca16d140af91fe KOSAKI Motohiro 2011-05-26  6866  	if (vm_flags & VM_NORESERVE)
33b8f84a4ee784 Mike Kravetz    2021-02-24  6867  		return true;
17c9d12e126cb0 Mel Gorman      2009-02-11  6868  
a1e78772d72b26 Mel Gorman      2008-07-23  6869  	/*
a1e78772d72b26 Mel Gorman      2008-07-23  6870  	 * Shared mappings base their reservation on the number of pages that
a1e78772d72b26 Mel Gorman      2008-07-23  6871  	 * are already allocated on behalf of the file. Private mappings need
a1e78772d72b26 Mel Gorman      2008-07-23  6872  	 * to reserve the full area even if read-only as mprotect() may be
a1e78772d72b26 Mel Gorman      2008-07-23  6873  	 * called to make the mapping read-write. Assume !vma is a shm mapping
a1e78772d72b26 Mel Gorman      2008-07-23  6874  	 */
9119a41e9091fb Joonsoo Kim     2014-04-03  6875  	if (!vma || vma->vm_flags & VM_MAYSHARE) {
f27a5136f70a8c Mike Kravetz    2019-05-13  6876  		/*
f27a5136f70a8c Mike Kravetz    2019-05-13  6877  		 * resv_map can not be NULL as hugetlb_reserve_pages is only
f27a5136f70a8c Mike Kravetz    2019-05-13  6878  		 * called for inodes for which resv_maps were created (see
f27a5136f70a8c Mike Kravetz    2019-05-13  6879  		 * hugetlbfs_get_inode).
f27a5136f70a8c Mike Kravetz    2019-05-13  6880  		 */
4e35f483850ba4 Joonsoo Kim     2014-04-03  6881  		resv_map = inode_resv_map(inode);
9119a41e9091fb Joonsoo Kim     2014-04-03  6882  
0db9d74ed8845a Mina Almasry    2020-04-01  6883  		chg = region_chg(resv_map, from, to, &regions_needed);
9119a41e9091fb Joonsoo Kim     2014-04-03  6884  	} else {
e9fe92ae0cd28a Mina Almasry    2020-04-01  6885  		/* Private mapping. */
9119a41e9091fb Joonsoo Kim     2014-04-03  6886  		resv_map = resv_map_alloc();
17c9d12e126cb0 Mel Gorman      2009-02-11  6887  		if (!resv_map)
8d9bfb2608145c Mike Kravetz    2022-09-14  6888  			goto out_err;
17c9d12e126cb0 Mel Gorman      2009-02-11  6889  
a1e78772d72b26 Mel Gorman      2008-07-23  6890  		chg = to - from;
84afd99b8398c9 Andy Whitcroft  2008-07-23  6891  
17c9d12e126cb0 Mel Gorman      2009-02-11  6892  		set_vma_resv_map(vma, resv_map);
17c9d12e126cb0 Mel Gorman      2009-02-11  6893  		set_vma_resv_flags(vma, HPAGE_RESV_OWNER);
17c9d12e126cb0 Mel Gorman      2009-02-11  6894  	}
17c9d12e126cb0 Mel Gorman      2009-02-11  6895  
33b8f84a4ee784 Mike Kravetz    2021-02-24  6896  	if (chg < 0)
c50ac050811d64 Dave Hansen     2012-05-29  6897  		goto out_err;
075a61d07a8eca Mina Almasry    2020-04-01  6898  
33b8f84a4ee784 Mike Kravetz    2021-02-24  6899  	if (hugetlb_cgroup_charge_cgroup_rsvd(hstate_index(h),
33b8f84a4ee784 Mike Kravetz    2021-02-24  6900  				chg * pages_per_huge_page(h), &h_cg) < 0)
075a61d07a8eca Mina Almasry    2020-04-01  6901  		goto out_err;
075a61d07a8eca Mina Almasry    2020-04-01  6902  
075a61d07a8eca Mina Almasry    2020-04-01  6903  	if (vma && !(vma->vm_flags & VM_MAYSHARE) && h_cg) {
075a61d07a8eca Mina Almasry    2020-04-01  6904  		/* For private mappings, the hugetlb_cgroup uncharge info hangs
075a61d07a8eca Mina Almasry    2020-04-01  6905  		 * of the resv_map.
075a61d07a8eca Mina Almasry    2020-04-01  6906  		 */
075a61d07a8eca Mina Almasry    2020-04-01  6907  		resv_map_set_hugetlb_cgroup_uncharge_info(resv_map, h_cg, h);
075a61d07a8eca Mina Almasry    2020-04-01  6908  	}
075a61d07a8eca Mina Almasry    2020-04-01  6909  
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6910  	/*
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6911  	 * There must be enough pages in the subpool for the mapping. If
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6912  	 * the subpool has a minimum size, there may be some global
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6913  	 * reservations already in place (gbl_reserve).
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6914  	 */
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  6915  	gbl_reserve = hugepage_subpool_get_pages(spool, chg);
33b8f84a4ee784 Mike Kravetz    2021-02-24  6916  	if (gbl_reserve < 0)
075a61d07a8eca Mina Almasry    2020-04-01  6917  		goto out_uncharge_cgroup;
5a6fe125950676 Mel Gorman      2009-02-10  6918  
5a6fe125950676 Mel Gorman      2009-02-10  6919  	/*
17c9d12e126cb0 Mel Gorman      2009-02-11  6920  	 * Check enough hugepages are available for the reservation.
90481622d75715 David Gibson    2012-03-21  6921  	 * Hand the pages back to the subpool if there are not
5a6fe125950676 Mel Gorman      2009-02-10  6922  	 */
33b8f84a4ee784 Mike Kravetz    2021-02-24  6923  	if (hugetlb_acct_memory(h, gbl_reserve) < 0)
075a61d07a8eca Mina Almasry    2020-04-01  6924  		goto out_put_pages;
17c9d12e126cb0 Mel Gorman      2009-02-11  6925  
17c9d12e126cb0 Mel Gorman      2009-02-11  6926  	/*
17c9d12e126cb0 Mel Gorman      2009-02-11  6927  	 * Account for the reservations made. Shared mappings record regions
17c9d12e126cb0 Mel Gorman      2009-02-11  6928  	 * that have reservations as they are shared by multiple VMAs.
17c9d12e126cb0 Mel Gorman      2009-02-11  6929  	 * When the last VMA disappears, the region map says how much
17c9d12e126cb0 Mel Gorman      2009-02-11  6930  	 * the reservation was and the page cache tells how much of
17c9d12e126cb0 Mel Gorman      2009-02-11  6931  	 * the reservation was consumed. Private mappings are per-VMA and
17c9d12e126cb0 Mel Gorman      2009-02-11  6932  	 * only the consumed reservations are tracked. When the VMA
17c9d12e126cb0 Mel Gorman      2009-02-11  6933  	 * disappears, the original reservation is the VMA size and the
17c9d12e126cb0 Mel Gorman      2009-02-11  6934  	 * consumed reservations are stored in the map. Hence, nothing
17c9d12e126cb0 Mel Gorman      2009-02-11  6935  	 * else has to be done for private mappings here
17c9d12e126cb0 Mel Gorman      2009-02-11  6936  	 */
33039678c8da81 Mike Kravetz    2015-06-24  6937  	if (!vma || vma->vm_flags & VM_MAYSHARE) {
075a61d07a8eca Mina Almasry    2020-04-01  6938  		add = region_add(resv_map, from, to, regions_needed, h, h_cg);
33039678c8da81 Mike Kravetz    2015-06-24  6939  
0db9d74ed8845a Mina Almasry    2020-04-01  6940  		if (unlikely(add < 0)) {
0db9d74ed8845a Mina Almasry    2020-04-01  6941  			hugetlb_acct_memory(h, -gbl_reserve);
075a61d07a8eca Mina Almasry    2020-04-01  6942  			goto out_put_pages;
0db9d74ed8845a Mina Almasry    2020-04-01  6943  		} else if (unlikely(chg > add)) {
33039678c8da81 Mike Kravetz    2015-06-24  6944  			/*
33039678c8da81 Mike Kravetz    2015-06-24  6945  			 * pages in this range were added to the reserve
33039678c8da81 Mike Kravetz    2015-06-24  6946  			 * map between region_chg and region_add.  This
d0ce0e47b323a8 Sidhartha Kumar 2023-01-25  6947  			 * indicates a race with alloc_hugetlb_folio.  Adjust
33039678c8da81 Mike Kravetz    2015-06-24  6948  			 * the subpool and reserve counts modified above
33039678c8da81 Mike Kravetz    2015-06-24  6949  			 * based on the difference.
33039678c8da81 Mike Kravetz    2015-06-24  6950  			 */
33039678c8da81 Mike Kravetz    2015-06-24  6951  			long rsv_adjust;
33039678c8da81 Mike Kravetz    2015-06-24  6952  
d85aecf2844ff0 Miaohe Lin      2021-03-24  6953  			/*
d85aecf2844ff0 Miaohe Lin      2021-03-24  6954  			 * hugetlb_cgroup_uncharge_cgroup_rsvd() will put the
d85aecf2844ff0 Miaohe Lin      2021-03-24  6955  			 * reference to h_cg->css. See comment below for detail.
d85aecf2844ff0 Miaohe Lin      2021-03-24  6956  			 */
075a61d07a8eca Mina Almasry    2020-04-01  6957  			hugetlb_cgroup_uncharge_cgroup_rsvd(
075a61d07a8eca Mina Almasry    2020-04-01  6958  				hstate_index(h),
075a61d07a8eca Mina Almasry    2020-04-01  6959  				(chg - add) * pages_per_huge_page(h), h_cg);
075a61d07a8eca Mina Almasry    2020-04-01  6960  
33039678c8da81 Mike Kravetz    2015-06-24  6961  			rsv_adjust = hugepage_subpool_put_pages(spool,
33039678c8da81 Mike Kravetz    2015-06-24  6962  								chg - add);
33039678c8da81 Mike Kravetz    2015-06-24  6963  			hugetlb_acct_memory(h, -rsv_adjust);
d85aecf2844ff0 Miaohe Lin      2021-03-24  6964  		} else if (h_cg) {
d85aecf2844ff0 Miaohe Lin      2021-03-24  6965  			/*
d85aecf2844ff0 Miaohe Lin      2021-03-24  6966  			 * The file_regions will hold their own reference to
d85aecf2844ff0 Miaohe Lin      2021-03-24  6967  			 * h_cg->css. So we should release the reference held
d85aecf2844ff0 Miaohe Lin      2021-03-24  6968  			 * via hugetlb_cgroup_charge_cgroup_rsvd() when we are
d85aecf2844ff0 Miaohe Lin      2021-03-24  6969  			 * done.
d85aecf2844ff0 Miaohe Lin      2021-03-24  6970  			 */
d85aecf2844ff0 Miaohe Lin      2021-03-24  6971  			hugetlb_cgroup_put_rsvd_cgroup(h_cg);
33039678c8da81 Mike Kravetz    2015-06-24  6972  		}
33039678c8da81 Mike Kravetz    2015-06-24  6973  	}
33b8f84a4ee784 Mike Kravetz    2021-02-24  6974  	return true;
33b8f84a4ee784 Mike Kravetz    2021-02-24  6975  
075a61d07a8eca Mina Almasry    2020-04-01  6976  out_put_pages:
075a61d07a8eca Mina Almasry    2020-04-01  6977  	/* put back original number of pages, chg */
075a61d07a8eca Mina Almasry    2020-04-01  6978  	(void)hugepage_subpool_put_pages(spool, chg);
075a61d07a8eca Mina Almasry    2020-04-01  6979  out_uncharge_cgroup:
075a61d07a8eca Mina Almasry    2020-04-01  6980  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
075a61d07a8eca Mina Almasry    2020-04-01  6981  					    chg * pages_per_huge_page(h), h_cg);
c50ac050811d64 Dave Hansen     2012-05-29  6982  out_err:
8d9bfb2608145c Mike Kravetz    2022-09-14  6983  	hugetlb_vma_lock_free(vma);
5e9113731a3ce6 Mike Kravetz    2015-09-08  6984  	if (!vma || vma->vm_flags & VM_MAYSHARE)
0db9d74ed8845a Mina Almasry    2020-04-01  6985  		/* Only call region_abort if the region_chg succeeded but the
0db9d74ed8845a Mina Almasry    2020-04-01  6986  		 * region_add failed or didn't run.
0db9d74ed8845a Mina Almasry    2020-04-01  6987  		 */
0db9d74ed8845a Mina Almasry    2020-04-01  6988  		if (chg >= 0 && add < 0)
0db9d74ed8845a Mina Almasry    2020-04-01  6989  			region_abort(resv_map, from, to, regions_needed);
f031dd274ccb70 Joonsoo Kim     2014-04-03  6990  	if (vma && is_vma_resv_set(vma, HPAGE_RESV_OWNER))
f031dd274ccb70 Joonsoo Kim     2014-04-03  6991  		kref_put(&resv_map->refs, resv_map_release);
33b8f84a4ee784 Mike Kravetz    2021-02-24  6992  	return false;
a43a8c39bbb493 Kenneth W Chen  2006-06-23  6993  }
a43a8c39bbb493 Kenneth W Chen  2006-06-23  6994  
c8c40c9db949fd Ackerley Tng    2023-06-06  6995  /**
c8c40c9db949fd Ackerley Tng    2023-06-06 @6996   * Unreserves pages between vma indices @start and @end by handling accounting
c8c40c9db949fd Ackerley Tng    2023-06-06  6997   * in:
c8c40c9db949fd Ackerley Tng    2023-06-06  6998   * + hstate @h (required)
c8c40c9db949fd Ackerley Tng    2023-06-06  6999   * + subpool @spool (can be NULL)
c8c40c9db949fd Ackerley Tng    2023-06-06  7000   * + @inode (required)
c8c40c9db949fd Ackerley Tng    2023-06-06  7001   * + resv_map in @inode (can be NULL)
c8c40c9db949fd Ackerley Tng    2023-06-06  7002   *
c8c40c9db949fd Ackerley Tng    2023-06-06  7003   * @freed is the number of pages freed, for updating inode->i_blocks.
c8c40c9db949fd Ackerley Tng    2023-06-06  7004   *
c8c40c9db949fd Ackerley Tng    2023-06-06  7005   * Returns 0 on success.
c8c40c9db949fd Ackerley Tng    2023-06-06  7006   */
c8c40c9db949fd Ackerley Tng    2023-06-06  7007  long hugetlb_unreserve_pages(struct hstate *h, struct hugepage_subpool *spool,
c8c40c9db949fd Ackerley Tng    2023-06-06  7008  			     struct inode *inode, long start, long end, long freed)
a43a8c39bbb493 Kenneth W Chen  2006-06-23  7009  {
4e35f483850ba4 Joonsoo Kim     2014-04-03  7010  	struct resv_map *resv_map = inode_resv_map(inode);
9119a41e9091fb Joonsoo Kim     2014-04-03  7011  	long chg = 0;
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  7012  	long gbl_reserve;
45c682a68a8725 Ken Chen        2007-11-14  7013  
f27a5136f70a8c Mike Kravetz    2019-05-13  7014  	/*
f27a5136f70a8c Mike Kravetz    2019-05-13  7015  	 * Since this routine can be called in the evict inode path for all
f27a5136f70a8c Mike Kravetz    2019-05-13  7016  	 * hugetlbfs inodes, resv_map could be NULL.
f27a5136f70a8c Mike Kravetz    2019-05-13  7017  	 */
b5cec28d36f5ee Mike Kravetz    2015-09-08  7018  	if (resv_map) {
b5cec28d36f5ee Mike Kravetz    2015-09-08  7019  		chg = region_del(resv_map, start, end);
b5cec28d36f5ee Mike Kravetz    2015-09-08  7020  		/*
b5cec28d36f5ee Mike Kravetz    2015-09-08  7021  		 * region_del() can fail in the rare case where a region
b5cec28d36f5ee Mike Kravetz    2015-09-08  7022  		 * must be split and another region descriptor can not be
b5cec28d36f5ee Mike Kravetz    2015-09-08  7023  		 * allocated.  If end == LONG_MAX, it will not fail.
b5cec28d36f5ee Mike Kravetz    2015-09-08  7024  		 */
b5cec28d36f5ee Mike Kravetz    2015-09-08  7025  		if (chg < 0)
b5cec28d36f5ee Mike Kravetz    2015-09-08  7026  			return chg;
b5cec28d36f5ee Mike Kravetz    2015-09-08  7027  	}
b5cec28d36f5ee Mike Kravetz    2015-09-08  7028  
45c682a68a8725 Ken Chen        2007-11-14  7029  	spin_lock(&inode->i_lock);
e4c6f8bed01f9f Eric Sandeen    2009-07-29  7030  	inode->i_blocks -= (blocks_per_huge_page(h) * freed);
45c682a68a8725 Ken Chen        2007-11-14  7031  	spin_unlock(&inode->i_lock);
45c682a68a8725 Ken Chen        2007-11-14  7032  
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  7033  	/*
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  7034  	 * If the subpool has a minimum size, the number of global
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  7035  	 * reservations to be released may be adjusted.
dddf31a49a0eb8 Miaohe Lin      2021-05-04  7036  	 *
dddf31a49a0eb8 Miaohe Lin      2021-05-04  7037  	 * Note that !resv_map implies freed == 0. So (chg - freed)
dddf31a49a0eb8 Miaohe Lin      2021-05-04  7038  	 * won't go negative.
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  7039  	 */
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  7040  	gbl_reserve = hugepage_subpool_put_pages(spool, (chg - freed));
1c5ecae3a93fa1 Mike Kravetz    2015-04-15  7041  	hugetlb_acct_memory(h, -gbl_reserve);
b5cec28d36f5ee Mike Kravetz    2015-09-08  7042  
b5cec28d36f5ee Mike Kravetz    2015-09-08  7043  	return 0;
a43a8c39bbb493 Kenneth W Chen  2006-06-23  7044  }
93f70f900da36f Naoya Horiguchi 2010-05-28  7045  

:::::: The code at line 6843 was first introduced by commit
:::::: e4e574b767ba63101cfda2b42d72f38546319297 hugetlb: Try to grow hugetlb pool for MAP_SHARED mappings

:::::: TO: Adam Litke <agl@us.ibm.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

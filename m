Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373EF1D5ACF;
	Thu, 24 Apr 2025 05:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745474319; cv=none; b=j86bmht//g3NWqNJ9YknfRYeLKxcXcAGBTbWQ58NLEQT2TXVKLSmNaYmi7nV9qwBDpuHq2Eyh+9BRvqYkwjubaKb4ycQnsSzC/ekBzg/K2JYuGopqBUGzZHNd8IRTDqDvo6/qGRxHBouej5i9VXz2hI+lfygcyxylnzC/Vp+0TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745474319; c=relaxed/simple;
	bh=QcON6Vv2bZdqNqf1fspr6m9RLaDgZe3Vb7hkWzyFoV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dU0Kdjt/lS+Ix5aFbw1/Hzu4Paz0WqN0J200fPa1p15O5BZacoVCAJ1KF7n0jfAoCse1u6JZp37l7MZR9WXjnnJT1KXqWyFVtPekfAU+nwn4+McNTcAAQtIW2rNznI9NzZDgKBYTfkiNZLeq0VlbJODOtuqmfWsq4DPyLZGNwGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlYu8MXJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlYu8MXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745474317; x=1777010317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QcON6Vv2bZdqNqf1fspr6m9RLaDgZe3Vb7hkWzyFoV4=;
  b=HlYu8MXJNLuNWx21ocrP0y1Z7/tKEMDe/RlYHoSkjek/XB0/LZUJEC7w
   qwjW3POLCpossYRtiAFTQmp75HHHzYTBNo67T1gzhHOjOn5TNPXQxZ40+
   h0b89wsRKrK9wlGLGIkaxXsfdiD2EnZaPfxuPzWue95S5/ErUM99MlH4P
   Ah+xM1RW0NtytguXIaMmkz9wYqCGmaq+xfFmLGcrs1aa2T6oG2LxmrRt9
   faS+CcnPbqZs+lzRbh67AQ8ykIdOYvlh2/lcydvxyf0vGg6nz7TsdhMVk
   +SLauscu1IVEWLhQfPwIoY28asO9dHoN2o1M0J7PRHEvhvHHHswkp7o/8
   w==;
X-CSE-ConnectionGUID: 7VKtrqe/TYGhDKFfjz7QnA==
X-CSE-MsgGUID: mLtlM9dlSS2Q/5DPbSGxlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47000542"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="47000542"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 22:58:36 -0700
X-CSE-ConnectionGUID: gU7cqZ1iQ16oGnm0YW3DzA==
X-CSE-MsgGUID: VbI0dFV8Q8mvfjRC5EReSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132356913"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Apr 2025 22:58:35 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7pbU-0003tx-30;
	Thu, 24 Apr 2025 05:58:32 +0000
Date: Thu, 24 Apr 2025 13:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20250423-v6.15-rc3-ext4-fix 2/2] mm/migrate.c:963:22: error:
 use of undeclared identifier 'bh_migrate_folio_norefs_nohead_invalid'; did
 you mean 'bh_migrate_folio_norefs_nohead_fails'?
Message-ID: <202504241311.7F6k4FJY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20250423-v6.15-rc3-ext4-fix
head:   58ad1a2b2d0abfd272e05e695cd4c635f49e934e
commit: 58ad1a2b2d0abfd272e05e695cd4c635f49e934e [2/2] mm: add migration buffer-head debugfs interface
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250424/202504241311.7F6k4FJY-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504241311.7F6k4FJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504241311.7F6k4FJY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/migrate.c:963:22: error: use of undeclared identifier 'bh_migrate_folio_norefs_nohead_invalid'; did you mean 'bh_migrate_folio_norefs_nohead_fails'?
     963 |                                 atomic_long_inc(&bh_migrate_folio_norefs_nohead_invalid);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  bh_migrate_folio_norefs_nohead_fails
   mm/migrate.c:818:1: note: 'bh_migrate_folio_norefs_nohead_fails' declared here
     818 | BH_STATS(DECLARE_STAT)
         | ^
   mm/migrate.c:809:4: note: expanded from macro 'BH_STATS'
     809 |         X(bh_migrate_folio_norefs_nohead_fails, 1, "no-head-fails")            \
         |           ^
   1 error generated.


vim +963 mm/migrate.c

   947	
   948	static int __buffer_migrate_folio(struct address_space *mapping,
   949			struct folio *dst, struct folio *src, enum migrate_mode mode,
   950			bool check_refs)
   951	{
   952		struct buffer_head *bh, *head;
   953		int rc;
   954		int expected_count;
   955	
   956		head = folio_buffers(src);
   957		if (!head) {
   958			rc = migrate_folio(mapping, dst, src, mode);
   959			if (check_refs) {
   960				if (rc == 0)
   961					atomic_long_inc(&bh_migrate_folio_norefs_nohead_success);
   962				else
 > 963					atomic_long_inc(&bh_migrate_folio_norefs_nohead_invalid);
   964			}
   965			return rc;
   966		}
   967	
   968		/* Check whether page does not have extra refs before we do more work */
   969		expected_count = folio_expected_refs(mapping, src);
   970		if (folio_ref_count(src) != expected_count)
   971			return -EAGAIN;
   972	
   973		if (!buffer_migrate_lock_buffers(head, mode))
   974			return -EAGAIN;
   975	
   976		if (check_refs) {
   977			bool busy, migrating;
   978			bool invalidated = false;
   979	
   980			migrating = test_and_set_bit_lock(BH_Migrate, &head->b_state);
   981			VM_WARN_ON_ONCE(migrating);
   982	recheck_buffers:
   983			busy = false;
   984			spin_lock(&mapping->i_private_lock);
   985			bh = head;
   986			do {
   987				if (atomic_read(&bh->b_count)) {
   988					busy = true;
   989					break;
   990				}
   991				bh = bh->b_this_page;
   992			} while (bh != head);
   993			spin_unlock(&mapping->i_private_lock);
   994			if (busy) {
   995				if (invalidated) {
   996					rc = -EAGAIN;
   997					atomic_long_inc(&bh_migrate_folio_norefs_busy);
   998					goto unlock_buffers;
   999				}
  1000				invalidate_bh_lrus();
  1001				invalidated = true;
  1002				goto recheck_buffers;
  1003			}
  1004			atomic_long_inc(&bh_migrate_folio_norefs_valid);
  1005		}
  1006	
  1007		rc = filemap_migrate_folio(mapping, dst, src, mode);
  1008		if (rc != MIGRATEPAGE_SUCCESS) {
  1009			if (check_refs)
  1010				atomic_long_inc(&bh_migrate_folio_norefs_valid_fails);
  1011			goto unlock_buffers;
  1012		} else if (check_refs)
  1013			atomic_long_inc(&bh_migrate_folio_norefs_valid_success);
  1014	
  1015		bh = head;
  1016		do {
  1017			folio_set_bh(bh, dst, bh_offset(bh));
  1018			bh = bh->b_this_page;
  1019		} while (bh != head);
  1020	
  1021	unlock_buffers:
  1022		if (check_refs)
  1023			clear_bit_unlock(BH_Migrate, &head->b_state);
  1024		bh = head;
  1025		do {
  1026			unlock_buffer(bh);
  1027			bh = bh->b_this_page;
  1028		} while (bh != head);
  1029	
  1030		return rc;
  1031	}
  1032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

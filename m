Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6838B7C;
	Wed,  8 Mar 2023 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678269164; x=1709805164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PCPyHNgCxrQRG9x9QwjOIgUAU6Qtd8IovB+1/nsFOXo=;
  b=i4QjIYYKZQ2Gegog8/tzKwZrPSIJEfNVWBGGg5Y8URnG3htP56UPSLoB
   CsSHAtEn24Kzkv3kck3reIzT6ueCv1Wdk1xceET1qOmD1DrOk5LlIyGb7
   8g/kIu0HenAsfBMdgtuywk0QB7hEHoC4SODTe19avtsK5kl/NIO3fM6e+
   VBOFopu6raLHgn51j5BHpHk8hXw5GirSJFi7W0X0wxPpGlU8/XzE63Nbj
   0F0ADEn+MpPug/toEr04L0bYED47HNIPRd6U8GoDuKny8GXFfuhzfP60D
   Az4bQhMsVyY0sccXfdAB9sb/zqRueUrpJR6bwGiRzyXufRxgoJo83FgIZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398692113"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="398692113"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 01:52:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787059165"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="787059165"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2023 01:52:42 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZqTR-000222-1g;
	Wed, 08 Mar 2023 09:52:41 +0000
Date: Wed, 8 Mar 2023 17:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <dchinner@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof:20230307-larger-bs-then-ps-xfs 7/11]
 fs/iomap/buffered-io.c:1424:8: warning: variable 'status' set but not used
Message-ID: <202303081717.EQfvs6xM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230307-larger-bs-then-ps-xfs
head:   e42ac7981c9cbcd80d1ffa2ad03c96574a320a62
commit: 89e0dbe34eb365d865a0b459668e5abe17cf95c8 [7/11] iomap: zero-around in iomap_page_mkwrite
config: i386-randconfig-a011-20230306 (https://download.01.org/0day-ci/archive/20230308/202303081717.EQfvs6xM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=89e0dbe34eb365d865a0b459668e5abe17cf95c8
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230307-larger-bs-then-ps-xfs
        git checkout 89e0dbe34eb365d865a0b459668e5abe17cf95c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/iomap/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081717.EQfvs6xM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/iomap/buffered-io.c:1424:8: warning: variable 'status' set but not used [-Wunused-but-set-variable]
                   long status;
                        ^
>> fs/iomap/buffered-io.c:1449:7: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   if (ret)
                       ^~~
   fs/iomap/buffered-io.c:1416:12: note: initialize the variable 'ret' to silence this warning
           loff_t ret;
                     ^
                      = 0
   2 warnings generated.


vim +/status +1424 fs/iomap/buffered-io.c

  1411	
  1412	static loff_t iomap_folio_mkwrite_iter(struct iomap_iter *iter,
  1413			struct folio *folio, const struct iomap_ops *ops)
  1414	{
  1415		loff_t length = iomap_length(iter);
  1416		loff_t ret;
  1417	
  1418		/*
  1419		 * if we need to zero-around, we have to unlock the page we were given.
  1420		 * No big deal, we just have to repeat the "is this page ours" checks
  1421		 * after relocking it
  1422		 */
  1423		if (iomap_need_zero_around(iter)) {
> 1424			long status;
  1425			loff_t size;
  1426	
  1427			/*
  1428			 * This only happens for block size > page size, so the file
  1429			 * offset of a page fault should always be page aligned.
  1430			 */
  1431			WARN_ON(offset_in_folio(folio, iter->pos));
  1432	
  1433			folio_unlock(folio);
  1434			status = iomap_zero_around(iter, iter->pos, length, ops);
  1435			folio_lock(folio);
  1436			size = i_size_read(iter->inode);
  1437			if ((folio->mapping != iter->inode->i_mapping) ||
  1438			    (folio_pos(folio) > size)) {
  1439				/* We overload EFAULT to mean page got truncated */
  1440				return -EFAULT;
  1441			}
  1442	
  1443			if (folio_pos(folio) != iter->pos) {
  1444				/* it moved in the file! */
  1445				return -EFAULT;
  1446			}
  1447	
  1448			/* return failure now if zeroing had an error */
> 1449			if (ret)
  1450				return ret;
  1451	
  1452			/* trim down the length is we straddle EOF. */
  1453			if (((folio->index + 1) << PAGE_SHIFT) > size)
  1454				length = offset_in_folio(folio, size);
  1455	
  1456		}
  1457	
  1458		if (iter->iomap.flags & IOMAP_F_BUFFER_HEAD) {
  1459			ret = __block_write_begin_int(folio, iter->pos, length, NULL,
  1460						      &iter->iomap);
  1461			if (ret)
  1462				return ret;
  1463			block_commit_write(&folio->page, 0, length);
  1464		} else {
  1465			WARN_ON_ONCE(!folio_test_uptodate(folio));
  1466			folio_mark_dirty(folio);
  1467		}
  1468	
  1469		return length;
  1470	}
  1471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

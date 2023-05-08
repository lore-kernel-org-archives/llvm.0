Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33CB5CB0;
	Mon,  8 May 2023 05:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683522089; x=1715058089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a1TbnPofXC+fOO3uSyOL23lQDUKUOCR7DC+2MsqaOAU=;
  b=GvBy2u89OueN9YP4333nDLg2fekfKm+Q3Hgq+O+nrl+1AvKKKm9z80M/
   N40SuGGCxSPv6dI1ZeManSYdUPgcHoQaJxpXZvdo3i7bOOj6NBQqEiOCL
   h3JcU50QLhlQtJCke5hLZQy39xHzEOUaZqZvG7BS9sLJoaYhbiWIbCklQ
   34MEVOVG26jkAbX+k4uSDvVL5610iowfm1yefzwbw5fUTqWLT+1OVeagV
   iv/n/5Ysx1SJfoVbDdDYHvj4BwKVkCpgSyS1Y3Pm8JF76P/5YHkT+bYGE
   PG/v6js3vdstJqgs6Pd/rMtzCYdPaVyMsWpB+peU9goBSCs1tqEK2yPM5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="415115323"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="415115323"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 22:01:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="675919756"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="675919756"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 May 2023 22:01:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvszz-00013d-0E;
	Mon, 08 May 2023 05:01:23 +0000
Date: Mon, 8 May 2023 13:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFCv5 5/5] iomap: Add per-block dirty state tracking to improve
 performance
Message-ID: <202305081251.SqsWX3bZ-lkp@intel.com>
References: <86987466d8d7863bd0dca81e9d6c3eff7abd4964.1683485700.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86987466d8d7863bd0dca81e9d6c3eff7abd4964.1683485700.git.ritesh.list@gmail.com>

Hi Ritesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on gfs2/for-next linus/master v6.4-rc1 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ritesh-Harjani-IBM/iomap-Rename-iomap_page_create-release-to-iop_alloc-free/20230508-032903
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/86987466d8d7863bd0dca81e9d6c3eff7abd4964.1683485700.git.ritesh.list%40gmail.com
patch subject: [RFCv5 5/5] iomap: Add per-block dirty state tracking to improve performance
config: i386-randconfig-a001-20230508 (https://download.01.org/0day-ci/archive/20230508/202305081251.SqsWX3bZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a05d7e56a951c074e0d13c4e9908a90b4e14ad92
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ritesh-Harjani-IBM/iomap-Rename-iomap_page_create-release-to-iop_alloc-free/20230508-032903
        git checkout a05d7e56a951c074e0d13c4e9908a90b4e14ad92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/iomap/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081251.SqsWX3bZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/iomap/buffered-io.c:311:21: warning: variable 'iop' set but not used [-Wunused-but-set-variable]
           struct iomap_page *iop;
                              ^
   fs/iomap/buffered-io.c:626:21: warning: variable 'iop' set but not used [-Wunused-but-set-variable]
           struct iomap_page *iop;
                              ^
>> fs/iomap/buffered-io.c:1032:37: warning: variable 'blks_per_folio' set but not used [-Wunused-but-set-variable]
                   unsigned int first_blk, last_blk, blks_per_folio, i;
                                                     ^
   3 warnings generated.


vim +/blks_per_folio +1032 fs/iomap/buffered-io.c

  1007	
  1008	/*
  1009	 * Scan the data range passed to us for dirty page cache folios. If we find a
  1010	 * dirty folio, punch out the preceeding range and update the offset from which
  1011	 * the next punch will start from.
  1012	 *
  1013	 * We can punch out storage reservations under clean pages because they either
  1014	 * contain data that has been written back - in which case the delalloc punch
  1015	 * over that range is a no-op - or they have been read faults in which case they
  1016	 * contain zeroes and we can remove the delalloc backing range and any new
  1017	 * writes to those pages will do the normal hole filling operation...
  1018	 *
  1019	 * This makes the logic simple: we only need to keep the delalloc extents only
  1020	 * over the dirty ranges of the page cache.
  1021	 *
  1022	 * This function uses [start_byte, end_byte) intervals (i.e. open ended) to
  1023	 * simplify range iterations.
  1024	 */
  1025	static int iomap_write_delalloc_scan(struct inode *inode,
  1026			loff_t *punch_start_byte, loff_t start_byte, loff_t end_byte,
  1027			int (*punch)(struct inode *inode, loff_t offset, loff_t length))
  1028	{
  1029		while (start_byte < end_byte) {
  1030			struct folio	*folio;
  1031			struct iomap_page *iop;
> 1032			unsigned int first_blk, last_blk, blks_per_folio, i;
  1033			loff_t last_byte;
  1034			u8 blkbits = inode->i_blkbits;
  1035	
  1036			/* grab locked page */
  1037			folio = filemap_lock_folio(inode->i_mapping,
  1038					start_byte >> PAGE_SHIFT);
  1039			if (!folio) {
  1040				start_byte = ALIGN_DOWN(start_byte, PAGE_SIZE) +
  1041						PAGE_SIZE;
  1042				continue;
  1043			}
  1044	
  1045			/* if dirty, punch up to offset */
  1046			if (folio_test_dirty(folio)) {
  1047				if (start_byte > *punch_start_byte) {
  1048					int	error;
  1049	
  1050					error = punch(inode, *punch_start_byte,
  1051							start_byte - *punch_start_byte);
  1052					if (error) {
  1053						folio_unlock(folio);
  1054						folio_put(folio);
  1055						return error;
  1056					}
  1057				}
  1058	
  1059				/*
  1060				 * When we have per-block dirty tracking, there can be
  1061				 * blocks within a folio which are marked uptodate
  1062				 * but not dirty. In that case it is necessary to punch
  1063				 * out such blocks to avoid leaking any delalloc blocks.
  1064				 */
  1065				iop = to_iomap_page(folio);
  1066				if (!iop)
  1067					goto skip_iop_punch;
  1068				last_byte = min_t(loff_t, end_byte - 1,
  1069					(folio_next_index(folio) << PAGE_SHIFT) - 1);
  1070				first_blk = offset_in_folio(folio, start_byte) >>
  1071							    blkbits;
  1072				last_blk = offset_in_folio(folio, last_byte) >>
  1073							   blkbits;
  1074				blks_per_folio = i_blocks_per_folio(inode, folio);
  1075				for (i = first_blk; i <= last_blk; i++) {
  1076					if (!iop_test_block_dirty(folio, i))
  1077						punch(inode, i << blkbits,
  1078							     1 << blkbits);
  1079				}
  1080	skip_iop_punch:
  1081				/*
  1082				 * Make sure the next punch start is correctly bound to
  1083				 * the end of this data range, not the end of the folio.
  1084				 */
  1085				*punch_start_byte = min_t(loff_t, end_byte,
  1086						folio_next_index(folio) << PAGE_SHIFT);
  1087			}
  1088	
  1089			/* move offset to start of next folio in range */
  1090			start_byte = folio_next_index(folio) << PAGE_SHIFT;
  1091			folio_unlock(folio);
  1092			folio_put(folio);
  1093		}
  1094		return 0;
  1095	}
  1096	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

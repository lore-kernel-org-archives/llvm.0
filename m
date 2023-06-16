Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E79A16416;
	Fri, 16 Jun 2023 14:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686925773; x=1718461773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GGTj68Q1zpQ9vUY1SxL1gwehrhSLRpRjEuf3De9CQgE=;
  b=FLMVKzSGy3R4AlJnt3iI1SHIMhKismy0hVeQs73jr2e61xS093POx2yL
   t1Hiy09oRlVxAr+dtUASRtl2gAppHD2QMu0CMRD3jpP7fiTniH8pra1fV
   U1bPvAM7ia4Qdomk7AHVqE6OcaBF9GCdiRCUkYRO3m4vmkWaK945sgSKn
   UyUOJDpZLCBTBZ/769wXGY22wwh41U+ui/YoP9E5IJok0RRFjmBxLEKrw
   RIBMh8ATwDH+kV1Jb10R7VC/zvtynKZqEJxXbYU6zLvdsyNcmTsptNyrf
   KOdrM+yRXYX0KbcD215VS6/KCYT0fNs5oNiF0ZX5zVJq7f+eLj+R0dhPK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="422876749"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="422876749"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 07:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="663206447"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="663206447"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Jun 2023 07:29:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAASA-0001Jo-1S;
	Fri, 16 Jun 2023 14:29:30 +0000
Date: Fri, 16 Jun 2023 22:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 11/20]
 fs/proc/proc_sysctl.c:1378:46: error: anonymous bit-field has negative width
 (-1)
Message-ID: <202306162259.EnNVE6AU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   669cf696035fa888754f34d948b9488c2206dd7d
commit: b802dfaa54bfd76a004a5d213a83f3f6caf5d926 [11/20] sysctl: Add size argument to init_header
config: i386-randconfig-r024-20230615 (https://download.01.org/0day-ci/archive/20230616/202306162259.EnNVE6AU-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306162259.EnNVE6AU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306162259.EnNVE6AU-lkp@intel.com/

Note: the joelgranados/jag/sysctl-testing-for-0day HEAD 669cf696035fa888754f34d948b9488c2206dd7d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/proc/proc_sysctl.c:1378:46: warning: 'sizeof (table)' will return the size of the pointer, not the array itself [-Wsizeof-pointer-div]
           init_header(header, root, set, node, table, ARRAY_SIZE(table));
                                                       ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:56:38: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                            ~~~~~~~~~~~ ^
   fs/proc/proc_sysctl.c:1360:38: note: pointer 'table' declared here
           const char *path, struct ctl_table *table)
                                               ^
>> fs/proc/proc_sysctl.c:1378:46: error: anonymous bit-field has negative width (-1)
           init_header(header, root, set, node, table, ARRAY_SIZE(table));
                                                       ^
   include/linux/kernel.h:56:59: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                             ^
   include/linux/compiler.h:232:28: note: expanded from macro '__must_be_array'
   #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                                   ^
   include/linux/build_bug.h:16:53: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
                                                       ^
   1 warning and 1 error generated.


vim +1378 fs/proc/proc_sysctl.c

  1309	
  1310	/**
  1311	 * __register_sysctl_table - register a leaf sysctl table
  1312	 * @set: Sysctl tree to register on
  1313	 * @path: The path to the directory the sysctl table is in.
  1314	 * @table: the top-level table structure without any child. This table
  1315	 * 	 should not be free'd after registration. So it should not be
  1316	 * 	 used on stack. It can either be a global or dynamically allocated
  1317	 * 	 by the caller and free'd later after sysctl unregistration.
  1318	 *
  1319	 * Register a sysctl table hierarchy. @table should be a filled in ctl_table
  1320	 * array. A completely 0 filled entry terminates the table.
  1321	 *
  1322	 * The members of the &struct ctl_table structure are used as follows:
  1323	 *
  1324	 * procname - the name of the sysctl file under /proc/sys. Set to %NULL to not
  1325	 *            enter a sysctl file
  1326	 *
  1327	 * data - a pointer to data for use by proc_handler
  1328	 *
  1329	 * maxlen - the maximum size in bytes of the data
  1330	 *
  1331	 * mode - the file permissions for the /proc/sys file
  1332	 *
  1333	 * child - must be %NULL.
  1334	 *
  1335	 * proc_handler - the text handler routine (described below)
  1336	 *
  1337	 * extra1, extra2 - extra pointers usable by the proc handler routines
  1338	 * XXX: we should eventually modify these to use long min / max [0]
  1339	 * [0] https://lkml.kernel.org/87zgpte9o4.fsf@email.froward.int.ebiederm.org
  1340	 *
  1341	 * Leaf nodes in the sysctl tree will be represented by a single file
  1342	 * under /proc; non-leaf nodes (where child is not NULL) are not allowed,
  1343	 * sysctl_check_table() verifies this.
  1344	 *
  1345	 * There must be a proc_handler routine for any terminal nodes.
  1346	 * Several default handlers are available to cover common cases -
  1347	 *
  1348	 * proc_dostring(), proc_dointvec(), proc_dointvec_jiffies(),
  1349	 * proc_dointvec_userhz_jiffies(), proc_dointvec_minmax(),
  1350	 * proc_doulongvec_ms_jiffies_minmax(), proc_doulongvec_minmax()
  1351	 *
  1352	 * It is the handler's job to read the input buffer from user memory
  1353	 * and process it. The handler should return 0 on success.
  1354	 *
  1355	 * This routine returns %NULL on a failure to register, and a pointer
  1356	 * to the table header on success.
  1357	 */
  1358	struct ctl_table_header *__register_sysctl_table(
  1359		struct ctl_table_set *set,
  1360		const char *path, struct ctl_table *table)
  1361	{
  1362		struct ctl_table_root *root = set->dir.header.root;
  1363		struct ctl_table_header *header;
  1364		struct ctl_dir *dir;
  1365		struct ctl_table *entry;
  1366		struct ctl_node *node;
  1367		int nr_entries = 0;
  1368	
  1369		list_for_each_table_entry(entry, table)
  1370			nr_entries++;
  1371	
  1372		header = kzalloc(sizeof(struct ctl_table_header) +
  1373				 sizeof(struct ctl_node)*nr_entries, GFP_KERNEL_ACCOUNT);
  1374		if (!header)
  1375			return NULL;
  1376	
  1377		node = (struct ctl_node *)(header + 1);
> 1378		init_header(header, root, set, node, table, ARRAY_SIZE(table));
  1379		if (sysctl_check_table(path, header))
  1380			goto fail;
  1381	
  1382		spin_lock(&sysctl_lock);
  1383		dir = &set->dir;
  1384		/* Reference moved down the directory tree get_subdir */
  1385		dir->header.nreg++;
  1386		spin_unlock(&sysctl_lock);
  1387	
  1388		dir = sysctl_mkdir_p(dir, path);
  1389		if (IS_ERR(dir))
  1390			goto fail;
  1391		spin_lock(&sysctl_lock);
  1392		if (insert_header(dir, header))
  1393			goto fail_put_dir_locked;
  1394	
  1395		drop_sysctl_table(&dir->header);
  1396		spin_unlock(&sysctl_lock);
  1397	
  1398		return header;
  1399	
  1400	fail_put_dir_locked:
  1401		drop_sysctl_table(&dir->header);
  1402		spin_unlock(&sysctl_lock);
  1403	fail:
  1404		kfree(header);
  1405		dump_stack();
  1406		return NULL;
  1407	}
  1408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

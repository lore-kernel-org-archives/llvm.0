Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5185016D9DF;
	Sat, 31 Aug 2024 20:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725135022; cv=none; b=RspOKXmM5GB6PVLSaJipG2UyuazdRZM51edAQ1zyn+wpAYFUn0FErzquesDBIBeNgVYdPsQ+qryp2qFvUlYuCzJidHICYmiqwa7kfL75mkU4+zwRkae0SsObQd2uFDzO6gjt3cnWvXvxNktohH8HvtEbHMaBtWz+MNW9A+kQcJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725135022; c=relaxed/simple;
	bh=mF3BJcnJ1naGxOM2s/fo+Pe7PYyIEgpoQbTtJD5oOUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lxW5h05wVJXHkNLni+r/4NXDtdK/H4rD0MHAXVO4cC39iNEpZN1AZv5zBtKVQ6MaUHtMsLf1eKIqLWFa2N5Mi8LcuA5XhAzAouDR8G+vgE2ijCTJ/mIE0pzpqyCNlvj6TpvzTvjlElcnv3wj2pE2tHRd5rbRYsX7UD+zjy76kwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YyebRK9/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YyebRK9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725135020; x=1756671020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mF3BJcnJ1naGxOM2s/fo+Pe7PYyIEgpoQbTtJD5oOUg=;
  b=YyebRK9/NFQ94ed//Sfm28oAey1md3ncNAwxhW1NO+oxf4YA9f8cwhVi
   YgfGUci14MiRsRdXM1BbB+ji8eFqp0LPcTcBzY+aKhhGJIDWzmcFYPVUT
   BAizzNklW2Jr1c6hDtCIRYxhusBXoazJmZtdEpHvuuaCYCTi5mSOhZ5av
   aRwBFOF/o6Aotty6kMDielb9EA9oK1jSiKJI8onHKTNO+aQEPtE98Dv8D
   RTtmmdc9Ku7av7knh+dRH80U3tJzT5aZ9pIQPMCTDOb6csjeEq9oIizmn
   dMNu7+kKn54QpDcwybtuYUywMoczA52+cOf9q7CDzDZh/VXX6CCTggtMC
   A==;
X-CSE-ConnectionGUID: qiU5eDWlRemqpKwuVJhnJA==
X-CSE-MsgGUID: IR6cEO31SHGdj6zNbKSJwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23924052"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23924052"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 13:10:19 -0700
X-CSE-ConnectionGUID: btaQv/boSgOe3PuV335R+g==
X-CSE-MsgGUID: YYGqEHdiQ/aWiCfvfj9GMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="94925971"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2024 13:10:19 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skUQJ-00034y-2a;
	Sat, 31 Aug 2024 20:10:15 +0000
Date: Sun, 1 Sep 2024 04:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: yangyun <yangyun50@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	fuse-devel@lists.sourceforge.net,
	Miklos Szeredi <mszeredi@redhat.com>
Subject: [mszeredi-fuse:for-next 18/18] fs/fuse/inode.c:1350:16: error: use
 of undeclared identifier 'FUSE_NO_FORGET_SUPPORT'
Message-ID: <202409010407.7VVZiqVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
head:   aef9b1d92516359711b05de453aed75bd71c592a
commit: aef9b1d92516359711b05de453aed75bd71c592a [18/18] fuse: add support for no forget requests
config: hexagon-randconfig-001-20240901 (https://download.01.org/0day-ci/archive/20240901/202409010407.7VVZiqVn-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 46fe36a4295f05d5d3731762e31fc4e6e99863e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010407.7VVZiqVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010407.7VVZiqVn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/fuse/inode.c:9:
   In file included from fs/fuse/fuse_i.h:22:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/fuse/inode.c:9:
   In file included from fs/fuse/fuse_i.h:23:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/fuse/inode.c:9:
   In file included from fs/fuse/fuse_i.h:23:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/fuse/inode.c:9:
   In file included from fs/fuse/fuse_i.h:23:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/fuse/inode.c:1350:16: error: use of undeclared identifier 'FUSE_NO_FORGET_SUPPORT'
    1350 |                         if (flags & FUSE_NO_FORGET_SUPPORT)
         |                                     ^
   fs/fuse/inode.c:1399:46: error: use of undeclared identifier 'FUSE_NO_FORGET_SUPPORT'
    1399 |                 FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_NO_FORGET_SUPPORT;
         |                                                            ^
   7 warnings and 2 errors generated.


vim +/FUSE_NO_FORGET_SUPPORT +1350 fs/fuse/inode.c

  1228	
  1229	static void process_init_reply(struct fuse_mount *fm, struct fuse_args *args,
  1230				       int error)
  1231	{
  1232		struct fuse_conn *fc = fm->fc;
  1233		struct fuse_init_args *ia = container_of(args, typeof(*ia), args);
  1234		struct fuse_init_out *arg = &ia->out;
  1235		bool ok = true;
  1236	
  1237		if (error || arg->major != FUSE_KERNEL_VERSION)
  1238			ok = false;
  1239		else {
  1240			unsigned long ra_pages;
  1241	
  1242			process_init_limits(fc, arg);
  1243	
  1244			if (arg->minor >= 6) {
  1245				u64 flags = arg->flags;
  1246	
  1247				if (flags & FUSE_INIT_EXT)
  1248					flags |= (u64) arg->flags2 << 32;
  1249	
  1250				ra_pages = arg->max_readahead / PAGE_SIZE;
  1251				if (flags & FUSE_ASYNC_READ)
  1252					fc->async_read = 1;
  1253				if (!(flags & FUSE_POSIX_LOCKS))
  1254					fc->no_lock = 1;
  1255				if (arg->minor >= 17) {
  1256					if (!(flags & FUSE_FLOCK_LOCKS))
  1257						fc->no_flock = 1;
  1258				} else {
  1259					if (!(flags & FUSE_POSIX_LOCKS))
  1260						fc->no_flock = 1;
  1261				}
  1262				if (flags & FUSE_ATOMIC_O_TRUNC)
  1263					fc->atomic_o_trunc = 1;
  1264				if (arg->minor >= 9) {
  1265					/* LOOKUP has dependency on proto version */
  1266					if (flags & FUSE_EXPORT_SUPPORT)
  1267						fc->export_support = 1;
  1268				}
  1269				if (flags & FUSE_BIG_WRITES)
  1270					fc->big_writes = 1;
  1271				if (flags & FUSE_DONT_MASK)
  1272					fc->dont_mask = 1;
  1273				if (flags & FUSE_AUTO_INVAL_DATA)
  1274					fc->auto_inval_data = 1;
  1275				else if (flags & FUSE_EXPLICIT_INVAL_DATA)
  1276					fc->explicit_inval_data = 1;
  1277				if (flags & FUSE_DO_READDIRPLUS) {
  1278					fc->do_readdirplus = 1;
  1279					if (flags & FUSE_READDIRPLUS_AUTO)
  1280						fc->readdirplus_auto = 1;
  1281				}
  1282				if (flags & FUSE_ASYNC_DIO)
  1283					fc->async_dio = 1;
  1284				if (flags & FUSE_WRITEBACK_CACHE)
  1285					fc->writeback_cache = 1;
  1286				if (flags & FUSE_PARALLEL_DIROPS)
  1287					fc->parallel_dirops = 1;
  1288				if (flags & FUSE_HANDLE_KILLPRIV)
  1289					fc->handle_killpriv = 1;
  1290				if (arg->time_gran && arg->time_gran <= 1000000000)
  1291					fm->sb->s_time_gran = arg->time_gran;
  1292				if ((flags & FUSE_POSIX_ACL)) {
  1293					fc->default_permissions = 1;
  1294					fc->posix_acl = 1;
  1295				}
  1296				if (flags & FUSE_CACHE_SYMLINKS)
  1297					fc->cache_symlinks = 1;
  1298				if (flags & FUSE_ABORT_ERROR)
  1299					fc->abort_err = 1;
  1300				if (flags & FUSE_MAX_PAGES) {
  1301					fc->max_pages =
  1302						min_t(unsigned int, fc->max_pages_limit,
  1303						max_t(unsigned int, arg->max_pages, 1));
  1304				}
  1305				if (IS_ENABLED(CONFIG_FUSE_DAX)) {
  1306					if (flags & FUSE_MAP_ALIGNMENT &&
  1307					    !fuse_dax_check_alignment(fc, arg->map_alignment)) {
  1308						ok = false;
  1309					}
  1310					if (flags & FUSE_HAS_INODE_DAX)
  1311						fc->inode_dax = 1;
  1312				}
  1313				if (flags & FUSE_HANDLE_KILLPRIV_V2) {
  1314					fc->handle_killpriv_v2 = 1;
  1315					fm->sb->s_flags |= SB_NOSEC;
  1316				}
  1317				if (flags & FUSE_SETXATTR_EXT)
  1318					fc->setxattr_ext = 1;
  1319				if (flags & FUSE_SECURITY_CTX)
  1320					fc->init_security = 1;
  1321				if (flags & FUSE_CREATE_SUPP_GROUP)
  1322					fc->create_supp_group = 1;
  1323				if (flags & FUSE_DIRECT_IO_ALLOW_MMAP)
  1324					fc->direct_io_allow_mmap = 1;
  1325				/*
  1326				 * max_stack_depth is the max stack depth of FUSE fs,
  1327				 * so it has to be at least 1 to support passthrough
  1328				 * to backing files.
  1329				 *
  1330				 * with max_stack_depth > 1, the backing files can be
  1331				 * on a stacked fs (e.g. overlayfs) themselves and with
  1332				 * max_stack_depth == 1, FUSE fs can be stacked as the
  1333				 * underlying fs of a stacked fs (e.g. overlayfs).
  1334				 *
  1335				 * Also don't allow the combination of FUSE_PASSTHROUGH
  1336				 * and FUSE_WRITEBACK_CACHE, current design doesn't handle
  1337				 * them together.
  1338				 */
  1339				if (IS_ENABLED(CONFIG_FUSE_PASSTHROUGH) &&
  1340				    (flags & FUSE_PASSTHROUGH) &&
  1341				    arg->max_stack_depth > 0 &&
  1342				    arg->max_stack_depth <= FILESYSTEM_MAX_STACK_DEPTH &&
  1343				    !(flags & FUSE_WRITEBACK_CACHE))  {
  1344					fc->passthrough = 1;
  1345					fc->max_stack_depth = arg->max_stack_depth;
  1346					fm->sb->s_stack_depth = arg->max_stack_depth;
  1347				}
  1348				if (flags & FUSE_NO_EXPORT_SUPPORT)
  1349					fm->sb->s_export_op = &fuse_export_fid_operations;
> 1350				if (flags & FUSE_NO_FORGET_SUPPORT)
  1351					fc->no_forget = 1;
  1352			} else {
  1353				ra_pages = fc->max_read / PAGE_SIZE;
  1354				fc->no_lock = 1;
  1355				fc->no_flock = 1;
  1356			}
  1357	
  1358			fm->sb->s_bdi->ra_pages =
  1359					min(fm->sb->s_bdi->ra_pages, ra_pages);
  1360			fc->minor = arg->minor;
  1361			fc->max_write = arg->minor < 5 ? 4096 : arg->max_write;
  1362			fc->max_write = max_t(unsigned, 4096, fc->max_write);
  1363			fc->conn_init = 1;
  1364		}
  1365		kfree(ia);
  1366	
  1367		if (!ok) {
  1368			fc->conn_init = 0;
  1369			fc->conn_error = 1;
  1370		}
  1371	
  1372		fuse_set_initialized(fc);
  1373		wake_up_all(&fc->blocked_waitq);
  1374	}
  1375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

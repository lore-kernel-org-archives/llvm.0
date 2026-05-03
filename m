Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3611CBA;
	Sun,  3 May 2026 06:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777791379; cv=none; b=BBr+7z2JeqU85df3tg+WZ0hrtZb8671SqvAQnyDUMFGzDHX3jUs3gSxgRM264t8begAkbMdgEDDjNkjSczsEoNwqittXKVkx8Q/ot2iQWrBhfDa/H1LMkjQFzq1+7BuQVL48CG+ls3fP7Udua97m1QE6V0GIulPytsauSiG2pmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777791379; c=relaxed/simple;
	bh=sAkQhYJGjJRQIP/qkFUYzJEeeNzClk2Ka8XHG7KR964=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YbhL+u2BWAF5gulYB31LhIaDBmcrT7+MGT4kO30GBREfLk0LVzyVJ5/iKtSrFFWXuWN7tGyLywIp1Iarcy7qJkAR6nvjlkz3RQwF0jmeIT4rC9YoUBzsGsyJLCs6X+1vlBvS0X3CyWVEYEKWmoipojdH5Zz+rVxi8tdj3ZQCMnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZVrF9bE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZVrF9bE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777791377; x=1809327377;
  h=date:from:to:cc:subject:message-id;
  bh=sAkQhYJGjJRQIP/qkFUYzJEeeNzClk2Ka8XHG7KR964=;
  b=nZVrF9bEgQIDn4GYBP2cWFwvcuXe6L9Zy5zEIMf4a8PMpcXT/VwH2SYb
   LglvVpLhzpY+eVO2GuRqCLMeyjeDcYavI5pfMVgArB+g97PDzmbIKd5gc
   oA+6AIBwQ0V0oDh4NyjNZCa276cNrVj3Nmsj6YmLibceNNXLZaiy633NG
   Qo0JwusE+N47CVdgOiePwCMIWBnmW0NOXcnj/KhxlMsHjrRcwQ51JbByZ
   fWXPNC+QEWnNibWZHSMiJVWEoKqz7lTXa+Gebid1AvMT7wV7Q4GvqC20E
   0Ibb7pXLNdwdFSu/W8WUznNnhgbFktRKa/bLJVkFvQ65UmECp1Z9K5Nwz
   g==;
X-CSE-ConnectionGUID: s7Gm4w8HSaWELvwf2akM/A==
X-CSE-MsgGUID: mOrXaepQQUSgd4eBeok4sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77851072"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="77851072"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 23:56:14 -0700
X-CSE-ConnectionGUID: Yvwr7JPcS12A+6VkyW7Q0g==
X-CSE-MsgGUID: jHIRnlaRSLiTcqeEZwve4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235105657"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 May 2026 23:56:11 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJQkL-000000002Hh-3Obk;
	Sun, 03 May 2026 06:56:09 +0000
Date: Sun, 03 May 2026 14:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 5/50]
 fs/smb/client/cifsfs.c:1390:29: warning: variable 'old_size' is uninitialized
 when used here
Message-ID: <202605031459.eX5UbO3K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   2c55c7cf98847d593219ef29d3fedfd551d6f55f
commit: 09f608d47661d093d1c3a2136bdee788aa9c234f [5/50] netfs: Fix potential for tearing in ->remote_i_size and ->zero_point
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260503/202605031459.eX5UbO3K-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031459.eX5UbO3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031459.eX5UbO3K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/cifsfs.c:1390:29: warning: variable 'old_size' is uninitialized when used here [-Wuninitialized]
    1390 |                 if (rc == 0 && new_size > old_size) {
         |                                           ^~~~~~~~
   fs/smb/client/cifsfs.c:1307:37: note: initialize the variable 'old_size' to silence this warning
    1307 |         unsigned long long i_size, old_size, new_size, zero_point;
         |                                            ^
         |                                             = 0
>> fs/smb/client/cifsfs.c:1375:13: warning: variable 'zero_point' is uninitialized when used here [-Wuninitialized]
    1375 |         if (fend > zero_point)
         |                    ^~~~~~~~~~
   fs/smb/client/cifsfs.c:1307:59: note: initialize the variable 'zero_point' to silence this warning
    1307 |         unsigned long long i_size, old_size, new_size, zero_point;
         |                                                                  ^
         |                                                                   = 0
   2 warnings generated.


vim +/old_size +1390 fs/smb/client/cifsfs.c

7b2404a886f8b91 fs/smb/client/cifsfs.c David Howells     2023-12-01  1295  
42ec3d4c02187a1 fs/cifs/cifsfs.c       Darrick J. Wong   2018-10-30  1296  static loff_t cifs_remap_file_range(struct file *src_file, loff_t off,
42ec3d4c02187a1 fs/cifs/cifsfs.c       Darrick J. Wong   2018-10-30  1297  		struct file *dst_file, loff_t destoff, loff_t len,
2e5dfc99f2e61c4 fs/cifs/cifsfs.c       Darrick J. Wong   2018-10-30  1298  		unsigned int remap_flags)
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1299  {
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1300  	struct inode *src_inode = file_inode(src_file);
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1301  	struct inode *target_inode = file_inode(dst_file);
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1302  	struct cifsInodeInfo *src_cifsi = CIFS_I(src_inode);
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1303  	struct cifsInodeInfo *target_cifsi = CIFS_I(target_inode);
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1304  	struct cifsFileInfo *smb_file_src = src_file->private_data;
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1305  	struct cifsFileInfo *smb_file_target = dst_file->private_data;
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1306  	struct cifs_tcon *target_tcon, *src_tcon;
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1307  	unsigned long long i_size, old_size, new_size, zero_point;
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1308  	unsigned long long destend, fstart, fend;
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1309  	unsigned int xid;
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1310  	int rc;
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1311  
691a41d8da4b34f fs/smb/client/cifsfs.c David Howells     2023-12-04  1312  	if (remap_flags & REMAP_FILE_DEDUP)
691a41d8da4b34f fs/smb/client/cifsfs.c David Howells     2023-12-04  1313  		return -EOPNOTSUPP;
691a41d8da4b34f fs/smb/client/cifsfs.c David Howells     2023-12-04  1314  	if (remap_flags & ~REMAP_FILE_ADVISORY)
2e5dfc99f2e61c4 fs/cifs/cifsfs.c       Darrick J. Wong   2018-10-30  1315  		return -EINVAL;
2e5dfc99f2e61c4 fs/cifs/cifsfs.c       Darrick J. Wong   2018-10-30  1316  
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1317  	cifs_dbg(FYI, "clone range\n");
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1318  
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1319  	xid = get_xid();
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1320  
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1321  	if (!smb_file_src || !smb_file_target) {
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1322  		rc = -EBADF;
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1323  		cifs_dbg(VFS, "missing cifsFileInfo on copy range src file\n");
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1324  		goto out;
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1325  	}
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1326  
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1327  	src_tcon = tlink_tcon(smb_file_src->tlink);
8c6c9bed8773375 fs/cifs/cifsfs.c       Colin Ian King    2018-11-01  1328  	target_tcon = tlink_tcon(smb_file_target->tlink);
8c6c9bed8773375 fs/cifs/cifsfs.c       Colin Ian King    2018-11-01  1329  
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1330  	/*
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1331  	 * Note: cifs case is easier than btrfs since server responsible for
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1332  	 * checks for proper open modes and file type and if it wants
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1333  	 * server could even support copy of range where source = target
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1334  	 */
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1335  	lock_two_nondirectories(target_inode, src_inode);
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1336  
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1337  	if (len == 0)
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1338  		len = src_inode->i_size - off;
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1339  
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1340  	cifs_dbg(FYI, "clone range\n");
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1341  
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1342  	/* Flush the source buffer */
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1343  	rc = filemap_write_and_wait_range(src_inode->i_mapping, off,
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1344  					  off + len - 1);
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1345  	if (rc)
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1346  		goto unlock;
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1347  
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1348  	/* The server-side copy will fail if the source crosses the EOF marker.
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1349  	 * Advance the EOF marker after the flush above to the end of the range
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1350  	 * if it's short of that.
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1351  	 */
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1352  	if (netfs_read_remote_i_size(src_inode) < off + len) {
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1353  		rc = cifs_precopy_set_eof(src_inode, src_cifsi, src_tcon, xid, off + len);
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1354  		if (rc < 0)
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1355  			goto unlock;
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1356  	}
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1357  
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1358  	new_size = destoff + len;
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1359  	destend = destoff + len - 1;
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1360  
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1361  	/* Flush the folios at either end of the destination range to prevent
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1362  	 * accidental loss of dirty data outside of the range.
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1363  	 */
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1364  	fstart = destoff;
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1365  	fend = destend;
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1366  
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1367  	rc = cifs_flush_folio(target_inode, destoff, &fstart, &fend, true);
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1368  	if (rc)
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1369  		goto unlock;
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1370  	rc = cifs_flush_folio(target_inode, destend, &fstart, &fend, false);
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1371  	if (rc)
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1372  		goto unlock;
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1373  
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1374  	spin_lock(&target_inode->i_lock);
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20 @1375  	if (fend > zero_point)
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1376  		netfs_write_zero_point(target_inode, fend + 1);
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1377  	i_size = target_inode->i_size;
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1378  	spin_unlock(&target_inode->i_lock);
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1379  
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1380  	/* Discard all the folios that overlap the destination region. */
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1381  	cifs_dbg(FYI, "about to discard pages %llx-%llx\n", fstart, fend);
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1382  	truncate_inode_pages_range(&target_inode->i_data, fstart, fend);
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1383  
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1384  	fscache_invalidate(cifs_inode_cookie(target_inode), NULL, i_size, 0);
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1385  
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1386  	rc = -EOPNOTSUPP;
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1387  	if (target_tcon->ses->server->ops->duplicate_extents) {
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1388  		rc = target_tcon->ses->server->ops->duplicate_extents(xid,
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1389  			smb_file_src, smb_file_target, off, len, destoff);
93a43155127fec0 fs/smb/client/cifsfs.c David Howells     2024-05-24 @1390  		if (rc == 0 && new_size > old_size) {
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1391  			truncate_setsize(target_inode, new_size);
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1392  			fscache_resize_cookie(cifs_inode_cookie(target_inode),
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1393  					      new_size);
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1394  		} else if (rc == -EOPNOTSUPP) {
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1395  			/*
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1396  			 * copy_file_range syscall man page indicates EINVAL
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1397  			 * is returned e.g when "fd_in and fd_out refer to the
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1398  			 * same file and the source and target ranges overlap."
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1399  			 * Test generic/157 was what showed these cases where
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1400  			 * we need to remap EOPNOTSUPP to EINVAL
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1401  			 */
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1402  			if (off >= src_inode->i_size) {
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1403  				rc = -EINVAL;
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1404  			} else if (src_inode == target_inode) {
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1405  				if (off + len > destoff)
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1406  					rc = -EINVAL;
0e08fa789d39aa0 fs/smb/client/cifsfs.c Steve French      2025-08-23  1407  			}
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1408  		}
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1409  		if (rc == 0) {
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1410  			spin_lock(&target_inode->i_lock);
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1411  			if (new_size > target_cifsi->netfs._zero_point)
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1412  				netfs_write_zero_point(target_inode, new_size);
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1413  			spin_unlock(&target_inode->i_lock);
09f608d47661d09 fs/smb/client/cifsfs.c David Howells     2026-04-20  1414  		}
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1415  	}
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1416  
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1417  	/* force revalidate of size and timestamps of target file now
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1418  	   that target is updated on the server */
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1419  	CIFS_I(target_inode)->time = 0;
c54fc3a4f375663 fs/smb/client/cifsfs.c David Howells     2023-12-01  1420  unlock:
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1421  	/* although unlocking in the reverse order from locking is not
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1422  	   strictly necessary here it is a little cleaner to be consistent */
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1423  	unlock_two_nondirectories(src_inode, target_inode);
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1424  out:
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1425  	free_xid(xid);
42ec3d4c02187a1 fs/cifs/cifsfs.c       Darrick J. Wong   2018-10-30  1426  	return rc < 0 ? rc : len;
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1427  }
04b38d601239b4d fs/cifs/cifsfs.c       Christoph Hellwig 2015-12-03  1428  

:::::: The code at line 1390 was first introduced by commit
:::::: 93a43155127fec0f8cc942d63b76668c2f8f69fa cifs: Fix missing set of remote_i_size

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

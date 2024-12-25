Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988B8175BF;
	Wed, 25 Dec 2024 07:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735110718; cv=none; b=uHG8DzZxW6xKccqE5k/Mi+to5WWyX1Rchb5VGFeW6XA8qwiwiMwxXaOXesiNKrYJNUzBiyAuzSlBZ4KyBDvkN87R6N1KT1q8MV8RepgjIGO1xkLcnLasBhcwvwtKxWZ2PUXo6Zl1To55YlFqwVufuqXcnSFb7GOVPALRzLYx3G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735110718; c=relaxed/simple;
	bh=lWTn3xaaatEmZWb00IapuU+GEuhka/SAQSjBHKqbRy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jP0VLck5OLIIRc+y3KoXUR02oghDr037a9Y00ZkzY2gti6ox/6FzLBTbXipIOWN3PHjqH5JLi1tr+fXU5z4WKtiPTR098wNdHFpr1p6Y5NE88Fk5Bz/vYcXkzMGJ6LxFVxngBpw4QZVA16JqdcKA2h0b8nP+fTbovdSepImCbMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6z/cclt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6z/cclt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735110716; x=1766646716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lWTn3xaaatEmZWb00IapuU+GEuhka/SAQSjBHKqbRy0=;
  b=b6z/ccltkaHZTnUqoQWgOxRwLri9e0e+TORvGEe4xl2iy4lJIpnBy5ED
   SKw7u97Ye4EkNY+f2NaLTDTrAfv1MNdY81DgOHAguMOGcnuKr5tVN4zD+
   E4X6nbhLhT1UT1EMBv7gg8NRQtue3NuiC4FwhK+WsmTzVx1ORu9cQeR2D
   U4eQofLcjcEQJzPfF4yEVCjsLTqBGHro0U7bM89BNLEEv2DIENg1R1bFR
   yKTRkn/tBXbPGvglQW0XLcR3n+Klyf6UahZfegD4qJ9AHvDaXTI/FLQl5
   MWTKBMpdPLY/xgG2g6zRX6fQUUd6vGsoXFPtqaUt0YVSE2PUih8CQe7Ah
   Q==;
X-CSE-ConnectionGUID: AzW34DliTsKJ2QkpBIVNTg==
X-CSE-MsgGUID: suaAYXo+SeKBUHrj+oAoyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="39343710"
X-IronPort-AV: E=Sophos;i="6.12,262,1728975600"; 
   d="scan'208";a="39343710"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 23:11:56 -0800
X-CSE-ConnectionGUID: JQKs3pcQTYWoOrIufcGPNA==
X-CSE-MsgGUID: qcEy26DbSrWCyLQv8JbjyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,262,1728975600"; 
   d="scan'208";a="130506705"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2024 23:11:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQLYb-0001md-2b;
	Wed, 25 Dec 2024 07:11:49 +0000
Date: Wed, 25 Dec 2024 15:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 20/38] fs/smb/client/cifsacl.c:1505:3: warning: variable
 'access_flags' is uninitialized when used here
Message-ID: <202412251549.gizM0H55-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   4a7fbaf556836b77fe7bb452939af3a505ee5ee9
commit: ce9f9c0511bbb913daa982afed5859ab68adf0e8 [20/38] cifs: Fix getting and setting SACLs over SMB1
config: i386-randconfig-012-20241225 (https://download.01.org/0day-ci/archive/20241225/202412251549.gizM0H55-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412251549.gizM0H55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412251549.gizM0H55-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/smb/client/cifsacl.c:20:
   In file included from fs/smb/client/cifspdu.h:12:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/smb/client/cifsacl.c:1505:3: warning: variable 'access_flags' is uninitialized when used here [-Wuninitialized]
    1505 |                 access_flags |= WRITE_OWNER;
         |                 ^~~~~~~~~~~~
   fs/smb/client/cifsacl.c:1491:22: note: initialize the variable 'access_flags' to silence this warning
    1491 |         int rc, access_flags;
         |                             ^
         |                              = 0
   2 warnings generated.


vim +/access_flags +1505 fs/smb/client/cifsacl.c

  1484	
  1485	 /* Set an ACL on the server */
  1486	int set_cifs_acl(struct smb_ntsd *pnntsd, __u32 acllen,
  1487				struct inode *inode, const char *path, int aclflag)
  1488	{
  1489		int oplock = 0;
  1490		unsigned int xid;
  1491		int rc, access_flags;
  1492		struct cifs_tcon *tcon;
  1493		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
  1494		struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
  1495		struct cifs_fid fid;
  1496		struct cifs_open_parms oparms;
  1497	
  1498		if (IS_ERR(tlink))
  1499			return PTR_ERR(tlink);
  1500	
  1501		tcon = tlink_tcon(tlink);
  1502		xid = get_xid();
  1503	
  1504		if (aclflag & CIFS_ACL_OWNER || aclflag & CIFS_ACL_GROUP)
> 1505			access_flags |= WRITE_OWNER;
  1506		if (aclflag & CIFS_ACL_SACL)
  1507			access_flags |= SYSTEM_SECURITY;
  1508		if (aclflag & CIFS_ACL_DACL)
  1509			access_flags |= WRITE_DAC;
  1510	
  1511		oparms = (struct cifs_open_parms) {
  1512			.tcon = tcon,
  1513			.cifs_sb = cifs_sb,
  1514			.desired_access = access_flags,
  1515			.create_options = cifs_create_options(cifs_sb, 0),
  1516			.disposition = FILE_OPEN,
  1517			.path = path,
  1518			.fid = &fid,
  1519		};
  1520	
  1521		rc = CIFS_open(xid, &oparms, &oplock, NULL);
  1522		if (rc) {
  1523			cifs_dbg(VFS, "Unable to open file to set ACL\n");
  1524			goto out;
  1525		}
  1526	
  1527		rc = CIFSSMBSetCIFSACL(xid, tcon, fid.netfid, pnntsd, acllen, aclflag);
  1528		cifs_dbg(NOISY, "SetCIFSACL rc = %d\n", rc);
  1529	
  1530		CIFSSMBClose(xid, tcon, fid.netfid);
  1531	out:
  1532		free_xid(xid);
  1533		cifs_put_tlink(tlink);
  1534		return rc;
  1535	}
  1536	#endif /* CONFIG_CIFS_ALLOW_INSECURE_LEGACY */
  1537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

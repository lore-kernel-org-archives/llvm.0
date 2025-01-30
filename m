Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5E21482E1;
	Thu, 30 Jan 2025 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738271399; cv=none; b=V54Q7+pHcXOnw88PtbLnzs39bWwyA1Y/3O7PTp1jqCqft1yFVYkL+Q4pqBPYx1GbSX6oitTy5sAssBMroFGmk8+HzKfggP67+B26aJQvt3Sd9SOjnvcpQFsU4HgApcrmkIDlHC/ZkRa4Nez+Z02NG8HEnlCPq0oNzA/wh70OZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738271399; c=relaxed/simple;
	bh=uzkRoqr4uv4JMBPOSt5WZbBNtSmaS7277duHctSbaCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QwnFtHZ8Lw+ac59eicYep9u7eC5JaP1HK3q1qtRaurBu+PWh0NAi9TqF649cSblznZyTb7e7bHZ1n6vLfB5WK3cx/o/yQY5+jRh7tddT0iV1zZf9BQspTMJVIbVBt1B6v1zfUAuZM3zJZC5yoHLgvE3VACoqjRvW7WORulNOmcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Id78AGa+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Id78AGa+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738271397; x=1769807397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzkRoqr4uv4JMBPOSt5WZbBNtSmaS7277duHctSbaCg=;
  b=Id78AGa+cTLWkPGRjB9/dzdEkeZ0A9ugrXrCDtWiNvFZpmVeNJviVIr8
   ciQrqSSKzGxZ6+klTCb1xAqSKCihpA7F7a8NevGXLmY+jGK9HcLmZRDgk
   oEGIMYRwvcORdv8MivESSNyBoU1oWKNzTkOC8PRBKJpIplNd6ZAXcojre
   +kQrCxtPaRSbGDxl4hTPBn9t3O+GcA+hYzsm1GCYzfz5Fvu5M1Q/3p6gp
   zshH8jd2pHxFkLaHvBPRh77rPbAysN87uMyDDXJDbVCwLTwjQFo6wVq7M
   mDht2M6mhAQSbrMQysZFlxIkAEBzfRCtpS+9HStQGPJYEzEXja4lAqFyi
   Q==;
X-CSE-ConnectionGUID: 6j/8BeScSUWwQcCHbgnRdQ==
X-CSE-MsgGUID: n4VIYDM9S/uGVBvwSZX1/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="39110629"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="39110629"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 13:09:56 -0800
X-CSE-ConnectionGUID: IqMpvQgNR1SgfNmoQYUDPg==
X-CSE-MsgGUID: bUnf0E71SvOOeORM2v8s1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146627827"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2025 13:09:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdbnM-000kyV-1b;
	Thu, 30 Jan 2025 21:09:52 +0000
Date: Fri, 31 Jan 2025 05:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.mnt_idmap.statmount 4/5]
 samples/vfs/test-list-all-mounts.c:152:39: warning: format specifies type
 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202501310452.wltposNc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.mnt_idmap.statmount
head:   e44d6d871d9cf676fadd6b5cb4c68ff3c6f2fc24
commit: 32ed618ba0faa39f735b4ef89fef1542d49a207f [4/5] samples/vfs: add STATMOUNT_MNT_{G,U}IDMAP
config: i386-buildonly-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501310452.wltposNc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501310452.wltposNc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501310452.wltposNc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/vfs/test-list-all-mounts.c:152:39: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     152 |                                         printf("mnt_uidmap[%lu]:\t%s\n", idx, idmap);
         |                                                            ~~~           ^~~
         |                                                            %zu
   samples/vfs/test-list-all-mounts.c:161:39: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     161 |                                         printf("mnt_gidmap[%lu]:\t%s\n", idx, idmap);
         |                                                            ~~~           ^~~
         |                                                            %zu
   2 warnings generated.


vim +152 samples/vfs/test-list-all-mounts.c

    70	
    71	int main(int argc, char *argv[])
    72	{
    73	#define LISTMNT_BUFFER 10
    74		__u64 list[LISTMNT_BUFFER], last_mnt_id = 0;
    75		int ret, pidfd, fd_mntns;
    76		struct mnt_ns_info info = {};
    77	
    78		pidfd = sys_pidfd_open(getpid(), 0);
    79		if (pidfd < 0)
    80			die_errno("pidfd_open failed");
    81	
    82		fd_mntns = ioctl(pidfd, PIDFD_GET_MNT_NAMESPACE, 0);
    83		if (fd_mntns < 0)
    84			die_errno("ioctl(PIDFD_GET_MNT_NAMESPACE) failed");
    85	
    86		ret = ioctl(fd_mntns, NS_MNT_GET_INFO, &info);
    87		if (ret < 0)
    88			die_errno("ioctl(NS_GET_MNTNS_ID) failed");
    89	
    90		printf("Listing %u mounts for mount namespace %" PRIu64 "\n",
    91		       info.nr_mounts, (uint64_t)info.mnt_ns_id);
    92		for (;;) {
    93			ssize_t nr_mounts;
    94	next:
    95			nr_mounts = sys_listmount(LSMT_ROOT, last_mnt_id,
    96						  info.mnt_ns_id, list, LISTMNT_BUFFER,
    97						  0);
    98			if (nr_mounts <= 0) {
    99				int fd_mntns_next;
   100	
   101				printf("Finished listing %u mounts for mount namespace %" PRIu64 "\n\n",
   102				       info.nr_mounts, (uint64_t)info.mnt_ns_id);
   103				fd_mntns_next = ioctl(fd_mntns, NS_MNT_GET_NEXT, &info);
   104				if (fd_mntns_next < 0) {
   105					if (errno == ENOENT) {
   106						printf("Finished listing all mount namespaces\n");
   107						exit(0);
   108					}
   109					die_errno("ioctl(NS_MNT_GET_NEXT) failed");
   110				}
   111				close(fd_mntns);
   112				fd_mntns = fd_mntns_next;
   113				last_mnt_id = 0;
   114				printf("Listing %u mounts for mount namespace %" PRIu64 "\n",
   115				       info.nr_mounts, (uint64_t)info.mnt_ns_id);
   116				goto next;
   117			}
   118	
   119			for (size_t cur = 0; cur < nr_mounts; cur++) {
   120				struct statmount *stmnt;
   121	
   122				last_mnt_id = list[cur];
   123	
   124				stmnt = sys_statmount(last_mnt_id, info.mnt_ns_id,
   125						      STATMOUNT_SB_BASIC |
   126						      STATMOUNT_MNT_BASIC |
   127						      STATMOUNT_MNT_ROOT |
   128						      STATMOUNT_MNT_POINT |
   129						      STATMOUNT_MNT_NS_ID |
   130						      STATMOUNT_MNT_OPTS |
   131						      STATMOUNT_FS_TYPE |
   132						      STATMOUNT_MNT_UIDMAP |
   133						      STATMOUNT_MNT_GIDMAP, 0);
   134				if (!stmnt) {
   135					printf("Failed to statmount(%" PRIu64 ") in mount namespace(%" PRIu64 ")\n",
   136					       (uint64_t)last_mnt_id, (uint64_t)info.mnt_ns_id);
   137					continue;
   138				}
   139	
   140				printf("mnt_id:\t\t%" PRIu64 "\nmnt_parent_id:\t%" PRIu64 "\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n",
   141				       (uint64_t)stmnt->mnt_id,
   142				       (uint64_t)stmnt->mnt_parent_id,
   143				       (stmnt->mask & STATMOUNT_FS_TYPE)   ? stmnt->str + stmnt->fs_type   : "",
   144				       (stmnt->mask & STATMOUNT_MNT_ROOT)  ? stmnt->str + stmnt->mnt_root  : "",
   145				       (stmnt->mask & STATMOUNT_MNT_POINT) ? stmnt->str + stmnt->mnt_point : "",
   146				       (stmnt->mask & STATMOUNT_MNT_OPTS)  ? stmnt->str + stmnt->mnt_opts  : "");
   147	
   148				if (stmnt->mask & STATMOUNT_MNT_UIDMAP) {
   149					const char *idmap = stmnt->str + stmnt->mnt_uidmap;
   150	
   151					for (size_t idx = 0; idx < stmnt->mnt_uidmap_num; idx++) {
 > 152						printf("mnt_uidmap[%lu]:\t%s\n", idx, idmap);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

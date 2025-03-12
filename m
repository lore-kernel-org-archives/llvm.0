Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B651E9B04;
	Wed, 12 Mar 2025 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741813104; cv=none; b=gFcQmsDyKGGOTe9yatax/W0bEyFjWd/nJBtkZOihar5zdlz2+0LOlNzMwYHgJU5Ap3icvmX2RT+vkVgy3BJmKxbZPdsPjiqPclkbVeA9PnR4+NUDDjeEtYyFI9Ggbvngwa1wzvTXgrRRYkOpVrFQ4vGNFC3xQmn+R0mazFntffM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741813104; c=relaxed/simple;
	bh=kDLAS1ScugmvvPrwS2Ie4t2LPxu9XWmRk19zYcaIOlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fcoh9+Ev+K4IlNA24omoI7HZvCZBsg1gRnMHRm0C1W0RRWA/ooDsywqrPyKidjlEsBXlWCEvaCX89dH41tG6Ub7LQTmrAF89XsgWlQirpbHnyu0ucHhyhfrago2LN1jQF3aHUTn9V0Mnh1kyLeVV+XQRrhoGHHwl1P1ZXwVyloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jdwmhj0E; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jdwmhj0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741813103; x=1773349103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDLAS1ScugmvvPrwS2Ie4t2LPxu9XWmRk19zYcaIOlE=;
  b=Jdwmhj0E0CRzT6DaFdPIOMfIMCHnFOX8uGu3PMwI8K2lrPGoc75GecnR
   HSASOameFhSGHnH2XM+ztO3haqrO8F1fgRqG3t/POHuwowUK/DU1tBrbL
   Bj+UtGZC6LVEi5v2S83Z4ibmxFXq3/qE09IqWZL82p3NCcPJCgIZ0YK54
   2p6dINmigwKmc/0nyOIfgd9BYY2Dzl5iR/vOT+xH8Ixw7cePTpAtqqZts
   4vO4KGL0g1ftAWugTgLEfQevKTym15aWsQgNNwY4G2OIG2OS5j7FgLorC
   CZYKn53qj1UV7eh37bzDGIOihX6NOiitVnjzGlZ4eZ1Q8WvQAygCOON9Y
   g==;
X-CSE-ConnectionGUID: /99tksotT6iQPxQVb4VNdQ==
X-CSE-MsgGUID: qXDjvd7pSi+Dl1DHf8iB9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53905014"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="53905014"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 13:58:23 -0700
X-CSE-ConnectionGUID: 4GVIapE2RpioAkphKquSJA==
X-CSE-MsgGUID: e5peB+ieS1+c864f9WtD4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="143943221"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2025 13:58:20 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsT9e-0008tc-1k;
	Wed, 12 Mar 2025 20:58:18 +0000
Date: Thu, 13 Mar 2025 04:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 3145/4345] samples/vfs/test-list-all-mounts.c:152:62: warning: format '%lu'
 expects argument of type 'long unsigned int', but argument 2 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202503130402.vnrQT0yF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   996a3103b95ddfa8c291203115cafb3ded036238
commit: 713ad4dd44fc1f8e72351e3d0217dde04097d54c [3145/4345] samples/vfs: add STATMOUNT_MNT_{G,U}IDMAP
config: i386-buildonly-randconfig-004-20250313 (https://download.01.org/0day-ci/archive/20250313/202503130402.vnrQT0yF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130402.vnrQT0yF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130402.vnrQT0yF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   samples/vfs/test-list-all-mounts.c: In function 'main':
>> samples/vfs/test-list-all-mounts.c:152:62: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     152 |                                         printf("mnt_uidmap[%lu]:\t%s\n", idx, idmap);
         |                                                            ~~^           ~~~
         |                                                              |           |
         |                                                              |           size_t {aka unsigned int}
         |                                                              long unsigned int
         |                                                            %u
   samples/vfs/test-list-all-mounts.c:161:62: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     161 |                                         printf("mnt_gidmap[%lu]:\t%s\n", idx, idmap);
         |                                                            ~~^           ~~~
         |                                                              |           |
         |                                                              |           size_t {aka unsigned int}
         |                                                              long unsigned int
         |                                                            %u


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

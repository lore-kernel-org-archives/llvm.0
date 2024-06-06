Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B273F9C5;
	Thu,  6 Jun 2024 19:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717702687; cv=none; b=IVutAjlBS62L1zhrrN+jJvyHrnXQd+bsnbl3Mq4Sg8dvAkOaNhemzEZQfR2Bio583aoD6L/ajUWhWzlTT1kLqvhelWcaKMAY536vXuDKZV0aA8QN2cOyCV7sPch6FUd9uzS6kQbkiz0KUl4RAJB0mF610IxwLGhQaV9EXYf2+P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717702687; c=relaxed/simple;
	bh=fEVNocS8RsLNtlOyxD4RVWn3xrvBR2uIWtImre8Hg6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRD6ah5bs6CUadlISDE/TIQVT03NhpB1W4qhWhMOY0xd6driXp6j8+ETfbW8IhF2hRb/i4fVy6ZjkUabsjeeyr+dl8bvVgqczI6xt770OmWybrbj86/BwYzW+UGvJVyA9jHBEc45wtNP3th3ffElsjRBad49Yc1584jFUJb47+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dpb51boJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dpb51boJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717702686; x=1749238686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fEVNocS8RsLNtlOyxD4RVWn3xrvBR2uIWtImre8Hg6w=;
  b=Dpb51boJXcjtWh89EjEtL7lP9isQPfkihbyt5FVZM19VaLS6jEbw02iC
   LpG8pBtEiavTZOxRu2vDFFZ+m5HgXVvvP1KCP85B47YQSet+6Z4LwrM3z
   xppoXzIFaKp9qtYp2jreEn4aFsKPkqLou4NZSVA71tzG8g6JiygHA16PL
   GgKaJLDHHq4dQ2fZgj/dVPDNxes1kJMfvPKUcQAjJuMs5lm1Y56PNl1Gq
   4nJISSHRBS+XMWnh/qnhtHTs8f81xhWr8JFOtRtP8fN9+6CaVtmd3VIIj
   WJDNwYVeKRRU0qF/seKZB/lNFlHLlT8WXsmWUJiZAZxB0rZ6oqO++rEK4
   A==;
X-CSE-ConnectionGUID: WeCmmQTMRgqMWpZQyTbufQ==
X-CSE-MsgGUID: OiM/C8+GT9+WfJ7roIhdRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18228810"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="18228810"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 12:38:06 -0700
X-CSE-ConnectionGUID: RcP51p+3TMqN5m/veJcU4Q==
X-CSE-MsgGUID: V1qGdQVnRMad2S3RzUQu3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="37993873"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 06 Jun 2024 12:38:04 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFIvx-0003dK-1M;
	Thu, 06 Jun 2024 19:38:01 +0000
Date: Fri, 7 Jun 2024 03:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-5.15.y 1/1] fs/nfsd/nfs4proc.c:1326:43: error: invalid
 digit 'D' in decimal constant
Message-ID: <202406070322.NV1exfY2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.15.y
head:   5ebfde8045ccf1135af2d346564b8c3145ce4a47
commit: 5ebfde8045ccf1135af2d346564b8c3145ce4a47 [1/1] sunrpc: exclude from freezer when waiting for requests:
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240607/202406070322.NV1exfY2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070322.NV1exfY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070322.NV1exfY2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/nfs4proc.c:43:
   In file included from include/linux/sunrpc/addr.h:14:
   In file included from include/net/ipv6.h:12:
   In file included from include/linux/ipv6.h:92:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/mm.h:1608:
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/nfsd/nfs4proc.c:1326:43: error: invalid digit 'D' in decimal constant
    1326 |                                         (freezable_schedule_timeout(20*HZ) =3D=3D 0)) {
         |                                                                              ^
   fs/nfsd/nfs4proc.c:1326:46: error: invalid digit 'D' in decimal constant
    1326 |                                         (freezable_schedule_timeout(20*HZ) =3D=3D 0)) {
         |                                                                                 ^
   1 warning and 2 errors generated.


vim +/D +1326 fs/nfsd/nfs4proc.c

  1298	
  1299	/*
  1300	 * setup a work entry in the ssc delayed unmount list.
  1301	 */
  1302	static __be32 nfsd4_ssc_setup_dul(struct nfsd_net *nn, char *ipaddr,
  1303					  struct nfsd4_ssc_umount_item **nsui)
  1304	{
  1305		struct nfsd4_ssc_umount_item *ni = NULL;
  1306		struct nfsd4_ssc_umount_item *work = NULL;
  1307		struct nfsd4_ssc_umount_item *tmp;
  1308		DEFINE_WAIT(wait);
  1309		__be32 status = 0;
  1310	
  1311		*nsui = NULL;
  1312		work = kzalloc(sizeof(*work), GFP_KERNEL);
  1313	try_again:
  1314		spin_lock(&nn->nfsd_ssc_lock);
  1315		list_for_each_entry_safe(ni, tmp, &nn->nfsd_ssc_mount_list, nsui_list) {
  1316			if (strncmp(ni->nsui_ipaddr, ipaddr, sizeof(ni->nsui_ipaddr)))
  1317				continue;
  1318			/* found a match */
  1319			if (ni->nsui_busy) {
  1320				/*  wait - and try again */
  1321				prepare_to_wait(&nn->nfsd_ssc_waitq, &wait, TASK_IDLE);
  1322				spin_unlock(&nn->nfsd_ssc_lock);
  1323	
  1324				/* allow 20secs for mount/unmount for now - revisit */
  1325				if (kthread_should_stop() ||
> 1326						(freezable_schedule_timeout(20*HZ) =3D=3D 0)) {
  1327					finish_wait(&nn->nfsd_ssc_waitq, &wait);
  1328					kfree(work);
  1329					return nfserr_eagain;
  1330				}
  1331				finish_wait(&nn->nfsd_ssc_waitq, &wait);
  1332				goto try_again;
  1333			}
  1334			*nsui = ni;
  1335			refcount_inc(&ni->nsui_refcnt);
  1336			spin_unlock(&nn->nfsd_ssc_lock);
  1337			kfree(work);
  1338	
  1339			/* return vfsmount in (*nsui)->nsui_vfsmount */
  1340			return 0;
  1341		}
  1342		if (work) {
  1343			strscpy(work->nsui_ipaddr, ipaddr, sizeof(work->nsui_ipaddr) - 1);
  1344			refcount_set(&work->nsui_refcnt, 2);
  1345			work->nsui_busy = true;
  1346			list_add_tail(&work->nsui_list, &nn->nfsd_ssc_mount_list);
  1347			*nsui = work;
  1348		} else
  1349			status = nfserr_resource;
  1350		spin_unlock(&nn->nfsd_ssc_lock);
  1351		return status;
  1352	}
  1353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FC82E824;
	Tue, 14 Nov 2023 22:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+YXf8sT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699999270; x=1731535270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hNfGDhSIjxC4wg8QyoplkZ666TnC1zzFj/TjEKx3psY=;
  b=g+YXf8sTCpMVR2P3oAHUeciqTEEnvorJhmUHDoEI09ktjhBKdaTrJe3A
   F3GSd9nFMRWGXilW2ObFMG0SsZc32jUJmAY/2KpsJMjApqcsuelFH6avE
   EXeteA6nlxMVM5wLbg7rxZmYNU1xzJZ/X2X1fxBjL/i+NVsVPaYi/5pPk
   MstCVsebS9+of39GEtEdSXukvc5O/2KadhYlCa13xkl2xQxChTRLqT052
   NrGbxyofAlAPJgWeoWFmp6Dt/LPzNySQAM+kW/oIVN9c57rh1ErylyiEP
   i9ZVVBo9TepUyOtgvBsme3zVQ0RiJyLp8bqSsdXQ8uHSg+Ta5a7MiVnyq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="476975289"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="476975289"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 14:01:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="908556633"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="908556633"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2023 14:01:08 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r31T0-0000ho-0s;
	Tue, 14 Nov 2023 22:01:06 +0000
Date: Wed, 15 Nov 2023 06:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-fixes 41/41] fs/afs/server_list.c:75:21: warning:
 variable 'tmp' is uninitialized when used here
Message-ID: <202311150502.t1avq03b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-fixes
head:   9e6938066eb39856ef50be2da622f8e7214d4009
commit: 9e6938066eb39856ef50be2da622f8e7214d4009 [41/41] afs: Fix the handling of RO volumes
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231115/202311150502.t1avq03b-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311150502.t1avq03b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311150502.t1avq03b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/server_list.c:75:21: warning: variable 'tmp' is uninitialized when used here [-Wuninitialized]
      75 |                 bool newrepsite = tmp & AFS_VLSF_NEWREPSITE;
         |                                   ^~~
   fs/afs/server_list.c:36:9: note: initialize the variable 'tmp' to silence this warning
      36 |         u32 tmp;
         |                ^
         |                 = 0
   1 warning generated.
--
>> fs/afs/validation.c:328:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     328 |         if (op->volsync.creation != TIME64_MIN || op->volsync.update != TIME64_MIN) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/afs/validation.c:343:9: note: uninitialized use occurs here
     343 |         return ret;
         |                ^~~
   fs/afs/validation.c:328:2: note: remove the 'if' if its condition is always true
     328 |         if (op->volsync.creation != TIME64_MIN || op->volsync.update != TIME64_MIN) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/afs/validation.c:324:9: note: initialize the variable 'ret' to silence this warning
     324 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/tmp +75 fs/afs/server_list.c

    23	
    24	/*
    25	 * Build a server list from a VLDB record.
    26	 */
    27	struct afs_server_list *afs_alloc_server_list(struct afs_volume *volume,
    28						      struct key *key,
    29						      struct afs_vldb_entry *vldb)
    30	{
    31		struct afs_server_list *slist;
    32		struct afs_server *server;
    33		unsigned int type_mask = 1 << volume->type;
    34		bool use_newrepsites = false;
    35		int ret = -ENOMEM, nr_servers = 0, newrep = 0, i, j;
    36		u32 tmp;
    37	
    38		/* Work out if we're going to restrict to NEWREPSITE-marked servers or
    39		 * not.  If at least one site is marked as NEWREPSITE, then it's likely
    40		 * that "vos release" is busy updating RO sites.  We cut over from one
    41		 * to the other when >=50% of the sites have been updated.  Sites that
    42		 * are in the process of being updated are marked DONTUSE.
    43		 */
    44		for (i = 0; i < vldb->nr_servers; i++) {
    45			if (!(vldb->fs_mask[i] & type_mask))
    46				continue;
    47			nr_servers++;
    48			if (vldb->vlsf_flags[i] & AFS_VLSF_DONTUSE)
    49				continue;
    50			if (vldb->vlsf_flags[i] & AFS_VLSF_NEWREPSITE)
    51				newrep++;
    52		}
    53	
    54		slist = kzalloc(struct_size(slist, servers, nr_servers), GFP_KERNEL);
    55		if (!slist)
    56			goto error;
    57	
    58		if (newrep) {
    59			if (newrep < nr_servers / 2) {
    60				kdebug("USE-OLD");
    61				slist->ro_replicating = AFS_RO_REPLICATING_USE_OLD;
    62			} else {
    63				kdebug("USE-NEW");
    64				slist->ro_replicating = AFS_RO_REPLICATING_USE_NEW;
    65				use_newrepsites = true;
    66			}
    67		}
    68	
    69		refcount_set(&slist->usage, 1);
    70		rwlock_init(&slist->lock);
    71	
    72		/* Make sure a records exists for each server in the list. */
    73		for (i = 0; i < vldb->nr_servers; i++) {
    74			unsigned long se_flags = 0;
  > 75			bool newrepsite = tmp & AFS_VLSF_NEWREPSITE;
    76	
    77			if (!(vldb->fs_mask[i] & type_mask))
    78				continue;
    79			if (tmp & AFS_VLSF_DONTUSE)
    80				__set_bit(AFS_SE_EXCLUDED, &se_flags);
    81			if (newrep && (newrepsite ^ use_newrepsites))
    82				__set_bit(AFS_SE_EXCLUDED, &se_flags);
    83	
    84			server = afs_lookup_server(volume->cell, key, &vldb->fs_server[i],
    85						   vldb->addr_version[i]);
    86			if (IS_ERR(server)) {
    87				ret = PTR_ERR(server);
    88				if (ret == -ENOENT ||
    89				    ret == -ENOMEDIUM)
    90					continue;
    91				goto error_2;
    92			}
    93	
    94			/* Insertion-sort by UUID */
    95			for (j = 0; j < slist->nr_servers; j++)
    96				if (memcmp(&slist->servers[j].server->uuid,
    97					   &server->uuid,
    98					   sizeof(server->uuid)) >= 0)
    99					break;
   100			if (j < slist->nr_servers) {
   101				if (slist->servers[j].server == server) {
   102					afs_put_server(volume->cell->net, server,
   103						       afs_server_trace_put_slist_isort);
   104					continue;
   105				}
   106	
   107				memmove(slist->servers + j + 1,
   108					slist->servers + j,
   109					(slist->nr_servers - j) * sizeof(struct afs_server_entry));
   110			}
   111	
   112			slist->servers[j].server = server;
   113			slist->servers[j].volume = volume;
   114			slist->servers[j].flags = se_flags;
   115			slist->servers[j].cb_expires_at = AFS_NO_CB_PROMISE;
   116			slist->nr_servers++;
   117		}
   118	
   119		if (slist->nr_servers == 0) {
   120			ret = -EDESTADDRREQ;
   121			goto error_2;
   122		}
   123	
   124		return slist;
   125	
   126	error_2:
   127		afs_put_serverlist(volume->cell->net, slist);
   128	error:
   129		return ERR_PTR(ret);
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

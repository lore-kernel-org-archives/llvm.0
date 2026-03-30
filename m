Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1643BED32;
	Mon, 30 Mar 2026 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868766; cv=none; b=FCv8m7fHepTOPJg3ILQDLb/AyBzoMHaVpPrduIwJftd6u1jLP1c2WZTpwor7T8qTuqS5OP/bvqV9gELlqIyZxQDsU7YCNt8QlzXvGi9iM2Uc6UbBfLjewW9x8GHyYdXRKuANn8S3b84qS390plDVPy+Ea9Nq/Q/zNRV8BLiJk7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868766; c=relaxed/simple;
	bh=DriSC4j+6v0Vp09GpAv5avbyXZ+yyv/fxsbtJTwP3JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGMvMHkOh6CRQubVtxcMu8wfle0skIElXXUuj9dEjIO73W5Ov4yJwD0WPnket2mL9RBXwi41laR5MFmjVpv31n/rbiebmSV2pamH66WFjISDTCG/MXDBG/uTYjRM5a1rC6MEZZImVHqdSs18B/cq7HLbfgxHF0cHEbkN4r3exvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYZHiekh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYZHiekh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774868759; x=1806404759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DriSC4j+6v0Vp09GpAv5avbyXZ+yyv/fxsbtJTwP3JM=;
  b=lYZHiekhXHLaatKS+rn4VM6z1l4+Kdia7BtRX3maaAuRMub0gWmi2ASG
   AuFznLd9+MZ2tbBeErcYuHPpzxg+xyfK3L4oFU0yDzCt1+SbDtJ+1Gman
   y/pMEQfP08KfdOj83cMly08IrInhRoew5H2O3NdW6BVHQasMnYGqt/wmi
   F0gkDNy2fZxAQ637OMZfhFkiz+o/T5412se1j/bX4oUDq0ZPy6c6jZllp
   DrA0Jenf9CH6WbBAFYxX1O7a6dUIgxIXDPZlVN6zpKZpAEGxaAmmvmMqb
   uP+bW2Kfy07rbVJIUHRuMw7PgUwhcyOyVTJccMkrhVcIiimwotoL2h2SV
   w==;
X-CSE-ConnectionGUID: CRUEPFjKSF+ccP+gji6SiQ==
X-CSE-MsgGUID: jP1wbT+SRYWIu5m356f2mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="76049453"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="76049453"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:05:59 -0700
X-CSE-ConnectionGUID: nVSPFUITTmOyaO7upa/Ddg==
X-CSE-MsgGUID: xGUTSOsuTm2yOhiKpRKpVA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Mar 2026 04:05:55 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ARM-000000000zs-4BDj;
	Mon, 30 Mar 2026 11:05:52 +0000
Date: Mon, 30 Mar 2026 19:05:02 +0800
From: kernel test robot <lkp@intel.com>
To: mpenttil@redhat.com, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v7 3/6] mm/hmm: do the plumbing for HMM to participate in
 migration
Message-ID: <202603301832.rpYcya7E-lkp@intel.com>
References: <20260330043017.251808-4-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330043017.251808-4-mpenttil@redhat.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7aaa8047eafd0bd628065b15757d9b48c5f9c07d]

url:    https://github.com/intel-lab-lkp/linux/commits/mpenttil-redhat-com/mm-Kconfig-changes-for-migrate-on-fault-for-device-pages/20260330-124915
base:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
patch link:    https://lore.kernel.org/r/20260330043017.251808-4-mpenttil%40redhat.com
patch subject: [PATCH v7 3/6] mm/hmm: do the plumbing for HMM to participate in migration
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260330/202603301832.rpYcya7E-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301832.rpYcya7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301832.rpYcya7E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/aio.c:40:
>> include/linux/migrate.h:114:1: error: function definition is not allowed here
     114 | {
         | ^
   include/linux/migrate.h:127:1: error: function definition is not allowed here
     127 | {
         | ^
   include/linux/migrate.h:131:1: error: function definition is not allowed here
     131 | {
         | ^
   In file included from fs/aio.c:41:
   In file included from include/linux/ramfs.h:5:
   In file included from include/linux/fs_parser.h:11:
>> include/linux/fs_context.h:141:1: error: function definition is not allowed here
     141 | {
         | ^
   In file included from fs/aio.c:41:
   In file included from include/linux/ramfs.h:5:
>> include/linux/fs_parser.h:75:1: error: function definition is not allowed here
      75 | {
         | ^
   include/linux/fs_parser.h:95:1: error: function definition is not allowed here
      95 | { return true; }
         | ^
   In file included from fs/aio.c:41:
>> include/linux/ramfs.h:15:1: error: function definition is not allowed here
      15 | {
         | ^
   In file included from fs/aio.c:49:
>> fs/internal.h:113:1: error: function definition is not allowed here
     113 | {
         | ^
   fs/internal.h:121:1: error: function definition is not allowed here
     121 | {
         | ^
   fs/internal.h:150:1: error: function definition is not allowed here
     150 | {
         | ^
   fs/internal.h:170:1: error: function definition is not allowed here
     170 | {
         | ^
>> fs/internal.h:214:6: error: conflicting types for 'in_group_or_capable'
     214 | bool in_group_or_capable(struct mnt_idmap *idmap,
         |      ^
   include/linux/fs.h:1842:6: note: previous declaration is here
    1842 | bool in_group_or_capable(struct mnt_idmap *idmap,
         |      ^
   In file included from fs/aio.c:49:
   fs/internal.h:313:1: error: function definition is not allowed here
     313 | {
         | ^
   fs/internal.h:319:1: error: function definition is not allowed here
     319 | {
         | ^
>> fs/internal.h:330:19: error: conflicting types for 'mnt_idmap_get'
     330 | struct mnt_idmap *mnt_idmap_get(struct mnt_idmap *idmap);
         |                   ^
   include/linux/mnt_idmapping.h:124:19: note: previous declaration is here
     124 | struct mnt_idmap *mnt_idmap_get(struct mnt_idmap *idmap);
         |                   ^
   In file included from fs/aio.c:49:
>> fs/internal.h:331:6: error: conflicting types for 'mnt_idmap_put'
     331 | void mnt_idmap_put(struct mnt_idmap *idmap);
         |      ^
   include/linux/mnt_idmapping.h:125:6: note: previous declaration is here
     125 | void mnt_idmap_put(struct mnt_idmap *idmap);
         |      ^
   In file included from fs/aio.c:49:
   fs/internal.h:352:1: error: function definition is not allowed here
     352 | {
         | ^
>> fs/aio.c:245:1: error: function definition is not allowed here
     245 | {
         | ^
>> fs/aio.c:257:37: error: variable has incomplete type 'const struct file_operations'
     257 | static const struct file_operations aio_ring_fops;
         |                                     ^
   include/linux/fs_context.h:19:8: note: forward declaration of 'struct file_operations'
      19 | struct file_operations;
         |        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from mm/filemap.c:45:
>> include/linux/migrate.h:114:1: error: function definition is not allowed here
     114 | {
         | ^
   include/linux/migrate.h:127:1: error: function definition is not allowed here
     127 | {
         | ^
   include/linux/migrate.h:131:1: error: function definition is not allowed here
     131 | {
         | ^
   In file included from mm/filemap.c:46:
>> include/linux/pipe_fs_i.h:162:1: error: function definition is not allowed here
     162 | {
         | ^
   include/linux/pipe_fs_i.h:176:1: error: function definition is not allowed here
     176 | {
         | ^
   include/linux/pipe_fs_i.h:186:1: error: function definition is not allowed here
     186 | {
         | ^
   include/linux/pipe_fs_i.h:198:1: error: function definition is not allowed here
     198 | {
         | ^
   include/linux/pipe_fs_i.h:207:1: error: function definition is not allowed here
     207 | {
         | ^
   include/linux/pipe_fs_i.h:216:1: error: function definition is not allowed here
     216 | {
         | ^
   include/linux/pipe_fs_i.h:225:1: error: function definition is not allowed here
     225 | {
         | ^
   include/linux/pipe_fs_i.h:236:1: error: function definition is not allowed here
     236 | {
         | ^
   include/linux/pipe_fs_i.h:245:1: error: function definition is not allowed here
     245 | {
         | ^
   include/linux/pipe_fs_i.h:258:1: error: function definition is not allowed here
     258 | {
         | ^
   include/linux/pipe_fs_i.h:269:1: error: function definition is not allowed here
     269 | {
         | ^
   include/linux/pipe_fs_i.h:283:1: error: function definition is not allowed here
     283 | {
         | ^
   include/linux/pipe_fs_i.h:296:1: error: function definition is not allowed here
     296 | {
         | ^
   In file included from mm/filemap.c:47:
>> include/linux/splice.h:94:1: error: function definition is not allowed here
      94 | {
         | ^
   In file included from mm/filemap.c:48:
>> include/linux/rcupdate_wait.h:63:1: error: function definition is not allowed here
      63 | {
         | ^
   include/linux/rcupdate_wait.h:74:1: error: function definition is not allowed here
      74 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from mm/folio-compat.c:8:
>> include/linux/migrate.h:114:1: error: function definition is not allowed here
     114 | {
         | ^
   include/linux/migrate.h:127:1: error: function definition is not allowed here
     127 | {
         | ^
   include/linux/migrate.h:131:1: error: function definition is not allowed here
     131 | {
         | ^
   In file included from mm/folio-compat.c:10:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:18:
>> include/linux/page_counter.h:58:1: error: function definition is not allowed here
      58 | {
         | ^
   include/linux/page_counter.h:67:1: error: function definition is not allowed here
      67 | {
         | ^
   include/linux/page_counter.h:82:1: error: function definition is not allowed here
      82 | {
         | ^
   include/linux/page_counter.h:91:1: error: function definition is not allowed here
      91 | {
         | ^
   include/linux/page_counter.h:109:39: error: function definition is not allowed here
     109 |                                                      bool recursive_protection) {}
         |                                                                                 ^
   In file included from mm/folio-compat.c:10:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:19:
   In file included from include/linux/vmpressure.h:11:
>> include/linux/eventfd.h:44:1: error: function definition is not allowed here
      44 | {
         | ^
   include/linux/eventfd.h:88:1: error: function definition is not allowed here
      88 | {
         | ^
   In file included from mm/folio-compat.c:10:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:19:
>> include/linux/vmpressure.h:48:58: error: function definition is not allowed here
      48 |                               unsigned long scanned, unsigned long reclaimed) {}
         |                                                                               ^
   include/linux/vmpressure.h:50:18: error: function definition is not allowed here
      50 |                                    int prio) {}
         |                                              ^
   In file included from mm/folio-compat.c:10:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:11:
>> include/linux/flex_proportions.h:64:1: error: function definition is not allowed here
      64 | {
         | ^
   In file included from mm/folio-compat.c:10:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:12:
>> include/linux/backing-dev-defs.h:281:1: error: function definition is not allowed here
     281 | {
         | ^
   include/linux/backing-dev-defs.h:286:1: error: function definition is not allowed here
     286 | {
         | ^
   include/linux/backing-dev-defs.h:290:1: error: function definition is not allowed here
     290 | {
         | ^
   include/linux/backing-dev-defs.h:294:1: error: function definition is not allowed here
     294 | {
         | ^
   include/linux/backing-dev-defs.h:298:1: error: function definition is not allowed here
     298 | {
         | ^
   In file included from mm/folio-compat.c:10:
   In file included from include/linux/rmap.h:12:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
>> include/linux/bvec.h:43:1: error: function definition is not allowed here
      43 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from mm/vmscan.c:42:
>> include/linux/migrate.h:114:1: error: function definition is not allowed here
     114 | {
         | ^
   include/linux/migrate.h:127:1: error: function definition is not allowed here
     127 | {
         | ^
   include/linux/migrate.h:131:1: error: function definition is not allowed here
     131 | {
         | ^
   In file included from mm/vmscan.c:43:
>> include/linux/delayacct.h:255:1: error: function definition is not allowed here
     255 | {}
         | ^
   include/linux/delayacct.h:257:1: error: function definition is not allowed here
     257 | {}
         | ^
   include/linux/delayacct.h:259:1: error: function definition is not allowed here
     259 | {}
         | ^
   include/linux/delayacct.h:261:1: error: function definition is not allowed here
     261 | {}
         | ^
   include/linux/delayacct.h:263:1: error: function definition is not allowed here
     263 | {}
         | ^
   include/linux/delayacct.h:266:1: error: function definition is not allowed here
     266 | { return 0; }
         | ^
   include/linux/delayacct.h:268:1: error: function definition is not allowed here
     268 | { return 0; }
         | ^
   include/linux/delayacct.h:270:1: error: function definition is not allowed here
     270 | { return 0; }
         | ^
   include/linux/delayacct.h:272:1: error: function definition is not allowed here
     272 | {}
         | ^
   include/linux/delayacct.h:274:1: error: function definition is not allowed here
     274 | {}
         | ^
   include/linux/delayacct.h:276:1: error: function definition is not allowed here
     276 | {}
         | ^
   include/linux/delayacct.h:278:1: error: function definition is not allowed here
     278 | {}
         | ^
   include/linux/delayacct.h:280:1: error: function definition is not allowed here
     280 | {}
         | ^
   include/linux/delayacct.h:282:1: error: function definition is not allowed here
     282 | {}
         | ^
   include/linux/delayacct.h:284:1: error: function definition is not allowed here
     284 | {}
         | ^
   include/linux/delayacct.h:286:1: error: function definition is not allowed here
     286 | {}
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
   In file included from mm/shmem.c:73:
>> include/linux/migrate.h:114:1: error: function definition is not allowed here
     114 | {
         | ^
   include/linux/migrate.h:127:1: error: function definition is not allowed here
     127 | {
         | ^
   include/linux/migrate.h:131:1: error: function definition is not allowed here
     131 | {
         | ^
   In file included from mm/shmem.c:77:
   In file included from include/linux/syscalls.h:89:
>> include/linux/sem.h:18:1: error: function definition is not allowed here
      18 | {
         | ^
   include/linux/sem.h:23:1: error: function definition is not allowed here
      23 | {
         | ^
   In file included from mm/shmem.c:77:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:5:
>> include/linux/tracepoint.h:49:1: error: function definition is not allowed here
      49 | {
         | ^
   include/linux/tracepoint.h:75:1: error: function definition is not allowed here
      75 | {
         | ^
   include/linux/tracepoint.h:80:1: error: function definition is not allowed here
      80 | {
         | ^
   include/linux/tracepoint.h:85:1: error: function definition is not allowed here
      85 | {
         | ^
   include/linux/tracepoint.h:92:1: error: function definition is not allowed here
      92 | {
         | ^
   include/linux/tracepoint.h:99:1: error: function definition is not allowed here
      99 | {
         | ^
   include/linux/tracepoint.h:127:1: error: function definition is not allowed here
     127 | { }
         | ^
   include/linux/tracepoint.h:129:1: error: function definition is not allowed here
     129 | {
         | ^
   include/linux/tracepoint.h:159:1: error: function definition is not allowed here
     159 | {
         | ^
   In file included from mm/shmem.c:77:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:7:
>> include/linux/poll.h:43:1: error: function definition is not allowed here
      43 | {
         | ^
   include/linux/poll.h:63:1: error: function definition is not allowed here
      63 | {
         | ^
   include/linux/poll.h:68:1: error: function definition is not allowed here
      68 | {
         | ^
   include/linux/poll.h:74:1: error: function definition is not allowed here
      74 | {
         | ^
   include/linux/poll.h:79:1: error: function definition is not allowed here
      79 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
..


vim +114 include/linux/migrate.h

   112	
   113	static inline enum migrate_vma_info hmm_select_migrate(struct hmm_range *range)
 > 114	{
   115		return MIGRATE_VMA_SELECT_NONE;
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

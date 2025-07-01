Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA454302067;
	Tue,  1 Jul 2025 23:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751411946; cv=none; b=P7XJQaTiD8JDCVA3JziD4V3bpmiKMoIk4j83x7FwyPZ/A5fVPBbrfs6AHZEFl/vFIk/qA4zmwgNe1LBNY1z3E3c6fvFRhnqVeyIoEhh4YSVixkMdGZnxKweL7JWdOJLOdPWYJZMZMV3UpIN2SuIw0h1oyLV1QSV8V0EC2oOx3vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751411946; c=relaxed/simple;
	bh=9v6auvtXxy8Zj7hhbKhzUCVHP3ZBqxcbg4Lj622GnT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n//V8QZA3+EMcmT26JsJbu3+eshOaVZJg/O8e0iWuZXg6Z2tlBbe2XeqmtGA22roGwLTBI0MpFjsKOlrXVcSwRLVjyXfU0DDep1wpmlJKQLAGFttykDtHn15G0bCt1JERqljxho/r75U+lTfn/y1UIHQ8x0bRw5KBtPPkJskrMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDl0qhgp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDl0qhgp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751411943; x=1782947943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9v6auvtXxy8Zj7hhbKhzUCVHP3ZBqxcbg4Lj622GnT0=;
  b=TDl0qhgpPb9lee28P/Gz5yRyZpfXpUMWjZFopvTJ1K8GlA7WObiMtc1v
   DbTZ9P2FYa0QP5K6HINK3sCwdhQf/LXOYLyVjENiR3pMV0pmI3xPmehz/
   Ai3aZRePCpJ1uOnm0zoyv3+qwW3pWGIPh2I9Hm3EYxtmSoACKCNGlRBL0
   Dc09W9SmVhmVhnt7afbpmFAgbgwdb7LaPSgPWH5wu90e7C2C+ogo6YT52
   aP+umSpILlcPJsc3K98W6eIfVMwiV+UKRFMJSyF8762+c66Hywb6+scZ/
   FKJZv+kQUdQkCnec3TreZ/BshCq/A/FV4SQ6+3yt5F4ySm0avyhDR0gyo
   A==;
X-CSE-ConnectionGUID: tK4M5YJSS7WRqoq80l+Rng==
X-CSE-MsgGUID: dzoXNWA0RbKGNzEaG+fYPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65042168"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="65042168"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 16:19:03 -0700
X-CSE-ConnectionGUID: IIxX2MaWS3u7PFtbpobNHg==
X-CSE-MsgGUID: FgnI0QgoTdu2OQ638ROVew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="159617008"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jul 2025 16:19:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWkFe-000alK-2S;
	Tue, 01 Jul 2025 23:18:58 +0000
Date: Wed, 2 Jul 2025 07:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5943/6007] include/linux/mmzone.h:1191:2: error:
 unexpected token
Message-ID: <202507020742.ywCSlV7h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1343433ed38923a21425c602e92120a1f1db5f7a
commit: a3fca4a1309219709b9e66964593d5abac13786c [5943/6007] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507020742.ywCSlV7h-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020742.ywCSlV7h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020742.ywCSlV7h-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/blk-mq-dma.c:5:
   In file included from include/linux/blk-mq-dma.h:5:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:14:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1191:2: error: unexpected token
    1191 |         VM_WARN_ON_ONCE_PAGE(!is_zone_device_page(page), page);
         |         ^
   include/linux/mmdebug.h:57:3: note: expanded from macro 'VM_WARN_ON_ONCE_PAGE'
      57 |                 WARN_ON(1);                                             \
         |                 ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:109:19: note: expanded from macro '__WARN'
     109 | #define __WARN()                __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:68:1: note: expanded from here
      68 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"include/linux/mmzone.h\"; .popsection; .long 10002b - .; .short 1191; .short (1 << 0)|(((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "include/linux/mmzone.h"; .popsection; .long 10002b - .; .short 1191; .short (1 << 0)|(((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from block/blk-mq-dma.c:5:
   In file included from include/linux/blk-mq-dma.h:6:
>> include/linux/pci-p2pdma.h:188:2: error: unexpected token
     188 |         WARN_ON_ONCE(state->map != PCI_P2PDMA_MAP_BUS_ADDR);
         |         ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:20:1: note: expanded from here
      20 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"state->map != PCI_P2PDMA_MAP_BUS_ADDR\"\"] \" \"include/linux/pci-p2pdma.h\"; .popsection; .long 10002b - .; .short 188; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""state->map != PCI_P2PDMA_MAP_BUS_ADDR""] " "include/linux/pci-p2pdma.h"; .popsection; .long 10002b - .; .short 188; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from block/blk-mq-dma.c:5:
   In file included from include/linux/blk-mq-dma.h:5:
   In file included from include/linux/blk-mq.h:8:
   include/linux/scatterlist.h:137:2: error: unexpected token
     137 |         BUG_ON((unsigned long)page & SG_PAGE_LINK_MASK);
         |         ^
   include/asm-generic/bug.h:77:57: note: expanded from macro 'BUG_ON'
      77 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/s390/include/asm/bug.h:49:2: note: expanded from macro 'BUG'
      49 |         __BUG_FLAGS("", 0);                                     \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:174:1: note: expanded from here
     174 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"include/linux/scatterlist.h\"; .popsection; .long 10002b - .; .short 137; .short 0; .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "include/linux/scatterlist.h"; .popsection; .long 10002b - .; .short 137; .short 0; .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from block/blk-mq-dma.c:5:
   In file included from include/linux/blk-mq-dma.h:5:
   In file included from include/linux/blk-mq.h:8:
   include/linux/scatterlist.h:139:2: error: unexpected token
     139 |         BUG_ON(sg_is_chain(sg));
         |         ^
   include/asm-generic/bug.h:77:57: note: expanded from macro 'BUG_ON'
      77 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/s390/include/asm/bug.h:49:2: note: expanded from macro 'BUG'
      49 |         __BUG_FLAGS("", 0);                                     \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:2:1: note: expanded from here
       2 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"include/linux/scatterlist.h\"; .popsection; .long 10002b - .; .short 139; .short 0; .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "include/linux/scatterlist.h"; .popsection; .long 10002b - .; .short 139; .short 0; .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   block/blk-mq-dma.c:273:2: error: unexpected token
     273 |         WARN_ON(nsegs > blk_rq_nr_phys_segments(rq));
         |         ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:109:19: note: expanded from macro '__WARN'
     109 | #define __WARN()                __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:23:1: note: expanded from here
      23 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"block/blk-mq-dma.c\"; .popsection; .long 10002b - .; .short 273; .short (1 << 0)|(((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
--
   block/bio-integrity.c:58:6: error: unexpected token
      58 |         if (WARN_ON_ONCE(bio_has_crypt_ctx(bio)))
         |             ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:48:1: note: expanded from here
      48 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"bio_has_crypt_ctx(bio)\"\"] \" \"block/bio-integrity.c\"; .popsection; .long 10002b - .; .short 58; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""bio_has_crypt_ctx(bio)""] " "block/bio-integrity.c"; .popsection; .long 10002b - .; .short 58; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from block/bio-integrity.c:9:
   In file included from include/linux/blk-integrity.h:5:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:10:
   include/linux/ucopysize.h:57:6: error: unexpected token
      57 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:168:1: note: expanded from here
     168 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"bytes > INT_MAX\"\"] \" \"include/linux/ucopysize.h\"; .popsection; .long 10002b - .; .short 57; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""bytes > INT_MAX""] " "include/linux/ucopysize.h"; .popsection; .long 10002b - .; .short 57; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   block/bio-integrity.c:88:2: error: unexpected token
      88 |         WARN_ON_ONCE(ret != bytes);
         |         ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:58:1: note: expanded from here
      58 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"ret != bytes\"\"] \" \"block/bio-integrity.c\"; .popsection; .long 10002b - .; .short 88; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""ret != bytes""] " "block/bio-integrity.c"; .popsection; .long 10002b - .; .short 88; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from block/bio-integrity.c:9:
   In file included from include/linux/blk-integrity.h:5:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:14:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1191:2: error: unexpected token
    1191 |         VM_WARN_ON_ONCE_PAGE(!is_zone_device_page(page), page);
         |         ^
   include/linux/mmdebug.h:57:3: note: expanded from macro 'VM_WARN_ON_ONCE_PAGE'
      57 |                 WARN_ON(1);                                             \
         |                 ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:109:19: note: expanded from macro '__WARN'
     109 | #define __WARN()                __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:68:1: note: expanded from here
      68 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"include/linux/mmzone.h\"; .popsection; .long 10002b - .; .short 1191; .short (1 << 0)|(((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "include/linux/mmzone.h"; .popsection; .long 10002b - .; .short 1191; .short (1 << 0)|(((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   block/bio-integrity.c:58:6: error: unexpected token
      58 |         if (WARN_ON_ONCE(bio_has_crypt_ctx(bio)))
         |             ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:48:1: note: expanded from here
      48 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"bio_has_crypt_ctx(bio)\"\"] \" \"block/bio-integrity.c\"; .popsection; .long 10002b - .; .short 58; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""bio_has_crypt_ctx(bio)""] " "block/bio-integrity.c"; .popsection; .long 10002b - .; .short 58; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   block/bio-integrity.c:58:6: error: unexpected token
      58 |         if (WARN_ON_ONCE(bio_has_crypt_ctx(bio)))
         |             ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:48:1: note: expanded from here
      48 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"bio_has_crypt_ctx(bio)\"\"] \" \"block/bio-integrity.c\"; .popsection; .long 10002b - .; .short 58; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""bio_has_crypt_ctx(bio)""] " "block/bio-integrity.c"; .popsection; .long 10002b - .; .short 58; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from block/bio-integrity.c:9:
   In file included from include/linux/blk-integrity.h:5:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:10:
   include/linux/ucopysize.h:57:6: error: unexpected token
      57 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:168:1: note: expanded from here
     168 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"bytes > INT_MAX\"\"] \" \"include/linux/ucopysize.h\"; .popsection; .long 10002b - .; .short 57; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""bytes > INT_MAX""] " "include/linux/ucopysize.h"; .popsection; .long 10002b - .; .short 57; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   block/bio-integrity.c:58:6: error: unexpected token
      58 |         if (WARN_ON_ONCE(bio_has_crypt_ctx(bio)))
         |             ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:48:1: note: expanded from here
      48 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"bio_has_crypt_ctx(bio)\"\"] \" \"block/bio-integrity.c\"; .popsection; .long 10002b - .; .short 58; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""bio_has_crypt_ctx(bio)""] " "block/bio-integrity.c"; .popsection; .long 10002b - .; .short 58; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from block/bio-integrity.c:9:
   In file included from include/linux/blk-integrity.h:5:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:14:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:16:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:1191:2: error: unexpected token
    1191 |         VM_WARN_ON_ONCE_PAGE(!is_zone_device_page(page), page);
         |         ^
   include/linux/mmdebug.h:57:3: note: expanded from macro 'VM_WARN_ON_ONCE_PAGE'
      57 |                 WARN_ON(1);                                             \
         |                 ^
   include/asm-generic/bug.h:132:3: note: expanded from macro 'WARN_ON'
     132 |                 __WARN();                                               \
         |                 ^
   include/asm-generic/bug.h:109:19: note: expanded from macro '__WARN'
     109 | #define __WARN()                __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
         |                                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:68:1: note: expanded from here
      68 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"include/linux/mmzone.h\"; .popsection; .long 10002b - .; .short 1191; .short (1 << 0)|(((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "include/linux/mmzone.h"; .popsection; .long 10002b - .; .short 1191; .short (1 << 0)|(((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   In file included from block/bio-integrity.c:9:
   In file included from include/linux/blk-integrity.h:5:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   include/linux/bvec.h:148:6: error: unexpected token
     148 |         if (WARN_ONCE(bytes > iter->bi_size,
         |             ^
   include/asm-generic/bug.h:159:29: note: expanded from macro 'WARN_ONCE'
     159 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                    ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "include/linux/bvec.h"; .popsection; .long 10002b - .; .short 149; .short (1 << 0)|((1 << 3) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   block/bio-integrity.c:58:6: error: unexpected token
      58 |         if (WARN_ON_ONCE(bio_has_crypt_ctx(bio)))
         |             ^
   include/asm-generic/bug.h:119:3: note: expanded from macro 'WARN_ON_ONCE'
     119 |                 __WARN_FLAGS("["#condition"] ",                 \
         |                 ^
   arch/s390/include/asm/bug.h:44:2: note: expanded from macro '__WARN_FLAGS'
      44 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags));         \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:48:1: note: expanded from here
      48 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"[\"\"bio_has_crypt_ctx(bio)\"\"] \" \"block/bio-integrity.c\"; .popsection; .long 10002b - .; .short 58; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "[""bio_has_crypt_ctx(bio)""] " "block/bio-integrity.c"; .popsection; .long 10002b - .; .short 58; .short (1 << 0)|((1 << 1) | ((9) << 8)); .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   block/bio-integrity.c:415:2: error: unexpected token
     415 |         BUG_ON(bip_src == NULL);
         |         ^
   include/asm-generic/bug.h:77:57: note: expanded from macro 'BUG_ON'
      77 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                                         ^
   arch/s390/include/asm/bug.h:49:2: note: expanded from macro 'BUG'
      49 |         __BUG_FLAGS("", 0);                                     \
         |         ^
   arch/s390/include/asm/bug.h:40:22: note: expanded from macro '__BUG_FLAGS'
      40 |         asm_inline volatile(__stringify(ASM_BUG_FLAGS(cond_str, flags)));
         |                             ^
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^
   <scratch space>:22:1: note: expanded from here
      22 | ".pushsection __bug_table, \"aw\"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, \"aMS\", @progbits, 1; 10002: .string \"\" \"block/bio-integrity.c\"; .popsection; .long 10002b - .; .short 415; .short 0; .popsection; 10001: mc 0,0"
         | ^
   <inline asm>:1:134: note: instantiated into assembly here
       1 |         .pushsection __bug_table, "aw"; .align 4; 10000: .long 10001f - .; .pushsection .rodata.str, "aMS", @progbits, 1; 10002: .string "" "block/bio-integrity.c"; .popsection; .long 10002b - .; .short 415; .short 0; .popsection; 10001: mc 0,0
         |                                                                                                                                             ^
   12 errors generated.
..


vim +1191 include/linux/mmzone.h

49580e690755d0 Logan Gunthorpe 2022-10-21  1188  
82ba975e4c43d9 Alistair Popple 2025-02-28  1189  static inline struct dev_pagemap *page_pgmap(const struct page *page)
82ba975e4c43d9 Alistair Popple 2025-02-28  1190  {
82ba975e4c43d9 Alistair Popple 2025-02-28 @1191  	VM_WARN_ON_ONCE_PAGE(!is_zone_device_page(page), page);
82ba975e4c43d9 Alistair Popple 2025-02-28  1192  	return page_folio(page)->pgmap;
82ba975e4c43d9 Alistair Popple 2025-02-28  1193  }
82ba975e4c43d9 Alistair Popple 2025-02-28  1194  

:::::: The code at line 1191 was first introduced by commit
:::::: 82ba975e4c43d98afebced82d940ddb7aec42a9d mm: allow compound zone device pages

:::::: TO: Alistair Popple <apopple@nvidia.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051437;
	b=mW0XkQGJv+Hk3ca1Y68/7oyqSSarUwh9NoaH8/0+UefXklHbHi9ELzNVCe0OHbLViJ4I
	 WHNPo2IIsj5sfJN8NG42zkpYcroZMBVV1RhC0S153twCdOogK2QtE0cG+l0bxBsumvnZt
	 oE+O0wYqGag36KNLSQGE2gGmFiOE1Df6eZBp6UzZh0e1ZNt+qstpnN9tQHmFfTRzqgJGC
	 LP3i15fDoFTDcoAFJDDM1NiOp5ch7EQxNqDmBTIN9ExwuyY/HCQEwnBSilmQdPkP6qbHy
	 bKHrRVsSWY2bjz06nmaaqDyumSafE/IS/2zUG7GYre1l8zOYXduNiw54hEQAnVOHqOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051437;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+addTj74tfBP8ZQZ4109DB0wBAURMk2wu4zfm1aE3DM=;
	b=LsrHAWJZ3o33oApne9/OBOtkN+TVwhSFOvv1pmYdf28Hr7SRP2Q0KE7s5Otqj/zV+kca
	 zhyqG61G7KPpQLYcSRuN8zKtro5YuLOXpiCV6HKwvYpQTuMMSUivnDX3sbLzp+x0i32jQ
	 x1+fXuOj0nfNzKucDV3iWXQYGiGLNwY3aMbSeSgvsgzXhpTfyEhjJOVyyordIGRVFPGjy
	 SFPGV/LgTlQ8FZr9Tuzmn8Mbk7PWqqZovbU0d9QRURc49txE7GptCA8qocAf0MUSpaGET
	 wbBOV5kT0dDX9ipLJpQ4hUhAxShlNYdCxk/B+u5j9zJJepJFoDfNm6tHvDH2rf+8ClA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WD5b8paV;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4F606A31A;
	Mon, 26 Oct 2026 21:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56E4F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WD5b8paV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793051437; x=1824587437;
  h=date:from:to:cc:subject:message-id;
  bh=uQ0Eb8ogczpbBY8AhuHuuD0YhzbXF/HDRgKfmZa72Nk=;
  b=WD5b8paVzN22JRAyJvIe0whT2qQvNZ+oaxrrn4c1+MKx8BZLmNYDmuwR
   U8iqXG+ZYqKrss/j0OLEtFO5QNKoG0D2xD5EnJCx3rr7AcCoqQ28GNAQi
   trlmriXr5rZc+PitiEaqS9ric3y47pfIi3rUDjIkD+P/T8OZr4+JeUjzb
   JzkjtnZdQKACTJErVldzsPKxrMAlaWp7yjOPaEo6qN79lB0hLBSSbIO4c
   PHnzohhHaFymP2NFwPnh+A9Qw5StorSq4HHl24gFHEZ1Zg771JDK2ivu3
   0Z4PW/wrCkd9NTd1gm1JmLGxLuVPCK9NDhxHXVs/HOls3LJSxa+++pPUm
   A==;
X-CSE-ConnectionGUID: 5JVLRoh+Q4ughOfyXlemQQ==
X-CSE-MsgGUID: Q+ngyFUiRbqmKr/XwD5CNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1646299"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1646299"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 14:50:36 -0700
X-CSE-ConnectionGUID: Q28RyjUgR3Ksl7CgSbupZQ==
X-CSE-MsgGUID: YxBIo9GnSqGuP5MzDxdR8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4455545"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Oct 2026 14:50:34 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLSaO-000000004Ed-0IBz;
	Mon, 26 Oct 2026 21:50:32 +0000
Date: Mon, 26 Oct 2026 22:49:45 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/misc 3/7] include/trace/events/f2fs.h:2738:19:
 error: call to undeclared function 'get_pages'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202610262238.mtklrqr0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/misc
head:   df1ed8c6e6ade66abf786248b520f59b8a62e8e5
commit: f73f52daa2c47803a5139f277cae951aea207015 [3/7] f2fs: introduce trace_f2fs_enable_checkpoint()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261026/202610262238.mtklrqr0-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610262238.mtklrqr0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610262238.mtklrqr0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/super.c:42:
   In file included from include/trace/events/f2fs.h:2761:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:489:
>> include/trace/events/f2fs.h:2738:19: error: call to undeclared function 'get_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2738 |                 __entry->meta   = get_pages(sbi, F2FS_DIRTY_META);
         |                                   ^
   include/trace/events/f2fs.h:2738:19: note: did you mean 'get_page'?
   include/linux/mm.h:2125:20: note: 'get_page' declared here
    2125 | static inline void get_page(struct page *page)
         |                    ^
   In file included from fs/f2fs/super.c:42:
   In file included from include/trace/events/f2fs.h:2761:
   In file included from include/trace/define_trace.h:133:
   In file included from include/trace/perf.h:110:
>> include/trace/events/f2fs.h:2738:19: error: call to undeclared function 'get_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2738 |                 __entry->meta   = get_pages(sbi, F2FS_DIRTY_META);
         |                                   ^
   2 errors generated.


vim +/get_pages +2738 include/trace/events/f2fs.h

  2719	
  2720		TP_PROTO(struct f2fs_sb_info *sbi, u16 phase),
  2721	
  2722		TP_ARGS(sbi, phase),
  2723	
  2724		TP_STRUCT__entry(
  2725			__field(dev_t, dev)
  2726			__field(u16, phase)
  2727			__field(long long, meta)
  2728			__field(long long, imeta)
  2729			__field(long long, nodes)
  2730			__field(long long, data)
  2731			__field(long long, dents)
  2732			__field(long long, qdata)
  2733		),
  2734	
  2735		TP_fast_assign(
  2736			__entry->dev	= sbi->sb->s_dev;
  2737			__entry->phase	= phase;
> 2738			__entry->meta	= get_pages(sbi, F2FS_DIRTY_META);
  2739			__entry->imeta	= get_pages(sbi, F2FS_DIRTY_IMETA);
  2740			__entry->nodes	= get_pages(sbi, F2FS_DIRTY_NODES);
  2741			__entry->data	= get_pages(sbi, F2FS_DIRTY_DATA);
  2742			__entry->dents	= get_pages(sbi, F2FS_DIRTY_DENTS);
  2743			__entry->qdata	= get_pages(sbi, F2FS_DIRTY_QDATA);
  2744		),
  2745	
  2746		TP_printk("dev = (%d,%d), phase: %s, meta: %lld, imeta: %lld, "
  2747			"nodes: %lld, data: %lld, dents: %lld, qdata: %lld",
  2748			show_dev(__entry->dev),
  2749			show_enable_cp_phase(__entry->phase),
  2750			__entry->meta,
  2751			__entry->imeta,
  2752			__entry->nodes,
  2753			__entry->data,
  2754			__entry->dents,
  2755			__entry->qdata)
  2756	);
  2757	
  2758	#endif /* _TRACE_F2FS_H */
  2759	
  2760	 /* This part must be outside protection */
> 2761	#include <trace/define_trace.h>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A03E156F2D;
	Thu, 16 May 2024 19:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715886988; cv=none; b=VjT7GJNQAOCc0ebg/8a/qsVvF8ECCqeGokzhLsAHX/FD5Z/Z+kPXRKlaXJEknN8/Pw91Q+JTvFk+CwctudeEzXNsop1bT6uB8enTFUG88Iqmb8Wx7bs80BqZEjMLNp77oA6T3D6Vk1yCYjEXSiKlKfSFAz1GEZ4SMOpW2tCGcPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715886988; c=relaxed/simple;
	bh=jBWDP0Z6VnBSuflMaKwkJgNqCQZcMNiqvTcg6bQzqYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMzP1kMfw6YSrgbN9pw8tfx+uA/L0Pa58rF06DTL7whS4r8WpzQb9iMwMaiz622NjZSEyJTUpgAg2H03Y4LFgi+wi7vxZ8LN06LLEIsw3sTo0PEsZmb3Qbbwp4vzK9yMfoHqymlYfk/j9HNnn30169D2k5R9vtgEBwugPgwO0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhhP0oEh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhhP0oEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715886987; x=1747422987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBWDP0Z6VnBSuflMaKwkJgNqCQZcMNiqvTcg6bQzqYA=;
  b=fhhP0oEhPIaNbOI+XKS3f29TmQ+hEZO12mWtN6P5vjt2CpU1xbgT6hwy
   32UVriW9mH+Lr3aKS4yK5i/zvkyiCdl9W9KTF/0FuRcfgM3IKsisGvzKN
   OdL5YT4QOazNp0aS6Z+v9gKIMh89TyPN5RHqy7/fV0ePdS4y3Ak0g+q2X
   lmMVdk24e5BQSLSPomqoHftWFHHgDJ9SCSp+mbYOYMwESZI38iUk3Gzmr
   VbFfmfUxVhWhwoLqdiAocH0sN7vmPJd9vdH2lJw1/gSKjsViQgZWLk/9b
   h3mmNlx8EQ/R2JsvzdciT8SMVdowjly0Q/R/wB5ard2EHOaxn7vFIeLpr
   Q==;
X-CSE-ConnectionGUID: w4AwYIlDRsijXBtqBPiGMw==
X-CSE-MsgGUID: E6J9VG24TQiPIk2u2XBlGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22635030"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="22635030"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 12:16:26 -0700
X-CSE-ConnectionGUID: qJ4beR9yQ8u4BdpCSvsEBQ==
X-CSE-MsgGUID: IUOlTepuRzGDL9bvaOY6+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="62365595"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 May 2024 12:16:23 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7gaT-000Egz-0e;
	Thu, 16 May 2024 19:16:21 +0000
Date: Fri, 17 May 2024 03:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:probes/for-next 17/17] kernel/kprobes.c:1141:24: error: a
 function declaration without a prototype is deprecated in all versions of C
Message-ID: <202405170340.eyEMhYvc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace probes/for-next
head:   1a7d0890dd4a502a202aaec792a6c04e6e049547
commit: 1a7d0890dd4a502a202aaec792a6c04e6e049547 [17/17] kprobe/ftrace: bail out if ftrace was killed
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240517/202405170340.eyEMhYvc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405170340.eyEMhYvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405170340.eyEMhYvc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/kprobes.c:23:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kprobes.c:1141:24: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
    1141 | void kprobe_ftrace_kill()
         |                        ^
         |                         void
   5 warnings and 1 error generated.


vim +1141 kernel/kprobes.c

  1140	
> 1141	void kprobe_ftrace_kill()
  1142	{
  1143		kprobe_ftrace_disabled = true;
  1144	}
  1145	#else	/* !CONFIG_KPROBES_ON_FTRACE */
  1146	static inline int arm_kprobe_ftrace(struct kprobe *p)
  1147	{
  1148		return -ENODEV;
  1149	}
  1150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

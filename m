Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC41136A;
	Sun,  7 Jul 2024 01:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720315951; cv=none; b=XyWO36iWrD5qEhijvTEcHyrM/rkI4Zlelwqc9/3rIpogYpHKfGrZNTK+XtJfb0nUNa5nYd7feC5qA/9N4REHAPhA4I4gm78tXT+3YKfH8DmjTjeg8+YZt1gqwRISl0AmbfZMq7AnvKXJVz0e4rfMGBvnX2HfliYOZiGUFnh20h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720315951; c=relaxed/simple;
	bh=o6UPxlrZWlUTwnJHPoouIAjTB4S4+KqX6H7B4WlISIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DxbfLDYgLLEVodFAc0QnP9hNZ1vkg9ZoPjIbqY/pYsbF1swdEXbvU8bIBK9T2Y78ikSfk2e9EY95+ElC2KMsU4kKGX2MS0QdFO+ax/VGdmfnx454D/ZyaVpEofga/6mn+YkayM+vYp8DlOidz33Dbb0y5qL3V7mbCG8UWA7nOwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m7n7Wu+8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m7n7Wu+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720315950; x=1751851950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o6UPxlrZWlUTwnJHPoouIAjTB4S4+KqX6H7B4WlISIM=;
  b=m7n7Wu+8AA20nHCIXoz/XDSfa6ar3dnTRIOH4P0mAcePqnomWHiRElZu
   JLl4qBEyxMm/cfpNaZ1sNjbWvU6bBnyMP+zz3s3mpxMQQ5trUy1XUZ5Cs
   R2a4WEwpNHhnqFOWHNi0LWtVrO3jWyxC1/NoGxfFyhm1HZCQqMhSKppDF
   FFzAiK0Y56A+l4tCwizaDrrEP/CQNF6eUUsAOwa/MMltoR0TcwbMqk/2o
   aeSUHzTfkbael8CKzsMOy+wYdXzgdZdQiHVZ+W5BxCO5h6K7G0N7Dbmxx
   aVamziiWH8Q4lYjMPWMApWHRz2IPG/KEMdDlVdH05VK3xr5PYerQ/b0tY
   Q==;
X-CSE-ConnectionGUID: 2JqRehm9RdunDYoEVk4HOw==
X-CSE-MsgGUID: eDVFh3T7Q1Olz9qdTc3uyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17266194"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="17266194"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 18:32:27 -0700
X-CSE-ConnectionGUID: mhUyIMiNSKSN5677zU2kYQ==
X-CSE-MsgGUID: fQvj5nkTSc6tb0nxbb2fdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="47057057"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jul 2024 18:32:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQGlL-000UTO-2T;
	Sun, 07 Jul 2024 01:32:23 +0000
Date: Sun, 7 Jul 2024 09:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:probes/for-next 16/16] kernel/trace/trace_kprobe.c:810:9:
 error: call to undeclared function 'find_module'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202407070917.VVUCBlaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace probes/for-next
head:   9d8616034f161222a4ac166c1b42b6d79961c005
commit: 9d8616034f161222a4ac166c1b42b6d79961c005 [16/16] tracing/kprobes: Add symbol counting check when module loads
config: arm-randconfig-004-20240707 (https://download.01.org/0day-ci/archive/20240707/202407070917.VVUCBlaS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070917.VVUCBlaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407070917.VVUCBlaS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/trace_kprobe.c:10:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/trace/trace_kprobe.c:810:9: error: call to undeclared function 'find_module'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     810 |                 mod = find_module(modname);
         |                       ^
   kernel/trace/trace_kprobe.c:810:9: note: did you mean 'init_module'?
   include/linux/module.h:76:12: note: 'init_module' declared here
      76 | extern int init_module(void);
         |            ^
>> kernel/trace/trace_kprobe.c:810:7: error: incompatible integer to pointer conversion assigning to 'struct module *' from 'int' [-Wint-conversion]
     810 |                 mod = find_module(modname);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/find_module +810 kernel/trace/trace_kprobe.c

   796	
   797	static int validate_probe_symbol(char *symbol)
   798	{
   799		struct module *mod = NULL;
   800		char *modname = NULL, *p;
   801		int ret = 0;
   802	
   803		p = strchr(symbol, ':');
   804		if (p) {
   805			modname = symbol;
   806			symbol = p + 1;
   807			*p = '\0';
   808			/* Return 0 (defer) if the module does not exist yet. */
   809			rcu_read_lock_sched();
 > 810			mod = find_module(modname);
   811			if (mod && !try_module_get(mod))
   812				mod = NULL;
   813			rcu_read_unlock_sched();
   814			if (!mod)
   815				goto out;
   816		}
   817	
   818		ret = validate_module_probe_symbol(modname, symbol);
   819	out:
   820		if (p)
   821			*p = ':';
   822		if (mod)
   823			module_put(mod);
   824		return ret;
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

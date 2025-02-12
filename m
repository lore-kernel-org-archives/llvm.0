Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF4B17993;
	Wed, 12 Feb 2025 01:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739323234; cv=none; b=uuiyPrJLpNgIdP+X83tn6oZJ89wWgiz6752KpYIgnkrrKFYtOxvgTodpr79B3olXA7Wc4b1PVuCIQDMLDcGmjhX6CkyCyeW8W/Wyp/84DXZ8B2K4pw4sE8quDqwIt3OYEIUZSKhU0K2XxR+lrvicqBhJ2eEIjF20aKTNDCbHS+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739323234; c=relaxed/simple;
	bh=Z98xk3C2YQwVk4dPClx8w0Sy0PLlv9Q8GUi9gv61H3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bSxe1kAiJCPKZwgDDA0CI406q8R/y8ZKPs5LBSh5iZbOt5wJweXo7+77lufIUosM4UydwB5vB+9WCQjHWYMlUZ5yWtYg6pVJshEGAZp485KCHVn4GRC8jLZOtdR874PcifYzHpW263tnf8XpYClpHnEugQvbW6sWTDiazG39qsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arQIwJZi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arQIwJZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739323233; x=1770859233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z98xk3C2YQwVk4dPClx8w0Sy0PLlv9Q8GUi9gv61H3A=;
  b=arQIwJZiLIQ3YHICXgkkp8YaaqaBVP/rHtpBv6/MUau6vbo5e650je9H
   g5Z4TXYqrGgWXpwm0tButHcJ5Dq3cPz0UltHDgaW9+w62myV7shcsXdZl
   PnbyCiteHX3L9bz84fl3UiDm5g799Y3M9QIOdgH0z5cHcgPhiWWuWe1yR
   m31zhsFLUgLeLmSOJpLuVnx/LwcVcnmZ2Zf83Idb5nuBiBeiM630EE/VY
   pN5toHNHdrULXE04VnU38cS2shcd/h+EjgcnuJra0YidjDZoxMfCk9WMI
   valOPyb4flNuGa7z9YnVUaqDCvt7Rt1Zv/cHOXIbz0M4Inj8VAOgD/E7c
   g==;
X-CSE-ConnectionGUID: 5U/YOYERQgiBtNWSnQuVEQ==
X-CSE-MsgGUID: JxrLtE9YTfC8523GHxshMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57372377"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="57372377"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 17:20:32 -0800
X-CSE-ConnectionGUID: TbR4B7l9TXibYOCWvAcjXA==
X-CSE-MsgGUID: Th3Rct0mQSWReV53OJzTdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112428541"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2025 17:20:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti1QS-0014w2-1D;
	Wed, 12 Feb 2025 01:20:28 +0000
Date: Wed, 12 Feb 2025 09:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:pmem-on-reserve-mem-fail 6/10]
 kernel/trace/trace.c:6027:38: error: incomplete definition of type 'struct
 module'
Message-ID: <202502120954.IwPOQJzd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git pmem-on-reserve-mem-fail
head:   d877ee1b587be39c141df16a6f92efb0e90b30fd
commit: 2619aa2c2e2767ba8b87e26deac031e4f44d49cc [6/10] tracing: Have persistent trace instances save module addresses
config: x86_64-buildonly-randconfig-003-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120954.IwPOQJzd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120954.IwPOQJzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120954.IwPOQJzd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:6027:38: error: incomplete definition of type 'struct module'
    6027 |         entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
         |                                          ~~~^
   include/linux/printk.h:394:8: note: forward declaration of 'struct module'
     394 | struct module;
         |        ^
>> kernel/trace/trace.c:6027:44: error: use of undeclared identifier 'MOD_TEXT'
    6027 |         entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
         |                                                   ^
   kernel/trace/trace.c:6028:30: error: incomplete definition of type 'struct module'
    6028 |         strscpy(entry->mod_name, mod->name);
         |                                  ~~~^
   include/linux/string.h:114:55: note: expanded from macro 'strscpy'
     114 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                                                              ^~~
   include/linux/string.h:80:21: note: expanded from macro '__strscpy0'
      80 |         sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) +    \
         |                            ^~~
   include/linux/printk.h:394:8: note: forward declaration of 'struct module'
     394 | struct module;
         |        ^
   3 errors generated.


vim +6027 kernel/trace/trace.c

  6007	
  6008	static int save_mod(struct module *mod, void *data)
  6009	{
  6010		struct trace_array *tr = data;
  6011		struct trace_scratch *tscratch;
  6012		struct trace_mod_entry *entry;
  6013		unsigned int size;
  6014	
  6015		tscratch = tr->scratch;
  6016		if (!tscratch)
  6017			return -1;
  6018		size = tr->scratch_size;
  6019	
  6020		if (struct_size(tscratch, entries, tscratch->nr_entries + 1) > size)
  6021			return -1;
  6022	
  6023		entry = &tscratch->entries[tscratch->nr_entries];
  6024	
  6025		tscratch->nr_entries++;
  6026	
> 6027		entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
  6028		strscpy(entry->mod_name, mod->name);
  6029	
  6030		return 0;
  6031	}
  6032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

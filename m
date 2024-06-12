Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5860316EC1B;
	Wed, 12 Jun 2024 11:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718190590; cv=none; b=V8s+GmemwDrcp0fp71bVLEgz5UnKf/bDNplXcj3b6NvpbnEpOLpl5ZqS4YH6nPZVCc0RxUzE88jkT/KhJgD1pJxHPApXdwDASxxym8voN5usEkPYT6RdGdmNuwqVvyG4Mq05CHvgPkQe1SNUCIfZY82Mk0MRUIGewgPTwRU7ZwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718190590; c=relaxed/simple;
	bh=dVwQhRZncdbCz1mPIMPq63+uoub1yS6pwN7KvWwRksk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unZUBkJ3654Vz5HCfESDpuGVfogzFGirtwF5qsKVQolFA9n2tDssK/8rg8vT9W5kISJBTuar6apGdZyki1yD1mDHzrEOoqvCskDxk36cz0qvGrnXUHpIEkN7uIs84bOlEniMbkb904jwmMWGimUpJ6cem2J+cSDORE7kxD/u2BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgiuSoIr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgiuSoIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718190588; x=1749726588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVwQhRZncdbCz1mPIMPq63+uoub1yS6pwN7KvWwRksk=;
  b=YgiuSoIrMjWnKA96tVfa1vyyA4/5vUCDGB/B1KEwDj1rnfMy4NCi2//c
   miG/yfOJepICI1uu/FMZaC0oqR/SOdxsl9pwc0RNnzN8xtm8e5tOypcls
   0r5vctAYNShG93CwJBfprTyLvMXy9cZzwUpSvV9MFlAYRMfLUASTCOHPW
   mMDNfjSur5VWYhzvP9j2PaBay4xLv7otKgtO3W8V8W3L6ceuW3MAkLATo
   L6X94+75wUjmugSyuzSq7KKTKfoR96czXLH94A2hS2Y1UaSRIlM96vLwz
   yyPM7CKfE3IIEP7DOXY4BGylwUV0EYltkV+wzGwPNGDO7aI/HAJhr8ckw
   w==;
X-CSE-ConnectionGUID: NYafXeOcTWeoedqmqT5phw==
X-CSE-MsgGUID: szl3wdnBRNyw3exZoOMd6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14670206"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="14670206"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 04:09:47 -0700
X-CSE-ConnectionGUID: f7+RFQMnQtOSxsa2WGHZGQ==
X-CSE-MsgGUID: xTNzlCuTQ2u8Qt9GBvjWDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="44672954"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2024 04:09:46 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHLrM-0001Tq-1J;
	Wed, 12 Jun 2024 11:09:44 +0000
Date: Wed, 12 Jun 2024 19:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trace:ring-buffer/core 4/13] kernel/trace/trace.c:9223:7: error: no
 member named 'mapped' in 'struct trace_array'
Message-ID: <202406122139.4xJvw4xX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/core
head:   640e052ba42d577a7f57052dbee714cf470dd145
commit: 2d92e3b77ffb2126371f522471f42720c40fe4e8 [4/13] tracing: Implement creating an instance based on a given memory region
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240612/202406122139.4xJvw4xX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406122139.4xJvw4xX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406122139.4xJvw4xX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:9223:7: error: no member named 'mapped' in 'struct trace_array'
    9223 |                 tr->mapped++;
         |                 ~~  ^
   1 error generated.


vim +9223 kernel/trace/trace.c

  9205	
  9206	static int
  9207	allocate_trace_buffer(struct trace_array *tr, struct array_buffer *buf, int size)
  9208	{
  9209		enum ring_buffer_flags rb_flags;
  9210	
  9211		rb_flags = tr->trace_flags & TRACE_ITER_OVERWRITE ? RB_FL_OVERWRITE : 0;
  9212	
  9213		buf->tr = tr;
  9214	
  9215		if (tr->range_addr_start && tr->range_addr_size) {
  9216			buf->buffer = ring_buffer_alloc_range(size, rb_flags, 0,
  9217							      tr->range_addr_start,
  9218							      tr->range_addr_size);
  9219			/*
  9220			 * This is basically the same as a mapped buffer,
  9221			 * with the same restrictions.
  9222			 */
> 9223			tr->mapped++;
  9224		} else {
  9225			buf->buffer = ring_buffer_alloc(size, rb_flags);
  9226		}
  9227		if (!buf->buffer)
  9228			return -ENOMEM;
  9229	
  9230		buf->data = alloc_percpu(struct trace_array_cpu);
  9231		if (!buf->data) {
  9232			ring_buffer_free(buf->buffer);
  9233			buf->buffer = NULL;
  9234			return -ENOMEM;
  9235		}
  9236	
  9237		/* Allocate the first page for all buffers */
  9238		set_buffer_entries(&tr->array_buffer,
  9239				   ring_buffer_size(tr->array_buffer.buffer, 0));
  9240	
  9241		return 0;
  9242	}
  9243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

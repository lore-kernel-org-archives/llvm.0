Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165822A1C9;
	Thu, 11 Apr 2024 04:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712810170; cv=none; b=mnSCxDARBJOYfEkZFUoSB+0FYvvVLK311u0zrjESTiPpHTTih33lRDhUbzfeEwtpE6shOS+rXQXlqlEEpbQ20+ufbkEfIzd1559avx6GE0ZuMiPfWDfrKh3IylMWwdWYt3+gm6liZ1d19+jm+02GJs+5gLFqBD5SfKKpq5KcTyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712810170; c=relaxed/simple;
	bh=xlxwn0mN35IdD+EG7uQmzcH8Y0ITPeI8ezIKPrkUQLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvgLQG67+b/BFECNMN9SZXe0GArI+JiWHutzbIoyChZ8Gn/lt6fDflgHE7KnAK9JHI1YSXnJecdKP7mJXteVOgarhSbDYx1slhl7tsE2jGpfd+kZK/BnfLpF4rgNf0x52o95Iy962lXFf4nKn8ALzaMFCIV6S/VBMjBF4bY8PXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTRe7fUH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTRe7fUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712810169; x=1744346169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xlxwn0mN35IdD+EG7uQmzcH8Y0ITPeI8ezIKPrkUQLg=;
  b=cTRe7fUHG1rDgZqUGVAoW3KqUWAsqV0s5olNy+gz7oapnGw8sohsiplm
   xxNRahxh1nFwYHaNgLlHtJH92tiukR3sg2fu9NFccgWkjS2FrmMTb/h0T
   orRGYBCcLWy0mxBrXhb3+NRJeUly/MVGR/PQX5xhLXvlYEX20R9PGvLR+
   p6+oDG6jy7TJc4+Bb2UUbdfMVU42TlOBcu0FEiThH7Z0PtptvXSDn0mlK
   w1GZgJe5WSw6CximtSr3Ln+Yxk1M56JX8FQU06tkjz+BpceZthzBrM5AY
   La/MG5yUZi6SeHfsCbpbA6qqoaagm/CSH52ofdA3VLldYtQ3BBLFnmHtj
   g==;
X-CSE-ConnectionGUID: p9jxc6iuTHW80q/2JB2smg==
X-CSE-MsgGUID: xUzESwxjSsiqlnEusp+BhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18913195"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="18913195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 21:36:07 -0700
X-CSE-ConnectionGUID: W/LD+1OhSq6CvUHc/DhRzA==
X-CSE-MsgGUID: 1YPQ6+YhTDaQ2n+QY0oRoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20783080"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Apr 2024 21:36:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rumAN-0008Dm-2H;
	Thu, 11 Apr 2024 04:36:03 +0000
Date: Thu, 11 Apr 2024 12:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/ring-buffer-prealloc 17/19]
 kernel/trace/trace.c:6046:11: error: no member named 'text_delta' in 'struct
 trace_array'
Message-ID: <202404111252.7x2Al4tf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/ring-buffer-prealloc
head:   26231feef0abf43a00e0ea834d7e0df0c017be2f
commit: 07bdbc98d5602bb910541fdd75e9756296641e69 [17/19] tracing/ring-buffer: Add last_boot_info file to boot instance
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111252.7x2Al4tf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111252.7x2Al4tf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111252.7x2Al4tf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:6046:11: error: no member named 'text_delta' in 'struct trace_array'
           if (!tr->text_delta && !tr->data_delta)
                ~~  ^
>> kernel/trace/trace.c:6046:30: error: no member named 'data_delta' in 'struct trace_array'
           if (!tr->text_delta && !tr->data_delta)
                                   ~~  ^
   kernel/trace/trace.c:6053:6: error: no member named 'text_delta' in 'struct trace_array'
           tr->text_delta = 0;
           ~~  ^
   kernel/trace/trace.c:6054:6: error: no member named 'data_delta' in 'struct trace_array'
           tr->data_delta = 0;
           ~~  ^
   kernel/trace/trace.c:6889:49: error: no member named 'text_delta' in 'struct trace_array'
           seq_buf_printf(&seq, "text delta:\t%ld\n", tr->text_delta);
                                                      ~~  ^
   kernel/trace/trace.c:6890:49: error: no member named 'data_delta' in 'struct trace_array'
           seq_buf_printf(&seq, "data delta:\t%ld\n", tr->data_delta);
                                                      ~~  ^
   kernel/trace/trace.c:8742:10: error: no member named 'range_addr_start' in 'struct trace_array'
           if (tr->range_addr_start)
               ~~  ^
   kernel/trace/trace.c:9289:10: error: no member named 'range_addr_start' in 'struct trace_array'
           if (tr->range_addr_start && tr->range_addr_size) {
               ~~  ^
   kernel/trace/trace.c:9289:34: error: no member named 'range_addr_size' in 'struct trace_array'
           if (tr->range_addr_start && tr->range_addr_size) {
                                       ~~  ^
   kernel/trace/trace.c:9291:17: error: no member named 'range_addr_start' in 'struct trace_array'
                                                         tr->range_addr_start,
                                                         ~~  ^
   include/linux/ring_buffer.h:119:55: note: expanded from macro 'ring_buffer_alloc_range'
           __ring_buffer_alloc_range((size), (flags), (order), (start),    \
                                                                ^~~~~
   kernel/trace/trace.c:9292:17: error: no member named 'range_addr_size' in 'struct trace_array'
                                                         tr->range_addr_size);
                                                         ~~  ^
   include/linux/ring_buffer.h:120:8: note: expanded from macro 'ring_buffer_alloc_range'
                                     (range_size), &__key);                \
                                      ^~~~~~~~~~
   kernel/trace/trace.c:9295:15: error: no member named 'text_delta' in 'struct trace_array'
                                               &tr->text_delta, &tr->data_delta);
                                                ~~  ^
   kernel/trace/trace.c:9295:32: error: no member named 'data_delta' in 'struct trace_array'
                                               &tr->text_delta, &tr->data_delta);
                                                                 ~~  ^
   kernel/trace/trace.c:9300:7: error: no member named 'mapped' in 'struct trace_array'
                   tr->mapped++;
                   ~~  ^
   kernel/trace/trace.c:9473:6: error: no member named 'range_addr_start' in 'struct trace_array'
           tr->range_addr_start = range_addr_start;
           ~~  ^
   kernel/trace/trace.c:9474:6: error: no member named 'range_addr_size' in 'struct trace_array'
           tr->range_addr_size = range_addr_size;
           ~~  ^
   16 errors generated.


vim +6046 kernel/trace/trace.c

  6043	
  6044	static void update_last_data(struct trace_array *tr)
  6045	{
> 6046		if (!tr->text_delta && !tr->data_delta)
  6047			return;
  6048	
  6049		/* Clear old data */
  6050		tracing_reset_online_cpus(&tr->array_buffer);
  6051	
  6052		/* Using current data now */
  6053		tr->text_delta = 0;
  6054		tr->data_delta = 0;
  6055	}
  6056	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

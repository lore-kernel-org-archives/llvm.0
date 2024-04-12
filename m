Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02802168A8;
	Fri, 12 Apr 2024 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712904337; cv=none; b=YZSnWSSOGuLS62lQ5+9DX4xjKwRIdHvxAHr4M1GW5FgFDD7QojX4RVP0rK+XKxnmTtJPlYto/cM9BRcVmqvR4fNQutKLNYTRuTQjR1tIMAgRCEez/6g8PotXMGHh5EJXV7xWqZ4BbAnvJaEHGbKoCXb0Zcz9hl8GakbiMIwp6Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712904337; c=relaxed/simple;
	bh=w5b1K4T4TeAJp7SucOFzSkJXAoBEsqNvkBoJWsvKgJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5+ChJbnXLgZokOe6CsT1KqljWEVWQQDLecj/vl9nwWfyI2h4Q0QYhZacCbmGtu6tZb3tDwpUBGAt/i1pW1XraXRyItyRExjObkeM2CwINqqj3QocVZ31/AWFK4A82+NtJo479EMzo86bwHPu6oMwVIWo8JzR0k5Ee+1752Wu1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JAQDeKjf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JAQDeKjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712904336; x=1744440336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w5b1K4T4TeAJp7SucOFzSkJXAoBEsqNvkBoJWsvKgJc=;
  b=JAQDeKjfgjvyGx4sAQYpP7ftylYo+BPcoGsSzN2af/gpo6w3pyeA1L0H
   Ykh3ozGBtQBbRsLcN575DF6RHkxLT7e6U+VE7AcWew7Ow3WQoq6WUdZvA
   p6282DcoWyuTpf1JFivU/SSPm+V8p3bhijmx1kJiBH0GEeQOfK+YiQkqN
   50Uo0IeD6a24u39dir/E0Tx/6vl24aXe8/2CMDQvN24sG+Hwum06xq8IU
   NevcWmw11rSPHy/FQMKGvv73USA1z0hxDQD++TvQFH52DJBUpsvGff4Qy
   g9pCC+0w3UGhPhP7Z7LxbGXL8UfUPiJrETWo4kH7kZRn+fRe/688d5F8P
   w==;
X-CSE-ConnectionGUID: 1tZMwg+kRH69+L13PTZh0A==
X-CSE-MsgGUID: pa6PShRbTQ2Osge7qMMbKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8208399"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8208399"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 23:45:35 -0700
X-CSE-ConnectionGUID: PgA292J/TgSrnhmQMnjo2w==
X-CSE-MsgGUID: sdEfkTiFS6aSwLDRKWMjdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="21192681"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Apr 2024 23:45:34 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvAfE-0009TZ-0Z;
	Fri, 12 Apr 2024 06:45:32 +0000
Date: Fri, 12 Apr 2024 14:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/ring-buffer-prealloc 10/19]
 kernel/trace/trace.c:9232:7: error: no member named 'mapped' in 'struct
 trace_array'
Message-ID: <202404121449.cWBVQwWQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/ring-buffer-prealloc
head:   d4c3c7bd4fdb604bffd9043272c8e7a373ccb635
commit: 0e409f3ab09f086ec49215b9f3b2c49588e5b6b5 [10/19] tracing: Implement creating an instance based on a given memory region
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240412/202404121449.cWBVQwWQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121449.cWBVQwWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121449.cWBVQwWQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:9232:7: error: no member named 'mapped' in 'struct trace_array'
    9232 |                 tr->mapped++;
         |                 ~~  ^
   1 error generated.


vim +9232 kernel/trace/trace.c

  9214	
  9215	static int
  9216	allocate_trace_buffer(struct trace_array *tr, struct array_buffer *buf, int size)
  9217	{
  9218		enum ring_buffer_flags rb_flags;
  9219	
  9220		rb_flags = tr->trace_flags & TRACE_ITER_OVERWRITE ? RB_FL_OVERWRITE : 0;
  9221	
  9222		buf->tr = tr;
  9223	
  9224		if (tr->range_addr_start && tr->range_addr_size) {
  9225			buf->buffer = ring_buffer_alloc_range(size, rb_flags, 0,
  9226							      tr->range_addr_start,
  9227							      tr->range_addr_size);
  9228			/*
  9229			 * This is basically the same as a mapped buffer,
  9230			 * with the same restrictions.
  9231			 */
> 9232			tr->mapped++;
  9233		} else {
  9234			buf->buffer = ring_buffer_alloc(size, rb_flags);
  9235		}
  9236		if (!buf->buffer)
  9237			return -ENOMEM;
  9238	
  9239		buf->data = alloc_percpu(struct trace_array_cpu);
  9240		if (!buf->data) {
  9241			ring_buffer_free(buf->buffer);
  9242			buf->buffer = NULL;
  9243			return -ENOMEM;
  9244		}
  9245	
  9246		/* Allocate the first page for all buffers */
  9247		set_buffer_entries(&tr->array_buffer,
  9248				   ring_buffer_size(tr->array_buffer.buffer, 0));
  9249	
  9250		return 0;
  9251	}
  9252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

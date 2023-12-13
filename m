Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A1EC8E7;
	Wed, 13 Dec 2023 06:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOSWMkg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702449526; x=1733985526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rUEmHFlk0kFUdPoiOVV5DamsPmtNx/DjaXS8UdBouoY=;
  b=kOSWMkg5cSwXXJrd9wPaU3IdCry+uYGPHwG17dXf6wQIyjR9vmc+W1oa
   3FSfRiy39dnqw3NsMxe9Nueh+WbSFsf2MwWoUZXAEjM70nJFCPPYY5h5q
   MIZw5zmjm5Eg7umM7xWG53uSAn4KeOplDNWNS5f8tMdtcb6Mm6URI24Lt
   ZNh8Mr9mCWBKcPpfFpTZj9DY7Fu2ZbWpIuzMnsh1wZNm2tF6P+T1FXTN+
   hUr+V2MynFTi8fANj5H+Z10M8QpVLLKPJ60AJzzow1Gejl/J81BQZczIy
   J9dNxbI+sOkQAhql4tH5lwIWHzDXk8qFzMn2MvHYbFrA9uxMQ90UURnMg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="374426495"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="374426495"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 22:38:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="839741420"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="839741420"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Dec 2023 22:38:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDItG-000KAt-14;
	Wed, 13 Dec 2023 06:38:42 +0000
Date: Wed, 13 Dec 2023 14:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [trace:ring-buffer-multi-page-subbufers 30/31]
 kernel/trace/trace.c:7385:40: warning: variable 'buffer' is uninitialized
 when used here
Message-ID: <202312131437.7Fi2rLZa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer-multi-page-subbufers
head:   cf9d2732932a8071635166afd4fd282889edc056
commit: 51ea7c0e6660f763f8bc81abe1ad737594d0f88d [30/31] tracing: Increase size of trace_marker_raw to max ring buffer entry
config: arm-randconfig-001-20231213 (https://download.01.org/0day-ci/archive/20231213/202312131437.7Fi2rLZa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131437.7Fi2rLZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131437.7Fi2rLZa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace.c:7385:40: warning: variable 'buffer' is uninitialized when used here [-Wuninitialized]
    7385 |         if (size > ring_buffer_max_event_size(buffer))
         |                                               ^~~~~~
   kernel/trace/trace.c:7363:29: note: initialize the variable 'buffer' to silence this warning
    7363 |         struct trace_buffer *buffer;
         |                                    ^
         |                                     = NULL
   In file included from kernel/trace/trace.c:8929:
   kernel/trace/trace_selftest.c:605:6: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     605 |         int len;
         |             ^
   2 warnings generated.


vim +/buffer +7385 kernel/trace/trace.c

  7370	
  7371		if (tracing_disabled)
  7372			return -EINVAL;
  7373	
  7374		if (!(tr->trace_flags & TRACE_ITER_MARKERS))
  7375			return -EINVAL;
  7376	
  7377		/* The marker must at least have a tag id */
  7378		if (cnt < sizeof(unsigned int))
  7379			return -EINVAL;
  7380	
  7381		size = sizeof(*entry) + cnt;
  7382		if (cnt < FAULT_SIZE_ID)
  7383			size += FAULT_SIZE_ID - cnt;
  7384	
> 7385		if (size > ring_buffer_max_event_size(buffer))
  7386			return -EINVAL;
  7387	
  7388		buffer = tr->array_buffer.buffer;
  7389		event = __trace_buffer_lock_reserve(buffer, TRACE_RAW_DATA, size,
  7390						    tracing_gen_ctx());
  7391		if (!event)
  7392			/* Ring buffer disabled, return as if not open for write */
  7393			return -EBADF;
  7394	
  7395		entry = ring_buffer_event_data(event);
  7396	
  7397		len = __copy_from_user_inatomic(&entry->id, ubuf, cnt);
  7398		if (len) {
  7399			entry->id = -1;
  7400			memcpy(&entry->buf, FAULTED_STR, FAULTED_SIZE);
  7401			written = -EFAULT;
  7402		} else
  7403			written = cnt;
  7404	
  7405		__buffer_unlock_commit(buffer, event);
  7406	
  7407		return written;
  7408	}
  7409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504A36F316;
	Thu, 30 May 2024 22:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717107293; cv=none; b=poTw5f5suVfdtxYEc3beCHKEHaxCujsB8t/xGC9iW5Ts62S/R8kOIV+WAtByHtXldDBJwXtroHl4TbiLu/0cTRYlDGslHOQzt/pkhChMuDKfsM9LZpUYJX2NJOu2mcggQRNqIZLxER96XUSfFJPStsbj5nKRqiiRKbG3MFQeL7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717107293; c=relaxed/simple;
	bh=szn7aSVUM6e8HtoVb4OJrxdGsHt+Bf7QCvWNbJP7jlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ARpmXZs/CFUOU6tr/msehR4redtdQZpogT9H3gOlmuj1DLFtHA+IpXETNkuyUrFtT+RDHjosAZ9rzmt07yZsicdPa5749ykQURH9HP/JTAuz2xn25mEqHcDj+TgATHsbzdgl+XFK9gEdgcCVIwzbmyqecZsnzDitR74qYuExxXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4IAigNs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4IAigNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717107291; x=1748643291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=szn7aSVUM6e8HtoVb4OJrxdGsHt+Bf7QCvWNbJP7jlE=;
  b=l4IAigNsUEpLq8QAo0WNqbS5mrl7DvJuarkrMILCKKMmSrTegGu7bp35
   ZjraRiP9M/DR7+OC70zD9vO7VwZ396NsDrmF7YI7PZJEQh+qXvZLPcSZa
   bM7bULo15/wpRGeqmkm1wjfsVUPzESMtm/E+TGbPnFBAxUWn+hbtAkwEx
   iAjrDmBwvJ8F+C1oRVCAgSL7Nmsdwpq9WRo1N9ZC5YhnzITYSavl9aDmj
   snmZurysyK5VVpa+qezj2dhrEnrmkC7eH00ZJx2Zf0XyXPgmwsK2kY2Sc
   Nq5g+qHXB2HrpqFMQarQaWXSuzt6KiuUY9gp6EGb1LUioIw+5y4gxFic5
   A==;
X-CSE-ConnectionGUID: Ea0u3UITTk+aLTyTvAj+hA==
X-CSE-MsgGUID: oac1ReacQgmTCqnTk1F0bQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31124755"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="31124755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 15:14:51 -0700
X-CSE-ConnectionGUID: FQWZ9OKpThmHlFLQrn0org==
X-CSE-MsgGUID: ZGPmZ1eIRWWY4paNBDOrMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="41025991"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 May 2024 15:14:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCo2p-000G3T-07;
	Thu, 30 May 2024 22:14:47 +0000
Date: Fri, 31 May 2024 06:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 90/93]
 fs/bcachefs/thread_with_file.c:375:2: warning: label followed by a
 declaration is a C23 extension
Message-ID: <202405310602.WxfwdaAA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ce6297d0475422fa2de0db1d4f955633ba70d031
commit: 21091985987e4fcc4580030d896ac35906041d22 [90/93] bcachefs: bch2_stdio_redirect_readline_timeout()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240531/202405310602.WxfwdaAA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310602.WxfwdaAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310602.WxfwdaAA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/thread_with_file.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/thread_with_file.c:375:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     375 |         unsigned long t = timeout != MAX_SCHEDULE_TIMEOUT
         |         ^
   6 warnings generated.


vim +375 fs/bcachefs/thread_with_file.c

   366	
   367	int bch2_stdio_redirect_readline_timeout(struct stdio_redirect *stdio,
   368						 darray_char *line,
   369						 unsigned long timeout)
   370	{
   371		unsigned long until = jiffies + timeout;
   372		struct stdio_buf *buf = &stdio->input;
   373		size_t seen = 0;
   374	again:
 > 375		unsigned long t = timeout != MAX_SCHEDULE_TIMEOUT
   376			? max_t(long, until - jiffies, 0)
   377			: timeout;
   378	
   379		t = min(t, sysctl_hung_task_timeout_secs * HZ / 2);
   380	
   381		wait_event_timeout(buf->wait, stdio_redirect_has_more_input(stdio, seen), t);
   382	
   383		if (stdio->done)
   384			return -1;
   385	
   386		spin_lock(&buf->lock);
   387		seen = buf->buf.nr;
   388		char *n = memchr(buf->buf.data, '\n', seen);
   389	
   390		if (!n && timeout != MAX_SCHEDULE_TIMEOUT && jiffies >= until) {
   391			spin_unlock(&buf->lock);
   392			return -ETIME;
   393		}
   394	
   395		if (!n) {
   396			buf->waiting_for_line = true;
   397			spin_unlock(&buf->lock);
   398			goto again;
   399		}
   400	
   401		size_t b = n + 1 - buf->buf.data;
   402		if (b > line->size) {
   403			spin_unlock(&buf->lock);
   404			int ret = darray_resize(line, b);
   405			if (ret)
   406				return ret;
   407			seen = 0;
   408			goto again;
   409		}
   410	
   411		buf->buf.nr -= b;
   412		memcpy(line->data, buf->buf.data, b);
   413		memmove(buf->buf.data,
   414			buf->buf.data + b,
   415			buf->buf.nr);
   416		line->nr = b;
   417	
   418		buf->waiting_for_line = false;
   419		spin_unlock(&buf->lock);
   420	
   421		wake_up(&buf->wait);
   422		return 0;
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

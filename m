Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF42340286;
	Sun, 31 May 2026 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780265241; cv=none; b=uQx5oRY9cc2izLpNTp1yX0hPBzjvf33CGmOjGOg123wrLRSKgCt6fNLQmo0C9u3FD3wW63yJeilXcnDGj4Shr/lF1EZRqVqMYGi5Ivg6Iec29WVt29FoQrP5ArEAcj+RhoZ1nv/VQIdnhZ7pGRQxY7XHxohArjHnWrQi3EDHWJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780265241; c=relaxed/simple;
	bh=OC1tIHIWUROzbHD1lUZmdBMrG+oesiCUnmWJURbLs1U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fraSskGpNp6AopvjYX/2qDkLxNIu1zQsAbInN0V3t55QEDUd9pXpMYL8xIy3zs1BhpdHp8Bl3WaQfKj7rvXl5rtb+FAzEN1ThjvS0U3/GVKktHxNR/RFDO/P6uq7W2tKnooTYgNUdd/EIhcIiDtZ/NJjfmpnlsycAboagNgvUD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNhmKpQZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNhmKpQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780265239; x=1811801239;
  h=date:from:to:cc:subject:message-id;
  bh=OC1tIHIWUROzbHD1lUZmdBMrG+oesiCUnmWJURbLs1U=;
  b=YNhmKpQZAIeLy+5UG1WCATMGwPn7yexF4ssjTaqoymoBjPdRLtwHwWG4
   m4WbSXWSlpd4fGzjhW8HGwg6R/z1wtYTpLZ+7cVhh6r7bvbzD7G/QhzHW
   hO5T3jSyoSi4DePtxY5VMu/ckKzpvWeInayenGGxSyNnUbb93UlegxUMd
   TQAoq+uvUFC5e4/r5qOUMxjGkaDlh1IHlDasscZI3OLSzbezei6mDVBZq
   VgKhSlgpdKncWnkmqyq9RldwpghTMj6JlrQm+v6t+d9M4pE090UYysN5t
   f016AUwbqX7/yxbyY2uMJoTz5U6JLfhXDv2/4HdWwjQA/wStReY7THlU7
   w==;
X-CSE-ConnectionGUID: tuzvfp5oT16AXgMqLNAZFw==
X-CSE-MsgGUID: ntoL6BcRRIe3SZYP/CcIwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80755050"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="80755050"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 15:07:19 -0700
X-CSE-ConnectionGUID: RxyWV6MCSP6WnVHXv+og5w==
X-CSE-MsgGUID: CSkhTnxdS6uNrJH7fnaJjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="243491624"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 May 2026 15:07:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wToJO-000000009n2-3Msc;
	Sun, 31 May 2026 22:07:14 +0000
Date: Mon, 01 Jun 2026 06:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Crystal Wood <crwood@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Steven Rostedt <rostedt@goodmis.org>
Subject: [trace:latency/for-next 2/2]
 kernel/trace/trace_osnoise.c:96:44: warning: diagnostic behavior may be
 improved by adding the 'format(printf, 1, 2)' attribute to the declaration of
 'osnoise_print'
Message-ID: <202606010552.jzJfWIjv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace latency/for-next
head:   9cb99c598643ba78638dfd668cf020544159cf70
commit: 9cb99c598643ba78638dfd668cf020544159cf70 [2/2] tracing/osnoise: Array printk init and cleanup
config: powerpc64-randconfig-001-20260531 (https://download.01.org/0day-ci/archive/20260601/202606010552.jzJfWIjv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606010552.jzJfWIjv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606010552.jzJfWIjv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_osnoise.c:96:44: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 2)' attribute to the declaration of 'osnoise_print' [-Wmissing-format-attribute]
      86 | static void osnoise_print(const char *fmt, ...)
         | __attribute__((format(printf, 1, 2))) 
      87 | {
      88 |         struct osnoise_instance *inst;
      89 |         struct trace_array *tr;
      90 |         va_list ap;
      91 | 
      92 |         rcu_read_lock();
      93 |         list_for_each_entry_rcu(inst, &osnoise_instances, list) {
      94 |                 tr = inst->tr;
      95 |                 va_start(ap, fmt);
      96 |                 trace_array_vprintk(tr, _RET_IP_, fmt, ap);
         |                                                          ^
   kernel/trace/trace_osnoise.c:86:13: note: 'osnoise_print' declared here
      86 | static void osnoise_print(const char *fmt, ...)
         |             ^
   1 warning generated.


vim +96 kernel/trace/trace_osnoise.c

    85	
    86	static void osnoise_print(const char *fmt, ...)
    87	{
    88		struct osnoise_instance *inst;
    89		struct trace_array *tr;
    90		va_list ap;
    91	
    92		rcu_read_lock();
    93		list_for_each_entry_rcu(inst, &osnoise_instances, list) {
    94			tr = inst->tr;
    95			va_start(ap, fmt);
  > 96			trace_array_vprintk(tr, _RET_IP_, fmt, ap);
    97			va_end(ap);
    98		}
    99		rcu_read_unlock();
   100	}
   101	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

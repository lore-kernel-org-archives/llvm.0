Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F62E57F;
	Thu, 11 Apr 2024 06:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712815933; cv=none; b=CDHxJkDezkPCcq+rpJ3AESwcDJqqmwBsSIapzILZ6200JRvJCFGlgXnLcgFRzrfeUwDLBKqpwywz8QS5cdX0BHoQrQce77qfZaSXa7ugxR19Ry6MQX5h1+zGK33A7Tam0t63uWJexzinZRrxqCwvQc7lwMWstoG9Zq93T1V7Y4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712815933; c=relaxed/simple;
	bh=nngKxV9PZECYLbABSBmTJSKa3HScA9wsohuz9Yru0v4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oNVE3cnxtGy4llMwlPRNRiGetozVAK7TFtI8VdYAfoPKKl1ZDWk3fhdk4YkV+OGB2hAfgkY2YVxl6D9rCurzFs7sZjTZ/kvU93jgsYdnUyaodub9B4vlPxcZ0Gdmj7Pk0/rsB45s1EnQzLOkbARq6z/539jOlxbTXB322Pss2fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ReSx3hv9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ReSx3hv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712815932; x=1744351932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nngKxV9PZECYLbABSBmTJSKa3HScA9wsohuz9Yru0v4=;
  b=ReSx3hv908pTw8BFhZJgfk7CZj8lDFuMORGzxwiGoRkELbhEqycUQjrO
   YRGZattVIPHUhxQI4EYZFl+srunvX7mXOHwPubkbwoDGvPMPVhIgeYSoC
   OyX02FpiU+78pGHdlVSi2avciPIBJNwnZ8wBujhm8GvoYMHtB3KcfZ2MI
   VyZzM2uCP1U9CS797oOe2iJTiwPD2ME4NXr6hGU5Fg5YVacEYGO6kiHRq
   zbQplfQUVtfilTB0MvW7iLeftCRCju2+Urvbh+aVf2KJwNKeHQMqOhc36
   rKRkpUQC5PQnbMm+ooJRI5RV2GbsZFdEihJV4IJb2GYGn7nsL70OvcDUo
   A==;
X-CSE-ConnectionGUID: QLfS+0bzTBGmkrIJev5R4g==
X-CSE-MsgGUID: eFYLlwIcSz+tWcVoEkIMig==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11169827"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="11169827"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 23:12:11 -0700
X-CSE-ConnectionGUID: eEQAKC54Q1q3thvh5+yUGQ==
X-CSE-MsgGUID: gSjypHKNSFaJ6F/M7vCRDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="21389997"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Apr 2024 23:12:09 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1runfK-0008Hh-1U;
	Thu, 11 Apr 2024 06:12:06 +0000
Date: Thu, 11 Apr 2024 14:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/ring-buffer-prealloc 19/19]
 kernel/trace/trace_output.c:1015:59: error: no member named 'text_delta' in
 'struct trace_array'
Message-ID: <202404111406.nb8xGWMw-lkp@intel.com>
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
commit: 26231feef0abf43a00e0ea834d7e0df0c017be2f [19/19] tracing: Update function tracing output for previous boot buffer
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111406.nb8xGWMw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111406.nb8xGWMw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111406.nb8xGWMw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_output.c:1015:59: error: no member named 'text_delta' in 'struct trace_array'
           print_fn_trace(s, field->ip, field->parent_ip, iter->tr->text_delta, flags);
                                                          ~~~~~~~~  ^
   kernel/trace/trace_output.c:1680:59: error: no member named 'text_delta' in 'struct trace_array'
           print_fn_trace(s, field->ip, field->parent_ip, iter->tr->text_delta, flags);
                                                          ~~~~~~~~  ^
   2 errors generated.


vim +1015 kernel/trace/trace_output.c

  1005	
  1006	/* TRACE_FN */
  1007	static enum print_line_t trace_fn_trace(struct trace_iterator *iter, int flags,
  1008						struct trace_event *event)
  1009	{
  1010		struct ftrace_entry *field;
  1011		struct trace_seq *s = &iter->seq;
  1012	
  1013		trace_assign_type(field, iter->ent);
  1014	
> 1015		print_fn_trace(s, field->ip, field->parent_ip, iter->tr->text_delta, flags);
  1016		trace_seq_putc(s, '\n');
  1017	
  1018		return trace_handle_return(s);
  1019	}
  1020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

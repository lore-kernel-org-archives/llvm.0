Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D3FBE5E;
	Sun,  6 Jul 2025 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751833978; cv=none; b=j9S+HCzIDaHFaPVi/DjlqJTgraFRRp7m51YaiYHPP8NDe6B2EATRxf19g7cnkX009j8yQWStHK/KeHIqy+D9u7BV0DVElZUQmGLd5QwHq/wa9Lu6ByAHNa9LrK+oQuYggfLlvCnBxg6l5VHmDTn0rX5wwoDqm8OhOwalXQC4JYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751833978; c=relaxed/simple;
	bh=dkZtYtA/4Ntw00wf6mEXDz9syjqbhWznb9Hw7+E4on0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hc0gODxo1IWaRSxPZ2UKnQvtOoqFOxZz11ozA1QdP28TmzzCu75IMFCXa15/3/sJQQNaqz9PHwgqN0i5jTtPLTpf54hwBXINGt6hP1geW8BXaMFVkYFgvkar1KLQf54dqVpqhaB9Fs6oyGiEC/l3MhIo++t58/ZnZWj+kVAkcxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/FcFVRy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/FcFVRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751833977; x=1783369977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dkZtYtA/4Ntw00wf6mEXDz9syjqbhWznb9Hw7+E4on0=;
  b=h/FcFVRyWFZHybzunrMVhtYReCIGZU7x6Xhvok3/O5SLp/GUUS9PxCke
   ayQRcp3SH6dChx7wuDiFbdNt2fjUAt3QqFCadkR7HVJVucaSUxXMNVwtJ
   5EzlLuR3zt9ni5+Z1wgLr6npqAujR+BApiyczMP0Ets4EGwPUBxueWTp5
   /jhn/GxfP2I5HVBO/uF4ohIyRL7S6b+VaHll2quI/jsHAT44du2A6MXo6
   KNq0vaOpaNxxHuUR1/4POtMgS9TarW2fwQ77dtbe3BreLlKuJ7+P+es4y
   bKKyot3VV5Epg6JJFQToAJdqKIIY2lTxz8vMJhfJhOx8cy8khSyO9A7x+
   w==;
X-CSE-ConnectionGUID: 4kLteXCLS1WRuho8js8fAg==
X-CSE-MsgGUID: DeekjXMsQqyHH35kApq0tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53276388"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="53276388"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 13:32:56 -0700
X-CSE-ConnectionGUID: lB4j6yCLRROEuogtMAMRzA==
X-CSE-MsgGUID: pT3XFhDjSQm3ojkYOr6yVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="155794385"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jul 2025 13:32:55 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYW2f-0001aX-22;
	Sun, 06 Jul 2025 20:32:53 +0000
Date: Sun, 6 Jul 2025 22:32:51 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 6/10] Warning:
 kernel/trace/ftrace.c:5970 function parameter 'ip' not described in
 'register_ftrace_direct'
Message-ID: <202507062235.zu6xJNBr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   b288c6b15d20122d59ddf3bce2fb86afe6ed56c3
commit: 60f053ac0f246163e7330460f249edf54905e8cc [6/10] ftrace: Use direct hash interface in direct functions
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250706/202507062235.zu6xJNBr-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507062235.zu6xJNBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507062235.zu6xJNBr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/trace/ftrace.c:5970 function parameter 'ip' not described in 'register_ftrace_direct'
>> Warning: kernel/trace/ftrace.c:6001 function parameter 'ip' not described in 'unregister_ftrace_direct'
>> Warning: kernel/trace/ftrace.c:6033 function parameter 'ip' not described in 'modify_ftrace_direct'
>> Warning: kernel/trace/ftrace.c:6033 function parameter 'lock_direct_mutex' not described in 'modify_ftrace_direct'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

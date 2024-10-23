Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BF1CBEB5;
	Wed, 23 Oct 2024 21:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729718200; cv=none; b=SZANnl8XTETE7r0VWBoDf9xSjjfdzSkSwggJ4j7fWyG+d94Wv8U7xAQnZSirJ5f8uS/D1vd13rcO8vKINiXLy152tPN+0VMOuqFdHvCvsTeDjIMzJv0CNdZubZvn4LKmQgtvYFio0aboYzy5P30CkOoMO06Iq6QeB6EE/PkowTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729718200; c=relaxed/simple;
	bh=mUiZzCvxirDJcT72hPEWgai8ynZ0VyeKjFT6tlRLE+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PWxJmYH7NHp4Ius4mAM3B7ZXMZ6pSzSD4FT1CwVqDj+wPR/4fg3F3fg496tlg/gQXvapggF53nlaCnj/RQMfTdlRIfIZIRbRH58O5AwOxCN9uZ8s/mIajFsGICv7U9jjmuEaAsdqIdm1HU49jCYOyzICyr9j4wjO63o8HK1jO7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0J0BrDb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0J0BrDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729718198; x=1761254198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mUiZzCvxirDJcT72hPEWgai8ynZ0VyeKjFT6tlRLE+k=;
  b=h0J0BrDbtqBNJdpMVGoBsfwWSC/tOxJ7caCTs1X4QS665L43aW2Wis7r
   lftm2D/vBqEy+2f7svFhIDnAiXQiLpB0IJ71BZLUsvcym09MHyray3Pt6
   EoBlKuYTvT/HkaHZYcQkOiupSCD1U3nS5d41gMN7j1Ne00g/90Aogbhig
   9kpwexLCb8k5skI/Ws4bofEy5h4iJilNnUg+ns1j6nDoZ/PNBL2qGUD6r
   vpERGc2eCuNVoTVZu+RzhUtFLzvJqueEQKX6o4t+vrnuiEtCc5lJJGVbW
   wjHbGTYfdrwMw98qLvl5G8Jo2SB7hmW6uih8n769WNcBi+cxz+TRqUwnu
   Q==;
X-CSE-ConnectionGUID: lVEzcNWYT8uyQAw4OR/ztQ==
X-CSE-MsgGUID: JHrmHLjATriYfcWL5WV9+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33240805"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="33240805"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 14:16:36 -0700
X-CSE-ConnectionGUID: wGsTe4dYTfKEI5pzVWSc9w==
X-CSE-MsgGUID: rZDbEJSIQQu6AH6Y9kwujw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="85503273"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Oct 2024 14:15:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3ihE-000Va0-1O;
	Wed, 23 Oct 2024 21:15:12 +0000
Date: Thu, 24 Oct 2024 05:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [uml:next 29/44] arch/um/os-Linux/main.c:117:12: error: use of
 undeclared identifier 'PATH_MAX'
Message-ID: <202410240553.gYNIXN8i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
head:   3f17fed2149192c7d3b76a45a6a87b4ff22cd586
commit: 031acdcfb566ba18ffb57d51abf357a5e350424b [29/44] um: restore process name
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241024/202410240553.gYNIXN8i-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240553.gYNIXN8i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240553.gYNIXN8i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/um/os-Linux/main.c:117:12: error: use of undeclared identifier 'PATH_MAX'
     117 |                 char buf[PATH_MAX] = {};
         |                          ^
   1 error generated.


vim +/PATH_MAX +117 arch/um/os-Linux/main.c

   107	
   108	int __init main(int argc, char **argv, char **envp)
   109	{
   110		char **new_argv;
   111		int ret, i, err;
   112	
   113		/* Disable randomization and re-exec if it was changed successfully */
   114		ret = personality(PER_LINUX | ADDR_NO_RANDOMIZE);
   115		if (ret >= 0 && (ret & (PER_LINUX | ADDR_NO_RANDOMIZE)) !=
   116				 (PER_LINUX | ADDR_NO_RANDOMIZE)) {
 > 117			char buf[PATH_MAX] = {};
   118			ssize_t ret;
   119	
   120			ret = readlink("/proc/self/exe", buf, sizeof(buf));
   121			if (ret < 0 || ret >= sizeof(buf)) {
   122				perror("readlink failure");
   123				exit(1);
   124			}
   125			execve(buf, argv, envp);
   126		}
   127	
   128		set_stklim();
   129	
   130		setup_env_path();
   131	
   132		setsid();
   133	
   134		new_argv = malloc((argc + 1) * sizeof(char *));
   135		if (new_argv == NULL) {
   136			perror("Mallocing argv");
   137			exit(1);
   138		}
   139		for (i = 0; i < argc; i++) {
   140			new_argv[i] = strdup(argv[i]);
   141			if (new_argv[i] == NULL) {
   142				perror("Mallocing an arg");
   143				exit(1);
   144			}
   145		}
   146		new_argv[argc] = NULL;
   147	
   148		/*
   149		 * Allow these signals to bring down a UML if all other
   150		 * methods of control fail.
   151		 */
   152		install_fatal_handler(SIGINT);
   153		install_fatal_handler(SIGTERM);
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

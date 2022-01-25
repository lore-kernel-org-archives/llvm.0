Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ABF29CA
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643126167; x=1674662167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2IZ3rsmbTwIJnlaO8i+w9GZaDCe35ba9MOV8w1ksmx4=;
  b=PfMv6lFxHjn+LzoS+x2sAJO9l71VpmOTxn2Fepsl1+bY6WBPqeQamgti
   RWazNKYJOvcGba+OK8VqBtsIlsmFM7I68vbXzmXvfXjLQrHOg1xNm7g+v
   5ET4VjJiV2Pr4HbQK97apzENsDYhMsTTdwWF3EuHNkyQ3d5hDreZ2Jwra
   3FKpDlPOqlb+ei/eXNx8UsaZmKiwwdKl66KIQyz5jdWHvQloDG9sdYIKj
   Vpb3DUubPfeuM2E/Pmx3kTR73yS9iw0G160BdK817F9ZMvPjCXaq/jnz0
   tra02UEB1LcxX3qQpI4mLQGHyn/5y/M9574LDlI0dWOP+xKfZdAMhMms+
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="332686452"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="332686452"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 07:56:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="520429004"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Jan 2022 07:56:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCOAu-000K6p-Gl; Tue, 25 Jan 2022 15:56:04 +0000
Date: Tue, 25 Jan 2022 23:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1565/1734] warning: unsafe strcpy() usage lacked
 '__write_overflow' symbol in lib/test_fortify/write_overflow-strcpy.c
Message-ID: <202201252312.zdGESate-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d25ee88530253138d0b20d43511ca5acbda4e9f7
commit: 6303361147fc8984dd259b54c189592cd0551ab6 [1565/1734] fortify: Work around Clang inlining bugs
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20220125/202201252312.zdGESate-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e128e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6303361147fc8984dd259b54c189592cd0551ab6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6303361147fc8984dd259b54c189592cd0551ab6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> warning: unsafe strcpy() usage lacked '__write_overflow' symbol in lib/test_fortify/write_overflow-strcpy.c
--
>> warning: unsafe strlcpy() usage lacked '__write_overflow' symbol in lib/test_fortify/write_overflow-strlcpy.c
--
>> warning: unsafe strcpy() usage lacked '__write_overflow' symbol in lib/test_fortify/write_overflow-strcpy-lit.c
--
>> warning: unsafe strlcpy() usage lacked '__write_overflow' symbol in lib/test_fortify/write_overflow-strlcpy-src.c

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

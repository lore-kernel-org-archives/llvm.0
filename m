Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C91DDF8;
	Tue, 11 Jul 2023 17:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689096506; x=1720632506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/d0HxIZ3PqYXHvJfoHiZh9fSmQvLJlWQgHmgSMSGKo=;
  b=dCaEVIhqmdRqqZ5Hs009C84osAYoyfXt+8qXJcDE8TAT4hQ7Q7+IFJsk
   D4N5n7tAr64lMIIGQjsXiA20bBX5w3EwK7bJeNT1GXZ0oXBOqXkL9j5cS
   iaaRtoQJFz3xhZOfbFvv3iCk/TXVKizbt3fUqphjjORGjKo2rWfbx16wP
   26yF+/AOmyTfgvrB6VCGPAoUnpJp+Q11v9IUEdk5hN0O3rjWls/5CJuB8
   tALC8dpRg4AQeUGHkPEevac4OhIKAIuCeMa6GxFWZkt0u0194PI2iIM07
   Doa9FcVU/GBxxFGE0dVt4jVrSnzhrfL18zUkW0MgIV/dQNBNc585mErb0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="345001368"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="345001368"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 10:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="865798170"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="865798170"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2023 10:28:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJH9n-0004yS-1o;
	Tue, 11 Jul 2023 17:28:11 +0000
Date: Wed, 12 Jul 2023 01:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [stable:linux-4.19.y 2317/9999] sound/soc/amd/acp-rt5645.c:180:36:
 warning: unused variable 'cz_audio_acpi_match'
Message-ID: <202307120145.xyjgOLe4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fangrui,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: 69c122751164c3c343eea205fd5c3e1d5132f967 [2317/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
config: mips-randconfig-r034-20230710 (https://download.01.org/0day-ci/archive/20230712/202307120145.xyjgOLe4-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120145.xyjgOLe4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120145.xyjgOLe4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp-rt5645.c:180:36: warning: unused variable 'cz_audio_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id cz_audio_acpi_match[] = {
                                      ^
   1 warning generated.


vim +/cz_audio_acpi_match +180 sound/soc/amd/acp-rt5645.c

566a1847fb37f1 Akshu Agrawal 2017-10-18  179  
566a1847fb37f1 Akshu Agrawal 2017-10-18 @180  static const struct acpi_device_id cz_audio_acpi_match[] = {
566a1847fb37f1 Akshu Agrawal 2017-10-18  181  	{ "AMDI1002", 0 },
566a1847fb37f1 Akshu Agrawal 2017-10-18  182  	{},
566a1847fb37f1 Akshu Agrawal 2017-10-18  183  };
566a1847fb37f1 Akshu Agrawal 2017-10-18  184  MODULE_DEVICE_TABLE(acpi, cz_audio_acpi_match);
566a1847fb37f1 Akshu Agrawal 2017-10-18  185  

:::::: The code at line 180 was first introduced by commit
:::::: 566a1847fb37f1b12d997f85623cbf8658c87394 ASoC: AMD: Add machine driver for cz rt5650

:::::: TO: Akshu Agrawal <akshu.agrawal@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5E9A3D;
	Fri, 11 Aug 2023 02:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691722169; x=1723258169;
  h=date:from:cc:subject:message-id:mime-version;
  bh=mA96RnWiA9lWdzCVf4t25wRAwAJI3pUocseMgd6EqiY=;
  b=cwTwLy++C+0hV+UJsoeTMhwy7NxQWq9kHchHgoInl+5B8Yk00673tqrj
   +hAQ98LeM2stpba6jPDoC5LUXvC5tr1JNHXpkPVAfmBajc5/VbqW4KiiY
   idqRVEFdDDEQrcaJtH6B+//IE5pwggWj+43CKw88J+b4P5IcNDd8KMNdE
   9QGDQWTMcZCgsYZPDtZUWBtHIIZ+01C+e1Fo/NshQ0qwgoEZjSTU24Za3
   ioBxNFv5t9BqG4TGZ2p1XZ3cdnOychg+cl7Y+BRDEsU9cwV6oWn6JI8Bx
   klODo6EjoLXeRx8YbgOOwlDDlaEBPrZK4W4PWHqxO9TMMxHWKSwrzGzsj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="375290706"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="375290706"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 19:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="979076204"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="979076204"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Aug 2023 19:49:27 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUIDO-0007RK-2m;
	Fri, 11 Aug 2023 02:49:26 +0000
Date: Fri, 11 Aug 2023 10:49:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [sudeep-holla:android13-5.10/ffa 9247/9999] fs/nfs/nfsv4.lto.o:
 warning: objtool: .text.__cfi_check_fail: unexpected end of section
Message-ID: <202308111016.k7VjZblF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Nick Desaulniers <ndesaulniers@google.com>

Hi Nick,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: e48efff5cb5fd63a687465347bdbb52ef98dad44 [9247/9999] ANDROID: arch/Kconfig: fix up LTO LLVM_IAS depdency
config: x86_64-randconfig-x011-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111016.k7VjZblF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111016.k7VjZblF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111016.k7VjZblF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/nfsv4.lto.o: warning: objtool: .text.__cfi_check_fail: unexpected end of section
--
>> lib/crypto/libarc4.lto.o: warning: objtool: .text.__cfi_check_fail: unexpected end of section
--
>> net/dns_resolver/dns_resolver.lto.o: warning: objtool: .text.__cfi_check_fail: unexpected end of section
--
>> net/core/failover.lto.o: warning: objtool: .text.__cfi_check_fail: unexpected end of section
--
>> net/sunrpc/auth_gss/rpcsec_gss_krb5.lto.o: warning: objtool: .text.__cfi_check_fail: unexpected end of section
--
>> net/sunrpc/auth_gss/auth_rpcgss.lto.o: warning: objtool: .text.__cfi_check_fail: unexpected end of section
--
>> drivers/net/net_failover.lto.o: warning: objtool: .text.__cfi_check_fail: unexpected end of section
--
>> drivers/net/virtio_net.lto.o: warning: objtool: .text.__cfi_check_fail: unexpected end of section
--
>> fs/cifs/cifs.lto.o: warning: objtool: .text.__cfi_check_fail: unexpected end of section
--
>> drivers/media/dvb-frontends/sp8870.lto.o: warning: objtool: .text.__cfi_check_fail: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

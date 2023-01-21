Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B000A7E;
	Sat, 21 Jan 2023 06:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674283023; x=1705819023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ZxxyVoHssmmy4NaI0ffcGCyKfogC7+Zh0PbpbrYIPo=;
  b=dZ1mwKGtNePxdyyqDWBW1xMlO5TsiIevM9pEwXAnl07325HZIE5vxdKI
   jkQ3oZ0dx5dBoo8UbamO+wkDqGc0fsacXul4ATATHqslkUErWN1HvDK23
   GjOGLAWGiIf2Dqnn/UmbEUyq7dOAGxSBgDAQPXzBzwxlwDfVRSM7+nXp5
   cz6BkPMyEphWoJchYoH6UhXgeWoeJlJ1deNr6nJ+zUvt+Tvb7d2uzQs9E
   ag4kddcpmn+l/c2vCT2xNzdqGMeFFwtoQfsd6Tq6Jc6y6dDp5KyyuQFTS
   yuO07E1oVpvcnoDSFv9dHdw8MLsNx9UweR/4+DF3L2Tt7majO0xyWf/Xf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="388123967"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="388123967"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 22:37:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="693097980"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="693097980"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Jan 2023 22:37:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ7Uq-0003gY-3B;
	Sat, 21 Jan 2023 06:37:00 +0000
Date: Sat, 21 Jan 2023 14:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 16/435] rust/helpers.c:688:9: error:
 implicit declaration of function 'of_node_is_root' is invalid in C99
Message-ID: <202301211425.Bc2P8XPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   6cb6d0b4fbbe5d99e82829e9c20618f85b5d890a
commit: ce99480622e25b44347eb5ffa86fabbcfe450ca9 [16/435] rust: of: Add initial OF node bindings
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230121/202301211425.Bc2P8XPq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/ce99480622e25b44347eb5ffa86fabbcfe450ca9
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-wip
        git checkout ce99480622e25b44347eb5ffa86fabbcfe450ca9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> rust/helpers.c:688:9: error: implicit declaration of function 'of_node_is_root' is invalid in C99 [-Wimplicit-function-declaration]
>> rust/helpers.c:688:9: error: implicit declaration of function 'of_node_is_root' is invalid in C99 [-Wimplicit-function-declaration], err: true
   thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.62.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
   note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
   make[2]: *** [rust/Makefile:343: rust/bindings/bindings_helpers_generated.rs] Error 1
   make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[2]: Target 'rust/' not remade because of errors.
   make[1]: *** [Makefile:1276: prepare] Error 2
   make: *** [Makefile:231: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/of_node_is_root +688 rust/helpers.c

   685	
   686	bool rust_helper_of_node_is_root(const struct device_node *np)
   687	{
 > 688		return of_node_is_root(np);
   689	}
   690	EXPORT_SYMBOL_GPL(rust_helper_of_node_is_root);
   691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

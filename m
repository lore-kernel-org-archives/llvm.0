Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F0FAD32;
	Thu, 16 Mar 2023 21:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679000808; x=1710536808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6mE4pCdOhtBNBY6oqJoafqJJU8ImsF0HTPAumdxJVaQ=;
  b=GjF15+thvhrougIwSkPThS1vHk4P0DIUsSc39hwKgtvarZG3K7ZTRUZZ
   rFlU+rfd1AxlnLGS5d2ehtoAnfMHcqELvsnyJNaf5kNqAK5/S3sQmyLGp
   yJYnEuadbRDFQqX0QNPX9Gaqxc+By8UpLDb82LS151ogDH9pi3/IFiOak
   JK487pL0hnJuCqQiy3EuLMQd3Js04vBRgEdimDcwHwDN729iD9CS5SKBh
   Dpfu8TG7TuQTpk1XasZvNnujomtrlsLs0MJQWIhumC0M61pJsn4p/WRVz
   pt+XjXZVmqagWOHIgmrK/AU7ATxz3le6UkY10sKIkeprYFcZo3SZ03MmZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="424383523"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="424383523"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 14:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="673308621"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="673308621"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Mar 2023 14:06:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcuo8-0008qc-0u;
	Thu, 16 Mar 2023 21:06:44 +0000
Date: Fri, 17 Mar 2023 05:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, Eric Biggers <ebiggers@google.com>,
	Jean-Philippe Aumasson <jeanphilippe.aumasson@gmail.com>
Subject: [stable:linux-5.4.y 4197/7834] ERROR: "sha_transform"
 [crypto/sha1_generic.ko] undefined!
Message-ID: <202303170515.Ls4W3urG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   b829e8b6e1a7bb8cd3042b927113a22fed0b0d47
commit: c2f0a89cd1d5a00c5bf48060987cf53ada93d4b0 [4197/7834] random: use BLAKE2s instead of SHA1 in extraction
config: mips-randconfig-r003-20230313 (https://download.01.org/0day-ci/archive/20230317/202303170515.Ls4W3urG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c2f0a89cd1d5a00c5bf48060987cf53ada93d4b0
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout c2f0a89cd1d5a00c5bf48060987cf53ada93d4b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170515.Ls4W3urG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "sha_transform" [crypto/sha1_generic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

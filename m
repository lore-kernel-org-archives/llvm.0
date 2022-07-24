Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A847E3FE4
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 20:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658693723; x=1690229723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vtyQ6r5RNIUxGsw0pSR4Wevr3K0N8+9dHQDudo8q5C4=;
  b=lBsWmDB1beoNpRA5jFviG+1b2aUexF8Gh98ZvbJvSRlxtNlXEaIY89TM
   zFVpzI5oIxfu6WJSaSlZkXQtRsEK7Q+bJBi9TZxRcF/HwFZujyJd4mece
   C5UGt0dZMUYM4RTncG3HYYgeEmyvXHVAaBewiX4RQsrwSf4mOatY5ZzwF
   +dUu79ZeAS+rRWCPZGXMo1BFB25nvYV4K1o+r5u14uMkSEUK8NdXIfWMD
   M+unODCIhUXjjpkPstqD++YcW3BQ4AJdyA2UFjd7m9/Vi29ibhXRqe7DS
   kxIM74WuqjNwlGnX3FC0MwfM2oK/taNq8rPXUPkzOLOuuR2sdDd4CIxmX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="288752958"
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="288752958"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 13:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="574796644"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Jul 2022 13:15:22 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFi0X-0004EX-17;
	Sun, 24 Jul 2022 20:15:21 +0000
Date: Mon, 25 Jul 2022 04:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mauricio Faria de Oliveira <mfo@canonical.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 5/6] netfilter: conntrack: use MODULE_SYSCTL_TABLE
Message-ID: <202207250414.DSERAcET-lkp@intel.com>
References: <20220722022416.137548-6-mfo@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722022416.137548-6-mfo@canonical.com>

Hi Mauricio,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on mcgrof/sysctl-next mcgrof/modules-next linus/master v5.19-rc7 next-20220722]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauricio-Faria-de-Oliveira/Introduce-sysctl-module-aliases/20220722-102704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
config: arm-s3c2410_defconfig (https://download.01.org/0day-ci/archive/20220725/202207250414.DSERAcET-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 72686d68c137551cce816416190a18d45b4d4e2a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/04385118e6c49d6fbe08310935033555de4f9d8e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mauricio-Faria-de-Oliveira/Introduce-sysctl-module-aliases/20220722-102704
        git checkout 04385118e6c49d6fbe08310935033555de4f9d8e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: 18009 Done                    sed 's/ko$/o/' modules.order
        18011 Segmentation fault      | scripts/mod/modpost -o modules-only.symvers -i vmlinux.symvers -T -

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

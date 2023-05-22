Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182489445;
	Mon, 22 May 2023 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684748435; x=1716284435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=alwtD4oYIF2PpJCGfUhWMgVgfbhLq4GBO+maaIUu0Qk=;
  b=egdDlehtQ+XmTJQcX74k5N3mJ8DdbeB9MmS4+6ZeHrfvwPs1jh7yYtgr
   lGm39Po0wLvc6n3Guq6diRkSult6evZSpgVMMvsNUJ3sZTXdHJSEE0tLg
   0TwK5+v5hdOyIGA+S4g5lcKXPTSJPSSTzlz6o71SmeEGrpFRM3ehuG4yk
   jA+CbKEplqkSixgtDuzfbK1ngFA//1bgNfch2egVoXTCfcKoTYfNh1hKi
   QoVAvVnqMb6Js0ehpnnxXtA7HTiqJzKONDCDkqZh8vTpC02nC9X3irs0/
   GEp1PDuZsGmcGwzIvX3o+5MI43xLXIX/Mvh4EnMAhtlE2qdtcN3Dp6ifd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="439228456"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="439228456"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 02:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="877697862"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="877697862"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 May 2023 02:40:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q121l-000Cld-1m;
	Mon, 22 May 2023 09:40:29 +0000
Date: Mon, 22 May 2023 17:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 7/7] rust: workqueue: add `try_spawn` helper method
Message-ID: <202305221705.53O33t7y-lkp@intel.com>
References: <20230517203119.3160435-8-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517203119.3160435-8-aliceryhl@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on ac9a78681b921877518763ba0e89202254349d1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-workqueue-add-low-level-workqueue-bindings/20230518-044441
base:   ac9a78681b921877518763ba0e89202254349d1b
patch link:    https://lore.kernel.org/r/20230517203119.3160435-8-aliceryhl%40google.com
patch subject: [PATCH v1 7/7] rust: workqueue: add `try_spawn` helper method
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230522/202305221705.53O33t7y-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c7bcf1f51579e8c0c4863a7a7f10bc00c253bd62
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alice-Ryhl/rust-workqueue-add-low-level-workqueue-bindings/20230518-044441
        git checkout c7bcf1f51579e8c0c4863a7a7f10bc00c253bd62
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305221705.53O33t7y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0107]: missing generics for enum `core::result::Result`
   --> rust/kernel/workqueue.rs:64:67
   |
   64  |     pub fn try_spawn<T: 'static + Send + Fn()>(&self, func: T) -> Result {
   |                                                                   ^^^^^^ expected 2 generic arguments
   |
   note: enum defined here, with 2 generic parameters: `T`, `E`
   --> /opt/cross/rustc-1.62.0-bindgen-0.56.0/rustup/toolchains/1.62.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/result.rs:504:10
   |
   504 | pub enum Result<T, E> {
   |          ^^^^^^ -  -
   help: add missing generic arguments
   |
   64  |     pub fn try_spawn<T: 'static + Send + Fn()>(&self, func: T) -> Result<T, E> {
   |                                                                   ~~~~~~~~~~~~
--
>> error: aborting due to previous error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

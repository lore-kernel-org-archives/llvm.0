Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791DA1C740;
	Thu, 11 May 2023 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JueSUjyO5Ft8TEPREKFM0Pzr5HFihlx0m8f1X9T8/VE=; b=DL02aFUBq5zlhiIidLBh5acK1b
	sEdJxKqoJipX8jynLC4BVs4vCTCNLoGNNF2aanOc91QT0jpEPs6uhuc/Su8Yd3PPl+XVSDBM+aTCV
	ybDx7eNCgujowrax1ms4mL3wfGPiBN5fsJX0iLY/H2SFwkjSDdkFu9qJ5EL51GWvuhe/4KPh4sRin
	/C5lObOVHnkMAZebDypMZILilvp69svMBqgjYsk0D0YiS4ZjtzebiaNrUcmB6xsaF06AonURhBIlt
	KbW8tk5cqUu149MJR+dHzTLDWrajKnKEhvsGDbCb1Vlkzx8ouNxaFvtBeQIq+N7PxYVJAQlELqP2l
	Tsj9tQGw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1px2qj-00H5Ux-Th; Thu, 11 May 2023 09:44:38 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6734B300244;
	Thu, 11 May 2023 11:44:36 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2263A24179037; Thu, 11 May 2023 11:44:36 +0200 (CEST)
Date: Thu, 11 May 2023 11:44:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Kent Overstreet <kmo@daterainc.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:locking/core 1/2]
 kernel/locking/lockdep.c:3603:65: error: too few arguments to function call,
 expected 2, have 1
Message-ID: <20230511094436.GT4253@hirez.programming.kicks-ass.net>
References: <202305110344.xVyXq6m3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305110344.xVyXq6m3-lkp@intel.com>

On Thu, May 11, 2023 at 03:25:24AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
> head:   c9b4ca9414103eefcb5b2fdce5b0238f64768a53
> commit: 42c02af27bb3c420d2de11d8c9c0b17ce40f76ac [1/2] lockdep: Add lock_set_cmp_fn() annotation
> config: arm64-randconfig-r026-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110344.xVyXq6m3-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=42c02af27bb3c420d2de11d8c9c0b17ce40f76ac
>         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
>         git fetch --no-tags peterz-queue locking/core
>         git checkout 42c02af27bb3c420d2de11d8c9c0b17ce40f76ac
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/locking/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305110344.xVyXq6m3-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/locking/lockdep.c:3603:65: error: too few arguments to function call, expected 2, have 1
>                    print_lock_name(lock_classes + chain_hlock_class_idx(hlock_id));
>                    ~~~~~~~~~~~~~~~                                               ^

Fixed this and the other build error on this branch and pushed out
again.

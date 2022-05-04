Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6860733C9
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 17:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A276AC385A4;
	Wed,  4 May 2022 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651684564;
	bh=KdZtJj7/GWM8ZYLUQd/9LzkOkG0HQw3v9nmA9n/ALns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QyKqYVjSFRGQ80Cs3l+qczRQaPYi+zp+jyOlZrCX3yOt4HJSyjToMaclNzwMyf7E4
	 vXDfrHDOCKAT0sC77vwG/kSW5ahtXe532mcICAuDEE90VtX7cxYD+A1ufJS6Gx/tnv
	 8eLE7ypPGKAVEQML16y/3+1BKCZ2oDOPBDizuURBy2u+e9G2Zz6cpDTtfUyMksupD1
	 hgepRW7eHhHf9F4rrpqYOM6iOQ9Di/SqjOvwzzTGoiHTCkpyUOTHxxC867DAt475nH
	 X4PhpkbrMSkiNd9YC/VFI6Jeqi8NOLSavu6DGa9F7wGmm6cp/M12EjvWeYXZWGkFFZ
	 03v/C6obYhSNA==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	llvm@lists.linux.dev,
	kbuild-all@lists.01.org
Subject: RE: [PATCH] mm/damon/sysfs: fix pid leak under fvaddr ops use case
Date: Wed,  4 May 2022 17:16:01 +0000
Message-Id: <20220504171601.106690-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202205041011.jv6vuDe4-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 4 May 2022 10:53:47 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi SeongJae,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on hnaz-mm/master]

This patch is on top of mm-unstable branch of akpm's mm tree.  More
specifically, this patch depends on a commit[1] on the tree.  So, this error
shouldn't occur on top of the tree.

If I'm missing something, please let me know.

[0] git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
[1] https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-unstable&id=cb52aff4ed86a5992309bc7efc228303a7dc084d


Thanks,
SJ

> 
> url:    https://github.com/intel-lab-lkp/linux/commits/SeongJae-Park/mm-dam=
> on-sysfs-fix-pid-leak-under-fvaddr-ops-use-case/20220504-060657
> base:   https://github.com/hnaz/linux-mm master
> config: hexagon-randconfig-r045-20220501 (https://download.01.org/0day-ci/a=
> rchive/20220504/202205041011.jv6vuDe4-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a=
> 645a1e30011cc8da624f13dac5fd915628)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
> make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/60cfe4571b04ef4ca2e=
> 34793fbad737bb43dc0c6
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review SeongJae-Park/mm-damon-sysfs-fix-p=
> id-leak-under-fvaddr-ops-use-case/20220504-060657
>         git checkout 60cfe4571b04ef4ca2e34793fbad737bb43dc0c6
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
> 1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash mm/damon/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/damon/sysfs.c:2089:20: error: use of undeclared identifier 'DAMON_OPS=
> _FVADDR'; did you mean 'DAMON_OPS_VADDR'?
>                                    ctx->ops.id =3D=3D DAMON_OPS_FVADDR)
>                                                   ^~~~~~~~~~~~~~~~
>                                                   DAMON_OPS_VADDR
>    include/linux/damon.h:267:2: note: 'DAMON_OPS_VADDR' declared here
>            DAMON_OPS_VADDR,
>            ^
>    mm/damon/sysfs.c:2206:55: error: use of undeclared identifier 'DAMON_OPS=
> _FVADDR'; did you mean 'DAMON_OPS_VADDR'?
>            if (ctx->ops.id !=3D DAMON_OPS_VADDR && ctx->ops.id !=3D DAMON_O=
> PS_FVADDR)
>                                                                 ^~~~~~~~~~~=
> ~~~~~
>                                                                 DAMON_OPS_V=
> ADDR
>    include/linux/damon.h:267:2: note: 'DAMON_OPS_VADDR' declared here
>            DAMON_OPS_VADDR,
>            ^
>    2 errors generated.
> 
> 
> vim +2089 mm/damon/sysfs.c
> 
>   2082
>   2083  static void damon_sysfs_destroy_targets(struct damon_ctx *ctx)
>   2084  {
>   2085          struct damon_target *t, *next;
>   2086
>   2087          damon_for_each_target_safe(t, next, ctx) {
>   2088                  if (ctx->ops.id =3D=3D DAMON_OPS_VADDR ||
> > 2089                                  ctx->ops.id =3D=3D DAMON_OPS_FVADDR=
> )
>   2090                          put_pid(t->pid);
>   2091                  damon_destroy_target(t);
>   2092          }
>   2093  }
>   2094
> 
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> 

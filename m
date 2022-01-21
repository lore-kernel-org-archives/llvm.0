Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A74173
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 10:24:29 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 9573310008D; Fri, 21 Jan 2022 10:15:00 +0000 (UTC)
Date: Fri, 21 Jan 2022 10:15:00 +0000
From: Sean Young <sean@mess.org>
To: kernel test robot <lkp@intel.com>
Cc: linux-media@vger.kernel.org, llvm@lists.linux.dev,
	kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] media: rc-core: rename ir_raw_event_reset to
 ir_raw_event_overflow
Message-ID: <YeqHpGe61ApoeYHX@gofer.mess.org>
References: <20220120161614.328202-1-sean@mess.org>
 <202201211605.1ccb0HNg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201211605.1ccb0HNg-lkp@intel.com>

Hi Bot,

On Fri, Jan 21, 2022 at 04:59:50PM +0800, kernel test robot wrote:
> Hi Sean,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on media-tree/master]
> [also build test ERROR on next-20220121]
> [cannot apply to sunxi/sunxi/for-next v5.16]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Sean-Young/media-rc-core-rename-ir_raw_event_reset-to-ir_raw_event_overflow/20220121-001937
> base:   git://linuxtv.org/media_tree.git master
> config: hexagon-randconfig-r041-20220120 (https://download.01.org/0day-ci/archive/20220121/202201211605.1ccb0HNg-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/5b0115b915832b54ebe085c923d73209b1abb364
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Sean-Young/media-rc-core-rename-ir_raw_event_reset-to-ir_raw_event_overflow/20220121-001937
>         git checkout 5b0115b915832b54ebe085c923d73209b1abb364
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/rc/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/media/rc/mtk-cir.c:220:2: error: implicit declaration of function 'ir_raw_event_reset' [-Werror,-Wimplicit-function-declaration]
>            ir_raw_event_reset(ir->rc);
>            ^
>    drivers/media/rc/mtk-cir.c:220:2: note: did you mean 'ir_raw_event_store'?
>    include/media/rc-core.h:317:5: note: 'ir_raw_event_store' declared here
>    int ir_raw_event_store(struct rc_dev *dev, struct ir_raw_event *ev);
>        ^
>    1 error generated.

This patch depends on:

https://patchwork.linuxtv.org/project/linux-media/patch/20220114150353.195192-2-sean@mess.org/

With that patch it should build fine.


Sean

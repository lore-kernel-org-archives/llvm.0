Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7562717E7
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 23:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648511013; x=1680047013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YuVjfYfruYtRLaX1CiFhcGwi4qmnZq7U8gH5tKxN3g0=;
  b=nwJ43frUsRbPNEl2uXOqaqGQZ1mRJVzeo+haQVkggI23p6thsXPXFI2n
   n/E/pwNMnhm/6+ANu1tXBMUrHyMibAWf+pC1YfBHXxbVK7fR+ZnALIn4h
   UWkabjHWGZFMVgaRgIboDn1AB8GQsUNOVsj8gw49EZkf8Wse7bwwL/r2j
   wmOERLUPDqYrP74mGi/2BSBduXmfaWBu6PYMurbVY17SOa1UE8I3gPVGj
   l0QTLq9OfKZ4/qHMJ588ZeynONXIUkSLl2wevObqVCB/fambGV11BHdax
   Cv/SOQKmA3+9IdGDStmi3E/jei+oPi3Zkzin7+Ej82AHSxpjBiCbnkzNc
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="258839476"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; 
   d="scan'208";a="258839476"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2022 16:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; 
   d="scan'208";a="604390621"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Mar 2022 16:43:31 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYz1G-0002QD-97; Mon, 28 Mar 2022 23:43:30 +0000
Date: Tue, 29 Mar 2022 07:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:axboe/linux-block/sock-nolock 6/6]
 fs/io_uring.c:8999:2: error: implicit declaration of function
 'io_sock_nolock_clear' is invalid in C99
Message-ID: <202203290752.13QoLC96-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/sock-nolock
head:   90b2144118aabeddabb82f22e07b87da068c54cd
commit: 90b2144118aabeddabb82f22e07b87da068c54cd [6/6] io_uring: mark accept direct socket as no-lock
config: hexagon-randconfig-r041-20220328 (https://download.01.org/0day-ci/archive/20220329/202203290752.13QoLC96-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/90b2144118aabeddabb82f22e07b87da068c54cd
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block axboe/linux-block/sock-nolock
        git checkout 90b2144118aabeddabb82f22e07b87da068c54cd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/io_uring.c:8999:2: error: implicit declaration of function 'io_sock_nolock_clear' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           io_sock_nolock_clear(file);
           ^
   1 error generated.


vim +/io_sock_nolock_clear +8999 fs/io_uring.c

  8938	
  8939	static void io_rsrc_file_put(struct io_ring_ctx *ctx, struct io_rsrc_put *prsrc)
  8940	{
  8941		struct file *file = prsrc->file;
  8942	#if defined(CONFIG_UNIX)
  8943		struct sock *sock = ctx->ring_sock->sk;
  8944		struct sk_buff_head list, *head = &sock->sk_receive_queue;
  8945		struct sk_buff *skb;
  8946		int i;
  8947	
  8948		__skb_queue_head_init(&list);
  8949	
  8950		/*
  8951		 * Find the skb that holds this file in its SCM_RIGHTS. When found,
  8952		 * remove this entry and rearrange the file array.
  8953		 */
  8954		skb = skb_dequeue(head);
  8955		while (skb) {
  8956			struct scm_fp_list *fp;
  8957	
  8958			fp = UNIXCB(skb).fp;
  8959			for (i = 0; i < fp->count; i++) {
  8960				int left;
  8961	
  8962				if (fp->fp[i] != file)
  8963					continue;
  8964	
  8965				unix_notinflight(fp->user, fp->fp[i]);
  8966				left = fp->count - 1 - i;
  8967				if (left) {
  8968					memmove(&fp->fp[i], &fp->fp[i + 1],
  8969							left * sizeof(struct file *));
  8970				}
  8971				fp->count--;
  8972				if (!fp->count) {
  8973					kfree_skb(skb);
  8974					skb = NULL;
  8975				} else {
  8976					__skb_queue_tail(&list, skb);
  8977				}
  8978				io_sock_nolock_clear(file);
  8979				fput(file);
  8980				file = NULL;
  8981				break;
  8982			}
  8983	
  8984			if (!file)
  8985				break;
  8986	
  8987			__skb_queue_tail(&list, skb);
  8988	
  8989			skb = skb_dequeue(head);
  8990		}
  8991	
  8992		if (skb_peek(&list)) {
  8993			spin_lock_irq(&head->lock);
  8994			while ((skb = __skb_dequeue(&list)) != NULL)
  8995				__skb_queue_tail(head, skb);
  8996			spin_unlock_irq(&head->lock);
  8997		}
  8998	#else
> 8999		io_sock_nolock_clear(file);
  9000		fput(file);
  9001	#endif
  9002	}
  9003	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA298F76;
	Mon, 31 Oct 2022 23:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C582BC433C1;
	Mon, 31 Oct 2022 23:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1667257849;
	bh=oea+DfSn2PZjsarkz1aPAd8kSD63FeuVEhn2xKVR+hE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LDPDYGRhcY0D8cYiAhlQo0Fkj9je1Vk1UG9GS3xOvoNNscyPkjNTLlyfKPyynNb80
	 5VPNUurpmyeMkbJw43/YMY5GCTrtafcU7PFQBZZXMmcA1Kn3kFG41/9DU7l7fHI7ZK
	 +UQFHtLXWWDBLqsfYnd9BklfamuUZunE21rihuzw=
Date: Mon, 31 Oct 2022 16:10:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Liam Howlett <liam.howlett@oracle.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, Linux Memory Management List
 <linux-mm@kvack.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 46/244]
 lib/test_maple_tree.c:453:12: warning: result of comparison of constant
 4398046511104 with expression of type 'unsigned long' is always false
Message-Id: <20221031161048.a2fd2ce1c210b9cd1a499cb4@linux-foundation.org>
In-Reply-To: <202210301224.r9RDzf4K-lkp@intel.com>
References: <202210301224.r9RDzf4K-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Oct 2022 13:04:16 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> head:   eecc1f68b7ae1e677dd01b728e58de61a2f8ae71
> commit: d9c0ca7c6a02830de65fbc684cf0be7e6510737c [46/244] maple_tree: reorganize testing to restore module testing
> config: hexagon-allmodconfig
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/ammarfaizi2/linux-block/commit/d9c0ca7c6a02830de65fbc684cf0be7e6510737c
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block akpm/mm/mm-unstable
>         git checkout d9c0ca7c6a02830de65fbc684cf0be7e6510737c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> lib/test_maple_tree.c:453:12: warning: result of comparison of constant 4398046511104 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
>                    if ((val == 4398046511104) || (val == ULONG_MAX))
>                         ~~~ ^  ~~~~~~~~~~~~~
>    lib/test_maple_tree.c:496:17: warning: result of comparison of constant 4398046511104 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
>                    else if ((val == 4398046511104) || (val == ULONG_MAX))
>                              ~~~ ^  ~~~~~~~~~~~~~
>    lib/test_maple_tree.c:182:19: warning: unused function 'not_empty' [-Wunused-function]
>    static inline int not_empty(struct maple_node *node)

Thanks.  A 32-bit build, I assume.

Liam, what's with that 4398046511104?  Wouldn't 0x40000000000 be clearer?  

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D092F30;
	Sun, 29 Jan 2023 21:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E877C433D2;
	Sun, 29 Jan 2023 21:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1675026684;
	bh=2c1/zfLYSTumcA9nefeVEH6ejt2EzwGBVZ7Mcqr2uos=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cj6oDvDErBydz9N8rzVAw3ZsgczRhIaYjBGKA26SXYusSOP8vzhJRFwq9CXgeZ6mC
	 mBOkjqflDMyrRDdrAijNkmBCBHdw5gLJv5otiBFWuaDqMrRGdFveO9fXcr33aV+DGV
	 NDsdmmXldZz5z28/UDu2lsRul9XwMA+gkkxx6jhg=
Date: Sun, 29 Jan 2023 13:11:23 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 167/506] include/linux/hugetlb.h:1193:9:
 error: implicit declaration of function 'page_count' is invalid in C99
Message-Id: <20230129131123.416530fe0b73a45d44ab944f@linux-foundation.org>
In-Reply-To: <202301282035.M6wJfQhs-lkp@intel.com>
References: <202301282035.M6wJfQhs-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 Jan 2023 20:55:08 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   ede43f2956cc25e387a5e225324104f22e715908
> commit: 6c096b0425160233d2a8c3ec3f3d82dae5c37678 [167/506] mm: hugetlb: proc: check for hugetlb shared PMD in /proc/PID/smaps
> config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230128/202301282035.M6wJfQhs-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=6c096b0425160233d2a8c3ec3f3d82dae5c37678
>         git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
>         git fetch --no-tags akpm-mm mm-unstable
>         git checkout 6c096b0425160233d2a8c3ec3f3d82dae5c37678
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/infiniband/core/ drivers/net/ethernet/mellanox/mlx5/core/ fs/cifs/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> Note: the akpm-mm/mm-unstable HEAD ede43f2956cc25e387a5e225324104f22e715908 builds fine.
>       It only hurts bisectability.
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/infiniband/core/umem_odp.c:41:
> >> include/linux/hugetlb.h:1193:9: error: implicit declaration of function 'page_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>            return page_count(virt_to_page(pte)) > 1;
>                   ^

Thanks.

I hesitate to include mm.h into hugetlb.h, but page_ref.h looks OK.


--- a/include/linux/hugetlb.h~mm-hugetlb-proc-check-for-hugetlb-shared-pmd-in-proc-pid-smaps-fix-2
+++ a/include/linux/hugetlb.h
@@ -7,6 +7,7 @@
 #include <linux/fs.h>
 #include <linux/hugetlb_inline.h>
 #include <linux/cgroup.h>
+#include <linux/page_ref.h>
 #include <linux/list.h>
 #include <linux/kref.h>
 #include <linux/pgtable.h>
_


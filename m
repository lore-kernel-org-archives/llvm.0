Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BDB10E5;
	Sat,  7 Jan 2023 01:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0328C433F0;
	Sat,  7 Jan 2023 01:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1673054919;
	bh=WZ6M2N+DF8HphMp0rPSOPB8R9oUlLA4VMmuxynDPy44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H1qX/YeQMNHc6rXMlkgcZqKPX3NniewgHOkWwDyp7yuvsEZk7djjs8OX0dud1LUJx
	 FyEzFCtCrviUd004IDB9o0JUj3MQ65HaNxXOvZgmSMYukYC/Ftn63SQdTxyJjx0WXs
	 /bZBoFepu4XkNq9AeoH00sk4qe4YOIpCxycsJ4as=
Date: Fri, 6 Jan 2023 17:28:37 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 187/223]
 mm/nommu.c:547:6: warning: no previous prototype for function
 'vma_mas_store'
Message-Id: <20230106172837.0111dad31ba2fae25a4a9bfb@linux-foundation.org>
In-Reply-To: <202301062207.zMezwo2P-lkp@intel.com>
References: <202301062207.zMezwo2P-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Jan 2023 23:02:44 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> head:   a2765ca8c916591ebc9af48b4e545922c0bd3c3b
> commit: c9f5ce5be2dfd3e5d5f36cac50b93c86982fcabc [187/223] mmap: convert __vma_adjust() to use vma iterator
> config: arm-randconfig-r004-20230106
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 8d9828ef5aa9688500657d36cd2aefbe12bbd162)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://github.com/ammarfaizi2/linux-block/commit/c9f5ce5be2dfd3e5d5f36cac50b93c86982fcabc
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block akpm/mm/mm-unstable
>         git checkout c9f5ce5be2dfd3e5d5f36cac50b93c86982fcabc
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/nommu.c:547:6: warning: no previous prototype for function 'vma_mas_store' [-Wmissing-prototypes]
>    void vma_mas_store(struct vm_area_struct *vma, struct ma_state *mas)
>         ^

Thanks.  I'll do this for now, as a temp thing.

--- a/mm/nommu.c~mmap-convert-__vma_adjust-to-use-vma-iterator-fix
+++ a/mm/nommu.c
@@ -544,7 +544,7 @@ static void put_nommu_region(struct vm_r
 	__put_nommu_region(region);
 }
 
-void vma_mas_store(struct vm_area_struct *vma, struct ma_state *mas)
+static void vma_mas_store(struct vm_area_struct *vma, struct ma_state *mas)
 {
 	mas_set_range(mas, vma->vm_start, vma->vm_end - 1);
 	mas_store_prealloc(mas, vma);
_


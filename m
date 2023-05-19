Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E29569C;
	Fri, 19 May 2023 09:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2FEC433EF;
	Fri, 19 May 2023 09:28:09 +0000 (UTC)
Date: Fri, 19 May 2023 10:28:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:devel/kmalloc-minalign 14/15] mm/slab_common.c:872:6:
 error: use of undeclared identifier 'io_tlb_default_mem'
Message-ID: <ZGdBJl2VUURUWA0J@arm.com>
References: <202305191155.zjUXPrvO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305191155.zjUXPrvO-lkp@intel.com>

On Fri, May 19, 2023 at 12:21:57PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git devel/kmalloc-minalign
> head:   fb23b58c4b9af85f4be40fda6918fb03c558f052
> commit: c6bfb3f07647d9d3e454ff481dfd10ddb3d925f7 [14/15] mm: slab: Reduce the kmalloc() minimum alignment if DMA bouncing possible
> config: arm-randconfig-r025-20230517
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=c6bfb3f07647d9d3e454ff481dfd10ddb3d925f7
>         git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>         git fetch --no-tags arm64 devel/kmalloc-minalign
>         git checkout c6bfb3f07647d9d3e454ff481dfd10ddb3d925f7
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305191155.zjUXPrvO-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/slab_common.c:872:6: error: use of undeclared identifier 'io_tlb_default_mem'
>                io_tlb_default_mem.nslabs == 0)
>                ^
>    1 error generated.

Ah, I forgot that not all arches have the SWIOTLB enabled. I'll fold the
hunk below in the next update. Thanks for the report.

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 84e5a5e435d6..a57aa1a7e7de 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -864,6 +864,7 @@ void __init setup_kmalloc_cache_index_table(void)
 	}
 }
 
+#ifdef CONFIG_SWIOTLB
 static unsigned int __kmalloc_minalign(void)
 {
 	int cache_align = dma_get_cache_alignment();
@@ -874,6 +875,12 @@ static unsigned int __kmalloc_minalign(void)
 
 	return ARCH_KMALLOC_MINALIGN;
 }
+#else
+static unsigned int __kmalloc_minalign(void)
+{
+	return dma_get_cache_alignment();
+}
+#endif
 
 void __init
 new_kmalloc_cache(int idx, enum kmalloc_cache_type type, slab_flags_t flags)

-- 
Catalin

Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D532F46
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 21:53:48 +0000 (UTC)
Date: Wed, 30 Mar 2022 14:47:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1648676870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u50nsqdeeBmYB/R6zpuCDe6/0f9hKHC+dYk7Osp22B8=;
	b=esB9gPcXanFP8h8Jau49wEJcr2aePFSQXvdWM3ScOwueNHpuO9xw3L4Lc0I11tTH8YtN26
	ikSsXB/CMvCjN8SwU72l1N8T9+ZB/y6UJSDV7LApG7gM5OxG93T/DUHdB+ZDlQ9aeWg55F
	OW5fP/S3Wy/hhLyvjDSAQuV6Rn7f5qg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Mike Rapoport <rppt@linux.ibm.com>, kernel test robot <lkp@intel.com>
Cc: Roman Gushchin <guro@fb.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	Mike Rapoport <rppt@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Minchan Kim <minchan@google.com>
Subject: Re:
 [ammarfaizi2-block:google/android/kernel/common/android12-trusty-5.10
 4036/5872] WARNING: modpost: vmlinux.o(.text+0x4111c4): Section mismatch in
 reference from the function memblock_bottom_up() to the variable
 .meminit.data:memblock
Message-ID: <YkTP/+jhhAX6xlAQ@carbon.dhcp.thefacebook.com>
References: <202203301412.MZ7wQvQz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202203301412.MZ7wQvQz-lkp@intel.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Wed, Mar 30, 2022 at 02:53:14PM +0800, kbuild test robot wrote:
> Hi Roman,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-trusty-5.10
> head:   07055bfd3d810d41a38354693dfaa55a6f8c0025
> commit: 0e0bfc41fdf4d79d39ebe929844cdee44f97366d [4036/5872] UPSTREAM: mm: cma: allocate cma areas bottom-up
> config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220330/202203301412.MZ7wQvQz-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/ammarfaizi2/linux-block/commit/0e0bfc41fdf4d79d39ebe929844cdee44f97366d
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-trusty-5.10
>         git checkout 0e0bfc41fdf4d79d39ebe929844cdee44f97366d
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> WARNING: modpost: vmlinux.o(.text+0x4111c4): Section mismatch in reference from the function memblock_bottom_up() to the variable .meminit.data:memblock
> The function memblock_bottom_up() references
> the variable __meminitdata memblock.
> This is often because memblock_bottom_up lacks a __meminitdata
> annotation or the annotation of memblock is wrong.

I guess this patch should fix it, however I fail to reproduce the original issue.
Maybe it's up to the specific compiler version.

--

From b55a8dd19f4156d7e24ec39b18ede06965ce1c4f Mon Sep 17 00:00:00 2001
From: Roman Gushchin <roman.gushchin@linux.dev>
Date: Wed, 30 Mar 2022 14:42:12 -0700
Subject: [PATCH] memblock: fix memblock_bottom_up() and
 memblock_set_bottom_up() annotations

memblock_bottom_up() and memblock_set_bottom_up() lack __meminitdata
annotations causing compiler warnings like:
  WARNING: modpost: vmlinux.o(.text+0x4111c4): Section mismatch in reference from the function memblock_bottom_up() to the
  variable .meminit.data:memblock

Fix it by adding the missing annotation and removing the wrong
__meminit annotation.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Roman Gushchin <roman.gushchin@linux.dev>
---
 include/linux/memblock.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 50ad19662a32..536bc2fc31e6 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -460,7 +460,7 @@ static inline void *memblock_alloc_node(phys_addr_t size,
 /*
  * Set the allocation direction to bottom-up or top-down.
  */
-static inline __init_memblock void memblock_set_bottom_up(bool enable)
+static inline __initdata_memblock void memblock_set_bottom_up(bool enable)
 {
 	memblock.bottom_up = enable;
 }
@@ -470,7 +470,7 @@ static inline __init_memblock void memblock_set_bottom_up(bool enable)
  * if this is true, that said, memblock will allocate memory
  * in bottom-up direction.
  */
-static inline __init_memblock bool memblock_bottom_up(void)
+static inline __initdata_memblock bool memblock_bottom_up(void)
 {
 	return memblock.bottom_up;
 }
-- 
2.30.2


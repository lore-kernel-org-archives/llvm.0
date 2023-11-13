Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B69E224C9;
	Mon, 13 Nov 2023 17:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="c7Fr9WWm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FE5C433C7;
	Mon, 13 Nov 2023 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1699895407;
	bh=eqHMpQjhzX+WcTQDLIe2boEljF6lPYLs8dmLBLyT6Nw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c7Fr9WWmMXEb+kC9ynvrMqHKBPKopBNtpnYOmPPZ5MjYyWeULJS4vHzr0qHRBJ5/0
	 QpxhqwMOybrvefiip/Dh0TLxqKUi5k7pUnVA9jutrWauFwcuBTq+tagS4Z85101Q94
	 tCTd5AVEX0pgRybBLkpWx5YcAM+/vz16sAF2WdrE=
Date: Mon, 13 Nov 2023 09:10:06 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Hannes Reinecke <hare@suse.de>, Luis Chamberlain
 <mcgrof@kernel.org>, Pankaj Raghav <p.raghav@samsung.com>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] buffer: Fix grow_buffers() for block size >
 PAGE_SIZE
Message-Id: <20231113091006.f9d4de1aaf7ed2f8beef07fb@linux-foundation.org>
In-Reply-To: <202311121240.AN8GbAbe-lkp@intel.com>
References: <20231109210608.2252323-4-willy@infradead.org>
	<202311121240.AN8GbAbe-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Nov 2023 12:52:00 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Matthew,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on linus/master next-20231110]
> [cannot apply to v6.6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/buffer-Return-bool-from-grow_dev_folio/20231110-051651
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20231109210608.2252323-4-willy%40infradead.org
> patch subject: [PATCH v2 3/7] buffer: Fix grow_buffers() for block size > PAGE_SIZE
> config: hexagon-comet_defconfig (https://download.01.org/0day-ci/archive/20231112/202311121240.AN8GbAbe-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311121240.AN8GbAbe-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311121240.AN8GbAbe-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: __muloti4
>    >>> referenced by buffer.c
>    >>>               fs/buffer.o:(bdev_getblk) in archive vmlinux.a
>    >>> referenced by buffer.c
>    >>>               fs/buffer.o:(bdev_getblk) in archive vmlinux.a
> 

What a peculiar compiler.

I assume this fixes?

--- a/fs/buffer.c~buffer-fix-grow_buffers-for-block-size-page_size-fix
+++ a/fs/buffer.c
@@ -1099,7 +1099,7 @@ static bool grow_buffers(struct block_de
 	}
 
 	/* Create a folio with the proper size buffers */
-	return grow_dev_folio(bdev, block, pos / PAGE_SIZE, size, gfp);
+	return grow_dev_folio(bdev, block, pos >> PAGE_SHIFT, size, gfp);
 }
 
 static struct buffer_head *
_


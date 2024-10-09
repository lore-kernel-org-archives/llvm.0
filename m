Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936FF1684AE;
	Wed,  9 Oct 2024 21:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728509681; cv=none; b=RfqJy5LqMxCLN1FLSmmYW7OaBBAURp/YkjQ6xAqiFKpLw51hRodekaiWm/n1Cvk0c4CbB9eXagvbRgZVhIxLh36kS9JZtdxQrXNyopTQWIeciay/aHyolpzH6TWyc5JvMr/BLSePGe/6HxeI7IjuEXuvXT5yMLdBs/+2IKJ/KGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728509681; c=relaxed/simple;
	bh=AL/TAIuYwo9I9vylr0IBpxC01yZi40nGYC9ux9xmKqE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=h/jFADiH+SvFVW/5eL6FYVn2dhsRy6d9uPBgs7CoYlAkwZAeJD18de4zNn9VM0VTIAuLnqleELmJDkq5EvpARlpPedKHWA1KhdaRdiH50WKI0ockd4O0E0ADUWtHxTBkcvCYeQ2oeHbADTOH4kDMCgPct60JiqkYlu39ATT8G2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xN6+xbk6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xN6+xbk6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30B0C4CEC3;
	Wed,  9 Oct 2024 21:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1728509681;
	bh=AL/TAIuYwo9I9vylr0IBpxC01yZi40nGYC9ux9xmKqE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xN6+xbk6AbriEnMTCDyd+KOtGhVVv/qPlXBYjJsaQtNAlrbj6vM5GPFw8LcX8pFmM
	 nPtrgFZBCoubtJPNJaImbaQLO1f+pzB7nSdpL4oW66QnPp1PAKxIOGqhM0iDKORFT5
	 l6KXMEX0uKww2OCtOKTGH0jYm6qUxbgswaXx4IHQ=
Date: Wed, 9 Oct 2024 14:34:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [PATCH v2 5/7] bootmem: Stop using page->index
Message-Id: <20241009143440.7794c67db6406305730bb625@linux-foundation.org>
In-Reply-To: <202410090311.eaqcL7IZ-lkp@intel.com>
References: <20241005200121.3231142-6-willy@infradead.org>
	<202410090311.eaqcL7IZ-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Oct 2024 03:29:37 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Matthew,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on tip/locking/core tip/x86/mm dennis-percpu/for-next linus/master v6.12-rc2 next-20241008]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/mm-Convert-page_to_pgoff-to-page_pgoff/20241006-040239
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20241005200121.3231142-6-willy%40infradead.org
> patch subject: [PATCH v2 5/7] bootmem: Stop using page->index
> config: x86_64-randconfig-014-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090311.eaqcL7IZ-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090311.eaqcL7IZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410090311.eaqcL7IZ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/x86/mm/init_64.c:992:28: error: call to undeclared function 'bootmem_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      992 |                 enum bootmem_type type = bootmem_type(page);
>          |                                          ^
>    1 error generated.
> 

Thanks, I did the below.  

I do wonder whether we should be using free_bootmem_page() in the
CONFIG_HAVE_BOOTMEM_INFO_NODE=n case,

And in the CONFIG_HAVE_BOOTMEM_INFO_NODE=y case, the logic in
free_pagetable() looks quite duplicative of the logic in
free_bootmem_page() (which seems too large to be inlined).

My new free_reserved_pages() should be moved elsewhere so riscv and
powerpc (at least) can use it.



From: Andrew Morton <akpm@linux-foundation.org>
Subject: bootmem-stop-using-page-index-fix
Date: Wed Oct  9 02:16:16 PM PDT 2024

fix arch/x86/mm/init_64.c build with !CONFIG_HAVE_BOOTMEM_INFO_NODE

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410090311.eaqcL7IZ-lkp@intel.com/
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/x86/mm/init_64.c |   21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

--- a/arch/x86/mm/init_64.c~bootmem-stop-using-page-index-fix
+++ a/arch/x86/mm/init_64.c
@@ -985,21 +985,32 @@ int arch_add_memory(int nid, u64 start,
 	return add_pages(nid, start_pfn, nr_pages, params);
 }
 
+static void free_reserved_pages(struct page *page, unsigned long nr_pages)
+{
+	while (nr_pages--)
+		free_reserved_page(page++);
+}
+
 static void __meminit free_pagetable(struct page *page, int order)
 {
 	/* bootmem page has reserved flag */
 	if (PageReserved(page)) {
-		enum bootmem_type type = bootmem_type(page);
 		unsigned long nr_pages = 1 << order;
+#ifdef CONFIG_HAVE_BOOTMEM_INFO_NODE
+		enum bootmem_type type = bootmem_type(page);
 
 		if (type == SECTION_INFO || type == MIX_SECTION_INFO) {
 			while (nr_pages--)
 				put_page_bootmem(page++);
-		} else
-			while (nr_pages--)
-				free_reserved_page(page++);
-	} else
+		} else {
+			free_reserved_pages(page, nr_pages);
+		}
+#else
+		free_reserved_pages(page, nr_pages);
+#endif
+	} else {
 		free_pages((unsigned long)page_address(page), order);
+	}
 }
 
 static void __meminit free_hugepage_table(struct page *page,
_


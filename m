Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DBB2F50;
	Sat, 12 Aug 2023 15:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3+ESMhbm96WimS52OkHvEnLs1nYw3Ez3OO3wPujbXBE=; b=q2AXBbk+WdXXkLrN+JwFK5kLzg
	4qc0wNA0L5w46v/xe/nbN5eOmymuTs7R3HGQm1/AQ5PzsMrJpkAr7N6B/VlHbY1OHj6DpLTfiPjVh
	tJJtFcABoJi62eVlPAoUExtZRhzB9a4OZ4hoVupQQcoU48dAzU7KMA8OVMgaqLwJUFF/ZmJvWB7zE
	X7MdNiW8gxQCGiT9uQS36wCdP3YHCWF+MMdATqXkeDwoPE5vSGPgRy9Qzfre5W7uSt0gkW28PUz8f
	qyjoYlQWaQHGU7xn1Tn996v9i6nKye7MM5n3L46js703trFdSosQCM6ugbJYQwCmN1fE7+SsFzRP2
	MnlL29bQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qUqyY-008GOo-1G; Sat, 12 Aug 2023 15:56:26 +0000
Date: Sat, 12 Aug 2023 16:56:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [akpm-mm:mm-stable 219/240] mm/memory.c:5410:34: error: call to
 undeclared function 'vma_is_tcp'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <ZNerqcNS4EBJA/2v@casper.infradead.org>
References: <202308121909.XNYBtqNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308121909.XNYBtqNI-lkp@intel.com>

On Sat, Aug 12, 2023 at 07:40:10PM +0800, kernel test robot wrote:
> >> mm/memory.c:5410:34: error: call to undeclared function 'vma_is_tcp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     5410 |         if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
>          |                                         ^

This is a mismerge.  This patch will fix.

diff --git a/mm/memory.c b/mm/memory.c
index f06266464208..004b2e5dfef3 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5456,7 +5456,7 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	 * concurrent mremap() with MREMAP_DONTUNMAP could dissociate the VMA
 	 * from its anon_vma.
 	 */
-	if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
+	if (vma_is_anonymous(vma) && !vma->anon_vma)
 		goto inval_end_read;
 
 	/*

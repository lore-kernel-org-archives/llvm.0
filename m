Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6FC28EB;
	Wed, 11 Jan 2023 13:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cItd0bY8oSKhHtDYzW+0pBisbZrmS7bJcbFH1GTRgO8=; b=rpw7rC4ch4ZPQlmQAxYYWGufXX
	9VYUI5FeCcGREzOlPcqkuSr7kuR+EaFyfUlCPv9YOy0hPxIXMY0smxBket2gMg/AuyckJxFrC0S8E
	Q6S/9xiJ0ULS9dQ+WxWrUaJi0DdPZdrDCJNlo+dRcXPA9m0xTPU1VCtsa3wrpGV+YbaS/lJGDyKOS
	hbLI3t3N9lSMf0KVnLbJ6km0WLYe///8G+TIAZnUPWwnqAPlMmDEOtrPkgtR7+jacov+mHsKmjUE5
	rvbM2jtAYLX9nJOLRqR79KtOkAgu0Y6yqnQ6uGQSrc5ZtS3piiPSqmhsEJU5EeJYnc7pxdxPfvnS3
	fIu8c+JA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbON-004Ar5-2G; Wed, 11 Jan 2023 13:43:47 +0000
Date: Wed, 11 Jan 2023 13:43:47 +0000
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-mm@kvack.org,
	Shakeel Butt <shakeelb@google.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: Re: [PATCH v3 18/26] page_pool: Allow page_pool_recycle_direct() to
 take a netmem or a page
Message-ID: <Y769E3ZpCCuykk94@casper.infradead.org>
References: <20230111042214.907030-19-willy@infradead.org>
 <202301112022.zmClDxtO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301112022.zmClDxtO-lkp@intel.com>

On Wed, Jan 11, 2023 at 08:48:30PM +0800, kernel test robot wrote:
> >> drivers/net/ethernet/broadcom/bnxt/bnxt.c:2978:4: error: controlling expression type 'void *' not compatible with any generic association type
>                            page_pool_recycle_direct(rxr->page_pool, data);
>                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I swear I did an allmodconfig build ... don't know how I missed this
one.  I think I'll make the page_pool_recycle_direct() macro accept
void * as well, and treat it as a page.  Once we finish the conversion
to netmem, this problem will go away.

ie this:

+++ b/include/net/page_pool.h
@@ -485,7 +485,8 @@ static inline void __page_pool_recycle_page_direct(struct page_pool *pool,
 
 #define page_pool_recycle_direct(pool, mem)    _Generic((mem),         \
        struct netmem *: __page_pool_recycle_direct(pool, (struct netmem *)mem),                \
-       struct page *:   __page_pool_recycle_page_direct(pool, (struct page *)mem))
+       struct page *:   __page_pool_recycle_page_direct(pool, (struct page *)mem),     \
+       void *:  __page_pool_recycle_page_direct(pool, (struct page *)mem))
 
 #define PAGE_POOL_DMA_USE_PP_FRAG_COUNT        \
                (sizeof(dma_addr_t) > sizeof(unsigned long))


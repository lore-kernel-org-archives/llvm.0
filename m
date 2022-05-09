Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD301FAA
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 13:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BTWkAX27uDsyC4vbkOGDA43e2cUCH11HFcXPqJvTq38=; b=awER6OlTyq1mYQEExwvGUYw+4D
	lWQzXNQ+/jGS7ZpQrV6sXkNS6mi9eXaPYZLvAqQHZqOUj/1yub8lhIAxCrTDAGeUIgWmB8siFH/rx
	/pvAP14GNQiQPxPJY4XKvpqEDbKKEycfFFYOAQEcRDM42K/NKeBsJlXJeLHr6pP2jfzn27uubspLw
	bipjqgKe8Xo1L9fIJ/r4mpIxeJRRcQeaUlp9wUjsNdp44TuAuPY0nHgwYPrN0dHBEj0RRTBFI2AcW
	ZGYJohzAPUYd+xvr5xaYmkDRcSTNgY1n92uuEKZsdRaV7J4DX11Hj4CknTiU6VKTefvuI6w1Zy+0U
	UZmlp+MA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no3vP-003VWx-9Y; Mon, 09 May 2022 13:59:47 +0000
Date: Mon, 9 May 2022 14:59:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Tom Rix <trix@redhat.com>
Cc: hughd@google.com, akpm@linux-foundation.org, nathan@kernel.org,
	ndesaulniers@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mm/shmem: initialize folio to NULL
Message-ID: <YnkeUz0Z2O9Xd5O+@casper.infradead.org>
References: <20220509123116.3169267-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509123116.3169267-1-trix@redhat.com>

On Mon, May 09, 2022 at 08:31:16AM -0400, Tom Rix wrote:
> The clang build fails with
> mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>   if (!page) {
>        ^~~~~
> The error handler for !page jumps to an if-check for an unset folio.
> So initialize folio to NULL.

I appreciate you're trying to help, but the fourth report of a problem
adds more noise than utility.

https://lore.kernel.org/linux-mm/?q=shmem+folio

shows emails about this from the cgelbot, Dan Carpenter, SeongJae Park,
Colin King, Nathan Chancellor and Sebastian Siewior.  So actually you
were seventh, not fourth.

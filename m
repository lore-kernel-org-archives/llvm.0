Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803041872
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dckGfQg6kn3B8kgvZ3tmjZnRr1vtXFAdWVSiqcNmDYA=; b=keiJjIFniHCX8fhpO8BrWfQDwc
	+xwQ+qHC8BCpNgEg2qx+S8wZ+VcnIVxCEOzLW7uu9YnPWXq0b42uh0q3t+eU7qK8lkzHn6h1bRyT4
	5fuX4cbxHZOMZUyR6AvPIsD3dPFoIdurzgNlgXrBUlsq7k6omFSHZYKpDgKBubUgtBEtHkU8oL0fI
	BBC/20GSmImV6rDbfnfvkUcY/6HIZWRchyhtbiBA2Ry2dci/s6gs/skEvxajIz4wn6BadtenowyqF
	T8FMzdl5mqsVv0Baka5PlwujpKZoITJSPV3nqCJMKLcrkz82RlIk/O5sjH3SQdU2OzhH0x+LLt8/x
	Uibee0rQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pdyv2-000Ktv-20; Sun, 19 Mar 2023 19:42:16 +0000
Date: Sun, 19 Mar 2023 19:42:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Tom Rix <trix@redhat.com>
Cc: Liam.Howlett@oracle.com, nathan@kernel.org, ndesaulniers@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] maple_tree: remove unused maple_tree functions
Message-ID: <ZBdlmDVKdrtM4BXb@casper.infradead.org>
References: <20230319132903.1702426-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319132903.1702426-1-trix@redhat.com>

On Sun, Mar 19, 2023 at 09:29:03AM -0400, Tom Rix wrote:
> clang with W=1 reports
> lib/maple_tree.c:331:21: error: unused function
>   'mte_set_full' [-Werror,-Wunused-function]
> static inline void *mte_set_full(const struct maple_enode *node)
>                     ^
> lib/maple_tree.c:336:21: error: unused function
>   'mte_clear_full' [-Werror,-Wunused-function]
> static inline void *mte_clear_full(const struct maple_enode *node)
>                     ^
> lib/maple_tree.c:341:20: error: unused function
>   'mte_has_null' [-Werror,-Wunused-function]
> static inline bool mte_has_null(const struct maple_enode *node)
>                    ^
> These static functions are not used, so remove them.

No.  They're just not used yet.  NACK.

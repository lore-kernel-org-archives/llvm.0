Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249183FE6
	for <llvm@lists.linux.dev>; Sun,  3 Oct 2021 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bb6oxK0ETsJpDFUGrY5gmGOR2+a+l1AmXX+OJwTt1Po=; b=IlEMk0E8xa0+q0EqOi/61wBjvL
	oO0sL4LnbuJs/3s8+zVMo9eb7sWoNz/WgmJ8zi+0QgEL/ssXHvzUT/K1BW1S8wst4XNJuxgQIN04M
	fTIK2IgVon/pc6m9/66f1zo8GuuUspvoZxRofmmtQ3sOWyL4BV4moJCa5gcYN4e0riurJThPN5/e3
	TPIfWkwzSHBt8FlMe63MLpP/UyUlfAZlv6ZTwCML4moKS0SVFl9Lp1VYNCZpH7vcC5/yq3wGtxWz8
	sWPXbvDnDJZBOUYz/kHz8MUW6JVDYZeUHRqspkL2S9RJYryQ+oBmnzQpJ4n5miFTILDyKwNueslN3
	dCCEwO5Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mX1xA-00G0Nj-AW; Sun, 03 Oct 2021 13:55:07 +0000
Date: Sun, 3 Oct 2021 14:54:56 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nghia Le <nghialm78@gmail.com>
Cc: mike.kravetz@oracle.com, akpm@linux-foundation.org, nathan@kernel.org,
	ndesaulniers@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	lukas.bulwahn@gmail.com, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb.c: remove dead store in demote_size_show()
Message-ID: <YVm2MHbhEU0b7HPM@casper.infradead.org>
References: <20211003114113.109463-1-nghialm78@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211003114113.109463-1-nghialm78@gmail.com>

On Sun, Oct 03, 2021 at 06:41:13PM +0700, Nghia Le wrote:
>  {
>  	struct hstate *h;
> -	unsigned long demote_size;
>  	int nid;
>  
>  	h = kobj_to_hstate(kobj, &nid);
> -	demote_size = h->demote_order;
>  
>  	return sysfs_emit(buf, "%lukB\n",
>  			(unsigned long)(PAGE_SIZE << h->demote_order) / SZ_1K);

I'd suggest this function would look better written as:

	int nid;
	struct hstate *h = kobj_to_hstate(kobj, &nid);
	unsigned long demote_size = (PAGE_SIZE << h->demote_order) / SZ_1K;

	return sysfs_emit(buf, "%lukB\n", demote_size);

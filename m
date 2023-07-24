Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35497EC5
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 03:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rD2o03oywrQbl03nygg5NeYhEzEaqLbdSS7VHYFYy9w=; b=LfM3ELlrfQ44a5QhE4f8IlLt4J
	pqhy94V9ujXzJO0JWGNlp5zfCtXFBJ9LiZ18EudChMCbDbe5nkHDXLSZPFvUxtrNzYXiql0lz2abW
	juQHJ+qZCJGrxzjxANsYvrf0Dw9tr8odFnYLJf2JB9hN+WWOOGZV41VhTm7HIr8hjchcrfstkBjYr
	H3hMr6QW5fu0m6DOpnzFQ6k/nHyW65lEqps2Y3WRVHX7odGb3JiBDBAClo2elqw+kz+aK46uzpAYg
	0aIGeqmdUMr0bJD5kNMCr0NCKqULbf/jhR/JBMwz7aJwQOE79LjFbIAizyXnnl5T/+Js9GaGb7ysI
	39mBamkg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qNmXl-003x0r-9s; Mon, 24 Jul 2023 03:47:33 +0000
Date: Mon, 24 Jul 2023 04:47:33 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linke Li <lilinke99@foxmail.com>
Cc: linux-mm@kvack.org, mike.kravetz@oracle.com, muchun.song@linux.dev,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	dan.carpenter@linaro.org, Linke Li <lilinke99@gmail.com>
Subject: Re: [PATCH v3] hugetlbfs: Fix integer overflow check in
 hugetlbfs_file_mmap()
Message-ID: <ZL30Vaj8RYxmsF9o@casper.infradead.org>
References: <tencent_C2D6865561F23A8141BB145149ACC682B408@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_C2D6865561F23A8141BB145149ACC682B408@qq.com>

On Thu, Jul 20, 2023 at 10:49:52PM +0800, Linke Li wrote:
> +++ b/fs/hugetlbfs/inode.c
> @@ -154,10 +154,7 @@ static int hugetlbfs_file_mmap(struct file *file, struct vm_area_struct *vma)
>  	if (vma->vm_pgoff & (~huge_page_mask(h) >> PAGE_SHIFT))
>  		return -EINVAL;
>  
> -	vma_len = (loff_t)(vma->vm_end - vma->vm_start);
> -	len = vma_len + ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
> -	/* check for overflow */
> -	if (len < vma_len)
> +	if (check_add_overflow(vma_len, (loff_t)vma->vm_pgoff << PAGE_SHIFT, &len))
>  		return -EINVAL;

Doesn't this check duplicate that performed by file_mmap_ok()?  Can't we
just delete the check, or is there a code path that leads here while
avoiding file_mmap_ok()?

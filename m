Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72091FC0
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 18:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B90FC385B4;
	Mon,  9 May 2022 18:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1652119437;
	bh=RCqR7E+e88v1T6AamGxBpGhIcGsy4V7gM+0oan8ZkAs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Nc4O4PAMi8KjdjcpLV2zwGCVhL+a5FMfOdLsSBppvNtCRmUFWTooI0FQ3MmqTGRzJ
	 vhVa8CGKwPA0MXtJr7w4nmmW7ichDCxqXahhZapcWgE2rkfNPZDW1EBTclw10XRcQ3
	 Rh18x3oQfQHKYwOoRkzkv9HDn25eowcuD0JixPVA=
Date: Mon, 9 May 2022 11:03:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Tom Rix <trix@redhat.com>
Cc: hughd@google.com, nathan@kernel.org, ndesaulniers@google.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] mm/shmem: restore setting of page variable
Message-Id: <20220509110356.3c1826c6bf1fd6a4d6ce6766@linux-foundation.org>
In-Reply-To: <20220509123232.3428667-1-trix@redhat.com>
References: <20220509123232.3428667-1-trix@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 May 2022 08:32:32 -0400 Tom Rix <trix@redhat.com> wrote:

> The clang build fails with
> mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used here [-Werror,-Wuninitialized]
>   if (!page)
>        ^~~~
> 
> In the commit listed in the fixes, there was a change to the
> from
>   page = shmem_alloc_page(..);
> to
>   page = &shmem_alloc_folio(..)->page;
> But in this case, instead of replacing, the setting of page was
> deleted.  So restore page with its new api.
> 
> ...
>
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2334,6 +2334,7 @@ int shmem_mfill_atomic_pte(struct mm_struct *dst_mm,
>  
>  	if (!*pagep) {
>  		ret = -ENOMEM;
> +		page = &shmem_alloc_folio(gfp, info, pgoff)->page;
>  		if (!page)
>  			goto out_unacct_blocks;
>  

Thanks, this is fixed in v2 of Matthew's "Folio patches for 5.19"
series.

I've just now pushed all that out to kernel.org so next linux-next
should be a happier place.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E02F31
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 18:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8486C340EC;
	Thu, 17 Mar 2022 18:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647540741;
	bh=ptsC5nm9G0+/HpO2r1JMC/u3+Be4YpkP+sY3ZGfaKX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taDGPQeN1d7NfJA3qzPxO6Y7dfOE1qEoYvpRJv/gS/c/qiwWVW5ZEsLeIfMcIoOW/
	 laACJSlK3GfYaHQsI5R74RHg+FHV2pI2cH1yETuXuFFx8k4n/fiS+z58gzzO9+vMto
	 Sywx002tz5Cep4ec75DZ7erbXcp6afH2glZc1f88xjNJr9xlLHXINvL7RI+UD3LyTT
	 wPNqUavD77VDBF1kyMWvqaf3xaLhfIY+5Czf+ImbD/v+WELkdI1Kb3TfRzuznfModa
	 gQk63+GRKrxiQjjPux56AB0ZhEIIpEZMBBSOHBlzvCZiJdIxVt+z60dKKamVcXF3sL
	 t9TdlTKKNdy9Q==
Date: Thu, 17 Mar 2022 11:12:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: trix@redhat.com
Cc: konishi.ryusuke@gmail.com, ndesaulniers@google.com,
	linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] nilfs2: move initialization of nr_dirty to decl
Message-ID: <YjN5/h+0fR6Ph/5H@dev-arch.thelio-3990X>
References: <20220317175043.1972081-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317175043.1972081-1-trix@redhat.com>

Hi Tom,

On Thu, Mar 17, 2022 at 10:50:43AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> On clang build there is this error
> inode.c:227:13: error: variable 'nr_dirty' is
>   used uninitialized whenever 'if' condition is false
>         } else if (ret) {
>                    ^~~
> 
> In nilfs_dirty_folio(), if the call to
> filemap_dirty_folio() fails and there
> are no buffers, nr_dirty will be uninitialized.
> Move the initialization out of the buffer
> block and to the decl.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

This has been fixed in next-20220317:

https://git.kernel.org/next/linux-next/c/af7afdc7bbbe60cb6ce51a86b022d647e1a72717

Cheers,
Nathan

> ---
>  fs/nilfs2/inode.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
> index c1219c0678a57..01e58b65c9384 100644
> --- a/fs/nilfs2/inode.c
> +++ b/fs/nilfs2/inode.c
> @@ -204,7 +204,7 @@ static bool nilfs_dirty_folio(struct address_space *mapping,
>  {
>  	struct inode *inode = mapping->host;
>  	struct buffer_head *head;
> -	unsigned int nr_dirty;
> +	unsigned int nr_dirty = 0;
>  	bool ret = filemap_dirty_folio(mapping, folio);
>  
>  	/*
> @@ -214,8 +214,6 @@ static bool nilfs_dirty_folio(struct address_space *mapping,
>  	head = folio_buffers(folio);
>  	if (head) {
>  		struct buffer_head *bh = head;
> -
> -		nr_dirty = 0;
>  		do {
>  			/* Do not mark hole blocks dirty */
>  			if (buffer_dirty(bh) || !buffer_mapped(bh))
> -- 
> 2.26.3
> 

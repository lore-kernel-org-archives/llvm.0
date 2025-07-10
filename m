Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F4F27056F;
	Thu, 10 Jul 2025 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157600; cv=none; b=tquse+4UOr1qE8RyuuUZmAssnzcBVMjnwslpidDYidfZ3ryiBO+WOYBtZ6vbBlTd/n0DEMMYZgh6Qh0DZhejEmMPjWzfGlTGXq7yG75ix4jNxu0K/hE6gyGc8hyKxkek5b5ljSLYG7g1y7Wp1ACR59fg1aN4LgxCjncleklPzoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157600; c=relaxed/simple;
	bh=y7y/n/lbP5p1Mhyo9ICE4LSsULATO697OeoGKbocUjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAtPV7t9p/J6/bBdIeP3PEEXsVSytLOBUzmFBVcPXuZR0Ay77YTsOm/QdoURZ34pruqAWqfUrX7ic+wVHtjkjgaDepn5x1hgBPEdwcqzGHtNlNt0mmWiDlysd8LIWFQsaLMqQoKoZdgelzk1ttb8bcEk4xiSJVwID7Z/n5tXHS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lsuph2be; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lsuph2be"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF374C4CEE3;
	Thu, 10 Jul 2025 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752157600;
	bh=y7y/n/lbP5p1Mhyo9ICE4LSsULATO697OeoGKbocUjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lsuph2be6bg2CFbf17Rfua5VksJBwoAzCeLeQ1M+JRZHzOGlYLjNUcL2DuORoCAdU
	 Xw0SVuenvn865tAx4xupjM282/sd8HiyWbG5mViQbmtjgSpm+vC85LZfbMYsVyYIG8
	 3EwrFdDlakeamY21LaV+8/MxeR6vnBLhWoxDE0c7K7sgG4lXZFn/6HHSsiH6l9XrcS
	 sius+4vVDqlRFtiknj2wJSG6MR0Tqttot7pJOg8zvxc3rzhaR0Jt5gJiyjZP1m0mLC
	 mEMWSRK1DGf98OYRVqXDPY4dL8cbn+9gcAbKJfz5WwLJaDNYZBaRIOpCeZGkRxReHw
	 nfvicmcvcrCaA==
Date: Thu, 10 Jul 2025 14:26:38 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [jaegeuk-f2fs:dev-test 65/93] fs/f2fs/data.c:58:56: error:
 passing 'const struct folio *' to parameter of type 'struct folio *'
 discards qualifiers
Message-ID: <aG_NntbzliX0WUGB@google.com>
References: <202507101412.50ND2WEX-lkp@intel.com>
 <aG_Gr8NvCiXC4SyU@casper.infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG_Gr8NvCiXC4SyU@casper.infradead.org>

On 07/10, Matthew Wilcox wrote:
> On Thu, Jul 10, 2025 at 03:17:28PM +0800, kernel test robot wrote:
> > >> fs/f2fs/data.c:58:56: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> >       58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
> >          |                                                                      ^~~~~
> >    include/linux/fscrypt.h:527:67: note: passing argument to parameter 'bounce_folio' here
> >      527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
> 
> Ah; I changed only one of the definitions of fscrypt_pagecache_folio.
> 
> Jaegeuk, can you fold in this fix?

Will this break ext4?

In ext4,
		struct folio *folio = fi.folio;
		...

		if (fscrypt_is_bounce_folio(folio)) {
			io_folio = folio;
			folio = fscrypt_pagecache_folio(folio);
		}

> 
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index b334c0538864..8d9127a0fdb3 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -524,7 +524,8 @@ static inline bool fscrypt_is_bounce_folio(const struct folio *folio)
>  	return false;
>  }
>  
> -static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
> +static inline
> +struct folio *fscrypt_pagecache_folio(const struct folio *bounce_folio)
>  {
>  	WARN_ON_ONCE(1);
>  	return ERR_PTR(-EINVAL);

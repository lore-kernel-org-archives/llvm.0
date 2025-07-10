Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796F2AE6D;
	Thu, 10 Jul 2025 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752166200; cv=none; b=ERLvKZrwK6TG5Ji1NT9muZF5/EoE4ovFvw05qb0E/riRmf9ZtuV2FqW4B5Slo4LLKiMeJsFPpkrysl4RLFU8OcQqhSTh5Gg+jkGuJceMPVzMi0S7BWXPLfTbkNFm8C4opxE6YpMc2wu0ZOyZXhUpwic+VIiObcoPNrKup2r6UXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752166200; c=relaxed/simple;
	bh=JVj9M6MgpqewVBEwA0OP1aljQ7ZGI8h2W8JgEbZoNUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfNp/9prUjyhVcLdXWMXtdZQPwxC7q3FYi4V6Y4pyfWdb+SCSwhoMfTEYae1noEaZS0jwMwJW4I0es/1gVGLtsciTC7MUAsHlDWZPuLnHuA/xQcCokzLil9AZnAQ06+ZzV3pDDyEl2uOA1SaKzuPZqg5+xtyqPnl14xWk/Tp+Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5eAFo5p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5eAFo5p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A2AC4CEE3;
	Thu, 10 Jul 2025 16:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752166200;
	bh=JVj9M6MgpqewVBEwA0OP1aljQ7ZGI8h2W8JgEbZoNUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5eAFo5p5SaWk1oMn2iYC8SqySF+GQXtvYVhHxV4aJ9WNAiGBYQQiaWY7NInL//2/
	 jOwdCz9zZuC6ikRdusvNsJALjpoBJt2Pm30YEa7gbu9NkfbDu0ZlPwKcwEwkbA7+V2
	 SYI7R8AN9FZdu71dLc7eyEk7v3VxgPJ/HmduCDr19Gj+ATWeuopBCXv7/QaIFmwNdH
	 EgL5QQDb6qnY2W5/LkZNgJVoLpa+CTgo1HFEEQ7EydpJUelVN2hQlB6UcGes0PQk8m
	 gK/0IUeAm25EBVhM++Vp2/HQOQJN5Hx/Cl9/S/CqOlPdyRPAaA++M0ggMTmKSAyoEM
	 BH/X6zhJZwmZg==
Date: Thu, 10 Jul 2025 16:49:58 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [jaegeuk-f2fs:dev-test 65/93] fs/f2fs/data.c:58:56: error:
 passing 'const struct folio *' to parameter of type 'struct folio *'
 discards qualifiers
Message-ID: <aG_vNmvrnLGVCXzj@google.com>
References: <202507101412.50ND2WEX-lkp@intel.com>
 <aG_Gr8NvCiXC4SyU@casper.infradead.org>
 <aG_NntbzliX0WUGB@google.com>
 <aG_ZQYONhf9UQJDq@casper.infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG_ZQYONhf9UQJDq@casper.infradead.org>

On 07/10, Matthew Wilcox wrote:
> On Thu, Jul 10, 2025 at 02:26:38PM +0000, Jaegeuk Kim wrote:
> > On 07/10, Matthew Wilcox wrote:
> > > On Thu, Jul 10, 2025 at 03:17:28PM +0800, kernel test robot wrote:
> > > > >> fs/f2fs/data.c:58:56: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> > > >       58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
> > > >          |                                                                      ^~~~~
> > > >    include/linux/fscrypt.h:527:67: note: passing argument to parameter 'bounce_folio' here
> > > >      527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
> > > 
> > > Ah; I changed only one of the definitions of fscrypt_pagecache_folio.
> > > 
> > > Jaegeuk, can you fold in this fix?
> > 
> > Will this break ext4?
> > 
> > In ext4,
> > 		struct folio *folio = fi.folio;
> > 		...
> > 
> > 		if (fscrypt_is_bounce_folio(folio)) {
> > 			io_folio = folio;
> > 			folio = fscrypt_pagecache_folio(folio);
> > 		}
> 
> No, you can pass a mutable folio to a function which takes a const
> folio.  Just not the other way around.

Ah, I found it. Applied the above missing change.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=70e71e8a0099d27857fdb9178187e72513d72141

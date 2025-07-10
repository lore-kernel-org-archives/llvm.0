Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF8122425E;
	Thu, 10 Jul 2025 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160583; cv=none; b=gqufOIrav/5L1KtRwoFvZYk5YOAzSkiVB6C491XM2w0YBNNut748LMahuUUF8au4aJkS9xOWhiYZP2x8nmIVN0rZT3HEyV4uQS6U8cUsPMnW2o/8m05OketRlkrOfLtMnYgBQE9qavcON7BEhIUDABpZYQWr383gPPj9/DqzTGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160583; c=relaxed/simple;
	bh=yROu58Br3qq2QRS64bJf412B99IwKMH7TzmSgOCgMV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqtllrUMRRm9GjbaHJBFDG0gFn7TVOO0mQdldsZ7NEf1FlUpUrwS1LEe0IU7KHo764uLuRVEZMendJusxHxVnwkoYeGoSdz/ycfvEg8Hh488pal+gi7XYZvoJPXg3UMqmr4cun/uRLZRNjef+7a6jwwbFLCVmzvEfR2+Zl01pwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bKn1V6oq; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bKn1V6oq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dCyye3w36JnUFiPIq95/oWrAw2cPUnmqpcC331RPtaI=; b=bKn1V6oq8IRD2nhci8CIPiHFMX
	G11Y0urNFT3GBPLjgs0IEKnFVv2GNn0v39ayvH371pC3fRAR/9cUFvJkg5+bpXFWcJrGjcfS9R3zU
	jcBrQPxgBtnPImqTQAZUqgq3rZHeZWA310FXAJPTlq2qdyibN9RSHPxZl97QXsi0pO8oIMlXx43B0
	XCOT5O+dEvMMJ9j0pN5vl6TTslHLLFG+r0cpvJzyptrXhlFDZXo7HJqr7QwTuXFD/B0afnknpVmQi
	tdQzAM41NyNzncADRjh/PUGMjdmaEdXr0XqF0ubiXPUWtYVQpRb2lEVp0OXYIlY4DqPMPGhqVL2r8
	haf4u0UA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZt0T-00000009N9c-1d6B;
	Thu, 10 Jul 2025 15:16:17 +0000
Date: Thu, 10 Jul 2025 16:16:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [jaegeuk-f2fs:dev-test 65/93] fs/f2fs/data.c:58:56: error:
 passing 'const struct folio *' to parameter of type 'struct folio *'
 discards qualifiers
Message-ID: <aG_ZQYONhf9UQJDq@casper.infradead.org>
References: <202507101412.50ND2WEX-lkp@intel.com>
 <aG_Gr8NvCiXC4SyU@casper.infradead.org>
 <aG_NntbzliX0WUGB@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG_NntbzliX0WUGB@google.com>

On Thu, Jul 10, 2025 at 02:26:38PM +0000, Jaegeuk Kim wrote:
> On 07/10, Matthew Wilcox wrote:
> > On Thu, Jul 10, 2025 at 03:17:28PM +0800, kernel test robot wrote:
> > > >> fs/f2fs/data.c:58:56: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> > >       58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
> > >          |                                                                      ^~~~~
> > >    include/linux/fscrypt.h:527:67: note: passing argument to parameter 'bounce_folio' here
> > >      527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
> > 
> > Ah; I changed only one of the definitions of fscrypt_pagecache_folio.
> > 
> > Jaegeuk, can you fold in this fix?
> 
> Will this break ext4?
> 
> In ext4,
> 		struct folio *folio = fi.folio;
> 		...
> 
> 		if (fscrypt_is_bounce_folio(folio)) {
> 			io_folio = folio;
> 			folio = fscrypt_pagecache_folio(folio);
> 		}

No, you can pass a mutable folio to a function which takes a const
folio.  Just not the other way around.

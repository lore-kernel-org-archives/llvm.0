Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02321B196;
	Mon, 18 Aug 2025 12:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519347; cv=none; b=MiyIJxj9Z0BEdBQ28Mka3WLxkVHy4nVA0CGgMra+8OjG36f5ybYUaOvdRhFhjI2icQZnxpncthfmypCx0rLRnE6LbXZj+hltyP8IbIiWi+qOV9U2sHgO78VuVQm2N9cxk/YKXHm5KluNu3brVqTPq2ia75Y4cJvvWgpMxQrE75Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519347; c=relaxed/simple;
	bh=aiuiv/mgmpzUDebgFGNRRH8uoqVUPnbLKXLGW4JYmLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlOP0I7jsSGtSSOjd5zFYN8M9hr9K4NYoAZPQQ7Vs+gMCPO2kbhiWqN2biT6GpRoagfbtfWZNhlx7ntKVOOkPaVG4sHedQ58NjvXmS9qp2PwLRpwgTbZbLzzQjUF66825NKd8DMCgLZxMqpFkB1Qimy/moUIi5TQ4OVlxTC/bzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qAY4WqD7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qAY4WqD7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XKIyrvFr1ktn3DGEI4ZXxd1B671yEcSeAAYlQV3Mq5c=; b=qAY4WqD7Hem6x3+hBtdRuHIR/l
	U2lwkA9MuICuo4dxGoN7hFzJwJPKC80e10V8EMpEF1AFSgW7J8EymNddlMQPxzq8Hwf1kxeWkukMJ
	EPjHHHgV2l0meRkjyoCTTkCUt/rXtQGcZZskdWGC4iqJIeKNS0ic8BbFoV/RwD2n91SpAaSueXHEW
	K+XmzA2DlCrJTnQuOqA50BzFAa/UAm27Nd8PDtrs3tfZLYGMfqrP9B+KdSW2kd/UHxofdKhuW032l
	gWbXfNf2NqsPYO4zKGVsLhpJS6yCc6XAeCdcVL2HL41ez1u19mt8lbgOu7TUIt6YeuIgrE/lTRBbZ
	WVbWSsew==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unym6-00000005eRR-1rob;
	Mon, 18 Aug 2025 12:15:42 +0000
Date: Mon, 18 Aug 2025 13:15:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 166/188] arch/arm/mm/flush.c:307:41: error:
 incompatible pointer types passing 'memdesc_flags_t *' to parameter of type
 'volatile unsigned long *'
Message-ID: <aKMZbtsa4msTYAuo@casper.infradead.org>
References: <202508181807.zhZF5TQ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508181807.zhZF5TQ0-lkp@intel.com>

On Mon, Aug 18, 2025 at 06:17:13PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   dd1510cefdfec9dc3fa2bae40e0f16f1bf825567
> commit: a2004477b3282318589bf43a786d952856adcaee [166/188] mm: introduce memdesc_flags_t

I've had this commit sitting in
https://git.infradead.org/?p=users/willy/pagecache.git;a=shortlog;h=refs/heads/folio-page-split
for over two weeks now.  Are you no longer testing pagecache.git?

(the fix is trivial, I'll send it)

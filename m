Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBAE4A1E;
	Mon,  2 Jun 2025 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876415; cv=none; b=pwqcRvmyrN71urbh1WOHgzyLNZRuGZLeSZpoax4QCERXkD5sfJ8qhzRHk5i34jOnBYa7T8ZCrjzbRal3oua34iY2/O7nx3DjAlU/i6G0hc7RPfFoVu/G+Q3y8PG++GL+OpxhX9hAIdyx+QmzVO51WDzpjV4H+sNt679f1oV5KnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876415; c=relaxed/simple;
	bh=zQWKTso08UDY8K/VdDHRmdT+dIpdNkIfAwjX9nKRicg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FY8Dr8wJHmV9ykX646IEuxiMVAnm0b2ne00yBRElFgOThu2QMHoi165Xldt24O00ZqnkhIEdXrl6i1E/uC/aq74QAmWqOXMUN/imq4qAjtUgRBEETk4Vr4JtL2xK25r6D7srISU9UcWhKYsCRhrGF9aqV6ACfb9UyKl9DQ45nUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SMZqm94O; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SMZqm94O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wZU0q2qd8iM8LNYMxrJYiIGJaXB9dPlmQ4UCRjI96Lo=; b=SMZqm94OvGuGZxtFt1URU+rUbh
	IyAlaIRVHH9SEnQwKJlFs5GuPSyUXee1KaWOF3KkMPP5wYXkUJQ+iW4Hkbqm6fCQW1OBXUIeWtali
	wtvmf8X9bc64Akqs87O6gXh5j1AgPDuWt9AbY61PgzOohJ/w0qOLCSQ77Fg+ouVKq7ctyOEqhKdDe
	umvVc1c4HxRsuZsCrv0YRA6LtSdiJb8VYPSePSiPcQF7EO9xLK2ZGQKmUSBeD+VIsrgJgnoLfBXLv
	aArAuNDt/ToAatPCVi1GcjGq97WXE7rBgz2V9CXfU6iVDksGr9DQkB8idjqohyvwjMHG1SmeR5NYF
	XjMiwK9w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6e3-000000011tc-2LKz;
	Mon, 02 Jun 2025 15:00:11 +0000
Date: Mon, 2 Jun 2025 16:00:11 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-stable 290/329] lib/iov_iter.c:474:7: error: call to
 undeclared function 'folio_test_partial_kmap'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <aD28e-twOPaE1Yin@casper.infradead.org>
References: <202506022027.IYQzZghL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506022027.IYQzZghL-lkp@intel.com>

On Mon, Jun 02, 2025 at 08:12:44PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
> head:   0b43b8bc8ef88bb45b018b2d4853d38bfc5ce2a7
> commit: d9736929445e7f4c60f0093af61ff0b52e2d4412 [290/329] iov: remove copy_page_from_iter_atomic()

Thanks!

> >> lib/iov_iter.c:474:7: error: call to undeclared function 'folio_test_partial_kmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      474 |                 if (folio_test_partial_kmap(folio) &&

It looks like mm-stable is based on the wrong commit.  It appears to
be based on v6.15-rc6 while folio_test_partial_kmap() was added during
the v6.16 merge window.  While Linus' tree will never fail to build,
anyone ending up on this branch due to a bisect decision will find an
unbuildable tree.

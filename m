Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BB75660;
	Sat, 27 Apr 2024 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714232477; cv=none; b=MwC/wyeYWYgpvyo5yNq2oNDC4kq9UsoSH0/2IuihAxc8CLt+1a2Mc3IWGFjH+nVOkcOmz2LsRB9IX3fw6chIPPuLRdIDYHfwGq6tfB3nAUkPO46Y1o7E9QyxT7g4IiHjAPPwYr28uVdooMXuQn8dFbFGLE3DZs83EVDdFNoFgQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714232477; c=relaxed/simple;
	bh=cDZ/YZrJdhpH8oV3aKZpwQqURWbg5YebmaBtmSpnGvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qtt5ff4ZF+lpX0E77DiP1Udvwx+CFnfkmPRnOfPgLWPqXFGe+VaSdwEd+KwXHgLOoQYw7xoyrx8hwjvBMkLLBUAf2JRM5rTkK0fL9Z7y2YE1Ut3VhfyQSsAGKriJEhfAUK/hUrHtlwzmGkntq49dRGEAp5wdyCl/vDXm1MDXpyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ekWvrT/6; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ekWvrT/6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aW42jJP2mA2HtrF1gAeKltBftLD6Bobro6syAcuet0Q=; b=ekWvrT/6oWvYa+lSD+e76K/EeP
	6aZoNldIe04BFpTVeaWNk+cP9jQiOZ73EEygCTd1CMqQwBXHMa2Z3VuCeSYOWviAxHLcHfkOgYPGi
	2PaCN4Hh4DfOwcWWIXpD3LFLuPKv8aodKcOmxlntNttJxRea9lgMki2LB5NGfX3mgebANJM5YWfhH
	qAkVhINTno5Zhvde/7R+85Cf5pWOUN0a6qPC9Q74ehaER7D4edqPfjCAqyi923pxjlTn16tqh+qXr
	q5B0vpxFxgTmRsYIELRLPIuNnwp2Kfk+xY82LnfucGMTIB5916lCmr1Iigs5uJBRzDNDbafvt63a6
	PxrEi7Jw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0jmr-00000007iR2-2iGY;
	Sat, 27 Apr 2024 15:16:25 +0000
Date: Sat, 27 Apr 2024 16:16:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [akpm-mm:mm-unstable 457/479] arch/s390/kernel/uv.c:196:13:
 error: call to undeclared function 'page_mapping'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <Zi0Wye9tY9bofWKh@casper.infradead.org>
References: <202404271523.VI3HNl2M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404271523.VI3HNl2M-lkp@intel.com>

On Sat, Apr 27, 2024 at 03:54:08PM +0800, kernel test robot wrote:
> >> arch/s390/kernel/uv.c:196:13: error: call to undeclared function 'page_mapping'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      196 |         } else if (page_mapping(page)) {
>          |                    ^

Gah.  The removal of page_mapping() is in the s390 tree.

commit 259e660d91d0
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Fri Mar 22 16:11:46 2024 +0000

    s390/mm: Convert make_page_secure to use a folio

But we don't want that kind of dependency between the mm and s390 trees,
so perhaps best to just drop

commit 48f0b417c0fc
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Tue Apr 23 23:55:37 2024 +0100

    mm: remove page_mapping()

for now and we can submit it shortly before -rc1?

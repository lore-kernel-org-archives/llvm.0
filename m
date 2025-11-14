Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2012DECCD;
	Fri, 14 Nov 2025 18:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763146497; cv=none; b=PjaftuNJ0uRU6ENSub96Utu7/dUiRn6ViwckavH7u6pRP5a5/qmUo/wpRTSX8vVuQuhRYhLHXZn1q2w2xNc4+UmDJYoBksZzvQaSIIo6h+FmTwjcxdNR0yju12i9MZeT/a+U5D5lxp9CYdbg9GgUuMliFiSvC6JCg2yU8B66tzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763146497; c=relaxed/simple;
	bh=Ox6QqPFoCd7IzVp3NR1hYBKfNcqogOAQNRvJrZ2v9P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzrBiABkE83kY4NLkeJBeLsbLtdJDh1WrL8UFKCeht3q4u9EeV/DCi54d+9QTVnDbk6NiSdR/OeyfvLFJGiQoAO7mR0zce+6Qj5qKWmqq4hje/6ZxdrvwnI4AjVkjtx0RVMxwRJzx1HQrzpOfnKl22BC4yv+mTv+kEV/ySSPVXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EXyj+jX/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EXyj+jX/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BSZ7Nwx1AvWu7mAZVmuradqomXtKIHLL0ikfemFoO2w=; b=EXyj+jX/BCty3AsVD6q8QioIyM
	2Tu4hXDLT6tK2iLl7v3D8NpDemFXta54A9KS5c/9JTbl/kaYZYgeBcKsuY3S69miBq2y4AXmAv2bL
	YQD4NgIM7YIim3b0UHSaUhNRz/WimQx7WxGquDaJwIo7MVXyCTLDLjft8/UOa06x5up7w8+pMGpSw
	y68/Lux4D98y4TT/21m/3RbtLpiIPdbbkbKvR1UMPg15Onw3LD/mL7F2ndcPS9PxptjRtDtDfcio6
	/OGLs9hEtShvsTvCwTvfTocOLOwo5T+6WGd0vxdCn+uu4DRkTSGzyn6Pz7xZpcmyTbVwWnoXBj/An
	lkpE5YmQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJywa-00000009mlh-00u6;
	Fri, 14 Nov 2025 18:54:48 +0000
Date: Fri, 14 Nov 2025 18:54:47 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [akpm-mm:mm-unstable 36/283] mm/hugetlb.c:4753:18: warning:
 implicit conversion from 'unsigned long long' to 'unsigned long' changes
 value from 17179869184 to 0
Message-ID: <aRd69_c1pULRoKOU@casper.infradead.org>
References: <202511141140.LrrRrtIv-lkp@intel.com>
 <20251114182956.GD2566209@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114182956.GD2566209@ax162>

On Fri, Nov 14, 2025 at 11:29:56AM -0700, Nathan Chancellor wrote:
> > >> mm/util.c:1263:16: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 17179869184 to 0 [-Wconstant-conversion]
> >     1263 |         if (ps->idx < MAX_FOLIO_NR_PAGES) {
> >          |                       ^~~~~~~~~~~~~~~~~~
> >    include/linux/mm.h:2104:36: note: expanded from macro 'MAX_FOLIO_NR_PAGES'
> >     2104 | #define MAX_FOLIO_NR_PAGES      (1UL << MAX_FOLIO_ORDER)
> >          |                                         ^~~~~~~~~~~~~~~
> >    include/linux/mm.h:2095:36: note: expanded from macro 'MAX_FOLIO_ORDER'
> >     2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
> >          |                                 ~~~~~~~~~ ^~~~~~
> >    include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
> >       56 | #define SZ_16G                          _AC(0x400000000, ULL)
> >          |                                         ^~~~~~~~~~~~~~~~~~~~~

Clearly this is a 32-bit build, since otherwise a conversion from
"unsigned long long" to "unsigned long" is a NOP.  But 32-bit cannot
support 16GB folios!

I say this is a bug in powerpc32's config.

#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
#define MAX_FOLIO_ORDER         MAX_PAGE_ORDER
...
#else
#define MAX_FOLIO_ORDER         PUD_ORDER

(PUD_ORDER is 16GB, so I think this will be what's being picked up)

but the only place the mentions ARCH_HAS_GIGANTIC_PAGE is pretty
clearly dependent on 64bit ...

config PPC_RADIX_MMU
        bool "Radix MMU Support"
        depends on PPC_BOOK3S_64
        select ARCH_HAS_GIGANTIC_PAGE

so I'm a bit stuck about how this comes to be.  Adding the PPC people
for thoughts.


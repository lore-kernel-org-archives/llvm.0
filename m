Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E9A1BC58
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 03:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756870842; cv=none; b=KnS7pEKzVyx03rA5EhdZVQS9+5fp2lk6keD88OvPjU+Qb+xJ+FOu4pV4jHuz/mcn2zFTao6UHc4mWo+wGXvlOuOu+4K20IiOuvlQKH8WIZsOF00IcDwGcxv7ZkhW85l8uyUy2nb/zgHCpTlfQNE9GQhgWzx2qFe2VZ3E3FoeKFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756870842; c=relaxed/simple;
	bh=PZgjvwj0OFeppMHhIxBFtZfeiloPnVqelWd+nX8OLBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuoZlLbkpNSzBeU3My869LEgCs/ykVwZKlkET6xzF57YMr9I5Wjdw2azx8m+w+2nJDXNrA8ih5SiU3pFjJ9id+c5MK+Njo7CVoct49lCKxbXh7mFzbN6xm6Ty8r1pBzkxJtRHe6aZQuRWcbZbctnaCZUud7A7drf5uTpa3piEV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KtGZM1kk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KtGZM1kk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xS4AE9kCT2ByAtc0cNk8ehmD8+ovn4l5cjIeWujc7Gw=; b=KtGZM1kkX55R0FgrR4kaOTAzRl
	bJaTOVMEshIttRJDIvRajsiDF8KhksF9ZLCQFY7X+dEQ1m5r+16j9o1dIKd3EMZkUGdr/H+D84RkS
	/gD8lY0x86l5ndk81qnA66OTKJo3a0QAuW1szZApVitCkpOqP8CPDXeGNbophgK4UZ3RjH1680s5p
	KkozDrnr5YzNCx4LhwOeFWFvxytelYkBdSn/IWsfaby2ZlanltvZ5H2KvJGDWQh6gvutMWmLAlVh/
	1dMgEBFM4rViBQh6E+fp2XG8z2F+4ux9SYn+73bg2eE0u2ntViYMC7XEn9DeCdrHNOOFGlyIS/PSj
	qXCohDtg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uteMJ-0000000Eh4P-1FE8;
	Wed, 03 Sep 2025 03:40:31 +0000
Date: Wed, 3 Sep 2025 04:40:31 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: clang-22 -Walloc-size in mm/kfence/kfence_test.c in 6.6 and 6.1
Message-ID: <aLe4rwzXhnypHSSm@casper.infradead.org>
References: <20250903000752.GA2403288@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903000752.GA2403288@ax162>

On Tue, Sep 02, 2025 at 05:07:52PM -0700, Nathan Chancellor wrote:
> Hi kfence folks,
> 
> After [1] in clang, I am seeing an instance of this pop up in
> mm/kfence/kfence_test.c on linux-6.6.y and linux-6.1.y:
> 
>   mm/kfence/kfence_test.c:723:8: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror,-Walloc-size]
>     723 |         buf = krealloc(buf, 0, GFP_KERNEL); /* Free. */
>         |               ^
> 
> I do not see this in linux-6.12.y or newer but I wonder if that is just
> because the memory allocation profiling adds some indirection that makes
> it harder for clang to perform this analysis?
> 
> Should this warning just be silenced for this translation unit or is
> there some other fix that could be done here?

I mean, it's defined behaviour:

        if (unlikely(!new_size)) {
                kfree(p);
                return ZERO_SIZE_PTR;
        }

so we have to have a test which checks that it works.

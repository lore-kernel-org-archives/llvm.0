Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D882D90;
	Mon, 29 Apr 2024 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714409193; cv=none; b=VgXksgnmn/vj/irXsNfTJr5BiDmz7qQ4Xn3iEv7FWsQrZZvoHJrtggpcJAPh5fxKEWox4zIZVOoVg5NZADSLwE/7hv7Yug9tNqwodBpvgVf4cZBFhwZ95XUPj+RDHVmikSpuszdp3nlphRLzz11HgMQajBN+489XtpGf7dko5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714409193; c=relaxed/simple;
	bh=gJqMKCPyVA6XrnPQ8J7WUnLCNkaL7Jv2ZuHUH2u08/E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=K8nRVS0Zv1O2fG5EmwF0ZjVHYkSlGl6hnbGvbSLSFOmVOMpspyrC8xjLb/2JQryUOL3O7J1mCgz0B37AUo8N2INbqfrUAiLJOhiPWgaiBMS1DO9+AUuI/v4It4SlFqaYlElM1Q+RnoaunaXGSjcC70pwjT0tQFUXq5M+E9CMWig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OQUZHXdZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OQUZHXdZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07E4C113CD;
	Mon, 29 Apr 2024 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1714409191;
	bh=gJqMKCPyVA6XrnPQ8J7WUnLCNkaL7Jv2ZuHUH2u08/E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OQUZHXdZfuHYGgfV2iOnEwqATt/Fl0MrhUt5X1fXYnabRcd5G1pWPI1rHclJbG2YD
	 FWjAbCCa0ivDhMpF/Len3ymzNoJcO8rOB8N+qvBTYBLbmdXlN7NoYegLug+IpYtU04
	 9nB17qghl7N4QlbIdsI9WjNSoQBFiLF4JAiXCF8M=
Date: Mon, 29 Apr 2024 09:46:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, David Hildenbrand <david@redhat.com>
Subject: Re: [akpm-mm:mm-unstable 457/479] arch/s390/kernel/uv.c:196:13:
 error: call to undeclared function 'page_mapping'; ISO C99 and later do not
 support implicit function declarations
Message-Id: <20240429094629.77c77ebf0ebb7c4197e8880d@linux-foundation.org>
In-Reply-To: <Zi0Wye9tY9bofWKh@casper.infradead.org>
References: <202404271523.VI3HNl2M-lkp@intel.com>
	<Zi0Wye9tY9bofWKh@casper.infradead.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 27 Apr 2024 16:16:25 +0100 Matthew Wilcox <willy@infradead.org> wrote:

> On Sat, Apr 27, 2024 at 03:54:08PM +0800, kernel test robot wrote:
> > >> arch/s390/kernel/uv.c:196:13: error: call to undeclared function 'page_mapping'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >      196 |         } else if (page_mapping(page)) {
> >          |                    ^
> 
> Gah.  The removal of page_mapping() is in the s390 tree.
> 
> commit 259e660d91d0
> Author: Matthew Wilcox (Oracle) <willy@infradead.org>
> Date:   Fri Mar 22 16:11:46 2024 +0000
> 
>     s390/mm: Convert make_page_secure to use a folio
> 
> But we don't want that kind of dependency between the mm and s390 trees,
> so perhaps best to just drop
> 
> commit 48f0b417c0fc
> Author: Matthew Wilcox (Oracle) <willy@infradead.org>
> Date:   Tue Apr 23 23:55:37 2024 +0100
> 
>     mm: remove page_mapping()
> 
> for now and we can submit it shortly before -rc1?

yep, let's do that.

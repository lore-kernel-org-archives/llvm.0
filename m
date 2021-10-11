Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FC02C86
	for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 11:16:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4C2E60EFE;
	Mon, 11 Oct 2021 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633950976;
	bh=BGseFkSI3o7YUdTGuh0dvYWUKKGv2pjwiqfBn9C/EAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kf4vkv0KqFJ0tXgmZ9OSTje8U5pQFFj2XUIQ8qxL/tixJD59y0AOp77Vxv2ajo5Ku
	 5eVHHRgbpsNUJSDBHHraZc9IXy4Yu9grlnL6fpM+hiG22t8Pr5gWOL1JMRV9DrQUEc
	 bTWIRDHo2ruozRq2GEgXI9lOKamROMPORFvcbczz0IAHX+xaH+zfqF6LNEh2TYj/nx
	 oTqkvf4mUhDBKXgFjsvgV3eS5bJqDQ/BIqhLsath/GTBUw2n1QzaXcX/ufgUcAoIpX
	 EEOuVhxZUlKCD8K7xNaAGJCzqNWMtPYkgm3EBM9cUQ+MGrqeLeAXNAsi6+IS3DgAjm
	 K1LdUQeWGlaOQ==
Date: Mon, 11 Oct 2021 12:16:11 +0100
From: Will Deacon <will@kernel.org>
To: trix@redhat.com
Cc: peterz@infradead.org, mingo@redhat.com, longman@redhat.com,
	boqun.feng@gmail.com, nathan@kernel.org, ndesaulniers@google.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] locking/ww_mutex: set ret variable on failure
Message-ID: <20211011111610.GD4068@willie-the-truck>
References: <20210927145756.209435-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927145756.209435-1-trix@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Sep 27, 2021 at 07:57:56AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Building with clang 13 produces this error
> test-ww_mutex.c:138:7: error: variable 'ret' is used
>   uninitialized whenever 'if' condition is true
>   [-Werror,-Wsometimes-uninitialized]
>                 if (!ww_mutex_trylock(&mutex, &ctx)) {
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> On this failure set ret to -EINVAL as is similarly done
> in the function.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  kernel/locking/test-ww_mutex.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Will Deacon <will@kernel.org>

Will

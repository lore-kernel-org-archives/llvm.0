Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E47611E
	for <llvm@lists.linux.dev>; Sat,  8 Feb 2025 03:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738985638; cv=none; b=AxLpei8OLCnJLjvZzEyB47k/entS0FGaUw2CC+6GErgHYZJVS9dkggI0rSD+ggjPjOnPd/im3FxX8dWqNFcXoSrQ0ArMt1epH4Pp+Q2gj7swlIdZb4NtXXtw8hAQ9s1cIhWt14Sg6ANnlyHZtRqPGnwOuwLbE5ZRHLckommAzSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738985638; c=relaxed/simple;
	bh=ZRsJz66vWTq4YxYq5nUimSWV0SeHTzic6BwJiuEhDHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0so/Bdf8eVH6CjqNApYIqeAPn85qUgAoWmnCqFUy5rUlJBVKuEPN61RrlxGNZWTGoa283n/f5bsqfAtfmLUAl5Mw5LSAOzGMw51KCS/kqU6Omu0klKYYDhJSLjBuWJWNNnUBmpG2iqJf+Dc2Y4ts6XKlsbMFs9Kaw1AmqmO4tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwTDeFuO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwTDeFuO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741D0C4CED1;
	Sat,  8 Feb 2025 03:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738985637;
	bh=ZRsJz66vWTq4YxYq5nUimSWV0SeHTzic6BwJiuEhDHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwTDeFuOwLdSbg4lmTQV0yNt8AcLXVli3KKGIWfqteIcTohzxDYQtdtOjrGgOohfs
	 4cugzOvuawE0QWX10xdXNOFE7BjV4sfatvKrlq7ziw4w1QeS9HiSpyv+EtPIrGyHg5
	 8dvpdxmYWCXhy4DgBYpjq9LxQSBSKMeoQnSPxUVVl+djhrKrQGeOIzl5uEG0ksSFIj
	 pXJTf0MReum1+i6KM+wv5os6YKNOJ57xYJGL/+uIEi+7VdNgwcmG++2sJQIGnitabB
	 VBdkgPcmoxQ5//6DsV4vurlzxCky0tKpfGoBACJs5wuNyzGsNb6SCEVTPVFi3nGABy
	 +AS2rwpuwW+AA==
Date: Fri, 7 Feb 2025 20:33:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bart Van Assche <bvanassche@acm.org>, linux-mm@kvack.org,
	Ivan Shapovalov <intelfx@intelfx.name>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Laight <david.laight@aculab.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	David Rientjes <rientjes@google.com>,
	David Hildenbrand <david@redhat.com>,
	Kaiyang Zhao <kaiyang2@cs.cmu.edu>,
	Joel Granados <joel.granados@kernel.org>,
	Sourav Panda <souravpanda@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] mm: Fix clang W=1 compiler warnings
Message-ID: <20250208033351.GB3305705@ax162>
References: <20250131191231.1370466-1-bvanassche@acm.org>
 <20250207164926.6daeac77@kernel.org>
 <CAHk-=wiCJow8C+_fJvZ77taCf0oN0_X7NOR-BaECT2jV0Q-F9g@mail.gmail.com>
 <20250207173813.5081ba76@kernel.org>
 <CAHk-=wjMux0w49bTdSbC3DOoc9FRctDrRvaqFUS4KFTmkbtKWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjMux0w49bTdSbC3DOoc9FRctDrRvaqFUS4KFTmkbtKWg@mail.gmail.com>

On Fri, Feb 07, 2025 at 07:11:08PM -0800, Linus Torvalds wrote:
> That said, we may not have *many* of those enum cases in the kernel
> (and we do tend to have a history of using long series of '#define'
> sequences to do these constants), so maybe the warning is acceptable
> if it's a case of "this is literally the *only* one in the kernel".
> 
> But not having clang-19, I can't see if this is a case of "this is so
> rare that let's just avoid it", or "this is the case that causes the
> most noise for every file build, but there are lots of other cases of
> this".

When this warning was turned on for C in clang-19 (it was C++ only prior
to that IIRC), it was extremely noisy. Some of that was due to the
warning occurring in headers that are included everywhere such as these
couple of ones but even hiding the big ones, there were still a bunch of
locations that triggered it (I did not do the best at hiding all of the
header ones because I had given up trying to make leaving the warning on
for the default build at that point).

The diff to hide some of the really common ones:

https://github.com/ClangBuiltLinux/linux/issues/2002#issuecomment-1970004069

The build log with that:

https://gist.github.com/nathanchance/971e5abeba504d3017cd6ed4517bbda6

I looked at a number of them and none of them really seemed like bugs to
me.

Cheers,
Nathan

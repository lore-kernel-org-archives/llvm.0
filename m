Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEE437416A;
	Tue, 10 Mar 2026 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140160; cv=none; b=WJTtTBj2nnJmTggw2yjEFvo5q3KJB8ZM6PezeHcOWuMYed36YMqiNoCtxYqRq0oXZW5XaqtJOGqApTVRlsQsKP1FRDhr3HkHKYN1V7MRDKHIGPWlMobRhoDmbl0ZDcH1W5XXq9NKp9xMwik4f5egosnWEslYerARndtoCpCQqDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140160; c=relaxed/simple;
	bh=ArMHh5miEVyIWBjWcVqK6GugbsLlDS/QQm5Aj1WgKEM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=c24d5x5zuYIxgaaCA4mkv7e35dP497aQgzlElzq3GclmmoIXJ5FSNypRkIYJipfLH5i87vMXzgm7XT9miK4+lRSKUdytB6MLPzPYNwRSdH0xB1/AiInTSCSUitEFonlw0ozvzAujcDNCc3e3Uq+2JoqSXbdFYocJ+nLMqTYDhbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDK4o+0I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDK4o+0I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3402EC19423;
	Tue, 10 Mar 2026 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773140160;
	bh=ArMHh5miEVyIWBjWcVqK6GugbsLlDS/QQm5Aj1WgKEM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=GDK4o+0Ip/5JV+tHpWOrpKA8LhGlkubU1oH0LvdADoYAmj522ddyfErcLtYdcOyp3
	 a/rlj6m5RDGC1DAm5L0c+kmLipV+wWSsOK29E4YGHxhPfYV6J527GVE6SIiHQxHIOp
	 EKN5poE9LNIVtMZB5y4Jdg+2Nb+R9t4jEr6yJee7iBjHLu1jlF80gJtW8vXAeBvJRd
	 BMgmYkjOCaPtoPHkuA2bkyASKzb/5fDjsfpZ73xpEzWYevp1LHoevAZFr4jxD8XmB4
	 mViEY8j74jENKP9RW4JCVihkPFf7pkruj3sGistboY3DAKdeJEiOVUZooiWtbuW3Ly
	 5cfBJ1A+hPlwA==
Message-ID: <be647d6b-9bcb-41c8-bfcf-7fa03d2b942f@kernel.org>
Date: Tue, 10 Mar 2026 11:55:55 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: Re: [PATCH] mm: optimize the implementation of WARN_ON_ONCE_GFP()
Content-Language: en-US
To: Xie Yuanbin <qq570070308@gmail.com>, willy@infradead.org
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 david.laight.linux@gmail.com, david@kernel.org, justinstitt@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 llvm@lists.linux.dev, mhocko@suse.com, morbo@google.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, rppt@kernel.org, surenb@google.com
References: <aa7p3eQfEuh2wObQ@casper.infradead.org>
 <20260309155933.41179-1-qq570070308@gmail.com>
In-Reply-To: <20260309155933.41179-1-qq570070308@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/9/26 16:59, Xie Yuanbin wrote:
> On Mon, 9 Mar 2026 15:40:13 +0000, Matthew Wilcox wrote:
>>On Mon, Mar 09, 2026 at 11:38:11PM +0800, Xie Yuanbin wrote:
>>> As shown in the commit message of commit 242b872239f6a7deacbc
>>> ("include/linux/once_lite.h: fix judgment in WARN_ONCE with clang"),
>>> the code "unlikely(a && b)" may generate poor assembly code if it is
>>> actually "unlikely(a) && unlikely(b)" or "unlikely(a) && b".
>>
>> Why fix this in multiple places in the kernel instead of once in clang?
> 
> If a and b is both unlikely, then "unlikely(a) && unlikely(b)" will
> generate better code than "unlikely(a && b)". This is also true for gcc.

What are the details of how it's better for gcc?

> As for the issue of clang judging twice, I have already submitted it to
> clang:
> Link: https://github.com/llvm/llvm-project/issues/167117
> However, even if clang fixes it, this optimization will not be merged
> back to the old version of clang.

That's life and not worth complicating the kernel code for. This is not
about making it functional, only about perf.

Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC11C5D66
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 21:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737582948; cv=none; b=iZkHNluMXN5yhIBiqIekLPPXzz1oEP1Z5MYvtocbM+nfidGnO9YOA+0bzokLN59uc2qJLhf+Ua4GMBlugmFgiSgxxucvWejfGUO3px7U86+ZwlTslphp2hAhLO43BMjcJClHpz/BiwLPjZwyOJMLGiFJMreOJHHCu+2iz0IwGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737582948; c=relaxed/simple;
	bh=W5XuDpbA/NJ0/BUnwtxtTYWXnGcCxkLfiM/b8Cld79c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6OPsyc98No3n6m3xksEz32sYWrUg4bcfd7h/G4tyjRwkTextphZLkiUzdWyg1oezaMM67z4CJsLQn3tEdEB4RguJJOKJtXJFg44GXXsj1Tgks2VFh6ZUgBDg+fNsjZYOrl1/nA+lUEekgP0DXtqMfa74PHTV2KoVxunMGyxJnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=0ncwwt5w; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="0ncwwt5w"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YddDf4JXHzlgT1M;
	Wed, 22 Jan 2025 21:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1737582940; x=1740174941; bh=9vnubpaB1F9qLp8XdalPGwpy
	WtguqOJ2vRAN4zo/wWU=; b=0ncwwt5wIexP3AJyxPwKkYLghHPfYa7LsjN1VeiY
	R4FlfKPmXqrV0YxRm5dDodlw8QuX/8XKtf1zUTDmxMnKZ8xtn3oTXU4wHbIT9sRC
	ZBKYMXuW7FFxnS9W45JEyO6GCWCQQ80OwDFOXEOYY0cRIjV02TAW4nxZ+vDFmYs+
	UkQ/ytQx/V3Xmx0iLVS1TjfLQo4ubPqFBWp19ya3AsH4SunirnlA2rE3A84x6ZMv
	EeVwdd08Ua0iqY56Md96H5t0Y/d3b9xN8cKxEzIovtra5GN4w9JM3NzJN+0fsCw9
	cq+T0pPvmv6jB3+DvwECiA1bUjmt44O3nQCyKj8boX8RLQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 0PLaFp1YPHfk; Wed, 22 Jan 2025 21:55:40 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YddDP6JgnzlgVnN;
	Wed, 22 Jan 2025 21:55:33 +0000 (UTC)
Message-ID: <2b2dfbf2-7d17-4576-b0fe-2e13d563cf47@acm.org>
Date: Wed, 22 Jan 2025 13:55:31 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmstat: Fix a W=1 clang compiler warning
To: Ivan Shapovalov <intelfx@intelfx.name>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Rientjes <rientjes@google.com>, David Hildenbrand <david@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Joel Granados <joel.granados@kernel.org>,
 Sourav Panda <souravpanda@google.com>, Kaiyang Zhao <kaiyang2@cs.cmu.edu>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Konstantin Khlebnikov <koct9i@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20241212182425.ad1f7894cd0f00b2e34bbaed@linux-foundation.org>
 <20250122015818.3308696-1-intelfx@intelfx.name>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250122015818.3308696-1-intelfx@intelfx.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/21/25 5:57 PM, Ivan Shapovalov wrote:
>> Spose so.  One always suspects that adding a typecast is a sign that we
>> screwed things up somehow.  The relationship between enums lru_list and
>> node_stat_item is foggy, and I'm unsure whether this is the place to
>> make the transition it.  Perhaps lru_list_name() should take an
>> `unsigned int' arg instead.
> 
> All of these *_name() functions do seem to expect arguments in range of
> the corresponding enums, so perhaps keep those args typed as a form of
> self-documenting code, and do this instead?
> 
> [ ... ]

Please take a look at
https://lore.kernel.org/linux-mm/8640d744-d182-474b-9059-204bcea47d1a@acm.org/. 
I think the patch I posted on December 13
requires fewer changes and no type casts.

Thanks,

Bart.


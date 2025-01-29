Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5544A372
	for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 17:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171866; cv=none; b=WDXlTzpzkADpEvaFO0AITfGCTS3gO2Kai4LFjjczgywTneL3NGGUvm4T+mnN8y6hBshvGrtmMcTk6yIRXP4sG8QwP+kRT8B8hyVy4opYgpiqmzRkICsyN+udRyQhdFPNt92HUKEvbJ3DS2e49Tn5bOZXMUzpHEUGp/6FuEWMHhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171866; c=relaxed/simple;
	bh=aNr9f0v9do0xk8Lkl5X7z+bvavqRmf6FAHj7IkPFk1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aN+3CdUoSy+PtbxU96DaeiyWxvNTNqJKUtAJbNt+nU2Iyy9gSJp4A6yWgvNgLJalmXcO7VbJOLRNKXINvX0B0ekjzjaCLSurK6iNMLvHAmLHs9u3DYmD3sIU068LDt7jNvmsu2meORZuziRULuGH5X5b62ql9oXqHf2g1y2NCrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=0gi7jjXf; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="0gi7jjXf"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Yjq204yzLzlgTWQ;
	Wed, 29 Jan 2025 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738171857; x=1740763858; bh=1TlmWlLzdiXOK3rluf9Wmbc+
	0/Pe9s8d8EO+Xcqr/p4=; b=0gi7jjXf6zjqlWxH6GnKer9Ex9e8L577EWRDknHk
	DWr/DvPUfiLEhIigXE5uiijmW7X446B7tOXZS/+itYSH+gUwXd+5+iXXTx3tyVGu
	dFnOh5YSMVRSxq4DMz6AbIVkLQYsl45v2vG+KpfCCxy48NPzXE/ulvnakxWK2Bx9
	fmBt2SZWfdrP8GB6bHCS3kFKRfWMkJFGVNU217Ulf+ii1Rukg0y0hljWN0Tf7xG6
	/dMjYybummRNblMFaICWGm5+ETZrixAuCFiWiYVpZavUu3AN7vl1JAH6fvmJnCUn
	5hPwW+YDe5vTvc2kOoygt8ancZ9HGhKuDom7/Tg+po97Fw==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id fzeF2YK-OYcN; Wed, 29 Jan 2025 17:30:57 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Yjq1k2zGvzlgTWG;
	Wed, 29 Jan 2025 17:30:49 +0000 (UTC)
Message-ID: <e7760176-8415-4f12-8579-b10111647525@acm.org>
Date: Wed, 29 Jan 2025 09:30:48 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmstat: Fix a W=1 clang compiler warning
To: Vlastimil Babka <vbabka@suse.cz>, Ivan Shapovalov <intelfx@intelfx.name>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Rientjes <rientjes@google.com>, David Hildenbrand <david@redhat.com>,
 Joel Granados <joel.granados@kernel.org>,
 Sourav Panda <souravpanda@google.com>, Kaiyang Zhao <kaiyang2@cs.cmu.edu>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Konstantin Khlebnikov <koct9i@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20241212182425.ad1f7894cd0f00b2e34bbaed@linux-foundation.org>
 <20250122015818.3308696-1-intelfx@intelfx.name>
 <6a45a521-71a3-4087-9320-b8aeecea205a@acm.org>
 <a4dc3313-b9b7-4075-b082-7232b3b7717b@suse.cz>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <a4dc3313-b9b7-4075-b082-7232b3b7717b@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/25 2:22 AM, Vlastimil Babka wrote:
> On 1/28/25 22:36, Bart Van Assche wrote:
>> +#define NR_ZONE_LRU_BASE	(1 * __NR_ZONE_LRU_BASE)
>> +#define NR_VM_ZONE_STAT_ITEMS	(1 * __NR_VM_ZONE_STAT_ITEMS)
> 
> Seems an acceptable approach, dunno if this multiply by one is any better
> than casting to int?

For enumeration types that are wider than an int, casting to an int
causes the highest bits to be lost. Multiplying by one doesn't have this
disadvantage. Please note that I don't have a strong opinion about this
and that casting to int would also work here.

>> +
>>    enum zone_stat_item {
>>    	/* First 128 byte cacheline (assuming 64 bit words) */
>>    	NR_FREE_PAGES,
>> -	NR_ZONE_LRU_BASE, /* Used only for compaction and reclaim retry */
>> +	__NR_ZONE_LRU_BASE, /* Used only for compaction and reclaim retry */
>>    	NR_ZONE_INACTIVE_ANON = NR_ZONE_LRU_BASE,
> 
> Should we rather use __NR_ZONE_LRU_BASE here?

Right, I will fix this and also a similar issue below.

Thanks,

Bart.

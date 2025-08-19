Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DAF7E110
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 12:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606672; cv=none; b=jYVNI9InntQ1redVF3Ta557jOo2WtwOK4hG2Tz/NrnPMa6JULDb5bI+ISF9utHUXdN8UGFd1pEHuXGlJt+3QG1OF/RnI7zq67BOPcYqo6Q65wF5WiWsSrN0N7Ts6qJiYJv1YzqbDAMYJAZ8Oua0KWNwyo+oUidzrwIOcaVPKr/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606672; c=relaxed/simple;
	bh=ImCD3eM/PFPyQ9m5dRCYm/LtF5jZcYNy4oNw4R37xEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAkJpL4obEByx/H52Ck6QAzuH1qhn7w0cyjezScELoidWToqsvuQohCUICJkNAAtc9Z+pKv2LFeuZATBbgEkEIXTG5S0IbMCuxVoCk8EEE4Pl1CXPPzjxdfCoidTRzjKOPXPrcxS6HLeSGXgPMSCVZYAl9ct5AMGNFspRS1/7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fHC67HYi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fHC67HYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755606670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Yb5sv1zr5rxUlheY9XAjFIdy+xQxd/kDQBOVar/9xqE=;
	b=fHC67HYiIg5eL0VWMt63wUpXnkejqTclimyI93BRAhfuWjPqLoO/mHBB+uo8ZDBjAqbf7V
	mqIN/T9NyvEf8caqfqyPsr+tRx0DQURcDmYTL+uq17lyd/cqoH1m4JU6ERG2XDGasigy4H
	NruiDs0o9bzB0Go/aP/7gQvSMx6ny0U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-MSTVrx_tMTS2azO4XPJkKQ-1; Tue, 19 Aug 2025 08:31:08 -0400
X-MC-Unique: MSTVrx_tMTS2azO4XPJkKQ-1
X-Mimecast-MFC-AGG-ID: MSTVrx_tMTS2azO4XPJkKQ_1755606668
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a28ff4793so12530945e9.2
        for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 05:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606668; x=1756211468;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yb5sv1zr5rxUlheY9XAjFIdy+xQxd/kDQBOVar/9xqE=;
        b=H/a6WmTo2Ne2x5Uc0WsZsXi1Qw0POHTsI4oweA3G8kK9AkhnPUkBbkUUyDG/FB8NYT
         lD1aJNiZB8obwIWNMxAm59zX7o0wnW1PZIBCcqfakH5B1AfO7dWnFG+4+rqk3OhpG5Rc
         hmmRF85m238d7tYbOGof9cSAMGFBUi4RTqZ8w5fqnigcTZ3uCtKJoLd/FxLoiC53BJrt
         WZErHtJZgdckSSZisVih4Yq603pOF6Y1lD7t8O/nFIs9IdhD1U9cY2EGZtG61DHtSVpQ
         9Akf7wLu6o0fB/74e/4TsXacQxZUcy3yM7y2NRwgaUtmOoVRymKsAsM639DYd1GyNEfc
         MWtA==
X-Forwarded-Encrypted: i=1; AJvYcCX1wsT5WfIl45sIyZPXD49uCA0UlrW7Mmyjhw1InP8q5EK+BiguNoB9uyVoS5Vt2HHpNSxB@lists.linux.dev
X-Gm-Message-State: AOJu0YzrShtoAWtiuNstoaIDO7tmlsqOYFKy5PdSTIDkq0wHZHmjoQlr
	1eZ8lJC99e8myfEX/BTrdYh3rqaJiiiy8c1LLWqczIfzxbzvu2no2DbuC5vZtsZNKVgvoBCHqWr
	+Vxj5YoU9G2DmQXOzD5rlTEPYz1ZzKGteSaRiYLqc3w+MVRax3BMBdtQ=
X-Gm-Gg: ASbGncuxngJX5joE8jBlzpTWP8nBy+8Mbiz+iReHnLgrBd2UPanAJg9lqu37U3W3pZD
	4YOrcmqmXwXdgz70X9uQERxaAFDFX+uXa79gpq8gl38iHAlUA0z3g5gMU4k4EnQivh0kT380FSD
	g74GYHwRKIOuYhbvZg9x1a4Rkj1wdZilGJKOunMBK0UddmI+IJHOHNMLaBzhc0lJuMfUEoZsFSk
	MVPAl4PU4d6JUwMjYnVmt3uo2LTpoHrrlQFFsA+FPCbF/S6ZVFRE67qa5UTXZXdd1mSbI9OXkGA
	T4ZGeuQfGJ/fmYGFa+sWc9+/dzQA1+qxOUV2khTfWmwN1k+B73XAqqxy0OT8Sou8JwqeFRYkBF8
	pap8yaz93fRobeJGNV0jCfR3kuSDR7/xcIlrs8hSvAjPCfIAzkM4qR2LOnXBj1gR0jmg=
X-Received: by 2002:a05:600c:630c:b0:459:db80:c2d0 with SMTP id 5b1f17b1804b1-45b44d6f6d7mr13425415e9.7.1755606667545;
        Tue, 19 Aug 2025 05:31:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF9DqbnW7eCUmfGTMJap/d439sOOVnQK43Z23DtcxrFTUNNRVcaiz2wCYQyuGLZpijDyqywA==
X-Received: by 2002:a05:600c:630c:b0:459:db80:c2d0 with SMTP id 5b1f17b1804b1-45b44d6f6d7mr13425125e9.7.1755606667146;
        Tue, 19 Aug 2025 05:31:07 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f07:8700:71be:5385:87b8:5a98? (p200300d82f07870071be538587b85a98.dip0.t-ipconnect.de. [2003:d8:2f07:8700:71be:5385:87b8:5a98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b42a8f972sm42502585e9.20.2025.08.19.05.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 05:31:06 -0700 (PDT)
Message-ID: <1df9b8da-6462-41ec-9dc5-df99dbd8ae8b@redhat.com>
Date: Tue, 19 Aug 2025 14:31:05 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mm/mm_init: drop deferred_init_maxorder()
To: Mike Rapoport <rppt@kernel.org>, Wei Yang <richard.weiyang@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Bill Wendling <morbo@google.com>, Daniel Jordan
 <daniel.m.jordan@oracle.com>, Justin Stitt <justinstitt@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20250818064615.505641-1-rppt@kernel.org>
 <20250818064615.505641-4-rppt@kernel.org>
 <408d7eaa-5aea-4490-9fd0-978c4eb94d32@redhat.com>
 <20250819092254.cddlg6npwl75fvbn@master> <aKRUUzq48xW5qPOp@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aKRUUzq48xW5qPOp@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CjM06dzeGJNW31ppsO0N3kW9w1FfEAKIo1DpX6ij2CM_1755606668
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.08.25 12:39, Mike Rapoport wrote:
> On Tue, Aug 19, 2025 at 09:22:54AM +0000, Wei Yang wrote:
>> On Tue, Aug 19, 2025 at 09:54:22AM +0200, David Hildenbrand wrote:
>>>> -static unsigned long __init
>>>> -deferred_init_memmap_chunk(unsigned long start_pfn, unsigned long end_pfn,
>>>> -			   struct zone *zone)
>>>> -{
>>>> -	unsigned long nr_pages = 0;
>>>> -	unsigned long spfn, epfn;
>>>> -	u64 i = 0;
>>>> +		while (spfn < epfn) {
>>>> +			unsigned long mo_pfn = ALIGN(spfn + 1, MAX_ORDER_NR_PAGES);
>>>> +			unsigned long chunk_end = min(mo_pfn, epfn);
>>>> -	deferred_init_mem_pfn_range_in_zone(&i, zone, &spfn, &epfn, start_pfn);
>>>> +			nr_pages += deferred_init_pages(zone, spfn, chunk_end);
>>>> +			deferred_free_pages(spfn, chunk_end - spfn);
>>>
>>>
>>> I assume the expectation is that all PFNs in the start_pfn -> end_pfn range
>>> will go to this zone, correct?
>>
>> I think so.
>>
>> defer_init only apply to the highest zone in one node.
> 
> Right, we defer initialization of last zone in every node and there is a
> thread per node that does the initialization.

Thanks, my memory comes back :)

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


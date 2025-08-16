Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3D6317700
	for <llvm@lists.linux.dev>; Sat, 16 Aug 2025 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755329265; cv=none; b=TuzIzN2tkkS9Fj3W8Rs/EDuxMZ9CYgG33zA0uTkPqfH6HQZ+U28J+gqWG+AQoaATfxjjWCBlNJoiKIOXsym9sGHugH1ySclPzuJJkYEsnXtAJ+1/P5QrNI1NUFVLLXyXlMBdQDeICoaeYm6RyqaUCCcCuajf9KVQ09FfMmA/FzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755329265; c=relaxed/simple;
	bh=vrJbSCt5ow435WoSxzEyapIOfGMNVscxKN5uXsEwx7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTkhe42JUMZEUAAMjMFLU5J48GDiQ+1uNJvNYitbVgSKM1Y+80DkGk3xFqhbk5oATsYKCDhqrnNju1Tqib0DGjD2fMiwjj59FCso381aRYv9/ofavr6KqvWIJ2lqlpb/VdIZekhYYRyJJIttEerMFXgCPUzcglAcQypjcTcajfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LjFp4ZpE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LjFp4ZpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755329261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=t4AZfAqos/ixFErYX9dKALbYZxnmcFT530+q+YUTGEQ=;
	b=LjFp4ZpEJ2ZDFBxyQbJf0XZSEzTZJC2qMs/elbFlFWhwKhQxCypjsLg6zey33h7pOU5MFp
	i2Jhv60+/ge6ywl7Qckfomzcp3k7zLhEb+1ddmPYBZL+Jo8dU9TyCfskyPjdDjWFkGSx0c
	c3qDStC+mcBosDlVzZp2Thr7bM3uk7w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-7vtZyxigOvSiV6Yg_JqhMQ-1; Sat, 16 Aug 2025 03:27:40 -0400
X-MC-Unique: 7vtZyxigOvSiV6Yg_JqhMQ-1
X-Mimecast-MFC-AGG-ID: 7vtZyxigOvSiV6Yg_JqhMQ_1755329259
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1ad21752so10598265e9.1
        for <llvm@lists.linux.dev>; Sat, 16 Aug 2025 00:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755329258; x=1755934058;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4AZfAqos/ixFErYX9dKALbYZxnmcFT530+q+YUTGEQ=;
        b=Byv+CAqTNRPsJKcuNeqmKtt5LQZFC/wVgTsMmSVTTYNwcYEd2jjOFQoAyomTkehYcp
         InOW2SOr5swDxq/a05Mup1VFbfEypkAxkZ8hhkquiJ5dqIg0Ev/qMXGt2d8/RjuKX3x5
         2ozk+laBxvnLllljX1Am99kMvkjwu1GIgZi8Bov0be92jVMc2vikfNxv0KUWm1uJOSg3
         2JXe5ZAi9Fn/hTviwIZtnjELGXKG+uXEQL7lrisBdItmzCb3AYOxAcP7zH18xlV5zMUW
         z0+Lodurmj8R20ZTxmk7RaoIzfzS9cxQTDDA1UKzkybmZ17vA75J+ISYfPezSKqBPiqq
         CLTA==
X-Forwarded-Encrypted: i=1; AJvYcCX4Eb058hP6iYMTs5NFpn3/Iyg3yM6RFDiibCSDKYCwTxnvV7y505paZZXCmEqS88QUrxeK@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+TAB+KNiAgsreRD7Just9K+nEpXqeT08jWw4NXz2raREOZk68
	niB5zNuOvNHZeZtzjxbgzTGeslZtUgcT46gZ5cbtfdfMwV5v6fUHaMvURE65sIXmRFlqr2/tPR6
	YODXfKsz9VcOQauD4m4Twcbm8zmAvVLNLPw+6HiwL01LJXNBwWHVWYEs=
X-Gm-Gg: ASbGncvdLV1e4T8GGr1Pv0l8GkdPufZphlfVkZC3NLQ5nloOr+J68WCmbzViA/9tpop
	WQT3d6X3tpYQMJdwDHvPhS3KobF/OnKUj7jCKMtxt6EnLiGfGCCrgVJbNA5Geu0hF1Uxu2i6sFR
	R4j+dG2OVGOxqLCnZ+0X/AEJUsAFs1+C21gbj5jA/x2KrCvdLR2gNbx55/vhO57YVL7fdw+UFc5
	NawaOogo3zMQlVcylqpQJi+YBecHpq7317AEZ8/qE+BfGUHLSyIUqvtyEQCHjxrw9VPB7ca00Ee
	oJhDeHum6TKp1ctbCkvFN6FDTDvEqbgb7MyRMpjb0LYdwFgozgkkZJ/sSqrBPYy55RME5cvUis6
	GVFq4AoRs27a+xAj3u1OPOeo4Zc7WQiZqYUc+3T9t2KPTxFPIXQuLggS3sLHov2EOvZY=
X-Received: by 2002:a05:600c:c8a:b0:459:d9d5:7f2b with SMTP id 5b1f17b1804b1-45a21868766mr44537415e9.16.1755329258562;
        Sat, 16 Aug 2025 00:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2I2SUKhif0Hm9g/IxY8EqmynMVQZkR4uOI9k9t9tj5wPS57kzRPdlWUVAFYi06e4VqTYpFA==
X-Received: by 2002:a05:600c:c8a:b0:459:d9d5:7f2b with SMTP id 5b1f17b1804b1-45a21868766mr44537175e9.16.1755329258126;
        Sat, 16 Aug 2025 00:27:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:c700:d8ae:41bf:492a:9e4c? (p200300d82f23c700d8ae41bf492a9e4c.dip0.t-ipconnect.de. [2003:d8:2f23:c700:d8ae:41bf:492a:9e4c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a2231990esm47602845e9.9.2025.08.16.00.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 00:27:37 -0700 (PDT)
Message-ID: <692138a0-e21e-4595-9ba1-931a711dbee1@redhat.com>
Date: Sat, 16 Aug 2025 09:27:36 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/rmap: Always inline __folio_rmap_sanity_checks()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Rik van Riel
 <riel@surriel.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
 linux-mm@kvack.org, llvm@lists.linux.dev, patches@lists.linux.dev
References: <20250814-rmap-fix-build_bug-conversion-v1-1-fb7b10a0b362@kernel.org>
 <9733f669-faab-4c4d-a663-ce0b877ee11a@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <9733f669-faab-4c4d-a663-ce0b877ee11a@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tIowZNuugoFplUZ34k0SicQMk4DPZN8m8HwWFa8Yi5s_1755329259
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.08.25 07:16, Lorenzo Stoakes wrote:
> On Thu, Aug 14, 2025 at 01:05:22PM -0700, Nathan Chancellor wrote:
>> Commit 5e901e249ad1 ("mm/rmap: convert "enum rmap_level" to "enum
>> pgtable_level"") changed VM_WARN_ON_ONCE, a run time warning, into
>> BUILD_BUG, a compile time error. After this adjustment, certain builds
>> with older versions of clang (such as arm64 allmodconfig) started
>> failing to build with:
>>
>>    In file included from mm/rmap.c:63:
>>    In file included from include/linux/ksm.h:14:
>>    include/linux/rmap.h:440:3: error: call to __compiletime_assert_890 declared with 'error' attribute: BUILD_BUG failed
>>                    BUILD_BUG();
>>                    ^
>>    ...
>>    <scratch space>:21:1: note: expanded from here
>>    __compiletime_assert_890
>>    ^
>>
>> While __folio_rmap_sanity_checks() is marked 'inline', the compiler may
>> not always honor it, such as when sanitizers or other instrumentation is
>> enabled.  If __folio_rmap_sanity_checks() is not inlined, there is no
>> way the compiler can eliminate the default cause.
>>
>> Mark __folio_rmap_sanity_checks() as __always_inline to allow the
>> BUILD_BUG() to work consistently, which clears up the error.

Thanks for reporting. Weird that no build bug stumbled over that so far 
(neither on the list nor on my private trees).

Maybe the latest change from Jann made the function bigger and the 
compiler more likely to not inline this function.

>>
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> David needs to have a look, but afaict this seems reasonable,
> __folio_rmap-sanity_check() is only ever doing stuff if CONFIG_DEBUG_VM is
> set, and in that situation we don't even care if this would somehow be
> inefficient, but in any case modern compilers would inline it anyway.

Yes, all code is written such that we get specialized variants without 
runtime checks -- except __folio_rmap_sanity_checks() because that would
usually just get completely compiled out.

We could either have a WARN_ON_ONCE() instead of the BUILD_BUG() or, 
rally just __always_inline this function.

> 
> So LGTM and:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>> I assume this will be squashed into
>> mm-rmap-convert-enum-rmap_level-to-enum-pgtable_level.patch so no fixes
>> tag.

Yes, @Andrew please squash.

In any case

Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
Cheers

David / dhildenb


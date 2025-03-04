Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8952F1FC7CA
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084295; cv=none; b=qbPfzVIhJ6gKTw0KnerJshRcF5hJBQoViWRW+Rwr3j6j8Vo5n4a/pTRO0XhQPzjEopdyziEJhACjk1zoX4BZZPBPaLX+cardo2I8BljT8G98957f8I0bfXmFl6nmKHayWxF0TYJd0rbqmZ3NYHnW4w+PIiq+eo6rr3x1yeYT7jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084295; c=relaxed/simple;
	bh=rF2C6auBgJV7AjRE3Ax6vB5itQvl59SYFnbvSxRyHyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPHAsfFiLLDuspZvlEr5Neon3Z80QAC9Fb49c6S9gbtLAyWCQF4OvqwAwN1fCT4HQeB4+2sUQ8RVEuEyQrfBt7XOnooExdqiAwV93S1aDeqQRvLeV7o44gT9G9FcEihnyY6BGTPGOKScF5sbCZ9HbINVIpEvj7S+RzRZhfPYAJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LyQ5M6fk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LyQ5M6fk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741084292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2tz6TMyA0N6NCq2/rWH70WazKmLg2E3Dc/ghxOZlw10=;
	b=LyQ5M6fkSH1P7bvodTzlaePRYbKx1SP7enICTwIqpWwHqRlRgrUkl5+NGB2ruZCKD7zvkk
	czhZyGLyIGVVgDDowWmUT+vBYkiaw1ok+DHil8mTvXbLXfNC7fAnEABV+nzTgrn1sCUUuX
	VcyzXWHj/UBIY3qdVh8l9TrqA4QxNyA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-dIt8Fnf4O6eicyqdtb46lg-1; Tue, 04 Mar 2025 05:31:31 -0500
X-MC-Unique: dIt8Fnf4O6eicyqdtb46lg-1
X-Mimecast-MFC-AGG-ID: dIt8Fnf4O6eicyqdtb46lg_1741084290
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ba50406fbso41778405e9.2
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 02:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084290; x=1741689090;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2tz6TMyA0N6NCq2/rWH70WazKmLg2E3Dc/ghxOZlw10=;
        b=EjlPYjrkptD0R92tdEYxk8vHO3V4TwTzbpSSnUX3pzppUjXlreuukYKNpny+DKxtWM
         maYNiL9ZarQpqjO1SDdBchrJGzofswJf5Gt6FzhbD5uwGBFvolhV/uYkFYF9M2KafBAD
         BBTEuRVRca6mpsIhx/VbDg12cBaFT92EwCjuX2UaV4RkZ3+xTriCMvdD5kGSISeyy7Rh
         tpZSTp6PbL7xSpSnPudIH5Yq5d+D0YQBrIbMoMqvrwj7u7PIijCA7DIU5lAom8zY5ykk
         a46fRIzWRW3ZewJiBKpJ+VQFljvhUZcirDykz96NQd84jIjzF/PjVMMb3Tz4Ax+R+GHI
         Jq1A==
X-Forwarded-Encrypted: i=1; AJvYcCXjvBW6L7S3/eDTzTiHRhsO/BMuk3mwJLTThzzv3cc8blM/CcWbp5VQgugPIJ9zFeOuy9dv@lists.linux.dev
X-Gm-Message-State: AOJu0YxU9sOet8U/CsnWC3cvqcfVbA9f3J60woUerkxAdkxGf4vCt4as
	DSpywgTUbVPqZpbov6F1mpo7XL4ojtbvGJEF8SYKTFmvYChn5GA/XdcMtpgMrxfFwRtX59grzEG
	Xl6nouDgMnk+b2+s5e5UjMFybpRJXBej3N+9CR3sfKJb0NPpVi6I=
X-Gm-Gg: ASbGncsyRjz/w5YB4aXISyJLla59AzAEAHU4sukm7Dbp+8Omom+GNp3s6JoTVWtCm9s
	nlL7sNjsSTCkmI+7BlznKQVUvJaORvc9W8asEnbSGIxZ3TpiaHtWwK7wUgrzhwMdVtFdmZXis9a
	hRHIgm+EpA51fCQQmHR2XS7O60uJ6IQRXFU2rHVDeKIiZthxu70pySXohOt5lfVfyji7UgtMmve
	8PAiD4sE3ug87CIhqJ+rZzGTMmyKIh5InrvH2xKwoRYuvRsecJMfcQZ3lc95EciwmbAcFHzgKx5
	cPw6zOe++JbystfBRCn3OVpyNC8s4otk0CujlD+JquxJHW8ebQfwMn959hgLEU2ZdQDpkve1Rgd
	2uIEDrfligSVG83SbB6LpE/FB+00GGxCg4hr1+TVpeg8=
X-Received: by 2002:a05:600c:5246:b0:439:9a40:aa0b with SMTP id 5b1f17b1804b1-43bb64f1ce8mr77803345e9.25.1741084289804;
        Tue, 04 Mar 2025 02:31:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhx5a9icImnaIF02Wt+xXg7Hoa/VrMyDHYHv0PDJMMH5f23r/G82MrmbS+Q6U0/3D+w+AJVQ==
X-Received: by 2002:a05:600c:5246:b0:439:9a40:aa0b with SMTP id 5b1f17b1804b1-43bb64f1ce8mr77803095e9.25.1741084289437;
        Tue, 04 Mar 2025 02:31:29 -0800 (PST)
Received: from ?IPV6:2003:cb:c736:1000:9e30:2a8a:cd3d:419c? (p200300cbc73610009e302a8acd3d419c.dip0.t-ipconnect.de. [2003:cb:c736:1000:9e30:2a8a:cd3d:419c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bcf9c7ac3sm512645e9.13.2025.03.04.02.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 02:31:29 -0800 (PST)
Message-ID: <4dee3069-e782-4e37-a46a-ac3a9abb82fa@redhat.com>
Date: Tue, 4 Mar 2025 11:31:27 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/page_alloc: Add lockdep assertion for pageblock type
 change
To: Brendan Jackman <jackmanb@google.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org
References: <20250227-pageblock-lockdep-v1-1-3701efb331bb@google.com>
 <202503010129.rJvGqZN1-lkp@intel.com> <20250228182804.GB120597@cmpxchg.org>
 <Z8WQEpv7BNtDDoH3@black.fi.intel.com>
 <20250304101357.66067dd3@canb.auug.org.au> <Z8bTZVYd0fJLbgl7@google.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z8bTZVYd0fJLbgl7@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PamMy_0weXJk2qj2rsjdlTAxKJYDVO2mOsIRmz7mMCg_1741084290
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.03.25 11:18, Brendan Jackman wrote:
> On Tue, Mar 04, 2025 at 10:13:57AM +1100, Stephen Rothwell wrote:
>> Hi Andy,
>>
>> On Mon, 3 Mar 2025 13:18:42 +0200 Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>>>
>>> On Fri, Feb 28, 2025 at 01:28:04PM -0500, Johannes Weiner wrote:
>>>> On Sat, Mar 01, 2025 at 01:31:30AM +0800, kernel test robot wrote:
>>>
>>>> The patch is missing a dummy in_mem_hotplug() in the
>>>> !CONFIG_MEMORY_HOTPLUG section of <linux/memory_hotplug.h>.
>>>
>>> +1, I just stumbled over and this is not fixed in today's Linux Next. I'm
>>> wondering how this was missed during merge into Linux Next. Stephen?
>>
>> I just get what people put in their trees.  There are no conflicts
>> around this and none of my builds failed, so I didn't see the problem.
>> Has someone sent a fix patch to Andrew?  If so, if you forward it to
>> me, I will add it to linux-next today.
> 
> Andrew has backed it out of mm-unstable now. There's a v2 [0] which
> still has runtime issues but AFAIK it's not in any tree yet.
> 
> [0] https://lore.kernel.org/linux-mm/20250303-pageblock-lockdep-v2-1-3fc0c37e9532@google.com/
> 
> In case it helps calibrate expectations: I think this particular patch
> had been reviewed but in general some patches get into mm-unstable
> without any review being recorded at all. My understanding is that
> Andrew squints at it and goes "that looks like it will probably
> eventually get merged" and puts it in so that people get a view of
> likely upcoming changes.
> 
> So if an issue like this reaching linux-next is a big problem then I
> think the solution is not to merge mm-unstable. I'm not sure how
> high the bar is supposed to be for feeding into linux-next.

Last year at LSF/MM I raised that maybe we should have something 
in-between mm-unstable and mm-stable that would get merged into -next. ( 
"mm-almost-stable" / "mm-for-next" ;) )

Alternatively, we could add something like "mm-staging" before 
"mm-unstable" and "mm-stable", whereby only "mm-unstable" would get 
merged into -next.

Ideally, we'd have at least build-bots and some basic sanity checks 
going on on such a staging environment. After a couple of days (not 
more) of survival in such an environment, it could be moved to the tree 
that gets exposed to -next/

I guess the downside is that it's "yet another branch" and "yet more 
build+testing" effort; in particular, if build+testing doesn't happen it 
will be worthless. And likely, a lot of build+testing is happening on 
linux-next only.

I have pretty good results with build bots going crazy on my branches, 
so most stuff that I send (after letting is rest for a couple of days on 
a public branch) doesn't really result in build issues.

-- 
Cheers,

David / dhildenb


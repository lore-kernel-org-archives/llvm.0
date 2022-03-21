Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D174289
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647871565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VG0h6aZGi/DKotr1u/FQ4KTyRHDeLftG2T0kmjcokAs=;
	b=F5Fb3WNEns8GJ0/OScu9wtKvNQUvoMP9ETAmV6e3yQPpceAVrEE8jk5QWzluzX6DZGuNFm
	9wrhIAUnzEKvNn5D2CJ/QeqPQAcYTPvMxYSmDfzhTYRal/Cr3dtWVVByFZbQsls++uaEb2
	n/mdUBgLUJ3hHDW0QXlGizFXzDtQrfo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-zMD1MZfrNhGIorwZJd9mLw-1; Mon, 21 Mar 2022 10:06:04 -0400
X-MC-Unique: zMD1MZfrNhGIorwZJd9mLw-1
Received: by mail-qk1-f199.google.com with SMTP id a66-20020ae9e845000000b0067b308a9f56so9818816qkg.21
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 07:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VG0h6aZGi/DKotr1u/FQ4KTyRHDeLftG2T0kmjcokAs=;
        b=Md/xhb06X+mSd6tB+1GDnbj1iaH5per9ht2/4NKWya5OXpRc9xaAjI3A0z3LAeDYM0
         igjbs5badlGedJqTC17XTasIZhqDlRmuEcvnyY3sTO97/rDSGLfGeO+EusSu380ohyWT
         vy7f652K2tDwqOMSy9ougB8ZeVsUZIoZADpqa4n2xuKR12oV2XpwKYX593RgSbLcgl1Z
         VC5sZ4d4plcgxSFyb3zl76NxOcBGs3wK/DojjXQaNSmHJ3R7TkzLpwt2zJcHZiDDBw6Z
         K9nHhi0m+vxI3jhBHVfFaLNd9WKQvV6F0yM9F+6AIiOYyy+9zpMNOZ7Mb+3wtcJU3K1B
         6Q6A==
X-Gm-Message-State: AOAM530wS+pb3DfLsx2CkZFpoIhhXDgVJKKhvMqKFS8dxEn5Y5vGsrDZ
	R38nkELBlHsMBIt3yM8DjhvnFzt7qK83VmsY3QiHwA6PVj0/xnCMpXcERB6jmNLQnfmV2e+CJzD
	aYBuomKz3aktK/c9kGLl0j+JIs3DHibI0OZGs6E9k39GW+Z6T4Zza70hq67Rp
X-Received: by 2002:a05:6214:20c6:b0:440:f78c:4ad with SMTP id 6-20020a05621420c600b00440f78c04admr13176175qve.112.1647871563451;
        Mon, 21 Mar 2022 07:06:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNogMKYOxmGdk0YIgGRQvxb9KrtAJefEDo+vvNMGUuVX+R+sy5QoO9FAlecHBkxwBde1eN3w==
X-Received: by 2002:a05:6214:20c6:b0:440:f78c:4ad with SMTP id 6-20020a05621420c600b00440f78c04admr13176133qve.112.1647871562990;
        Mon, 21 Mar 2022 07:06:02 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id x20-20020ac85f14000000b002e1ee1c56c3sm10538034qta.76.2022.03.21.07.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 07:06:02 -0700 (PDT)
Subject: Re: [PATCH v2] livepatch: Reorder to use before freeing a pointer
To: Joe Lawrence <joe.lawrence@redhat.com>, jpoimboe@redhat.com,
 jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, nathan@kernel.org,
 ndesaulniers@google.com
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20220320015143.2208591-1-trix@redhat.com>
 <3ee9826e-b770-d015-0251-e9770172d973@redhat.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <b4b347ea-5b12-223a-86f5-c13aee714f08@redhat.com>
Date: Mon, 21 Mar 2022 07:05:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3ee9826e-b770-d015-0251-e9770172d973@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/21/22 6:39 AM, Joe Lawrence wrote:
> On 3/19/22 9:51 PM, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> Clang static analysis reports this issue
>> livepatch-shadow-fix1.c:113:2: warning: Use of
>>    memory after it is freed
>>    pr_info("%s: dummy @ %p, prevented leak @ %p\n",
>>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> The pointer is freed in the previous statement.
>> Reorder the pr_info to report before the free.
>>
>> Similar issue in livepatch-shadow-fix2.c
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>> v2: Fix similar issue in livepatch-shadow-fix2.c
>>
>>   samples/livepatch/livepatch-shadow-fix1.c | 2 +-
>>   samples/livepatch/livepatch-shadow-fix2.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/samples/livepatch/livepatch-shadow-fix1.c b/samples/livepatch/livepatch-shadow-fix1.c
>> index 918ce17b43fda..6701641bf12d4 100644
>> --- a/samples/livepatch/livepatch-shadow-fix1.c
>> +++ b/samples/livepatch/livepatch-shadow-fix1.c
>> @@ -109,9 +109,9 @@ static void livepatch_fix1_dummy_leak_dtor(void *obj, void *shadow_data)
>>   	void *d = obj;
>>   	int **shadow_leak = shadow_data;
>>   
>> -	kfree(*shadow_leak);
>>   	pr_info("%s: dummy @ %p, prevented leak @ %p\n",
>>   			 __func__, d, *shadow_leak);
>> +	kfree(*shadow_leak);
>>   }
>>   
>>   static void livepatch_fix1_dummy_free(struct dummy *d)
>> diff --git a/samples/livepatch/livepatch-shadow-fix2.c b/samples/livepatch/livepatch-shadow-fix2.c
>> index 29fe5cd420472..361046a4f10cf 100644
>> --- a/samples/livepatch/livepatch-shadow-fix2.c
>> +++ b/samples/livepatch/livepatch-shadow-fix2.c
>> @@ -61,9 +61,9 @@ static void livepatch_fix2_dummy_leak_dtor(void *obj, void *shadow_data)
>>   	void *d = obj;
>>   	int **shadow_leak = shadow_data;
>>   
>> -	kfree(*shadow_leak);
>>   	pr_info("%s: dummy @ %p, prevented leak @ %p\n",
>>   			 __func__, d, *shadow_leak);
>> +	kfree(*shadow_leak);
>>   }
>>   
>>   static void livepatch_fix2_dummy_free(struct dummy *d)
>>
> Hi Tom,
>
> Ordering doesn't matter for the example, so let's clean up the static
> analysis.
>
> Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
>
> But for my sanity, isn't this a false positive?  There shouldn't be harm
> in printing the pointer itself, even after what it points to has been
> freed, i.e.
>
> 	int *i = malloc(sizeof(*i));
> 	free(i);
> 	printf("%p\n", i);      << ok
> 	printf("%d\n", *i);     << NOT ok
>
> But I suppose clang doesn't know that the passed pointer isn't getting
> dereferenced by the function, so it throws up a warning?  Just curious
> what your experience has been with respect to these reports.

The analysis it good for static functions, for extern functions it has 
nothing to analyze so a worst case is assumed.

I agree this is likely a false positive.

Tom

>
> Thanks,


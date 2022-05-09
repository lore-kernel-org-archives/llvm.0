Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C351FA0
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652107890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8UVq6qOztbNiFbC60Rq16xxLiyW1+7VYtE1rflVyLBY=;
	b=I1AM7iLZtQveZ17lWazVuYKgYj1R/LLKp71Gm2sUZuqTfaP5Gsz4cbZPO8CkcesHMZvxFI
	Ylz9WEO4hkhkT5waU2GW6Ws4u+t8mrdl2VFKOwt0ZY3E6f6ui8PkzQ+hrQ24gHLip9NvHd
	ivCMbOg+GyyzfhRbZlWuYmEHYtUqgts=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-PdbzMQdAOoWQIs9hFVuE5g-1; Mon, 09 May 2022 10:51:29 -0400
X-MC-Unique: PdbzMQdAOoWQIs9hFVuE5g-1
Received: by mail-qt1-f198.google.com with SMTP id t25-20020a05622a181900b002f3b32a6e30so12263825qtc.11
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 07:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8UVq6qOztbNiFbC60Rq16xxLiyW1+7VYtE1rflVyLBY=;
        b=mkaTNoM071EBUJr3DOPq8JoUr9QH3xLurB7Ff566x9KufWi8vXTBp+gBvcYR3pjSZQ
         cX0YMLbaatmHUxB3UUfdU2VHxn8+qaSX1xpH17XNz4z4UgzNjGGugdPZFM98JPY2lsMg
         MiwMnvHJAABO6+7seDZHz66ZPyVXbzpmhW/J0oH2mRFFc9HJ4ZGrhuer8ClpVtdUMMRQ
         1jJ1THVdROSJ4JXOBHZbGjbNhNFngEgbHiICMfMFu0OFJwSMhFwtbM7mXGHG0kNDyO11
         uXlZWFa2w+Gqn0+ysMVud8lnLfk1b/kbVfRtTiMr1LmkBgb8XCeY7jEqqPCav3MbRGNq
         k3Gw==
X-Gm-Message-State: AOAM530tNccDyW09ZWh0fhX7R/urmpbGuDNXEvsX0zo8hd7PzCnSS1Wk
	CPfNVwIO0nY1n8jdjv4/WKve7PpLFKeZExF+vaR+i5QXOGnG10+/3fsSduj/kHZxAJUv1w3fvaL
	QecrgoV3M+lIsfPeFJrp8KtrVWKvqYYYAjOuTUQn1L22Q7mjT3AFrN+z4CjsE
X-Received: by 2002:ac8:59ce:0:b0:2f3:441b:d323 with SMTP id f14-20020ac859ce000000b002f3441bd323mr15045094qtf.457.1652107888893;
        Mon, 09 May 2022 07:51:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNe34D/RVQcV6ZeQ/rMdk1Wm0+Lq4pK3wd1Ic18LQOL9wsashp02+XVFeEkRJ0xQmihol8aA==
X-Received: by 2002:ac8:59ce:0:b0:2f3:441b:d323 with SMTP id f14-20020ac859ce000000b002f3441bd323mr15045062qtf.457.1652107888630;
        Mon, 09 May 2022 07:51:28 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id i1-20020a375401000000b0069fc13ce246sm6992189qkb.119.2022.05.09.07.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 07:51:27 -0700 (PDT)
Subject: Re: [PATCH] mm/shmem: initialize folio to NULL
To: Matthew Wilcox <willy@infradead.org>
Cc: hughd@google.com, akpm@linux-foundation.org, nathan@kernel.org,
 ndesaulniers@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20220509123116.3169267-1-trix@redhat.com>
 <YnkeUz0Z2O9Xd5O+@casper.infradead.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <0f066c75-121e-05f2-41ed-0d029bf70221@redhat.com>
Date: Mon, 9 May 2022 07:51:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YnkeUz0Z2O9Xd5O+@casper.infradead.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/9/22 6:59 AM, Matthew Wilcox wrote:
> On Mon, May 09, 2022 at 08:31:16AM -0400, Tom Rix wrote:
>> The clang build fails with
>> mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>>    if (!page) {
>>         ^~~~~
>> The error handler for !page jumps to an if-check for an unset folio.
>> So initialize folio to NULL.
> I appreciate you're trying to help, but the fourth report of a problem
> adds more noise than utility.
>
> https://lore.kernel.org/linux-mm/?q=shmem+folio
>
> shows emails about this from the cgelbot, Dan Carpenter, SeongJae Park,
> Colin King, Nathan Chancellor and Sebastian Siewior.  So actually you
> were seventh, not fourth.

 From my point of view, the build has been broken for a week.

It would be good if this and the other folio issue was fixed in 
linux-next soon.

Tom

>


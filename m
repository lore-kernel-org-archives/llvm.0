Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8747A22
	for <llvm@lists.linux.dev>; Sat,  9 Apr 2022 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649520227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qtkyBcEIcgGitzE6/jMR0BHvrVCs5FpvV9wdXJQk7lw=;
	b=So9ZYsvUUYFv0+tFpjXOlo0NjZ5sovPm3l8uLkZ+YqXt+U6SBPd1XiLb5v9GdlTFWdWDj/
	y0n25AHTzYXzpt8IBISMDnPHY1xM6otzEL6yCINzraP6hYamPGiqL7D2/QHuz7shCnI0tx
	ib0n7SpHLhmjNPPJuyzlhqkrQ0IOel8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-pQg3wfPxMcybOlEbGMBfVA-1; Sat, 09 Apr 2022 12:03:44 -0400
X-MC-Unique: pQg3wfPxMcybOlEbGMBfVA-1
Received: by mail-qt1-f200.google.com with SMTP id s17-20020a05622a1a9100b002ed3cb8acb3so36818qtc.10
        for <llvm@lists.linux.dev>; Sat, 09 Apr 2022 09:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qtkyBcEIcgGitzE6/jMR0BHvrVCs5FpvV9wdXJQk7lw=;
        b=kPvRtzQrMh9xYnGcxkIreeMjCcSF/q//QuWq/qab9NN4plfRvHSnx7eSuRuIl3jS9k
         w7Bc4rxjxyRspPXTG+43JV9AuSozDS4jgTdmxNZFoaB1xQGouGrhNfHfwtd4vWXX7OWB
         0RLh6+bv5+CNbBZEjBf03mueddsgNUBBIO7WrmLO9yvd099s5mqaCPetKT/kEHK7/RsB
         2KhyRMwjGdrujHT/4UbihesTPAS+Bpm4NWJnytgxjwnpycyyJ5AS6v+Wi4N7r5YtOtth
         oVq0kpzr85r+Yg2OWUxQDJUz3uVTi0L49cJKP0a/XFmyyI2GnKSjT/a2iuZ/fGAHZiky
         svtA==
X-Gm-Message-State: AOAM530bf7nWDXFQvgGzpzwAoLL5KwgS21vCQVeReRVPj28JbGDmBsGB
	gtoZdUCrM/Nob7cm7SnSFwQ99YN0KOubdOUW6wXUmyVRwEV/zBJ0jVDz/Jx9fh3rN2zCPCAqBlk
	Pwm+1Bf2V4vELXzzrdrwoXz1nWaFg7OXSfmzD474vJVBTMrUCStVDdxPqq/cY
X-Received: by 2002:a05:620a:4694:b0:67e:ca07:4d46 with SMTP id bq20-20020a05620a469400b0067eca074d46mr16310338qkb.624.1649520223837;
        Sat, 09 Apr 2022 09:03:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9gLy9N+EtbprXxWppsB8/pZMfaSy4i+GT0eKsrmpJpPW6wWHSwAV/TaLkqZlqoRiGySXFDw==
X-Received: by 2002:a05:620a:4694:b0:67e:ca07:4d46 with SMTP id bq20-20020a05620a469400b0067eca074d46mr16310304qkb.624.1649520223470;
        Sat, 09 Apr 2022 09:03:43 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id o6-20020a05620a22c600b0067d247816eesm15150840qki.85.2022.04.09.09.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 09:03:43 -0700 (PDT)
Subject: Re: [PATCH] block: Remove redundant assignments
To: Michal Orzel <michalorzel.eng@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 "Richard Russon (FlatCap)" <ldm@flatcap.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, llvm@lists.linux.dev
References: <20220409101933.207157-1-michalorzel.eng@gmail.com>
 <20220409101933.207157-2-michalorzel.eng@gmail.com>
 <a56d1184-d399-d5f8-765f-5a4f35dacd5e@redhat.com>
 <446a3e88-4c14-300d-862a-1279274c3760@gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <c2c40f00-777c-f19a-eb5f-6e978ddd6bcf@redhat.com>
Date: Sat, 9 Apr 2022 09:03:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <446a3e88-4c14-300d-862a-1279274c3760@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 4/9/22 6:20 AM, Michal Orzel wrote:
> Hi Tom,
>
>> On 4/9/22 3:19 AM, Michal Orzel wrote:
>>> Get rid of redundant assignments which end up in values not being
>>> read either because they are overwritten or the function ends.
>> This log is the same as your last patch.
>>
>> Instead of a general statement on deadstores, a more specific
>>
>> analysis of the setting being removed would be helpful.
>>
>> This will mean splitting the patch to match the analysis.
>>
>> Tom
>>
> I think that this explanation in a commit is enough for such a trivial patch.
> It informs that we are fixing clang-tidy findings related to deadstores
> in a block subsystem. What analysis would you want to see?
> Something like "Remove deadstore assignment ret = -EINVAL  in a function bio_map_user_iov" ?
> I think that it will create too much of not needed overhead.

The compiler should remove these already.  All of the static analyzers 
produce false positives, if you do not provide analysis the reviewer has 
to assume you have not done any and has to do the false positive 
analysis themselves. This burdens the reviewer for something of small 
value that can be dismissed as churn.

Tom

>
> Cheers,
> Michal
>


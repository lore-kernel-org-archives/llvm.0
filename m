Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BFC1850
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 12:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679315396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AfqpIgX4fLbKXurM7Kf6KLvRPea8XVgc4JZHuTZ7PDI=;
	b=N5gKHtCt/YCBS5s9k5DAhzYPOSwlJTVRdfV+N+AIFRDJ3vPuj/Ya+nQDLS90d0EXm97QAf
	Eut8MNxst79XBxjZ+WsYysCa/KX7xQCZ+/GGq5tE+Bb8rPM/yY30Y/fxG/zjV8kcOHdHDo
	BXkhbuk6bh5h4QsOd+2nIjoXGXunWvQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-863AkcHqNGKxF4J6kmor_Q-1; Mon, 20 Mar 2023 08:29:55 -0400
X-MC-Unique: 863AkcHqNGKxF4J6kmor_Q-1
Received: by mail-qk1-f200.google.com with SMTP id s21-20020a05620a0bd500b0074234f33f24so5212007qki.3
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 05:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679315395;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AfqpIgX4fLbKXurM7Kf6KLvRPea8XVgc4JZHuTZ7PDI=;
        b=SB8wCwmGRNDIOlMJE/yl8sX0pf6dlQpnU5t7VLGy8g1UOTJu63z70meL/ewBmBlCPG
         D2g1Ueanj6N7jZOVjZMaWDoTcxeiXRlVyD3GrgFG+GHlrHfwPznxY3tqF5G1OLFBqBTm
         Wx7m8L6Gj2X8aVbB+UXsl+DTfY5qSnX2EQKFNHRWzhhsgELTK3D1OVjEV2xBpeMY6AC2
         Tefpp/0umgpfUiyKOQv5pPMKD1gH1bRDoos2mEIjpMmT1hDMlaU1H7bABXGSmeTnwAPd
         lsKue52lOHOAdybg+jzE5H60BzGAZCjjDm3bWTSZlYNYiW9CDDOV2CNJB4TnNlXkDNbg
         0wNQ==
X-Gm-Message-State: AO0yUKXCkEHv9fetVHSMffxS4riko/KolFtviu8w9huAHC9Z+iO5GZiL
	lg7BEnUdgDghwn/PBDknEX1+REw1tQwv2KjH6iSQQMDpNFp5rayCQ1GebP+YAYT/uNSKgRiWbL0
	Q7HipgKeHIh7t02IQbJCp+KPKdeQa+AGiJnEkFtK25PrX7g2HHffTxIttuk2+/ESICf3K
X-Received: by 2002:ac8:578e:0:b0:3bf:d0b1:433d with SMTP id v14-20020ac8578e000000b003bfd0b1433dmr27832949qta.60.1679315394779;
        Mon, 20 Mar 2023 05:29:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Xkg5GXCW1nwGbZIqz+rPOxATrxz/ugD6phHqlEFjOnuUqwxEdyf/hjO4XymAepfNWlKckOA==
X-Received: by 2002:ac8:578e:0:b0:3bf:d0b1:433d with SMTP id v14-20020ac8578e000000b003bfd0b1433dmr27832914qta.60.1679315394487;
        Mon, 20 Mar 2023 05:29:54 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id r19-20020ac85213000000b003b643951117sm6511664qtn.38.2023.03.20.05.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 05:29:54 -0700 (PDT)
Subject: Re: [PATCH] net: cxgb3: remove unused fl_to_qset function
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: rajur@chelsio.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230319172433.1708161-1-trix@redhat.com>
 <20230319174525.kwhlxme7gh45b3un@soft-dev3-1>
From: Tom Rix <trix@redhat.com>
Message-ID: <21aad6c8-8abe-79e0-eb47-d03e964419a2@redhat.com>
Date: Mon, 20 Mar 2023 05:29:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230319174525.kwhlxme7gh45b3un@soft-dev3-1>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/19/23 10:45 AM, Horatiu Vultur wrote:
> The 03/19/2023 13:24, Tom Rix wrote:
>
> Hi Tom,
>
>> clang with W=1 reports
>> drivers/net/ethernet/chelsio/cxgb3/sge.c:169:32: error: unused function
>>    'fl_to_qset' [-Werror,-Wunused-function]
>> static inline struct sge_qset *fl_to_qset(const struct sge_fl *q, int qidx)
>>                                 ^
>> This function is not used, so remove it.
> Don't forget to mention in the subject which tree is targeting this
> patch.

This and all my similar fixes/cleanup are against -next.

What prefix would you like to see ?

Tom

> Other than that looks OK.
>
> Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/net/ethernet/chelsio/cxgb3/sge.c | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/chelsio/cxgb3/sge.c b/drivers/net/ethernet/chelsio/cxgb3/sge.c
>> index 62dfbdd33365..efa7f401529e 100644
>> --- a/drivers/net/ethernet/chelsio/cxgb3/sge.c
>> +++ b/drivers/net/ethernet/chelsio/cxgb3/sge.c
>> @@ -166,11 +166,6 @@ static u8 flit_desc_map[] = {
>>   #endif
>>   };
>>
>> -static inline struct sge_qset *fl_to_qset(const struct sge_fl *q, int qidx)
>> -{
>> -       return container_of(q, struct sge_qset, fl[qidx]);
>> -}
>> -
>>   static inline struct sge_qset *rspq_to_qset(const struct sge_rspq *q)
>>   {
>>          return container_of(q, struct sge_qset, rspq);
>> --
>> 2.27.0
>>


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C91B23A6
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 17:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673371084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oSRn+zq7cMv1vgKgsf1PXv9JTi1nqzkgBPx3inNDfGg=;
	b=AXSR8gygkXqnmLii/boDLR3H3zLiVaymuQez1gkpuM9aw51Thmdl2fn3qum8yXfExqcGxC
	vqawo3Cq5Wjh2CA7v9X+pe0J1WTzaPo1almSd/FTN73Peor+0cRJLhQpbCfoT780mSSW98
	1ONsiVXIIQIOIkdxLAzgDcE1q0dcRDQ=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-r1gXR0qPMhKL8UB8TkHlaQ-1; Tue, 10 Jan 2023 12:18:03 -0500
X-MC-Unique: r1gXR0qPMhKL8UB8TkHlaQ-1
Received: by mail-pg1-f197.google.com with SMTP id e5-20020a63f545000000b0049b36d5a272so5485066pgk.12
        for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 09:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSRn+zq7cMv1vgKgsf1PXv9JTi1nqzkgBPx3inNDfGg=;
        b=e4KR0zuLGeUJpS35uWxi2Q1aAp0GIiOtzsxvuGu+L0ODBEw+PNjDLiZNQLzIbgjrhY
         JsRq9k7agUmJcEYZs0GGuG9CmTGlqJSACJvb5wegvnziPaLW4IQTz5rLKWxC5CwF8BNc
         1iDQBFJN/mAbHf0BttbrIEudFVRiLrXKuzFs6ISjKzsZFVyTVu/0gxDVIcyDaoKhvIlm
         sXNfrNwKZHrjpdtotNbGhQPXBbkZfqZlAHhjzMT7WdzYoD5EnEZQyd1Eq37Ux0u5B45v
         vr4sGU0Ew5yj6ykvQ5t4ALGMFXvQzO8PrGsOKbpTkYsRtbX0PGvFjKjr2TO+i597RIML
         vyYg==
X-Gm-Message-State: AFqh2krvKxmhZ7WhVULsHX/CJ//5y3ErGPxvGdO/C+CyjsZ4zvsLrvY8
	lg9wH0y8fXrvQMGV5Xv/lGdW9Iv1IYFpQDENt7yLyhzTaw2diw31MhlU8aVOrWwGgNaoNVUi26l
	dJ5cA4SwxRB7cCfd6iwCVQo5fVrFTuNDKO1G2dDdJ/kwj+gZoQBFQy5KYq29u
X-Received: by 2002:a17:902:c10a:b0:188:bc62:276f with SMTP id 10-20020a170902c10a00b00188bc62276fmr69676434pli.3.1673371080702;
        Tue, 10 Jan 2023 09:18:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsU3vBw1ZUxXjKxBkeKXtV0X28zeBa2/Q5nyixIXc9QFNRqR7eJuvi/vXCcUYzbwQ29Ruev+Q==
X-Received: by 2002:a17:902:c10a:b0:188:bc62:276f with SMTP id 10-20020a170902c10a00b00188bc62276fmr69676397pli.3.1673371080304;
        Tue, 10 Jan 2023 09:18:00 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902a3cd00b0018911ae9dfasm8355221plb.232.2023.01.10.09.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 09:17:59 -0800 (PST)
Subject: Re: [PATCH] net: ena: initialize dim_sample
To: Shay Agroskin <shayagr@amazon.com>, Eric Dumazet <edumazet@google.com>
Cc: akiyano@amazon.com, darinzon@amazon.com, ndagan@amazon.com,
 saeedb@amazon.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 nathan@kernel.org, ndesaulniers@google.com, khalasa@piap.pl,
 wsa+renesas@sang-engineering.com, yuancan@huawei.com, tglx@linutronix.de,
 42.hyeyoo@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230108143843.2987732-1-trix@redhat.com>
 <CANn89iLFtrQm-E5BRwgKFw4xRZiOOdWg-WTFi5eZsg7ycq2szg@mail.gmail.com>
 <pj41zlpmbmba16.fsf@u570694869fb251.ant.amazon.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <db824c89-13f2-3349-9dd0-0fb7559c6273@redhat.com>
Date: Tue, 10 Jan 2023 09:17:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <pj41zlpmbmba16.fsf@u570694869fb251.ant.amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 1/10/23 8:58 AM, Shay Agroskin wrote:
>
> Eric Dumazet <edumazet@google.com> writes:
>
>> On Sun, Jan 8, 2023 at 3:38 PM Tom Rix <trix@redhat.com> wrote:
>>>
>>> clang static analysis reports this problem
>>> drivers/net/ethernet/amazon/ena/ena_netdev.c:1821:2: warning: 
>>> Passed-by-value struct
>>>   argument contains uninitialized data (e.g., field: 'comp_ctr') 
>>> [core.CallAndMessage]
>>>         net_dim(&ena_napi->dim, dim_sample);
>>>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> net_dim can call dim_calc_stats() which uses the comp_ctr element,
>>> so it must be initialized.
>>
>> This seems to be a dim_update_sample() problem really, when comp_ctr
>> has been added...
>>
>> Your patch works, but we could avoid pre-initializing dim_sample in 
>> all callers,
>> then re-writing all but one field...
>>
>> diff --git a/include/linux/dim.h b/include/linux/dim.h
>> index 
>> 6c5733981563eadf5f06c59c5dc97df961692b02..4604ced4517268ef8912cd8053ac8f4d2630f977
>> 100644
>> --- a/include/linux/dim.h
>> +++ b/include/linux/dim.h
>> @@ -254,6 +254,7 @@ dim_update_sample(u16 event_ctr, u64 packets, u64
>> bytes, struct dim_sample *s)
>>         s->pkt_ctr   = packets;
>>         s->byte_ctr  = bytes;
>>         s->event_ctr = event_ctr;
>> +       s->comp_ctr  = 0;
>>  }
>>
>>  /**
>
> Hi,
>
> I'd rather go with Eric's solution to this issue than zero the whole 
> struct in ENA

Please look at the other callers of dim_update_sample.  The common 
pattern is to initialize the struct.

This alternative will work, but the pattern of initializing the struct 
the other (~20) callers should be refactored.

Tom

>
> Thanks,
> Shay
>


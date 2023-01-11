Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EAB2C9A
	for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673447399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsSTrNIRFbZiv8kfvwsD4ZTbADoW+ucjY/egJOCNNtQ=;
	b=gbFYpsFRVd0vSEJKpyF4kzAFujz0fp5Z/WL3zh33vUz8GXIGhjP1kav3w4OhJcFb4Vqc5J
	JmfTyE8AcvVvCvZD6f3H/tx5khT26lf+Hs2NLPVxltzhu4PpUt61+4ojLCRjq1FIueei1/
	geruWGBV5kqFLab0zAEj79tI4NLrfIg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-50-Na7KwwqbMM61EwoYSmrWvg-1; Wed, 11 Jan 2023 09:29:58 -0500
X-MC-Unique: Na7KwwqbMM61EwoYSmrWvg-1
Received: by mail-pj1-f70.google.com with SMTP id r5-20020a17090a1bc500b00227067dde1eso4783241pjr.0
        for <llvm@lists.linux.dev>; Wed, 11 Jan 2023 06:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsSTrNIRFbZiv8kfvwsD4ZTbADoW+ucjY/egJOCNNtQ=;
        b=W5HUYloLmpbM1yh8xDUMPkOUB4TOu9vSg/UL8d3pI/esTV1NLQQixleHrnTazUODgb
         Be4j5hZQy7v6rqKdEqHuT5NMbehj3IrD0lOd0LS4H7ujNoQiuV6UHt5bYOD8wgJ3TXD0
         Mchl9MEh3bBoLpWy4D2g3bL8r66wbrbb9+uqOopTUHoYq++TwNwjjMXV167DlQTE6Q0U
         S4TjTqSGhCAIRX4vaQe9KWGHE6YUzy8iqcbL4qVALWii0WFsUIheVKPlLi0d4xNjmyFl
         DDSzCxJbcwljUSo9A3XTR66GYRyElK8KdWvinrcGRa8uNHiepfP4VHhXPq6uoqLkt3jj
         KKkw==
X-Gm-Message-State: AFqh2kqfjHVPW4bmDXnrlym/FgzSwxMsPlyRcbWmjA+mfE4i7zGLefbE
	q/TZKVHNdysLsbxgXgNbMhoRavEjFHGl89SEcNVWUOyz5M0IqpzkjQl1Y6gAsSbo9eIW22JA1k+
	YsmSH4zfES4cd4jKyb6xlqsv8Dk/ULQfmuh5gVOg6mz7UR5Dj1yq6+YMS1RD/
X-Received: by 2002:a17:90a:5791:b0:227:1c85:f5f4 with SMTP id g17-20020a17090a579100b002271c85f5f4mr9128920pji.5.1673447397110;
        Wed, 11 Jan 2023 06:29:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuzxWKbwqGBpXQocCXlLeRIi2BkJQlAdtwtg8OMzT49+l1gAOPM2skXKEppTEx/Xozm+TfCYg==
X-Received: by 2002:a17:90a:5791:b0:227:1c85:f5f4 with SMTP id g17-20020a17090a579100b002271c85f5f4mr9128879pji.5.1673447396616;
        Wed, 11 Jan 2023 06:29:56 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id r60-20020a17090a43c200b002271b43e528sm5105448pjg.33.2023.01.11.06.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 06:29:56 -0800 (PST)
Subject: Re: [PATCH] net: ena: initialize dim_sample
To: Shay Agroskin <shayagr@amazon.com>
Cc: Eric Dumazet <edumazet@google.com>, akiyano@amazon.com,
 darinzon@amazon.com, ndagan@amazon.com, saeedb@amazon.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, khalasa@piap.pl, wsa+renesas@sang-engineering.com,
 yuancan@huawei.com, tglx@linutronix.de, 42.hyeyoo@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230108143843.2987732-1-trix@redhat.com>
 <CANn89iLFtrQm-E5BRwgKFw4xRZiOOdWg-WTFi5eZsg7ycq2szg@mail.gmail.com>
 <pj41zlpmbmba16.fsf@u570694869fb251.ant.amazon.com>
 <db824c89-13f2-3349-9dd0-0fb7559c6273@redhat.com>
 <pj41zllem9bglr.fsf@u570694869fb251.ant.amazon.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <010f0cef-0f6e-1d4e-47ec-29a3c667b97a@redhat.com>
Date: Wed, 11 Jan 2023 06:29:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <pj41zllem9bglr.fsf@u570694869fb251.ant.amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 1/11/23 12:46 AM, Shay Agroskin wrote:
>
> Tom Rix <trix@redhat.com> writes:
>
>> On 1/10/23 8:58 AM, Shay Agroskin wrote:
>>>
>>> Eric Dumazet <edumazet@google.com> writes:
>>>
>>>> On Sun, Jan 8, 2023 at 3:38 PM Tom Rix <trix@redhat.com> wrote:
>>>>>
>>>>> clang static analysis reports this problem
>>>>> drivers/net/ethernet/amazon/ena/ena_netdev.c:1821:2: warning:
>>>>> Passed-by-value struct
>>>>>   argument contains uninitialized data (e.g., field: 'comp_ctr')
>>>>> [core.CallAndMessage]
>>>>>         net_dim(&ena_napi->dim, dim_sample);
>>>>>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>
>>>>> net_dim can call dim_calc_stats() which uses the comp_ctr element,
>>>>> so it must be initialized.
>>>>
>>>> This seems to be a dim_update_sample() problem really, when comp_ctr
>>>> has been added...
>>>>
>>>> Your patch works, but we could avoid pre-initializing dim_sample in
>>>> all callers,
>>>> then re-writing all but one field...
>>>>
>>>> diff --git a/include/linux/dim.h b/include/linux/dim.h
>>>> index
>>>> 6c5733981563eadf5f06c59c5dc97df961692b02..4604ced4517268ef8912cd8053ac8f4d2630f977 
>>>>
>>>> 100644
>>>> --- a/include/linux/dim.h
>>>> +++ b/include/linux/dim.h
>>>> @@ -254,6 +254,7 @@ dim_update_sample(u16 event_ctr, u64 packets, u64
>>>> bytes, struct dim_sample *s)
>>>>         s->pkt_ctr   = packets;
>>>>         s->byte_ctr  = bytes;
>>>>         s->event_ctr = event_ctr;
>>>> +       s->comp_ctr  = 0;
>>>>  }
>>>>
>>>>  /**
>>>
>>> Hi,
>>>
>>> I'd rather go with Eric's solution to this issue than zero the whole
>>> struct in ENA
>>
>> Please look at the other callers of dim_update_sample.  The common
>> pattern is to initialize the struct.
>>
>> This alternative will work, but the pattern of initializing the struct
>> the other (~20) callers should be refactored.
>>
>> Tom
>>
>
> While Eric's patch might be bigger if you also remove the 
> pre-initialization in the other drivers, the Linux code itself would 
> be smaller (granted not significantly) and
> it make less room for pitfalls in adding DIM support in other drivers.
>
> Is there a good argument against using Eric's patch other than 'the 
> other patch would be bigger' ?

No, I think it a better approach and if Eric can take it forward that 
would be great.

However when you start refactoring, it may grow larger than the single fix.

For instance, passing the structure by value could be changed to passing 
by reference.

Tom

>
> Shay
>
>>>
>>> Thanks,
>>> Shay
>>>
>


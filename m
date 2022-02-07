Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3A02F26
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 20:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644264569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAKAsUPUKTpUUZnEXmxnxU0YG6aRlUUAiMH3EfYzKGI=;
	b=Oktdx55Cy5+2kois0hc1tjCINo1p98Db30JtaAn6aIO7gJhyjKhxTpsow32a1Nf4z/SoKR
	fVsv5Pniy0Uei2riVwRXpLUpLPaJbOoQ5qQ06LNpoyqpNIcl3aCkNTUZTDT6boCczQe+qH
	fx6OFH8dZdbHhW0NJ42zkvW8BtMYeQ4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-ElhphNsBOzauo8_MU1FBUA-1; Mon, 07 Feb 2022 15:09:28 -0500
X-MC-Unique: ElhphNsBOzauo8_MU1FBUA-1
Received: by mail-qv1-f72.google.com with SMTP id iv13-20020ad45ced000000b004248c87cc4cso9433762qvb.10
        for <llvm@lists.linux.dev>; Mon, 07 Feb 2022 12:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oAKAsUPUKTpUUZnEXmxnxU0YG6aRlUUAiMH3EfYzKGI=;
        b=WLGaFxF6PecUQccLZn5ziHzpuIMt25wjZsbsGW38lU//CORzjSq90eXq6+wW94WR61
         5EQ6cF6AH2Dcq6x45IUvPp++Xohnv/zHkMdGQNekAJTs48cK6/xxPqugE8ukajmUFLuo
         HvtcIunLJo2FcUI9uf6UnJkd6KzNiMDKrKKxZjHpx3lO2NOyoqGKzFUnGbmR4OeATtIn
         pH5oa2Pb6y+5r/EwBQIr5mgYhdncwPxylhz/PAPgutirNzpryDPfajfSZBf+jpoyWb6J
         9QDmxANN52F4J2Q0tEd8eg0/H9rYT1IDz535SpwAB+OrhsJfFIXbljTneDUKBmTF12sp
         yqHQ==
X-Gm-Message-State: AOAM530IDZlhax5z2eBMTDF3p/o9DLJC/u7EiRMwIYqsG+Jlb7Qda9G1
	lnVshxRNPxREy7zuWDt8y80tHmT4xgrvsLZYP+oQlk+ldZ7u8FYSO2hUz5mDqYMJs/SA7e9+CFx
	ASqIiJheO5EaL6VHT7UOLfWJqTJiRAqPUj8GxXdxHr8XF+8TUWuXgeFiNOJ5x
X-Received: by 2002:a05:622a:592:: with SMTP id c18mr830656qtb.135.1644264567698;
        Mon, 07 Feb 2022 12:09:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywAnyIcF5clfnoxlwiuAguCyMOTb/Q0XK6fapq4xAke4rq7+JEFToSVHf/fm0Di7oe+k2noA==
X-Received: by 2002:a05:622a:592:: with SMTP id c18mr830628qtb.135.1644264567407;
        Mon, 07 Feb 2022 12:09:27 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id s9sm4840314qki.101.2022.02.07.12.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 12:09:26 -0800 (PST)
Subject: Re: [PATCH] io_uring: fix uninitialized return
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: axboe@kernel.dk, asml.silence@gmail.com, nathan@kernel.org,
 usama.arif@bytedance.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220207185126.2085525-1-trix@redhat.com>
 <CAKwvOdnyPZ6w5qg-+W0H0ait3KUV5S9+-gmty-ANK46BeKd5VQ@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <831dd322-4931-2285-4408-79df5ab1df64@redhat.com>
Date: Mon, 7 Feb 2022 12:09:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnyPZ6w5qg-+W0H0ait3KUV5S9+-gmty-ANK46BeKd5VQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2/7/22 11:48 AM, Nick Desaulniers wrote:
> On Mon, Feb 7, 2022 at 10:51 AM <trix@redhat.com> wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> The clang build fails with this error
>> io_uring.c:9396:9: error: variable 'ret' is uninitialized when used here
>>          return ret;
>>                 ^~~~
>> Return 0 directly.
>>
>> Fixes: b77e315a9644 ("io_uring: avoid ring quiesce while registering/unregistering eventfd")
>> Signed-off-by: Tom Rix <trix@redhat.com>
> Thanks for the patch:
> See also:
> https://lore.kernel.org/llvm/20220207162410.1013466-1-nathan@kernel.org/

No worries as long as it gets fixed.

Tom

>
>> ---
>>   fs/io_uring.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/io_uring.c b/fs/io_uring.c
>> index aadabb31d6da7..74afb96af214c 100644
>> --- a/fs/io_uring.c
>> +++ b/fs/io_uring.c
>> @@ -9393,7 +9393,7 @@ static int io_eventfd_register(struct io_ring_ctx *ctx, void __user *arg,
>>          ev_fd->eventfd_async = eventfd_async;
>>
>>          rcu_assign_pointer(ctx->io_ev_fd, ev_fd);
>> -       return ret;
>> +       return 0;
>>   }
>>
>>   static void io_eventfd_put(struct rcu_head *rcu)
>> --
>> 2.26.3
>>
>


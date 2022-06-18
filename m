Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C3F7B
	for <llvm@lists.linux.dev>; Sat, 18 Jun 2022 12:08:16 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id es26so7605843edb.4
        for <llvm@lists.linux.dev>; Sat, 18 Jun 2022 05:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LomvdWvqgBhsPwcw6xFc/20qQFIhXtLS6hXt3K0gAfw=;
        b=XfRTA6M6BiZmFDOi14GICJzIjbXRUCniw4aIoxkaKSv0Gg73p8hg0NTU3TR8UVijiU
         hnUHKnyFtVFD0GbuwzTy4lODOKb1nDX7fegSBEQtM4k0t5MYpWO9dJKv5MZReIid5pra
         /tJFH2jU3H/iBOshhUP/9Bsxh7U8t6ySv+kN5SNitNjDqz7oJxVmipv6Vtjo1nf0YhZp
         wQHJ+9D27eZa2WclNc5wd6wcAKtSvgxfkjeJPet4mAGqOea7MlcbKCOptrFuA/CJteeq
         h8RYaBqcCisgq4mgP9LKUAqnjLA4pOfR6ch+sunMgY69Ezx9uGuAEH7xOGWLXn/aX2sM
         KC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LomvdWvqgBhsPwcw6xFc/20qQFIhXtLS6hXt3K0gAfw=;
        b=HkWqBmoEQJrpPQQjlC+HcuvyqdgPp5MnpxrLzFgNBYYy9Kiesc7u/pFc6HnQOh3YDa
         V2mMCQgexw8E0TEjlSlxEfePhy1WlKhp54t/MBp+a3SrBIhea43p2MONRIxeqf2XYuq3
         JchUeNiPIqaHuIr4giItXhw8F7+aHJ1mkY/QUrbdYARDBNn1TmZfPg5C9EFpUrgcd8JP
         WGuhW3eM8eO78Elt9OWDZLdZVLmy+lAIdr3k/wF9pPlyuSbIiGTLUJcCVhH0YSLXxiq3
         CaVYTqkgFmW2lmdKiQo+4rxyfTxpRVzxONrjGobIIp9RoJaM4tZGFgykg1375s1J/ndz
         PkPA==
X-Gm-Message-State: AJIora/Dl2NoPinQZMomsyKutV/+87A7nrSm7dkgJpSxNogHQWlJaAzX
	3V26+jMLtb3waT38OjiKxCM=
X-Google-Smtp-Source: AGRyM1tCky+3UYwGQcNdb0qDQIOcfKaBZqaaYxGwWw1OfZzQuNMoPNMZ46IfNoCd3rHxDbiFQ/XMfg==
X-Received: by 2002:a05:6402:401f:b0:433:406a:82c2 with SMTP id d31-20020a056402401f00b00433406a82c2mr18207278eda.289.1655554094641;
        Sat, 18 Jun 2022 05:08:14 -0700 (PDT)
Received: from [192.168.8.198] (188.28.125.106.threembb.co.uk. [188.28.125.106])
        by smtp.gmail.com with ESMTPSA id y11-20020a056402270b00b0042e1cbc4471sm5832934edd.3.2022.06.18.05.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jun 2022 05:08:14 -0700 (PDT)
Message-ID: <36f85d32-4238-9461-72d1-38a2c3468041@gmail.com>
Date: Sat, 18 Jun 2022 13:07:54 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH for-next v3 16/16] io_uring: mutex locked poll hashing
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 llvm@lists.linux.dev
References: <cover.1655371007.git.asml.silence@gmail.com>
 <1bbad9c78c454b7b92f100bbf46730a37df7194f.1655371007.git.asml.silence@gmail.com>
 <YqyfK34NJakiLiVe@dev-arch.thelio-3990X>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <YqyfK34NJakiLiVe@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/22 16:35, Nathan Chancellor wrote:
> On Thu, Jun 16, 2022 at 10:22:12AM +0100, Pavel Begunkov wrote:
>> Currently we do two extra spin lock/unlock pairs to add a poll/apoll
>> request to the cancellation hash table and remove it from there.
>>
>> On the submission side we often already hold ->uring_lock and tw
>> completion is likely to hold it as well. Add a second cancellation hash
>> table protected by ->uring_lock. In concerns for latency because of a
>> need to have the mutex locked on the completion side, use the new table
>> only in following cases:
>>
>> 1) IORING_SETUP_SINGLE_ISSUER: only one task grabs uring_lock, so there
>>     is little to no contention and so the main tw hander will almost
>>     always end up grabbing it before calling callbacks.
>>
>> 2) IORING_SETUP_SQPOLL: same as with single issuer, only one task is
>>     a major user of ->uring_lock.
>>
>> 3) apoll: we normally grab the lock on the completion side anyway to
>>     execute the request, so it's free.
>>
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
> 
> <snip>
> 
>> -/*
>> - * Returns true if we found and killed one or more poll requests
>> - */
>> -__cold bool io_poll_remove_all(struct io_ring_ctx *ctx, struct task_struct *tsk,
>> -			       bool cancel_all)
>> +static __cold bool io_poll_remove_all_table(struct task_struct *tsk,
>> +					    struct io_hash_table *table,
>> +					    bool cancel_all)
>>   {
>> -	struct io_hash_table *table = &ctx->cancel_table;
>>   	unsigned nr_buckets = 1U << table->hash_bits;
>>   	struct hlist_node *tmp;
>>   	struct io_kiocb *req;
>> @@ -557,6 +592,17 @@ __cold bool io_poll_remove_all(struct io_ring_ctx *ctx, struct task_struct *tsk,
>>   	return found;
>>   }
>>   
>> +/*
>> + * Returns true if we found and killed one or more poll requests
>> + */
>> +__cold bool io_poll_remove_all(struct io_ring_ctx *ctx, struct task_struct *tsk,
>> +			       bool cancel_all)
>> +	__must_hold(&ctx->uring_lock)
>> +{
>> +	return io_poll_remove_all_table(tsk, &ctx->cancel_table, cancel_all) |
>> +	       io_poll_remove_all_table(tsk, &ctx->cancel_table_locked, cancel_all);
>> +}
> 
> Clang warns:
> 
>    io_uring/poll.c:602:9: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
>            return io_poll_remove_all_table(tsk, &ctx->cancel_table, cancel_all) |
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                                                 ||
>    io_uring/poll.c:602:9: note: cast one or both operands to int to silence this warning
>    1 error generated.
> 
> I assume this is intentional so io_poll_remove_all_table() gets called
> twice every time? If so, would you be opposed to unrolling this a bit to
> make it clear to the compiler? Alternatively, we could change the return
> type of io_poll_remove_all_table to be an int or add a cast to int like
> the note mentioned but that is rather ugly to me. I can send a formal
> patch depending on your preference.

Thanks for the heads up. Yes, it's intentional, and I'm fine with either
version. Are you going to send a patch?


-- 
Pavel Begunkov

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5451361
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652720773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ejIgoWmRxczoYnPHf/4zfggdO1eNy2ArBNlJdHBm7s=;
	b=JqXqeYUIPxzu2G5Io088xXI9Memdd73pI6RsbZxT/vNvA20p0lZYR8dRwf3oObt6g94rq8
	v6JIcLvzgiqWwIMc+femosxXl2dg7ugPd5gDRfSbYkTiff8siAXKXSBauL27Th/+rq9Xwy
	kQw+Qg58rrv1tkJFVuaHD/4qe0irCs8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-5tpm2HdON8S558dyUutkQw-1; Mon, 16 May 2022 13:06:12 -0400
X-MC-Unique: 5tpm2HdON8S558dyUutkQw-1
Received: by mail-qv1-f70.google.com with SMTP id a1-20020a056214130100b00456549a0589so3369373qvv.2
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 10:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0ejIgoWmRxczoYnPHf/4zfggdO1eNy2ArBNlJdHBm7s=;
        b=qNMLLg+By2APA76VE8n48C/iQjYYzThOr9lLt3ZLGDsnCf0TS4qnd6Ei5KNOFP8lV3
         mLjrcQiViekqj7SJn41qgKXB6S2TIohJGynSm3I0+FU6URq04Jd/FiOIw4FVfv9jogcx
         BoABVou8/3skmdTmzL9xfZaC0YKD99W91UPdpcZSz9t3AnAgi7S4xU5LCZ/rvnRqygrR
         gufN6c602pZTabSe3ddX2lIm09q9W4iyYXlVJew08/X2QeJH7rz+RRKoquBUQgFNeXUB
         GA1oVyFkfSquSwQwKMyt8lOud6yloyxD4EWQYCOrf9EA6mWWUz7msOUYVsIoMNZspq6n
         XGpg==
X-Gm-Message-State: AOAM533mEjG8Tuan5IIAYyK7LRgn4Vcfzg2aG5nV5PHM+i8BENb7IYOQ
	FbqL7198VexgALJ5CnM14YOXTTrZZuodsfugVvqKA1FAmM5w8UXDOiFbnrqQ0cc6mt2fvV+uRCL
	uyzmQ11WQAKzDo+vKvw75AowBl0OYRORfv6tTYwln+C2ME0U/nfhiFRmrx3Vg
X-Received: by 2002:ad4:414a:0:b0:461:ce93:f10c with SMTP id z10-20020ad4414a000000b00461ce93f10cmr5008258qvp.73.1652720771243;
        Mon, 16 May 2022 10:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2m47ZgyrUeZFqTNUFcAJdSpDA0fm/ABlQgiRXf+xheTHQc5HQAFHPXDg1aLZY0I0R0QohcA==
X-Received: by 2002:ad4:414a:0:b0:461:ce93:f10c with SMTP id z10-20020ad4414a000000b00461ce93f10cmr5008110qvp.73.1652720769745;
        Mon, 16 May 2022 10:06:09 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id m6-20020ac86886000000b002f39b99f6bcsm5973279qtq.86.2022.05.16.10.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 10:06:09 -0700 (PDT)
Subject: Re: [PATCH] misc: rtsx: Set setting_reg2 before use.
To: Nathan Chancellor <nathan@kernel.org>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, ndesaulniers@google.com,
 ricky_wu@realtek.com, kai.heng.feng@canonical.com,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220516130047.3887590-1-trix@redhat.com>
 <YoJ0I/XPoj1B/+mm@dev-arch.thelio-3990X>
From: Tom Rix <trix@redhat.com>
Message-ID: <d34498ad-0230-7c73-8f1f-9ca59fbf930f@redhat.com>
Date: Mon, 16 May 2022 10:06:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YoJ0I/XPoj1B/+mm@dev-arch.thelio-3990X>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/16/22 8:56 AM, Nathan Chancellor wrote:
> On Mon, May 16, 2022 at 09:00:47AM -0400, Tom Rix wrote:
>> The clang build fails with
>> rts5261.c:406:13: error: variable 'setting_reg2' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>>          } else if (efuse_valid == 0) {
>>                     ^~~~~~~~~~~~~~~~
>>
>> setting_reg2 is set in this block
>>    if (efuse_valid == 2 || efuse_valid == 3) {
>> ..
>>    } else if (efuse_valid == 0) {
>>      // default
>> ..
>>    }
>> But efuse_valid can also have a value of 1.
>> Change the 'else if' to 'else' to make the second block the default.
>>
>> Fixes: b1c5f3085149 ("misc: rtsx: add rts5261 efuse function")
>> Signed-off-by: Tom Rix <trix@redhat.com>
> I am not sure if this fix is correct from a functional standpoint (i.e.
> is treating efuse_valid == 1 the same as efuse_valid == 0 correct?) but
> it is better than not handling this value altogether. For what it's
> worth:

I looked at how the code used to work, this seemed better than 
initializing to NULL.

>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> As a side note, it is unfortunate that this change made it into -next
> when there was an outstanding report about this warning:

 From the clang side, this is a build break and my static analysis infra 
goes down.

These build breaks seem to happening every week, is there a precommit 
clang gating test that could be done for -next ?

Tom

>
> https://lore.kernel.org/202205100220.WyAyhKap-lkp@intel.com/
>
>> ---
>>   drivers/misc/cardreader/rts5261.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/cardreader/rts5261.c b/drivers/misc/cardreader/rts5261.c
>> index 749cc5a46d13..f22634b14dc8 100644
>> --- a/drivers/misc/cardreader/rts5261.c
>> +++ b/drivers/misc/cardreader/rts5261.c
>> @@ -403,7 +403,7 @@ static void rts5261_init_from_hw(struct rtsx_pcr *pcr)
>>   			setting_reg1 = PCR_SETTING_REG4;
>>   			setting_reg2 = PCR_SETTING_REG5;
>>   		}
>> -	} else if (efuse_valid == 0) {
>> +	} else {
>>   		// default
>>   		setting_reg1 = PCR_SETTING_REG1;
>>   		setting_reg2 = PCR_SETTING_REG2;
>> -- 
>> 2.27.0
>>
> Cheers,
> Nathan
>


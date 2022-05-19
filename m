Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2132F48
	for <llvm@lists.linux.dev>; Thu, 19 May 2022 21:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652995144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n+qJ8pJJs0G5HYhGLiS4AE7niMtKAcA/2FBv3kqZsAA=;
	b=G0w47FprosVRL05YA6hPz8n3GcAkgyooG5T8Ph8WILnQajn0MBDV6BVD7ywjyNNbhS9icQ
	xLo3GLmJc6nOUtM6dqlnTWCAFxh61zXKfrUehJ2Lmy87qFQN6NcrTo2AFfbyWXM4RKgPlL
	5DHAkL9Jl3eess0zywest3PO+kW+4yY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-QjFgbwyFN2aVxKbrPoPPyg-1; Thu, 19 May 2022 17:19:03 -0400
X-MC-Unique: QjFgbwyFN2aVxKbrPoPPyg-1
Received: by mail-qt1-f198.google.com with SMTP id g1-20020ac85801000000b002f3b281f745so5180991qtg.22
        for <llvm@lists.linux.dev>; Thu, 19 May 2022 14:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=n+qJ8pJJs0G5HYhGLiS4AE7niMtKAcA/2FBv3kqZsAA=;
        b=25OOgtPUQOETGbvmPx+wWejL7LomG9mqev0/bViIAHMVtvFUXMPkYVbL7YHAwWNfvv
         6Z4blPAi+AmqjYtLrtvIZxMjj6vA1VPAl6TGCh5wJkUDBQwxMDd2gF65chy40E/XBhRl
         CgeEJhN+9zgUACkiJD3ctFl6nwetHUxW8NIGUwVQm0fzu8AF7rnKCFqlyGBnNqALuG7w
         YCEneA2hDDAPlaWle6qUF0BY3r61mhmqZaTEboo2E6gyuSQqRdUhOrMIxANZOT1Bu1cX
         YoIEFs2w4dkk+47qKgeSH9qbyf1iA7B8Dvf22ReM32Aa2eNaNnqgD9C3HSAG6KjoJ5UM
         /XZg==
X-Gm-Message-State: AOAM530Mdzu21Yewt6l1OHzk5W4M/txmv7MPpVyUtb30vUwOxhq5CJ9h
	3NleAS7LtCY8M2cjs2CVbuRb3Hq8phXkBbk2WCZxvmPyCpnAi8thc1z6KvGU1ApY5QBc53SbxRf
	afIC9mBZiCPnEl4HcenzPSMuUFMZjVRBv9C68isUWLMQPWyjHjmzz8mndQhCx
X-Received: by 2002:a05:6214:2389:b0:435:ba04:8f18 with SMTP id fw9-20020a056214238900b00435ba048f18mr5786343qvb.4.1652995143218;
        Thu, 19 May 2022 14:19:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX0Fldd8vk5WoAZtJCJ9/fV9GcJ3gIYbqeL2DsMTBdM1sx6/gnk91p1rko9Wjj8dU/g2cYeg==
X-Received: by 2002:a05:6214:2389:b0:435:ba04:8f18 with SMTP id fw9-20020a056214238900b00435ba048f18mr5786315qvb.4.1652995142893;
        Thu, 19 May 2022 14:19:02 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id b126-20020a37b284000000b0069fc13ce1fcsm1911154qkf.45.2022.05.19.14.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 14:19:02 -0700 (PDT)
Subject: Re: [PATCH] misc: rtsx: Set setting_reg2 before use.
To: Nathan Chancellor <nathan@kernel.org>, Ricky WU <ricky_wu@realtek.com>,
 miquel.raynal@bootlin.com
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>, "arnd@arndb.de"
 <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>
References: <20220516130047.3887590-1-trix@redhat.com>
 <YoJ0I/XPoj1B/+mm@dev-arch.thelio-3990X>
 <d34498ad-0230-7c73-8f1f-9ca59fbf930f@redhat.com>
 <CAAd53p57APcectWW-NN_=HE6JkTQRk717cWNZ5iJcP+MtEYjog@mail.gmail.com>
 <bab0c4250147420a842f3e966a8264a6@realtek.com>
 <YoavUdiAJXPqsU7Q@dev-arch.thelio-3990X>
From: Tom Rix <trix@redhat.com>
Message-ID: <6e3f182e-73ac-9c1d-9fb1-1fb360b1a6cd@redhat.com>
Date: Thu, 19 May 2022 14:18:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YoavUdiAJXPqsU7Q@dev-arch.thelio-3990X>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 5/19/22 1:57 PM, Nathan Chancellor wrote:
> On Tue, May 17, 2022 at 08:10:17AM +0000, Ricky WU wrote:
>>> -----Original Message-----
>>> From: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> Sent: Tuesday, May 17, 2022 9:53 AM
>>> To: Tom Rix <trix@redhat.com>
>>> Cc: Nathan Chancellor <nathan@kernel.org>; arnd@arndb.de;
>>> gregkh@linuxfoundation.org; ndesaulniers@google.com; Ricky WU
>>> <ricky_wu@realtek.com>; linux-kernel@vger.kernel.org; llvm@lists.linux.dev
>>> Subject: Re: [PATCH] misc: rtsx: Set setting_reg2 before use.
>>>
>>> On Tue, May 17, 2022 at 1:06 AM Tom Rix <trix@redhat.com> wrote:
>>>>
>>>> On 5/16/22 8:56 AM, Nathan Chancellor wrote:
>>>>> On Mon, May 16, 2022 at 09:00:47AM -0400, Tom Rix wrote:
>>>>>> The clang build fails with
>>>>>> rts5261.c:406:13: error: variable 'setting_reg2' is used uninitialized
>>> whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>>>>>>           } else if (efuse_valid == 0) {
>>>>>>                      ^~~~~~~~~~~~~~~~
>>>>>>
>>>>>> setting_reg2 is set in this block
>>>>>>     if (efuse_valid == 2 || efuse_valid == 3) { ..
>>>>>>     } else if (efuse_valid == 0) {
>>>>>>       // default
>>>>>> ..
>>>>>>     }
>>>>>> But efuse_valid can also have a value of 1.
>>>>>> Change the 'else if' to 'else' to make the second block the default.
>>>>>>
>>>>>> Fixes: b1c5f3085149 ("misc: rtsx: add rts5261 efuse function")
>>>>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>>>> I am not sure if this fix is correct from a functional standpoint (i.e.
>>>>> is treating efuse_valid == 1 the same as efuse_valid == 0 correct?)
>>>>> but it is better than not handling this value altogether. For what
>>>>> it's
>>>>> worth:
>>>> I looked at how the code used to work, this seemed better than
>>>> initializing to NULL.
>>> Or maybe use a single if block?
>>>
>>> u16 setting_reg1 =PCR_SETTING_REG1 , setting_reg2 =
>>> PCR_SETTING_REG2; ...
>>> if ((efuse_valid == 2 || efuse_valid == 3) && (valid != 3) {
>>>      setting_reg1 = PCR_SETTING_REG4;
>>>      setting_reg2 = PCR_SETTING_REG5;
>>> }
>>>
>>> Kai-Heng
>>>
>>>>> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>>>>>
>>>>> As a side note, it is unfortunate that this change made it into
>>>>> -next when there was an outstanding report about this warning:
>>>>   From the clang side, this is a build break and my static analysis
>>>> infra goes down.
>>>>
>>>> These build breaks seem to happening every week, is there a precommit
>>>> clang gating test that could be done for -next ?
>>>>
>>>> Tom
>>>>
>>>>> https://lore.kernel.org/202205100220.WyAyhKap-lkp@intel.com/
>>>>>
>>>>>> ---
>>>>>>    drivers/misc/cardreader/rts5261.c | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/misc/cardreader/rts5261.c
>>>>>> b/drivers/misc/cardreader/rts5261.c
>>>>>> index 749cc5a46d13..f22634b14dc8 100644
>>>>>> --- a/drivers/misc/cardreader/rts5261.c
>>>>>> +++ b/drivers/misc/cardreader/rts5261.c
>>>>>> @@ -403,7 +403,7 @@ static void rts5261_init_from_hw(struct rtsx_pcr
>>> *pcr)
>>>>>>                       setting_reg1 = PCR_SETTING_REG4;
>>>>>>                       setting_reg2 = PCR_SETTING_REG5;
>>>>>>               }
>>>>>> -    } else if (efuse_valid == 0) {
>>>>>> +    } else {
>>>>>>               // default
>>>>>>               setting_reg1 = PCR_SETTING_REG1;
>>>>>>               setting_reg2 = PCR_SETTING_REG2;
>> Sorry for the trouble
>> here can be changed to
>> ...
>> } else if (efuse_valid == 0) {
>> 		// default
>> 		setting_reg1 = PCR_SETTING_REG1;
>> 		setting_reg2 = PCR_SETTING_REG2;
>> } else {
>>   return;
>> }
>> Because other values are invalid
> Tom, were you going to send a v2 of this?

No.

Miquèl has the best fix.

https://lore.kernel.org/lkml/20220518170920.4db16990@xps-13/

Tom


>
> Cheers,
> Nathan
>


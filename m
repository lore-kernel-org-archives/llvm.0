Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A06FA6
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 20:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679342735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLGqq2dkr4d+qChfROhQzB1nvGWWiqjAAUgEiPWsWfk=;
	b=QKLNv1rhjW8T39/4DXb/tRsT9UOxnTd+tFBX+IkZVN6NvkO2gEXh2rOfqqzPQe6RpSm1r9
	lxaECuW2UAwduQlJbBEy/LU4vWfzrNI9KycyyAoxdmifG3m+1j7PrGswaqDG62VFIEGL6E
	ysV34252cvQR9T6KnQRUSma3of56/OA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-VQuJH_EJMo-6zfwVHFXlZA-1; Mon, 20 Mar 2023 16:05:34 -0400
X-MC-Unique: VQuJH_EJMo-6zfwVHFXlZA-1
Received: by mail-qt1-f197.google.com with SMTP id z1-20020ac87ca1000000b003ba2a2c50f9so7547756qtv.23
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 13:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679342733;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLGqq2dkr4d+qChfROhQzB1nvGWWiqjAAUgEiPWsWfk=;
        b=i6pWhXPXbmRh62TJuRcPEp4Y+xw5uRHGmc+5Vgw2TkC0fJk/s01V9ZTHwcCwGzj11I
         jybxMlyij8uoZFlkbemfhBpuy1ZM1CKKre1xfqFdMheZd++WE1RbX4LrzCSM40tZmjZq
         whEiQqXxXwLoCd8gjTBBjycrA8OqVsDygcGgwArAjTp6coZBXqXM8PxDOgSE4m1KSQIc
         IzvDCXfIO45pHkUWuzw7FFNcm5PM9G9IlSgwlxxF2lW1bck1aeGdzlVISC+owePSuTnk
         E8fXH7j93luFd2FGJBNir8hSfMJ0q0qECbJEiXS0/aNdM4G7efEu8Wx7LlOzNfgJqxw3
         ZZCQ==
X-Gm-Message-State: AO0yUKUH/2LC72WNwl8pScB4Q+Jo9s1QWyRiakD8Pj82XGAFWB5rFJvD
	bEl+nbqQuf2M1wuITzJaj/sfVQHCY3qQWR8b9XUQV3kqPUf14ZNiQcP5OYxmWm+ZXJg90TjzA83
	gf8QRkkjE2ogb0cy7bqn7DBdR3em8E6jsTKJG0kMrgIZ9f4C4AGruGjjSXg0BmcfgxIIG
X-Received: by 2002:ac8:7f4e:0:b0:3bf:d149:8966 with SMTP id g14-20020ac87f4e000000b003bfd1498966mr617516qtk.62.1679342733314;
        Mon, 20 Mar 2023 13:05:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set8EYVn9VEzuCjZa06sZPyJPdqRWwwdN6xTMK4QNdqi2czOa4Al3y0wS1AbtorjeGXE8yHikrQ==
X-Received: by 2002:ac8:7f4e:0:b0:3bf:d149:8966 with SMTP id g14-20020ac87f4e000000b003bfd1498966mr617464qtk.62.1679342732969;
        Mon, 20 Mar 2023 13:05:32 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id bk12-20020a05620a1a0c00b0074357a6529asm7968058qkb.105.2023.03.20.13.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 13:05:32 -0700 (PDT)
Subject: Re: [PATCH] fpga: xilinx-pr-decoupler: remove unused
 xlnx_pr_decouple_read function
From: Tom Rix <trix@redhat.com>
To: Xu Yilun <yilun.xu@intel.com>, Michal Simek <michal.simek@amd.com>
Cc: mdf@kernel.org, hao.wu@intel.com, michal.simek@xilinx.com,
 nathan@kernel.org, ndesaulniers@google.com, linux-fpga@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230317230617.1673923-1-trix@redhat.com>
 <c8eaefed-e1fd-e0c1-7e8f-561c20632646@amd.com>
 <ZBhqutJChvRkUsRL@yilunxu-OptiPlex-7050>
 <2dc1f25d-d621-ec04-6de5-f731f2a8bb41@redhat.com>
Message-ID: <5fb2fa11-5a58-1856-7cb9-9687637d0741@redhat.com>
Date: Mon, 20 Mar 2023 13:05:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2dc1f25d-d621-ec04-6de5-f731f2a8bb41@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 3/20/23 9:24 AM, Tom Rix wrote:
>
> On 3/20/23 7:16 AM, Xu Yilun wrote:
>> On 2023-03-20 at 08:40:22 +0100, Michal Simek wrote:
>>>
>>> On 3/18/23 00:06, Tom Rix wrote:
>>>> CAUTION: This message has originated from an External Source. 
>>>> Please use proper judgment and caution when opening attachments, 
>>>> clicking links, or responding to this email.
>>>>
>>>>
>>>> clang with W=1 reports
>>>> drivers/fpga/xilinx-pr-decoupler.c:37:19: error: unused function 
>>>> 'xlnx_pr_decouple_read' [-Werror,-Wunused-function]
>>>> static inline u32 xlnx_pr_decouple_read(const struct 
>>>> xlnx_pr_decoupler_data *d,
>>>>                     ^
>>>> This static function is not used, so remove it.
>>>>
>>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>>> ---
>>>>    drivers/fpga/xilinx-pr-decoupler.c | 6 ------
>>>>    1 file changed, 6 deletions(-)
>>>>
>>>> diff --git a/drivers/fpga/xilinx-pr-decoupler.c 
>>>> b/drivers/fpga/xilinx-pr-decoupler.c
>>>> index 2d9c491f7be9..b6f18c07c752 100644
>>>> --- a/drivers/fpga/xilinx-pr-decoupler.c
>>>> +++ b/drivers/fpga/xilinx-pr-decoupler.c
>>>> @@ -34,12 +34,6 @@ static inline void 
>>>> xlnx_pr_decoupler_write(struct xlnx_pr_decoupler_data *d,
>>>>           writel(val, d->io_base + offset);
>>>>    }
>>>>
>>>> -static inline u32 xlnx_pr_decouple_read(const struct 
>>>> xlnx_pr_decoupler_data *d,
>>>> -                                       u32 offset)
>>>> -{
>>>> -       return readl(d->io_base + offset);
>>>> -}
>>>> -
>>>>    static int xlnx_pr_decoupler_enable_set(struct fpga_bridge 
>>>> *bridge, bool enable)
>>>>    {
>>>>           int err;
>>>> -- 
>>>> 2.27.0
>>>>
>>> It should be fixed like this instead.
>>>
>>> Thanks,
>>> Michal
>>>
>>> diff --git a/drivers/fpga/xilinx-pr-decoupler.c 
>>> b/drivers/fpga/xilinx-pr-decoupler.c
>>> index 2d9c491f7be9..58508f44cd49 100644
>>> --- a/drivers/fpga/xilinx-pr-decoupler.c
>>> +++ b/drivers/fpga/xilinx-pr-decoupler.c
>>> @@ -69,7 +69,7 @@ static int xlnx_pr_decoupler_enable_show(struct
>>> fpga_bridge *bridge)
>>>          if (err)
>>>                  return err;
>>>
>>> -       status = readl(priv->io_base);
>>> +       status = xlnx_pr_decouple_read(priv);
>> OK, I'll drop the previous fix, and waiting for the new one.
>
> Michal,
>
> Will you make this change ?

Let me provide some context.

I am cleaning up about 70 similar unused functions all over the tree.

I have removed a lot of one liner wrappers that look like this.

My opinion, to be useful the wrapper needs to be used multiple places 
and/or do something non trival otherwise we will bloat the codebase with 
with 5x lines of code to do a simple readl.

But this is subjection. If you want this change, you should make it.

Tom

>
> Tom
>
>>
>> Thanks,
>> Yilun
>>
>>>          clk_disable(priv->clk);
>>>


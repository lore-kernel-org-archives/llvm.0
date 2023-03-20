Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560723BE
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679329482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yKuiUgRvJgr0BMcont0ecSgYQ2TFv8+RdPWPNJF4zVg=;
	b=MuFHso+pM1e33tIq/yE7zowEpIh2wQvj9qY2Q9trEo2ssBh1DxMe2DSjt/Aowh2h6SPKgZ
	A4Tff4iLveQ42ec8NMllqpL7mDvLPkDqQiaXylvNUfmIG0jrIF7F5JslrcRPEv/ZPy+4u3
	N19KJ2sq1VkBF5OY/B7s2F3VyM/uu8U=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-Qwy_UMU5OXWblAau24AOQw-1; Mon, 20 Mar 2023 12:24:41 -0400
X-MC-Unique: Qwy_UMU5OXWblAau24AOQw-1
Received: by mail-qv1-f71.google.com with SMTP id c15-20020a056214070f00b005bb308e7c12so5179247qvz.19
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 09:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679329481;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yKuiUgRvJgr0BMcont0ecSgYQ2TFv8+RdPWPNJF4zVg=;
        b=1AzUyrJ4oj1UPmqUXkxjwMhsTSiq/MTagQkQSX7+yWrIXpQjntoDK7RcZ/1MJcGXzj
         3sqcU/X9pTnUKVGSZenH60LQF4fCt6+9NamkZk3Q2OehMAlup7EwEzqkokrAoHgsf59M
         CW5U3njrtRXx3N9c64ZkONXcLL75EN/NOiDT875iOy653kN6pQC3t5DHqP+Gc0i0hspX
         vWoTkyZ9WTAVzxPRktKSCc7IP5wsrpUSCg1WoZEo/VAO1X7ot4a75bvm5aLQhksQH+p1
         Mm4A9FGZMHZeQM+UCUPj2a5cjg4XgLuW4+NSs5IcHvqlH2Q1kIjHSs4ROO8kT/uJFilo
         8zOQ==
X-Gm-Message-State: AO0yUKV+MGd6k+TXysmYx4Rq9cF6dlxp9QMRCLt3v0tQbW4aIigbz5+5
	7bVLTKnLpx6lHdnYkxviLcBhg6OdZZEPvPLkmkPlEui02EOW58btOEaGh2N0vCw0hrJf98cGPxl
	SJmQUHSp0/J8/Y0qZQWdVW/SPcJuz/oCcndj57m6qwlbPTaBKbZta2Wz9PCCuLktM5qju
X-Received: by 2002:ad4:5f07:0:b0:5b9:7cd9:9a15 with SMTP id fo7-20020ad45f07000000b005b97cd99a15mr24454960qvb.48.1679329480987;
        Mon, 20 Mar 2023 09:24:40 -0700 (PDT)
X-Google-Smtp-Source: AK7set9RPaNXkyvrZQBlHuyu3LLY2I0lqvkat9qvlTe6YR423Sg2i2SXi7nbLf5x5L1aI2JLWCb6+w==
X-Received: by 2002:a62:7910:0:b0:625:e77b:93b2 with SMTP id u16-20020a627910000000b00625e77b93b2mr16590831pfc.5.1679329460084;
        Mon, 20 Mar 2023 09:24:20 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm6761949pfi.95.2023.03.20.09.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 09:24:19 -0700 (PDT)
Subject: Re: [PATCH] fpga: xilinx-pr-decoupler: remove unused
 xlnx_pr_decouple_read function
To: Xu Yilun <yilun.xu@intel.com>, Michal Simek <michal.simek@amd.com>
Cc: mdf@kernel.org, hao.wu@intel.com, michal.simek@xilinx.com,
 nathan@kernel.org, ndesaulniers@google.com, linux-fpga@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230317230617.1673923-1-trix@redhat.com>
 <c8eaefed-e1fd-e0c1-7e8f-561c20632646@amd.com>
 <ZBhqutJChvRkUsRL@yilunxu-OptiPlex-7050>
From: Tom Rix <trix@redhat.com>
Message-ID: <2dc1f25d-d621-ec04-6de5-f731f2a8bb41@redhat.com>
Date: Mon, 20 Mar 2023 09:24:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZBhqutJChvRkUsRL@yilunxu-OptiPlex-7050>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/20/23 7:16 AM, Xu Yilun wrote:
> On 2023-03-20 at 08:40:22 +0100, Michal Simek wrote:
>>
>> On 3/18/23 00:06, Tom Rix wrote:
>>> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>>>
>>>
>>> clang with W=1 reports
>>> drivers/fpga/xilinx-pr-decoupler.c:37:19: error: unused function 'xlnx_pr_decouple_read' [-Werror,-Wunused-function]
>>> static inline u32 xlnx_pr_decouple_read(const struct xlnx_pr_decoupler_data *d,
>>>                     ^
>>> This static function is not used, so remove it.
>>>
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>> ---
>>>    drivers/fpga/xilinx-pr-decoupler.c | 6 ------
>>>    1 file changed, 6 deletions(-)
>>>
>>> diff --git a/drivers/fpga/xilinx-pr-decoupler.c b/drivers/fpga/xilinx-pr-decoupler.c
>>> index 2d9c491f7be9..b6f18c07c752 100644
>>> --- a/drivers/fpga/xilinx-pr-decoupler.c
>>> +++ b/drivers/fpga/xilinx-pr-decoupler.c
>>> @@ -34,12 +34,6 @@ static inline void xlnx_pr_decoupler_write(struct xlnx_pr_decoupler_data *d,
>>>           writel(val, d->io_base + offset);
>>>    }
>>>
>>> -static inline u32 xlnx_pr_decouple_read(const struct xlnx_pr_decoupler_data *d,
>>> -                                       u32 offset)
>>> -{
>>> -       return readl(d->io_base + offset);
>>> -}
>>> -
>>>    static int xlnx_pr_decoupler_enable_set(struct fpga_bridge *bridge, bool enable)
>>>    {
>>>           int err;
>>> --
>>> 2.27.0
>>>
>> It should be fixed like this instead.
>>
>> Thanks,
>> Michal
>>
>> diff --git a/drivers/fpga/xilinx-pr-decoupler.c b/drivers/fpga/xilinx-pr-decoupler.c
>> index 2d9c491f7be9..58508f44cd49 100644
>> --- a/drivers/fpga/xilinx-pr-decoupler.c
>> +++ b/drivers/fpga/xilinx-pr-decoupler.c
>> @@ -69,7 +69,7 @@ static int xlnx_pr_decoupler_enable_show(struct
>> fpga_bridge *bridge)
>>          if (err)
>>                  return err;
>>
>> -       status = readl(priv->io_base);
>> +       status = xlnx_pr_decouple_read(priv);
> OK, I'll drop the previous fix, and waiting for the new one.

Michal,

Will you make this change ?

Tom

>
> Thanks,
> Yilun
>
>>          clk_disable(priv->clk);
>>


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F01944E
	for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679581095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmOQUOtAqacRyOXsSm85w+5nwuG+5y33vZI5QHs5gnc=;
	b=MCsWK+I9wFHWmDkklzUGUQGxw/cGiXRnp9flNCj43d1DY2lIbXFMTc2WEjYunOgisdEasm
	Yg5SZS8Vv4EoRFzEf77Hqm6Lk7XM/b1T3uwsa2frfZnnJyLOVUWyb8/2rotabYIixquCnO
	8SImmndg1ZiWV4oANUQdtxa2e6JXTE4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-Bw8IwbEJOLGzQBUBUCcfuw-1; Thu, 23 Mar 2023 10:18:14 -0400
X-MC-Unique: Bw8IwbEJOLGzQBUBUCcfuw-1
Received: by mail-qv1-f71.google.com with SMTP id l18-20020ad44bd2000000b005a9cf5f609eso10880865qvw.15
        for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 07:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581093;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wmOQUOtAqacRyOXsSm85w+5nwuG+5y33vZI5QHs5gnc=;
        b=Xsf+0609C/BmJan3sN/tXLBimDzjvvmvgR0QtTg41njp1k3rlZdp5ZRerBnzsqFRpb
         NBKyEqZ1yg0gOEhPm4a7YkaOcMX3YQk2ZwIAS2o3b3TmUibTbFyEwr7ub2MSFptyz0tG
         +HMzLU7Uuyn8iGnfpGFKcNWBBb4t+/1B90qthfMlSEu2ntsC+w6tiwXGfAybgJ0TFERD
         UwcWanXvUmyDq4V+hyKrMlYZMcM8VG7qyIJiRVMNPH1hdoC9qhYht0W8czVtRDngVvnf
         BXcM0rwOrVYWwdSczyCeUCj9C3J4RlcAdgA7rdV0V5njl1jhAkA8HpFoD79KxJFJyd0H
         d9Uw==
X-Gm-Message-State: AO0yUKXNm2TfF8r5lmAsNBvs5NxLawa0Fd6b3xYe7p1y+E17+tERh8dF
	eKq1785DTwfBzj03prhlg+aAz15plj8KCna0e9aEYtS0OjLEFpHW5cdv6cn9t+uzqrJnubMkmsi
	nB7064oQfEoqsX6KDnMq49lvyASRYKgVwBmOhmUf8GyToC/UPLKyaYSt6E4aWL62Uzlt0
X-Received: by 2002:ac8:5845:0:b0:3bf:abd5:f1ef with SMTP id h5-20020ac85845000000b003bfabd5f1efmr11961153qth.7.1679581093159;
        Thu, 23 Mar 2023 07:18:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set8+oxS4bzeF5lRLgX7lO++tpFXfO+fw1zDuVOc/fpqog2+KS85aPH3xR/dKuzfXWCYb7jmdzA==
X-Received: by 2002:ac8:5845:0:b0:3bf:abd5:f1ef with SMTP id h5-20020ac85845000000b003bfabd5f1efmr11961109qth.7.1679581092868;
        Thu, 23 Mar 2023 07:18:12 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id p16-20020a05620a057000b00745c2b29091sm5993338qkp.93.2023.03.23.07.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 07:18:12 -0700 (PDT)
Subject: Re: [PATCH] ath10k: remove unused ath10k_get_ring_byte function
To: Simon Horman <simon.horman@corigine.com>
Cc: kvalo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230322122855.2570417-1-trix@redhat.com>
 <ZBtnbgeW9T75ZXfv@corigine.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <0b9f9c45-7e88-deda-46a6-8c7961878b83@redhat.com>
Date: Thu, 23 Mar 2023 07:18:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZBtnbgeW9T75ZXfv@corigine.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/22/23 1:40 PM, Simon Horman wrote:
> On Wed, Mar 22, 2023 at 08:28:55AM -0400, Tom Rix wrote:
>> clang with W=1 reports
>> drivers/net/wireless/ath/ath10k/ce.c:88:1: error:
>>    unused function 'ath10k_get_ring_byte' [-Werror,-Wunused-function]
>> ath10k_get_ring_byte(unsigned int offset,
>> ^
>> This function is not used so remove it.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
> Hi Tom,
>
> this looks good. But this patch applied, and with clang 11.0.2,
> make CC=clang W=1 tells me:
>
> drivers/net/wireless/ath/ath10k/ce.c:80:19: error: unused function 'shadow_dst_wr_ind_addr' [-Werror,-Wunused-function]
> static inline u32 shadow_dst_wr_ind_addr(struct ath10k *ar,
>                    ^
> drivers/net/wireless/ath/ath10k/ce.c:434:20: error: unused function 'ath10k_ce_error_intr_enable' [-Werror,-Wunused-function]
> static inline void ath10k_ce_error_intr_enable(struct ath10k *ar,
>                     ^
> Perhaps those functions should be removed too?

I believe these were removed with

c3ab8c9a296 ("wifi: ath10k: Remove the unused function 
shadow_dst_wr_ind_addr() and ath10k_ce_error_intr_enable()")

Tom

>
>> ---
>>   drivers/net/wireless/ath/ath10k/ce.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
>> index b656cfc03648..c27b8204718a 100644
>> --- a/drivers/net/wireless/ath/ath10k/ce.c
>> +++ b/drivers/net/wireless/ath/ath10k/ce.c
>> @@ -84,13 +84,6 @@ ath10k_set_ring_byte(unsigned int offset,
>>   	return ((offset << addr_map->lsb) & addr_map->mask);
>>   }
>>   
>> -static inline unsigned int
>> -ath10k_get_ring_byte(unsigned int offset,
>> -		     struct ath10k_hw_ce_regs_addr_map *addr_map)
>> -{
>> -	return ((offset & addr_map->mask) >> (addr_map->lsb));
>> -}
>> -
>>   static inline u32 ath10k_ce_read32(struct ath10k *ar, u32 offset)
>>   {
>>   	struct ath10k_ce *ce = ath10k_ce_priv(ar);
>> -- 
>> 2.27.0
>>


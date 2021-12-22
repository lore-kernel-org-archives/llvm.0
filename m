Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070492C82
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640184415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9gcyPWh8veARTOFyykIJ1v+FqxdAa2cAjT6Y8PmLnx8=;
	b=jIpkH6yO3R5f0ZKunGDDGl2S1PnOU6JIEEl6nLZGfYYtPBX2Uvfb87INiU1D6qbGOXKyHv
	jLcVOFB3GcYoe1/1yBcwe/GBAjXLqoEt1RABq2xqZzTVKUrzXhd3J0obXfE+1xAO35XkZa
	nJNeBGodYZhN/3/jZecqTiinUEVm+ag=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-f4DTC1AQNU6beO0upIRRBg-1; Wed, 22 Dec 2021 09:46:55 -0500
X-MC-Unique: f4DTC1AQNU6beO0upIRRBg-1
Received: by mail-oi1-f198.google.com with SMTP id w188-20020acaadc5000000b002c6cbcdc5e1so799920oie.11
        for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 06:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9gcyPWh8veARTOFyykIJ1v+FqxdAa2cAjT6Y8PmLnx8=;
        b=UrdoEaqg4vshqjqErfXofchgN98+l7CF2AovmOqt95ewGQSXezF94lWqsQqivg7chz
         wIUQiDeFMk5TrrU3wpecoGhNEuP3pccRqFF8XHVz3l45ujl0/TPs/VmVt5fm/aeYzJnA
         7SL+UZ686IIWsaUZCOQ/kD7REUMH1SrAfpq6KZP4qcRk3qS2Vf0NtA7QpLMtBl0x+ubw
         Ce3M+JGp3QkHv85Nuo/tbHWfDpOzemG5vUh6Gv0iLMg9BnepeA4gxHUNVn9f7eAIHMb8
         1knuxvUHCZDNPFdBuuhE+0zhFp0MmIS48RJysA0y9r5EPMS9OWUhF8vxmjDsqKqLlFKi
         PuqA==
X-Gm-Message-State: AOAM531s8ctz1DmMf8oa4/RHracnC92L6xo0bK+bhUQawPF4PQ22MA18
	HBkMYt7AyjMyZk+RFtJMpYD+iwZeawmewwI5atceOPFAw4XyvWahXlb8xYuRWJPezc+A3aEGOfK
	Oxfy7jWSfyzFkzFevbCRocyh+RSKzQBSL3DvDuRuCV3ZhfRVzXHkw3aEOpY1P
X-Received: by 2002:a9d:64d4:: with SMTP id n20mr2169958otl.328.1640184414053;
        Wed, 22 Dec 2021 06:46:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWGq5v3Wbtrh4PeU7H62cWTdK5USh26sBwa/v72QaoEC128SxOE0jV+vaOf9/lS2lEuLJKNg==
X-Received: by 2002:a9d:64d4:: with SMTP id n20mr2169944otl.328.1640184413798;
        Wed, 22 Dec 2021 06:46:53 -0800 (PST)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id e20sm388241oiw.32.2021.12.22.06.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 06:46:53 -0800 (PST)
Subject: Re: [PATCH] crypto: cleanup warning in qm_get_qos_value()
To: Nathan Chancellor <nathan@kernel.org>
Cc: wangzhou1@hisilicon.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, ndesaulniers@google.com, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20211221205953.3128923-1-trix@redhat.com>
 <YcJHoqXXVFZatIla@archlinux-ax161>
From: Tom Rix <trix@redhat.com>
Message-ID: <73952545-2236-6065-3016-543e8d503c06@redhat.com>
Date: Wed, 22 Dec 2021 06:46:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YcJHoqXXVFZatIla@archlinux-ax161>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12/21/21 1:31 PM, Nathan Chancellor wrote:
> On Tue, Dec 21, 2021 at 12:59:53PM -0800, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> Building with clang static analysis returns this warning:
>>
>> qm.c:4382:11: warning: The left operand of '==' is a garbage value
>>          if (*val == 0 || *val > QM_QOS_MAX_VAL || ret) {
>>              ~~~~ ^
>>
>> The call to qm_qos_value_init() can return an error without setting
>> *val.  So check ret before checking *val.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Should this have a fixes tag?

I was debating that, the existing if-check will catch this, just not as 
efficiently.

I'll add the line.

Tom

>
> Fixes: 72b010dc33b9 ("crypto: hisilicon/qm - supports writing QoS int the host")
>
>> ---
>>   drivers/crypto/hisilicon/qm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
>> index b1fe9c7b8cc89..c906f2e59277b 100644
>> --- a/drivers/crypto/hisilicon/qm.c
>> +++ b/drivers/crypto/hisilicon/qm.c
>> @@ -4379,7 +4379,7 @@ static ssize_t qm_get_qos_value(struct hisi_qm *qm, const char *buf,
>>   		return -EINVAL;
>>   
>>   	ret = qm_qos_value_init(val_buf, val);
>> -	if (*val == 0 || *val > QM_QOS_MAX_VAL || ret) {
>> +	if (ret || *val == 0 || *val > QM_QOS_MAX_VAL) {
>>   		pci_err(qm->pdev, "input qos value is error, please set 1~1000!\n");
>>   		return -EINVAL;
>>   	}
>> -- 
>> 2.26.3
>>


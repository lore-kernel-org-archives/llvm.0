Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9C789208D7
	for <llvm@lists.linux.dev>; Mon, 20 May 2024 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198117; cv=none; b=D01phituDrAoAOu/NRdZXWOuQL+xOWcmj7AN4H2vT+5WQHQP/KgQEqtV4jZ/+EEYnHYfF2NuUPLODaBgzO9fTLDEp39YG6zawGT5qce5g/pveB2PXOusMbxNnHXF/+DMyYqTj+na6JXLpMKDKrelSngGxNyESbeQ14h0kesFGko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198117; c=relaxed/simple;
	bh=MSwJRE4bNdzB4NsI2nyECb0QTcxBA2yfxV2+VmIveKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=T5cUgvVlvC+d7xPTTJwVIdGABJbOznwSBozhd5hSLDT//zI7whkz3hds9A9iwM6tpMD26J52Jv/6BXQcTDtIQTSlXbAXLVlH2QO+cplHR0VhdvctownTy/elOhVULH8tyGd246n7u9poC085q/FltAHjoiv/4rDbhAnBRe7JXvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 32A546028428D;
	Mon, 20 May 2024 17:41:50 +0800 (CST)
Message-ID: <317ee58d-b435-0d79-cc57-ea28ae0fff3f@nfschina.com>
Date: Mon, 20 May 2024 17:41:49 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 1/2] Bluetooth: btintel: remove useless code in
 btintel_set_dsm_reset_method
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <28196c54-3c65-4646-84f6-76da79368f8e@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024/5/20 13:12, Paul Menzel wrote:
> Dear Su,
>
>
> Thank you for your patch. Some minor comments.
>
>
> Am 20.05.24 um 04:16 schrieb Su Hui:
>> Clang static checker(scan-build) warning:
>
> Please add a space before (. Noting the version of scan build would 
> also be nice.
Sure, I will add this in v2 patch. By the way, the scan-build's version 
is llvm-17.0.
>
>> drivers/bluetooth/btintel.c:2537:14:
>> Value stored to 'handle' during its initialization is never read.
>>
>> No need to repeatedly assign values to 'handle'. Remove this useless
>> code to save some space.
>
> The plural “values” is misleading to me. Maybe just remove the 
> sentence, and say:
>
> Remove this unused assignment.
>
> For the summary, “useless code” could also be more specific:
>
> Bluetooth: btintel: Remove unused assignement in 
> btintel_set_dsm_reset_method()
Yes, it's better for me.
>
> Maybe also add a Fixes: tag.

It's a cleanup not a bug fixing, so I think Fixes: tag is unnecessary.

Thanks for you suggestions! I will send v2 patch after the CI tests done.

Su Hui

>
>
>> ---
>>   drivers/bluetooth/btintel.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
>> index 0c855c3ee1c1..f1c101dc0c28 100644
>> --- a/drivers/bluetooth/btintel.c
>> +++ b/drivers/bluetooth/btintel.c
>> @@ -2542,8 +2542,6 @@ static void btintel_set_dsm_reset_method(struct 
>> hci_dev *hdev,
>>           RESET_TYPE_VSEC
>>       };
>>   -    handle = ACPI_HANDLE(GET_HCIDEV_DEV(hdev));
>> -
>>       if (!handle) {
>>           bt_dev_dbg(hdev, "No support for bluetooth device in ACPI 
>> firmware");
>>           return;

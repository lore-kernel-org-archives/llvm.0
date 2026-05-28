Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BFA33F390
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 21:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780003244; cv=none; b=MrcD3/jR03c/2ckoCm/z+Ok1G/qAg5DkV5X9NjRIBs8k1EVagrrOFyb5T8HjGsnec0nraL1Dt3Vb2nhOPuQEvmQQhjpi8iyHpZ/Vf7Gk38KexzlGEBooKnOZ0oAH9hR5WI5PTU7OqcM5LW/b9wv/HWAY5F9U7F2E+cucb4HLBo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780003244; c=relaxed/simple;
	bh=A94/tG6lKwQbFmTIH4sDEme76FVU1xOwfrmbZsKbPC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OcRW0X/q0aZIj+ITXdjJ4UBYVyYe0DbYYMCcCebTv9PUqj7FIOAvJDhmzISADAh2TH6bkni1q2Svc0SvxemulyCqo7z0D9X4LyM6dluOISeke5Tfw37veoU/Y+3tOHoBeJ4VxvYnCNfo8/C2XrMDhY7VLiAx3HuMUAB0I/gbQ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=PRF0N7O7; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="PRF0N7O7"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e603d0ee0aso4249501a34.2
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1780003242; x=1780608042; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=REoNE1HfXaVLqrZcttqszE/nOIthQd3PR5HKi6IwFgI=;
        b=PRF0N7O7LNKWAYzwYQVzAyM+ue/GwQ/ehU4MveUMq4vOFgZkB6/Skp+1Nj0xYrrnap
         WMBRxFy21Mgs216tNTT3MkSyh3DFV0B5gKsEcc04FdmnFh4gzejkSge/wAChWRx96vn3
         iq5ihBCIweUd2kCyLfDVKdJQjU99H7+o6Sf8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780003242; x=1780608042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REoNE1HfXaVLqrZcttqszE/nOIthQd3PR5HKi6IwFgI=;
        b=BZPvAw2u0iqSLedi7HDUEnGbspyi0C8KYRCKN7bEXiLDDxT4vBtBTirnlhzqWkNE0H
         Vbdvf1oP7N6UfQBtyS0MK6C3nWLsediQtIiZgZhaaizY0V4EcSFRarrBBemQx0R+m0wj
         XWS85GJ1CH1xNsx3sPEs/QWOptPiSyCJiWrnoKT5xswgxebGAR5MMnP3QCo0eDyL/jdz
         GHoa6kBqknAsrR42TqspkfRcn3ZLY1omRaLefE5Ij1GtyVFpZAM90Kix5k/8oLOPBAHu
         RnopM85e7ICdKBZpSj072oqS4tKcQrvr6akJvRMYBfX5s3PvKORWZ4xKG2s40umNH6tH
         G+Cw==
X-Forwarded-Encrypted: i=1; AFNElJ8Qe0EfcjvoDDuj+/6nHfhSrAWilKwhZtVfekZV7IC+gmwQP+mm/2fpVQSqBhkoW3eO84ZT@lists.linux.dev
X-Gm-Message-State: AOJu0YwgXUu1Lo/XqGmtfW2hDaRT3FCn45yJAyjV9EI5ysym8mEOO2M9
	J86aD5xlD6VnRClM3lTYnMuAWRznAq3DQOd1iiT30yc8IzZVN9bsAidq5s/tI5a6KA==
X-Gm-Gg: Acq92OG7Rt+Rwy7/BrOt5oN7kwpBjgbde9YuGDIG3P/lcWhOo29gt7hYyT9dLoXBuMj
	GwM+Cktz+yCY3K0qEBx0/IKY2GMQmj74n3CPu/IFOL1t2DSElCbCUE5QrkB/rSWXCcknMmApacF
	gKhikDH8AsAjPPUmaEzxBZV2ajm7ZtHMyNo4Autnk4ipH2Gynez/eM8ESg+zypG9zmhez0kaLVM
	jpt0TSKO5vbaHzY4EiURLXJc/hA4vvj3Cg0V6XAToUbOWdszg8gV89g0OSbi0oDOu3B6Jh1gOHr
	Cs2KHM0WQ1BjEfxGsKNxmUsWZAFas/Brpfjib391tY5NTI1hklmS2hdRKaj+SVEiYCM+Krz1/MY
	DQGdiPU4JY0kCKln2FpY10YjhueUQdoPh61rFDnVEAXSyCF9tvMdg21X3AtvZJDYxbNiaR1q3xo
	XfzV1Xieb7gtzKkO39T9r3nEt/fHag
X-Received: by 2002:a05:6820:4dc3:b0:69d:fe44:b399 with SMTP id 006d021491bc7-69e03eff921mr174988eaf.19.1780003242288;
        Thu, 28 May 2026 14:20:42 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69e040ce50fsm118638eaf.2.2026.05.28.14.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 14:20:41 -0700 (PDT)
Message-ID: <01625bb3-1a91-4d2a-bfc8-7d34ce4b5e5b@ieee.org>
Date: Thu, 28 May 2026 16:20:39 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rbd: cast snap_count to size_t to avoid tautological
 comparison warning
To: David Laight <david.laight.linux@gmail.com>,
 Rosen Penev <rosenp@gmail.com>
Cc: linux-block@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@linux.dev>, Jens Axboe <axboe@kernel.dk>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "open list:RADOS BLOCK DEVICE (RBD)" <ceph-devel@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
References: <20260528202151.136274-1-rosenp@gmail.com>
 <20260528220505.73eac71a@pumpkin>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260528220505.73eac71a@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/26 4:05 PM, David Laight wrote:
> On Thu, 28 May 2026 13:21:51 -0700
> Rosen Penev <rosenp@gmail.com> wrote:
> 
>> snap_count is u32 but the comparison is against a SIZE_MAX-derived value
>> (~2^61 on 64-bit), which clang flags as always false with
>> -Wtautological-constant-out-of-range-compare. Cast to size_t so the
>> comparison is done in the correct width.
> 
> If that warning makes any sense then the cast shouldn't make any difference.
> 
> Why not check against RBD_MAX_SNAP_COUNT - the buffer isn't big enough
> to hold any more than that.

I like that better.  Please do that instead (despite my
Reviewed-by provided earlier).

					-Alex

> 
> -- David
> 
>>
>> Assisted-by: Opencode:Big-pickle
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>   drivers/block/rbd.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
>> index 94709466ad19..b4ba51db9a28 100644
>> --- a/drivers/block/rbd.c
>> +++ b/drivers/block/rbd.c
>> @@ -6079,7 +6079,7 @@ static int rbd_dev_v2_snap_context(struct rbd_device *rbd_dev,
>>   	 * make sure the computed size of the snapshot context we
>>   	 * allocate is representable in a size_t.
>>   	 */
>> -	if (snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
>> +	if ((size_t)snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
>>   				 / sizeof (u64)) {
>>   		ret = -EINVAL;
>>   		goto out;
> 
> 


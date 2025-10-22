Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B440313E00
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761141370; cv=none; b=ATpJNe32nDg27ifwqtmntM6J19TL/gYFx2IRHgGPLUNRqdTELEhVgUBs/LT+PUsU1UJQpU1zvVDWzAjgEhxlaWtKaZKA5JnM0wiYCL+1SThdrxZOQiyrmwyII0nWTzZFUS1lBmRS46i07qARD8Nu+WpzzO7h3nfij/UD4x6gYuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761141370; c=relaxed/simple;
	bh=q1ki8CD4ekrzwYx4pxL9oVk7SvLipatLHZsgTCrTRA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgzfQL7TDvm8qN5/nQiQMO9eCjroRovceNQIYD7LxBBGhrlJnBfl0YezqsgYu0/7gCa9GTJGrzkZz99h9/F4zDmZ/MS5WTteXyFbE1E4XNxOUZy7gIBwE249GWIiEkXaMp/tBHbAWJivWpbkUMfx6wEb7SGG4QQ4gw6QNMtU8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=irQRt5Dk; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="irQRt5Dk"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-93bd394fab0so28376139f.0
        for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 06:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1761141366; x=1761746166; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4j8OyvK6t30KOQVtEJkqYDEQ/5UHSwAhZ/4iCsZyPjY=;
        b=irQRt5Dk6YHcUepsvGUICstQqNNWbZfZ96SnRPIcm0okiZqxL4Gzm7/jNHEmALroHt
         u7u6KNYmqACtg6Ws1cKSB86cx5Y0g36k/3dS04BsfeATF+49RRFz/T11Qrp5CjsHFMHY
         FRpBW5IouW/WqdEOv+A/fOzBqtDgzoQOGqrl/mnByZCDFwYPxmw9DRi3O7MZz8kXmhcF
         KT+M0jSb2hYTJM8vc6BiK49SGtUU9r02bJw+AnzENuVjA2rMgYjRapiPzyy4oc6gGPR1
         cxSKPsoScKxvtt4z5oX/MMr9x0ESnk2bBmL+kKq3KKgPNuvdyHE9SG0wwConyRTf+W4o
         raDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761141366; x=1761746166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4j8OyvK6t30KOQVtEJkqYDEQ/5UHSwAhZ/4iCsZyPjY=;
        b=sBzBrYsm/5DuKC2M/IpAFHMzXpNXm6ApxZux5xMjNIe4/j4JJJ/FBJkel907ByLgz/
         y3/NA0uV/vIgdv44/33PGXBn52bOEwiKZi+yuW/ReWMaXSOoq+uctTj8gA9bcnpuM1PL
         zzpKM9r8LTmNZTuxRKcMZF7UgvEbrv1KjcG0Mk9zlB0i5jDEEhhaqIBiVgg29pyq0kGT
         teugTwFVGpQSB1fgWR4XClGLPOWqZgamx7X+jRdYvvDUP1vpYvPt7kzrKnC+nKgCaZH+
         cVr+ogiZ65e5kDy/4NTcyW/bDUKDQw7Ts3BxbrSmbJ1GpA3CstpZhsNq7jUlOPGZqDYd
         l1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI+mm/pfV6tpzuZk94Rma2p8lGwSnJKc5JD7pidogAmyNEMkLawp1Geh+dZIi11q2nlJO9@lists.linux.dev
X-Gm-Message-State: AOJu0YxzXbY1I0l5qvexHmPTcxtk6vl7TkAKa/ZCcLb7zrDoUNmfjsac
	XGoe+CO61MDwXvHqTsdo1xSTv2gIMRODcbopsk6vnx+nds0wbQ4ukehOqdqSMSFArybYfYT7dzc
	antLUJ34=
X-Gm-Gg: ASbGncsd3c+E2+qaJzBXGZD7PCPTlN1EDaDRjJzSmFDCQIjNjzKsUDBYTM9jb04pioi
	OW0HaFkPT5Y22BWb8C9ZMQH23CDg4iKSXPY4T2ky/pUYwtYnL5Ufh26xGMzAzfVhzMbHpbqWKc6
	dUPI5+JZtfufpLoeKkR8/1CUz/fywjotslA+teuyahEFNoX/o2dvNw/c3mSpRxt6H3zV/VYvyFA
	gcHoLYRUSMf0eLhtLvCO1Jh8WgY2CyuLdMe7aOa0tTfZjvw1C9p8ON9u6svsEWR5X7fLMKjO7nG
	aZCoNvcod+jrOoe3OxeGb/k18U0EIDwbpJ4rw7Vw2+YoAYBJ8TAzCHBPefvOXiq1gZlZbJynKXR
	sosCHTWo+DWFgQegfe0baY89tRJ5PGkiXWQ6OmLtchnBaBxOwpj0ahtyLfu7IscdGjNyl94BN
X-Google-Smtp-Source: AGHT+IGqifK929VZxtAIG4ZTGbov9xEtXX9LbfMYUADx3IoiuG6LKNs/gy7l9IYfTZVTiCEg3F0B7A==
X-Received: by 2002:a05:6602:3058:b0:93e:8b7f:5af5 with SMTP id ca18e2360f4ac-940f9a7ae60mr143932139f.7.1761141366423;
        Wed, 22 Oct 2025 06:56:06 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e866df2eesm528069539f.19.2025.10.22.06.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 06:56:05 -0700 (PDT)
Message-ID: <6a3f7489-5003-4fe4-839f-f06019ba2f6c@kernel.dk>
Date: Wed, 22 Oct 2025 07:56:04 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6] io_uring: add support for IORING_SETUP_SQE_MIXED
To: Keith Busch <kbusch@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, io-uring@vger.kernel.org,
 csander@purestorage.com, Keith Busch <kbusch@meta.com>, llvm@lists.linux.dev
References: <20251016180938.164566-1-kbusch@meta.com>
 <176108414866.224720.11841089098235254459.b4-ty@kernel.dk>
 <20251022120030.GA148714@ax162>
 <4ea25979-4fc2-4db7-8656-6c262af2cbee@kernel.dk>
 <aPjhwxTf0wAw_eaW@kbusch-mbp>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aPjhwxTf0wAw_eaW@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/25 7:53 AM, Keith Busch wrote:
> On Wed, Oct 22, 2025 at 07:34:22AM -0600, Jens Axboe wrote:
>> On 10/22/25 6:00 AM, Nathan Chancellor wrote:
>>> On Tue, Oct 21, 2025 at 04:02:28PM -0600, Jens Axboe wrote:
>>>>
>>>> On Thu, 16 Oct 2025 11:09:38 -0700, Keith Busch wrote:
>>>>> Normal rings support 64b SQEs for posting submissions, while certain
>>>>> features require the ring to be configured with IORING_SETUP_SQE128, as
>>>>> they need to convey more information per submission. This, in turn,
>>>>> makes ALL the SQEs be 128b in size. This is somewhat wasteful and
>>>>> inefficient, particularly when only certain SQEs need to be of the
>>>>> bigger variant.
>>>>>
>>>>> [...]
>>>>
>>>> Applied, thanks!
>>>>
>>>> [1/1] io_uring: add support for IORING_SETUP_SQE_MIXED
>>>>       commit: 31dc41afdef21f264364288a30013b538c46152e
>>>
>>> This needs a pretty obvious fix up as clang points out:
>>>
>>>   io_uring/fdinfo.c:103:22: error: variable 'sqe' is uninitialized when used here [-Werror,-Wuninitialized]
>>>     103 |                 opcode = READ_ONCE(sqe->opcode);
>>>         |                                    ^~~
>>>
>>> I would have sent a formal patch but since it is at the top, I figured
>>> it would get squashed anyways.
>>
>> Indeed - I'll fold this in. Keith, can you add an fdinfo test case for
>> mixed as well?
> 
> Thanks, and will do. Any quick hints on how to ensure fdinfo finds some
> entries to report? I assume I can just put some entries on the queue,
> but don't call io_uring_enter.

Yep that should do it. You probably want to do something similar to
__io_uring_flush_sq() since it needs to be visible on the kernel side,
by having the SQ tail written too. io_uring_submit() does this, but
you'd want to do it without calling io_uring_enter() to submit the
entries.

And then probably do that with various states of mixed sized SQEs in the
SQ ring and verify it looks correct, too.

-- 
Jens Axboe

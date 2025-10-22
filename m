Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE086347FC7
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140074; cv=none; b=Nvqtfsn1L440yHAms+SyI1w3Lvke0bxLdCXJ2DSXLM1PCem5tOEANn1TP3qPSZjn54/TuQ8+Xr/C1iNUVAGxRgFimd2s7xdr+pNsEKv0fCy3JZSV2IlACFkNTVfjDni7BR+LkduCblf+90pZMKfTI9qfokLYaQBS4HR8ARm8AJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140074; c=relaxed/simple;
	bh=4PnkTP9Pu4f71u/WXu4R9YBsEe9bBIoQkb/JNrrqhD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4MzwilNsA8HlghxTMA/auZfIyZs6xvJ5OC4MLdUo0KwI1N8uprKgKfBhzJWnmlSKg3X9hQMOEOOC6daxJWs6Cdbs/trcCM/coBqcyXAYhHZuQoKS5cG7F5tQ7gFju9HhBpfNz2YnUawfRQcFvwOHvDQPcJlYAUgEyK5fjwYaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=rhOHNm9/; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rhOHNm9/"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-93e2d42d9b4so299146439f.2
        for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1761140071; x=1761744871; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XV5vEDb+PLsuEAr5Dc791OLpoWf+84eLdNZr6HQ4S34=;
        b=rhOHNm9/WS4TEKPZYL4k6JjDzDczPgGEoYWXLApV7swGPqT+inADR2fEUyB9t0/5v4
         wHtOPySUuUC8tv4XwCxooR8UzS7LRy1IEh+JztTL0BlvSJ4DcqztUCNA8V8mLEF/iIAG
         QrZMCS1WYHbpCPEGby/uUzkb5oocAcA1ykzK+lB23WZ+fpLrwBNRgj+9UPKRun7375rZ
         VH9Kx18O8omBtryq4MLiwD0YALrL8/OUr7hFaRVdOgsh5Ns1euqsJvQucYMEaNzqnaZi
         +q2cBua8HMNSLh4n4NTG6pHK+3PZaqLYeiX/Y6zH6bMPT/Mhv4h6kYAaAAavoC1iqVF+
         wRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140071; x=1761744871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XV5vEDb+PLsuEAr5Dc791OLpoWf+84eLdNZr6HQ4S34=;
        b=fpwJwCQ+pnvd1b7X5oWw1bQMk0uFtiFd59jm3hi7xL60UJ4JEEIIj3B1IIJprCK5/X
         slmNQULL1LM9f6PMUJQ6s1cgubahF1gmCXQ8VZD9rC34vcf7sBp5/kLpLGfPFTzphxN8
         Wx68AKHWxRpw6XWUAmdeo9LqWUWPgM/jlsl5THTlLGNXLuBRNyaoCmiqtSjardGb895N
         S0s8aaM3Bjp+n1gI+wn6RnF4GO19UM+FfU6Ve/WZ3HApw7Fpy/Slaf2hvlCx33/fbFRA
         rkWH7mxW2S53QOzssCBMduNu9y+MeSfDwk3LSMZWJ54TRlsnbTrv3HGx3ZvoSa2hwWns
         8MRA==
X-Forwarded-Encrypted: i=1; AJvYcCVVLSxlHUOsgtbYiIABij4ya63P5EzqI/X9ptluWUeCb+vbngvlxuwRki3OZembQjEXuf56@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv9Eh+K1i9zxwixrxWPnh9vg19GryuHXb0EmhJtCmgj6tIKl7X
	kLcUMlSbqiKJ8b8m0mAuR4pyE9G+Arv9utQipEArZvyz32vaIuy1oJsEREjTPaddIAk=
X-Gm-Gg: ASbGnctsxd0HmszehgmOdBxsvlNim3U19Oxd6eekaW19EKsVBvIwzsDAGKDtdE3mXxd
	5h8G2erAcvzoij8vB2sZjr2T/pJz2I732QS7mmGxPoe09ip4uN7DVRNk0tCvIr0fuBS3gY3nMn8
	v/QarNIfQ8KePCIarhYEhsrO/Ln2GWDKNr1tJbur4fY/Uqg3JNFaU1sfUcJazD45GPJEzDJCpc+
	sWP+aVgyMN9L5jjdwnMCM80Y6RsScWPz1f8R/PtiViSw8puLNrJRikLMzedIy7BTeNPtk2jcvDL
	3rk74Qq/FFpG4FsPw55bECyZg2BfdId/Tv7120SpX6/9JOUShobu84Yc6G3fs1xOFchN+dnhPA+
	CqG10ZY3pVG0Nf0zUKHclGzss1b9k3V7nlzusa6X5CqeSSYWc59GNgAZmtdmDv8CrPfkNxIOM2W
	cyZhebC06KjZE5KAcQLQ==
X-Google-Smtp-Source: AGHT+IFc8uoj4Do5t5zb539hS6BCkySzVR8p6zymdCVAWTi1lnzPFJD9IswWcUa1DASlGW2uIwU4ug==
X-Received: by 2002:a05:6e02:1d9d:b0:42f:95a1:2e8 with SMTP id e9e14a558f8ab-430c52d5786mr269032565ab.24.1761140063517;
        Wed, 22 Oct 2025 06:34:23 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9630bf1sm5181320173.17.2025.10.22.06.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 06:34:22 -0700 (PDT)
Message-ID: <4ea25979-4fc2-4db7-8656-6c262af2cbee@kernel.dk>
Date: Wed, 22 Oct 2025 07:34:22 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6] io_uring: add support for IORING_SETUP_SQE_MIXED
To: Nathan Chancellor <nathan@kernel.org>
Cc: io-uring@vger.kernel.org, csander@purestorage.com,
 Keith Busch <kbusch@meta.com>, Keith Busch <kbusch@kernel.org>,
 llvm@lists.linux.dev
References: <20251016180938.164566-1-kbusch@meta.com>
 <176108414866.224720.11841089098235254459.b4-ty@kernel.dk>
 <20251022120030.GA148714@ax162>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251022120030.GA148714@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/25 6:00 AM, Nathan Chancellor wrote:
> On Tue, Oct 21, 2025 at 04:02:28PM -0600, Jens Axboe wrote:
>>
>> On Thu, 16 Oct 2025 11:09:38 -0700, Keith Busch wrote:
>>> Normal rings support 64b SQEs for posting submissions, while certain
>>> features require the ring to be configured with IORING_SETUP_SQE128, as
>>> they need to convey more information per submission. This, in turn,
>>> makes ALL the SQEs be 128b in size. This is somewhat wasteful and
>>> inefficient, particularly when only certain SQEs need to be of the
>>> bigger variant.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] io_uring: add support for IORING_SETUP_SQE_MIXED
>>       commit: 31dc41afdef21f264364288a30013b538c46152e
> 
> This needs a pretty obvious fix up as clang points out:
> 
>   io_uring/fdinfo.c:103:22: error: variable 'sqe' is uninitialized when used here [-Werror,-Wuninitialized]
>     103 |                 opcode = READ_ONCE(sqe->opcode);
>         |                                    ^~~
> 
> I would have sent a formal patch but since it is at the top, I figured
> it would get squashed anyways.

Indeed - I'll fold this in. Keith, can you add an fdinfo test case for
mixed as well?

-- 
Jens Axboe


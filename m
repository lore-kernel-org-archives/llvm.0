Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3DC1E8345
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 21:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195992; cv=none; b=ImATpCIey1WDXhuA0Qnq2OkJC691u6orX/e06J4JBOcpKvcaeu2LCISQ2AzMeAQp0NoeSJus49SZkfl1tJOu1omLmJojr38FTu9gS8V+e2M2h+9yTzF03sViRHCiP1WsTkWmTz91a5J4nFmokkjR5aNF3BrVEr90QDFrZ24BfFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195992; c=relaxed/simple;
	bh=4MvgCRk8GKUCzZRBR3jsAkV02zjbQDWVsh7de/ESgho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7EaBdcfR11rp2TKzFzZjD964wviIqbpA8TMx82HNUxeOMkPykD9Lfm3SrFuwtU5XoJ4I9AERWj67ntQ2tlPJPAauzU0kDbgV7DFwECDd7jYUTZI0oo3Vg/Jb0R8r6hhZdTxGQER68GXij1NgzjLSXlOOr0HVpsqR4ob4sQtOKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F6Scj65F; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F6Scj65F"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85e73f7ba09so219827339f.3
        for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 14:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743195990; x=1743800790; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZjFz2NYE9XublGU59tucHqCizA+dgqB/ZBSarbDyb8U=;
        b=F6Scj65FMe6vKqKHtqYmKMQyJTXPsqyGd5Oo1yG8TISQ4IufxSASi/aGUhfRl97u1F
         /mEDksEyKopcMMygUzSAX8gHtpVxJXV6fU3UMZV8vSyHIRWJHmfagvptacLFnYlOEcWt
         EscV6IzsBTSXsEXytUF4apJbGbU8AEh/fap7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195990; x=1743800790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjFz2NYE9XublGU59tucHqCizA+dgqB/ZBSarbDyb8U=;
        b=E4nnsXuR6Yr0Yuv7BrlqtmhbKcWvh6voZef2krvKCUsEcJTpahDM+yA04xK2C5OLj5
         GDV6/DQJDDnuOzBZlqMgaOWZQx0VqucDVulVGu4cNAgE8UwmntCTEGTtGFcM24+NdJiW
         Y27Sscvk/U0E2LWFbTtlOkYWc4cglc704/sseUJxWyyNcmeh+6vDkgQUfpUoiDD5P4c6
         6C4EQgFoaEld2Bq9KH6TWFonRXFui6Zd3VYopQTPnf2lgEKGNRiyzc0fTyt1+MR8ybHC
         0UuKjvWcKLX4Ka4h7UmeFHkZCDUkKAJlDm2rJNQ8TGIThvUcbDsIuSnDrPVo4KiwUBPE
         9GtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCxnXONIrZSjwncTSJDFJj/v8QTIYoUtcgX5BIEUAtiF3XN9F27ti31oKrzZ4PXD3zcmUj@lists.linux.dev
X-Gm-Message-State: AOJu0YyfaJtmAdrlCJyvzmiuRvr63o4M8nPsKm+I4IXBDWxDMJZUsh+x
	cBRwwmY7iLExfDNGaQHpxuS6XACGsRrM+q2jWCjTCJcZj4/hHxVdJ+7wDmkX28b61WJI7BJrvHk
	n
X-Gm-Gg: ASbGncvqk92I5f31DTGXA1YLJsKxqImqRcyu6GuJ4JS+88qHdctKDbo5O8Bsleu+PO/
	m4x9UITVoetay2WWhftV/ySaibxaG72FEWJeYZ5F5EbZZ6C76xaqYyKhLc1X8qvQvHVAJEW6Bpw
	lShHEvJdkwodE7woR1buQzhtLSBphJARnmM18AgJQ7zqY1MP8RMeFn7q1aw1Hsi+zcgbHPRsgTY
	wjJPYf1oyH0aiAvKKha4sEtm1PlhAz/kdK1ZQEHb47WN76lxszN2tuv4OpAzW2DkMRt9TDm3U2v
	JTrCYXCit24h6513WE3RUQgX2UhrlGj/sHh+V0DJdxTxD4Y/sMHKvCo=
X-Google-Smtp-Source: AGHT+IFQAA9lc+Ygw2fQ5AmWnDfp7459wtXQIdhZp08jrwKejpiRtTEBUmQY7sGkVk28m2VcnOcD4g==
X-Received: by 2002:a05:6602:3999:b0:85a:ec03:b124 with SMTP id ca18e2360f4ac-85e9e86395cmr140854939f.4.1743195990070;
        Fri, 28 Mar 2025 14:06:30 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4648cc348sm622042173.139.2025.03.28.14.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 14:06:29 -0700 (PDT)
Message-ID: <b26a2a43-3c55-4086-88e2-64e65dcfbeb2@linuxfoundation.org>
Date: Fri, 28 Mar 2025 15:06:28 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tools: Drop unlikely definition from
 insn_decoder_test
To: Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>
Cc: x86@kernel.org, Rae Moar <rmoar@google.com>,
 =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 KUnit Development <kunit-dev@googlegroups.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250318-x86-decoder-test-fix-unlikely-redef-v1-1-74c84a7bf05b@kernel.org>
 <Z9spq9OccwK7vKj7@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <Z9spq9OccwK7vKj7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/25 14:31, Ingo Molnar wrote:
> 
> * Nathan Chancellor <nathan@kernel.org> wrote:
> 
>> After commit c104c16073b7 ("Kunit to check the longest symbol length"),
>> there is a warning when building with clang because there is now a
>> definition of unlikely from compiler.h in tools/include/linux, which
>> conflicts with the one in the instruction decoder selftest.
>>
>>    arch/x86/tools/insn_decoder_test.c:15:9: warning: 'unlikely' macro redefined [-Wmacro-redefined]
>>       15 | #define unlikely(cond) (cond)
>>          |         ^
>>    tools/include/linux/compiler.h:128:10: note: previous definition is here
>>      128 | # define unlikely(x)            __builtin_expect(!!(x), 0)
>>          |          ^
>>    1 warning generated.
>>
>> Remove the second unlikely definition, as it is no longer necessary,
>> clearing up the warning.
>>
>> Fixes: c104c16073b7 ("Kunit to check the longest symbol length")
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>> ---
>>   arch/x86/tools/insn_decoder_test.c | 2 --
>>   1 file changed, 2 deletions(-)
> 
> I suppose this should be merged into the Kunit tree? The c104c16073b7
> commit is in -next currently.
> 
> Anyway:
> 
>    Acked-by: Ingo Molnar <mingo@kernel.org>
> 

Thanks Ingo.

David/Brendan, Okay to apply this for the next rc?

thanks,
-- Shuah

Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109824C624
	for <llvm@lists.linux.dev>; Thu, 30 May 2024 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717096200; cv=none; b=alruYuY+SdfHs9OuA0QVCcVM75CIwDlSX3ektXY8h4KgoObOuvYqwSkBlbZua8HwalwjZpnQkBdJ4KtY6pFOjjsMzJUgmVfRf8jqcdje4M8+8BFd49IhIOEXFwgAgWHa27ZRXf8juIY9n9kl8Y42l3d+R0uaWiKizC+/u8cse4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717096200; c=relaxed/simple;
	bh=xDFSARpGqCzo0/7RFIXaYWJVdeCDcGwisUU1BrK4egA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=beiJgYi5b2pVkorqH9f4QfkBXjriQoOuP0wsYrDaCJBAEDU81yysc48jyv5hPGca5XO1J0NlizKIZpzwdsKixCp8TvB+bWIe65SB26s1gx9k6beuWyAvgItbnSURC01ty3oc0cFDerGedyanz6l1W9/HwlRPByS2GgUHJcR28Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MNQWiLX9; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MNQWiLX9"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7e8e2020002so5906939f.0
        for <llvm@lists.linux.dev>; Thu, 30 May 2024 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717096198; x=1717700998; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IcKB/OzN80KdCv2vfgGkfs7hKHO3oNyK2DZlDHQX5Es=;
        b=MNQWiLX9bsg8ymbsR918gvRqwyT4SeFg6PFlX4D1qns4hG+HlN+mTPEEcrGSZfR1bh
         9RAgXxsXpuFxA+qMgoISnOIz+y0AtbIz2GDfOXgPAoxnJKIrInvOd3zBFBegYBa7rA9K
         mhMSHIhyUcJXZ/oeis94k64TnS0y3PFXBGPGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717096198; x=1717700998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IcKB/OzN80KdCv2vfgGkfs7hKHO3oNyK2DZlDHQX5Es=;
        b=epilfFZGVldHpx9J0rS5e0NwC/aXws9ixGm5rR1V9bKLFEclO2TRipycyKhiGNR5F+
         WVrb+dofwrnlnzgR2yY9eYBqUBb8tTpvyUtLLEeWOBioW09nqFzULzEjgxHJBLbE0WPq
         qREdSjJyDEi7ZP1H4Op1Bt2WBYwM8ZsV+PeuD0dHQWtZLwMWDQX/gaZ47CndiHC63SAL
         v++2AgzmeU8r35nELUd2kahxiBGO9umHszMegMB56Ne5FOQz6YbAQQlG86dsl6UTWhSG
         IooubXSquziZ/9RlptHHan2GUy9OBRuiaIsS8OVCoWZvgxmbsPAdI5kXinyZxjSHpsfD
         zinA==
X-Forwarded-Encrypted: i=1; AJvYcCWPu3jP0jAbZw87dCXdifXv8aYkIENQylTj40mUMA2DJHgmw8fGr1ViTAspNvYtzOpKB95C5DEeREA5Drj2mDhgV62YSw==
X-Gm-Message-State: AOJu0Yx5Ajd0hqT5DcYviRz27VUSuohUnAx0JEbEhwvmDunHuF5I2ilf
	fdmKSZxHdC1eJjhuPv2l1V7iymdf6LxT5dfrnmqrJjgTXV55WoS0hrFsbn3qsG0=
X-Google-Smtp-Source: AGHT+IFkN8Ai4VWwR2PnmlSq/IYFOdiHtE3kJJIeH5v5Cghihl734+b5MpoKYjTzHOlYkXDDq77yvQ==
X-Received: by 2002:a05:6602:6426:b0:7e1:8829:51f6 with SMTP id ca18e2360f4ac-7eaff5e2ca8mr14707139f.1.1717096198165;
        Thu, 30 May 2024 12:09:58 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b488e4b35asm67021173.79.2024.05.30.12.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 12:09:57 -0700 (PDT)
Message-ID: <a56e4c6e-fffe-4c88-9bb2-8bcafbd91fa6@linuxfoundation.org>
Date: Thu, 30 May 2024 13:09:56 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] selftests/futex: clang-inspired fixes
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Edward Liaw <edliaw@google.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Nysal Jan K . A" <nysal@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240529022938.129624-1-jhubbard@nvidia.com>
 <b6641940-f10a-4ed4-a672-69c6d51125a7@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <b6641940-f10a-4ed4-a672-69c6d51125a7@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/24 08:23, Shuah Khan wrote:
> On 5/28/24 20:29, John Hubbard wrote:
>> Hi,
>>
>> Here's a few fixes that are part of my effort to get all selftests
>> building cleanly under clang. Plus one that I noticed by inspection.
>>
>> Changes since the first version:
>>
>> 1) Rebased onto Linux 6.10-rc1
>> 2) Added Reviewed-by's.
>>
>> ...and it turns out that all three patches are still required, on -rc1,
>> in order to get a clean clang build.
> 
> Thank you. I will apply these for the next rc.


John Hubbard (3):
   selftests/futex: don't redefine .PHONY targets (all, clean)
   selftests/futex: don't pass a const char* to asprintf(3)

Patch 1/3 and 2/3 please see changes requested.

Applied to linux-kselftest fixes branch
   selftests/futex: pass _GNU_SOURCE without a value to the compiler

thanks,
-- Shuah

Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C72157E9B
	for <llvm@lists.linux.dev>; Fri,  3 May 2024 19:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714764421; cv=none; b=F6IJZtEDicOn16pd9E3wbeAWFjZrL1eqZXUt6WRbXdOto+vP7764bg2pNJVxnbPOQTOtWngJnxrXrfKfxjEQT1sEjPvFpb880r7Wl8O/GcrP8HgzrMWNpv1MZdCqvzsGakiWgt1Ox2sOl+2fX5OADQilamDiSgDcJDgleDudJTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714764421; c=relaxed/simple;
	bh=WvNlFxi7iBYAtjMjEa//mHPsqvxt5LdVHnEKn83dCEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnR/x8UFPlDkDaSbbocJfRy1Vwg57RgpHmw4ij6nKL1z1P2/GIgHp+WFnqqY8SDgQO9OoXhSrnQKhqd0I2Fn8MJJ79hhCDW0QHHsOyVo4Q4dNogp5n3eTjxzIssqPrNOxaiPGKD04eOS6f0jOG7V+ciaQp7q243NQCS2Ydq9Zhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TXH4zDbb; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TXH4zDbb"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7d9c78d7f97so41639f.3
        for <llvm@lists.linux.dev>; Fri, 03 May 2024 12:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714764419; x=1715369219; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2KX9yLukoPi6iAtAAYiont6LefTtRljJSxxqAFKOfPw=;
        b=TXH4zDbb9YGe99OO+/7UR6wzEmhVO4xqVDLvBE/+w9aNuN4Rpx2uJWTQmYrnBSJn+W
         /adJVKM/GtgZIN0dqQQct0A1rT9OplIqIjl3BrESdu7a7urxjBGGM4bEm1rxVfKu+1tw
         02S3lS7UdSS7KPNBVXyZGa/3h175puSSIYytk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714764419; x=1715369219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KX9yLukoPi6iAtAAYiont6LefTtRljJSxxqAFKOfPw=;
        b=awsk71tdWJ84PG7a2cTaUswXSTu/P4p0/WAiinM8aXd8mPlL+nlCeL9of1RwRCCEUs
         fm3kRjm3mDhyw/692XyTa6QtUrF3GzQj07uzW3CfIkcISuf2uttuDS0lz/mbBqrDfy5X
         W74UbvYGwAM7v8HuD9F1q7Xk1Y8Tbh4P4qog0FVPeHmIoFhBKCFvEPZx1zU5wziZ6EDA
         2sMdieMSGb82edj9EdYiwlX5sL+cVbvb8XJIM+Dc3LM4QezQIBC9kkaK44k8xZcHEbfY
         YNBrHaS1CwW5VQR0D4F/TGEUWrw1RAyaIDorShm93dbbj9wO1dTmahNGv+9gda0aO8xB
         DcvA==
X-Forwarded-Encrypted: i=1; AJvYcCVe3utyCTfPq8+PVWp1YHvPs6vKDz/PI5lU93ngFVnZp6xfX3oVvyKQ+8gcS2w3gIUtVaDmETf+/mEj2qtN32BtkSFiRQ==
X-Gm-Message-State: AOJu0YyEPAtUgygvvDl7M47TGQo2akkLjM7C/LnL4tYUNQi3PZA4Vkl0
	ZDxjf376vOfYjTrcnYrcgAKOo6UlAJVd0tZtyo3YNb7M91dUz0cIykV7S4ecasg=
X-Google-Smtp-Source: AGHT+IFoJvN6WDjavGp1uTSV43HqVeCXcSZGG+uXNfqWRiXEfwPFUMuzOtNwWJNtKWyqMxEa9EpoIw==
X-Received: by 2002:a5d:8454:0:b0:7de:e04b:42c3 with SMTP id w20-20020a5d8454000000b007dee04b42c3mr3590661ior.0.1714764419230;
        Fri, 03 May 2024 12:26:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id g6-20020a056602150600b007deeb2d7c4csm790790iow.12.2024.05.03.12.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 12:26:58 -0700 (PDT)
Message-ID: <66bc5c54-d785-41c9-b0cf-3e6efe78d723@linuxfoundation.org>
Date: Fri, 3 May 2024 13:26:57 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/resctrl: fix clang build failure: use
 LOCAL_HDRS
To: Reinette Chatre <reinette.chatre@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Valentin Obst <kernel@valentinobst.de>,
 linux-kselftest@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20240503021712.78601-1-jhubbard@nvidia.com>
 <977ebfe0-4c12-4631-8309-a10d92e33fbd@intel.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <977ebfe0-4c12-4631-8309-a10d92e33fbd@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/3/24 12:39, Reinette Chatre wrote:
> 
> 
> On 5/2/2024 7:17 PM, John Hubbard wrote:
>> First of all, in order to build with clang at all, one must first apply
>> Valentin Obst's build fix for LLVM [1]. Once that is done, then when
>> building with clang, via:
>>
>>      make LLVM=1 -C tools/testing/selftests
>>
>> ...the following error occurs:
>>
>>     clang: error: cannot specify -o when generating multiple output files
>>
>> This is because clang, unlike gcc, won't accept invocations of this
>> form:
>>
>>      clang file1.c header2.h
>>
>> Fix this by using selftests/lib.mk facilities for tracking local header
>> file dependencies: add them to LOCAL_HDRS, leaving only the .c files to
>> be passed to the compiler.
>>
>> [1] https://lore.kernel.org/all/20240329-selftests-libmk-llvm-rfc-v1-1-2f9ed7d1c49f@valentinobst.de/
>>
>> Fixes: 8e289f454289 ("selftests/resctrl: Add resctrl.h into build deps")
>> Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
> 
> Thank you.
> 
> Acked-by: Reinette Chatre <reinette.chatre@intel.com>
> 
> Reinette
> 

Thank you. Applied to linux-kselftest next for Linux 6.10-rc1

thanks,
-- Shuah

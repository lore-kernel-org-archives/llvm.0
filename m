Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61965FB8A
	for <llvm@lists.linux.dev>; Tue,  9 Jul 2024 20:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720558514; cv=none; b=tPp3HJGonZcezYms2vi05CY2AAQ/h12VAPCPm7sh/J9clWtQNZFHQn/nD+ZzEMm6PA0g/xuSniYFeBDMNcqZWarvD3ua8qHhhA+2PEtazILw9MaOdkGGb7qIzkmsVY93ySKjTkrb4TDgAnj/YVkUGFxpqw/z/G5QBDY9dXBlSIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720558514; c=relaxed/simple;
	bh=o+kjmggQJg9k2C51wKggJKaDqzA0Rap7ZoYOuaO1xOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDS95/Jmp+3ZmtujUiHvGv4mOxHrEmovg0nJDeilvVnyc0r6yfDTIGi0AIR1xr7nwImIhecTOCw/Gi/PddG0vpWedfsvmDa6EeHjgO593GiO5vA7BiYa7JEXDvUGbh+3/Tq0f7qGEUPyUFoOFG7ZjK/eKHuBRtN5Cyiuc+vqlcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZXHc0H6g; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZXHc0H6g"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7f906800b4cso10082739f.3
        for <llvm@lists.linux.dev>; Tue, 09 Jul 2024 13:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720558512; x=1721163312; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojllmUSpZm6yrskg60MuCouRkTNtpmyHnalLRc4XlN0=;
        b=ZXHc0H6gpaiaYC+0Mvy6KnenTsBYIJUnjIJh/MVRFIC2q9TtaPD1aOFKAqwt5eh+Rr
         /M5HoUXWj7nPo/WVFxx3W55eTXINlmq7Wi8M19XIZyfR9f0A8Y9gkjEy9pxxFuEJzyiq
         50VUMYJXGdYs2zXpFNkA8UhRwZiKLyUb6FYnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720558512; x=1721163312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojllmUSpZm6yrskg60MuCouRkTNtpmyHnalLRc4XlN0=;
        b=IiDcKamunuPZ1j0lzyxYSiiz+StIC2fB4F2n7d0AUeAS60vLRVrrZy7NxAtKR4mAtM
         8qb3iw6zhNvQiKtfNKRieMJBLzXVvMcQnKnjze7XlRFN0609SroAx398p6yzUZfTnet/
         3V5IGBJXMTe/YfDqpveeWFWNKfiMPJb8JiC7GzFju7/i8uY3n1lJY23xVQUtTtzGLKyF
         WTqG8LeAdMlRoWIy2i1R2+Dona0qWXl9WNc016HoMSHx26B8kQnHhcBpmHBlhY7L6Ysm
         JXdffHQeUrYd20wFlxy5Rpx4myPMXc6e+9YpUEUSiKZBNGldx7/tIkOAgx6SM3fwJpyM
         3KHg==
X-Forwarded-Encrypted: i=1; AJvYcCWmDNbr9lfWM2Z6bEMYzrJdbf/2SLmwxkbh0x3pwnukRBzhIsJuNOVAgEBSTwsf+TEK7I5jfgdu+r/obxaii8YQoGyBIA==
X-Gm-Message-State: AOJu0Yzm/0vKGXjLIWz+erKvu6L2lStF9g+ZugA3oZV6PBvY1FRqLD/z
	bcpDgT0EE3ZiComIJzIOCtkfaLS4n0WY92CdoLtUeKq42y+szTpRu4/6WuEv7bo=
X-Google-Smtp-Source: AGHT+IGsTMwpROjo3tzdIGl+v6KmheqJ1Zkqq2lQFdbmodzrdfcJ5ZovcBQXKo9Hg/rrSAQ8WBlnZg==
X-Received: by 2002:a05:6602:6103:b0:7f6:85d1:f81a with SMTP id ca18e2360f4ac-80004dea088mr421983139f.2.1720558511891;
        Tue, 09 Jul 2024 13:55:11 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c0b1b5c55fsm687026173.77.2024.07.09.13.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 13:55:11 -0700 (PDT)
Message-ID: <0ce444f4-8d49-472f-a687-34804347296e@linuxfoundation.org>
Date: Tue, 9 Jul 2024 14:55:10 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] selftests/x86: fix build errors and warnings found
 via clang
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: angquan yu <angquan21@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ingo Molnar <mingo@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Sohil Mehta <sohil.mehta@intel.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, x86@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240704072431.111640-1-jhubbard@nvidia.com>
 <a08e6846-2f9e-4fb4-910f-b33fe779fa01@linuxfoundation.org>
 <49c14f8f-0c08-41e0-b987-7c4253edf6de@nvidia.com>
 <78c3ed1e-32b2-43aa-9979-0479fa524018@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <78c3ed1e-32b2-43aa-9979-0479fa524018@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/9/24 14:51, Shuah Khan wrote:
> On 7/9/24 14:40, John Hubbard wrote:
>> On 7/9/24 1:34 PM, Shuah Khan wrote:
>>> On 7/4/24 01:24, John Hubbard wrote:
>> ...>> Muhammad Usama Anjum (1):
>>>>    selftests: x86: test_FISTTP: use fisttps instead of ambiguous fisttp
>>>
>>>
>>> Usama and John,
>>>
>>> I am seeing checkpatch warnings in this series.
>>>
>>> v4-3-7
>>> WARNING: externs should be avoided in .c files
>>> #210: FILE: tools/testing/selftests/x86/fsgsbase_restore.c:46:
>>> +unsigned int dereference_seg_base(void);
> 
> This one looked new though.
> 

Never mind. Looks like there are a few existing warns - pulling
these now for Linux 6.11-rc1.

Thank you both for fixing these.

thanks,
-- Shuah


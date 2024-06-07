Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C8E4502C
	for <llvm@lists.linux.dev>; Fri,  7 Jun 2024 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717793413; cv=none; b=AJggF45xXQVi8ZNB4ngXzZFTMrprh2N6VvinXfRsk5o4tI8P+pd+MSORCJ2Ar7FpdNSgLAOC79KFSZlyvm9bDr80jk0j4LEl2miuwlXyC1MzxQVkb4zEXdYpMxGJMXxh2CDtf/MITWXCsqVmoe7WNVwF1Ktgk3AArQiL5XoTrPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717793413; c=relaxed/simple;
	bh=4lBB1i6D3CMpL1sebVA4MOEu5mbvTFNJGHklLktW92s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fo4h9kUdVT7XU5sAQDa8CI527tiU/Gn2CddM1VpZ2YKShG4FR83IC6Okg87BWTS3gtkPkwxTYkUSuHKmiBYE4g51J0qOJk62rJmIAy2rywa5VVuqExJTlm2kZPLGpvwcJu7zAX++y7R8Pk95Gm1OC27IT6zyPtyJKuGNvBQrfnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fdAESv0x; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fdAESv0x"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3758a53133aso608905ab.3
        for <llvm@lists.linux.dev>; Fri, 07 Jun 2024 13:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717793411; x=1718398211; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Tsn/qL+mtDdN74WcgHwSLEegNRkW7b6+85p+wM/SaY=;
        b=fdAESv0xT6oUi1F9oVcmmlwDUxHxQS8YV6oF4OB6F5dy7fVneAkNrYrFGpJ0y4BW+g
         tA4ETLIvOpvP7K6Jn91ULg3RUWdS9aQdgbK6lNjXHjBXYoYoEIJjzNptt0UJljSFmG16
         PvFr0y+jU6jpthnjQtZxkqbiWw1OuzbiA3FWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717793411; x=1718398211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Tsn/qL+mtDdN74WcgHwSLEegNRkW7b6+85p+wM/SaY=;
        b=FT9WntIG4fOGClMwqU1GDdtlQyL87M+phEua1huB+0sl8SwUcNqQwq3tRM/1TGu6T5
         T1uV8ImlYjZNKayzXUxcI1FrmzqZ0E40vgjm3WTdDmIGxw8RkgbTGVM/EM1JESajGYU/
         PgigA/2tBghkK6gqLokKT7JvYs2Bvr6AclaBCFweSOuUFOumb0WrUOstF2J2lGkxQ5wR
         pDHqlcx/9w0+Vtvrka5vhiUGwn9hJeMdEnh9eMoG4dOVSxzQF9ryrDDeMQ0OpmJsj58F
         +yyPxiRCKXzt7hO6080aILn5uyPiacTurZZPtC8+4MRUarwaiE4fl0oKr3/iIctbo8Ak
         nhbw==
X-Forwarded-Encrypted: i=1; AJvYcCXo2SvueONPmYjFeEtK3m+9SoAxyXCs25tmlkte3LkbcQP1lVFvrh4U6hJcdjkzargdbc/K//YxTa0wv/PARQj9BdurRQ==
X-Gm-Message-State: AOJu0YyvnEFt7OZzzHkv8VCGajY7lysEc+DD6bs7LaDCWBaGHFQhIDe4
	Boag/h71S1T5HIBG1FkKOVStvOt6XiX3YRvRXzGDDj1Qz9M+dRTbwsL/oyfz8a0=
X-Google-Smtp-Source: AGHT+IG0EQ7MhW11fWVoakWksB7r9JzyxuZOJBpSz3susQA94dzCMF30DRNUqUZkVfYKgBXT5GGdcQ==
X-Received: by 2002:a05:6e02:20c5:b0:374:9916:67 with SMTP id e9e14a558f8ab-37580391410mr40701005ab.3.1717793411129;
        Fri, 07 Jun 2024 13:50:11 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-374bc14cb50sm9719115ab.32.2024.06.07.13.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 13:50:10 -0700 (PDT)
Message-ID: <5b8e50e1-8705-4ec5-94ae-2eae010cdf20@linuxfoundation.org>
Date: Fri, 7 Jun 2024 14:50:09 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] selftests: x86: build suite with clang
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Binbin Wu
 <binbin.wu@linux.intel.com>, "Chang S. Bae" <chang.seok.bae@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Cc: kernel@collabora.com, Shuah Khan <skhan@linuxfoundation.org>
References: <20240501122918.3831734-1-usama.anjum@collabora.com>
 <ae9de160-c8dc-4e5e-9ec9-4846a5dc643e@collabora.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ae9de160-c8dc-4e5e-9ec9-4846a5dc643e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/24 23:04, Muhammad Usama Anjum wrote:
> Soft reminder
> 
> On 5/1/24 5:29 PM, Muhammad Usama Anjum wrote:
>> This series fixes build errors found by clang to allow the x86 suite to
>> get built with the clang.
>>
>> Unfortunately, there is one bug [1] in the clang becuase of which
>> extended asm isn't handled correctly by it and build fails for
>> sysret_rip.c. Hence even after this series the build of this test would
>> fail with clang. Should we disable this test for now when clang is used
>> until the bug is fixed in clang? Not sure. Any opinions?
>>
>> [1] https://github.com/llvm/llvm-project/issues/53728
>>
>> Muhammad Usama Anjum (8):
>>    selftests: x86: Remove dependence of headers file
>>    selftests: x86: check_initial_reg_state: remove -no-pie while using
>>      -static
>>    selftests: x86: test_vsyscall: remove unused function
>>    selftests: x86: fsgsbase_restore: fix asm directive from =rm to =r
>>    selftests: x86: syscall_arg_fault_32: remove unused variable
>>    selftests: x86: test_FISTTP: use fisttps instead of ambigous fisttp
>>    selftests: x86: fsgsbase: Remove unused function and variable
>>    selftests: x86: amx: Remove unused functions
>>
>>   tools/testing/selftests/x86/Makefile            |  9 +++++----
>>   tools/testing/selftests/x86/amx.c               | 16 ----------------
>>   tools/testing/selftests/x86/fsgsbase.c          |  6 ------
>>   tools/testing/selftests/x86/fsgsbase_restore.c  |  2 +-
>>   tools/testing/selftests/x86/syscall_arg_fault.c |  1 -
>>   tools/testing/selftests/x86/test_FISTTP.c       |  8 ++++----
>>   tools/testing/selftests/x86/test_vsyscall.c     |  5 -----
>>   7 files changed, 10 insertions(+), 37 deletions(-)
>>
> 

These patches usually go through x86 repo.

I need ack from x86 maintainers to take these. I don't see x86 list
cc'ed.

Please make sure to include everybody on these threads to get quicker
response.

thanks,
-- Shuah

Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A53F158207
	for <llvm@lists.linux.dev>; Fri,  3 May 2024 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714764520; cv=none; b=SmmFkQKmbvh4E68Ee8khkG3qwWcQLiv7+RwyYflXMYdZhSvmJ+CTRS6ymYeYdasRy33Wx1HN+SO0xf5v1AeITAq2cnBV2vvsdwlt2h1WfA0TQc139xrYG2RW6wp/Vthrd8RouG5jjNXRs0Ep+3wXugRDoh0bmx8MlzSGL31a+7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714764520; c=relaxed/simple;
	bh=NtD/N9t4INPDtfSQnn+3iVWzc/81QHKoZhzuQv2WgVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHLNq78zto8Rqk20apMDaN3aH6vU/2DkKx1Bj6/SdD31u9ufmu13yMTq8DWHfc4Rim46+tqxFTNoKgIqS5Bpyydb/7ey8dsfhpABLVV9bdR4hUziOKJWufqhdINnvuROp4OobCTEr/8u6oCOarTJ1SZ9o7iu0qJPTfppvxM1GnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J5zgLhdE; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J5zgLhdE"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7decabf4a36so270739f.0
        for <llvm@lists.linux.dev>; Fri, 03 May 2024 12:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714764518; x=1715369318; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQQK668cb7m+WFTADFVdjdUFjoIDdrtZ7z2hWcOrUGo=;
        b=J5zgLhdEVVjSFLCioVfaTrzot5Wq5cOpLrwAt1N+u0rBfWhv7Vv3ZbuCq76sbtk+sl
         0OCvVMSH0CA3JXSWfXN9xj9/Rvq4mgLd9/UDfXKN6Oo5E1lnr1JrxaiOBxhmSzaf9ouV
         o2cZiZGr2rYwH82K3p6M+AszbQkMDm2pcuGU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714764518; x=1715369318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQQK668cb7m+WFTADFVdjdUFjoIDdrtZ7z2hWcOrUGo=;
        b=KAVi6/4vEzqbH94cDxfV8i4WLOi/ylZJOXX88bqgS4ZTY6k988tO4CEfNxjqqJEltp
         pDadvpcxCSqZWRaPySAfRUwKQ7v0aMc7A8JrzrKqtwwUE99pTQuPGw7NqfrFNBZkoI8M
         jJ5/onyNGMmuO4rfF5ZfoRQ79nUwZym4H+IPJw4rinMbzPcu3r9p53xLxEstH+KcZU3R
         Ek+FfmzEcRlEnItRClNO6gEwvTbIiFLPGbjHqaHpFLtj821PzpCTeFd5keVM2s9RWHH0
         Seec85gF0S1DU12NaeXkMxll8haG1vSXZ15l/saIdC+SANH4P4m6BEDSUwUb3oJsQJJh
         VkEA==
X-Forwarded-Encrypted: i=1; AJvYcCVZNQpNbkrz8/e9MDwNi/fyR7TICLiUixNUMq3jdIGezk1MlBjoRNwTEUGYH4eF3Br61y6RZJjmSY9Ac8KfSRcdQlhkAA==
X-Gm-Message-State: AOJu0YxgX/NKPWulDTp8yZKYoUcJmQSvPrZoCNiBXokM0n6MdctNQxfS
	ug0RCfTfkjNn/9bnzsf4KHm5CpFQz0t6jdQaf1igjNzvwwQcUs6vuxt8fTytqns=
X-Google-Smtp-Source: AGHT+IHUNJ0TY1TW1Mg6HSF6/aaw8U7AHNICQZtR+RuZAgfJ7O/a5nOimtkvdAUcSDpyyFTRNcuVsw==
X-Received: by 2002:a05:6602:17ca:b0:7de:d808:4b29 with SMTP id z10-20020a05660217ca00b007ded8084b29mr3906372iox.0.1714764518457;
        Fri, 03 May 2024 12:28:38 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id o21-20020a05660213d500b007dee16c48d0sm755883iov.11.2024.05.03.12.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 12:28:38 -0700 (PDT)
Message-ID: <c046fe18-8b69-4689-9d28-6926dcbba4b5@linuxfoundation.org>
Date: Fri, 3 May 2024 13:28:37 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/binderfs: use the Makefile's rules, not Make's
 implicit rules
To: Christian Brauner <brauner@kernel.org>, John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>, Valentin Obst <kernel@valentinobst.de>,
 linux-kselftest@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20240503015820.76394-1-jhubbard@nvidia.com>
 <20240503-glossar-notfall-bd7c234c2da7@brauner>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240503-glossar-notfall-bd7c234c2da7@brauner>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/3/24 03:10, Christian Brauner wrote:
> On Thu, May 02, 2024 at 06:58:20PM -0700, John Hubbard wrote:
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
>> While trying to fix this, I noticed that:
>>
>> a) selftests/lib.mk already avoids the problem, and
>>
>> b) The binderfs Makefile indavertently bypasses the selftests/lib.mk
>> build system, and quitely uses Make's implicit build rules for .c files
>> instead.
>>
>> The Makefile attempts to set up both a dependency and a source file,
>> neither of which was needed, because lib.mk is able to automatically
>> handle both. This line:
>>
>>      binderfs_test: binderfs_test.c
>>
>> ...causes Make's implicit rules to run, which builds binderfs_test
>> without ever looking at lib.mk.
>>
>> Fix this by simply deleting the "binderfs_test:" Makefile target and
>> letting lib.mk handle it instead.
>>
>> [1] https://lore.kernel.org/all/20240329-selftests-libmk-llvm-rfc-v1-1-2f9ed7d1c49f@valentinobst.de/
>>
>> Fixes: 6e29225af902 ("binderfs: port tests to test harness infrastructure")
>> Cc: Christian Brauner <brauner@kernel.org>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
> 
> Reviewed-by: Christian Brauner <brauner@kernel.org>
> 

Thank you. Applied to linunx-kselftest next for Linux 6.10-rc1

thanks,
-- Shuah

Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F9112CDB0
	for <llvm@lists.linux.dev>; Thu,  4 Apr 2024 16:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712248698; cv=none; b=OEjW0ziOx3h3W3T2ZRuc6+CgjpL7Hhg2akig699k/zh6Zgtfi7QpTwtg92W/fdv3oMZN4Z2QwFEq9Y+ADMaa6lUDFEuzC6zDRs80RSE/1SFEOYMRG7by1az07lFRoWsKCELdK6ojg1La8+srTB0gF/jVHntPYBM1VBaEGaHLQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712248698; c=relaxed/simple;
	bh=YBwK7BNdkJWP3oyNHpQfdPDIsnxbAs2+1nrrXIvCyGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IgZ4ZFMhX7n24lfD19fakwajgUOvdaKSpzSE1FxwJXki/NkfzKA7YC4Yqr4I0uI0MiecXNmhCaQ3I1IPaJVjtB1CxJcMm/LS7Szj+lkvuDzaLHXWPA09K5PkJourPTULc+GRW5V8IsJWQSEdtzKQpjNXj2b+a1H9rBCg0l3A70A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XGxrAT32; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XGxrAT32"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7cc0e831e11so22710539f.1
        for <llvm@lists.linux.dev>; Thu, 04 Apr 2024 09:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712248695; x=1712853495; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1lHp+OkDVz4M/u4JQhfwxqw91sDKLwvBIfOpOSX1Dg=;
        b=XGxrAT32JFxT/GnSMteP/2JtobbaLx15waW32feVwKg0yuDYFhGN2lNpz9sSoLr5wV
         c2Qk1HZvYCqA6TQ9fPEpzJGUsGfFpUi93I15btrveOcoxJdM6JlhF1pqmA4CeS/EK4y5
         3T8Ps4y/vPAIB+QiYeANhiRTTlTuyhD5lyjVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712248695; x=1712853495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1lHp+OkDVz4M/u4JQhfwxqw91sDKLwvBIfOpOSX1Dg=;
        b=MxVEjuj6nNZr8mlWM+GfAMXGp9YofcopkhRt4hdfsbipDw8mxYgSvug6oX+DcC1zpl
         goG8RPojzuBSvFH9hp6z08rHwDbBHKFntuon9SCVA1yH6C3epzLi0ENfuCF2y8TPqYHM
         Fw7tmQnyAaLNhewqXqLO2Rnz9KrL/nr6Fyv8aK5HkKHpGDvmgSuEnay088NfVIjx5uiR
         aCeSDA85P2N+faaNYygmtqrejIodpHPu+jUmGsbOYBjV494B7WL6ojjQavXDZrNyWJdG
         /77tcvapNmeUaSf/rVR2Xlrq/S1oSG23YS08nXLy6jx8j+ZaqoJC20u0+3Q537fUZIlM
         PfAA==
X-Forwarded-Encrypted: i=1; AJvYcCWAh3iPG8yX6iwRtM/x44zHjdx26VfFaN6xI0kvMDd1aKDdSEDJ/uYy2zNtjnBKPoHRz6sgR9bxg9/V5v85SIjD/g9C0g==
X-Gm-Message-State: AOJu0YyEvNcJxt7+jPaZUZJpaYZkSvmqUC+PIUqkU5GVOrKmPzEz2a1Q
	o/5pP09+OFJgNnVfVjAspfZcYDOc9ZoyL0mQd5NXbGu5bRBqcwi4ROZ2nMQRi+c=
X-Google-Smtp-Source: AGHT+IEA8Ot5VjOmH74kiKn6+rvyxZEZ0N/0e2VKSGgMgVavV4DwpFIgcNyVzFCXgCqx/llLPTQifw==
X-Received: by 2002:a5e:8b45:0:b0:7d0:c0e7:b577 with SMTP id z5-20020a5e8b45000000b007d0c0e7b577mr3031325iom.2.1712248695143;
        Thu, 04 Apr 2024 09:38:15 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id r22-20020a056638131600b0047ed8c3e578sm4146726jad.134.2024.04.04.09.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 09:38:14 -0700 (PDT)
Message-ID: <d84a8714-89e0-4ac0-b42c-02e8c4920e32@linuxfoundation.org>
Date: Thu, 4 Apr 2024 10:38:14 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] selftests: Clang: kselftests build errors in
 KernelCI
To: Nick Desaulniers <ndesaulniers@google.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Gustavo Padovan <gus@collabora.com>, llvm@lists.linux.dev,
 kernelci@lists.linux.dev, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Mark Brown <broonie@kernel.org>, Justin Stitt <justinstitt@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>,
 Bill Wendling <morbo@google.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <0c6d4f0d-2064-4444-986b-1d1ed782135f@collabora.com>
 <CAKwvOd=ueTmUThCOkBGUjhMGr6mKDtbTt-d7tHKe7A2nrchWMw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKwvOd=ueTmUThCOkBGUjhMGr6mKDtbTt-d7tHKe7A2nrchWMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/24 10:34, Nick Desaulniers wrote:
> Thanks for the report.  We've been tracking getting this working for a
> while: https://github.com/ClangBuiltLinux/linux/issues/1698.  Other
> fires have continued to take priority.
> 
> On Thu, Apr 4, 2024 at 9:30 AM Muhammad Usama Anjum
> <usama.anjum@collabora.com> wrote:
>>
>> Hi,
>>
>> We have caught bugs in kselftest suites on linux-next and on stable-RCs etc
>> when using clang. There are two types of bugs (logs with clang-17 are
>> attached.):
>> As usually people use GCC, there are GCC-specific flags added to the
>> Makefiles that clang doesn't recognize. For example:
>> * clang: error: argument unused during compilation: '-pie'
>> [-Werror,-Wunused-command-line-argument]
>> * clang: error: unknown argument '-static-libasan'; did you mean
>> '-static-libsan'?
>> * clang: error: cannot specify -o when generating multiple output files
>>
>> Clang has best static analysis tools. It is reporting static errors. For
>> example:
>> * test_execve.c:121:13: warning: variable 'have_outer_privilege' is used
>> uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>> * test_execve.c:121:9: note: remove the 'if' if its condition is always true
>> * test_memcontrol.c:727:6: warning: variable 'fd' is used uninitialized
>> whenever 'if' condition is true [-Wsometimes-uninitialized]
>>
>> We have found these issues through our new KernelCI system when enabling
>> kselftest and clang there. The new system dashboard is a WIP, so It is not
>> the web dashboard you are used-to with in KernelCI. We can show you ways of
>> pulling the data if you are interest into.
>>
>> Unless the above is some sort of false-positive or misconfiguration, it
>> would be great to support clang for kselftests. What we can do from our
>> side is that clang kselftests builds should be enabled on KernelCI to find
>> and fix the errors. What is your stance about this?
> 
> As with anything kernel related; help send patches for obvious fixes.
> Or provide steps to reproduce in
> https://github.com/ClangBuiltLinux/linux/issues/1698.
> 

+1 on this. Please send patches to fixes as you find them. We have
been taking fixes found by clang and -Wformat-security, -Werror
checks.

thanks,
-- Shuah


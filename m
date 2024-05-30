Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743DE17C207
	for <llvm@lists.linux.dev>; Thu, 30 May 2024 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717079123; cv=none; b=tk6/ddgcmCSwbQaj6HutOUlKKg6hGCb6GZbMqJT0pD8ekrAT/qO0/UTqhIqv5P1Wqx1ZebFwZrYn/1dVZvbfkgOFlpvncdO/F9PMSrHg9V/Li+ai1gSJ15egC1kUsS74xharGKTg9Q5gIabIhv2cd9TyjcS+U6YnodtqSyQKf7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717079123; c=relaxed/simple;
	bh=g/X45uSF6k+HRkBUhwjSpxSxuIqXtM9kMM336BDvTlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FF1b9xbku0dOJjgMVfC4on/Mz8G6guItvjbUKqg07qDcLPWth6VZL7+TH38uuY59p2xTmvOyfg4vizHxUOdfNrY7Zqn0mIQ3kE7gbezqJxs0n1Fpa+VOcAkMBkfFDQ3B6YZKnRn+7lmF+9nbFKFPhiBCBLD5jdBROGBw44tv+9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dr0ePJPA; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dr0ePJPA"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7e8e2020002so4281939f.0
        for <llvm@lists.linux.dev>; Thu, 30 May 2024 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717079121; x=1717683921; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nsdkf/hEokdRbVfsff4bOqv3Tbq/llwdsETViLwX3BI=;
        b=dr0ePJPAhFW0It1dzkZz+mB+tBpWf8GhYzotQK9AMvDptNVg+X70nFxflfz5SHrTLf
         RCEbr49Gx2Ow4FVby4LRO956Z6emBDrQnsfQCxRvDBt41vsjwAspUjLBCzTMBm1Vxa5l
         8YKN0b0W9CAknEumJC9Wxx2iTR7P23i5Vg378=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079121; x=1717683921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nsdkf/hEokdRbVfsff4bOqv3Tbq/llwdsETViLwX3BI=;
        b=g2RQKwq5k8uPeaal3BKKmgBpwX+0akOG4CF/TTqaBNGsl2y31mMbEG8DCH7GtEljiH
         aNy7cP6dB/Qy6mHNCM/iBmlzheBMkQg+0y0nJnsmQQNyk1lAcc0J82u/mIrhKmnjFFqS
         dCxRhcCm9MoAwqkzqtdv8laoU+usiby4xhqLRFRuXqk7AR5kGPSCkFE/Mvt7tqtXfJ5Z
         9IXnX+E7ufHutxj73EnS42eiL7B80bAR35baoK1IE6DF1PNU4XwuCXyApDEWdaLlD4zb
         Y2cDnbSfjFky02KFdCQOZFllfXVAf78hH4FHM2IqV3hCGZV4gPgnr+wMAXjCpMNXfzPf
         nrqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNhYQWFNBbTqW+FX4+O8Q5eQ+X+3vAtKVpnwRaHG8ulaMPUErAGEdlN/ngupUWQ1kq4vaUPpYfLhGgrQABEmuJFdcldg==
X-Gm-Message-State: AOJu0YwM2yU2mhIK7JMHJwFnT8i3WFVd0/+Xao4IccvaE9X987IWCINb
	+Fx4rgDS9JVCaVIlM50/5TiJrDqEKprykcnb065Prq7S4XEDDSgvJKwTbuI4WyE=
X-Google-Smtp-Source: AGHT+IF8O6GPnyWjF5VaTmv02b4u4/S8Ekhuksh/BQkhTKKplAGUx/4CG+uFBabO2++mbMvPZsfKCg==
X-Received: by 2002:a05:6602:19c9:b0:7e1:8bc8:8228 with SMTP id ca18e2360f4ac-7eaf5b73813mr241539839f.0.1717079120876;
        Thu, 30 May 2024 07:25:20 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b10cf31917sm1404185173.45.2024.05.30.07.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 07:25:20 -0700 (PDT)
Message-ID: <88c64f5e-4586-4b38-b3c8-0c3af93a71ae@linuxfoundation.org>
Date: Thu, 30 May 2024 08:25:18 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/lib.mk: silence some clang warnings that
 gcc already ignores
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Beau Belgrave <beaub@linux.microsoft.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
 sunliming <sunliming@kylinos.cn>, Masami Hiramatsu <mhiramat@kernel.org>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <20240529020842.127275-1-jhubbard@nvidia.com>
 <20240529020842.127275-3-jhubbard@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240529020842.127275-3-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 20:08, John Hubbard wrote:
> gcc defaults to silence (off) for the following warnings, but clang
> defaults to the opposite. These warnings are not useful for kselftests,
> so silence them for the clang builds as well:

Please you add more information on why they aren't useful
for kselftests.

> 
>      -Wno-address-of-packed-member
>      -Wno-gnu-variable-sized-type-not-at-end
> 
> This eliminates warnings for the net/ and user_events/ kselftest
> subsystems, in these files:
> 
>      ./net/af_unix/scm_rights.c
>      ./net/timestamping.c
>      ./net/ipsec.c
>      ./user_events/perf_test.c
> 
> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>   tools/testing/selftests/lib.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index 2902787b89b2..41e879f3f8a2 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -50,6 +50,12 @@ else
>   CLANG_FLAGS     += --target=$(notdir $(CROSS_COMPILE:%-=%))
>   endif # CROSS_COMPILE
>   
> +# gcc defaults to silence (off) for the following warnings, but clang defaults
> +# to the opposite. These warnings are not useful for kselftests, so silence them
> +# for the clang builds as well.
> +CFLAGS += -Wno-address-of-packed-member
> +CFLAGS += -Wno-gnu-variable-sized-type-not-at-end
> +
>   CC := $(CLANG) $(CLANG_FLAGS) -fintegrated-as
>   else
>   CC := $(CROSS_COMPILE)gcc

thanks,
-- Shuah


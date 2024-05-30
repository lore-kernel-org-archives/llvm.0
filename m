Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7F656B7F
	for <llvm@lists.linux.dev>; Thu, 30 May 2024 19:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717095855; cv=none; b=PJwK83vM1Ytod3pPu2/WVOXr8tdAQ71VwiELn3rxElzEyjY9I56JWt9+bFwMjC46a6W4beG6vZjONST2PE7JcRHp0pjj8GrFDn85OPB43xw6mKj5+PeBfdo6MfivM+8Wx1tS6zv9ar9nOBNsKFEB85nI3SVPJj5ymfkUjrVhizA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717095855; c=relaxed/simple;
	bh=XqkU5JF0xqJNCcqcOzUAWXI74SlBn5htldgYf/jMNnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XY/rr0ZUaWpS/rH2HAYxIAzJaXvx2echLl7bhKU2VTNgwVGn6QgQndRHai38iNT3cfOCTSyljxPzQ37q4iyr6W/WY5NHXD9ryr3HZZRMxMD4O5sE+G4wANpOEODG93ESvi1gkIBFSLCTvF+dgv4iLiwcJ8C7vQiTh1a7GIH3ZG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g85I/8zN; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g85I/8zN"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3737b3c6411so306595ab.2
        for <llvm@lists.linux.dev>; Thu, 30 May 2024 12:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717095853; x=1717700653; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUBR/IKrUPGm3wyGOLSg3Fiy25XwZdoN4lNos6i64TY=;
        b=g85I/8zNAnF60MX5Q/WPFm4GsTfpLiPz+c2gplb/klYd93dGEEcli505EgHCoodKFM
         ZsKeIXEiYkMgnCCGQAfH88k6gxoF5Qj9KdOH4lZbsu25UoGEcweqtHNUr5a2CoNtIQ8X
         MYX+vNbc8brPGYl9I8S5X5f2936GprQ9mxZoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717095853; x=1717700653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUBR/IKrUPGm3wyGOLSg3Fiy25XwZdoN4lNos6i64TY=;
        b=kgcAsLfJQ4LcaO3hcHxbycokvBNAocAoX2P8qP1vrDnnrfpChDk7OVlUeyOs5zuzEl
         YiSXqTx9M4aFr0Bg8o4ogw1NZflcyEI4oDaj/YmnF6P9lDhKxQ7rsaelgUv/+lD8R59O
         1VGfVJCqU8s1Gngxv5FH0AHRKjCW2cAJBTBQLzu/AHXtdBAcMv+wj1c/hW9ZBZWCzE6l
         QxL11frNpPDGLgwz/t7y9+3zYAz8Dsynuf6iX3DyBJOWXTtqNpklQpGUalSpjlkxjDnJ
         iJMJKF4TVr59IS5G8rJg3qKGgil0Jme9mtP1jdwciDG6Thmb8cl7ANQ4xxlQUbFQKpEv
         1coA==
X-Forwarded-Encrypted: i=1; AJvYcCWUuPvlbChGJzy937+7vap+Bcya3od/tfNHsABuuP6/5osI8wxFR+Dr62eI2E5npvEt/Dxm+ruBeFaO0uTDcy6pjcp58Q==
X-Gm-Message-State: AOJu0YxBs1qjZxd97YZfyzTjEMPZWTUNLXUtF85/QggOMjBwTEqQn9Gy
	6AHEloChyON4fnxzoF47rvFgf96DAt8LF7nxqaJA5OroY1tGiB+biQzdIJDPz48=
X-Google-Smtp-Source: AGHT+IHDstNgMVZwtRqmSZtTYuTC1xPHQ6r9uQg6kXwAmLCcW28lA/hy5sidfUmU/JPMFdijGRRXzw==
X-Received: by 2002:a05:6e02:180a:b0:36c:5440:7454 with SMTP id e9e14a558f8ab-3747df5104cmr34457525ab.1.1717095852742;
        Thu, 30 May 2024 12:04:12 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3748a27959fsm668615ab.75.2024.05.30.12.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 12:04:12 -0700 (PDT)
Message-ID: <94fe2649-8def-4f2a-ba5f-19ae8a4226bf@linuxfoundation.org>
Date: Thu, 30 May 2024 13:04:11 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] selftests/futex: don't pass a const char* to
 asprintf(3)
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
 <20240529022938.129624-3-jhubbard@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240529022938.129624-3-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 20:29, John Hubbard wrote:
> When building with clang, via:
> 
>      make LLVM=1 -C tools/testing/selftests
> 
> ...clang issues a warning, because test_name is passed into asprintf(3),
> which then changes it.

Please include the warning in the commit log.

> 
> Fix this by simply removing the const qualifier. This is a local
> automatic variable in a very short function, so there is not much need
> to use the compiler to enforce const-ness at this scope.
> 
> [1] https://lore.kernel.org/all/20240329-selftests-libmk-llvm-rfc-v1-1-2f9ed7d1c49f@valentinobst.de/
> 
> Fixes: f17d8a87ecb5 ("selftests: fuxex: Report a unique test name per run of futex_requeue_pi")
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>   tools/testing/selftests/futex/functional/futex_requeue_pi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi.c b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
> index 7f3ca5c78df1..215c6cb539b4 100644
> --- a/tools/testing/selftests/futex/functional/futex_requeue_pi.c
> +++ b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
> @@ -360,7 +360,7 @@ int unit_test(int broadcast, long lock, int third_party_owner, long timeout_ns)
>   
>   int main(int argc, char *argv[])
>   {
> -	const char *test_name;
> +	char *test_name;
>   	int c, ret;
>   
>   	while ((c = getopt(argc, argv, "bchlot:v:")) != -1) {

thanks,
-- Shuah


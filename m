Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B7C29CEC
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 00:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713312224; cv=none; b=jI6Ep8p1rVLYfPEa8n09zsHPKeB+5J30jAjFWYnqDPHe+zunq8qQIqbwuNg+tXLS3wqRF8WjNvHg7CMrGh4BtLNd1sEP4WlKHoTscmqGxoyoCn9TL3gQlJyFJWv7Xf6tHzSWNB/6SvD12z8iqsogyHwLszjmbqIqx/Szz2M1ZzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713312224; c=relaxed/simple;
	bh=sAYUqJIp1cIswCUgE2SHPOCm/Go8GvaZkQnCVt6u2pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqGZ2vMVGUzACst+c8SmgYdOnivTzZh4EuhDHvPYo3x+bU/OhjK8romWYjyuD1HFCDfmiEt+dRro4pQjMRZHpQiVqjezqFbQF09bJ2madDiGcr77zohTvDOTRXzFvWZDfeLe/eCa0WWHmobIksRi05Y6JEwMpREj4xH3YkswXPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GyoHGHKy; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GyoHGHKy"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5acdbfa6e95so114270eaf.3
        for <llvm@lists.linux.dev>; Tue, 16 Apr 2024 17:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713312221; x=1713917021; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nEb596pNHjGRxwi+zHrhblVQCdUyfcBe4WmHdhpM9s=;
        b=GyoHGHKy1RyW80e+BQyqWWLwb536aVhquHBeNBwBM9KiGmC+Yn9BROD6i277XIP0ql
         gRTHeclft5XdzoXNzPcfsagJk4qw0kBAOBRC3EWbF50jJqkx9rXXAj27uh95qd65Gi5x
         tfXLkXb9bMnWaw9/1zFFi45vTtIIfU9JxiI4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713312221; x=1713917021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nEb596pNHjGRxwi+zHrhblVQCdUyfcBe4WmHdhpM9s=;
        b=RVsS1fI5/rl4wTGfp0JGbVt2sdKAuRFdauPQY55vJJmzote8POvMngkRSQ5iqSH++z
         OHNqwTizp+ikLtbsllVRLiEhichDDbPElqOM3HF8GGw6b31jc0+arOTb5JKtYZlUsdMl
         qRr/9eeixlpS5MCOWHZz9dYeNUplpOKuf0VP1dfJeTqCvxwdtzCSnZ43Tz1xtuLYA2Vw
         4hHU9GLwXZno5WkLaY1+UHM08s8K3H2PSbOBdcl20fYizHg9jspq6hWE/okhEqHUjN3e
         /I7DmgOUNTex/5XIJkOYKF6NxGmkPVGmcOcaznITGCdVu0vqQKPg3mWz4hcpvRvFPFfY
         968A==
X-Forwarded-Encrypted: i=1; AJvYcCUisENA8zkMQ6YaBgG11eOmLc6tXd85J5oEJhB3qK2cQZjXm8rlIHL7wgdnshRKn/y62S4c37sbElp/MxSgpb0HE+EfLA==
X-Gm-Message-State: AOJu0YylXODH0yq8svw3iqHHEI/05I6G1VmOWMU3FX9hzVoJpl/y1xEe
	M+1ZQbFNNVcHTjjq+eZ5yidPCG5HPwrfXW4UpPH7C+4Zzf9DczUEv8u6bOUtHLA=
X-Google-Smtp-Source: AGHT+IEu81gTDsDdQDj17/Kg32wLhh2UcKNsPnm/8AVDNQyUumTOaGLjpZ6gDN+5E0kgCZng6wAY5g==
X-Received: by 2002:a05:6820:4187:b0:5ac:6fc1:c2cb with SMTP id fk7-20020a056820418700b005ac6fc1c2cbmr14358895oob.0.1713312221119;
        Tue, 16 Apr 2024 17:03:41 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id x4-20020a056820104400b005a4dc7abc01sm2796107oot.11.2024.04.16.17.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 17:03:40 -0700 (PDT)
Message-ID: <3c4ab12f-caf5-456f-8a8c-d4211d843f33@linuxfoundation.org>
Date: Tue, 16 Apr 2024 18:03:39 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: Mark ksft_exit_fail_perror() as __noreturn
To: Nathan Chancellor <nathan@kernel.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, kernel@collabora.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20240414062653.666919-1-usama.anjum@collabora.com>
 <20240415154107.GA1538232@dev-arch.thelio-3990X>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240415154107.GA1538232@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/24 09:41, Nathan Chancellor wrote:
> On Sun, Apr 14, 2024 at 11:26:53AM +0500, Muhammad Usama Anjum wrote:
>> Let the compilers (clang) know that this function would just call
>> exit() and would never return. It is needed to avoid false positive
>> static analysis errors. All similar functions calling exit()
>> unconditionally have been marked as __noreturn.
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 

Thank you both. Applied to linux-kselftest next for Linux 6.10-rc1.

thanks,
-- Shuah


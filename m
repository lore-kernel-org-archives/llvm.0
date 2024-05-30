Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2017623B
	for <llvm@lists.linux.dev>; Thu, 30 May 2024 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717079039; cv=none; b=t9MZKMMSTpKhuDSWBNwCTZqrt6kW5+/MDnRnUJsw/JIduhV+2pz+gGIJ/yiHBjXwOooGlRuueBpB/das9V59Y+Bh+qCr8PSg1O+1dnItGeh1iZhUVQlZtWhMwEqeRAXUi5cGxmO5h3mkluPfMO91nR6kkPqbkyFhysMGYs7gCYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717079039; c=relaxed/simple;
	bh=EX4ilp/gM6DnOi7FVKsFEfXk42z10f/YXvWX2qP7jMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPmdpuZTitvsyuhKDQC6tXnn5ZBRYn5L2wBozdnDRzLPammD0e0YYXlNMjlChAvGTvR8Yl68wtNXADa0GlBkeur/HMSFVpqVEACOsWauaVCsVU+muN5qzQGhGCsvRyE2ZxVqHyb/FGJYF5vTjiQNi67qd9aokuv3pYXKl5zin50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KuWjx7MA; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KuWjx7MA"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7ead7e95c91so4220539f.3
        for <llvm@lists.linux.dev>; Thu, 30 May 2024 07:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717079037; x=1717683837; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TxJbPKzJ8dtx+UyxZICekfPff+1WnbN4JSU+63JMz6g=;
        b=KuWjx7MA9IHl19JmZdFxG2w0GpXFhcSoJJJSjwdCEzvTFttJVP3O/ElwUH+KZ+CqzJ
         Wn6mYK05G2A4YGjnpw8LpApYC0Ozeu9Mmy/GdYKwrs6+ijNy+eWrVmV+VOw7SLSlfYaK
         qmIBah/aeHZbLnQBzRyfLfa94872COcovhZkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079037; x=1717683837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxJbPKzJ8dtx+UyxZICekfPff+1WnbN4JSU+63JMz6g=;
        b=lCa0BOO58JJ72RAek22ZLPDZsO4mJP68S7KXlC6VthSNvQ5NSm9sG5TNSk49aE00qM
         l/4sUSELQ0Q1bqSzVLFLxqbUyXORRNIQ++QuD3DN4ejZJLyyC8TDU2JAGoq25aC7eCWu
         DpwfpZdvingE2cqi2pfO45ypasga1xHf/NJdVCoeB4SL0TRBCtE1BYUd1V8+oJNZv9EU
         0tyHX34UHXFIqdnDdMnBYwqgs/W0FVGtrnfJdLCy7PJBJdc9ScKopuetY+CdJf4+u6T9
         qnUDfFyZYnQauY19OdUqDj2UICeZ+skwj9nZvu98YrqjCqm3gC82vnrLJeF3B32X46W0
         DheA==
X-Forwarded-Encrypted: i=1; AJvYcCUEskpwakER+3IxxQdOo2cQDiD+dM78doDkARtQCKV9ueIvEh0PLaGLqJc5aI5nK91q85WMc/HYRvRD99ZIIo+BvId2xw==
X-Gm-Message-State: AOJu0YwTrNquiNjdtkHaj7LZZIyXQp388/D8IP1lTCaN7DRgt8hTdEJq
	TvGx7igCj4iZucme4cQ72exo7EmaCl7Ui2r93LqcihfCPZz5tczNI14GTSzOzpk=
X-Google-Smtp-Source: AGHT+IHZ3n61TibbNscl+7LwOckJECnDnFvgbdHvo1dPkikcdKjJueyYvW7lVGFFvXphOjiJ9ENBNQ==
X-Received: by 2002:a05:6602:4287:b0:7e1:b4c8:774d with SMTP id ca18e2360f4ac-7eaf5b719b3mr252361339f.0.1717079037225;
        Thu, 30 May 2024 07:23:57 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b03e94d4bfsm4068830173.63.2024.05.30.07.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 07:23:56 -0700 (PDT)
Message-ID: <b6641940-f10a-4ed4-a672-69c6d51125a7@linuxfoundation.org>
Date: Thu, 30 May 2024 08:23:54 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240529022938.129624-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 20:29, John Hubbard wrote:
> Hi,
> 
> Here's a few fixes that are part of my effort to get all selftests
> building cleanly under clang. Plus one that I noticed by inspection.
> 
> Changes since the first version:
> 
> 1) Rebased onto Linux 6.10-rc1
> 2) Added Reviewed-by's.
> 
> ...and it turns out that all three patches are still required, on -rc1,
> in order to get a clean clang build.

Thank you. I will apply these for the next rc.

thanks,
-- Shuah

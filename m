Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5182540BE3
	for <llvm@lists.linux.dev>; Thu, 30 May 2024 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717095808; cv=none; b=Rhp2vcJiduxaw7K+wyYQviPJJamPGHRafubf/2hcScVzxScFvm4hTFC1jywRfVANTAmzzloVNQWzP+62gYEFPd7sIBRuX8F01NVG7QwtqsaHVURJceH69mIfXjNL9zdRnXN4nlTJA6POlYMKQix9FYrW9CKmricN8VQAO26R/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717095808; c=relaxed/simple;
	bh=gVV3+IFYD1OxH/Wqhf1iWQFzYnfj7Ay2H+idOty2pyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uK2fHIVhp1nOQyZ0ocxYeKSWLxGnlqlpNRHxDEBQ0f7QpIeRCCo140nE5sqdM3jG7eOyIxFlv0lg9hKythjZRznqotH6Rl32oKMuD6MpGBE1EnRlmIjhWszzvQ+Fseev3avH0+CPElWIpdPiVnd5XWc48RblBCkWBsLmlRFnA0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HyU81Sad; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HyU81Sad"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7eaf9e5681aso4939639f.2
        for <llvm@lists.linux.dev>; Thu, 30 May 2024 12:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717095805; x=1717700605; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ypmVzNDeZplp2odL/zLGgH80NvTjOKRz+Qmx+RXyRY=;
        b=HyU81Sad/01ypkt53tS1v+ewuJAwerLZpEZiNEaYceRp4uIuZWEhztggx3DL2K5A7M
         u9JMZCSjAipR4zVCSEcAh8v6OgRdFGy9A4qO8Y9amLT0Sf7KdUbAcJX5GMdvfHOkcbCA
         2xaN66M+42+ycPdP2fsxAoIogAbKoSKm3KEY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717095805; x=1717700605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ypmVzNDeZplp2odL/zLGgH80NvTjOKRz+Qmx+RXyRY=;
        b=fyB1SGYadnXK+AXqd/hFW1yYRnyegd7G193KgKhuSijgJfkWzdFVT8zfKLEFOC9i63
         nv9fa+Kr22/n5mQo6QKeR+euCl9TiDATgM5gGrstJLcfi+jlTzD5lJn49PaZ84+GD656
         AiFxRbUKGTKmGgMoVcyXYjzJSUK1Us3K2UXmpIvWHd3g2fqzH4P56zZuuiqZZZenb+95
         NHRtWDfdWuoptNhfioQE03VlD+01o+DUbdj5LQCLQvLZGtaviRvd7q14AnISz3F7Jl0N
         QSwBwnx91TZk6u6qNMNknevRiY7JfYwiSlk6f1A3Z1GsUHEnDs51jMKlnlBeuigti83L
         L/LA==
X-Forwarded-Encrypted: i=1; AJvYcCXXYPxiSaR7CpHAlDjrZbdFaO0t/rZpBfu3/GsMEg3JdFLXGutI/8JKM8VpQygAL+rVpY+u9eCNTVyDrzovxT0NptWdDA==
X-Gm-Message-State: AOJu0Yz7zDyEqeCyT5NvRitJ4xByLjeZe8Bpb2unrEGaqg6tluAH+WEZ
	w9LYNewmG/zryg0uPr5MPHMWkzxGbCHWUYeKYXMo2DfMpNtOWaEeXePJzq1Mmsw=
X-Google-Smtp-Source: AGHT+IHL2RIktWzDYsXqMYxWTYOSCdmd0gSX4cuLtu57cIFNBVH+YBART6vih1ekHP9lPpA0zCGiCg==
X-Received: by 2002:a05:6602:3344:b0:7de:b279:fb3e with SMTP id ca18e2360f4ac-7eaf5d6865bmr293265239f.1.1717095804736;
        Thu, 30 May 2024 12:03:24 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b48b8a6db0sm61826173.98.2024.05.30.12.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 12:03:24 -0700 (PDT)
Message-ID: <ceb9182e-b6d4-4f6d-bb53-87efe5337230@linuxfoundation.org>
Date: Thu, 30 May 2024 13:03:23 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] selftests/futex: don't redefine .PHONY targets
 (all, clean)
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
 <20240529022938.129624-2-jhubbard@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240529022938.129624-2-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/24 20:29, John Hubbard wrote:
> The .PHONY targets "all" and "clean"  are both defined in the file that
> is included in the very next line: ../lib.mk.
> 

What problems are you seeing without this patch?
If I recall correctly, futex needs these defined.

Please provide information on why this change is
needed.

> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>   tools/testing/selftests/futex/Makefile | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
> index 11e157d7533b..78ab2cd111f6 100644
> --- a/tools/testing/selftests/futex/Makefile
> +++ b/tools/testing/selftests/futex/Makefile
> @@ -3,8 +3,6 @@ SUBDIRS := functional
>   
>   TEST_PROGS := run.sh
>   
> -.PHONY: all clean
> -
>   include ../lib.mk
>   
>   all:

thanks,
-- Shuah

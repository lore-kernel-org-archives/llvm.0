Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321C73BBE9
	for <llvm@lists.linux.dev>; Fri, 31 May 2024 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717187984; cv=none; b=bLzIBpeHJXnZT1QbuT5Wo2/uhvOZ4PO4r+RofsANwjdIgRhsEKug6RCe1SD17UVpzIPoWQa2qhTJlLjf5DOJrNqddd1Q184s2dYKvbC1U3kQkOjtg0weNw9yBuoCc+dFclKEXiS06VT9efA1p9AYNQKGeciVgRiL30XTgYDJbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717187984; c=relaxed/simple;
	bh=shhio0iNEuO7LiDKGHdia85hkYDhPRfghUqasfZZD+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vB1OXP7ybt5Fa4gYIfHVDQaJnXLCbhclgbShk6ce09l5H6DImoyUcEowvMo1HRI045OX7OGZ23F3JSxq+5dULFzOlbo1fqMIVwzAE6jo9LKT0Mg4CK3EQfj4uC6b9a2xb6HTmT452SNntQT7VRma7dNVF3VXq7HXGPjhEUsZ1lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bJUHmi7G; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bJUHmi7G"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7ea345b17bcso10173539f.3
        for <llvm@lists.linux.dev>; Fri, 31 May 2024 13:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717187982; x=1717792782; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6cHgWjpqD8fz5b7y0liRbomCTR9fA7E/zBbxbh5sw4=;
        b=bJUHmi7GbACfdy9TaObVvkDAnOqsvVKBe3m5IMXF6LXzTn/4+VinnCRfdZYudgh7l4
         tOzRa0BVldUH6uNl7bGh9SWhlj7WdwrstDG5Kjw1MS+DcsFTaxIMuOg2U4H/aRJBTYTC
         9bkLazPfGkSmOIW+plafFVmk6S0Zurx5fNaaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717187982; x=1717792782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6cHgWjpqD8fz5b7y0liRbomCTR9fA7E/zBbxbh5sw4=;
        b=tAtKTQaYF+/4bg8wmV/pLf8iWswyDbbbND5MO+YIFbaBrn0TM0FwS7ckzvtno14EzF
         T+YaXg2wNSgHezCzJGOfJSkNayfTywQxHFeOyjyMda9Djdjl19Z00Cq0GKguy64XtCwc
         IhEoQaBFhep1lgalevzuZta9toQ2/1FSrja2bVfabu+H2JsnQLfhWjSiNxV3QPKaIRS2
         asJYs2b9PCBQHYlQS4ZCEKgKa4rD7h0rTf6We/DcdDhlWjSUBmHdTYIN/UICT3AkBYCU
         Uq09s8wjHdTH4zvAe9BVYYSgQXnwUBpU7PSUla8RVjp2qbTvjFMxKdraxm9gaqymQqBd
         gnkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF+txC6SwV1FA9Kq4DCWD4vBTCa471Tu4qjksboZA85J135rUEnTsfhZAV4Qmtq179ekGLB6yhZHNu0BGI1DscJUJPCw==
X-Gm-Message-State: AOJu0Yw/UcOZqFbMOjJGNIbhxaDxFqOhUR+NxB3iIvoURq75iApmLQna
	miQXxrgohZGqa67s0ohgVvOR6mA/Z5xhrLHEZf23IYGiwrPm4u5lrkDcoPvhiPw=
X-Google-Smtp-Source: AGHT+IEi/yRk3a3BA5WhOOsakdFKAemq7R0bofiAbYYvoIhENWSoZzpQG/FvvYP3/VSRcUgV/PlyQA==
X-Received: by 2002:a5e:8b09:0:b0:7e1:8829:51f6 with SMTP id ca18e2360f4ac-7eafff1f512mr323936339f.1.1717187982213;
        Fri, 31 May 2024 13:39:42 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b562a839acsm269349173.67.2024.05.31.13.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 13:39:41 -0700 (PDT)
Message-ID: <0394faa7-af19-4929-a1e4-00d21d0749aa@linuxfoundation.org>
Date: Fri, 31 May 2024 14:39:41 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] selftests/futex: clang-inspired fixes
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Edward Liaw <edliaw@google.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Nysal Jan K . A" <nysal@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240531200755.128749-1-jhubbard@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240531200755.128749-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/24 14:07, John Hubbard wrote:
> Hi,
> 
> Here's a few fixes that are part of my effort to get all selftests
> building cleanly under clang. Plus one that I noticed by inspection.
> 
> Changes since v2:
> 
> 1) Added a sentence to the .PHONY patch, to show that it is removing
>     duplicate code.
> 
> 2) Added the actual clang warning output to the commit description.
> 
> Changes since the first version:
> 
> 1) Rebased onto Linux 6.10-rc1
> 2) Added Reviewed-by's.
> 
> ...and it turns out that all three patches are still required, on -rc1,
> in order to get a clean clang build.
> 
> Enjoy!
> 
> thanks,
> John Hubbard
> 
> John Hubbard (3):
>    selftests/futex: don't redefine .PHONY targets (all, clean)
>    selftests/futex: don't pass a const char* to asprintf(3)
>    selftests/futex: pass _GNU_SOURCE without a value to the compiler
> 
>   tools/testing/selftests/futex/Makefile                      | 2 --
>   tools/testing/selftests/futex/functional/Makefile           | 2 +-
>   tools/testing/selftests/futex/functional/futex_requeue_pi.c | 2 +-
>   3 files changed, 2 insertions(+), 4 deletions(-)
> 
> 
> base-commit: b050496579632f86ee1ef7e7501906db579f3457

Thank you - applied to linux-kselftest fixes branch for next rc.

thanks,
-- Shuah

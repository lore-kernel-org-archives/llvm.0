Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049C116CD00
	for <llvm@lists.linux.dev>; Fri,  5 Jul 2024 16:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720198502; cv=none; b=pGTOlB8iGyuDQtdS+qEtLjc5+cbDeLrPgF2/nCU0UMOVpNoX4Uw/iOiEG1JW9Qlp3Xm28MUbqc7O0jZM0ey2yylR4zI93yeD1cxWvEz2UcpJ/CvdVT1hLPvmHkjIqzi+xK3JiT50okTBPTSfwaDzaNGQrn9daNI9RlNe6b6mDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720198502; c=relaxed/simple;
	bh=JbpMAAp767cJMVvvsfmlKOVKEDBe1tv8WSltj4UH6v4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8sar6MAm/PxNOfS6nrKFxx5rC3dJW2EHYRmgoTqp+JlqTiP0weolq3xHdZwZtQgtgIhh3qTZJ1iqLOoI9USSe4R1dkKTqlpSW6fmoj8T5MlNFe84dhDIaBI3l9GWXCGLvTqpYtP0aCBy22e8C9C3ZYcnaDCuA8af6tUwo25HBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ccgC07of; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ccgC07of"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3764dd53b5aso881385ab.2
        for <llvm@lists.linux.dev>; Fri, 05 Jul 2024 09:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720198500; x=1720803300; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+6p2HoNrUHHa/yVChF/+f6ARUdHwWa9m3WGICPV8zw=;
        b=ccgC07ofqUsCnWNDv7l9qp/uUn0wDclh6BrCZe/gnMEJ0xT39YtGl5pRalV5nyWh2I
         BgZc4aNFQYVRuExkEENDwh3+FAsni3DZtpQK1kzhxjvwTlq/kiDXxXxfAhSOdjEBVEL5
         GJP07FgqIyHcEB02VRrxgD0S/2hc9s3eigL2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720198500; x=1720803300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+6p2HoNrUHHa/yVChF/+f6ARUdHwWa9m3WGICPV8zw=;
        b=gOV8nd0ztEPmosjBm8NETY0qaS62SkGnd48kllCnUTpCN+BXZ+dI752FV+GqmbwqJW
         4WBErTCqvED7/6vsJmxA9POBxydaKxWD32vJsil8GwCTH++gj6254rc3sk5qDK53kGw6
         l/lL8jAvNp6m1+av+BzyB0vIxmiXqKsfSk0gS/Spz8x11CLdHonqQMsYNCbL9vU9FDoA
         1EsQMfPn9AYJKrDMxRY8hXxX94zPWzuKuJhfSeh5zucShTmZZg+hm1YgczXgyVzuRQjE
         MD3zVIW5MWVUhmBVb2NkXAwUOUJtom3gO9mVXzypJ7CaReOeVyeVTjZzzitYTLp8MxBc
         SmTg==
X-Forwarded-Encrypted: i=1; AJvYcCXp33EgGAi2ZQsoS1EE8rLFXbajDNixIbTDbVv9znxXJxDYxtJcmf1v41wQDra4eR/MFM7Gypf9DhAZvzwKRuU/gp+7Pw==
X-Gm-Message-State: AOJu0YxQE6LpozbnJDK+pIh0DtSiAgACrIEG1AC4C+6IlHQY2FSkeH5q
	J2sjU4zK9bryz838Aiilf3szLa+0ukRzPLplRLRY+JHZtTCy9qOTRWPv3wHOcjU=
X-Google-Smtp-Source: AGHT+IHY3in/e9Yxt3K+EtGGW2Ojce03GKiDSgxyEYqs6zBH6DryDUXwKCb6gpUav66FAfp/eAhNgg==
X-Received: by 2002:a05:6602:6211:b0:7f6:5178:8607 with SMTP id ca18e2360f4ac-7f66df05100mr601855839f.2.1720198500122;
        Fri, 05 Jul 2024 09:55:00 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb73f910fdsm4521403173.91.2024.07.05.09.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 09:54:59 -0700 (PDT)
Message-ID: <9262c7ff-41e6-4df2-a335-e81897381ed0@linuxfoundation.org>
Date: Fri, 5 Jul 2024 10:54:59 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] selftests/vDSO: fix clang build errors, and
 Makefile cleanup
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240704023324.83564-1-jhubbard@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240704023324.83564-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/24 20:33, John Hubbard wrote:
> Hi,
> 
> This is basically a resend, with a rebase onto today's latest Linux
> main, in order to show that the patches are still relevant and correct.
> 
> Changes since v3:
> 
> 1. Rebased onto Linux 6.10-rc6+.
> 
> Cover letter for v3:
> 
> Jason A. Donenfeld, I've added you because I ended up looking through
> your latest "implement getrandom() in vDSO" series [1], which also
> touches this Makefile, so just a heads up about upcoming (minor) merge
> conflicts.
> 
> Changes since v2:
> 
> 1. Added two patches, both of which apply solely to the Makefile.
> These provide a smaller, cleaner, and more accurate Makefile.
> 
> 2. Added Reviewed-by and Tested-by tags for the original patch, which
> fixes all of the clang errors and warnings for this selftest.
> 
> 3. Removed an obsolete blurb from the commit description of the original
> patch, now that Valentin Obst LLVM build fix has been merged.
> 
> John Hubbard (3):
>    selftests/vDSO: fix clang build errors and warnings
>    selftests/mm: remove partially duplicated "all:" target in Makefile
>    selftests/vDSO: remove duplicate compiler invocations from Makefile
> 
>   tools/testing/selftests/vDSO/Makefile         | 29 ++++++++-----------
>   tools/testing/selftests/vDSO/parse_vdso.c     | 16 ++++++----
>   .../selftests/vDSO/vdso_standalone_test_x86.c | 18 ++++++++++--
>   3 files changed, 39 insertions(+), 24 deletions(-)
> 
> 
> base-commit: 8a9c6c40432e265600232b864f97d7c675e8be52

Applied all 3 patches to linux_kselftest next for Linux 6.11-rc1.

thanks,
-- Shuah


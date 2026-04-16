Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50718361DB1
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 21:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374058; cv=none; b=N0vX2YQZNKpgfSVbmgShv8/tL2h69NFb5h45UkYuYwHeMnL8wQ1Ht8AczuHkZ/YEi7sY3FcnRnFzCvw5H5Lznc3knBiHgK1vHayP47+QbCI2VHh4I4xAr77QRzhtOT4rxz52xFa33p6etYriUFDXKdDgkaHWEuqL4RZLtJ/sNPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374058; c=relaxed/simple;
	bh=vzGCSdSZGgznvW2BflHE/U1h+EX3Txa7VKjbpQUid+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ew2AMxmtpbV+q55CUKy13iWUl9dYetc/AnSYPzHgX8qtoLbet9SmIF+QErez4RyD/ok7IKCNJ5bWSL9DtJ+zMKCuxhtMr+u/GmOrfA+Kv1l2VUGWSWkykkix2sPg56+KpOOcchakL44mvEZEAdhLY1nLK7Um1byfBARuovUstNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DjlF4D02; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DjlF4D02"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dbd2a0211bso24555a34.0
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 14:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776374056; x=1776978856; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=636WrS47DhMrab3WetvRTiVdIVfIM/ZId3iUkiQeAM4=;
        b=DjlF4D02oJofDGujhaTLxCGG+6eGyosbu6+/FW0cLpmrQm5KmJqb+84Z9BHynGCRZ1
         oNK+L6fs7FZ+AcMNQ3oXbYho3aanloTHFcC7+d1p64y0jpNG0NTn9KYukgD7/IkR1zgW
         XFKAcyRhIeDcoX6T+QF3j2eyZSVS6LpyK6dDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776374056; x=1776978856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=636WrS47DhMrab3WetvRTiVdIVfIM/ZId3iUkiQeAM4=;
        b=CW6MV9P/Mhne06n/etWEcJtrnlxS3NR8SV4ZiFK5uxd/EZQfEln2DlDj8paw4x0rqg
         4MyA7QFADV5h+zW6wy4V1S1rxMEfEYz5Q/VBfi2V5sjOCR6xk9HLdRX9ZDdCocbISFBP
         XpfilMX3BfgYK87YNVByuvAAbExGV2JQZrGMeBCrvEx8nEj7R9+USLVTbfe2f5hxxpHG
         Q/PijBdI1371QY733/MUDZe+lUNJdxlsRxHe2hg4da/beBaB99rkKPK3uyLgTfYpjhZ9
         cuQwzOlAbd6XbyYWIs9C/HCC4fV4lYh+FoQEelj5dKBWRWSikILlhrE339hNysjDzcOv
         L53w==
X-Forwarded-Encrypted: i=1; AFNElJ+GOQsCouWdwzwlv1TN4Riw2fxmCQmcHUrqg9cvtbTg8NotB1O686vKwn63Ow8sj2QfXKPv@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe/5dURgmk7+tG29otqVfShbvGW7y7LsYCVk9pUorS796FJsiI
	J4FikcGV246eYBKbHAmxhJCteBSyXpQJtn3TRni5BkXIYE7o2W12dnEyrmJVM/U/wpA=
X-Gm-Gg: AeBDievtV8qDTJUkCsFGgtg+ks1JWLGHI8WdV/DRWoTVJt6n6hBf8lpJCOsg0QgooP1
	93zHtICnPp5Rh8Noc4TPptSo/+xXEZY+7fQYQzlvkcPLtYeYceh4bmHjNHg/DQOXd80lEStLXQA
	bbZx6n81UOR+vVzCXPrmre9w7JOPfQJB0FF9lqO5ELauQACmc/3XCvj1QpiC6Ig06kqoHkPa8P/
	HLqu79PBMlvmaTk7y+EpH9qFYCP/xsate48VG+Dbud0p81GekVZie1OtPX5bePRu5ACUBfxMVxM
	HmgsykJBlGbQZDDvM7Ly+mE+hTRqB2jCvrSoSW4SF4WkE6va8xHRBi/RdTBjrNFnD2/7ozpsLQM
	ZmPPAdn8qUa510FQY2w7fbMBp46VR8+6Kij5Wkyc4VbzzXhAeNDRI32MjFxwGZttrDcOBrdXImY
	T7idUQXrTIWn+rIQqIeSPxH9uSPwnsBhVd6IgL9I8T7w==
X-Received: by 2002:a05:6830:3152:b0:7d7:ebf0:34b0 with SMTP id 46e09a7af769-7dc951c681dmr139660a34.15.1776374056218;
        Thu, 16 Apr 2026 14:14:16 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc90c94d9fsm752957a34.27.2026.04.16.14.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 14:14:14 -0700 (PDT)
Message-ID: <57e570f4-af6d-4055-8464-2a2d552542f1@linuxfoundation.org>
Date: Thu, 16 Apr 2026 15:14:13 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: Deescalate error reporting
To: Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20260416-selftests-deescalate-error-reporting-v1-1-38e7c0536227@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260416-selftests-deescalate-error-reporting-v1-1-38e7c0536227@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/26 07:19, Mark Brown wrote:
> Commit 7e47389142b8 ("selftests: Preserve subtarget failures in
> all/install") updated the propagation of errors from indivdual kselftest
> targets to be similar to that seen with FORCE_TARGETS.  While it would
> be really nice to be in a position to do this currently it is premature
> to do this as the default behaviour.
> 
> At present we default to trying to build all selftests but a combination
> of code quality issues and build dependencies mean that it is almost
> certain that at least one of them will fail to build (for example,
> several depend on clang so don't work in a GCC container) and a top
> level failure in the kselftest build reported.  Further, the resulting
> failures mean that the install target does not run at all so any build
> problem is escallated to a complete failure to produce a kselftest
> tarball so CI systems that run into issues loose all selftests coverage.
> This has been causing disruption to a range of CI systems including
> KernelCI, mine and Arm's internal one.
> 
> Revert the commit, users who need this behaviour should be able to use
> FORCE_TARGETS for the time being.  At present users that do this (such
> as linux-next) are most likely building a subset of targets known to
> succeed in their environments.
> 
> Fixes: 7e47389142b8 ("selftests: Preserve subtarget failures in all/install")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/Makefile | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 

Thank you. I applied it to linux-kselftest next and will send pr tomorrow.

thanks,
-- Shuah

Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DF211721
	for <llvm@lists.linux.dev>; Fri, 29 Mar 2024 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711725940; cv=none; b=Wx3etqE9RlXw/qjhn3EDkX4QtBUuicUgfCEex5FnN87mYLWRvovhle+MJbaB/jri1twEIf+tfhGgVOn2uEGRVY166schVdIx4ZgL9E6aNymm1FQwybKK7OmP4unPHAVIVlBbmaiIrunBPCGlhrWJQjC0+S96iDyT9+7WUPnd9zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711725940; c=relaxed/simple;
	bh=xH1hoGeSpmXPBXe+KWKwd5QpoqzOZj/ThNfZrXrxw5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXf0pvy79vytA+k7fCiEGsALhJchVZzt5/cF2uFXSohE2AjRP2cLvmayNLNXM5vuRXOmImLSFyBMz28s9OHeIRAH19AmOHWH7nhRS9JVPS1L4sojzNeSE3nZWYn/ymvZ2/StJWJnn3lA3uOBDYE7BQxpLYmJ+8Y+S3Ls9/95Ojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=IyXRUt8y; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="IyXRUt8y"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7c897ac777aso59650039f.2
        for <llvm@lists.linux.dev>; Fri, 29 Mar 2024 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711725938; x=1712330738; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5+Y07s43z/z9E4jZbw13GMhxL25Jinp4PnSaPuedD0c=;
        b=IyXRUt8yUlCVJLG4fQQFBIi7Ac/ixvg5RIOM6TtbcaYwnchPrAGP1U3SOq+cq/ZA1N
         f+W2IWUQJ4EUzt0ssivUGlo7Nqi6+Bwmkp16wvRbXm7tM3U5jGFPGh+Yo1y2Di5cGJ10
         91wcM+n4eDYEkFtjx64TuCvKB7xBXBrkB/yLIVBzqeE/XI/I4IW8azXMvquwZ9h3WNVr
         LnOLnudYYwWHqYztqG/Z5ilVV1qAvyfc0nsqN09T+TEwklo0hN0rZBmOyNpH6KTjozpE
         qsWxm0eiJpjsw+m3/1kCgh/9F0t7PxczNqyXmS7+vjpL4mSsDUmSMjvX08lst9zgE65S
         5XDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711725938; x=1712330738;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+Y07s43z/z9E4jZbw13GMhxL25Jinp4PnSaPuedD0c=;
        b=h057K7IUV1vo8tX9KRgp+yDKK0ODNp3lgZpPpwnvw+65FBm13q20XS7FsmvFQvxqz/
         UrJZX+IDiECrFchHjHHctG1kG8W5ia7zgpNsiJ/xaII86f73968ugnr48ZrxQ99/Ovdh
         pjfaUxFHS8ibLDojMEGlUCdSw8ZijlryqBq6RSEl6fQGIXYRvicMT5qs3Iogz2outnN5
         Ju6lYQkyVlwUYf82qnONGamN+TfC3z5gtJm7k2OybWAvC0+lgzpZX6TdHpJbGcE9a6qi
         isfvsgNO3Ri23bkftQDaND6oeeHfzvMjiVLjcURNpeGzqymGEHz4jiPx+yeWE4spJZSB
         j2KQ==
X-Gm-Message-State: AOJu0Yw/EofEayuKyPIHYqV1EVXPYn7ma5uJ3Hc6fu6fAPv0v3ckF5Y7
	dmZ4m+fLiGwyAkIgw1QlRFSWaCUQW3ZsJcSi4966fh2Q8al27P/K74AScz5QiGY=
X-Google-Smtp-Source: AGHT+IGTHmFJMtzjitlW/EZhM0/IqWw9UWZ41UkgkTbXz6yqKt5UohmlLRIQqRn/7C9tRRnmm8/YMQ==
X-Received: by 2002:a5e:890b:0:b0:7d0:25d8:bbc4 with SMTP id k11-20020a5e890b000000b007d025d8bbc4mr2549154ioj.18.1711725938269;
        Fri, 29 Mar 2024 08:25:38 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id v11-20020a6b610b000000b007d037ccff6bsm1071206iob.44.2024.03.29.08.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 08:25:37 -0700 (PDT)
Message-ID: <3a2329e3-4006-4484-8e36-af11d8830b3f@sifive.com>
Date: Fri, 29 Mar 2024 10:25:36 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-nonmm-unstable 53/62]
 lib/raid6/recov_neon_inner.c:7:10: fatal error: 'arm_neon.h' file not found
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>
References: <202403291210.ioK7bfPA-lkp@intel.com>
 <20240329152053.GA2647510@dev-arch.thelio-3990X>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240329152053.GA2647510@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-29 10:20 AM, Nathan Chancellor wrote:
> On Fri, Mar 29, 2024 at 12:27:57PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
>> head:   b065e14a3960a495216a032e6d383c104147c9ef
>> commit: aa73a95380b4ef76ccf00344b777d0d415026b7b [53/62] lib/raid6: use CC_FLAGS_FPU for NEON CFLAGS
>> config: arm-randconfig-002-20240329 (https://download.01.org/0day-ci/archive/20240329/202403291210.ioK7bfPA-lkp@intel.com/config)
>> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 79ba323bdd0843275019e16b6e9b35133677c514)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291210.ioK7bfPA-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202403291210.ioK7bfPA-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> lib/raid6/recov_neon_inner.c:7:10: fatal error: 'arm_neon.h' file not found
>>        7 | #include <arm_neon.h>
>>          |          ^~~~~~~~~~~~
>>    1 error generated.
> 
> Looks like the CFLAGS for recov_neon_inner.o got lost. This resolves it
> for me.

Right. I fixed this in v4:

https://lore.kernel.org/linux-kernel/20240329072441.591471-7-samuel.holland@sifive.com/

Regards,
Samuel

> diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
> index c71984e04c4d..0e88bfe6445b 100644
> --- a/lib/raid6/Makefile
> +++ b/lib/raid6/Makefile
> @@ -60,10 +60,12 @@ CFLAGS_neon1.o += $(CC_FLAGS_FPU)
>  CFLAGS_neon2.o += $(CC_FLAGS_FPU)
>  CFLAGS_neon4.o += $(CC_FLAGS_FPU)
>  CFLAGS_neon8.o += $(CC_FLAGS_FPU)
> +CFLAGS_recov_neon_inner.o += $(CC_FLAGS_FPU)
>  CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
>  CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
>  CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
>  CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
> +CFLAGS_REMOVE_recov_neon_inner.o += $(CC_FLAGS_NO_FPU)
>  targets += neon1.c neon2.c neon4.c neon8.c
>  $(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
>  	$(call if_changed,unroll)


Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1910527FB27;
	Wed, 11 Jun 2025 12:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645477; cv=none; b=kceNGw4gDxmhxZ1p2MItF9aplMdv+L0wSzurCmPg3FpyYC2nQqJ9KwlZXDvOz8EJt9PzhwtBL+/gbe1oLHVZco37uJxhSEfhwplJljro0yHiibzhrt0aWYH7XvNDhs1ZFsBp//4Kh7SJVBsEtDO3leaADzR9SqBCp35PA1gv/7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645477; c=relaxed/simple;
	bh=N15WjYZh9zLHOd5EXWKe6oFGkNk5YRdrD9gGPdCvDCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JSVj9BinRdDRQ2SIjnOO3SHjQx8n76zBq04BMImC+wjGzNGdHH1AN/xp9eY4EYWZZr+088STwAzJWT+wKtMhiBY4ZNY2+gye/1TN6c3X1ZQut1tmq57D9B49fn5u2fgyxSsbJffyHooErnAyIRsXR4I5M2VIXTPFEFlulyXCvE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+ztxPyL; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+ztxPyL"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-adb47e0644dso170839666b.0;
        Wed, 11 Jun 2025 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749645474; x=1750250274; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dOXeYQ67MJKyIBb8UNaIQyZgXOV3VN582lWGBgx+72o=;
        b=J+ztxPyLWc6SxgG/Gf7L9sX0Ht+HRFb9rzKu2A5O2PoijWWAyYRbDxl0bFfjxaWTLS
         krDPLA/uRItNQ4NpXPmO7Fx61H7vt6TeBZV/KJzVF5zOtCpsb2wItHKVwA148nX+hFDP
         PEfnsprApjrlYXq34YeaAVNvkNn0eg8QKwCGBxqUdBuByz38SWHjOn1xSaZQ5ikfNGA6
         2SrLd+/f8Y+J9Qe575klexxySikeFEn6IbJU3v+Z3iRBHH3RdZc8po5soEp17rCK4ugZ
         hqzdvGqDD3xELcu6qmLiwvowqJ+l7QWq+yiiZMy1u+69Zs40ad/8RLaLovLG2xwTo6Bv
         Cwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749645474; x=1750250274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOXeYQ67MJKyIBb8UNaIQyZgXOV3VN582lWGBgx+72o=;
        b=SXwMvw5OIMB0zkl4EMgRIR5OW9nYFRFQkAOmP95EWUgwRQgEqeWzrkyp2HlSfAKlGx
         JikPyp6zj4r8Zvybg4GLlQYR69d/G5X4Sh3Nea9y3/7HxjXWcPBLrtFBuwomKXrj8yt4
         ECAVBdbKKVa7aLy6PaBrBswdN7Ib+RpnLzeP4hzZV4LO6nKx4nNMkEC7l+8XJNM+OiiY
         c1Fnh29DTXMyPBMMllCtoIdHK6/C89/Aj6iVNiJQ46Q1gHQGNyKcAm8gvIczR24BSq8g
         B29mdpJ0NuExDJzUh2NJQPL+UTD75HXlHUKp+Enqk8XcjBMlZIi4cjxs5sO7mUlpFduW
         2HfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFMDRIBYF9rmstVh2+fIgZsk2gKLnxfGKixsLLIPea9qbKXfmvdZs0nXx3AE5OoiPXquFKEjhMBx9m56hw@lists.linux.dev
X-Gm-Message-State: AOJu0YyoqC/FQyO4oB6ejwJLneNF58wzVGZYInAhB5CdvN7juNnBydh5
	z3SkbWs9nYuyh6mX1OjDZCFrSJTfWPjWSPnBGxeczIKvg7gIcwCwEQuN
X-Gm-Gg: ASbGncvjckvsZ9Rm0r3ctJMhRycrbz55bFG/jewjyZ8E/rZixmQVB+/zbYmldA9tked
	cfqKPWQ6a/U/5UvE/tPF8Vfw1W075lW+iTiAo0HYtKjhS0lKMAEBr7kmNgEjmdMZD85Vmc7109U
	b6Bi/4Y2cV0XPYCDocYmsLP4UoudlMgWRqcfmDyyFmuqoE+xrdV2xdoYWoeiVqbGLYB1Jv6VTMc
	wcVOesEqiDMCTDXiLsl/inu8C9Johi+BRb75prKFJTIRYPbbW4sYJoXGF2/WSFdxywsnhNfavdz
	5RHIOSvNFuuEnhd0WVK5gRbgUA7m60ufOglNIhdKWNswPhafi2uGnKpzhNFAWBEDArjr3w==
X-Google-Smtp-Source: AGHT+IHHW+D0ougV5xir+6/KUgrN2c375InXtK1X/YNGb9P+kmswRlnqPox8eAbXSjO5ZlB2QjfMVw==
X-Received: by 2002:a17:907:3f0a:b0:adb:3fb8:27f9 with SMTP id a640c23a62f3a-ade899fd6bbmr285978566b.25.1749645474014;
        Wed, 11 Jun 2025 05:37:54 -0700 (PDT)
Received: from [192.168.0.50] ([79.119.240.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc776ffsm872906766b.152.2025.06.11.05.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 05:37:53 -0700 (PDT)
Message-ID: <0d712ef0-ea93-4825-8a4c-45f9d7f9e8d9@gmail.com>
Date: Wed, 11 Jun 2025 15:37:51 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rtw-next v2 14/14] wifi: rtw89: Enable the new USB modules
To: Ping-Ke Shih <pkshih@realtek.com>, kernel test robot <lkp@intel.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
References: <663044d3-0816-4b1b-874d-776835e774e9@gmail.com>
 <202506101956.cNXM2Qvb-lkp@intel.com>
 <b8690413-059d-4330-992b-36a7af10aa30@gmail.com>
 <01eb10716bdb4241a012d378d1f7b67d@realtek.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <01eb10716bdb4241a012d378d1f7b67d@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2025 03:32, Ping-Ke Shih wrote:
>>>
>>>>> drivers/net/wireless/realtek/rtw89/rtw8851b.c:523:47: error: use of undeclared identifier
>> 'B_AX_SOP_EDSWR'
>>>      523 |                 rtw89_write32_clr(rtwdev, R_AX_SYS_PW_CTRL, B_AX_SOP_EDSWR);
>>>          |                                                             ^
>>>    1 error generated.
>>>
>> Oops, I'll add that to reg.h in v3.
> 
> The NAPI also reported the same things [1] [2].
> 
> Not sure if you will send v3 right away. If so, I will ignore v2. 
> 
> [1] http://wifibot.sipsolutions.net/results/969980/14111187/build_32bit/stderr
> [2] https://patchwork.kernel.org/project/linux-wireless/list/?series=969980
> 

I would prefer to wait for your review. Is that okay?

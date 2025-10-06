Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B948A2D2491
	for <llvm@lists.linux.dev>; Mon,  6 Oct 2025 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759758596; cv=none; b=q3Jww1sJHJ2Sg/h19DAM0wQF3PoBvVl4xbcMLPNP+xJhbYM5uR8KK1lkEpPHvLsPXCkGnwF5Uyg+q4Pd1ja4VMbmw5TyQeI0miROW14ulBeRLVMVt+YQNSPeIsL6XepGGhlD3kS7vXGsSOMzfFAjsaA1QsHYXK7bO+n016thIjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759758596; c=relaxed/simple;
	bh=naBllE4IE535a1UhrtE/NG5vtCFsBFvSt2Qvtj+AiGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kB7kmLWSnHwTH57Q2A7bJLxTcUPe/8WZqo5KO+5BcVKVzXiwLP24Y5CGkLZ47OeDCWQDpxVSj+V/8qU5LfcoRj5zGwQQk46dXdgQLTDYIUfgw0vYvpal2L3HJPi2ONf+OB3Y8V+HxDR8mPjpbk6WmJxUtS5bEywAzTNGS4HVvaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e75AMdGi; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e75AMdGi"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-77fac63ba26so23186047b3.3
        for <llvm@lists.linux.dev>; Mon, 06 Oct 2025 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759758594; x=1760363394; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naBllE4IE535a1UhrtE/NG5vtCFsBFvSt2Qvtj+AiGw=;
        b=e75AMdGiw1RQL4gIxtkHbIKs5RR8pLiA3qhDtKK3891G1hkS+Z76FebFJr+No602CD
         Pqhi26L+7EJ5AEbwZplzZ7Ibf56F/8WJathtTl5qi2jQOfZYMo2thmVXZf6rpOVJKBsV
         eRgcB8wcPOx1OhfpHWirvu40V+mI9Yb4TmzLeKLZK4WWN8nPPfH0PL0cIon8H7GmdX4E
         HLzCRPke/4lmEOCeh9fGfD15ryZQDnnKCAiVxWfYUS1dfGIGikA3Pk2pH3RN9h2X7bim
         MY7deB7YtX45jd11iHFzfBYSCgQ52aSNrdK4qN8fL9ZRM55EdLHlY5moFIJPILWlv668
         XCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758594; x=1760363394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naBllE4IE535a1UhrtE/NG5vtCFsBFvSt2Qvtj+AiGw=;
        b=f9O9Y/Al6CBbiSzWPYGnOFsNWDKpFt4+w8hP2SCipWc0sEGs1JMGq1S9RevRnBUX1+
         iPKuEnlgeUVJegh0S8eouRykfzmBNHRRfVILI3Xx+5g+N6XaheHOb08+sVfDI/Naq33q
         j6vCvB/5PfWlqBQ5O5PDIr42OHyxv1qreO/THl+D3mqzX1TsGtoQGOmjO3Qa84ObYduD
         Ls3wkoZzSuB3RfXvthJ5lzoVNhMkviwypxMI55hXrst7hQlL4rZqRU/n5pno9eEsESR5
         iIgwLrfK+6VkvEIlCRAExFWMXq+Nfnx0JcjWAT59vTdj+El/q7N5WQ4hDFb7Ks1zLBzc
         TM6g==
X-Forwarded-Encrypted: i=1; AJvYcCU2Ao4Jem1MEJzi33+X7xUnzmM8TK4U4AMRCS96i5pKOXZcMFK4CVva7Bu5DJnYWQd1hQcJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwyZmJWPZReQYCqCrn9YtdiXvg2x/PSD8CzMQimP8AonXgAS6Bk
	HXWI5HuSJQ6r6xPiOJ5C4k7jbAHlt+DAqOaxh6A62IYmnUtdzoEVnJUf
X-Gm-Gg: ASbGnctOn+g/zYbwefk/ZFneFH2Bguz92ph03nTaj7X60Gw/FgAqGoVrsYii2zCVW3u
	kBXWGIme7hluT8pkABGVxV5WMDEiLiLV8fV67BSbe9j1VXCc46eBuPvBTI8yW/DGq6JDBvPIXyv
	Dv7RgJiArShHJfkkf/B51UMGSi29cbML+G+0clXreSn1rPIT5WfHLWxF6oB49GzzgEUx6X07K93
	iI6Xe4T6qrsjCdTitwI9tUy68/7COSu+s4zczHQSFLCLwso10NMnx8gDYdSAqJIR9QdbWZX698L
	2oiUuh/ayrNJUVtMoA8SxNBWEwdAxGmYuzg7ao0aQ0hLetwp0sSIUkgcfAc8MpT89W8uMbkTDRW
	wCf9ltW+E0madumEn2XXYKSYKxMQ2G6AkuAvTu9zoIOcviIF0ZQg4Crap5HaPQvWIbND2k8jgZX
	Qy/1BitY2yiAR/WOe5i7NBAcwwOo4g4Q==
X-Google-Smtp-Source: AGHT+IF95I/GWMOy7K0yQH9P573Gh61Ga6VWxZPEu4GIRjFsPKAyfm6hJudD/c1aH+Spd7nOuM10XA==
X-Received: by 2002:a05:690c:f8f:b0:731:76db:a5e0 with SMTP id 00721157ae682-77f946a89e6mr163041287b3.25.1759758593563;
        Mon, 06 Oct 2025 06:49:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:6165:1c10:83e:4131:1b09:7d81? ([2600:1700:6165:1c10:83e:4131:1b09:7d81])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77fa19a7d6asm27562527b3.55.2025.10.06.06.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 06:49:53 -0700 (PDT)
Message-ID: <51030f00-48c6-49b6-a4be-0b4e238f71bd@gmail.com>
Date: Mon, 6 Oct 2025 09:49:48 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: sukrut heroorkar <hsukrut3@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>,
 Bernie Thompson <bernie@plugable.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org
References: <20250924175743.6790-1-hsukrut3@gmail.com>
 <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
 <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/25 02:35, sukrut heroorkar wrote:
>>> kernel test robot noticed the following build errors:
>>>
>> Did you compile and test this code before submitting this patch?
>>
>>
> Yes, I had compiled & loaded the udlfb module with no errors. Please
> let me know how to proceed
> in this case.

Hey Sukrut,

When you make code that deletes something from the kernel, you need to
make sure that all other code that references that code will still
function properly.

When you surround things in the #ifdev, depending on the config file,
the compiler strips those things out and compiles without them. That
means that you actually need to compile and test under two conditions.
Once when CONFIG_FB_DEVICE=y and another time when CONFIG_FB_DEVICE=n.

The test robot gave you a sample config file that you can use. Please
ensure that you have the proper version of Clang on your Host machine
for that particular config file, if you choose to use it.

Also, I strongly recommend that you run the code on a sufficient
hardware or emulator after you test it so that you can verify that the
code does what you think it does.

Thanks,
David Hunter




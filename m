Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20516314D3A
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210770; cv=none; b=SxHZDWw8lHLxh3LW6H0P9qOYBrjdx0hq64pmru1tcROISP2qGO4XFq7FTU4/8vRGbT6S1afEFOW/dwq17DU/hF/rAZeEGs5r9TamlfmiyNAjkgebNGM0VFKdhqyEyS4yBuIDit3Pbk90GpquFFFYcunqrl1AFIYpPI0XaMXN4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210770; c=relaxed/simple;
	bh=1ThK/rR645nYnWoPl5AGIZzEq0hrX0mKYDFiJ7pgpwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPYUWh9psD+dTynTlgiB6pxKR4vVfjSI65vfpm4Br3jQExxhZzC/XreLkK5LVIrg04JuFTdbu1AgiJNfuuKExmt4ysH7pdpSCX/sZQ+wsR4z9nDgK95E+LbZr2ixO8/6eQsaycAPYaXCuyLrNNhP6/nI3AgL5qrqCx9JY+NpzmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enBn3UKo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enBn3UKo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45de4ebe79eso1504765e9.0
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 08:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758210767; x=1758815567; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b4tOEHafOTi5CrXOSO1m8dEnNyNggHvPpDClq9ufaB4=;
        b=enBn3UKomm01Yuoj5S1+Q2+Sc31+Psgdw55S0EI5iKFQfugkV2fs8lO7I0YMIfT9tl
         8KEHVSQWxwqA+4ctSlp1InaOplQoGerFdy7YyTnt8gp/7w4UwE25+eUO9d4WrRdqKkeP
         EGU3T1X3J1cttK6HdTU/oUNSIv40Ucjomr9rhZ+A/M+BGAMmPNa1JpH3Wbgu+wZn+PzO
         AYbuoPmUaq1ATgb66AyHzScyLiyyWj3Xia7nt+9ffhv/b8pTMP25gkIl2nxFADI4jWj2
         +30l9BMl8m8hJEWQ9BCl+mJ44V7kMvQw7yaCgmNdN59W61tSDSxSewaBRx9ZMEUq+6OD
         3vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210767; x=1758815567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4tOEHafOTi5CrXOSO1m8dEnNyNggHvPpDClq9ufaB4=;
        b=tkAlrWqohJa1fzqKCVPyTL+GbOVbG3qtbhWKhzEer4lGLugV1geeG94zGFk4p9y7sk
         dfbcaFwfTa8TYVaaa5GuGF2n2B+cmDfqr1jSTFj35d8niG1xZxVod2XXzWq/b7PPjYdk
         +dXPFYe8Hheh7JiTvJRL8x1R0d7rn6ZkSkLf44wCPVZWuHZvFhZReCtpr2EcDsm8h280
         j4EuSvC99u/Nx7HwxaclQ9Bp+3yDSOmBtfUN9pLJ2ckwZdKcf6zIwdeKQVfMRHJZBFjO
         6Aa1okfYndw2+z86J9OHPj486v00wvorO4AbciRipNOQmfe3SpUDI1eOfrNKldGn1VPi
         uyTA==
X-Forwarded-Encrypted: i=1; AJvYcCWPj2HuMw91T5z7DwyIxdHyikgYnW8KTWYHUvRyW9kNV5eu/lZhk3u3haTNzJVEGpGKGD1Y@lists.linux.dev
X-Gm-Message-State: AOJu0YwvvkllbABVnUOGw2W37vT8MDuEj0StpB9XQktc9B+OOHaVYQD4
	1nXUYmxmPXiwTi0H4e2glUMdgbmVWiQs+FI4f/ZEGWqLSZ6jDRB+mdf2
X-Gm-Gg: ASbGnctPs0cAvI8JVrjQsXjUV3myTyGGuzkqCWu7QpG4q8wWBV6fFSNZlwJXCn1AUte
	tEexW+tqmabVPPRUOz6rgL7X93q3YN1d7NhUBONHcrNRZbZQUMSax55B2eFo6H0b1MFwkOSSja0
	gUEQpCcB2EeDTGBiolDPifcy1K2NSE+JfiCR8y2yFa5Dbq2Twvob7m1eoDjEQXAI9yEqpqk0zGy
	YGU0rEeIX5Vht0oPUq/YBd63CzxtK2cz7N4IQKGliW9Mpv5pDC7tFk+oReovNi+7GrXu4ynP5q0
	o4KMJKuzV+6sTQc1miFMq+kFQ9R/M936tRz+oWaIjp7BYCfvfVBQXK2dBnpWbyretMfCIHSHYb6
	hdFmUGRRfvmM0tC6C8if6IpifeWsQ5DGjZ6x6L/7eAap/liY=
X-Google-Smtp-Source: AGHT+IG0MfbY3dY99xKFXmJfWWQhOAQTGGYXwxyEVK9fIcFhqDqMdo/IcROmJKmQtggm9VagY37U2w==
X-Received: by 2002:a05:600c:6308:b0:45c:b6d8:d82a with SMTP id 5b1f17b1804b1-46206283dd3mr33695135e9.6.1758210767067;
        Thu, 18 Sep 2025 08:52:47 -0700 (PDT)
Received: from [10.214.98.247] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46138695223sm87677465e9.5.2025.09.18.08.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 08:52:46 -0700 (PDT)
Message-ID: <60b9d835-b164-4775-b9b4-64a523c98879@gmail.com>
Date: Thu, 18 Sep 2025 17:52:39 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/19] x86: Add arch specific kasan functions
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com,
 kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com,
 alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com,
 trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com,
 joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org,
 graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org,
 ardb@kernel.org, thiago.bauermann@linaro.org, glider@google.com,
 thuth@redhat.com, kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com,
 nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com,
 justinstitt@google.com, catalin.marinas@arm.com,
 alexander.shishkin@linux.intel.com, samuel.holland@sifive.com,
 dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com,
 dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com,
 jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org,
 lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com,
 kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org,
 jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com,
 ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org,
 peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com,
 ziy@nvidia.com, smostafa@google.com, ubizjak@gmail.com, jbohac@suse.cz,
 broonie@kernel.org, akpm@linux-foundation.org, guoweikang.kernel@gmail.com,
 rppt@kernel.org, pcc@google.com, jan.kiszka@siemens.com,
 nicolas.schier@linux.dev, will@kernel.org, andreyknvl@gmail.com,
 jhubbard@nvidia.com, bp@alien8.de
Cc: x86@kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <7cb9edae06aeaf8c69013a89f1fd13a9e1531d54.1756151769.git.maciej.wieczor-retman@intel.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <7cb9edae06aeaf8c69013a89f1fd13a9e1531d54.1756151769.git.maciej.wieczor-retman@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 8/25/25 10:24 PM, Maciej Wieczor-Retman wrote:

> +static inline void *__tag_set(const void *__addr, u8 tag)
> +{
> +	u64 addr = (u64)__addr;
> +
> +	addr &= ~__tag_shifted(KASAN_TAG_MASK);
> +	addr |= __tag_shifted(tag);
> +
> +	return (void *)addr;
> +}
> +


This requires some ifdef magic to avoid getting this into vdso32 image build process,
otherwise we'll get this warning:

CC      arch/x86/entry/vdso/vdso32/vclock_gettime.o
In file included from ../arch/x86/include/asm/page.h:10,
                 from ../arch/x86/include/asm/processor.h:20,
                 from ../arch/x86/include/asm/timex.h:5,
                 from ../include/linux/timex.h:67,
                 from ../include/linux/time32.h:13,
                 from ../include/linux/time.h:60,
                 from ../arch/x86/entry/vdso/vdso32/../vclock_gettime.c:11,
                 from ../arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
../arch/x86/include/asm/kasan.h: In function ‘__tag_set’:
../arch/x86/include/asm/kasan.h:81:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
   81 |         u64 addr = (u64)__addr;
      |                    ^
../arch/x86/include/asm/kasan.h:86:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
   86 |         return (void *)addr;
      |                ^



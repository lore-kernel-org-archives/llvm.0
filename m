Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ABB31A54E
	for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 18:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768847140; cv=none; b=jqoxTgaRda9VN8a5rfzhvQNA1kVKMA1ulO1Uls9l1FJskLN+IOIaVSmxDuoXSbHb/JeysZjSxLsXK9bjYub0/0wszUEFcwkgfhpo6vrj1Pd1fUCpPcjsOLUnpRObh3b3Qv8V83B7rOjjSHPe77M4FPtiaFPezMZ1hRtr+KwMT8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768847140; c=relaxed/simple;
	bh=bj95vgAZVPhJ5iLFRK0Wh3k7CRZDgw7L+i/67I9oJrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c6azhnWUbwGjsaOMfNEg1Q7dqz6yc3sTktuo/ZVYT1jo1CVGyZX40kgehCSlDf02ij0gAXIvxO2I0Ll8dQTH3g4nwd/M6Tw1HaYVwUrA0pajhwFDR20bkf/t5MG5lQ1HocsTXiQ6oC9mD2qTucZN0IKx38IxgT+LusfiUVSkQoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7xc6tJ5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7xc6tJ5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee3a6314aso2281245e9.0
        for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 10:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768847137; x=1769451937; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vSQyY/sbw+WW+mdZ495+fmp7dM6Z9X4lGB7EkpPTED8=;
        b=d7xc6tJ5Urd0RTEgZoNqAhxsEC6CW3ypjJVN8hqZt/L0hVtJmJDWF4LVhEy6utQm7F
         aD/zVkAIsTedh9mm+99C4BhASVXkoEnGQI5Hn19bYBvseVsLz1QZcCUDvf9Viw3xk64X
         h9O6TfEsZKXTlfTgIoGokwbnj4CeI/wCXa/j1fvNLu6VGYWagUqIaHAy47SBQncnyTvs
         RR6IeO7avhK487TvRae8xlnz3K12vn30eCnxOIn9DfIlHbaBw8nLqZZqEhf0Z8Y1Y5zO
         1lEst/Mou4ydnhv0sX5uDPfZhMMZ0eeAuJfZMLz1Nrf8GCmoWH8a31Gm+tlC/jXAoa0i
         xGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768847137; x=1769451937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSQyY/sbw+WW+mdZ495+fmp7dM6Z9X4lGB7EkpPTED8=;
        b=PrX0xHq0yOuvfXbXwYDlkNKrmDtfZfgJi2d5nVSzaXfFN54PQLkt6EUhyc1zGaji+a
         fFta3aHk2jaM50c7kHyTigpC8RazJfS8jdgTui7ostWqblfaNrUMaPiadlG3rLzDGMeA
         CqfgZG4UlokP8Yp+rmB6p3ynHxMuwWVHbOguzjN+5EhAM1k/pR2XGA3rRRMj/VwFfMu1
         theI25cey4VhoY6O6ls64cHtL+kOCHhsCSjQls9OmJryvm1OQMRvt36B3Pjs1iR6pn7/
         0bMVWjvwAEpcJX0Dk72194aa85JdPm4ddPWkIqKrNtQKmpMBkXerwevUbElxkBPpCo/v
         Mvxg==
X-Forwarded-Encrypted: i=1; AJvYcCUeGS9OhLBs80oiOMG3Gy6a7OWkrSP/5FgeyEPumqIkMIh+CJdK3ff3ukOdyFcp8RD7E+Wy@lists.linux.dev
X-Gm-Message-State: AOJu0YyiFFdh2nliDS5nrUYMyRvGIcNji8+mVuKb/P23w61m8FooQuMo
	TM+SkOE+FoJWFNxYFUtixVfeFrccbI01HjLnjmS5Wj7urseQtInEx37W
X-Gm-Gg: AZuq6aIK6L0aiYrYrSdQ3WFhLocS3wQ7O6G1TpKvFdIyvH/j1vG6yK1tl4OqWFKEWPB
	V19qGoddnNUisxW4QkL84pZdjMH6GtMu6WQVKOLrb/YQsjUAkjtAZjaF873hJGw44Q8Jk1z1IL7
	bUv2YvAByitX4tgTK9hagZeHvAv3aCFv3pl5N7S14tOUYddCVAacepW7315SCysnVX4HOJY3/Ue
	UMfiD/bpdOWAZWVXGtHskJZM1tieFwZi49qS3LGgZKnfW7xFfZjqCtjifTXuKPWAlv3xJcALPwq
	C1Ih4l+chxY/l6YS97o3uG0m5E4Gm6zdi86CI0JORyFqXDG/vOzfFRWl+jZhWBQCrhUEWQh+w61
	ftRkMir/On2dmkQEOa71dV++dgxdTyLgVoJDGwIwGyp0hQaW/lk2PUSMjmgY3pQmlHYKwWKS+c7
	1o2+h1qfGS/DOmepJDFQ==
X-Received: by 2002:a05:6512:340e:b0:59d:c490:3ab9 with SMTP id 2adb3069b0e04-59dc4903b42mr330960e87.0.1768840488602;
        Mon, 19 Jan 2026 08:34:48 -0800 (PST)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a6ff6sm3432421e87.102.2026.01.19.08.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 08:34:47 -0800 (PST)
Message-ID: <e273571e-ab8f-46d6-a44e-c1d0d06d3cbf@gmail.com>
Date: Mon, 19 Jan 2026 17:33:35 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, corbet@lwn.net,
 morbo@google.com, rppt@kernel.org, lorenzo.stoakes@oracle.com,
 ubizjak@gmail.com, mingo@redhat.com, vincenzo.frascino@arm.com,
 maciej.wieczor-retman@intel.com, maz@kernel.org, catalin.marinas@arm.com,
 yeoreum.yun@arm.com, will@kernel.org, jackmanb@google.com,
 samuel.holland@sifive.com, glider@google.com, osandov@fb.com,
 nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org,
 akpm@linux-foundation.org, Liam.Howlett@oracle.com, kees@kernel.org,
 jan.kiszka@siemens.com, thomas.lendacky@amd.com, jeremy.linton@arm.com,
 dvyukov@google.com, axelrasmussen@google.com, leitao@debian.org,
 bigeasy@linutronix.de, peterz@infradead.org, mark.rutland@arm.com,
 urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com,
 andreyknvl@gmail.com, weixugc@google.com, kbingham@kernel.org,
 vbabka@suse.cz, nathan@kernel.org, trintaeoitogc@gmail.com,
 samitolvanen@google.com, tglx@kernel.org, thuth@redhat.com,
 surenb@google.com, anshuman.khandual@arm.com, smostafa@google.com,
 yuanchu@google.com, ada.coupriediaz@arm.com, dave.hansen@linux.intel.com,
 kas@kernel.org, nick.desaulniers+lkml@gmail.com, david@kernel.org,
 bp@alien8.de, ardb@kernel.org, justinstitt@google.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, x86@kernel.org
References: <cover.1768233085.git.m.wieczorretman@pm.me>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <cover.1768233085.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/12/26 6:26 PM, Maciej Wieczor-Retman wrote:

> ======= Compilation
> Clang was used to compile the series (make LLVM=1) since gcc doesn't
> seem to have support for KASAN tag-based compiler instrumentation on
> x86.
> 


It appears that GCC nominally supports this, but in practice it does not work.
Here is a minimal reproducer: https://godbolt.org/z/s85e11T5r

As far as I understand, calling a function through a tagged pointer is not
supported by the hardware, so GCC attempts to clear the tag before the call.
This behavior seems to be inherited from the userspace implementation of HWASan (-fsanitize=hwaddress).

I have filed a GCC bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=123696

For the kernel, we probably do not want this masking at all, as effectively 99.9–100%
of function pointer calls are expected to be untagged anyway.

Clang does not appear to do this, not even for userspace.

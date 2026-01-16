Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807111C8626
	for <llvm@lists.linux.dev>; Fri, 16 Jan 2026 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570463; cv=none; b=Jvw4W439EgoyIUPQ2qsHjSe9pIvdEQ+rT42+M+nQQJrPwjPaq8rSeGAvLN/9lk8nFlbF3sR9xzcQp68XyspMP0Z71nI+5rEM20QQ53kGsgzLoOAvdcTs3nH2UUr4DDXp4c+H19fpTv2vVJbwTg6CNDUv3Am6CFYPSmYvkM5Zvb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570463; c=relaxed/simple;
	bh=lhWftONTvT8mo5Rk/TohDUhgTti9Iwnng/XSd0I81G8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doGvza0Bgu/sdZdI1cOCM7rh0SOZo0V7MfBJ9CKnJTnpzsZjK5zvSqgeXVRZUS9jEPhvH73sOqM3Zv2wknEsrvOFRYgmg+ec8mSUfy8KhfLy9oj42V1gFn+KluZFAN8qJywz88fh1j5FR6zAYKlEUeEij+3kMGgPEYyemftOYZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLZQs2BL; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLZQs2BL"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b89e1cf34so306138e87.1
        for <llvm@lists.linux.dev>; Fri, 16 Jan 2026 05:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768570460; x=1769175260; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bev0/5BsocMDQdsWbP6nwDXNzQ2lVeqE+NGh6GYspu8=;
        b=fLZQs2BLio8/uYd5Y+ckWQi0MPVj6MxPlQj1iJZfMIJb9uJR4mHfhxRFcr2WuUT7c4
         EI04ShCVXpH7d/z3/01IG+wmorW1HqzZflrgvVawNEuTgvjoCMWMDvh9oVaet2wBagPh
         p+SU7ocFHyFAqg06zbAKNxbi5pYFlp9NOYrJRdGEmhSxSkSANieGMzixo+dS8k3YmhBr
         eTeMjImeqgEnD8sXxDIz0HSJy82evSoG9sLnaUJEkRXi3zcA1Aq5PTzi+Najzfsp+++T
         teobT/rMQq3PA785GBJkZ5HdCQaqf/La0o3lnsrUAHnML9wQcfrkpj03Rz9pQn6VrUpb
         7tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570460; x=1769175260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bev0/5BsocMDQdsWbP6nwDXNzQ2lVeqE+NGh6GYspu8=;
        b=JuZI/k2vmiroFUJZE8rYKHnjaLcv5m9wCzyfy+EwrkTEEYixnGcIz9UTfN200Fr4lY
         0w3NSVCvdyadY/K1OTR/iIo6zEY23qn4UPaMQUQ06YqXkw2H5IionDRv+9ZwkWtLyrg5
         UQa7kNzu1EPVV4IIGbgr2QubcE9Bu2nDRx5BkP8tea3KDB/VXF63Zm50Uo6KeLfeGtTR
         YYt0qI2OJoBqbwS9nL79Gwe+HRuh1ccIZk9Mh1JDOs75sEY6tvI0VlF+bM96dit1cN0z
         d8hOPe9g/xQLn6y6DUWsIfWusy4L3XUOIYkTD3yK87fz/Xops2iff4+Tp22aCMe2SLPK
         AL5g==
X-Forwarded-Encrypted: i=1; AJvYcCVRHz+n0MjfNjwi+uM4d+ayZYLkNI82DS9zv9v0I4mmXjdJsB6pt2X5w/T6cTsg7qg5iYv4@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgx07c1OcRAto7LyX8G25tLXWnXYUAdklTJaLjZ09qnTrjJhzA
	/tmSnsRDwXICnBUFdNJKkrSGuJ72EM4BLZqIoY/g66nw1dEHB+PALJtP
X-Gm-Gg: AY/fxX4UIHW5Iw9g/58khmhovaVkEwB+UfwinvD5CCX/OmSLdAZ0QzWI+u6VdDOXO/5
	A5zgrclmIeqLz3lbJ6eXG27bMMWfVY8rDN7o4nSZWu5U9yFxMjqqEe0u4ESrMIaQeXwPgw8ENHG
	D8x3eN1q7BkGu0X/+6Pw2koVJr/dm61zdbrmQ5w/P9xXSDC5BrYnHJia2fkuu1k5sMlj3Dkqei+
	c8MiQitOhN6leYBLOVEm3dFffGp969QruxG6ymqXdy830/7Mk8IjODttbqyXQNEBR8nhj9zm6Af
	Fng6nXpvGeIjFRmeDhKr9wwIpzPQaiUn1ZA5fI5O1nIkiyC5sltEETRLvPrqdjnD5oBpsgb7voI
	9v8uQzBdlyq1FH+gBPgHu5oeDWP+7/PX9jQcF8igg6L3AMoyRl8wt2M3w7KE6qViNWtiJ3VYigi
	m9k1iqwiAwTJ/wf1Il8w==
X-Received: by 2002:a05:651c:31dc:b0:37f:c5ca:7428 with SMTP id 38308e7fff4ca-38383fe052dmr6437051fa.0.1768570459458;
        Fri, 16 Jan 2026 05:34:19 -0800 (PST)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb8ff0sm7244461fa.45.2026.01.16.05.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 05:34:18 -0800 (PST)
Message-ID: <1f821f5a-403b-4dad-b9d8-239c9b039000@gmail.com>
Date: Fri, 16 Jan 2026 14:33:33 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/14] kasan: Fix inline mode for x86 tag-based mode
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <cover.1768233085.git.m.wieczorretman@pm.me>
 <1598e2bb7d45902fb0dc4d0d8e218f61b0c1a0f6.1768233085.git.m.wieczorretman@pm.me>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <1598e2bb7d45902fb0dc4d0d8e218f61b0c1a0f6.1768233085.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/12/26 6:27 PM, Maciej Wieczor-Retman wrote:
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> 
> The LLVM compiler uses hwasan-instrument-with-calls parameter to setup
> inline or outline mode in tag-based KASAN. If zeroed, it means the
> instrumentation implementation will be pasted into each relevant
> location along with KASAN related constants during compilation. If set
> to one all function instrumentation will be done with function calls
> instead.
> 
> The default hwasan-instrument-with-calls value for the x86 architecture
> in the compiler is "1", which is not true for other architectures.
> Because of this, enabling inline mode in software tag-based KASAN
> doesn't work on x86 as the kernel script doesn't zero out the parameter
> and always sets up the outline mode.
> 
> Explicitly zero out hwasan-instrument-with-calls when enabling inline
> mode in tag-based KASAN.
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> Reviewed-by: Alexander Potapenko <glider@google.com>
> ---

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F5F33A9F0
	for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765896118; cv=none; b=sEd4scwpjLDRmVLKhaAhgDbr/L6smxakFevVT4suTnCB6pCMFGJxs6pZV0oMgKtb0B6pLF8OfzyJqcJxDDGJKtjP967QCoO+a4RFJI412t6hxK7n+qzQdbcizUVZdsGZUVrYulZFVoPB90+1G1zbXe4yb0UR2BuZMU7CaklgimE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765896118; c=relaxed/simple;
	bh=GcmsVh81EPRglScizk3u6c6zc0imNsEO8zBP3X7zTI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pWkfrlxgw2AcPhODXHlVgMHS3nUwzFeJAnkHMuV9gt4lqNO1fTxhDWrpT2UyxaPlKPCEhfd2SLQnIB9Dsm6EywctLi/I5l/rrYXtZrkljDS8F2Ae4CeFDvtGAfYPlrCCjpISp5+uGzFYR8lmJ7vN8EEpHlzrQCUyL5FeHaIAmUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwRQVC1A; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwRQVC1A"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7355f6ef12so905547266b.3
        for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 06:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765896115; x=1766500915; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKhhZCZ5BMNvuKBSscW4xFg80GIsuJjSxZdB89waxC8=;
        b=hwRQVC1AX7Gmfv3PvV8ZwvzO3Xot5xcpVHWb4K6lox8jxn1Z3TiaRuKxR3R8Pl/7iW
         JyZwqv3wVmdHniPkk/GqqaUtny93ZUyF3PreWDJeJ8VdixWFyZ64ydq20WZ/JimaGpd5
         cW6q4xQypy0a+hYNqCgdWrrX9sHNS3Su3VTWsqxYyPkWydQP2VNv/btWvDZMpVnqlllU
         vz3RJp4sNC0/7Jp5q3htD62Qg1F9xfitLafiPWGZZhCBmwSgO9XIppMkdtLpGSBdGh5U
         eDWEY6Eg8wH+eIiQMvwaKsJc+hnqNuHtFjekSa0Q01loJPWR2Fah2USZMW52Bz1Uhcbt
         GbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896115; x=1766500915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKhhZCZ5BMNvuKBSscW4xFg80GIsuJjSxZdB89waxC8=;
        b=I+tVQYjfyVqVprSOXhhEnbIeR3X+5sG3Ky5olEm6f/0D3DDc1zcC5kypRI7/4hBgZO
         YwaSJ+cLvAawgHIqFGTa/y/wzmWsRQwYb6Lnu2PeCsvaumMZapIa9znrcI7vIi4EgKKv
         CNMU+n0KPez8x/mff8prA3UKet96OwyRrDO/1ja9xEIY2VIxlWHw46MbHylvk/ivEyjm
         6Q9w5o8fnlcIXMAnhBTy5WTz9hLGGnNuINFRhzRpEUutjua+MOnIS576RZwabBbcHLIm
         WTYHOXH7+2TMyVxMbz6genMqCzYhauy1k9uAuV7bQZJONBGyS10E8AH5hqlvnEVmP3ZC
         clNg==
X-Forwarded-Encrypted: i=1; AJvYcCU5XY/4rbV6ivdgGXAaBxFvezrG2TOAMHF5a3lDKv8BMeoYW1Eo3Ekijk7oL72RUk2Kf0aC@lists.linux.dev
X-Gm-Message-State: AOJu0YxH4amxoj0NVuHkCRsxwLiXMC6HTV9TWKEqskoqNVdJZ3THI7i4
	31LZ3G7m/uCQW6RAh6Ch8SoyGx5NDYxWh/YmiBVZNnXWKg7nvR/gHFnH
X-Gm-Gg: AY/fxX5p5t8qKl+IVWcqtl1oqQEdcG8YWHckWd4Yx0yjH0jm+EF/iDKg7jN768IZLaL
	G6H6W6icB2GYAXNyHhF0dLavVoI5Qq1wDcPKc4XbwWr/epalwCRVTGwfYAIeYRhydLTFkPAaM/X
	yzxjFdZnYBRz9Opadlu2LThxLdDHypzxVeeQ+rLw7C+0OySuMI8gA34Ilvnmstd8jcaE+CHVsHF
	8VRxi3mCkK+lUEUunYRZtkEJavZYhngHGCn+Gj7+F5qO1g2KmlCPZtUqSFm1zg39kjOFff4a3Ex
	+nUqc7fEN4HAvz2x9dEdr3EIsgUibiH9oBJ4pT3A6fJ1Zsf75gYCQuTVbmgegWFs++RTu0a5OV+
	SMUFPv6yX4d0ub2jAlcesyLqgoQJrxZ5R8x9ycksTEEymQoLrPyj1kpsTYs3VnE9HlXbwGxwDrH
	jH9h2iPJ2FVtb6TsaU+lK5SUQ=
X-Google-Smtp-Source: AGHT+IG2eeJsem6ZFRGiTw+NwisDAZ+3SHIeXNcmnaxykLecsCuhc1aufmqpuqSo8Y4ftNwLIvjHPA==
X-Received: by 2002:a17:906:4fc8:b0:b79:f984:1557 with SMTP id a640c23a62f3a-b7d23c5bf6fmr1614360966b.46.1765896114506;
        Tue, 16 Dec 2025 06:41:54 -0800 (PST)
Received: from [10.27.99.142] ([193.170.124.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ebaebsm1717413666b.21.2025.12.16.06.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:41:54 -0800 (PST)
Message-ID: <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
Date: Tue, 16 Dec 2025 15:41:52 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Rudraksha Gupta <guptarud@gmail.com>, stable@vger.kernel.org,
 regressions@lists.linux.dev, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/14/25 12:54 AM, Rudraksha Gupta wrote:
> Hello all,
> 
> 
> I have the following problem: https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635
> 
> 
> In short, what is happening is the following:
> 
> 
> - The kernel boots and outputs via UART when I build the kernel with the following:
> 
> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
> 
> 
> - The kernel doesn't boot and there is no output via UART when I build the kernel with the following:
> 
> make LLVM=1 ARCH="$arm"
> 
> 
> The only difference being: CC="${CC:-gcc}". Is this expected? I think this was present in the Linux kernel ever since Rust was enabled for ARMv7, and I never encountered it because postmarketOS was originally building the first way.


I've managed to the get the build setup for qemu-armv7. For some reason
I could not get past the initrd even on kernels that are supposed to work,
but I think that is unrelated (and not a kernel issue).
On the linux-next kernel I didn't get any output on the console from qemu so I
think I've reproduced the issue. Changing CONFIG_RUST=n did not change the behavior.

So I this is almost certainly a LLVM/clang issue and not a Rust issue. I'll try to
do a bit more digging, but I'm not sure how much I'll get done.

Adding the LLVM and ARM lists to this conversation.

Cheers,
Christian

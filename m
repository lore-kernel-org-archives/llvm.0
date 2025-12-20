Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90DF15687D
	for <llvm@lists.linux.dev>; Sat, 20 Dec 2025 01:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766193584; cv=none; b=p7aZ7rTrRX2lz2Vh5ZyU1dhi69qPb5rPXDIBK41ygVaUVMGsKPtNmhQHDIyMGKezIJwJiXb1KnfzP+yCnSuGqvDFTJ750Q9XJV8pF07Zxyh4nnmtLgpA4eaqWlpk05iqDu9k9Hsl8EL+/4OyDR4uCIADdhZINq9qJnfa+Dnl26M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766193584; c=relaxed/simple;
	bh=UAv4VsnO1f6WhxU7SkgAuV0N5XBMbtSHDkWqN01Nnf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKwbibQyaMEO7KJLgfura98x7e7GjSPCCB/U2vUQ5UjJrTABaLQwbI0iLmQZE/ABDjOMsT3SFa11SYwc/73E6JfLKB/Ro6vtnv/aYv1wkR5WLREG0Bg2Jglzsbzp5FEAB+2MF67icp6ECXBITQkvCCNKdojFVbhMWRDzIe4jxto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUUhu2R4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUUhu2R4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso23710515e9.0
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 17:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766193581; x=1766798381; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zK22OFLvaJjEwSRzCjqir8eHtku5CMTMzFAHnPXvPsE=;
        b=VUUhu2R4vSK+TVofe+rBqd6mWwZC03lm32wgOJhu5GzRr7kVZcCMkEhCSN5HPSAqD2
         colnzM75f/vyCc5sET+DUuEfgq8JNFcP3d/S9ndoMlX25rfwqmTxq+YEGWSl7T+lNZEH
         HDiL2rMxc3DXKi/vd6Iqto4KszmXvDp3O9Xyt5x3ogbdcgHS07uabpIVaqwM1eLen9oZ
         WEUsHyZjhrHsvUXTreWrYKKgvu6araq9y9n3PsFYHFvzdTXtLpNMB7RUb+gWstF0Q3R/
         hY8MSfrsX/iXDt79r3ThtfL/Znw99I+oy7LGH/b79P+rJHGQyV0OP93zADqmcbdFV0NV
         gvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766193581; x=1766798381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zK22OFLvaJjEwSRzCjqir8eHtku5CMTMzFAHnPXvPsE=;
        b=XUdK5TUY3Hhuu6LDk53ioS76D4QHCSr3oYz0iw1FGXP+QUCYbTqb9dQlS6dgoVrdDJ
         jHK46f0gZ1JPeB2v2oDiYEMHz8HCK6yAJGrZUoP/98ihQYXYI8ucsd4OJOv+rbolgTVk
         TG67ZJrpPE49ZwlQesC54Z0lb/v6YBMjrb8iNPnr+25X6ozGf+SuTR7WXawO8u21e0Mt
         mcFTfLRmd0VROS/z4RfhI68h5HY0VriwW7rszXjDnIMARgfGjNleSpH/0TPz+3YAhBkf
         1Wjo5OcpaGEiCyepYWPj2e3wU/PUSHg19SjEMX4EpA9Pk15MTJ368Di8bG/YTHe880sL
         K7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVCPGERPelq8cQX+8DXyaM/x1wVyT3EJDSUS/QiSyrbE0KhSCXk6uvxzmJhoIGmpojLFMSE@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2X39vJ9js48exwZWptt5wB+2AnJ7+073E1xPUrOZDSbqqHPh0
	aE1N76ftpEp/wpyM8p3VsRCQccq4l2Lws4Lk8mjcPkm6lFqkdsZtckuA
X-Gm-Gg: AY/fxX7ZzNyMk17KIOLiqDWW5G2eau+YvFJgx0EKwiXXfqpAN2rd2sfSLC2Rab7wJLZ
	rQ58Gk6YnMd+hcLUh7E2ti8Hmc8bXHhUncuXGiUuFf9dewdNwHbZBIJ/ysmWFR0YBC7kOlIV63N
	VDldrnUfSNDp6oqapb9g6auTw1ssf7mlmGbGSvlmqVxfToihL8yIrFs2A2xtQ0F1hmp2p+YBQHI
	hXJOb/MsfeJKTbGK8LB8enzNlS3EVItkpyoUJtY0+7UNoQo6Qd4bNQ7EOaPMg94vn9KpZuNZjmz
	b9HHj6FljLFD86KKVkzqZ3GICT7QyAp6Pv6Boe54H0LkAVnFTfMqNloIilMxLhqibCRWgRkx7Zu
	I44xjnhCiayrWgquxvDcw7dP5DB9Az+Gr3u0NwFoTJkw1b4/sHto5Wy7Ag+g8DZEN3ZntwS1HJA
	RsuadF6N8gSWAHgSLZI6NclmJC59nYT+pfR0M=
X-Google-Smtp-Source: AGHT+IF0wGcWgILC9H3tfPesbVD2VmsjrslWPh0/J9HlYlPO8n11RyhVH5Pxz5vhOfwwh8J55YseTQ==
X-Received: by 2002:a05:600c:4f09:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-47d195672d1mr43896195e9.15.1766193580895;
        Fri, 19 Dec 2025 17:19:40 -0800 (PST)
Received: from ?IPV6:2001:871:22a:3342::171c? ([2001:871:22a:3342::171c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723d19sm135576055e9.2.2025.12.19.17.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 17:19:40 -0800 (PST)
Message-ID: <0169d4f7-1a31-4ec6-a456-a6dfe2d99886@gmail.com>
Date: Sat, 20 Dec 2025 02:19:38 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Nathan Chancellor <nathan@kernel.org>,
 Rudraksha Gupta <guptarud@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 llvm@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
 <1910f4b6-db74-4c86-9010-28ab4462c5a7@gmail.com>
 <20251219211147.GA1407372@ax162>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20251219211147.GA1407372@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/19/25 10:11 PM, Nathan Chancellor wrote:
> Hi Rudraksha,
> 
> On Wed, Dec 17, 2025 at 02:21:11AM -0800, Rudraksha Gupta wrote:
>> On 12/16/25 06:41, Christian Schrefl wrote:
>>> On 12/14/25 12:54 AM, Rudraksha Gupta wrote:
>>>> Hello all,
>>>>
>>>>
>>>> I have the following problem: https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635
>>>>
>>>>
>>>> In short, what is happening is the following:
>>>>
>>>>
>>>> - The kernel boots and outputs via UART when I build the kernel with the following:
>>>>
>>>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>>>
>>>>
>>>> - The kernel doesn't boot and there is no output via UART when I build the kernel with the following:
>>>>
>>>> make LLVM=1 ARCH="$arm"
>>>>
>>>>
>>>> The only difference being: CC="${CC:-gcc}". Is this expected? I think this was present in the Linux kernel ever since Rust was enabled for ARMv7, and I never encountered it because postmarketOS was originally building the first way.
>>>
>>> I've managed to the get the build setup for qemu-armv7. For some reason
>>> I could not get past the initrd even on kernels that are supposed to work,
>>> but I think that is unrelated (and not a kernel issue).
>>
>> Yep, I just got qemu-arm working to drop into a debug shell for now. I have
>> to look into why other things aren't behaving nicely (but that's a problem
>> for later me :P). For now, it seems to demonstrate the problem nicely:
>>
>> https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635#note_521740
>>
>>
>>> On the linux-next kernel I didn't get any output on the console from qemu so I
>>> think I've reproduced the issue. Changing CONFIG_RUST=n did not change the behavior.
>>>
>>> So I this is almost certainly a LLVM/clang issue and not a Rust issue. I'll try to
>>> do a bit more digging, but I'm not sure how much I'll get done.
>>
>> Did a little more testing in addition to the testing in the gitlab issue
>> mentioned above:
>>
>> - Removed Rust configs from linux-next/pmos.config -> didn't boot on
>> qemu-arm and my phone
>>
>> - Then I removed Rust dependencies from linux-next/APKBUILD -> didn't boot
>> on qemu-arm and my phone
>>
>> - used linux-stable instead of linux-next -> booted on qemu-arm to a debug
>> shell
>>
>> linux-stable is built via gcc:
>> https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/community/linux-stable/APKBUILD#L179
>>
>> linux-next is built via clang:
>> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/APKBUILD#L68
> 
> It certainly seems like LLVM / clang is a factor here based on the fact
> that LLVM binutils were being used with GCC based on the original report
> using 'LLVM=1 CC=gcc'. A few additional ideas for narrowing this down:
> 
>   * Does this reproduce with GNU binutils + clang (i.e.,
>     CROSS_COMPILE=... CC=clang)? This would further confirm that clang
>     is the cuplrit since GNU binutils and GCC are confirmed working with
>     linux-stable, correct?
> 
>   * Does this reproduce when linux-stable is built with clang / LLVM=1?
>     This would rule out a -next specific regression as well as allow
>     diffing the linux-stable GCC configuration with the clang
>     configuration to see if there are any configurations that get
>     enabled only with clang, which could be another reason no issue is
>     seen with GCC.
> 
>   * Our continuous integration boot tests several ARM configurations in
>     QEMU, including Alpine Linux's:
> 
>     https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/20379046102/job/58575229973
> 
>     So it is possible that a postmarketOS configuration option
>     introduces this?
> 
> The results of that testing might give us a more obvious direction to go
> for troubleshooting, especially since this appears to reproduce in QEMU,
> which should make debugging in gdb possible.

I've found the issue (at least on qemu), it was just that the driver for
the PL011 serial was not included in the config.

I don't know why Rudraksha would have observed any difference disabling
Rust or clang though.
Maybe it's an entirely different issue on Hardware?

> 
> Also, what version of clang is this?
>

Alpine clang version 21.1.8

Cheers,
Christian


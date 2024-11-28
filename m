Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D615854A
	for <llvm@lists.linux.dev>; Thu, 28 Nov 2024 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732788070; cv=none; b=LhxajOy5Hnu3OQVskIPvvVzmh60OJPzWreLSMVFQwpokM6UXGel+2yroW6DlWPR8M04tklQQb2KfZPdx3QH6fzoutxjFta6U4RXzT0Wv7Z0Gx6D8GgxImVchfLLolGvw6StDyNtkNFhQkOQ7P7IEVelFTe+heTUyUJR841fA0Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732788070; c=relaxed/simple;
	bh=sr3m4q8NQ+yWL/GM/aZn5V9dc0T5vWuPfLus3LYfktY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOq94WOcjvm4jtsZI78Wev7NEnPLMu6JMIFKKuzWQLDuvyFJGBID3E5wrWcj2mJEfceFsBS8x/7G7qXdVLJK58U4BAqrN1zu2S7cs4uhjHiV4QQj1t2T/DfqKo0IeN/0uaR6xSCHkyTIrrw75e9/MN8VMgE3odZiJyTTBsoJhSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uh3Ydam3; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uh3Ydam3"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3ea5a7a5e48so343469b6e.0
        for <llvm@lists.linux.dev>; Thu, 28 Nov 2024 02:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732788068; x=1733392868; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JSLLTaqyAduW2ArQyIX+tknhwh7psIKkLCezIRIcTH8=;
        b=uh3Ydam3hm3IWe6xc7d7heP86iiqcmpxYEgrEiD75y4WgZ6rRoAYpXliWPAGDp4o6h
         UNm2T11qf2hYToZ9b23+zFVfhtQaeLytMCz72TT96OkxosumdxyHmV4vKyHvUng6bQBb
         N4c27EvAC1vrP+2D7T3YtbcPrbx/cUc1cUuaf39k5p+KHuOb+xHaHE+9jwb5QbxFk+r8
         ja8ZyH2YI0K8cLNyuvB2nGHZfa9OM0mRzO50K/SbTCPBs1FHwuQdTJNaolVJWgDdbb7r
         cyoRQBPqIa5HAW0Tb55mdX4RyfRsWEvXHUmxAjsSfb53I95Ac1K4ssNqNY7hoiR+T3ca
         MW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732788068; x=1733392868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSLLTaqyAduW2ArQyIX+tknhwh7psIKkLCezIRIcTH8=;
        b=VmZMce2db1ze79Yp+B04vFfJ/CH0VG4621aJfHMtF2ERn69ZRYcuA9pTTSfk9Yy6m2
         i+8+FNG4jNeSqaBrH6Cjwl2sabW9rndq03pfwrXP0mb2X9PUn0czSbuY/wJEmB1tXy3f
         mY+JVIBaG7fHZ9OUmusr1E2XSvqNscpUWqoxmLeRN5FsuIqdec+tkdRcGsTqCkE4nK3d
         RxiXtzkTtOLMxeFFWVR5GMZEjU4Dx6yLmdM1Ddi42hjvkhWpCShTxqBYDNLm7/joCMuT
         39x/A9d8uEnjHiDs+b/3ozkFl99SXF9aA5NG9kk6b7/8sYETuwkJjIQYUMZiBrUeMlL9
         7Qsg==
X-Forwarded-Encrypted: i=1; AJvYcCVucxvVvzGiGiWY16j0/zopP0Uah9gO1H1DjZ08O/E8UNqLcUmmNvt2Y8RZjEVlKvjV9ghV@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7D6A1XCsP61q1qLJ5PRAw26fgIJVTYF+Wal/a4C1sSomE4LDC
	QpgeYPf5lbqKkVy4j5MADRya+URjyjk88Bawa1ikATeNJKthnlpWIZVFHdQWRQYOaJ4uV5hGTA6
	vQDUqzcMUJ5y4681E9EBcbdYS1my2FWstfWe3Uw==
X-Gm-Gg: ASbGncu91J9yVf1v0vSmaOhtjqfn0828bgxSBIeBO7WSmfnVCw4Xhe7VpPOAtpa7Afh
	YKkJ6Pg0HO3tWRCTRTDE/a/7FViw4BWhsVQ==
X-Google-Smtp-Source: AGHT+IFQJ2vqlwir+TVj8VrxIEsFkK/0glqr+WYlo4RXfaelhJ1mOeWad0OAsfuEv05eXPQ6Wfy96mNVzfuVmE7f838=
X-Received: by 2002:a05:6808:d51:b0:3e5:cf3b:4fc5 with SMTP id
 5614622812f47-3ea6dbd5d8dmr6480398b6e.15.1732788068001; Thu, 28 Nov 2024
 02:01:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuaWJYQcxQ=3UqQbbuD_YNdOS_KB46N=mh47rxE049f-Q@mail.gmail.com>
 <20241125162354.GD2067874@thelio-3990X>
In-Reply-To: <20241125162354.GD2067874@thelio-3990X>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 28 Nov 2024 15:30:56 +0530
Message-ID: <CA+G9fYuf6A+3gjNfifnd5cRL5oOU6HA2j-KXaaP90mskNVrV9Q@mail.gmail.com>
Subject: Re: korg-clang-19-lkftconfig-hardening: TI x15 board - PC is at
 edma_probe (drivers/dma/ti/edma.c
To: Nathan Chancellor <nathan@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	dmaengine@vger.kernel.org, lkft-triage@lists.linaro.org, 
	peter.ujfalusi@gmail.com, Vinod Koul <vkoul@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, kees@kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 21:53, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Naresh,
>
> + Kees and linux-hardening, since this is a hardening configuration.
>
> On Mon, Nov 25, 2024 at 07:34:22PM +0530, Naresh Kamboju wrote:
> > The arm TI x15 board boot has failed with the Linux next, mainline
> > and the Linux stable. Please find boot log and build links.
> >
> > The boot failed with clang tool chain and PASS with gcc-13.
> >
> > Device: TI x15 device
> > Boot pass: gcc-13
>
> Are the UBSAN options getting enabled with GCC as well? I am somewhat
> surprised that they are not agreeing here, unless this is a __counted_by
> related issue? Does this not happen with GCC 14 as well? It would be
> nice if we could get a copy of GCC 15 with __counted_by into TuxMake for
> validation of __counted_by between the two compilers easily. I did not
> see any obvious instances of __counted_by in edma_probe() but
> admittedly, I did not look too hard.
>
> > Boot failed: clang-19
> > Configs: korg-clang-19-lkftconfig-hardening
> > Boot pass: qemu-armv7 (Additional info)
> >
> > This is always reproducible.
> >
> > x15 beagleboard:
> >   boot:
> >     * clang-nightly-lkftconfig-hardening
> >     * korg-clang-19-lkftconfig-hardening
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Log details:
> > ------------
> > [    0.000000] Booting Linux on physical CPU 0x0
> > [    0.000000] Linux version 6.12.0 (tuxmake@tuxmake) (ClangBuiltLinux
> > clang version 19.1.4 (https://github.com/llvm/llvm-project.git
> > aadaa00de76ed0c4987b97450dd638f63a385bed), ClangBuiltLinux LLD 19.1.4
> > (https://github.com/llvm/llvm-project.git
> > aadaa00de76ed0c4987b97450dd638f63a385bed)) #1 SMP @1732428891
> > [    0.000000] CPU: ARMv7 Processor [412fc0f2] revision 2 (ARMv7), cr=30c5387d
> > <>
> > [    3.543395] pcieport 0000:00:00.0: PME: Signaling with IRQ 136
> > [    3.556976] Internal error: Oops - undefined instruction: 0 [#1] SMP ARM
>
> Can you turn off UBSAN_TRAP and see if that gives us any indication as
> to where exactly UBSAN_BOUNDS is triggering here? It is not entirely
> clear because we do not seem to have a line number in edma.c from
> decoding the stacktrace.

Anders made a new build with UBSAN_TRAP turn off and the boot pass
 CONFIG_UBSAN_TRAP=n
on arm TI x15 device.

Link Log:
--------
 - https://lkft.validation.linaro.org/scheduler/job/8008096#L1846
 - https://storage.tuxsuite.com/public/linaro/anders/builds/2pR6MSNK0MqztHMe45eAqWYlIaf/

- Naresh

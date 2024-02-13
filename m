Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC97374DB
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 11:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707824614; cv=none; b=GKgJlzEXT05Oaaaaa9JyMc1uhTzrULuHfptIK+u5iPF1Ph3nEC0RR8jRgYLpR2NMd6RckH6u4ZOa6zmYAwF6rWY16xA9teJPeHLiDNOa6okyjRbi/bUJpCxSvSJ2an/eyFC3/yhWXfB1ZO8ndHc7jkxpi2FI+SQ0amvkqie41KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707824614; c=relaxed/simple;
	bh=j0EcmW86LVwxDZD8jjvR3IIBsMo9Vd5fN53o5Q4wNco=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=ZqVRiGLElzwS1o7TPcXHSJGEfw4TA/9oDAy5T5gRSB/hYWSz5d0NRsuDzwd1x1QTkWkquS8Yg2BTqSB9Nh9d64bsVOQG2phVhY4Ojaogq+3TNZ7pcYTxREzAXsDnvXa5sMPP2eotLRs3gY3k2bDD7SEEj39/cjWompGEShAekLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=akuVApGW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="akuVApGW"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3394bec856fso3106411f8f.0
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 03:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707824610; x=1708429410; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=E9Sow8wf4cLhsoNjPkxy+Vy7mK54b8EsDuIPycqqMjY=;
        b=akuVApGWTCJn2RUUIy05CViwYjTYvrjBJThQr1LvrqTCFJBbNvt0yhKqNdLnGlgeQ8
         uvui0G1Tlxjsu9/1hOzOV9Ynf/gT9vLJAoYnARiODEpmPF9xutxfb0AWqnyVsC5AnJzV
         mqwu6SZrf/hYLUt252odcEpSGTBegELRwN222e+uURJ2jZ3MW0fh1TQv+kZIwHebPyz4
         1WTilQlaHirCX+9hrXe5zSYErZNzy8+H1G/aug8Ng3CKKrOk7SRMpKFo6PN/TcfkAKni
         3L1xncuGwmYPjyPn+T5/mog7qe1HBWuuVIUW1n0XHTB6/IZvdloVBiko1V/6EPRKrVzQ
         ik6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707824610; x=1708429410;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9Sow8wf4cLhsoNjPkxy+Vy7mK54b8EsDuIPycqqMjY=;
        b=aZe2sLaXD8kIOjVNRDCyEynp2sWcvPPBzGv6GRMrYZDHaLDJBU3dy1UwueE/RqHeIX
         90BSc0iutvYFjbh64aDlmv5dG5BSLNVJKUgJhik8ss1orqt6jdhHzZVIUIN/sQ08SNk3
         L1v+a3HtNzepgpKEPHPpu9iATZf1bx+K27RhWK0JvB5lkshxuBRkGMzjxZRs6xlf2o7l
         4pmzNUNBigpZnIP1HZan0RNnKXD0/EbWFQYCVGw7LmXkbrm9ootQmNenWq8a+GfGAnJT
         mHnznboqoshDM3tn8FtC1P+0n6AFLMlFzEPbR8MYp/X8ibZO1u5/3OzrBKwPCcDP0Kdx
         iP0w==
X-Forwarded-Encrypted: i=1; AJvYcCXN/NQdyxU9PSOlcwYCzycCtHjBRdVLVabL95lCK4qoB4THoO94576S8zZpxXjKvXYGRk1Ag/U0RyxR5Vg1Q/8XIh/YsA==
X-Gm-Message-State: AOJu0Yyl9wPKWu9mFJ7kkOAhK5ioJ9ie/7ptWr8KrUXLu2fompWLfsVk
	Amtu4LasVZbUdhi4Yi0A1ntmPxcd5wFeo1+v2Nw31amawc6kyBRoAPM5nidGzVo=
X-Google-Smtp-Source: AGHT+IG5/46zhd1eOGmh0ra4YTAm6cqkOsrOZ3nHpxyZmRoQkb4L9iG9KRCKL7XD6RvIzjKFdLIpsQ==
X-Received: by 2002:adf:e501:0:b0:33c:ddf1:4e70 with SMTP id j1-20020adfe501000000b0033cddf14e70mr954874wrm.32.1707824610355;
        Tue, 13 Feb 2024 03:43:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7XrcP98bixIaJaWBm55q3RGYgSAE7tBhAYxKCoTsFS3k+4Ze4N9ov5S7jgh/2kJS+irBO7hxgVQEv5sDqQLLxPDbHWC/Gs9TNJlYjDEdufmt8KqWgoLUap5P3RpuWSetm000MWsh8TG+RUnCiXYaeMS5P0KNR3vebzw4AK/Q7JSo2GChThL92QnUXlhhiqm3T+6Rm3bvBKFEBzRlNWsZ+oOtKvz4oZ5nrlk648f3KJ2YpB/AX8hYJ587hDFDHo7r1dZijD51CXUPKlm5Vvhyal5Vcu8pdKF6uRZUApCiCyWoYNna6+r1jeyiDnM+GrXyNfiI2jbQ39aZMPjTPS8Zd3pV6gPE6Q7iU5e+r5dq5ve8rVNhCu75nGRzfJSoMnFhhSRik6L03/9iH7StxCOiMjhlgvJXp0QLxcfnI7mQfyKBVWxmvK2n71BqvpzozyhkCuO8AO5J3tR81TAvxXYjA7ctciW/JxNy+0RD/Pu/DIgB3TrohH6Ieb4EtEjvFx//s0BbxRWmV5YdUNG0mEtgvFkabj7dgVuJmSkIyba37uRJ9Nj4vceMwV61cZXHq4Bloh/1m9MdaDSFr4L6+ysW0lgb2UhEH255fGSjDzoKUuGFhCI24w+H3rJL0zLOVpS/KYYbMSbqL1GxJsA+mmbtlzt0e6TZAQ/d1Iwa3
Received: from localhost ([2a01:e0a:3c5:5fb1:509b:4241:48a3:e3e0])
        by smtp.gmail.com with ESMTPSA id m18-20020a5d56d2000000b0033b60bad2fcsm9261852wrw.113.2024.02.13.03.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 03:43:29 -0800 (PST)
References: <20240213101220.459641-1-arnd@kernel.org>
 <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
 <c61d7daf-1b13-4ff8-aeae-7dcd8dd02131@app.fastmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Arnd Bergmann <arnd@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
Date: Tue, 13 Feb 2024 12:09:52 +0100
In-reply-to: <c61d7daf-1b13-4ff8-aeae-7dcd8dd02131@app.fastmail.com>
Message-ID: <1j7cj8k2se.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


On Tue 13 Feb 2024 at 11:52, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Feb 13, 2024, at 11:36, Jerome Brunet wrote:
>> On Tue 13 Feb 2024 at 11:11, Arnd Bergmann <arnd@kernel.org> wrote:
>
>> This probably pre-dates the introduction of devm_clk_get_enabled()
>> It would probably be better to use that instead of duplicating helper
>> functions which do the same thing.
>
> Ah, I had not thought of that interface either, so you are probably
> right that this is the best way to do it.
> Can you send a replacement patch then and add my Reported-by?

Sure.

How may I reproduce the problem ?
Just tried with 'Debian clang version 16.0.6 (19)', no warning.

I suppose I need to add something ?

>
> I also sent the same patch for drivers/nvmem/meson-efuse.c, which
> I guess will also need the same treatment. I also checked and saw
> that all three files already had this code in linux-6.0 when
> devm_clk_get_enabled() got added.
>
>> If for any reason it is not possible, a common helper in clk.h would
>> preferable I think.
>
> I can't think of anything that prevents us from using
> devm_clk_get_enabled() here.
>
>     Arnd


-- 
Jerome

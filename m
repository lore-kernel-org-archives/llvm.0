Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD2412AAF9
	for <llvm@lists.linux.dev>; Wed,  8 May 2024 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715190786; cv=none; b=SJ4t1AIwXzN2uHJJPZUcpsnScMT1QlIsPP2PZ6dN43s6spwjr+j2MyytzTNLw8Pr+5/cFWDQq58nFf8Y5vF47GIFpmHT0LHOXGb9KJ5N8ssPtfPlZC28o09dyDZnhd45ssKsM0APnEsAwxvk1eCity6kcC7LsW+0T/ovZk6sdfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715190786; c=relaxed/simple;
	bh=8O4fYZMWhW1IHisxTbuBjvyMlQTTyIfPG8nknj8tOK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyNpGUmmnzHAnmV7cIgMYa9UcaU5S6kxBuKbzysPbaT7MKViw4G/XM1gTJSvkNuVk/Y38WeG+B/mKEK0AANCewMl6KGp6f8TJZqtt1FI9SO+UGXYIFb9TSSJrldV+es4j4yThJFmqLvUHqgT6X9DJkNMPlAWUlgs1ub+NSXD0B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=M7E0K1eI; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="M7E0K1eI"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5210684cee6so3204718e87.0
        for <llvm@lists.linux.dev>; Wed, 08 May 2024 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715190783; x=1715795583; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CDD6cSkxh18P1B/GILc0PBtmaYxZm1FGfsVGarC9pdM=;
        b=M7E0K1eIZ1H7vqJLAVzpvyKN2ASaaorPhFx+kbqC+hXVOEKBMTzTcQr3I8HHvt8TBA
         RsAYWHombdCl98nMQdueBGi3n3cY+PNvnGxennHmssmEMsMGB7ECk/QCuK6hfecEX5V8
         TVFTfWwYdLxHzhGtGrWrho8Qv2DHiMnRTSdd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715190783; x=1715795583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDD6cSkxh18P1B/GILc0PBtmaYxZm1FGfsVGarC9pdM=;
        b=jswRiY78tOricZ+3WmgRDRZHUR0fwR8u9IZK3hqL8KTJ4VgrOJySQHfzqqjGAqQYsI
         GBAElSirV8EgIPKIafeA6zFIgyUr7AmzVSXBDIo+Q9VT6GaW9vJ0UUaceICq8X6PChyN
         a5zWBqlGtd5bxPLVyQc2AZxAR8R82KF6EFaNShQBgJknM1oWAtaabT2sIDbDUrrvLiUX
         XvqjzlpLWxmVa1OgFbFDaUb/X4MKSkBCjHPGcMwUV+1ad1RvGPUcofLekE7YJ3YHess1
         UNxC/U2o3UENAyw5tJe8ISVJnp8s1qyIjfPYqprOUOBFKSXlnK2BRkmE24BYaKc0ZZCQ
         VzZA==
X-Forwarded-Encrypted: i=1; AJvYcCUtyszr+RXhzdxXK572wFhR4t7cfmhAAahHVUqCOUe66WNLpWn8KV0/4uFXPA0dkr/rxT0wyJSoSf7TaWr8qF/3s9J3bQ==
X-Gm-Message-State: AOJu0YxI6VXDpJCLBStPQIgLl/28eq07nqsV/Edr+128+g+ZEIsMLSuJ
	hyqrp3qPYyRXsW5130hI1SBwSs9Kl/EdA1B5Tyd2ZBkzebH/yy4ZQvygilGoIOafMuGz16xhUyv
	vxn9fDw==
X-Google-Smtp-Source: AGHT+IGQ/NVaG1a4AijY+dOohrJic8D7sm19c0HO8dGDjG/Or2BhHwy14RF6KzZ+Utcu9PZ3hz/0hw==
X-Received: by 2002:a05:6512:33c5:b0:518:95b6:176f with SMTP id 2adb3069b0e04-5217cc457b5mr2468823e87.50.1715190782624;
        Wed, 08 May 2024 10:53:02 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id dc2-20020a170906c7c200b00a59aaf2f626sm5586525ejb.26.2024.05.08.10.53.01
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 10:53:01 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59a17fcc6bso1593966b.1
        for <llvm@lists.linux.dev>; Wed, 08 May 2024 10:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVu3KzYezuJVn58hkTivmShv907qk8bpQofnDH2KWutZK3Ty3cnOVYkIDtE/x8egIdPrjV7gV/MeO2ZADWCrTUBGsfweg==
X-Received: by 2002:a17:906:1153:b0:a59:9eab:1622 with SMTP id
 a640c23a62f3a-a59fb9dc8dbmr211243266b.56.1715190781396; Wed, 08 May 2024
 10:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404291502.612E0A10@keescook>
In-Reply-To: <202404291502.612E0A10@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 May 2024 10:52:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi5YPwWA8f5RAf_Hi8iL0NhGJeL6MN6UFWwRMY8L6UDvQ@mail.gmail.com>
Message-ID: <CAHk-=wi5YPwWA8f5RAf_Hi8iL0NhGJeL6MN6UFWwRMY8L6UDvQ@mail.gmail.com>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
To: Kees Cook <keescook@chromium.org>
Cc: Justin Stitt <justinstitt@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 May 2024 at 16:27, Kees Cook <keescook@chromium.org> wrote:
>
> When I say "overflow", I mean "overflow and underflow", but more
> specifically I mean "wrap-around". This is not about "undefined
> behavior". We already demand from our compilers that all our arithmetic
> uses a well-defined overflow resolution strategy; overflow results in
> wrap-around (thanks to "-fno-strict-overflow").

I'm still entirely unconvinced.

The thing is, wrap-around is not only well-defined, it's *common*, and
*EXPECTED*.

Example:

   static inline u32 __hash_32_generic(u32 val)
   {
        return val * GOLDEN_RATIO_32;
   }

and dammit, I absolutely DO NOT THINK we should annotate this as some
kind of "special multiply".

I have no idea how many of these exist. But I am 100% convinced that
making humans annotate this and making the source code worse is
absolutely the wrong approach.

Basically, unsigned arithmetic is well-defined as wrapping around, and
it is so for a good reason.

So I'm going to have a HARD REQUIREMENT that any compiler complaints
need to be really really sane. They need to detect when people do
things like this on purpose, and they need to SHUT THE ^&% UP about
the fact that wrap-around happens.

Any tool that is so stupid as to complain about wrap-around in the
above is a BROKEN TOOL THAT NEEDS TO BE IGNORED.

Really. This is non-negotiable.

This is similar to the whole

        unsigned int a, b;

        if (a+b < a) ..

kind of pattern: a tool that complains about wrap-around in the above
is absolutely broken sh*t and needs to be ignored.

So I think you need to limit your wrap-around complaints, and really
think about how to limit them. If you go "wrap-around is wrong" as
some kind of general; rule, I'm going to ignore you, and I'm going to
tell people to ignore you, and refuse any idiotic patches that are the
result of such idiotic rules.

Put another way the absolute first and fundamental thing you should
look at is to make sure tools don't complain about sane behavior.

Until you have done that, and taken this seriously, this discussion is
not going to ever result in anything productive.

                    Linus

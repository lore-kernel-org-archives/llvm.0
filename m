Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFFE168B8
	for <llvm@lists.linux.dev>; Thu, 29 Feb 2024 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709169642; cv=none; b=U7rWiHASY/rqthRlZ4sl7B189xFkYCmwa8tLcnFkfH2Zq7r/UXDSxRfKUwDp+aNCuS0bnUS0861qqtpBFMdwS1uVV0VE40YdIHZ40nPdiqnDcI4tQ3FbzdKfya9EgB75XvAAPH7sPsF7KcB+w8vuMpx7T7qPcMWr3ChZBPRlpW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709169642; c=relaxed/simple;
	bh=vErBZyjJ3yM0jaH8Ik5aT7QuifA4uHCNsWPcG0ae9yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svFQMLfOrNaJZ9g8zf+gfyXvUuLdkjMfvcLUhgt6mzyCAuS2zkcG9FEYzfq3V0iXxl8k43P+DVGyH5L3ho7yiHt7S15c1k/e7S7xvD8YaXEEZfFzYHSootsIFtMEGy5Kbpzs84+L8gv/fMofblry2XMY9u+8K8Ji/T6ayej7YKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CJGdi7HF; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CJGdi7HF"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513160a49c1so1580e87.0
        for <llvm@lists.linux.dev>; Wed, 28 Feb 2024 17:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709169638; x=1709774438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vErBZyjJ3yM0jaH8Ik5aT7QuifA4uHCNsWPcG0ae9yg=;
        b=CJGdi7HFcwQOAWOScuKPdyeNIwRRWmqG6gB3vYz4YJu9tnR1ovMYAncfiNXMcM3nwx
         Ij3Gpqlae+2mB3zVR5FksPWyznz57/kPVZpS6O3F/72qkxhZYDYZbo24PxqtpXFllMdT
         WC7dMlEr1zZV/wK0AU8v8GsQAtNKMin7Cms24gqnFfDKXP/KVv94+DI3LkcThGgJlLlW
         mjwoS4jAFPyfoyyN9iTK6FndGln4a7x1+r5DrHvNqRtEI/21vaYOvjogbA3tx+pgBnsa
         PfAiStylIjN7o1Ez2nWyScGrTzQPfRZvrpVWgAXHMFr/o4yvdbqX473vufv7TaN20Qhn
         EAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709169638; x=1709774438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vErBZyjJ3yM0jaH8Ik5aT7QuifA4uHCNsWPcG0ae9yg=;
        b=Z+8Q556ichSYs4sxbvJdvxKzFLaUvubTEJoGPIDxkaK7+kRmyjDteaY+exQPrenpNm
         exIF47ISHUisvWJYf/8cn0XJYTJk+5J28ziwL38GVLWwuw9Z3ykpcKzVoceekXcrz1jU
         ncKLzSpJ/awZ1Gs7w8TkhvPl/m5tR2DbvJyMmtz2x7Lw8+hk4Xfzyki77VM2j/SCHaxX
         jbOi5RiOTkmBoDq8F182+wCWv2YUZJgxesd7dRLfEHIaNM2MAwLhOwNKP68Y1dH4gReG
         mzxg9brD+RneuwR4tT0/spjecDXSFsc9+9pQRS6/CkPoLek7Nn5EYScC4xK2V/Vfev6h
         QEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLinCe5ypIv1OwbMm5bQh7oYTjFPOGbTh36INL1D7kRZ0f1UWYobX3lMp+W+2D8PYW4cn/S1/5kLo+fm6TgQMPsuAtoQ==
X-Gm-Message-State: AOJu0YzXT6KAkOlInQDdXM6DxjEURske1VDltjDKI53qRu57p3ISkhQJ
	rymIlPn3Tk6rvCKYSDLuLyOGVtlfkX05gwEeNj0Jx72S8sVxTVY4cLn1dljb0MCgRJTBHv4HIcE
	IZA9HEnsiyPth/IJJTUWx6hmIWn0Pqg7kjwg=
X-Google-Smtp-Source: AGHT+IH+1faJQ6/uhk0gfw8WjBzEoA6yFwJGOjkqCCQ5VIO4G5fNEb/+XhhhpVB3yiDXkNVFX0KRVuH2xhjKWBo/N64=
X-Received: by 2002:a05:6512:1247:b0:513:1cf2:e14f with SMTP id
 fb7-20020a056512124700b005131cf2e14fmr45944lfb.4.1709169638465; Wed, 28 Feb
 2024 17:20:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240228140152.1824901-1-arnd@kernel.org> <87msrkhcz6.wl-tiwai@suse.de>
 <1265517d-b98a-4ec6-9215-10cd988ff78f@app.fastmail.com> <202402280925.5B709A60F@keescook>
In-Reply-To: <202402280925.5B709A60F@keescook>
From: Bill Wendling <morbo@google.com>
Date: Wed, 28 Feb 2024 17:20:20 -0800
Message-ID: <CAGG=3QU33tgfN_veiJWooXy2EhfZzUFkJZF3XdjSLE8fFCCkOA@mail.gmail.com>
Subject: Re: Clang __bos vs loop unrolling (was Re: [PATCH] ALSA: asihpi: work
 around clang-17+ false positive fortify-string warning)
To: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Takashi Iwai <tiwai@suse.de>, 
	Arnd Bergmann <arnd@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 9:39=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Wed, Feb 28, 2024 at 04:03:56PM +0100, Arnd Bergmann wrote:
> > My first thought was that clang warns about it here because
> > the 'u16 adapter' declaration limits the index to something
> > smaller than an 'int' or 'long', but changing the type
> > did not get rid of the warning.
>
> Our current theory is that Clang has a bug with
> __builtin_object_size/__builtin_dynamic_object_size when doing loop
> unrolling (or other kinds of execution flow splitting). Some examples:
> https://github.com/ClangBuiltLinux/linux/issues?q=3Dlabel%3A%22loop+unrol=
ler%22+
>
> Which is perhaps related to __bos miscalculations:
> https://github.com/ClangBuiltLinux/linux/issues?q=3Dlabel%3A%22%5B__bos%5=
D+miscalculation%22+
>
The idea that there's a bug with the __b{d}os builtins is
controversial. The consensus among GCC and Clang compiler developers
is that returning *a* valid size, rather than the one asked for, is
okay as long as it doesn't go past the current object's max size. (I
couldn't disagree more.) There are a lot of situations where Clang
reverts to that behavior. I'm working to change that.

-bw

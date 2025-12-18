Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7471487E9
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 20:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090068; cv=none; b=K5/gyF7g36GI7WDe0tVjmJlByDfGOxe/KhqAdf8lPDi+QFneq0mliQG9L8+9wss+qt5rTQq7vcS6XfVo35d75TLkuNl/vLLjMUatG5ulLo0SG/i3KUA1vIgzCIG77Y09gERLdUVzYw7je5QwByE23uxrwwmEjXSxgFSsDN1g32M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090068; c=relaxed/simple;
	bh=+RowUUrYtzXa4i9REDNRtB7NHjBBJv9ASqbqnaOrOgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDdZNzzjLOKJn4qlAIaYD5Tpvtxe8P/LXVrFKJHxMx8LTurB9W/OTVeNxSpLbdxC0mC8Xi92wJxH5QX6dc86bW5VdcmsOIHjnwdpyrM11xhTBgUmGdH6vA1UYgUVCAvXmnyCMyXQz4206fHjjiBBNSy5d8o/+toJBYN4rQTW56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cCcXhkJf; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cCcXhkJf"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b58553449so1416616a12.1
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 12:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1766090064; x=1766694864; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AFdyme3OdkfY6SG6LYuzpXFnNfm347qWal7RaQqaQwE=;
        b=cCcXhkJfJYbC2QRsr+5AhQc7BJtvLojHh1blSknzg3U5qVJyzxjRyWK9cwvPj3i6Ks
         hDu9CojugbztBgXcDTddYlC0OmY0K6z/h8x0ibjr5CJAZEIgR2seYgYEufavjZLSPj0W
         ++ujti2/VpLDXbI2N5Tr3F3ItvVNwMd8ckwZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766090064; x=1766694864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFdyme3OdkfY6SG6LYuzpXFnNfm347qWal7RaQqaQwE=;
        b=kwolEjZ55B5ycwl2+i/MYyvXJCgoTqweYEpdzHH7NnMRzafJ1ApPYLJ1hap8n/J4HB
         QNxYAdN3AOzs9H3CvA9qm5s2QqXs4WN+tuMt6RPprEWMDd59yXtG7hIWno+kalhHgUSm
         C3rmpZC+A4uXDkkYMB469kOHEcm11z4JUyCKpjsX7FXVmB2o8pKsvLCbvmxdlfVVTPGa
         CIQwsCbcAQPpd2PQzzZ+46iMCW+qEOmINHuyjQ98uQztELLeONXlOBrzy6MDs/ftJxaz
         Jxwob9jrpuZ2m9GEEmL68sbrmhQ+Ot8Fdqvg7twGVaWAtMtVYpUbLiGVL8m/r7IF+Eh1
         KGyA==
X-Forwarded-Encrypted: i=1; AJvYcCWAT6WUIgyEMwqT80OlAZNe15TWro3NNRAC4GoOv37iDoiN6YUPARztOxS3ony+DxURo7uu@lists.linux.dev
X-Gm-Message-State: AOJu0Yy14JhnRouxUsNUTqcBfZbOQfA3gWZBvpQkIyRxgndUjT86O95V
	2ATwDLaTCyYI7icRTeIjsP/jMkvspioA4YbXEi/XKYVEuN/lEI/85z4TZcZYQEfxaTBYLhEyDol
	yRUK69nx+JQ==
X-Gm-Gg: AY/fxX6cXVm1ba3QLKtbNED/RIXSAVrQmmXS40z/yBHQZCmttq1g0HoyrzvygxTwMQo
	30flzeaaGdMa6SnZRSB0FIct3RYIpwWuzKjZheS5AdtgNiGaazBY8gPfTT5AojVLImwSgCx7wsE
	t+KwZN3NG9qc9Pw+fU7gzx3l2W0E4JRN9bPy+7Yj0lcLlLeqUDwh4PBllbih9VaenETh+xhgjxz
	a1uR56OYgAbNa5p4oJV8tOhWA8TTGN1H5CQqYXy17G4tJTgKK8l7cnbEL+hvcYfFnXX/COm6zUk
	wotF8c3+lo8k1UWp1/GCGUWJlL+9n3E7CsPhiHjHe1N+ALAN4OkV/4Q9V7dbDnjTlT7Nfnrrrd+
	Bd+gHir2WfTIBKxhl2SDWnGKgh+QzyDPRQ4qUttRm7dpalaKQJA0VQy8lCLuBeH24ruBT9Lwp7E
	mvgf5bM7LNHbb0XaHSuO0pjFKEicELbO6wKgakaoL2235F0CssHV4NxWu3cpPY/zNn25yJBEc=
X-Google-Smtp-Source: AGHT+IHzTVgTgGHXrPVS8eZwTJloOBnrEQMkJ693mhelvBAznIiH8OE7FxSno2HVGKJFGTsoNp1GPg==
X-Received: by 2002:a17:907:720a:b0:b7d:406f:2d3d with SMTP id a640c23a62f3a-b80371da8dfmr65220566b.54.1766090064175;
        Thu, 18 Dec 2025 12:34:24 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f37ee8sm30742066b.59.2025.12.18.12.34.22
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 12:34:23 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-649822b4b64so1521652a12.3
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 12:34:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVD1zSzuq+B7jsn5RUv8pckvk7VqawKrrj0q4pU8ilF0zZOzh1ols/OiCHZJrCa20WbEVOh@lists.linux.dev
X-Received: by 2002:a05:6402:1ec8:b0:647:532f:8efc with SMTP id
 4fb4d7f45d1cf-64b8ec8f844mr669213a12.33.1766090062459; Thu, 18 Dec 2025
 12:34:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org> <20251218202644.0bd24aa8@pumpkin>
In-Reply-To: <20251218202644.0bd24aa8@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Dec 2025 08:34:05 +1200
X-Gmail-Original-Message-ID: <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
X-Gm-Features: AQt7F2qOKBa-zo7QJgMQveUGo5xuaKkhNSphimTCrBEi3RG5l67qg5BeTDIQqhM
Message-ID: <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
To: David Laight <david.laight.linux@gmail.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Dec 2025 at 08:26, David Laight <david.laight.linux@gmail.com> wrote:
>
> One possibility is to conditionally add _Pragma()

No. That compiler warning is pure and utter garbage. I have pointed it
out fopr *years*, and compiler people don't get it.

So that warning just needs to die. It's shit. It's wrong.

The sparse patch points out that this *can* be done correctly if you a
compiler person doesn't have their head up their arse.

(And no, I'm not claiming the sparse patch is perfect. I'm only
claiming the sparse patch is _much_ better. Bit tt could be better
still, and there could be other valid cases that could be warned for).

The "warn on type limits" is idiotic. It expects programmers to have
to always track what the exact type limits are, instead of just
writing safe and obvious code, and it warns about *good* code and.

It's exactly the *wrong* kind of thing to warn about.

               Linus

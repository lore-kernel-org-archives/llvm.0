Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4197F
	for <llvm@lists.linux.dev>; Wed, 10 Apr 2024 00:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712708064; cv=none; b=CiKtCR5Ef7/yPlFKI7rme4Vj0FnyoDxf5MDawE7kAxUaOdMYDsg9vkHmCq2aBx3wR+38ABPxo2jnArJioxy8MkrRYLIypGyqnbWCQKeQDk72us0X5q9pyBHFgpecjg/g9hxbLwqnR06snSNBpzvE5ym/zEKioLnYEH6wCnAcmJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712708064; c=relaxed/simple;
	bh=hylFjz6L+qK3LEVxEOjE2ZqRGFqT9dpT501eKt8B9PA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ls0rmk149vvBMtCDAStyHP1Vz87dQCQPUbL9YtGtGHhbrL3JYCWVlY68lmc1FyQgDzzExMrsqfYWdQRLFsu/DCIvrl6PY4I7olvMyKpgmZD70fSPmMrjdsMLMs2/izGo6UIuTRwjMcAdW51PJ2h4mDADMt0IbWJvGtXbZFK8CzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G51pgmBZ; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G51pgmBZ"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcc58cddb50so9733074276.0
        for <llvm@lists.linux.dev>; Tue, 09 Apr 2024 17:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712708062; x=1713312862; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dIbdZOv/vPHtFRzVH0oN0bjB08U1X8E7O8JyibswoCk=;
        b=G51pgmBZdb6oub8T+FgOSTZOva56F2lKmGs0x7s/gzRR7yGUWndmr9lCsC89l59bh8
         C8jbr7amH5J3JCyojo/4+pVGSSoHerxVSElMQA/4UklOKcp4JnAsau3FIw+x6olCF0+c
         wmSf+TtNdUKziNx3v5BBfME6Ksbdcf/i9pNcA25eGyy/YOH0eyezgsoKCNP5NDJaKRtz
         i0ToRz56QFUXpK9phtYefB6QfRQESjuVrpFkFttelfhcYtp86EB9RvSAiLlLVFt2qtkp
         RqePG4cXURbKjNn/FjfoIUfh+UXwyEGLv8GlbSlUKuB0ftglkwhpRNVxJ5Df3+87jXgI
         EDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712708062; x=1713312862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIbdZOv/vPHtFRzVH0oN0bjB08U1X8E7O8JyibswoCk=;
        b=j8AuiF+xYwZTUyhTs1Msp4NYk2sZNx9RAwggYLGpgl3e+e9So68c0yi/OwLuRjrydS
         EXAsQttPKgkbdgPBRjYar66Hs4N9a2C5N9bxSvleW2yUqBudNSjve4nW+nUv2lJW0n9H
         LMjuEz/9gymm7DfJTTGl06vqeeTfftbISrunPH5rudQ6xr0kL4Er/QbQDKjOhhUh5nE3
         OhCNAyImDoq2kO27dxtT9Ln035QRuh2mXflscvEGxLXE9I86W5btvqy+umgufi6vxKtw
         kCnhSSi5l60OVT+YYqa3A66W7EOtii4m4SrMliTJQ631yY7RjDdyU9GvhhpNTBN6uo/T
         wMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMNbw+Xx1mWvCuNjUtXHWXUWwm8mrImYAufA+6qF9D9ryW70V3zYiWEVFmpkSzFJ6Af3Shwl7dfnjziVKRIwlspcCB7w==
X-Gm-Message-State: AOJu0YzJUmV+iBth5ItRh8EHvHtiMWJ/9w9froLWJYEKz7ylGAZY9HG4
	MwsHyAQqfOCyycktU11ZIJO67NqLkn0o5tA7mykdXG6vvTU3YasCpB0uLPQLTqtnKOUCrEq2zWd
	BAg==
X-Google-Smtp-Source: AGHT+IGGO4GWmzQYviQp1CVozWMLXLtrysbsNAF3g8Mrch1Hg1xHRMGTrIYNUcBplo2kcfvLH30UdpXAvJU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:f82:b0:dbd:b165:441 with SMTP id
 ft2-20020a0569020f8200b00dbdb1650441mr387148ybb.0.1712708062334; Tue, 09 Apr
 2024 17:14:22 -0700 (PDT)
Date: Tue, 9 Apr 2024 17:14:20 -0700
In-Reply-To: <20240409160920.3bfe3eeb@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240409224256.1581292-1-seanjc@google.com> <20240409160920.3bfe3eeb@kernel.org>
Message-ID: <ZhXZ3BEcbtoJKPFM@google.com>
Subject: Re: [PATCH] selftests: kselftest_harness: Print empty string, not
 empty fmt on PASS/FAIL
From: Sean Christopherson <seanjc@google.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 09, 2024, Jakub Kicinski wrote:
> On Tue,  9 Apr 2024 15:42:56 -0700 Sean Christopherson wrote:
> > -	ksft_test_result_code(t->exit_code, test_name,
> > -			      diagnostic ? "%s" : "", diagnostic);
> > +	ksft_test_result_code(t->exit_code, test_name, "%s", diagnostic);
> 
> Have you tested that to make sure it doesn't change the output?
> 
> .. warning: ^^ leading question ;)

Heh, I was *this* close to adding a blurb saying this was probably only compile
tested.

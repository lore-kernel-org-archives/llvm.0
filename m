Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761F13D34AD
	for <llvm@lists.linux.dev>; Fri,  6 Mar 2026 19:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772825120; cv=pass; b=WxzmuVVdUkq6mbXV0kND8IfLlpG9hNCsHG8aS6rJ5TtKM8s/GRoeOQbntv+tbTw3lHSK0yF1+DzuYXBZvKjmGybPFUYYBBA3iyH/FLHEhqQoWtkj78xAToqGCVkvvve6ULgcq2dmNmvxg3LiTb1OKnl2rnkgrqBFTOkNkPj5TuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772825120; c=relaxed/simple;
	bh=nSRTaUyOy2CdPO/r9tq8gDn5OQlNwlgXiGGi6Uex0NU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNVszdHDB1NvX+HXKDfSm3+l7jVQdXXJIW9wI7PPiaAsNSK65bDSQtl8k/mV/xFSv5aDsslO/3/YxdPMym/ydSy/hwT10K4Mmu8T54NU1kJekYvXIYkoesaDweTDGGR1SasJtVcdJ+RMVlP5bf2EG6gl2JfB1lTp2IIFlzcwDK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5wT04QS; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5wT04QS"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-649d589ab0fso1014138d50.2
        for <llvm@lists.linux.dev>; Fri, 06 Mar 2026 11:25:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772825118; cv=none;
        d=google.com; s=arc-20240605;
        b=OcayPe8kHtex+oRlEAc6n/CkWEtNJg51e2pgme5JMIoFLsDGasdsfpqJU4GPeQ5swO
         Smx2Fi3FqcS5F4p1St0vvS+dLKV0dDude0FK/bcqc7K9kj00lBwVk2pWmWzAd+2HlJjt
         eqTTb4YQswRDYu9DIUyS8FNzaiFMDmn/hyg98o5LuBpjkQnExjHmC0oduZVwQk6d8PdT
         YAHVooeYwSDWuR32JkofIOIVIEj8th0Vx1N331AmhMC0e9OOdedxtXTOmjKPVYaHSLQi
         Lm9Q5x7yNGeo52mt1WCPaA19Diw/P3QEGCsfgcLCdbhwClpaVPR1t9MmAsP3hnXWW8sy
         O5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=lY6sP4liFUCfsR0JZcNZnSXYRH2hTABEqRhwR3Jxfn0=;
        fh=FF9NgGq5dojYRPCVfxFxolLgT/E4YOYUmikWC032wio=;
        b=a5AB7e/C6NwTgBj9SsuEKjRbJ+Y80uQYqf6mERK4lv4Qf23t6Cs4OBkqB2ZwhTcDuc
         r6qCBfQT9ARDlU1h1Z7Teaubfhg3WPBT7JGSF3nDeuwxFduTfFgc15egAdcgxGrDB8py
         DohTTISsNZOh95GLJcNde102WYSlThuYp5iXqYEPblXv/sUZtFJiyU2KTsBYc1QrGTo1
         7V9BBF/Ui5qJ6y33pFzcPRTR8+OkOEXgUP73bGVIVTDtKzmEqML9FHAB56FnUdqefVow
         OgNp0Z+4SHv80MXyR2E6AnuuWLVsZG3yDTl3JF8M0c1J20FY60QIHlLyZuE6Bg5/gffX
         ZjRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772825118; x=1773429918; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lY6sP4liFUCfsR0JZcNZnSXYRH2hTABEqRhwR3Jxfn0=;
        b=I5wT04QSAnEQLI2Ro3S0vfZBnnRMmNCPzFkaU/r1xv2qUVyaeYNZIsd47b1PNB4ZUJ
         Hu5FQniGoredWdUxOjujebzWsMqq6g9wBx7WBYw9bUloJfDZLxK/4CP06X9hraKb+tgi
         rkzhCqBmXuSbvlv4vkI8PRmawzdUydm7xRUcswmqNZTNc3lx0fKJ8y2RO8unwqX7DPLI
         0SYMZGXIMsICwD6uc32zXFIKkc1WUOd3RQ0gUU/roCC3XZ4tRPCdEd7HxVJ1xjed4xqm
         ZDHUQ4VRbCutRKzuPhDet0Iq4IUWWAXmkTqEoXEmVTXknS317DbuebEuJKfqEpsAOnBd
         oBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772825118; x=1773429918;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lY6sP4liFUCfsR0JZcNZnSXYRH2hTABEqRhwR3Jxfn0=;
        b=htGaK8paO1yELBNwBO1UAVgHOp01QLPFVtjMxwnAiz83VlAJAc3vGwMpR5ic/hZIrb
         62SiXJWmVly8G6Onqe2LvLnJfFitTKNO0ySbMmELBxjajVWj6tZovQOeb8EBx1Z6hkdK
         Zj+OIS9V5SVRRuPdWJhIK+DO/KtJC5BNtITIgPNjqRv+bsx0mxi2FJQFiT5lzFLjp3mV
         +Bp7oypFYFa5s/Owq+SYvhLbvRWI21G9xMSJGlrAxX6Q/8ZfqvmoV80+NOBtkbCcq8JZ
         19iyBxxKe+Xmuy1hHV3jOX7t58OAfVJXABPGqVF8llqBi53z5mDP7+c/YvuZIm2JOYiW
         8jqg==
X-Forwarded-Encrypted: i=1; AJvYcCVfUwZO+fn566eWtKFvLY2WQrk6b0MWWZfDoxwt7xpuUiGRTNYeEs4SGyrJ0vQbGVOFOr1r@lists.linux.dev
X-Gm-Message-State: AOJu0YzNG8bMIxMKakAEpojSbLD9G+M0t6pNQ/6JNe9YN2RWBENSVuwP
	30aTG4lJmHrJnGAnwAxzeVDd+xI7+FOq6kRdeEOivuwKOaGkThMq/w9LmnJqBbq+gv3GIJSGJa7
	t1PTdRr9s97ZFvNgRjzDu98SOX+1z4Kw=
X-Gm-Gg: ATEYQzwAdkXXttC+SnH7GAe8mFBI/cbxUTBnB7ZqnLiWPUWPaEOGayNbS0hT+DjQLiq
	1Xuzepu2avGE506WY+NZZLm5k+ZrCBCKvxBWLv/xwhgDKKsDEaeCx//uN2fP2illYn2kbOcxqdk
	AswvbTl1+VrCfGQ6+GW3Dt6ksF7YabI11QkJWyx8JWSmx6wXLDde0KebEvGwD/gb/C25WrUDQqQ
	nNs2ASaXRHdtIXQv69FVuinK6uLmlNug0dRViFj4IMB8r663c2KVM4rGOtxW6CY7DE0wI+LhqGU
	6g3p1A==
X-Received: by 2002:a05:690c:15:b0:798:5ce8:f46a with SMTP id
 00721157ae682-798dd6f5b17mr24082977b3.3.1772825118598; Fri, 06 Mar 2026
 11:25:18 -0800 (PST)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 6 Mar 2026 13:25:18 -0600
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 6 Mar 2026 13:25:17 -0600
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20260306150613.350029-1-arnd@kernel.org>
References: <20260306150613.350029-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 6 Mar 2026 13:25:17 -0600
X-Gm-Features: AaiRm51im8Opzhh4FrDhukBOYJIJAUVnJyGocvgFTBcd1zQhrlQ-HbSj120EYv0
Message-ID: <CAPAsAGzSybyM_GsP1JxzZTj=SFeN6K8t9uQ3XAXBWiN+019Wmw@mail.gmail.com>
Subject: Re: [PATCH] ubsan: turn off kmsan inside of ubsan instrumentation
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The structure initialization in the two type mismatch handling functions
> causes a call to __msan_memset() to be generated inside of a UACCESS
> block, which in turn leads to an objtool warning about possibly leaking
> uaccess-enabled state:
>
> lib/ubsan.o: warning: objtool: __ubsan_handle_type_mismatch+0xda: call to __msan_memset() with UACCESS enabled
> lib/ubsan.o: warning: objtool: __ubsan_handle_type_mismatch_v1+0xf4: call to __msan_memset() with UACCESS enabled
>
> Most likely __msan_memset() is safe to be called here and could be added
> to the uaccess_safe_builtin[] list of safe functions, but seeing that
> the ubsan file itself already has kasan, ubsan and kcsan disabled itself,
> it is probably a good idea to also turn off kmsan here, in particular this
> also avoids the risk of recursing between ubsan and kcsan checks in
> other functions of this file.
>
> I saw this happen while testing randconfig builds with clang-22, but did
> not try older versions, or attempt to see which kernel change introduced
> the warning.
>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: kasan-dev@googlegroups.com
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  lib/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>

Acked-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

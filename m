Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD1F6FCFE
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 22:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0f7NX8Ux"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3334d9b57adso118711f8f.1
        for <llvm@lists.linux.dev>; Tue, 05 Dec 2023 14:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701815154; x=1702419954; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlRvcm7L+cBAIszdYTxuMdD16SmRomd1bg4ss68VhyI=;
        b=0f7NX8Ux0jabauhH5R0aKnXfTWidrSRoAITFh2A2gjGhnDVhK13Mu9JifDff8kDHYx
         SBbTD/vDLXxNdPxPaGCe3uFnAgIigAaS18Tnjbe93M9phZM5c+j1YR0T+SHLezKxIcxQ
         71tZrywg1yMHQgPOPgJrXy87qBBbbaoiXePCvKo7RqaZ+OuD7fVfrgvqTAoAQcVEq9Cr
         BPjI1zRH47tHF8KEPp9W1hTZfyU3AmGZMj1XitEkaKlIvPoFVizznJZbCD5M/lrFKYd6
         PQVm+fV+s5BUbZtXSPHIAltGWQAScqV+qZeHynZSYbUsVTkQdSxsvmKkdb62EASEtQgk
         K6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701815154; x=1702419954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlRvcm7L+cBAIszdYTxuMdD16SmRomd1bg4ss68VhyI=;
        b=FtoKROoyGnU5aFHgh1TDJxLyZy5hLtIUIO4IL/7wQODbAVfGp8HfbP+UdYPrhrV7gz
         gcKZWtCgDxNcykr8BSe50DSOMhSPMNJOdv/fX7hnKWwaWQIFBBfPRXMXWS+E6YVa7J5l
         segpP6l3TcOWmgY9yVNjiE9u2AGfuihB+GM9D8HHJQHe3CL+1buBUIlO17XgQYl6yhi5
         BaevA9FwV5r3Xnxj3SPVc5cZc6E0O6UeVZzB9sBeaVmMSdyncTnE4UmR0G50Sg8hvFbn
         ls+REKeobhaX/12RmC3NrynGyqVlpCTRN5ET/JUYZ2PJmK1QRGJ5bXDdLbl/LUEKDfWu
         kOtg==
X-Gm-Message-State: AOJu0YzHo9Al/jEDCM5krYkGW/CNQsW3Nfw6K47USR/9AHvynOyDoc1k
	H7xFJV7xFcc0+luBfRMnV2bnW3wrA8efOLRQ72Vxbg==
X-Google-Smtp-Source: AGHT+IHF7C4eMuQFihFrv8+8ynBjYGzdmiqKV5qMKe3JCWHAeoQ6T/vXYIaLbgU2DeTIXJ8mWuYYqhOravlOhhfavug=
X-Received: by 2002:adf:ed12:0:b0:333:2fd2:813d with SMTP id
 a18-20020adfed12000000b003332fd2813dmr4815585wro.90.1701815154097; Tue, 05
 Dec 2023 14:25:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231205-libstringheader-v1-1-7f9c573053a7@gmail.com>
 <20231205213807.GE1674809@ZenIV> <CAKwvOd=2VASkaLvjU+7kkbvhu2CimYn5KUGJBDRePyUhtrNK2Q@mail.gmail.com>
 <ZW-d1NZRIvmJlfcW@smile.fi.intel.com> <34e27c57-fc18-4918-bf44-4f8a53825361@infradead.org>
In-Reply-To: <34e27c57-fc18-4918-bf44-4f8a53825361@infradead.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Dec 2023 14:25:43 -0800
Message-ID: <CAKwvOd=bZvLz4yRqet6Hv2O9iZYfGr=xiwfk+-MAasPjK7XnWA@mail.gmail.com>
Subject: Re: [PATCH] lib/string: shrink lib/string.i via IWYU
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andy Shevchenko <andy@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, tanzirh@google.com, 
	Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 2:10=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> I have an unpublished Linux Best Known Practices txt file with
> this "rule" and some other info that I have collected over a few
> years. I wouldn't say that it's up to date. Anyway, it's copied below
> FWIW.
> Generic drivers should not (do not) #include header files from
> <asm-generic>. Only arch code and arch-specific drivers do that.

Ok, that confirms my understanding.  We had picked up on that
convention, but had missed the one below.

>
> Don't use <asm/header.h> in generic driver code. Instead use
> some <linux/header.h> that then #includes <asm/header.h>.
> asm/ headers are implementation; linux/ headers are API.

Ah, yeah, that's what we missed.

---
You should publish you doc somewhere, it can be helpful to refer back
to them when you're on a different machine or to point someone else
to.

I keep notes like this myself for debugging LLVM:
https://github.com/ClangBuiltLinux/llvm-dev-conf-2020/issues/3 (and
recently gcc: https://github.com/ClangBuiltLinux/llvm-dev-conf-2020/issues/=
4)
--=20
Thanks,
~Nick Desaulniers

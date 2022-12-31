Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C72F44
	for <llvm@lists.linux.dev>; Sat, 31 Dec 2022 15:30:49 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id v126so26298082ybv.2
        for <llvm@lists.linux.dev>; Sat, 31 Dec 2022 07:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JG8JkGizHk6OOlCN3XUOXJ3kZY3cgZs7QsL4MTDQgDE=;
        b=n8oLluZQpcfXatNmm1scwWitiRMGtbMUnTQ2IG347RR+LDQYiiouavkARCkcHF7U9+
         Hmck4dAVIe5VR3TCXCicDeXgSkVi1lYR8/8t9gB4RmKFbKNE0a0s8xlhbnzPwRbh4XQ9
         AN9Zkb5bYIx277isgokdBGNfz8jayyX+/+9dS7n2xn4kCBwq8rM5G19T24fPjNE2azcy
         Co3dBDIpAcR/jKvsHguL+Q1BVJPM+SLjkhjOKTtaiJwD84BifgMXJ6VS/EpdCfIc9Bdc
         R18yG36V6ANIO8L76cuiOSGIIBvvlCltQLvdyFe8oOaNzji+FHfNPyCfnMt5O0oMnXFI
         XqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JG8JkGizHk6OOlCN3XUOXJ3kZY3cgZs7QsL4MTDQgDE=;
        b=uuClKylJdsgENr5C3mORq7tMaX+cc3z4M/B/mdMDOtgxEC9ZPGc/l9tGFALu3VKt3M
         4Y2zl1chE+w6NTxbuHxkarIrtuhe8fRgLRTR1fl4NObAS5GO7vXZxjkcrOrTVn/Xn2Ow
         9paBwYRxCkHwGFMZXNcbELpK6+0mj8qx9PEiPrbHRdH85BHvWXJGFiU6oDAdq99MIJ8G
         sjaP3hS5hNZ2hxUm20CPXlph5QUEjLdht2vUNVslL1U3l+/9WxZRtGH3scEb9v08Sfhq
         eu3wWs9ZLFzWKzdBdidS9107rYcgeANd3hEpqIUCzBpSbNf720CG9UT+uNxlEzh4Ldnk
         X2Bw==
X-Gm-Message-State: AFqh2koi6R0Oa8teCmwP1RH3WMTl6W+/2PPQlOt0Har5QMaUtpMF1Kg1
	3qsKtN0WgghvFui+zASRPy8g+YYIpj7rJibuVsU=
X-Google-Smtp-Source: AMrXdXvVNXKjofXjG2tD1fK9j47fIGvuVoh+trQG1yqh1vM6hpHKOkh82Yz3mKC0GUdOL1Gd1da5HgfXej1RE6ZZWm8=
X-Received: by 2002:a25:7653:0:b0:6f9:13cc:de91 with SMTP id
 r80-20020a257653000000b006f913ccde91mr4131006ybc.328.1672500648107; Sat, 31
 Dec 2022 07:30:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221231064203.1623793-1-masahiroy@kernel.org>
 <20221231064203.1623793-3-masahiroy@kernel.org> <CANiq72mbazF7b3sbH=9F=cHbTB_np=os+YzUPCzh=4HgEHsEKg@mail.gmail.com>
In-Reply-To: <CANiq72mbazF7b3sbH=9F=cHbTB_np=os+YzUPCzh=4HgEHsEKg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 Dec 2022 16:30:37 +0100
Message-ID: <CANiq72n7hjdSJGB0qSXJtXOgR+58zZ657UrCnZRRFWyArUOOOg@mail.gmail.com>
Subject: Re: [PATCH 2/6] fixdep: parse Makefile more correctly to handle
 comments etc.
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 31, 2022 at 4:25 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hmm... I couldn't apply this one, it turns out `#include <stdarg.h>`
> is gone. Adding it and adjusting the patch fixes it.

Ah, I think you created them on top of kbuild/fixes.

Cheers,
Miguel

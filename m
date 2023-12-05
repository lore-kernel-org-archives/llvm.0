Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577216FCCC
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 21:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I9dTeggI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3332e351670so137114f8f.0
        for <llvm@lists.linux.dev>; Tue, 05 Dec 2023 13:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701813469; x=1702418269; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWmm3+4G7HJVcv2X2DUaAz47s+8+x8VIlkxgLxuapbQ=;
        b=I9dTeggIrruuZsSfNCqJxc2x0Ym/lLEppicv793RHQEdb4d6joLHjjeuSuTqJoxmkB
         Vd/QtDAhkdVjdpS+ZY7amX41h99kavr05mQBOMCycqLlM6pQfCSi6mw7xHsKjrqAMmA8
         q6EYR8KrX68ZlUksrrdErZA3xBGBXP4Yz046uEeGxCAuoS2d1i2I2jQiSneYs40vdz3q
         2C/SCxHfALj6BxWDQs4xtRK/d4dYt6WrjwoKspp/OYW+0lqIwxYFqVS8Z+H8AjkKzYkj
         TB2IqObKLPxUFVvp+NVfvxPZjQRwvqpwFTHrafvv31HWOs+eNn4S3jwn3fujTqEZhGHw
         3KOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701813469; x=1702418269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWmm3+4G7HJVcv2X2DUaAz47s+8+x8VIlkxgLxuapbQ=;
        b=owpokEmbg5aZ1n1AUroCf71KH2bAXolEaP/hf/ERzSvEnzSjr3oj1yVBECUD0GescU
         /iMhG80r71v1Jcbv+NPu3IdlwJwVtokqNG/6XlZXOTwLnOy1QrUGcqLPlhU4xPUgrTam
         wNU6oNy416mh4a+0tit5twMXQ9ymgx6wwGZ78iaIcNp77vAp7bsL9eLLi4QnxRUkNvvA
         1TI+HRtRRwMxw8kHAow7hKMQujJFjl9s8DbjxVPsglF9B2fKisQM5jozv975e9Nbp8rC
         HXBH1Iqa6LJE+p9L/rUDr0nQZ+thxALLH7Tx1Rezzn6wrLjG5z0ZLjI0c4QWuBTqzQRl
         Z9SQ==
X-Gm-Message-State: AOJu0YwRV5YVbGm5G/k+mEKB2P/jfEZB7K+fYzVEW8L+Fc3DzoEm+SYO
	/e1uOwGj3Z3y4PFIlVwwe8qHE0BwEoNLTw/4RxsuLw==
X-Google-Smtp-Source: AGHT+IEpGt6sfF3ndmcMCRvGxlKhVICniUpy6Xq7r6eo+/mxjFz3D+cUv+CWgFch13RwDQLHwQYzlcBK9dkUW5r0FZQ=
X-Received: by 2002:a5d:5949:0:b0:333:3cb9:8a54 with SMTP id
 e9-20020a5d5949000000b003333cb98a54mr1638687wri.189.1701813469476; Tue, 05
 Dec 2023 13:57:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231205-libstringheader-v1-1-7f9c573053a7@gmail.com>
 <20231205130449.8e330a26ecbed1f7b5ad5d7a@linux-foundation.org>
 <CAKwvOdn+VTM+LY6ALcgaZTL57JpiKt5rBPMSPNXsgS3MCENhDQ@mail.gmail.com>
 <20231205132452.418722bea8f6878dca88142a@linux-foundation.org>
 <CAKwvOdn=og6h5gVdDCjFDANs3MN-_CD4OZ9oRM=o9YAvoTzkzw@mail.gmail.com> <20231205214359.GF1674809@ZenIV>
In-Reply-To: <20231205214359.GF1674809@ZenIV>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Dec 2023 13:57:38 -0800
Message-ID: <CAKwvOdki0aUFLOgEhDxtHdHk_6x7WZdt3k2rSCxTB5hkPfKYWw@mail.gmail.com>
Subject: Re: [PATCH] lib/string: shrink lib/string.i via IWYU
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, tanzirh@google.com, 
	Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 1:44=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> wr=
ote:
>
> On Tue, Dec 05, 2023 at 01:39:47PM -0800, Nick Desaulniers wrote:
>
> > The tooling Tanzir is working on does wrap IWYU, and does support such
> > mapping (of 'low level' to 'high level' headers; more so, if it
> > recommends X you can override to suggest Y instead).
> >
> > arch/nios/ also doesn't provide a bug.h, which this patch is
> > suggesting we include directly.  I guess the same goes for
> > asm/rwonce.h.
>
> See include/asm-generic/Kbuild:
> mandatory-y +=3D bug.h
> ...
> mandatory-y +=3D rwonce.h
>
> IOW, sh will have asm/bug.h and as/rwonce.h copied from asm-generic.

Ah, right, Ard had mentioned this file to me once.  And mandatory-y is
documented in Documentation/kbuild/makefiles.rst.

Ok, so we can use include/asm-generic/Kbuild to know that if the .h
files listed there are recommended to include as asm/*.h, then we
should replace that recommendation with linux/*.h.  Our tooling has
something where we can automate that.

>
> Still, includes of asm/*.h had been a massive headache historically
> and breeding more of those shouldn't be overdone.
>
> More painful problem is arch- and config-dependent stuff, though...
--=20
Thanks,
~Nick Desaulniers

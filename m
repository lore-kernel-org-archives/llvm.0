Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5DC6FCF0
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 22:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Lvj3xDh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3316bb1303bso114104f8f.0
        for <llvm@lists.linux.dev>; Tue, 05 Dec 2023 14:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701813957; x=1702418757; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9JeQfipl8UW5TVzZ70ugB2PN1r+4JCceO2n9SgysLY=;
        b=2Lvj3xDhXFBHV60Odrur4/h59NDZAWu9B3nZOPBJdUACqvNKmGA2qJZIWcSRGFqXep
         4Te/nlXTw9R9IH58Kw4FK+O+CS8PM6OWar7mj3czqm2PSnn3GUODJKEdwHbhCbFFqxss
         ejh4qJbErt75E0R6I4axpn2rICb+6Acvh1KySL35RQbvQETyMMHpVBdF3vjGTzA5MSFH
         bplBGZGU6Ly8ac4g3N+4Tdc//pbKX9AIE1IYX6x8at/2p3stx4yCwY0j2YjO02Zap7DW
         FuOM6QDxOnYCRQBiNtLLFdejR/h/oFJhDW1P1Q9asPNleV1lgzjrBFfFg3yoDAxRNfwV
         xJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701813957; x=1702418757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9JeQfipl8UW5TVzZ70ugB2PN1r+4JCceO2n9SgysLY=;
        b=QH93Ll/o0LujvPswIthdq4J84NiX7tP2NBBl2fAYTkJj1Vco8WBOEGNdnvA9doCnKV
         Yu4qxujvAMzGAuTd400BqwlIXx3zS+qIHEJfN7J+/kpu3krxpIx3kjv4Ak7wIpC2VYpm
         7zJEIJHzCIbnZShBsMbB1IluA56i29NKuHhm/b8lvV8vJTRgw9ZJ3J2ndKeEDTUJRtx4
         sz7aKFbqDtO5BfJIvgjX4OgWsRpgYXjR8cjSM2gvV9OMGErCtsLG2h2fD3lP3n/BxCYZ
         c/16EEP3EHTm9xwGghiglrlSircTls75A3Z8ao/EsvAjUDN37vyOXA5nNlmodk4/SbBo
         gDPQ==
X-Gm-Message-State: AOJu0YyZhEKhcE5tdQc9Gg0am/3eAl7yhtbFWjOTkc+38hqyZxMJCGmn
	dHO4iMeAjz9nCW4w0lFHxwUqZdX47+oBruXa1Itn3g==
X-Google-Smtp-Source: AGHT+IHkAJabxfpBjjJ7hbUgdJBd2Fen0CGawNzwxwjbFMg7jrNg9K9f8rvFT5xK3F8ap3VfXxDmTj52qvUE57KRoM4=
X-Received: by 2002:a5d:66ca:0:b0:333:2fd2:8153 with SMTP id
 k10-20020a5d66ca000000b003332fd28153mr4348200wrw.112.1701813957199; Tue, 05
 Dec 2023 14:05:57 -0800 (PST)
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
 <CAKwvOdn=og6h5gVdDCjFDANs3MN-_CD4OZ9oRM=o9YAvoTzkzw@mail.gmail.com> <ZW-b4l1llqPXW-el@smile.fi.intel.com>
In-Reply-To: <ZW-b4l1llqPXW-el@smile.fi.intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Dec 2023 14:05:43 -0800
Message-ID: <CAKwvOdk+JpEC-=27EkB7inOUfB+6tLe_NREz7tryHu3vmXq7DQ@mail.gmail.com>
Subject: Re: [PATCH] lib/string: shrink lib/string.i via IWYU
To: Andy Shevchenko <andy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, tanzirh@google.com, 
	Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 1:53=E2=80=AFPM Andy Shevchenko <andy@kernel.org> wr=
ote:
>
> Have you checked Ingo Molnar's gigantic series (2k+ patches) for the head=
er
> hell clean up? Perhaps we need to apply that first.
>

We missed you at plumbers.  Tanzir gave a talk on this, with the
raison d'etre of this work was to see if we could help automate Ingo's
work.
https://www.youtube.com/watch?v=3DeFq_oqLiXPM
--=20
Thanks,
~Nick Desaulniers

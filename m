Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5012F25
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 17:38:36 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-edf3b6b0f2so3646085fac.9
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 10:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RlzFsByCwYO+godJCtKhbcKblXXdp9qodl5pJjjGvC0=;
        b=Y4XXMhSrkkqjeeNQzH5/EiAhaqEB1BNz4HySD+ED33eEHyo9F4B9oXsZMTg3p64U/t
         0F+xS1HB/JGaIvkhETiE1oi1CPSVc4KbCMWXo7Z8u8GN9wK/rdCRHaPpe1gk/B3Hr83j
         1252CL9hljxD0xv68XFW7aIlgtoVMQ9FfgpLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RlzFsByCwYO+godJCtKhbcKblXXdp9qodl5pJjjGvC0=;
        b=RtNGoRtZcoT+dAoXXWPjrDJe7SaTcnfzx0CylTz9JY+0vf1wcoesnF4yCJn6AHJtQJ
         5TQEbX0aiRZhQ3RFe7sW3tgjpO5s3Xz6VbVPrklD3CANMhVs/ex4hs3mxY6ImDE5Kgw5
         cUPSLCg5uy1liyHPkQEJpnSXW5RPwgLYtyrX50NQv03JK2b0dSVGZQKLfV4IQSZwB6in
         lGdrlQNbIIUzpg6v1f+C9GOW1sp9yx6k9zdeW+TyGkNGJs051XQSaY3ES76+E/MJ9cr/
         iZonbUwusDov8m4liVZ0CCfcZRuekBscdJTH7TPu+SToPlgJuglCKCH38nZP8EvEhusX
         Gt5A==
X-Gm-Message-State: AOAM5339E3W+7yWs5VQ/Jjx5+1zq0v2Q1VS9CB9Ej3P+opAimo5eHtap
	ypZW5g3iK7ZqRVZt3KRyFT3tN/HZjHQupw==
X-Google-Smtp-Source: ABdhPJy/dAri4L0Y6Ve/ahU29jsgmEs35Bjp3hc2ecoseWmCBsGrBJWCMgGMxrKwWPjamIMSI7AF7w==
X-Received: by 2002:a05:6870:b3a2:b0:e9:f22:5819 with SMTP id w34-20020a056870b3a200b000e90f225819mr3200891oap.293.1652290715265;
        Wed, 11 May 2022 10:38:35 -0700 (PDT)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com. [209.85.160.42])
        by smtp.gmail.com with ESMTPSA id y26-20020a4acb9a000000b0035eb4e5a6dasm1122557ooq.48.2022.05.11.10.38.32
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 10:38:33 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-deb9295679so3667872fac.6
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 10:38:32 -0700 (PDT)
X-Received: by 2002:a05:6870:d297:b0:e6:589e:2217 with SMTP id
 d23-20020a056870d29700b000e6589e2217mr3307305oae.291.1652290712525; Wed, 11
 May 2022 10:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220506160106.522341-1-mic@digikod.net> <152da06a-330d-3125-6f41-262e0751f41b@digikod.net>
 <CANiq72mST6rfJDVGGT2+=_FUCXwms6N8mo2eoLzQ6KW64M9BtQ@mail.gmail.com>
In-Reply-To: <CANiq72mST6rfJDVGGT2+=_FUCXwms6N8mo2eoLzQ6KW64M9BtQ@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 11 May 2022 10:38:20 -0700
X-Gmail-Original-Message-ID: <CA+ASDXNdzV9nX3hSi7UsuDm0duqd+f-0=3ef5q=dOxu5wGodyA@mail.gmail.com>
Message-ID: <CA+ASDXNdzV9nX3hSi7UsuDm0duqd+f-0=3ef5q=dOxu5wGodyA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Fix clang-format configuration according to checkpatch.pl
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Joe Perches <joe@perches.com>, 
	Kees Cook <keescook@chromium.org>, 
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Paul Moore <paul@paul-moore.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 8:29 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> I am thinking
> of putting Brian as author and you as Co-developed-by for the last one
> to be fair (Brian: is this OK with you too?). Thanks!

I don't care at all either way; it's a pretty trivial thing, and I
only posted mine to kick the wheels a bit. I'm just happy Micka=C3=ABl is
doing this :)

Regards,
Brian

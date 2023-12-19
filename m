Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46B3D0B1
	for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 21:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLZDMjTO"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ba4850f65dso2809272b6e.2
        for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 13:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703022740; x=1703627540; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/HELoxRBihubnQTIbfT46yyuCF92jjoc5j2WnCAxMg=;
        b=QLZDMjTOT1QN5FpBLMPfUoCQs6EyptjHaMHhHhvv6s+XMBrcF70pqm4HVEen3XLOF4
         8FY44YbU7B6pts8d3Ro5flPzhKHeIrYLEUmXaiV7tysZjmp4i6IPF89IIfEZAuxgrksn
         qlnzhV24xMMo07FoASBnUskiJzUrJOtSraFt/gZRpkXQvhXueRlPzWLLDo6HuqCvwIGv
         RyuRYN5BlcASFHdTZbmm3pLjdWS6J+RTbJTR9e2CNd5Kx9P+tAnfsbrv6bIE/xS5hdyo
         4ZOjUtNzrmP24QtGmywPLRMNB8UlD/hgdchEmRVIMtWwHm2wJQx0qZkoeXjPGQwMAIjE
         nn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703022740; x=1703627540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/HELoxRBihubnQTIbfT46yyuCF92jjoc5j2WnCAxMg=;
        b=IBcaZXBQs2eEUJcDYy88BmooWn5TTAHL4IUJOeXEfa78UHkwuUSuHjCvxgw7kxRhWb
         5d5MnQFr+cOiI1wW4B0izaZVBXfrWN8er6S58dGpLR8beHA0Wtyf6sSf0emu/zdbTgoQ
         l0FmuuTEwFGrAjxT2kejY23yjjCZILKqKjZgq3FREBAIImFmrcVgqoLjZz57B8Zc409t
         r8x61Xnglj60dCiCNo4/4BVTmTt/tywEK3Ej65BkYeBMPy6fhxjBf/1XR1UblpqqyjP6
         SI4VOT7KChSNa1o+InqiK26uAidoLwqqDHM0ztIPrYzcpfB3ZLl6wTQvc/VfOrq6ch24
         SCcg==
X-Gm-Message-State: AOJu0YztEtp8pvCJGcOeEyxozQekIGN8dDvXmk+17fDbSEn0QhKi0++k
	yhMnLK6NI3tQ/qtip+5eUk1hF9nQ44iJuU59AqQ=
X-Google-Smtp-Source: AGHT+IEYMovugHC3Wx2wWk978fWVMiH69UO6ZUgo0IecWqN29PEQku+lqbLZS9m5zTdKhg7b9KpHO8lfRDjZN6HORQs=
X-Received: by 2002:a05:6808:10d4:b0:3bb:67fb:a451 with SMTP id
 s20-20020a05680810d400b003bb67fba451mr1114878ois.114.1703022739808; Tue, 19
 Dec 2023 13:52:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231219-libstringheader-v5-0-206d4afd309a@google.com> <20231219-libstringheader-v5-1-206d4afd309a@google.com>
In-Reply-To: <20231219-libstringheader-v5-1-206d4afd309a@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 19 Dec 2023 23:51:43 +0200
Message-ID: <CAHp75VfS7rYZwRP50cm5vYq_EO9ozA=_qrEm4u7jB1WMwOVc0A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kernel.h: removed REPEAT_BYTE from kernel.h
To: Tanzir Hasan <tanzirh@google.com>
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <nnn@google.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Greg KH <gregkh@linuxfoundation.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 8:48=E2=80=AFPM Tanzir Hasan <tanzirh@google.com> w=
rote:
>
> This patch creates wordpart.h and includes it in asm/word-at-a-time.h
> for the all architectures. WORD_AT_A_TIME_CONSTANTS depends on kernel.h
> because of REPEAT_BYTE. Moving this to another header and including it
> where necessary allows us to not include the bloated kernel.h. Making
> this implicit dependency on REPEAT_BYTE explicit allows for later
> improvements in the lib/string.c inclusion list.

Same comments as per v4 apply here.
According to the Submitting Patches the best time between versions is
~1w. I understand your desire to close this quicker, but the result is
actually the opposite. Take your time and check carefully what others
commented and recommended. With this series it's fine to send a couple
of times per (working) week. It sounds to me balanced between the
complexity of the change and the people's willingness (having time?)
to review.

Otherwise it's a good start!

--=20
With Best Regards,
Andy Shevchenko

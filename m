Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17893173
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 00:36:12 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id p7so870875edc.12
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 16:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oXZqBE0q9OTqMHj3VdB5E02o4A6FjZEHOwhK0PXA+iU=;
        b=Bq9cmOB9xSKfZwy7Sb1XHF82ViyWkrje71gb/xt7h6ltMt4beZ5ceHBDi96kl0nAsy
         7hwTrD2JuT4/B6Lxq9l9pEyKUoTnD45PPoNywBMh9zQ/VSEaUXGi8Cb7cboTYLHZRkFc
         2J7zO9jzPrpkNBZ3wyV7yRdQP9RjmM8yzGHmRpzdBLGpNFUhhwAK63gDPwV6Srikwyeq
         1q5oROvo9gb5pyYQ7RDMtAA+jJStxllOIiLe7rTZW7Kj/IHIQKSRN84w/6pKz/eJ6KDM
         mglRA+0XbSyg6dRCLAgGLLT6P95YsSuYQwvrk/4eImwAngVNZSkPnaA0JXhLlcM+hj1H
         S33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oXZqBE0q9OTqMHj3VdB5E02o4A6FjZEHOwhK0PXA+iU=;
        b=ZQhU5KPPeTIQcnvrW1zkhgW7WC0ijssUSFQwfwmN4vAF1ymz6+AK75LTBu89gtVmhp
         bIZWb4xSSGaLQHgrkRH+8JVC3p0KCGgUM5e67G4dc3EkediVSiTcgwaxtv4d3ukL4aNB
         SIr99ODQK1b5KYCu5s50bpjcbOodZyFTBiJgWKGcu3CNZG70X8P/fRfhWMNeHj8zwY+w
         0HlrEsmxAiEPfhLHxD6c2EfJyTDZ0HQDehV8IWYwdpn0aVtdxV5h06ByH4im1tH+39hw
         LtgI3LAHZLCD0YjU6cxSm1bo1H4T5wXe/Vp0tDEOIP980CbFfV5OBl7+6fjSBrM6JUt6
         Qc6Q==
X-Gm-Message-State: AOAM530oHU85BguWCsiUc677Spus1ZY87Divhqt9kXXuJgKwqc3WNYUB
	b4vZDpQ8vRfxu9JjmnTPw8+W/22lyRL3uLCWQQz1
X-Google-Smtp-Source: ABdhPJw+5aBMxr72MniVbnSkXxgNfff7nte9AAvKFJsRelZrQ9UuB4LYEUqXJpDD12F6xo3uaFoUBbxUcqYfEI6UJok=
X-Received: by 2002:a05:6402:3596:: with SMTP id y22mr9937844edc.232.1643157370397;
 Tue, 25 Jan 2022 16:36:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125141422.32655-1-cgzones@googlemail.com> <20220125141422.32655-9-cgzones@googlemail.com>
In-Reply-To: <20220125141422.32655-9-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 25 Jan 2022 19:35:59 -0500
Message-ID: <CAHC9VhQ-kSWQ_w0KwgMboidktdQNN+G5jRpRWsY0Ayb8-HPmMA@mail.gmail.com>
Subject: Re: [PATCH 1/9] selinux: check return value of sel_make_avc_files
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jeff Vander Stoep <jeffv@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 9:15 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> sel_make_avc_files() might fail and return a negative errno value on
> memory allocation failures. Re-add the check of the return value,
> dropped in 66f8e2f03c02.
>
> Reported by clang-analyzer:
>
>     security/selinux/selinuxfs.c:2129:2: warning: Value stored to 'ret' i=
s never read [deadcode.DeadStores]
>             ret =3D sel_make_avc_files(dentry);
>             ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fixes: 66f8e2f03c02 ("selinux: sidtab reverse lookup hash table")
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/selinuxfs.c | 2 ++
>  1 file changed, 2 insertions(+)

Merged into selinux/next, thanks Christian.

--=20
paul-moore.com

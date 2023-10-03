Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE063C696
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 19:26:40 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ae473c0bd6so209637b6e.0
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 12:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361199; x=1696965999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cJJaH8b1u/qRRvI+ZMuh5sNNJkEekWhJ7wzLow6kXk=;
        b=im8WEq4jF/rvikMPi6lH6gp3T87st/T1Cbk91H4m7OjtjXik10I2roJesdvVodt0aK
         N4ntpS0guiFh58dDKehNuGbft7wTsBcDccElW6WD945VkFKTX5Qhe7co49JvQ0MzEbEx
         12c2cIKi2EnwW5evEjxReXOK6cdAk8h2by+dfcgIzFfcKveVvCWhUNiOnqOt2t0631T3
         FvB7jds3gw3NXgXYdAMHMlKy05oIXZlDMOQoZJPUtdvY2mpvblbbLcQbXCfOUF1sq42S
         MgAOEH5jXImDmh39E1ECJVlVRu0LiPiMGGO6PQGiSjQRNZn0/EE07jlvlUS2oIK5iwlF
         8R6g==
X-Gm-Message-State: AOJu0Yx6bP71DUbFzKYYwZq8P2dgC+BhVJnAZ1Od9qENgqc0oFvwmZ6a
	kbCnf6F1Dcf2KBAg+M7GW0Pq6bAtbdUZgm1ctrI=
X-Google-Smtp-Source: AGHT+IFjyx71PMx2N+wDN30hM/HJ7/ySds49msMYXwi2gb67HIgd8KqAVePwVPPg5Hs9izeUDwaaWPBxodNT4q5lk78=
X-Received: by 2002:a05:6808:3008:b0:3ad:af12:2fe0 with SMTP id
 ay8-20020a056808300800b003adaf122fe0mr491609oib.3.1696361199765; Tue, 03 Oct
 2023 12:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922175315.work.877-kees@kernel.org> <728fc315-4761-f56c-cd06-9c907a53b46c@embeddedor.com>
In-Reply-To: <728fc315-4761-f56c-cd06-9c907a53b46c@embeddedor.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 3 Oct 2023 21:26:28 +0200
Message-ID: <CAJZ5v0haZmhJ6OLNiJHuxLaYRrBschL4Cm7H6acFmGb0Et5_MQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: PRM: Annotate struct prm_module_info with __counted_by
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
Cc: linux-acpi@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2023 at 11:41=E2=80=AFAM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
>
>
> On 9/22/23 11:53, Kees Cook wrote:
> > Prepare for the coming implementation by GCC and Clang of the __counted=
_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOU=
NDS
> > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-famil=
y
> > functions).
> >
> > As found with Coccinelle[1], add __counted_by for struct prm_module_inf=
o.
> >
> > [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples=
/counted_by.cocci
> >
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Len Brown <lenb@kernel.org>
> > Cc: linux-acpi@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied as 6.7 material, thanks!

> > ---
> >   drivers/acpi/prmt.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/acpi/prmt.c b/drivers/acpi/prmt.c
> > index 7020584096bf..c78453c74ef5 100644
> > --- a/drivers/acpi/prmt.c
> > +++ b/drivers/acpi/prmt.c
> > @@ -69,7 +69,7 @@ struct prm_module_info {
> >       bool updatable;
> >
> >       struct list_head module_list;
> > -     struct prm_handler_info handlers[];
> > +     struct prm_handler_info handlers[] __counted_by(handler_count);
> >   };
> >
> >   static u64 efi_pa_va_lookup(u64 pa)

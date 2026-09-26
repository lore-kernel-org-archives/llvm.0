Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8435B31DDBF
	for <llvm@lists.linux.dev>; Sat, 26 Sep 2026 03:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395022; cv=pass; b=f/YCAIbt9BXhrZ7QwakdJO3BJk3vMGDObgCnnJMyOUxt6fbfXJeW7MEszpg4ZCRwE+OekxAXmbpqg1IhCsmVYme+7/bhDjvogCVCCbf8YKCCAPMREH7fbGiHmy5qf3y1RGTXbWjy1blQUkZrNkbzAvWPJWQMOdsn+W+tLmYLi3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395022; c=relaxed/simple;
	bh=kZy9FlRDjUea/4cavqBXm9PiQeLiuh2i8j3p75iGMn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOejGYOqqHXYX7iufBEyvyUOvSuPsa9d84i7Q/LK55bsazaQWjNHhqG9WcEr8bjj+UISVY2OqX4lwTKmC3naUIZzwlOcQVeq8qn2IC6PV5SbVTyKiI4nF6RfxVGPquL4upbQEWjN7Awiy/oVoOfEWSmzjz4mf0tJlaMVuh+RHWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UqN89ShQ; arc=pass smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UqN89ShQ"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98334af2ca0so508248241.3
        for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 20:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790395018; cv=none;
        d=google.com; s=arc-20260327;
        b=PZ/F3UchLrq9/P+phEl4VLC2PdOVZMAMsnNCyWzSEx2nhPAjG5Fj/oyJs3TNEGn35C
         Zjcn5AmbQuHnjRtqqf8iVONbFE0VzFySVsdp1QRCQbY2lBxUNbfVkW309uIWpABAbGe4
         CLutxA76JMuN/zL2J1Esis/fbgYKeL5xFJIKva18thK78co+gc9VClWfWhDTOpuHnD/J
         NsWitIxDWswaQyU1NjdgfxmDtMLM/h7rKNIhsl9OlMWnlDzCzLdESzT8NpndVZstsDxL
         c89YqGjYTavnUnq4g5Yxoi0fVGDAEhctyTMk5/nWDpXKWJER47+8uvl9CnQlWGHRaOI7
         8wRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31bXx9DDYtYaMyGphvOilRAP9jmRVAn7WJ7/Gygm+I4=;
        fh=pKop1R22m3yrIHKo65P60jHS+M0M8otdKlew9Y+/pPg=;
        b=HivxaXpWPTYOIYAUGmwQgvplyNvVzd03xGymYPsrihx6MelfLc9pdVqr0rR6XuBw/N
         XXcq+0QtdV4myNVQLClauSyxHe+eRM/+/6NypEYpBIx3qZwLa/kijoDFNL46LtH2rRRq
         G8fDwI91ipA/0OsbbP8Thxv/rzOczA9U5eioCV3bR5waAiju2857n7d+TxDBjcM3tF6w
         7xS1LY6GTMus/7ZX5DP5nufziOidBI/fewEyqXhc9UzOuFG6CuEskhpxWcCdWX1XeqBP
         hFOiVGVyUcOwjdxBKi8NZDsaHGYte+lD1AL76Pe9kWNal1MZlrSLnHeK5FBktzm8RGEL
         GXZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790395018; x=1790999818; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31bXx9DDYtYaMyGphvOilRAP9jmRVAn7WJ7/Gygm+I4=;
        b=UqN89ShQ8M6J9Abq0prkPtqE3IuGjonerFlJt/yYRiBEa7nzcmMdKT191fPNUCHAJS
         R/4xC8u0bkQlAYioliNvz+46WHl/lUIz3KXI2iRQHOPeP4/PHjlYkZ4JjLvXHfGC+KO9
         ulh7yDMW5LJstCWWQexRP6jBQ/OPvYmYjzISKdU97RjR3eSQZSRfBaeZAcTBQX8Mfe49
         CDJudsAdUvm5xjGM8bzhdHF6LRXmqh8ZdRWt3/hDP8NYDfl/VRayyje6ro8WFz89C9Q3
         0BigSfoJgBoo2mpBsRtB2WrUd4YMd27qQOeDHeMHamaNbKwPS4My0T0JKcKchmiEzIbH
         q9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790395018; x=1790999818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31bXx9DDYtYaMyGphvOilRAP9jmRVAn7WJ7/Gygm+I4=;
        b=uElCwKEVfwYaBeex7WMaic31t8t2NWRS1HfcKvwvF15TZOuVkw0GFcoAsY2aUdmYxb
         eepMnwd1Z/1wk9QdzayvyDl30vBfwWNhWTvN0YzwQgp/73nWmK5QfAjVPpZF3NqML282
         T8terkt5iSyWu7KArDCoYhhj0dzYpHTN7jcSK4pZnST2hfv1CwYEcctjE57m1thoEtFm
         5SN5gVVhge0oNnA9VKjrlvwn5g2ugcqqoyUJWVoxKYpXy4JJaQHmqyKeMIGEM2tkhMDC
         gH1Ub7ld8flHhqiW05wcSIxT4NxHFZaerC7iZk8zJ5QN2ZFXkoEhcjYpLdKeTtM+3CSa
         MQ1g==
X-Forwarded-Encrypted: i=1; AKwUvBz1rF93zTQOwUYgeanBaZ2Nv4WdKOaFE31eiraI4pfazFZc4R8yam1pxVN1jsiA9hiKI2JF@lists.linux.dev
X-Gm-Message-State: AFuF++lIaOPHltO1kNtNeymeRbgrdPqNKLql3OYkF+FGg650amvUb+ya
	4O1jPD0jPxyJV7G0SnElwm0t0JPwuQviRnIwHo1JK9XjApDQIlikJaSZ2Tv7EwLx96A+1wpxzDu
	+7FgxU6Z0mURprQwVf5E2A8nHBTv4miVPGmiOUEA=
X-Gm-Gg: AYBFou2/arK2FgOGxNGX7AX3SZMoHhsJ7vkMXzDelXYX9hvZaB2Bv2Xq7+WWTmXzj4J
	Xgr1UghgO1fI89CQnp8yTc1HKnQdoZrgmMJS6TxSIAWaa70i3GAZybkG72nZTnEiCuIxcQKyh5j
	zpLN2bdDHAY/ee29Locc3SiBbLJ0BVQgjOtPO/GMovPwsWgRDY1QhZouJlILHMnb7MjtswdHSt9
	errWf6zXk4wcaCvRRvfcZYX73zXROSs0XCHgFlhryuaDxHjusdxpcAQTLBcukzVquyvyW/+Z41S
	15VOuMDXYCGP8fzygNbkFXEM1Nvb7k15FVvQ2ws+I5Ny4R1USydTlAAYQLtMpyR9uJ5faHuszY/
	t5MaocVfOxNZR4enLhmQc
X-Received: by 2002:a05:6102:512b:b0:7b3:5cb7:49 with SMTP id
 ada2fe7eead31-7b35cc64b1emr468961137.31.1790395017546; Fri, 25 Sep 2026
 20:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923055320.2602534-1-morbo@google.com> <SN6PR02MB4157A2693AE5369CA19A84DCD48F2@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB4157A2693AE5369CA19A84DCD48F2@SN6PR02MB4157.namprd02.prod.outlook.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 25 Sep 2026 20:56:41 -0700
X-Gm-Features: AclHuK9ZglMRgpOjf7nJE9QEEZwUIEVC7ZTeuasL8ipLCjkjknKZffHOUZ4KyBI
Message-ID: <CAGG=3QW1HvN9Rz0k41jnDv4YMY1-LA0NhiA1B+CqzRfZThspbQ@mail.gmail.com>
Subject: Re: [PATCH] Drivers: hv: vmbus: annotate struct vmbus_gpadl with __counted_by_ptr
To: Michael Kelley <mhklinux@outlook.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"codemender-patching+linux@google.com" <codemender-patching+linux@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 6:55=E2=80=AFPM Michael Kelley <mhklinux@outlook.co=
m> wrote:
>
> From: Bill Wendling <morbo@google.com> Sent: Tuesday, September 22, 2026 =
10:53 PM
> >
> > Add the "__counted_by_ptr" attribute to the buffer field of "struct
> > vmbus_gpadl". This allows compilers (GCC and Clang) to perform
> > compile-time and runtime bounds-checking when KASAN is enabled, prevent=
ing
> > potential out-of-bounds accesses to the GPADL buffer.
>
> It turns out this "buffer" field is never dereferenced. The value is save=
d
> here only for the purpose of passing into set_memory_encrypted() as
> called by vmbus_teardown_gpadl(). The memory *is* referenced, but
> through a wraparound mapping created by vmap() from the struct page's
> underlying the buffer. The mapping is created in hv_ringbuffer_init().
>
> Given that, is this patch still appropriate?
>
Hi Michael,

Huh...so it is. The buffer is converted to 'unsigned long' (*sigh*)
and then passed into arch-specific functions, which do what you
mentioned above. Given that please feel free to ignore this patch.
Apologies for the extra emails...

-bw

> > The fields "buffer" and "size" of "struct vmbus_gpadl" are assigned
> > exactly once, during GPADL establishment inside
> > "__vmbus_establish_gpadl()" in "drivers/hv/channel.c".
> >
> > To ensure that the count field ("size") is initialized before the
> > pointer field ("buffer") is assigned, we reorder the assignments in
> > "__vmbus_establish_gpadl()" so that "gpadl->size" is written before
> > "gpadl->buffer".
> >
> > Cc: codemender-patching+linux@google.com
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> >  drivers/hv/channel.c   | 2 +-
> >  include/linux/hyperv.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
> > index 7e4cc6f55237..7042de2dd481 100644
> > --- a/drivers/hv/channel.c
> > +++ b/drivers/hv/channel.c
> > @@ -548,8 +548,8 @@ static int __vmbus_establish_gpadl(struct vmbus_cha=
nnel
> > *channel,
> >
> >       /* At this point, we received the gpadl created msg */
> >       gpadl->gpadl_handle =3D gpadlmsg->gpadl;
> > -     gpadl->buffer =3D kbuffer;
> >       gpadl->size =3D size;
> > +     gpadl->buffer =3D kbuffer;
> >
> >
> >  cleanup:
> > diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
> > index 9e109d91aa14..408748a05440 100644
> > --- a/include/linux/hyperv.h
> > +++ b/include/linux/hyperv.h
> > @@ -780,7 +780,7 @@ struct vmbus_device {
> >  struct vmbus_gpadl {
> >       u32 gpadl_handle;
> >       u32 size;
> > -     void *buffer;
> > +     void *buffer __counted_by_ptr(size);
> >       bool decrypted;
> >  };
> >
> > --
> > 2.55.0.1082.g2b9226bbc0-goog
> >
>

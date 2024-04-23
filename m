Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FB86A03F
	for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713882374; cv=none; b=CbzTvRuvQyS6qaLCbvKIgFikO/qLe9le1mzmHQUB72LiOVCQ1OaYyu3a3fyQo+pjamRp1pyiQ1hiC62Zthsf7JFZsEv+3pPW0fhY7FtzDYXEO+Tv0FMftpiYJyJ+1hBSmiHgqdgbl1hmemt6GjBqeLw+JJ7qsKwzlv0ZeLwXf4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713882374; c=relaxed/simple;
	bh=8xXEiKHrq2ZD7ofhnfahTB1IapkO77gIn+LITWkcpPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TO7ZMCFm3m60VPBq5H5Gdq9TD9ZjcScnEPD5Pj7iIaeDFj3bJTWsJKAcgjbBROUpwPm5sBTAeXJq++E3Oj2vfnFxSyp8XG20cYJz+h5IW9y0TRb2tQIUyWoHAEpnzs2zdgHZ8OfIiXM3VvEYXVmtBcEFW9mH7ugjGP6Vn6RiT+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zbm4jH1q; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zbm4jH1q"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5af2d0a53f5so520930eaf.0
        for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 07:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713882372; x=1714487172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzeFSdYGkB0p4r/XkjUJNTl+/EX4RrPovL9SKlo9gLw=;
        b=Zbm4jH1qtuxXfOwwXVpKn0eCLTeuvOPu8B/tUcZo6C9q0TltgYpGasvL4LnekWMTSj
         M8pSlAeesJKqBkS/UrAiJlY1wsG9A4j8vAwH9CIPAqJSyFZPn6h1dTjeQPDNlruvNHTi
         hNVa0A1A6Y16gZUCtsfnH29mqsg9SlFTcfpRTzaWkpsVbS56U6Owm+tuplPcjCek5XLc
         SXIwFKWNU8XoKcQVLWmqVTfoYEtwpAi5FbLA9e2yKLOtligMMTxwJdf703JHguRa7rwm
         IN72F/keDUw6f+uhtSbPpfc48LdRiEdmrTRJa8GGuCUD6hqax4ZiYiNZCDlAbfN8nJ9J
         NrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882372; x=1714487172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzeFSdYGkB0p4r/XkjUJNTl+/EX4RrPovL9SKlo9gLw=;
        b=CJJyJ42kkMgwQm2NkOISZl7FFMqCN/KNy+vlEtr4wbrE7dtsTOr/Fxzppj298FrhfP
         R4pP20TbiUVBE8UpfMbx93+xSteHVKfl8dgkv+s6dyQVuwY6ZqYPUkcz1zNlm10abXP5
         Ivh6sGjMY2BFS7PFhygOCbWeA+BOOpXrXzuVIi7VoaDZlo2haAu+9GYimAYgu5RtmOeq
         OYhkey2rKaK/17TEgwthorjDvzo2offOE5/gm038JR4OPh28ZbyIhBNFDFyEAHAt+51N
         fZff4HJbGOPS+VgKgLXdwsFM90JmTVXsYGqBTWIWcV4YXyGOSfvqMT0YcyQKCwYc8Ynq
         wRyg==
X-Forwarded-Encrypted: i=1; AJvYcCXItx6LuNuUcEUUoeBMNv1q+1QgM4YQ9TCVzMBUkIrA6lSvpU/6M66B4eI7KIOuhcUEtBrPceW4CILkmyzRVwfkG3ZQZw==
X-Gm-Message-State: AOJu0Yyun9s8ubx9DYhHFUww+emeFxYV4cZvHKKLXNFxg5dnhOm6zgw0
	LtFA9Gkwce2jz3jOw7mBkoYKkROYsosWRZAYiH4QEBRS58z9q9lue5MFM37925VNfBiaJBa1Ax/
	t803YrJpZAMNJD2wZGaIE3Zl5czM=
X-Google-Smtp-Source: AGHT+IGOfTV+X0kR18dZKcS4/xLxByStp+lOjXXuFPTfkZDxusPL533mljZCozFiz2TLWZZffqY7nrW3XobCYrVjvlI=
X-Received: by 2002:a4a:5104:0:b0:5ac:9e7d:576e with SMTP id
 s4-20020a4a5104000000b005ac9e7d576emr1112421ooa.1.1713882372691; Tue, 23 Apr
 2024 07:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1713875158.git.siyanteng@loongson.cn> <c1d41290e80fc1e6364682c258445132c42442e4.1713875158.git.siyanteng@loongson.cn>
 <CAD-N9QU7uyJN7g1D1y0jZt9x64uDwvL3ynyXir6othOm=NpH9A@mail.gmail.com>
In-Reply-To: <CAD-N9QU7uyJN7g1D1y0jZt9x64uDwvL3ynyXir6othOm=NpH9A@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 23 Apr 2024 22:25:46 +0800
Message-ID: <CAD-N9QXbToYg4VUDmStJ5Nt3Wu4o9UrNCaDQPMcq9tLrd=bdXA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] docs/zh_CN/rust: Update the translation of
 coding-guidelines to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 10:09=E2=80=AFPM Dongliang Mu <mudongliangabcd@gmai=
l.com> wrote:
>
> On Tue, Apr 23, 2024 at 9:08=E2=80=AFPM Yanteng Si <siyanteng@loongson.cn=
> wrote:
> >
> > Update to commit bc2e7d5c298a ("rust: support `srctree`-relative links"=
)
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  .../translations/zh_CN/rust/coding-guidelines.rst    | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/translations/zh_CN/rust/coding-guidelines.rs=
t b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
> > index 6c0bdbbc5a2a..d02e2dbff509 100644
> > --- a/Documentation/translations/zh_CN/rust/coding-guidelines.rst
> > +++ b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
> > @@ -157,6 +157,18 @@ https://commonmark.org/help/
> >
> >         https://doc.rust-lang.org/rustdoc/how-to-write-documentation.ht=
ml
> >
> > +=E6=AD=A4=E5=A4=96=EF=BC=8C=E5=86=85=E6=A0=B8=E6=94=AF=E6=8C=81=E9=80=
=9A=E8=BF=87=E5=9C=A8=E9=93=BE=E6=8E=A5=E7=9B=AE=E6=A0=87=E5=89=8D=E7=BC=80=
 ``srctree/`` =E6=9D=A5=E5=88=9B=E5=BB=BA=E7=9B=B8=E5=AF=B9=E4=BA=8E=E6=BA=
=90=E4=BB=A3=E7=A0=81=E6=A0=91=E7=9A=84=E9=93=BE=E6=8E=A5=E3=80=82=E4=BE=8B=
=E5=A6=82:
>
> =E5=89=8D=E7=BC=80=E9=80=9A=E5=B8=B8=E8=A2=AB=E7=94=A8=E4=BD=9C=E5=90=8D=
=E8=AF=8D=E3=80=82=E5=BB=BA=E8=AE=AE=E5=8F=AF=E4=BB=A5=E6=94=B9=E6=88=90=EF=
=BC=9A
>
> =E6=AD=A4=E5=A4=96=EF=BC=8C=E5=86=85=E6=A0=B8=E6=94=AF=E6=8C=81=E9=80=9A=
=E8=BF=87=E5=9C=A8=E9=93=BE=E6=8E=A5=E7=9B=AE=E6=A0=87=E5=89=8D=E6=B7=BB=E5=
=8A=A0 ``srctree/`` =E6=9D=A5=E5=88=9B=E5=BB=BA=E7=9B=B8=E5=AF=B9=E4=BA=8E=
=E6=BA=90=E4=BB=A3=E7=A0=81=E6=A0=91=E7=9A=84=E9=93=BE=E6=8E=A5=E3=80=82=E4=
=BE=8B=E5=A6=82:


Translate the above comments to English:

=E2=80=9C=E5=89=8D=E7=BC=80=E2=80=9D in Chinese usually means noun other th=
an verb. So I suggest the
liberal translation "=E5=9C=A8...=E5=89=8D=E6=B7=BB=E5=8A=A0" other than "=
=E5=89=8D=E7=BC=80".

Dongliang Mu

>
> > +
> > +.. code-block:: rust
> > +
> > +       //! C header: [`include/linux/printk.h`](srctree/include/linux/=
printk.h)
> > +
> > +=E6=88=96=E8=80=85:
> > +
> > +.. code-block:: rust
> > +
> > +       /// [`struct mutex`]: srctree/include/linux/mutex.h
> > +
> >
> >  =E5=91=BD=E5=90=8D
> >  ----
> > --
> > 2.31.4
> >
> >

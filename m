Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA48224E4A8
	for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 18:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743014544; cv=none; b=bofQAhKJfRNEwJ/dIBQ1KnWKZ+pKNi7z8lz/+mHvQeu/1imMYkj0Oxa/B9hB1Jdl6Waa3RXENyzxYZDPIE5esgXZSbXUI29DQfAAtf9eidRYp7Q9Ix6VAiEYJw/rQLzACzoLKifglD42koSujTkrf1eFpefwIkk6AmYnTaSn60E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743014544; c=relaxed/simple;
	bh=3GCuaFRiBJqbAVFYSqi9R3hp1bxmX5HXeie7MDE5R1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqX7VnVfjdLnLxnpQLeUMqqG/B7WdLD8IorHLSDJVpvMvBxLEzJSMcWVLdc7MYhUxMGKNVtSYTX9Nac0jDBMYMXTQ709epM7X0TRzMT5ikrHIP+vOK+80kPWfTCnBCjPv3r5tmqxKvr09Vp4lE2WO/xlaYQYVBpHsF4jkmjScqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYHgq6SU; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYHgq6SU"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so216815a12.1
        for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 11:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743014541; x=1743619341; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsiPA+wQiDjy+/qU9eR9YHSnTKpdRuheNLQ9Ls8sYTc=;
        b=NYHgq6SUxVGDE8afVqBB/taJ0NWGD/UzXFB/0lsPV9tVXAbXD+HpPTMbAyKzsPD7ZM
         EfGRrMUIaoaAr8pzT8e2xoN+Ubj2/gQPpLoZUDwCY9/SyNgRUlBDU/Ei6HFBX4PJWAmY
         UHn7HcXZ9CP5J7VBu3nERKruDbP5EWNg7V7qB9iPX0fLQWQc13s2WPguVbgBozsTEf47
         sO2wx8wOBiwCfQiNmqxcvU3vECv5of/4C9o3zLwSJkiks9C51YL/y56FrMStiA/wxmQD
         iNm7BJewsGExWCKBNfN0GUbC+P9tAWA7Q1GaKQD7E2DixTsCMsXvzaz2S50NAuSuUeLl
         QE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743014541; x=1743619341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsiPA+wQiDjy+/qU9eR9YHSnTKpdRuheNLQ9Ls8sYTc=;
        b=a+S5UEri9fP1rRYrO0OGgiZs7GkmF6TrsbWAOX4/fW816+AjN5oahly6ff9kGmL7Qo
         NvtGhG/IyckPdelHx26yFmZZjFgQ/lVHHc7pHEDvKCn2CNcnEHfSH6RjdnjGnVCPalOR
         DqXlvG9WREYg+I5qjWDLnozf3DmWoEVSDJ8HOcfUs4vhKIgIQrILH8KrMTxPB0wi6Oc1
         3q0I5HywQ2vShN0dbBzd4Ju20iiFY9u+Ai9Zv2vfwH27wWuI5Ius979OC+QuGjQx1mbC
         RhQtg7cI0LyrGxZzwkidirDvhihUOS5LbmgXlzpR3K9u/kLWsGtDXnTZWh/+ymJPuG9o
         xkDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsZrxcW0To7GTXV5FkKF0EZf94L28FvM1ChUDNu3DvTNjgjnNSGFOEtB8GAHaDGt4KyHuR@lists.linux.dev
X-Gm-Message-State: AOJu0YyLoKb6iXmkIs2YqcANNtjj4NGdZZIQkG0CAZPwWpY4w8Ignvv6
	d9xX5Xjkt4LdBaBOuPSPxJG1ukTt76wcv6vpirZBqX281h49KzeV+RkRn+rINe6tDRhiw+7ruzs
	LO78hICRFGooZ/7oAPgvKflHbTXI=
X-Gm-Gg: ASbGncuqohuPDQW9bkgC810DVekd+eTta3bEV5CiJSuVR/QgonREr5xUyCS5sWN5/G1
	yCzcXwzp/sk3wKfzsH/jcy+JFiDs9y6VAflTSAjBmYn8VRvEB0jB0ySwc1CU9PwB9irRzEikm2s
	/hiGLxqANV9ZCsbt0N9zI1WHxF0AjSZiVad9u3
X-Google-Smtp-Source: AGHT+IHvjBEb8u3bGux3ahHtVwunzcocu6dQwS2Xse9Cp8eI4Z66HuwdqhCdzBpOe4XmdyMVe7tLDyY+cjoIXRJFZBM=
X-Received: by 2002:a17:907:3fa3:b0:abf:6ebf:5500 with SMTP id
 a640c23a62f3a-ac6faeb7134mr50473666b.16.1743014540877; Wed, 26 Mar 2025
 11:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326-string-add-wcslen-for-llvm-opt-v2-0-d864ab2cbfe4@kernel.org>
 <20250326-string-add-wcslen-for-llvm-opt-v2-2-d864ab2cbfe4@kernel.org> <CAHp75Vd_mJggRRLfziWUf0tgr3K125uVBNh9VdSo9LHVJz2r_w@mail.gmail.com>
In-Reply-To: <CAHp75Vd_mJggRRLfziWUf0tgr3K125uVBNh9VdSo9LHVJz2r_w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 26 Mar 2025 20:41:44 +0200
X-Gm-Features: AQ5f1JqGF7dttWsEgjPhabIJU0Qow2xz-VT0UfD-t8uVq_PkVNBOsCT8C5GAZHk
Message-ID: <CAHp75VdQv=0wvgMDGNoXojALWh2B-92gjkO7zrv=d42ocamM4Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] lib/string.c: Add wcslen()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 8:39=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Mar 26, 2025 at 7:19=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:

...

> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -7,6 +7,7 @@
> >  #include <linux/cleanup.h>     /* for DEFINE_FREE() */
> >  #include <linux/compiler.h>    /* for inline */
> >  #include <linux/types.h>       /* for size_t */
>
> > +#include <linux/nls_types.h>   /* for wchar_t */
>
> I know it's not ordered, but can we at least not make it worse, i.e.
> squeeze this to be after the compiler.h? Or even somewhere after below
> the err*.h? Whatever gives a better (sparsely) ordered overall
> result...

I just checked, and the only unordered piece is those two: types +
stddef right now, and if you move nls_types.h after errno.h it will
keep the status quo.

> >  #include <linux/stddef.h>      /* for NULL */
> >  #include <linux/err.h>         /* for ERR_PTR() */

--=20
With Best Regards,
Andy Shevchenko

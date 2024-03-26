Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB113C3CD
	for <llvm@lists.linux.dev>; Tue, 26 Mar 2024 18:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711479342; cv=none; b=dPSd89KvD2hghXydluXBMny9EQRVPuaLQllTGrCa+i0lStgq3zYrTvgP0kDUSNujohApl9iR3MbBJMbPPGjAruE/T8kv0Xsq9dezZ0Fan6xZep75apSjnmHDfsig5TKOkQzvQey5282fRKNJvFQB/zcBWwRXsrz/yzsnomcdthQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711479342; c=relaxed/simple;
	bh=OXTwQCFaZAj0sjd3yq+jvLdZ002w8j6x4hmq5jp5QuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ov+NHkbZtYHBS25p+2DykgNUk0X3Im43XjMTtAwvginQfhjlB5UxevMCT0rFtj84h6e3mvc/gZtJQFhmBUoFjYBjHpjz7TyYj+Crn4dCXRkDmspU2p7T3ywfiz8rppReuOZTLCGWfNbWE3g+Us4VR2HHCi3ybm0dNiIyJHOC+mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yT5UvdBU; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yT5UvdBU"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-476d13e405fso1656483137.0
        for <llvm@lists.linux.dev>; Tue, 26 Mar 2024 11:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711479339; x=1712084139; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXTwQCFaZAj0sjd3yq+jvLdZ002w8j6x4hmq5jp5QuU=;
        b=yT5UvdBUS93qpVkfM46Dq4M+S6onHlyq0TFJ3O8vef5/Olw9hM9cczZXsggrZFkFAh
         cqVatKuHwU1pSlD+LgF7NFEqWpVIHvaIeutybqRILuniP/9/5dZVMtBds8h/YaA8p+yW
         A57uOiMiT7wK7x0wm4PlBVu78byaBAZjYUr14IGAy5CRXF5L4Hjwk8DJ4I3jl+C9/ZB5
         1E2EtjEF7J7bJsuvCgcgM+9TleiIF2waOfbOfTIOzZDs5oWsdQ8H9/kWk9cocNDHsaCh
         SbF/Q024VTVbrjdlR9iB0vDcfWiJCTyeKYDrEOHlZfFJ2t+GIRimd3s+g9ZC56IP8KF9
         2icQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711479339; x=1712084139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXTwQCFaZAj0sjd3yq+jvLdZ002w8j6x4hmq5jp5QuU=;
        b=bODs6fLyrIq84jp6SaXKmSnuLSB6iiI9tJrnSWvnPH7k+v/5Q+rPbxZMYRcYh7tL3n
         JaX7Z0HEF6uWufAQ1ScBDoEMSxbxlOH63g3iGrlqbiqOh1QASbycT8YwMBzlC9wG6RJe
         vWn19D2a684u/4yK4dtDeCCjgWWAkWgmD5UQIhr9Y1uAwnT9Vss3ZNl0v2DiKM8E/enQ
         Wzd/WXnk4g7zyAjxuXBxT9x/qsGAvgw0MjeG6KqV6e3/Dof65KKi+69l7sHOnWGtmT7G
         altbmbOCkS5F83LB8FdxpROu1CdUP3uC1ioMbhN0nyc4gWCkWkHr4tETfacULbkK8MFi
         i8qw==
X-Forwarded-Encrypted: i=1; AJvYcCUYqFQSbfZP4DWohnKlXSnYMaO16iuc4/kdi2PVdWTJ0euUCd8CJToxqCty5ZkGnlHmFIoHZr8KavGAZHvjU7pu8U11Wg==
X-Gm-Message-State: AOJu0YxsrL74ukKlbZY4XJ9JsSPfIkgQYUbz6FlenzOxAlz0M5jMMAZm
	RF8WUJSKe3Xr+YnTUHrDvz2/B67mKsWAZtDrEQm5zDsvkyzYBSqAzKEgop6GTnJwgoEx3cPIui5
	9UDX2vhLpykESHeY1cUDLE8H0zvM4IIUOaZtJ
X-Google-Smtp-Source: AGHT+IE8JrH0I8/953zvrzCMR+hs4V4VMkFMJbs6d/MRRtDQ+IzoyJJNkxrTzBfqLyeMkE0r30YIW3GMqVQZIGPYLOM=
X-Received: by 2002:a05:6102:3969:b0:474:50f5:723f with SMTP id
 ho9-20020a056102396900b0047450f5723fmr680505vsb.18.1711479338882; Tue, 26 Mar
 2024 11:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240326153712.1839482-2-samitolvanen@google.com> <a083fe56-19ba-4c12-8364-944d8bbcc043@ghiti.fr>
In-Reply-To: <a083fe56-19ba-4c12-8364-944d8bbcc043@ghiti.fr>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 26 Mar 2024 18:55:01 +0000
Message-ID: <CABCJKudxjhbLo_2zHBcsPh42vuLUGFj9wUxk+jf5USf2mvUZGg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Mark __se_sys_* functions __used
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 6:43=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> Do you have the link of the report? So we can add a Closes tag.

Sure, this was reported here:

https://lore.kernel.org/lkml/56d3285a-ed22-44bd-8c22-ce51ad159a81@linaro.or=
g/

Sami

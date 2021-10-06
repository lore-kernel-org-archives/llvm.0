Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AD42C83
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 22:00:34 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id m3so16470603lfu.2
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 15:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oxgd4bleC6C+lexYJzk93QvGLlJ7mbzEbFb+QheFLXg=;
        b=NsWmbaQ05qI+dYK9dIElo34qEjE1XjnCFBNdsDZ2GTk/ig5jIHixHlySH+8D9BDJ3X
         OSnnxpuEVGLtuqfOej9IOTMuqZLsEx2q9nyudWfkj/N4VHp/40Pxr3fFk83NLHGi+Ar8
         zSPFr2eO3wdFImbRHR188qCyj2EmFsxXzChrohWTfzHQIGbjAQzo8EPmYoxRUvtUqXub
         ZhFpvAdmMRR2i0PMs78TKAkUD24jRUfxOaoGtr5xGmhZVZ+aWBAJdOYBwf2vQP7H5FK4
         nYamksetskJNAdJuTi312vUqABubmwWrL1tgTtLR/npPWvqwyh+Xj9hdfKWLrE/8988T
         aHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oxgd4bleC6C+lexYJzk93QvGLlJ7mbzEbFb+QheFLXg=;
        b=pPL2Q/O2ACjofCiHo5DgXzum00fVVXsZDKArSvcnq3PEJSzXAenrCSbUoWMOTYd1L6
         dWSCh1tXtTY0HpaMRdvgcXHu3lsL78EcmaVZa+rupcOYuwU3ZV9SvhKE1kyKpQFrZ3Xn
         bgrn0ZnoDIVMvtA4ZJxgxg4yX8PdULkskNYVksPGiHe9bEjl/RclsA/6EkWXLbekjntt
         VvXKioVD5BYfkAiFNoQDy+uyaisED5xFkizC21Q0vnNL2UTyl0obeRCSLzj0r+/Nb3aS
         wkm1X79Cyzmgu3NOo69lKv1kLHe70mkrjeq6Omz/LhCwy/Jztp/Eyk/OwRgM8Ltw3RgB
         GCEg==
X-Gm-Message-State: AOAM532rzLxeAHd1yYY2GxzJEoxI0Ie2dDBvjkHvLiiDh6XqSIQzVu17
	y7MJoIjuVucHSXVoAFBb8oj1D5xe+fz02sNSTRo0GA==
X-Google-Smtp-Source: ABdhPJzrzk7JqOrwnXi2fahE4L8/jK+yyxAyTW0kXLgotlyRv5UBVWtqjtdXFMtGdFNRXUUl4iiIihb/UfiDok7WZ6o=
X-Received: by 2002:a2e:750e:: with SMTP id q14mr592688ljc.338.1633557632709;
 Wed, 06 Oct 2021 15:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmrOYTxVd1f+=g4e-+q0fD+BZZTBGOkzcRq494bYYCkgw@mail.gmail.com>
 <CAKdWgSyH4tYESpUEBx1SqK0F=ydG_0r=MT0-s5D9zC4rS0EppA@mail.gmail.com>
 <CAKwvOdmSA2LmFXsPPrpBahR7bWXaLH=KdwepwvF+DqA+zGjROA@mail.gmail.com>
 <CAKdWgSzX9VR-SogD5bG0mgVDTE-fWbO1d1h4Uk7OW5STPsDB3w@mail.gmail.com> <CAKdWgSyKkN5m-qJsAyk9S27xnsV6EjAw8js8WeMfjd6Ose0mFA@mail.gmail.com>
In-Reply-To: <CAKdWgSyKkN5m-qJsAyk9S27xnsV6EjAw8js8WeMfjd6Ose0mFA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 6 Oct 2021 15:00:21 -0700
Message-ID: <CAKwvOdncFaA6Bdnr8x1K3DOjC=EiH_qu5Cw6p--je-szRgd=AA@mail.gmail.com>
Subject: Re: missing build.log files
To: Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: llvm@lists.linux.dev, tuxsuite <tuxsuite@linaro.org>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 6, 2021 at 6:24 AM Vishal Bhoj <vishal.bhoj@linaro.org> wrote:
>
> Sorry for the wrong link. Here is how the build.log would look:
> https://builds.tuxbuild.com/1z8Lj56Txf3Ibe0tfVlobPFuU39/build.log
> https://builds.tuxbuild.com/1z8Lj56Txf3Ibe0tfVlobPFuU39/

LGTM, thanks Vishal!
-- 
Thanks,
~Nick Desaulniers

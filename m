Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FB47F
	for <llvm@lists.linux.dev>; Tue,  2 Aug 2022 09:44:02 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-3246910dac3so82748757b3.12
        for <llvm@lists.linux.dev>; Tue, 02 Aug 2022 02:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=onO0QVTdbuZy+VIdNlFdgRbLEaQObKwz+4ju3vxIaa4=;
        b=JB1JQalM7496o1ilmTyrg3FJokR0C3NC3UbF7FBYTywSRj8jQvr6bir696XkFxdxTu
         yMfLEB2+T4vPR2Offx4oFxi3DsbvC9GT6I8zBos3A0ZcfnxTp2yi40pqK004Y5LZUiai
         dKhywDylH3U6Y9jMtRU1Zy+mLXWdS9MUmywVdTP7Nx+ugDtxcxmjZCNGqxIcMoQ/c5YA
         fkPJqS73wDDEwWHVmGFnJI+lU/4L0u8ObT+TeBi4wZ46tbL/euYljzXAFxGYU878Xl1L
         ZLu80vlgQ/PvTYyiHlF14vYZJFKwKvJnkxce6olD5MjRorePwrMkci9XnB+L5UyNqIuz
         oZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=onO0QVTdbuZy+VIdNlFdgRbLEaQObKwz+4ju3vxIaa4=;
        b=Mz8LeVo8XUPlaDXeruCO9sb0Wiv0hJsaoI7FHkkGb6A4Qgkk4WGBHOsWM73NVaQl24
         fAqzn4N6f9xoy+8l07mzDLiq/J/6dZMg2UeV5d+HdNDizyGqw2/OFRDtPybhcYlsSvcq
         Tyc/rAD7BTLrswTh3Ltx5OGMtuoqDeEKwqK9jeayzDOimU0F3OEwjMDiEgeWwDwHVMUT
         ItDnt8sNN+p9JBEFXuF7nRwjAMVghBodHggkTP3o4OdADYV3Vw7nuQrDPPlCav91621i
         L0eUxTWMf53fkKy+3WpFDSO4yGF0fuVUptxSDgo3wzOs40u8T2tdr0iXWXJfXC1fd4d8
         x22w==
X-Gm-Message-State: ACgBeo221/j8M69uAbWMU40VTPJlC3EMMjdfMgsaMLFirW9Sa8p3phIe
	ODreDjTeHFhaARq5Fw2ifdPtwszNBhvlxOFJqhQ=
X-Google-Smtp-Source: AA6agR5WJQ4F9mZ9XiYXjVraY2X7e88u6lql2UmJij+VE9Is5l7UXJSrdRkUfYze3ixZbB88Blkvqxj36JsNu2GGA3U=
X-Received: by 2002:a81:920f:0:b0:323:423e:660b with SMTP id
 j15-20020a81920f000000b00323423e660bmr17677155ywg.488.1659433441242; Tue, 02
 Aug 2022 02:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADVatmPNCUXqKBoLCpwBA90ocZA6-u+=y1_jz=3C+KwEmN54AA@mail.gmail.com>
 <YuLqQrKtDnTuJdZK@dev-arch.thelio-3990X> <CAK8P3a341-H8uo9oABQCeRvhmKDs5eBwTGxsuZhO6Pt+WD8v6Q@mail.gmail.com>
 <YuhbtB9+1rTYtT23@dev-arch.thelio-3990X>
In-Reply-To: <YuhbtB9+1rTYtT23@dev-arch.thelio-3990X>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Tue, 2 Aug 2022 10:43:25 +0100
Message-ID: <CADVatmNjdgBTo5+OjFeXP7rquuvR2NpkEMBDSLtahkw5W0HX3g@mail.gmail.com>
Subject: Re: arm ixp4xx_defconfig build failure with linux-next and mainline
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 2, 2022 at 12:03 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Sun, Jul 31, 2022 at 01:57:04PM +0200, Arnd Bergmann wrote:
> > On Thu, Jul 28, 2022 at 9:57 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > On Thu, Jul 28, 2022 at 06:33:07PM +0100, Sudip Mukherjee wrote:
> > > > Hi All,
> > > >
> > > > Not sure if its reported, builds of arm ixp4xx_defconfig has been
> > > > failing with clang with the error:
> > > >

<snip>

> >
> > It clearly worked in the distant past, so it should be possible, I just doubt
> > that it's worth doing this for a 20 year old platform, as there are no
> > new users and the existing users are probably not planning to replace
> > their user space. On the other hand, it is possible that there are users
> > that are only waiting to move to a recent debian armel build.
>
> Right, I don't think there is a point in making this platform work in
> little endian mode just for the sake of the build problem; it should be
> done if there are other users that will take advantage of it because I
> doubt people are going to be using clang to build kernels for this
> platform.

Thanks Nathan, Arnd. I will drop this config from my builds.


-- 
Regards
Sudip

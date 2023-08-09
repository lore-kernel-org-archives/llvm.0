Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798411BB3A
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 15:53:45 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-63f7c242030so18736306d6.3
        for <llvm@lists.linux.dev>; Wed, 09 Aug 2023 08:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691596424; x=1692201224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jj7DTrNGm2MlP+wWjRwlCn2slphii4CREHOcaRrbpRQ=;
        b=WSG9VJ4kqh5Mtb3jRAk1eax3vy+FN1e6ulga7XaOG+bzATV1T6AoSZZJ6tHaRPIT09
         wbSLjuf/2gvyw13A5P7eg74i74L0f3MiOnykHXQxRGMZiWG+0fGMD4LtRv2syrrT2+Du
         paTp70rkBJeO8msKahuMyka6nLK/0dobgJXfI8oVoiXkx2Hk4Kiyz3HnuzPvfIPbnQx5
         LUrYHQqnArLjbFJE+hM8M4VWI2t61QLGIJN5aQrU/nWupmh7gIHMAlVf4UJXOTVBYr5R
         Mja3euKHWPwwm9d+I27DWXeePSQcr+J0wV9c1iiYFbfpkHy3nl1PYEUIuUPmH0KdfR0l
         fkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691596424; x=1692201224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jj7DTrNGm2MlP+wWjRwlCn2slphii4CREHOcaRrbpRQ=;
        b=WeKifXfbgSUSXsZ9utvH0schpkYdti0l0iQo6QSa3Rhl+ZTM6mS/jvnECmwKx72Zbw
         c/ijLkgcd7ogQeyu9oIujSpHo5J0in8bSELeolb/qDnZ11/zbIpP+CDYoUZGft111sFO
         mJf/hEgR6h16eW+OmrRJv7JKVBUUaipEzNg9/dQcTfbh6CuLL6YqcMpAnoC82SStPPpZ
         A9XtxXYB0jbI6ZawoC7Z9qzKrrG9sIYgWSJv0J+auz+s1zh3xJvtSc1yDuYV0RqNbXF5
         FvK8qW3Exq4QRKJS5dmmFxT46Z7h86xfSGVyX9kXdZdeuBHyE3nAR2RF0wZcDLPKTKJn
         0lng==
X-Gm-Message-State: AOJu0YwyXLTyHYBr2sMD1geehSlaYFCzK3MdHrq/v4d/Se9TGW2ntMww
	EDOL7ADSYmwI+TRpcMkZtAXbDX+fs9gaSDBAMzl2yw==
X-Google-Smtp-Source: AGHT+IGnyYPoPMY+tg6XgaKZ0G9p7zeftFr4iFQivgyeuEqZld3kQzaAkN0BHMAs8BjKKZUovUnhvDLX56wgHF/CjlY=
X-Received: by 2002:a0c:da90:0:b0:63d:87e9:2e56 with SMTP id
 z16-20020a0cda90000000b0063d87e92e56mr2830195qvj.8.1691596424062; Wed, 09 Aug
 2023 08:53:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308091820.0dPY7D6f-lkp@intel.com> <ZNN1WdZ5J/e5OPAt@elver.google.com>
In-Reply-To: <ZNN1WdZ5J/e5OPAt@elver.google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 9 Aug 2023 08:53:33 -0700
Message-ID: <CAKwvOd=hgqas-kMxvOgviff43XBmwgERrfGi-ZO45DOcEuG_yw@mail.gmail.com>
Subject: Re: [linux-next:master 8173/8441] include/linux/list.h:53:13:
 warning: '__preserve_most__' calling convention is not supported for this target
To: Marco Elver <elver@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 4:15=E2=80=AFAM Marco Elver <elver@google.com> wrote=
:
>
> On Wed, Aug 09, 2023 at 06:27PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   21ef7b1e17d039053edaeaf41142423810572741
> > commit: fee8feb67f0b2954eb7a2a259122e43a15cf3a52 [8173/8441] list_debug=
: introduce CONFIG_DEBUG_LIST_MINIMAL
> > config: hexagon-randconfig-r041-20230808 (https://download.01.org/0day-=
ci/archive/20230809/202308091820.0dPY7D6f-lkp@intel.com/config)
> > compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.gi=
t 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230809/2023080918=
20.0dPY7D6f-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308091820.0dPY7D6f-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from arch/hexagon/kernel/asm-offsets.c:12:
> >    In file included from include/linux/compat.h:14:
> >    In file included from include/linux/sem.h:5:
> >    In file included from include/uapi/linux/sem.h:5:
> >    In file included from include/linux/ipc.h:5:
> >    In file included from include/linux/spinlock.h:56:
> >    In file included from include/linux/preempt.h:12:
> > >> include/linux/list.h:53:13: warning: '__preserve_most__' calling con=
vention is not supported for this target [-Wignored-attributes]
> >    extern bool __list_valid_slowpath __list_add_valid_or_report(struct =
list_head *new,
> >                ^
> >    include/linux/list.h:44:39: note: expanded from macro '__list_valid_=
slowpath'
> >    # define __list_valid_slowpath __cold __preserve_most
> >                                          ^
> >    include/linux/compiler_types.h:132:49: note: expanded from macro '__=
preserve_most'
> >    # define __preserve_most notrace __attribute__((__preserve_most__))
>
> To silence this warning, we can just guard it based on known-supported ar=
chitectures:

As a band-aid, sure.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Long term, perhaps we can fix in clang what __has_attribute evaluates
to for this attribute depending on the target.  Filed:
https://github.com/ClangBuiltLinux/linux/issues/1908
^ Consider adding a comment linking to that in the sources.

>
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_type=
s.h
> index c88488715a39..c523c6683789 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -128,7 +128,7 @@ static inline void __chk_io_ptr(const volatile void _=
_iomem *ptr) { }
>   *
>   * clang: https://clang.llvm.org/docs/AttributeReference.html#preserve-m=
ost
>   */
> -#if __has_attribute(__preserve_most__)
> +#if __has_attribute(__preserve_most__) && (defined(CONFIG_X86_64) || def=
ined(CONFIG_ARM64))
>  # define __preserve_most notrace __attribute__((__preserve_most__))
>  #else
>  # define __preserve_most
>


--=20
Thanks,
~Nick Desaulniers

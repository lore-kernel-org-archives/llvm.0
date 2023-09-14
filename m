Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE96118E1B
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 18:14:33 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-502a4f33440so2128328e87.1
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 11:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694715272; x=1695320072; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+px6xB3dKSOuOKTUx8ifL1ajg/qno+d0d5z5ssjqDw=;
        b=Cf0/xlyge1IMBFw+/KZFmCdx3MifqVmMcg9k2nInAEoOTGojMRv1wLR4gy1X4o4Kzu
         +XCH2M0hfWHanMV3d+pQEfypu7XoT24WTBiDs2lhrOu85j3BP7h9EMm3aiRUoeWBeBIe
         aYHMn6gHPWa8gCD5vZpxrw8SmMPFK+ewHWj4kMBWi5mur5lYsLUdfAOM2tGbfws8cIIw
         c/sVsHdoqe+6bVarLbJmba2TVStYYmk6qr1VEPpNI6nzXKlLLX9GW134XhqYoZ7BiDJf
         +g/AkHb4aXW7svR2RCkAlyN+m9+vMHjEBodxHb/QdcBh8+BDeD2LAq9DSfOlDjkWhE6o
         CtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694715272; x=1695320072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+px6xB3dKSOuOKTUx8ifL1ajg/qno+d0d5z5ssjqDw=;
        b=ttWnqUZ7zYcQHFVM2XItww889Bx4Lb8h/4+YYGC74jI39eSERVh2+rBJ9AUJrfRwOY
         VtC4AhKkWkbx0wKSpOZVrR/BjblcY1oHgmmObSHEOCMWatdYu6ZZ49Pa+paFym4kYj9Z
         E8KKQVdpP/IF2+QST/BvPVARl9kOBijxEtSFn8sg0xDoczcSVfVsGRQj+AWbn00BZhCz
         2d6EguEknex/YZjH8+O9BlmJZTEwigzu6omf5z7VJng/119drdOCk+2EWXgtRcoZBqFc
         JxRMP0vgMEeD4TLIny34pOXsg5dR93rW2aRh0kDHQFKpp1LUHeoMP67JsuU91xS3p/oq
         p2+g==
X-Gm-Message-State: AOJu0YwnDYQSLoVDaUd20AxGh+bdmvJcDZDZXJ4mcn5BtbA9d3I0z/Vp
	AcmUMuSSWi5rQr5dbfLggQyNnkfUXSWzAXPmEBM=
X-Google-Smtp-Source: AGHT+IE/SAIvZUH2mYGIhXW2D+jjNFI/gSZEHoEVhKgyJbu/+f7/e/YwjgdnHrpcrFK4eNBJ/51d8t4cO7W03tJYSSc=
X-Received: by 2002:ac2:592d:0:b0:500:a6c1:36f7 with SMTP id
 v13-20020ac2592d000000b00500a6c136f7mr4800523lfi.3.1694715271697; Thu, 14 Sep
 2023 11:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>
 <ZPozfCEF9SV2ADQ5@krava> <ZPsJ4AAqNMchvms/@krava> <CAKwvOd==X0exrhmsqX1j1WFX77xe8W7xPbfiCY+Rt6abgmkMCQ@mail.gmail.com>
 <ZPuA5+HmbcdBLbIq@krava> <ZQLBm8sC+V53CIzD@krava> <CAK7LNATiHvOXiWQi9gXJO9rZbT_MFm6NddaWqoY4ykNWf+OYsQ@mail.gmail.com>
 <ZQLX3oSCk95Qf4Ma@krava>
In-Reply-To: <ZQLX3oSCk95Qf4Ma@krava>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 14 Sep 2023 11:14:19 -0700
Message-ID: <CAEf4Bzb5KQ2_LmhN769ifMeSJaWfebccUasQOfQKaOd0nQ51tw@mail.gmail.com>
Subject: Re: duplicate BTF_IDs leading to symbol redefinition errors?
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Marcus Seyfarth <m.seyfarth@gmail.com>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Stanislav Fomichev <sdf@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 2:52=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Thu, Sep 14, 2023 at 05:30:51PM +0900, Masahiro Yamada wrote:
>
> SNIP
>
> > > > so the change is about adding unique id that's basically path of
> > > > the object stored in base32 so it could be used as symbol, so we
> > > > don't really need to read the actual file
> > > >
> > > > the problem is when BTF_ID definition like:
> > > >
> > > > BTF_ID(struct, cgroup)
> > > >
> > > > translates in 2 separate objects into same symbol name because of
> > > > the matching __COUNTER__ macro values (like 380 below)
> > > >
> > > >   __BTF_ID__struct__cgroup__380
> > > >
> > > > this change just adds unique id of the path name at the end of the
> > > > symbol with:
> > > >
> > > >   echo -n 'kernel/bpf/helpers' | base32 -w0 --> NNSXE3TFNQXWE4DGF5U=
GK3DQMVZHG
> > > >
> > > > so the symbol looks like:
> > > >
> > > >   __BTF_ID__struct__cgroup__380NNSXE3TFNQXWE4DGF5UGK3DQMVZHG
> > > >
> > > > and is unique over the sources
> > > >
> > > > but I still hope we could come up with some better solution ;-)
> > >
> > > so far the only better solution I could come up with is to use
> > > cksum (also from coreutils) instead of base32, which makes the
> > > BTF_ID_BASE value compact
> > >
> > > I'll run test to find out how much it hurts the build time
> > >
> > > jirka
> >
> >
> >
> > Seems a bad idea to me.
> >
> > It would fork a new shell and chsum for all files,
> > while only a few of them need it.
>
> right, I have a change to limit this on kernel and net directories,
> but it's still bad
>
> >
> > Better to consult BTF forks.
>
> perhaps there's better way within kbuild to get unique id/value
> for each object file?

let's just use __LINE__ + __COUNTER__ for now and teach resolve_btfids
to fail and complain loudly about duplicate symbols?


This will give us time and opportunity to implement a better approach
to .BTF_ids overall. Encoding the desired type name in the symbol name
always felt off. Maybe it's better to encode type + name as data,
which is discarded at the latest stage during vmlinux linking? Either
way, this baseid hack seems worse and unnecessary.

>
> thanks,
> jirka
>

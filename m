Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE5579CF
	for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 23:02:16 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-76dc77fd024so399017385a.3
        for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 16:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695164535; x=1695769335; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsamzLgoftdBGLeSOAJVBaz7dEKkC6/mbAZMp6ArQO0=;
        b=WNaNm4Yni87RqXezDT+VDasEvdJXCJhLywpQds/+ArDnpd+6teOtaN5rKZcpY9RekI
         smrLY9YaQcQC91fr27Ua6/8yPbNg9O+W4jvA8gbN5LsV8JyXgXbnsWluGt05TujZUiy/
         o8c9JaMmF4N2TjhYZ3h/xrR/iRDyjNdK4UqQ108Yenc/PQ5WDMi65bL6QRXhZCI4Cd9o
         26HeiRhOGDWDJrn5BVVCZlVLoSCQ31j4RUnpXmhXp0JyLfpnDblf01QWrIZMYVj2iGgh
         WqcKFBd8ogH8q4szy39BVPTohpouPJRzpuTZLMuu1vxiGRUJl9YA7QBnNwJBikXz/mFe
         HhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695164535; x=1695769335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsamzLgoftdBGLeSOAJVBaz7dEKkC6/mbAZMp6ArQO0=;
        b=pIpC8bNBlvubRrZVjsbmcRiej2TdFN+GNrh1/0Ph9mUcc0+qLwv/yLqbHBAPgwQjYB
         0OdevGO4unlT1OcLBzWW1eyZ9PvU1QKXXp8fNOidMiH/oA8akvnAuD79Mp8xPhkkwKQJ
         /P5rzW2Jxp42Yk1sB8dzkBkWtAnIss34xf5ow2C/71b6bJmDsykPGdgZvbAuzVNgY2wv
         SuX5ghwFlcxUu+MwrtNTNO+Ma8FyEdLzoVrEkLPX5EjMk7OrZ3jTJJi67O5r73chQbJJ
         LF0nb9cl8qvggIptrfMOPNYc4i3obq282iAD7mzTWiLrxZ6wxUHq7vppdzV7KaNrA3xR
         rPbA==
X-Gm-Message-State: AOJu0YxqD7hwQjx+MdUTrQw4gPEtuBgqLFLgnVeaICfGcXf9uGpGhfNW
	jL7M/0rwdMdMqiErFA3pJILBRPE1Qpgql063CdhdNg==
X-Google-Smtp-Source: AGHT+IG+0se+zvGzXlhi8nAW/MoHW1HhxBn6NJ/oBiOD4oEkgPCx0yE7H4ZHo6wsVdUyj7ZI0IEDDb8S7MDq1/Xr8RM=
X-Received: by 2002:a0c:de03:0:b0:656:49a3:21ae with SMTP id
 t3-20020a0cde03000000b0065649a321aemr776936qvk.15.1695164535355; Tue, 19 Sep
 2023 16:02:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHRSSEzrL6uPEvrhW692=+=17EJt+6_-p2z0K5esG4Ff57MSpw@mail.gmail.com>
 <a94cd4e0-7092-04fb-9b89-da236bfec57f@collabora.com> <CAHRSSEzMo=-eS8KRqHjSMcBqWCsK2mU4zWg=5KFYx2XyL29Z0w@mail.gmail.com>
 <CAHRSSEzasi7ZRSe3t_ij26cYCc_58eALNn_mMn6B5HFqEbU9EQ@mail.gmail.com>
 <ffab5719-e6f4-4e21-1095-c129928076af@collabora.com> <CAHRSSEzo0cSQCp_zk4h2BP2EGdqVHSbZOLC-3gf7c6+uOK9R4g@mail.gmail.com>
 <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
In-Reply-To: <CAHRSSEw6Vv+3R0OOva8qY3pF-00TZdQku3MxN2OFSaZkN2di+Q@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 19 Sep 2023 16:02:01 -0700
Message-ID: <CAKwvOdmni7Vqo0W1qgGkVx8GH4+D7JXO5QTQgqGv8D=Go4oPAA@mail.gmail.com>
Subject: Re: Please add new Android branches
To: Todd Kjos <tkjos@google.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, 
	Viktor Martensson <vmartensson@google.com>, Betty Zhou <bettyzhou@google.com>, kernelci@lists.linux.dev, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 3:54=E2=80=AFPM Todd Kjos <tkjos@google.com> wrote:
>
> Guillaume,
>
> How about this for android trees:
>
> 1) same compilers as current config (gcc-10, clang-14)
> 2) archs: arm, arm64, i386, x80_64, riscv
> 3) same configs as current android tests
> 4) plus configs used by corresponding stable kernel
> (https://linux.kernelci.org/job/stable) not included in #3
>
> We get a nice benefit from sync'ing with the stable kernels since it
> allows us to tell which issues originate upstream and which are
> introduced by android changes. It's also useful to build each with
> both toolchains so we can expose the cases where gcc-10 is OK but
> clang-14 has issues (and visa-versa).
>
> I don't think we need to build all of the combinations if there are
> too many builds - we could trim out some of the configs from #4 (you
> can recommend which).
>
> We'd also like to start in an all-green state. So let's trim out the
> error cases that aren't caused by android kernel code. I think there
> are some 32-bit cases that fail with the clang-14 tools and some other
> cases that fail in stable.

That would be news to me. Got any more info on that?

>
> Could we start with all of the builds for #1 - #4 and then tune it up
> after a few runs to get rid of long-failing cases and/or to just
> reduce the load on the build service?
>
> -Todd
>
>
>
> On Wed, Sep 6, 2023 at 12:50=E2=80=AFPM Todd Kjos <tkjos@google.com> wrot=
e:
> >
> > +Viktor Martensson +Betty Zhou
> >
> > Guillaume,
> >
> > I think that's a great idea. I'll get back to you with the set of
> > configs, arch, compilers we'd like to have coverage for.
> >
> > -Todd
> >
> >
> > On Wed, Sep 6, 2023 at 11:46=E2=80=AFAM Guillaume Tucker
> > <guillaume.tucker@collabora.com> wrote:
> > >
> > > Hi Todd,
> > >
> > > On 05/09/2023 19:18, Todd Kjos wrote:
> > > > On Thu, Aug 10, 2023 at 8:56=E2=80=AFAM Todd Kjos <tkjos@google.com=
> wrote:
> > > >>
> > > >>
> > > >>
> > > >> On Tue, Jul 11, 2023 at 4:57=E2=80=AFAM Guillaume Tucker <guillaum=
e.tucker@collabora.com> wrote:
> > > >>>
> > > >>> Hi Todd,
> > > >>>
> > > >>> On 11/07/2023 00:41, Todd Kjos wrote:
> > > >>>> Please add the following new Android branches to kernelci testin=
g.
> > > >>>>
> > > >>>> repo: https://android.googlesource.com/kernel/common
> > > >>>> branches:
> > > >>>> - android15-6.1
> > > >>>> - android14-6.1-lts
> > > >>>> - android14-5.15-lts
> > > >>>
> > > >>> I've created this PR accordingly:
> > > >>>
> > > >>>   https://github.com/kernelci/kernelci-core/pull/2002
> > > >>>
> > > >>> Please note that we're now operating with reduced build coverage
> > > >>> due to some temporary limitations with our Azure subscription.  I
> > > >>> know the Android kernel builds should be covered by the GCP
> > > >>> clusters but right now the system is designed to distribute
> > > >>> kernel builds randomly across all clusters so we can't easily tie
> > > >>> Android builds to the Android clusters.  Hopefully we'll find a
> > > >>> solution to go back to normal coverage within a week or two.
> > > >>
> > > >>
> > > >> Hi Guillaume, Any ETA for when the full set of builds is restored?=
 We still have greatly reduced build coverage and it's been a month.
> > > >
> > > > Ping. We are getting a lot less value out of kernelci with the grea=
tly
> > > > reduced set of builds for the Android kernels. When will the full
> > > > build coverage be resumed?
> > > >
> > > > If it needs to stay reduced, can we decide precisely which builds a=
re
> > > > done for Android kernels?
> > >
> > > Sorry for the slow reply.
> > >
> > > I think it's fine now to re-enable the Android builds and maybe
> > > we should also take this opportunity to confirm which ones are
> > > the most relevant to you guys.  As part of the process of
> > > adjusting the build coverage, I also fixed the GKI builds which I
> > > thought were the main ones.  Even if there is enough build
> > > capacity to build "everything", keeping it streamlined to what is
> > > really useful makes the overall system more effective.
> > >
> > > Are there any particular combinations of arch, config, compilers
> > > you care about more than others?
> > >
> > > Thanks,
> > > Guillaume
> > >
>


--=20
Thanks,
~Nick Desaulniers

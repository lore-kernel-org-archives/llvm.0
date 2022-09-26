Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00DF137D
	for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664192133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=El6s5Me40WjqNMPIsI01upfNOG9tCRVFThB/uqNE3Fc=;
	b=UrK9/XS2jlcN09GVveJZTR5qNDu+7Fn4F0fXIuHRDH55xdT6rAuTEd5ujyD5OUBZw9bUeT
	WcgnCOWHR5qLc+roju8GHu75u/0boz6esVO85TUqCHyJjIpm25rKUJAzHqt5ZhDyvyO6t/
	ej9OokJIoDdN+DpZCzGsI/XOhjtWecs=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412-MPjbTMsYMl-1INbKZwnyoA-1; Mon, 26 Sep 2022 07:35:32 -0400
X-MC-Unique: MPjbTMsYMl-1INbKZwnyoA-1
Received: by mail-vk1-f200.google.com with SMTP id b126-20020a1f3484000000b003a3145e09a5so2260164vka.6
        for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 04:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=El6s5Me40WjqNMPIsI01upfNOG9tCRVFThB/uqNE3Fc=;
        b=z99ohL8E6AdnDwbpZqTOzScht0M+hdn93mJeaZuNihvm7zq/HZd5uXpyBrzhmXhpje
         b/ng1hEGIkW3Tyjqynj8IejKpaeZ6LcevFpnuRqh7pp0vXTvhqDfsKKkAe+e8d9C+Vz7
         OPfnFV4midUGbSdXq+jrEmH9vIAGQVyKlA2piMKkpzL7Rbngo14MamgWpv2GNtL1TrUw
         PhVL05FGq+loVGkUsAZogyfBYOSr2O1SgOzfL2ieaQnHWo2eAR7nTohX679oaMyjlhT0
         YvOfhY8kzCbHcYkBIarV1Yk+t3GY0M4BvlxGSE6Cf/RRUNXHmjb8sKzp+aM8fjMoWTFA
         DF+A==
X-Gm-Message-State: ACrzQf3AJv+zp0qP+LSRACNI+VZMhTCvmY2lCcHaP0AjFx4gMItlUtDG
	r9AqXyeA6vpY49BsoEJChPeZ0ITv1K9t3yIBbm2TTjafFKPpUnmJ9ZvEviRMiw+WmBA1Brv91VX
	+WrjtugsC1gr7ETlOn9vhrXqRSfVmeA==
X-Received: by 2002:a67:dc98:0:b0:398:c70f:9357 with SMTP id g24-20020a67dc98000000b00398c70f9357mr7700219vsk.76.1664192131945;
        Mon, 26 Sep 2022 04:35:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7QffRF1yNXJ07+v6HXx6c3EHwuogm4Tj8Rvx8Y1YOfwF0OM48DctOrSJEUHph+UD/b5tVJ6lKINT5kRwE2x6k=
X-Received: by 2002:a67:dc98:0:b0:398:c70f:9357 with SMTP id
 g24-20020a67dc98000000b00398c70f9357mr7700205vsk.76.1664192131763; Mon, 26
 Sep 2022 04:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAH7mPvj64Scp6_Nbaj8KOfkoV5f7_N5L=Tv5Z9zGyn5SS+gsUw@mail.gmail.com>
 <ba821ade-1573-4c35-8fbb-285283817147@app.fastmail.com> <478D9484-E404-4A96-908C-4DE0F7C23997@cutebit.org>
In-Reply-To: <478D9484-E404-4A96-908C-4DE0F7C23997@cutebit.org>
From: Eric Curtin <ecurtin@redhat.com>
Date: Mon, 26 Sep 2022 12:35:15 +0100
Message-ID: <CAOgh=Fx-sjUKBCPSYX+6JEn39Vv6LLkTMBVRCOGOa9AfJ4Trag@mail.gmail.com>
Subject: Re: Any interest in building the Linux kernel from a MacOS host?
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Sven Peter <sven@svenpeter.dev>, Nick Desaulniers <nick.desaulniers@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Nick Desaulniers <ndesaulniers@google.com>, 
	clang-built-linux <llvm@lists.linux.dev>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, asahi@lists.linux.dev, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Sept 2022 at 10:21, Martin Povi=C5=A1er <povik+lin@cutebit.org> =
wrote:
>
> FWIW my current workflow includes building the kernel under macOS, so
> there=E2=80=99s some interest from me, but that will pass once the portin=
g
> project progresses enough. So far I get by with some local duct tape.
>
> > On 26. 9. 2022, at 10:09, Sven Peter <sven@svenpeter.dev> wrote:
> >
> > On Mon, Sep 26, 2022, at 09:51, Nick Desaulniers wrote:
>
> (...)
>
> >> If this might seem helpful
> >> to anyone's workflow, I wouldn't mind pursuing this (with some
> >> cleanup, sending a more formal patch set).  Maybe this helps us
> >> bootstrap or get Linux up and running sooner on these machines?
> >
> > I've been either using a Linux VM or just a bare metal system running
> > on these machine for quite a while now to build kernels. This would've
> > been useful when I originally started though and VMs weren't working ve=
ry
> > well yet so maybe it's still worth pursuing.
>
> I really wanted to do it in a VM as a saner path, but I didn't find
> a satisfactory way to share the working source tree between the macOS
> host and Linux guest (which wouldn't slow down the build).

My way of doing this efficiently is to create throwaway commits, in
git, just to push code around to various physical or virtual machines
in my house. Because git is really fast at pushing incremental changes
around:

https://github.com/ericcurtin/staging/blob/master/git-push.sh

But if you eventually find a way to share a filesystem (which wouldn't
slow down the build) between MacOS and a Linux host via qemu or
something like that I'd be interested, that's most ideal of course.

>
> Martin
>
> >>
> >> Take a look at the commit message linked below for the trials &
> >> tribulations:
> >> https://github.com/ClangBuiltLinux/linux/commit/f06333e29addbc3d714adb=
340355f471c1dfe95a
> >>
> >> Thanks,
> >> ~Nick Desaulniers
> >
> >
> > Best,
> >
> >
> > Sven
> >
>
>


Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B85349D0
	for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996101; cv=pass; b=egKdyNHRQwcObBY2rqYqNnumNwTKpDaJa4ZzUL/plO4g6JeI/AyKkPDbcSZZ8m3DQqFHL8XB72TbdfSuJptr/eg6LtvaDYp+twDTW/i4ZGUtSq2lQeL7agRbXTgubHRZRCRF4yvdV2/eM1IpgZciBzN+5bdoX7xPP9zLR7K9Cjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996101; c=relaxed/simple;
	bh=3mwSDPTFjJGkaatL1Lo6Mh8o6JdUk3CgZRH07sGguXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5lta3BKxoD45/kdQhjnfNzBF079UCz3i5kQw2R9bnvBNvKtoRinI84Le0IuKOlXJHQuCmOBTG+MpUiWKSI2bnDRzvkQCr6H2E9ebpxEF1L3c/FFKOClD1FARVglSRnXMwgqBp0VNxd/1VxFdElWe6gnNBeEm5j11dRS8W6L3ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ly1skk7c; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ly1skk7c"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-535f598d126so605761cf.1
        for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 09:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996098; cv=none;
        d=google.com; s=arc-20260327;
        b=BjCSpB2Brn38nRZWF06RRgnu+ISC08juf6R0tUQfREJadksTQXR/7mlzC09N/SzpGB
         zMVE6Ou4UzrH5lXR0JhEdHw3mdVJbmGcpqZ/u8MYtHzmuJJuMJE9j+4LfqBdFsqUrKCH
         4krAGMGAoe27T8gd9EWDKbbyDUuuMLDGddO2aiM7YaIrB+ukvzD2CurcoyUbfQyf72uB
         oFzPsllpJgF4FRTZuJSDAZaj5TnrMwtAK/kO6703M+UVqoYB1bmw2kJXFT6vxc49LuUU
         unl9rZL/qChDhUUeuYTD/ZQOFDhL2Fl8jjoJjH++TsI8AuXQ9cDqt2ziM8tH+vxgxI9o
         6H1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        fh=BBZ4iyxQtZE44w/Sc+a4pEyUhifxYURWj9wrAK2nDt4=;
        b=XnBrwd1ugu4yR4VhXbBvqxKeaVs0aqxieV10EkartosAvXYM7b7M0HWEzuBaJJf5pl
         6kRiCfbNj6U0dgluoFc2afXS8MxDO7a602lyErNX1Ujd6N5z9GReaK4ukSbrQLwm0DEE
         LqjtPMEJ/uMsakl97tnMWNsPtJ7iC1LS81kp0qoUphti76CZPSX4sD0lUYPxzfouBvml
         MUgu4vn8nr0A3atXW55dgWk2dQLxu6M1wni4l7EVGnzIpDuPSEhAthRaQfLoUYcW64Nx
         rl6sEo7Y9w6+z1hqvGe+BhiDJIzPvJpTmYTP1kYNRdEK8UI/8G+sq8mFX0hzUGFXb2hv
         Bgow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996098; x=1792600898; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        b=ly1skk7c4C5vtGV3cbo6BSQX4GNtmVPw0XKFFqv41FTNFWMCFyrmg2Fyxjf3VThmPR
         pgyjJocF+SdPMjLhEDzXX/DDorCTBQsIS2ld+8NZjNXG+cRbdk4M6Ggj/0MU6t2h/PmA
         lQmvSRlD7VjLpdXiOr9pQ7pI4sgy8yw8mFD6GPYaUs0E32YXG/7gxYXYiqFmB+ui1z9L
         1piWxiV7AIaycSJxubTi0hrzY05OL6MVX/vqIn36SCETJ/PVIiVcGFu3jZcl/m1ACgxH
         SRF9A62AY75MB2EGWgs4H7zxDhJHLXn5obq4bDg5/XAw6UJGguMcbYmdZqq47IWcvHXU
         meeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996098; x=1792600898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIItl0pCQ/aBq2U1h8kgQBz3yZb99mdO46VMaoMNnUw=;
        b=MXb+KHmFkw4FaGS1eTaFLpPQvRHwcGU13Hl2SEcDoapbq8oTmghpiY5WF232OEgxd+
         j2a+0emBm/4NIL5P7FY/yxphElOGTYJPza5n1aZMdjZ6eTl4cu5yWd25xbfax5L+oAGX
         ToVNr0V92aeIVz+bQMhnYTSBtT2PIvhy3io8WhhgPXQM8CZXqN/MafVh9MO0P7dRaaMX
         rRr9ZXEpCkfzS7t1k7RKu/7bEp7sd5EB2MiJmGjLILrika0hAj+j2Z1pMouzDM4YwH8s
         2FXRCdk2I3T1nN3ORd257tMQg8iYQF4R3hSdRxSzzBXnvu5G8PYrCIN+S0uVqEKDiAq7
         FOsQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5A517HajNWUaTnaB70I7O8C2gb722/AzkyMXd/LRtye1+9r9ZGEtOBuvaoSF9IhCG6ZhO@lists.linux.dev
X-Gm-Message-State: AFq9FYLBt9WZFXIdQDaIuZs7AFhwL5E/+5te5Klitpl1BtMHVDb7DZcF
	C+pOdgeOSK5RMlYSl6ifiMa+wfVHzV5NoF9nOs3hLBdnP1zmFASCuU0jcW3drQTBUzVovGHm/DB
	ufRSULDjAiXbc8THcTv7wXeqpINR7vOfacoei0vaP
X-Gm-Gg: AYBFou1PPAr2VWw76umzpLdJCRBb/+Wuufyb6QC/R7MY0QuwmNbri7lA+2tgy3C/qov
	jedqfxVDhesBmPS4OCgVnaUm5hzP0sTuA5NBG/epxkzu5Tmx3gQLCp5dWVhuMHKbNnLkp0VcpfN
	3En9iUoVmJjx9g2mmAMCwfLZcIgK1ZR2mZaDCkU0vmBbJCnZmbcuIgaOSdem09mHpafgPyYfVGZ
	HxxsIHbezTDAyPaNH3wamgnTr8cvkc131PK0nKq675+mAYHRXbKzfA1GhcaycETQnZfVj8jUSSj
	mnJDakaF6JP9LfuiFW6++KDM9jouIin4Z0Vp6/96tNq0qWiHWVlnrjJsh7agKNfOuLYsokM3vQM
	JDgmYxyauIQ==
X-Received: by 2002:a05:622a:1108:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-5360573c96fmr14813151cf.5.1791996097367; Wed, 14 Oct 2026
 09:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
In-Reply-To: <202610140932.5F9CFCE5@keescook>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Oct 2026 09:41:25 -0700
X-Gm-Features: AclHuK8_g-YOJgMR77fEpf5RTsveF4u_ERdXz6lvoN6wh_uF7KP8ZsaUSV1ti8A
Message-ID: <CAP-5=fVLWh4uay2HGy6DOpZmtTr5WAd-TehAkN+P-pQgq_BZhg@mail.gmail.com>
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
To: Kees Cook <kees@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Oct 14, 2026 at 07:36:41AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Oct 13, 2026 at 03:39:35PM -0700, Ian Rogers wrote:
> > > Clang supports the 'require_explicit_initialization' attribute on str=
uct
> > > fields to enforce that the field is explicitly initialized when an
> > > aggregate object is constructed, emitting -Wuninitialized-explicit-in=
it
> > > (enabled by default) if the field is omitted.
> > >
> > > Following discussion at the Linux Plumbers Conference [1], this serie=
s
> > > introduces __require_explicit_initialization in
> > > include/linux/compiler_attributes.h and applies it to
> > > struct kobj_type::release.
> >
> > Cool, sorry I missed that talk.
>
> Yeah, I'm really liking these compile-time checks. :)
>
> >
> > > As Documentation/core-api/kobject.rst notes:
> > >   "One important point cannot be overstated: every kobject must have =
a
> > >   release() method, and the kobject must persist (in a consistent sta=
te)
> > >   until that method is called. If these constraints are not met, the =
code
> > >   is flawed."
> > >
> > > Annotating struct kobj_type::release caught 30 struct kobj_type
> > > definitions across the tree that omitted .release:
> > > - Patches 2-10 fix 10 struct kobj_type definitions where dynamically
> > >   allocated kobjects, ksets, or enclosing structures were either leak=
ed on
> > >   kobject_put() or freed prematurely before kobject release (risking =
a
> > >   use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=3Dy).
> > > - Patch 11 annotates struct kobj_type::release with
> > >   __require_explicit_initialization and explicitly sets .release =3D =
NULL
> > >   (with explanatory comments) on the remaining legacy struct kobj_typ=
e
> > >   definitions whose kobjects are static, per-CPU, or embedded in devm=
- or
> > >   parent-managed structures.
> >
> > Sounds great, but let's fix up the users before adding the attribute.
> > Looks like some of these need another version so it might take a bit of
> > time to get them all merged.
>
> I'd really like to have the attribute available, and I've got at least
> one user I can apply today that don't require fix-ups (seq_file), so
> if Miguel is okay with it, I'd like to snag patch 1 and send it with
> my seq_file "first user" for this coming merge window so it's available
> starting with v7.4-rc1, and we don't end up needing to wait 10 weeks for
> other subsystems to be able to use it. And the kobj fixups can continue
> in parallel. Does that sounds okay?

I'm happy with that. I'm working to address/incorporate the other
feedback for a v2 of this series, but I can drop individual patches
that have already been merged. Thanks, everyone, for the positive
reception in getting this landed, I plan to follow up with patch
series for the other uses I found.

Thanks!
Ian

> --
> Kees Cook

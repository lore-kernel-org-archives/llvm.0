Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997F5270555
	for <llvm@lists.linux.dev>; Mon,  5 May 2025 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746479101; cv=none; b=qieSQ+ZYBr+rN6FrLarD9DIzH/8wY9LElCooosQtToJkFrjN56VT0pmfg3amQaipFPwBfViMfFmviQsphgXje5bhTEG7FSCkjt/2GJe+7o78woE9XbIcZMBJ+Zh3T5p7JSlTqdkQt8CvRA1iP5DkYCIxNYgbwniImaFpTVF660k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746479101; c=relaxed/simple;
	bh=pvJm4iJToWGX01vWFAWNiClNkhuZHWWKlI9oy7VPwrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j0E4dXJcGEFeFnM64IqjO5kkRpQ/kSjEU7IIcCrm4mKbcc7d7DJsroJXGqIXjNGl+UgoOuaUO9kFrz7mrq1U6Yu4AG4lJ5FswVOHl4OPGUN4GlZvO7VKoKSPMGwZyrY0nFDaATFRXPZSXdM+wP7n0uaq+OMvwAJFiUoB4wtHBug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=WLn6PzoI; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="WLn6PzoI"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7080dd5fe92so41027037b3.3
        for <llvm@lists.linux.dev>; Mon, 05 May 2025 14:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1746479098; x=1747083898; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV6Ehr5flIzxPNkBJYbjhBPm/Nie/yPzlaQWxf1OGLY=;
        b=WLn6PzoIU3wYONY9NqCoywFLMoye9M5b+1rW3iaGWzaDlIbEVGzQdfJQ7hFV55xrk4
         vSDLNMq8393o0CcmXc1A+UnEM1rKdudV4W55GN7/3/+TYmJwQPqKDT7FX3DF3eyXM+qJ
         asUV4nGP1/B9+Y0auf56hGv0NOhAxTSBewltXDcSuBe42Yy75CLYYXbOrEnvIN9NSlNA
         z0iT6Zl9JaUlV2wIpI2lcCaFji7ed+gT2mqsr0HoQ7VAFURi/diH27goQBpitmQShTjw
         QeOJsNfrnJtwtRZAZM1rFJwnFmwqXhd7AW/AaP+3gayQ3sle5hQLsGKpOaKaz7QL7MIK
         Ar+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746479098; x=1747083898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qV6Ehr5flIzxPNkBJYbjhBPm/Nie/yPzlaQWxf1OGLY=;
        b=jxpSNShMAT+3iJw/JKuE+EMkVto5hsFYXFw4wxs8E7N79DcmlocTxzwpJLfTL896ZS
         comxrUoCRVZziSzTgec1p6xL15oVdk0AkJ/5ZDYVWsUj7l4jz3DMy9iLGzT74Yy2noNl
         Mc0LbsvwWFqU0zHYegp+CvUPpHDflmqsqIp5iR105r2FsOI4P3p7yREqhflCe5Tp5/vZ
         xpU50KCan9KQBJOly2OK2Tc4o1Y4i0JI30w1KCNY49rHCHHL9yx/jb2eSFMuDyoT8fhP
         wINiMsnMbBTZVt5kNgRHzvtbjMhZWpX4QaLsysxaZZzn7Q01iKpF3lk4Tgw+uvI2pZSl
         Rc6g==
X-Forwarded-Encrypted: i=1; AJvYcCUb5UqJvnJAKb1LhCbJPGv6BQ/IysN0emBuspWXcAdhAi3AhdWdOYu3NBwLUz64WxWN9VsE@lists.linux.dev
X-Gm-Message-State: AOJu0YyeyokvToTJ2NchWJ3VL51NpHO2p9bqdvKkPAPxYUJEz6Wmv1/u
	RoRuNPhOrP2lZtaKBOTKWV4HZdWQJZXvo8O4qlb6kHm0WqiPhob5RteF3f+Gl/g2CakhjBUiJHk
	K11vYe2fNDcZMwaVtJaqgxaDUSKMjHdCJGi5o
X-Gm-Gg: ASbGncus43H4rQEuFrvlqXYXhQTvsMjGiM83p2m1oB14xZPmkEg0+5n8qEM8Rjkow7m
	/dvppKOJxqYblrGtOGIognSowwPNUSvThApwwODfpoOKLUGE5C5RaRDztlR+QjQWa13IqvajiDC
	xSGv0bi88Ayuf6xoXHqFq6rw==
X-Google-Smtp-Source: AGHT+IFmAkNEdgI8Usf/OOS6czpCIUfjzjMmDrrLFeB8TbVt16spO751vhSxBgmbdO5FhYFLhIwyiyfP8SeItQ5Z+90=
X-Received: by 2002:a05:690c:368b:b0:703:c3ed:1f61 with SMTP id
 00721157ae682-708eaeef043mr127166017b3.20.1746479098491; Mon, 05 May 2025
 14:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502184421.1424368-1-bboscaccy@linux.microsoft.com>
 <20250502210034.284051-1-kpsingh@kernel.org> <87o6w7ge3o.fsf@microsoft.com> <CACYkzJ7Ur4kFaGZTDvcFJpn0ZwJ9V+=3ZefUURtkrQGfa68zLg@mail.gmail.com>
In-Reply-To: <CACYkzJ7Ur4kFaGZTDvcFJpn0ZwJ9V+=3ZefUURtkrQGfa68zLg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 5 May 2025 17:04:47 -0400
X-Gm-Features: ATxdqUH7QOdmAmbomuCBMV4FUrVw8a-HbJeWUtKQ1wX8nnex6ppuCCrqNPrIXY8
Message-ID: <CAHC9VhRwpvQQyMmFTeiQaos0+yJDkuCkt03QcYdnsxUvBXAtVA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introducing Hornet LSM
To: KP Singh <kpsingh@kernel.org>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, James.Bottomley@hansenpartnership.com, 
	bpf@vger.kernel.org, code@tyhicks.com, corbet@lwn.net, davem@davemloft.net, 
	dhowells@redhat.com, gnoack@google.com, herbert@gondor.apana.org.au, 
	jarkko@kernel.org, jmorris@namei.org, jstancek@redhat.com, 
	justinstitt@google.com, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-security-module@vger.kernel.org, 
	llvm@lists.linux.dev, masahiroy@kernel.org, mic@digikod.net, morbo@google.com, 
	nathan@kernel.org, neal@gompa.dev, nick.desaulniers+lkml@gmail.com, 
	nicolas@fjasle.eu, nkapron@google.com, roberto.sassu@huawei.com, 
	serge@hallyn.com, shuah@kernel.org, teknoraver@meta.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 4:41=E2=80=AFPM KP Singh <kpsingh@kernel.org> wrote:
> On Mon, May 5, 2025 at 7:30=E2=80=AFPM Blaise Boscaccy
> <bboscaccy@linux.microsoft.com> wrote:
> >
> > KP Singh <kpsingh@kernel.org> writes:
> >
> > [...]
> >
> > > Now if you really care about the use-case and want to work with the m=
aintainers
> > > and implement signing for the community, here's how we think it shoul=
d be done:
> > >
> > > * The core signing logic and the tooling stays in BPF, something that=
 the users
> > >   are already using. No new tooling.
> > > * The policy decision on the effect of signing can be built into vari=
ous
> > >   existing LSMs. I don't think we need a new LSM for it.
> > > * A simple UAPI (emphasis on UAPI!) change to union bpf_attr in uapi/=
bpf.h in
> > >   the BPF_PROG_LOAD command:
> > >
> > > __aligned_u64 signature;
> > > __u32 signature_size;
> >
> > I think having some actual details on the various parties' requirements
> > here would be helpful. KP, I do look forward to seeing your design;
> > however, having code signing proposals where the capabilities are
> > dictated from above and any dissent is dismissed as "you're doing it
> > wrong" isn't going to be helpful to anyone that needs to use this in
> > practice.
>
> Please don't misrepresent the facts ...

KP, I believe the most constructive thing at this point is to share
your design idea with this thread as previously requested so everyone
can review it.  We can continue to argue about how we got to where we
are at if you like, but that isn't likely to help us move towards a
solution.  If you are unable to share your design idea, either in a
couple of paragraphs or in some form of PoC, please let us know.

--=20
paul-moore.com

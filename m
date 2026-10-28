Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793201765;
	b=1Ykq4UcHE8JAyv1ZUUFJmU6PezHLmvV21BI/D8E+L3xTWIlxYTqGxTN3ymmQbeqn66p9
	 RKBThTT1mlZ2W1DixIRI5TcndILYDZ5tT/YCswLY+gXqmw+2diLT/Z2EV3AASJUKQANKP
	 cBooZygSM4Zxx9clKLedo0TpulGvylE3N8ihahxRQP7t7Be1LFft52ugcRUTfMNyNn09c
	 chfcHdv55xzLnG6lqmqLujfY6TvG/+sB8FbFHIn1ukf7XxIlTOTvMLiUipUqNtUtjweCb
	 mXcr/eoTrQsp+KTbxt0NUBcW3XHiHs7GW2qBiuxfoHcZrSjq7t+NrsQAMrddhT4484g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
	b=J4Pj12Z5cvCmh6c3UXQWKUdYvKH4a7HC8TLotpjffjNlR4/tHcuRHgGYIJDG40/go5dj
	 TFf0qv7QR7kIJ7KRRukhORf008BCKfICyM8DbfZA/izVWRGto8jQ+pYpPfmoo1x2khtIk
	 CVtkNK1wFqxdD69QYYP0bqFZ5FRKny+tiSnCuF7h1VNYr8S6WS6ZGpxuSy7Jno5dKzuWD
	 U7ds7bKYQohZwRm9VS/o91xpM/FGSDSsR8hXpB7MJtJTowkzonAzzxLzardkhPOVlBHVk
	 1G1/3VcuHzrCtKwoAQaK72DdzXp7TeBYEpG0Cp4GpKLNENlR8+L5R6HaDTVB6MvTJbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mf9SYFED;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F921606A31E
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 15:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F921606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mf9SYFED
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533202fe429so405281cf.0
        for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 08:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793201764; cv=none;
        d=google.com; s=arc-20260327;
        b=e+MgnHbBNcsQH6MncthfdGnUWWrwr6Cx9UwkMmvw4amr7TXsLWnDgnsGhPRudHnOeC
         17USTqYRrfo75+1o5YGma6W+u1Bng++duASgCgDWi+Bq5ipYiLP638+p72Su5nkSPS41
         7Uf09ZSzIP0On2qA/me91TcntICyCItZTC/TPKVawr7I8eRNp1/suwgm0NvFLZLiwJ/d
         o980f1vkS1X6V1djD32yBZJb4JoZwOlYNn+6Xf4LLr7GM+kceNP7cWVi1k4J3muSHm9t
         CUyXeH2y1ZJ8rkeELW9bZEgxuBmeUIUN9uOQSo2nlk5PU8SvXQ39+frzJEUwUVDHWQ9l
         8JTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        fh=h352FXDVaEC9Dytay+spugYdS3KSbJ3jjTnRWXkUn9I=;
        b=aCV+ATKoG0H2zh42yGutUBU8ManwmL9fhcj2f/qeI4bJp8xwSZleIYCnH5T81QwBEP
         YIRwElSslvullHVBohLY3Vc1hdHckA3NQA9FvcJl1w2jqtX6bQKSUmQfvj1/LybqC7qE
         3bQ/j317kGdY4UXCxArJtZ4sJBFUIn98qV9O/71alBJoqFNu4FYbMgKUakAp1G9jnRYN
         9Q7kmIDzMc2zk1nZbPF2Vfjx8At93YGGeCEH4TcY/aKtf9/5JzEn06jwYm4y1h3G2yEV
         jL/Yi6LSQMlmElzHROt9WvcwlGLFCAsMDY1fnivBBYLOskGgYos1kwBMwE4nXkVId2ve
         94cQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793201764; x=1793806564; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        b=mf9SYFEDsXe9OqSwn09J5QZmBcn15LkHHvtkbfQliSti2e7W19ryef2jG3RkdgBwhI
         IwTjmnxuhDYN+t8bF2Vp5uN2WFqUEyK/rVLKx3VAusaUnJnRl2Ld8KtpwOsQ1lwp0onn
         aLHNtHGVY4EDlwcBMg0jFTAF4129pXjmNmFpxlpG9bV7lvFnEyycQZCvLbVBMOFNMQv2
         1qP8AF71HV61oaAbnYCwFdE+xSTiFYqdqjZZCOcIIfp6jgFGpiCItGna6P6IBA5zyvj8
         gO0liO8+lmOdqMjO7/FIXUCF0nbjWzkQl+TysWuAxtnpf2brbw5BqDTNBZ3YDRsu43Mh
         KPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201764; x=1793806564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        b=UbDPbFxuytsXdjeaTNbMZxUg+Oi0FC2F5ltLb0aNi9/O+tBCk7EQtJVdFzI4W3KWyo
         wJmm9gYJKDhe7+fQgkBuJEW6ZBo0I0YTSkFdLi/PJaoVHr1ZBxoFILUlGK9Wvr0Von4T
         iaFGH5tvQ4ZHHkaBXngkAVKkMSC2gzy7L64ygeOm9jCkfGLLOp6CjuPXwiIUqEF3+Zwm
         pC5079Ni4HwW7mF0hxJkARbt9ITjCxDv8TkbtDd2us9ZM2RdYMp7Ai1ACec0Mp+8HzfA
         4+CVWoSbsKcSztOG8ma+HQ84Cy9RqRuK75AwtU+daIO0gCMbNkVs3aFSDad9K2FbBJrZ
         z+4w==
X-Forwarded-Encrypted: i=1; AKwUvBxRjrIpeIJcJvoncv2CVrxjBB7p2jFvNzDtA61F0lVMUgZX0hb1KaTer9+R8U7iEHBBzfAV@lists.linux.dev
X-Gm-Message-State: AFq9FYK7GFKhEXHskowc6tWqtTz+43ycxFC8Fs4gAwO25nxyxjv7omU/
	MXZUxEZ7dbA9xtJi8PVqZWJrJmpQ4edCpU5t1yYF26GSoAmyS0n3jGTs7rQCMGbJNydtC7+FhIo
	GNyTkCnIYF+t/9rLjeRp/7IU2IF/IvquqHl+aqCdB
X-Gm-Gg: AYBFou1k0J2FuYIZqcaE/UygKLACCdQV9vmT4aLSfA6jpxckbcmvOLbAAUsO0bl9NC4
	x55Js9yB1INqBLEBNWiARrGpv/YtOGngJTu/QXzW6sAWc1D3t78zXceuWZjxXwKGCb3fewEXa2r
	Di05RrjInCXG9NRgh6TzNBx4ZXNdTYSU40Yxtxiqo1ViGvi/wRi+Vfa9lKA+G0qouwssGdHrSDC
	RhfKVKciMY3n4rzo3km+YuAiqyI09Touy9qU6WTgn2UT2/zjelWWjlts3uqaRGQWE5tLYjocg8V
	bfoAW1D1GEqtut0iILWXS6eEDKMP3E1N6PB7GZkAO+vatpC8hFlrAzNWJNh+ulEYTT70UwRH6H3
	T5smTOTrqbFYArGHTRGEhPSWxUNDTD6X92JAHODk5/+xfji7GnzcJv3sJzJ8=
X-Received: by 2002:a05:622a:22a9:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-53fc2aa1fa2mr21345071cf.4.1793201763129; Wed, 28 Oct 2026
 08:36:03 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
In-Reply-To: <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 Oct 2026 08:35:50 -0700
X-Gm-Features: AclHuK8Z1SdNi4k8-UQceLsnqDJD6d9aTo0cl8IQ7vlO1Fmucv2n8goL0VFX4iw
Message-ID: <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:39=E2=80=AFAM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Tue, Oct 27, 2026 at 11:39=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> >
> > Export cpufreq_dbs_data_release() and set .kobj_type.release statically
> > in the ondemand and conservative governors so their gov_attr_set
> > kobjects have a valid release callback statically initialized, matching
> > cpufreq_governor_dbs. Remove the redundant runtime assignment in
> > cpufreq_dbs_governor_init().
> >
> > This prepares for annotating struct kobj_type::release with
> > __must_init.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Do you want stuff to be picked up by maintainers, or do you want to
> route it yourself?

Hi Rafael,

Just a quick note: I agree with Zhongqiu's feedback and the commit
message needs a fix.

Regarding merging the patches, the issue with maintainers picking up
fixes is that the series will break the clang/llvm build without them.
So the maintainers need to either merge the patches (and the series be
rebased on top of them) or merge the series as a unit. Perhaps since
the patches align, merge conflicts won't happen, so maintainers
merging and landing the series is okay. I don't have the experience to
know.

Thanks,
Ian

> > ---
> >  drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
> >  drivers/cpufreq/cpufreq_governor.c     | 4 ++--
> >  drivers/cpufreq/cpufreq_governor.h     | 1 +
> >  drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
> >  4 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/c=
pufreq_conservative.c
> > index 02bfd46543e9..146a2353b1a2 100644
> > --- a/drivers/cpufreq/cpufreq_conservative.c
> > +++ b/drivers/cpufreq/cpufreq_conservative.c
> > @@ -318,7 +318,10 @@ static void cs_limits(struct cpufreq_policy *polic=
y)
> >
> >  static struct dbs_governor cs_governor =3D {
> >         .gov =3D CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
> > -       .kobj_type =3D { .default_groups =3D cs_groups },
> > +       .kobj_type =3D {
> > +               .release =3D cpufreq_dbs_data_release,
> > +               .default_groups =3D cs_groups,
> > +       },
> >         .gov_dbs_update =3D cs_dbs_update,
> >         .alloc =3D cs_alloc,
> >         .free =3D cs_free,
> > diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufr=
eq_governor.c
> > index f3bd3dbe7c41..f8b5aca09b6b 100644
> > --- a/drivers/cpufreq/cpufreq_governor.c
> > +++ b/drivers/cpufreq/cpufreq_governor.c
> > @@ -419,7 +419,7 @@ static void free_policy_dbs_info(struct policy_dbs_=
info *policy_dbs,
> >         gov->free(policy_dbs);
> >  }
> >
> > -static void cpufreq_dbs_data_release(struct kobject *kobj)
> > +void cpufreq_dbs_data_release(struct kobject *kobj)
> >  {
> >         struct dbs_data *dbs_data =3D to_dbs_data(to_gov_attr_set(kobj)=
);
> >         struct dbs_governor *gov =3D dbs_data->gov;
> > @@ -427,6 +427,7 @@ static void cpufreq_dbs_data_release(struct kobject=
 *kobj)
> >         gov->exit(dbs_data);
> >         kfree(dbs_data);
> >  }
> > +EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
> >
> >  int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
> >  {
> > @@ -488,7 +489,6 @@ int cpufreq_dbs_governor_init(struct cpufreq_policy=
 *policy)
> >         policy->governor_data =3D policy_dbs;
> >
> >         gov->kobj_type.sysfs_ops =3D &governor_sysfs_ops;
> > -       gov->kobj_type.release =3D cpufreq_dbs_data_release;
> >         ret =3D kobject_init_and_add(&dbs_data->attr_set.kobj, &gov->ko=
bj_type,
> >                                    get_governor_parent_kobj(policy),
> >                                    "%s", gov->gov.name);
> > diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufr=
eq_governor.h
> > index 806d8fb4dff1..1026712bb79b 100644
> > --- a/drivers/cpufreq/cpufreq_governor.h
> > +++ b/drivers/cpufreq/cpufreq_governor.h
> > @@ -150,6 +150,7 @@ static inline struct dbs_governor *dbs_governor_of(=
struct cpufreq_policy *policy
> >  }
> >
> >  /* Governor callback routines */
> > +void cpufreq_dbs_data_release(struct kobject *kobj);
> >  int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
> >  void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
> >  int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
> > diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufr=
eq_ondemand.c
> > index 9942dbb38dae..7386d043c665 100644
> > --- a/drivers/cpufreq/cpufreq_ondemand.c
> > +++ b/drivers/cpufreq/cpufreq_ondemand.c
> > @@ -374,7 +374,10 @@ static struct od_ops od_ops =3D {
> >
> >  static struct dbs_governor od_dbs_gov =3D {
> >         .gov =3D CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
> > -       .kobj_type =3D { .default_groups =3D od_groups },
> > +       .kobj_type =3D {
> > +               .release =3D cpufreq_dbs_data_release,
> > +               .default_groups =3D od_groups,
> > +       },
> >         .gov_dbs_update =3D od_dbs_update,
> >         .alloc =3D od_alloc,
> >         .free =3D od_free,
> > --
> > 2.56.0.313.g2479322e68-goog
> >
> >

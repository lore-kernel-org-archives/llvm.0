Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93CA242D9E
	for <llvm@lists.linux.dev>; Thu, 21 Aug 2025 01:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755740385; cv=none; b=ZLLQOQESBPCR2YiW9REpwv1+zRV8osAqDd7vhOmimZxrNGRD7FuiSVY0ar5qwj/0cteCNGz/6r6f8Pl61Dz0JZMREHQOsvGXGi7PJq+/xZP57us3l1+VuU857G0Xwwat+5DvThlFe1PzKUdh6FUsQzhQyXtsxTgvmCyIMxlJSMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755740385; c=relaxed/simple;
	bh=kSDSfek91jsHl7FrJyM0gLyKBh6BqcNAxcjQLYi4lr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZA/AC+x6guEFid1D11m1qv1HmxW0kEmxIRg4QJ42bhkQNjeYXzOM+Lz2pJena1a4ZP8JxYMWgQrPoa4MfMDqy32jdbn6IXSkDkrELNKrQ91bvpq611Q1yAUzavq8ZlS2KvvQoXmCkkHiGsHLKwVvZOaqKXO690fCnXwcrzhK8O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1SYJfL5; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1SYJfL5"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-71d6083cc69so3920607b3.2
        for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 18:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755740382; x=1756345182; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebI6Za89uQY5Wc3NtaCHo2kvrIsvdUGpm5geS336IaY=;
        b=h1SYJfL5aFm8kpOTrhk2sjM0W/aUUPmkGTUO7rl7/2QL8tPfX8bVTzEgItIgh2J6ek
         uQFrL7B8AxrAkR7Si0IZM+sRAFCLc/Tn7nAE7fB3vWh4ffyK9ZuJk/0MQsHhXBpLwSIb
         iF3fjBm/1MJZb3zcwO3Uk194BYW4DmnPO8NutfNQQN3cLdUaA1RcqKXi54hjTMMU0fhz
         E4wVDhXigzTJcCAHAOe7Y1WQnIIh2AnPeJh66mF9Y57IKuePOmgCbZOLKq0p3/r4UcJI
         b547iZxt5HSfLsSyAhnCWvOS5ShLz8xBnpnvQbG8SFgFSQfuwGqBQagnv+vOHoO0MgDZ
         5ePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755740382; x=1756345182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebI6Za89uQY5Wc3NtaCHo2kvrIsvdUGpm5geS336IaY=;
        b=TBPMSuA7ITefN8zEKT9soswCspX7x64VBPbtuDDnG7JP48ybAlotFCzbf+iYJc4uvt
         xSz78pCKq5LChXJxpBS2XbG1ttSZOkFTBAv83j8t4XUV3hfVpJ9Ma0EVHQoxD/XtoMIz
         PMZw+wEo716wRT2IQYGug6ZLGYjSxeo62JoQkXV7a4+l4tHwgYjltOkOwEPq3cW4D0VR
         RL7TQI5dN5xERxOhKqP2KgStWgjvBGjdm8zr0T8sZyMs0df1qwyQvAjjmuMx5CCu4YaZ
         dAoatf1BqsKBjAGmhNowQZsow6H1XOf+xom4fgaXsHvK8axISHnQuuJnhnHJ/S8bub3v
         30pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWdNWw8zamBUW2tbr2T1SuBNEJqwj+4CD04iISXwa30dEedqqLCpc17RyQkmI/OGOHaRGr@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd5/9ghKp27bNTOIY1FOAM3aZtbmRuJfEtXKqQw2gZkcb82FrR
	LTj4uAxRLg1Mcfdbo6EWwFM7pliJvJP6oUlP+owcjupZvLiPf03Sf1Eco7vw20mi5XcT+M9Ivd3
	k9dKoAFDN3av0d+BlEjyI7s7eYfkieDg=
X-Gm-Gg: ASbGncv7GJaSIGtmnqyt6Q+kGI+TzXJOHuGCvdnA6qnhdhr7tJQOCPsSwQAUPiaeGLM
	0gZayOIuLA0JhtK4UqmPGvpStRLhC4Hur3QiZww96WV+SBq1F3CbdjTJaY0bxbgM+9ii1STLIGb
	LysKsWb5kUC9OXXzNKx4mUYnjfG5lZDKZW2gJdFGA33INvjnyIt9x1gVHOVfQT4dw/pUWMuT4Vu
	76Uppjtvwg=
X-Google-Smtp-Source: AGHT+IGfNVSG+YcsbP05U+7tIuANEtQ3x/KgCgdmjsd6mkdSCWkbsC/b2aHy2e+JJzoZ3OamVVaeaFd9iZgnbQ6z6cY=
X-Received: by 2002:a05:690c:30d:b0:71b:9213:a75d with SMTP id
 00721157ae682-71fc8899224mr12037257b3.18.1755740382464; Wed, 20 Aug 2025
 18:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819033956.59164-1-dongml2@chinatelecom.cn>
 <20250819033956.59164-3-dongml2@chinatelecom.cn> <CAEf4BzZBztC69GFDuA4YJHPmWOXuq3+tSNMspPNA3tksGaEi=A@mail.gmail.com>
In-Reply-To: <CAEf4BzZBztC69GFDuA4YJHPmWOXuq3+tSNMspPNA3tksGaEi=A@mail.gmail.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Thu, 21 Aug 2025 09:39:31 +0800
X-Gm-Features: Ac12FXzswgjQ95dJXpbKnIm6pNkHCGVkejzRiQftM1aigpT1SzLiC1ZO-IiEQUM
Message-ID: <CADxym3bjmC3d1d3_CKd2DqFB4P_LYK_FwXUXFcKsYcJ6=smfAg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/3] selftests/bpf: skip recursive functions for kprobe_multi
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, mykolal@fb.com, 
	shuah@kernel.org, davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 6:47=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Mon, Aug 18, 2025 at 8:40=E2=80=AFPM Menglong Dong <menglong8.dong@gma=
il.com> wrote:
> >
> > Some functions is recursive for the kprobe_multi and impact the benchma=
rk
> > results. So just skip them.
> >
> > Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> > ---
> >  tools/testing/selftests/bpf/trace_helpers.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testin=
g/selftests/bpf/trace_helpers.c
> > index d24baf244d1f..9da9da51b132 100644
> > --- a/tools/testing/selftests/bpf/trace_helpers.c
> > +++ b/tools/testing/selftests/bpf/trace_helpers.c
> > @@ -559,6 +559,22 @@ static bool skip_entry(char *name)
> >         if (!strncmp(name, "__ftrace_invalid_address__",
> >                      sizeof("__ftrace_invalid_address__") - 1))
> >                 return true;
> > +
> > +       if (!strcmp(name, "migrate_disable"))
> > +               return true;
> > +       if (!strcmp(name, "migrate_enable"))
> > +               return true;
> > +       if (!strcmp(name, "rcu_read_unlock_strict"))
> > +               return true;
> > +       if (!strcmp(name, "preempt_count_add"))
> > +               return true;
> > +       if (!strcmp(name, "preempt_count_sub"))
> > +               return true;
> > +       if (!strcmp(name, "__rcu_read_lock"))
> > +               return true;
> > +       if (!strcmp(name, "__rcu_read_unlock"))
> > +               return true;
> > +
>
> static const char *trace_blacklist[] =3D {
>     "migrate_disable",
>     "migrate_enable",
>     ...
> };
>
> it's not like it's one or two functions where copy-pasting strcmp might b=
e fine

OK!

>
> pw-bot: cr
>
>
> >         return false;
> >  }
> >
> > --
> > 2.50.1
> >

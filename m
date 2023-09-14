Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DD7224F2
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 09:52:34 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5009d4a4897so1310903e87.0
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694685153; x=1695289953; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GN8ytPq7BJ4KPt7TJ0dTMIMvhtcsDk2MyD/gO1nB0y4=;
        b=OuBMvlvIS461IRXEqbgNFEHIE/ixpbAEhfyqNv7V3cjEYglN2QWL4hRD6dT64aDDYz
         MN3ypTlNsQIQZI//HdeklDyl/KQBSE+40kPcHd5sDjW2jjUur4WPV94fM1ZBU/4kAYvp
         FyCRTYAPGsAO7y2ylN/URO7gQGfcmsoEMtN2umEho6eMEU74EVO2AMnSyxjgs8SCBiuy
         LVmsJkExQmFq0bRogbwMfAdFOZf64RNiFS29CvBUruC3fWXh5U2Xbi1BLfKWPVic/gcz
         SdM9PAfpSqmW/CFr068QaR0nZDqrZXjzfQzHtKT4QUt6Bq5LTvAsYVEAXJSzH4DsKSm8
         j81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694685153; x=1695289953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GN8ytPq7BJ4KPt7TJ0dTMIMvhtcsDk2MyD/gO1nB0y4=;
        b=q1Pggy4oM+Q77BCJ5WtZVe72FZUtgCgM5fCzUmYKp0pLYEKpvcy1GQJtyqkWgb3o7B
         SYoQK6/npQZnCO7aw/cbeLWXg8/fB22QHaHNc81yqwb3NF0VwPUrs3gMxqhSBQgVBW3L
         dlb2Bpv8kIPrG8Tf+8DpHK2/mZmtVOqjpBGzAAxzbDQWt6eFgKZsv6Uxm4VKe1CK/43x
         t/Z9VN9Z7PeLTXDnELDeP4ouQwEf5hWStEwm3h+aEYoZrb9Qhp7Xzw/p+X2e9ew3Caxx
         Nw3iojbB0YuFPSbd8hYUkIm+OOglyTiaeHxgiR0fBWyP5yPhxRRopRJWskNpeA2AkDNn
         +lgA==
X-Gm-Message-State: AOJu0Yzt9yw8B7smImXPM602xdkQ/RHsjxw+E1RcX5OD0EUY+ceHgyTG
	aauCCdxZzZtKwq/I5NSyU70=
X-Google-Smtp-Source: AGHT+IGeOefCnnsoPvyMmIk0zg+5/TvlLnDgZJwi/81IC5W9Bi2z9/z9bJQiU3/JuL3fhkRMZtSynw==
X-Received: by 2002:a05:6512:3b0d:b0:501:c406:c296 with SMTP id f13-20020a0565123b0d00b00501c406c296mr5239850lfv.31.1694685152802;
        Thu, 14 Sep 2023 02:52:32 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id i3-20020aa7c703000000b0051dfa2e30b2sm704330edq.9.2023.09.14.02.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 02:52:32 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 14 Sep 2023 11:52:30 +0200
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jiri Olsa <olsajiri@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Marcus Seyfarth <m.seyfarth@gmail.com>, bpf <bpf@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Stanislav Fomichev <sdf@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>
Subject: Re: duplicate BTF_IDs leading to symbol redefinition errors?
Message-ID: <ZQLX3oSCk95Qf4Ma@krava>
References: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>
 <ZPozfCEF9SV2ADQ5@krava>
 <ZPsJ4AAqNMchvms/@krava>
 <CAKwvOd==X0exrhmsqX1j1WFX77xe8W7xPbfiCY+Rt6abgmkMCQ@mail.gmail.com>
 <ZPuA5+HmbcdBLbIq@krava>
 <ZQLBm8sC+V53CIzD@krava>
 <CAK7LNATiHvOXiWQi9gXJO9rZbT_MFm6NddaWqoY4ykNWf+OYsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATiHvOXiWQi9gXJO9rZbT_MFm6NddaWqoY4ykNWf+OYsQ@mail.gmail.com>

On Thu, Sep 14, 2023 at 05:30:51PM +0900, Masahiro Yamada wrote:

SNIP

> > > so the change is about adding unique id that's basically path of
> > > the object stored in base32 so it could be used as symbol, so we
> > > don't really need to read the actual file
> > >
> > > the problem is when BTF_ID definition like:
> > >
> > > BTF_ID(struct, cgroup)
> > >
> > > translates in 2 separate objects into same symbol name because of
> > > the matching __COUNTER__ macro values (like 380 below)
> > >
> > >   __BTF_ID__struct__cgroup__380
> > >
> > > this change just adds unique id of the path name at the end of the
> > > symbol with:
> > >
> > >   echo -n 'kernel/bpf/helpers' | base32 -w0 --> NNSXE3TFNQXWE4DGF5UGK3DQMVZHG
> > >
> > > so the symbol looks like:
> > >
> > >   __BTF_ID__struct__cgroup__380NNSXE3TFNQXWE4DGF5UGK3DQMVZHG
> > >
> > > and is unique over the sources
> > >
> > > but I still hope we could come up with some better solution ;-)
> >
> > so far the only better solution I could come up with is to use
> > cksum (also from coreutils) instead of base32, which makes the
> > BTF_ID_BASE value compact
> >
> > I'll run test to find out how much it hurts the build time
> >
> > jirka
> 
> 
> 
> Seems a bad idea to me.
> 
> It would fork a new shell and chsum for all files,
> while only a few of them need it.

right, I have a change to limit this on kernel and net directories,
but it's still bad

> 
> Better to consult BTF forks.

perhaps there's better way within kbuild to get unique id/value
for each object file?

thanks,
jirka

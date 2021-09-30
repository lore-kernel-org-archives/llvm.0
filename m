Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F407472
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:00:05 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id q16so8345585oiw.10
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fw8pwH1OA13DiwW71Gp8zTFcOzlqtHtiksx8vBnSuZo=;
        b=m5+pnYPhp5Mbbl/i9v8Rayru7Xk0LHfsYZ/3ARwECIFS8Pg8nv5paLDPvYkwyh4Ca0
         arVdov2yDLqKrEtQAVe7Byn4CiqcTi2C0JwPArKj6xt/qkc65HNDbv4HSUHo1BqhTjPc
         dJdaY85okFWxMiOoGC5V6/loSkBmKHz8mYi/LACtdatdLYOB1mU5NHnLYXDlYmUbE7wJ
         PLbg0ZkPm+Ysz8O0c2kUx+pvWoWDVe3+WSgEKpw9nHMvoH2AmvHIn8NUt8C1uZf+4KTq
         hxPOTJ0Z0JDOrTp9TBwHkHbKXbwNaxX6R2HQgMghcbkMssONuWMb+Q58XNPQfoEcXHMA
         njIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fw8pwH1OA13DiwW71Gp8zTFcOzlqtHtiksx8vBnSuZo=;
        b=pzfysQ+tQ0D8sC7YVnfT72Pmfp6tr9wnuykU8r0bh+tdrWVu8zpztEiKy/e8MqOHx0
         v9UjVGzs0xs5Rwxgn1u9D5Lu4yib76S5CCuXhqYkuEJFjiOrP/DKYSXv9++FIUlAYFIO
         nhoEK/v2nx+MutbHlGKOBu6sehZocuR/EJ2AtiQKqrCymvg+4hAnSjbBulTFFpubXLwp
         6NlaeIop2MmT7EajCEJJ0uxnV6DOeVXKgPPOlNAg/CGkM3nK11acCYHxjD/gERnxsHnV
         Ctxpr270mXMJi+uPjj0h3H1+wrlX0T6wckdrPJhqtOYSLl5R0y40vlvy3KYWH+VQrvbQ
         6w8A==
X-Gm-Message-State: AOAM5339HNdXP7fXeVezEZKyk1zMgpMabOkG8pfCHIW/gyQZF53o2HmI
	51alueNW8+f7AFaLOrkPnqPU3wlzVc2tq/Blxz4=
X-Google-Smtp-Source: ABdhPJwXt1IhVLGQOfviPEsWczuXrnB2viox7TeVfyjdkXam/lIb60V/M9UNSLtcAmDLi1dT0ZBzUFXTJQRA5PgV35o=
X-Received: by 2002:a05:6808:1141:: with SMTP id u1mr440287oiu.123.1633024805243;
 Thu, 30 Sep 2021 11:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930162302.2344542-1-nathan@kernel.org> <CADnq5_PBMGdUG8VMUQ2UOSdd9qXbZ7QoyGH2RTgUPnTjdzKqFA@mail.gmail.com>
 <CAKwvOdk56-7UQDs_EAn+WK397mnd5H7_JMrsjROPk5ZFCw2QLw@mail.gmail.com>
In-Reply-To: <CAKwvOdk56-7UQDs_EAn+WK397mnd5H7_JMrsjROPk5ZFCw2QLw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Sep 2021 13:59:54 -0400
Message-ID: <CADnq5_N=x-PFvU2oYtLLSHcos1G_K=2qhSE0+1LS=zuBNov0JQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Return NULL instead of false in dcn201_acquire_idle_pipe_for_layer()
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>, 
	"Koenig, Christian" <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	Nathan Chancellor <nathan@kernel.org>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 1:23 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Sep 30, 2021 at 10:10 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Applied.  Thanks!
> >
> > Alex
> >
> > On Thu, Sep 30, 2021 at 12:23 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > Clang warns:
>
> Any chance AMDGPU folks can look into adding clang to the CI roster?

We can look into it.  We may already be doing it for some groups.

Alex

> --
> Thanks,
> ~Nick Desaulniers

Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695BB443C
	for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 09:59:35 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-17aceccdcf6so1207273fac.9
        for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 02:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1679651974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3S1jZpPFamxYpM15q1AsKfyrzurt5PTq4wNBIuUsWUI=;
        b=QYW+l3DBUnQ5ubmYmXBr0H1dxlZ4HSLqh7wMlwF3ocB1NGNlLlfABYYXqOkIlu/qWx
         chXDwyqc0t3c6D9QdQ4Jem9Okt6b6TJ2rlECoLD11Lovfw1LHQJajCmUaHHrTx5sZM0s
         b076vp1OwlQK4nnvJWTh/gCUBqGaYjFE6MKG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679651974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S1jZpPFamxYpM15q1AsKfyrzurt5PTq4wNBIuUsWUI=;
        b=6n3h6492o6GoF+dCPLeGImKoWyp4VqNoZmQmqbRYtBzhRcdKPmhzHIskCx4hxW6jN+
         gNjy+JYr3RdKLM2dw3I5AQndDLyyT5EsMS+b8RLehP8fPkGT4bbFZ2Y/jmICW9thj2gd
         OF4MjPHWho2PTBmejRmDDzKqRBut936Tx9xIZfGOkz15mgMA5zZeSegPWgFatoSXNz7o
         wGetML5bMR09as0FOyvdGkNrFcI8ykgDFXHQ0raOSVpizV8amRC+/X4L+IJpn40hYSMu
         D3NbPsSY4R1qCjJ59/bP3YVV0jx7oCM9uU/M2bU12ynSBU4KfRs7YLiZqZi7hleiNW3G
         zeKQ==
X-Gm-Message-State: AAQBX9eSN2yBu9SwvOp4Ft/RDhkWzju+f8h5Bb6qZO0/Wq26j2IIQohw
	91q1ziYOgHnwQ6Q/SVgvs6svgXdO1xASSdb1EMFrsA==
X-Google-Smtp-Source: AK7set8nnSsWs0sg/cfPv8YNM0ZQhXr8KxqRW4ooPSiAH3ue+FwWvT+JfLiS9Ro4hwDEE7/aUEiXBwoGKN/IAsNiCbA=
X-Received: by 2002:a05:6870:1050:b0:177:bf3e:5d4f with SMTP id
 16-20020a056870105000b00177bf3e5d4fmr837720oaj.8.1679651974508; Fri, 24 Mar
 2023 02:59:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230127221418.2522612-1-arnd@kernel.org> <Y/eULFO4jbivQ679@dev-arch.thelio-3990X>
 <20230308165644.GA1181835@dev-arch.thelio-3990X> <67f9fe7f-392a-9acd-1a4d-0a43da634367@nvidia.com>
 <ZB1xWRo0rkhku2BS@phenom.ffwll.local>
In-Reply-To: <ZB1xWRo0rkhku2BS@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 24 Mar 2023 10:59:23 +0100
Message-ID: <CAKMK7uF4tYyw6Eio6YkWZpBej1J8_5+VLU_hvVbL-Lnk06=v1g@mail.gmail.com>
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Mar 2023 at 10:46, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Mar 08, 2023 at 05:28:06PM +0000, Jon Hunter wrote:
> >
> >
> > On 08/03/2023 16:56, Nathan Chancellor wrote:
> > > Ping? This warning is now in 6.3-rc1.
> >
> > Thierry is away at the moment.
> >
> > David, Daniel, do you want to pick this up directly in the meantime as a fix
> > for 6.3? Mikko has already reviewed and FWIW ...
>
> Generally first fallback should be drm-misc maintainers (or anyone else
> with commit rights), but since this fell through cracks for weeks it seems
> I'll pick it up to drm-fixes now directly.

Ok I think I found out why this fell through cracks, MAINTAINERS isn't
updated that host1x&tegra is maintained in drm-misc.

John, since Thierry is out, can you pls create the MAINTAINERS patch to
- point at drm-misc git repo everywhere needed
- add any missing host1x paths to the drm-misc entry so that
get_maintainers.pl adds the right people for this patch (currently it
doesn't)

Also should we have at least a 2nd person for tegra stuff (or well
maybe nvidia stuff in general) for drm-misc? Currently it's just
Thierry, and I don't think that's enough. Whomever gets volunteered
please follow

https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc

Thanks, Daniel


>
> >
> > Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> >
> > Thanks
> > Jon
> >
> >
> > > On Thu, Feb 23, 2023 at 09:28:28AM -0700, Nathan Chancellor wrote:
> > > > Hi Thierry, Daniel, and David,
> > > >
> > > > On Fri, Jan 27, 2023 at 11:14:00PM +0100, Arnd Bergmann wrote:
> > > > > From: Arnd Bergmann <arnd@arndb.de>
> > > > >
> > > > > The error handling for platform_get_irq() failing no longer
> > > > > works after a recent change, clang now points this out with
> > > > > a warning:
> > > > >
> > > > > drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
> > > > >          if (syncpt_irq < 0)
> > > > >              ^~~~~~~~~~
> > > > >
> > > > > Fix this by removing the variable and checking the correct
> > > > > error status.
> > > > >
> > > > > Fixes: 625d4ffb438c ("gpu: host1x: Rewrite syncpoint interrupt handling")
> > > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > > > ---
> > > > >   drivers/gpu/host1x/dev.c | 5 ++---
> > > > >   1 file changed, 2 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > > > > index 4872d183d860..aae2efeef503 100644
> > > > > --- a/drivers/gpu/host1x/dev.c
> > > > > +++ b/drivers/gpu/host1x/dev.c
> > > > > @@ -487,7 +487,6 @@ static int host1x_get_resets(struct host1x *host)
> > > > >   static int host1x_probe(struct platform_device *pdev)
> > > > >   {
> > > > >         struct host1x *host;
> > > > > -       int syncpt_irq;
> > > > >         int err;
> > > > >         host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
> > > > > @@ -517,8 +516,8 @@ static int host1x_probe(struct platform_device *pdev)
> > > > >         }
> > > > >         host->syncpt_irq = platform_get_irq(pdev, 0);
> > > > > -       if (syncpt_irq < 0)
> > > > > -               return syncpt_irq;
> > > > > +       if (host->syncpt_irq < 0)
> > > > > +               return host->syncpt_irq;
> > > > >         mutex_init(&host->devices_lock);
> > > > >         INIT_LIST_HEAD(&host->devices);
> > > > > --
> > > > > 2.39.0
> > > > >
> > > >
> > > > Apologies if this has been reported already or has a solution in
> > > > progress but mainline is now broken because this change got separated
> > > > from the change it is fixing:
> > > >
> > > > https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/4249931209/jobs/7391912774
> > > > https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2M7y9HpiXB13qiC2mkHMyeZOcLW/build.log
> > > >
> > > > I see this change sitting in the drm-tegra tree [1], which is getting
> > > > merged into -next, so it is fixed there, which is why we did not notice
> > > > any issues until the drm-next tree was merged into mainline. Can this be
> > > > fast tracked to Linus to unbreak clang builds with -Werror?
> > > >
> > > > [1]: https://gitlab.freedesktop.org/drm/tegra/-/commit/b9930311641cf2ed905a84aabe27e8f3868aee4a
> >
> > --
> > nvpublic
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

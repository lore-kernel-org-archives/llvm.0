Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDC04C65
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 19:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657912192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YwoLVFK6VIqRxOLsO1/EQV9lnSFDUSQaM1LO6cP8vkU=;
	b=GwQZUX5lMzQzwbN28ePATMxSKJWTGH0OwzrjztFvcUvtx+lfRDlC9MLSDi6mp9Af0SOl4g
	MrE0V/C24NU0ssEpISi9TjFdPFKiuVWGSfaCTaIpd0YSusp511ytn8nh2uhZjFaGpeLZK6
	5G8ULPhINyuvYmRzAwo8/emyYABItE8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-KRgdlNsyM6Ce-FSkTEZrag-1; Fri, 15 Jul 2022 15:09:51 -0400
X-MC-Unique: KRgdlNsyM6Ce-FSkTEZrag-1
Received: by mail-qt1-f200.google.com with SMTP id i8-20020ac871c8000000b0031ed35facf3so3543184qtp.0
        for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 12:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=YwoLVFK6VIqRxOLsO1/EQV9lnSFDUSQaM1LO6cP8vkU=;
        b=Cri5kYpANfMwklaYP1v7n0i3JoItvLht1wbS+sQ11zkpBaMBUuE+QyMJAc4jr7G8IZ
         jcNSqAIZ20hfoa4kAnAseIDhYwUytqrY7Gn8USmr7xlRLBKVPWH5zp3ShcXaDAYZISrC
         f6P201jdH/1FCZDBo0vrzz1dwHX8Yy+M+sQz13LU2xF3Tyrskguh2Ix/B8tKe8xjsxWt
         6lToMyaMhj9djyG9jz3NtaB2c2B741S09c9z9GBu2kqTQxCPoSrf0kkiYmjclGKQMuRS
         p8pQFp98PRXu71kKwTGNV8AeIFWIqQeYA7QNz60rcYj3FDeWtYZnjjaPGXaIiDPgDdLM
         /MMg==
X-Gm-Message-State: AJIora8a/+nM/pXPum3Ff7wwVPT01cCCvXDmkLUaf1uCcW+fgMxx8xD4
	Zhzlhy65SKZOacPlRPqoYiQe5dOLq3T8OCWKbU4ectn8sXTswKb42vUHmNmZe5rCzQODu81Ud0f
	L/6wXcLE9BytkaA==
X-Received: by 2002:a05:6214:3009:b0:473:990:6d08 with SMTP id ke9-20020a056214300900b0047309906d08mr13082709qvb.121.1657912190560;
        Fri, 15 Jul 2022 12:09:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uohAkD70j3BSA3vDDBqmY1M2p1cVekKFciRB3de2UGHqsYQMYVH4O+M/IUZxKTSkZXjTdv5A==
X-Received: by 2002:a05:6214:3009:b0:473:990:6d08 with SMTP id ke9-20020a056214300900b0047309906d08mr13082681qvb.121.1657912190247;
        Fri, 15 Jul 2022 12:09:50 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
        by smtp.gmail.com with ESMTPSA id f4-20020ac80684000000b0031eca8c88f6sm4017257qth.51.2022.07.15.12.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 12:09:49 -0700 (PDT)
Message-ID: <44d6fc01654b16f9cdd6b517999ddec76038d547.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/bios: set info only when the return is not 0
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Date: Fri, 15 Jul 2022 15:09:48 -0400
In-Reply-To: <91194b7190081545a8eeb10d20e24de864dfe259.camel@redhat.com>
References: <20220702153904.1696595-1-trix@redhat.com>
	 <91194b7190081545a8eeb10d20e24de864dfe259.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2022-07-04 at 17:32 -0400, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Currently on flakey internet in the back of a car, so I probably won't be
> able
> to push this until I get back tonight or early tomorrow

Whoops! Slipped my mind when I got back, but I just remembered it now so I
will go ahead and push :). apologies for the delay!

> 
> On Sat, 2022-07-02 at 11:39 -0400, Tom Rix wrote:
> > clang static analysis reports
> > drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c:68:17: warning: The right
> > operand of '*' is a garbage value [core.UndefinedBinaryOperatorResult]
> >         switch (!!data * *ver) {
> >                        ^ ~~~~
> > A switch statement with only a default should be reduced to an if.
> > 
> > If nvbios_pmuEp() returns 0, via the data variable, the output info
> > parameter
> > is not used.  So set info only when data is not 0.
> > 
> > The struct nvbios_pmuE only has the type and data elements.  Since both of
> > these
> > are explicitly set, memset is not needed.  So remove it.
> > 
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> > index b4a308f3cf7b..49e2664a734c 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
> > @@ -64,12 +64,9 @@ nvbios_pmuEp(struct nvkm_bios *bios, int idx, u8 *ver,
> > u8
> > *hdr,
> >              struct nvbios_pmuE *info)
> >  {
> >         u32 data = nvbios_pmuEe(bios, idx, ver, hdr);
> > -       memset(info, 0x00, sizeof(*info));
> > -       switch (!!data * *ver) {
> > -       default:
> > +       if (data) {
> >                 info->type = nvbios_rd08(bios, data + 0x00);
> >                 info->data = nvbios_rd32(bios, data + 0x02);
> > -               break;
> >         }
> >         return data;
> >  }
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


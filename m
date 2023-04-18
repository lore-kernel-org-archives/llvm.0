Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0023C943
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 20:48:29 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1a69f686345so16159465ad.2
        for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 13:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681850909; x=1684442909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcTCjbZ7nBWt2PlzVkmPNGHNdIxrM7SInVISomB8raI=;
        b=BPybYlYVir1kU0Ko/AfYMhuH73xGWBGaHaBWTzirTch1Yu1YBlAw8S+xalDUoCD6nc
         2XET1gEZwAi5YuseDUDd4xOb64+BiyRFOV2+WqZjlmCYdn9iOptn8fvjqM3ts/iTVN6X
         LbpQBhX8SSkBdPpphAzgs1TyENFzrqI28FkcOJlSwe03OeLtwclb194bRtDvifklIvB8
         d20Gl6TY+jQ1f4s53DlmFY9uXO845TXByaDN1Drt9cLAU5GXS3TL9WTtpmw7+/kwpwxz
         nDr3YTFFpEvSxiYtZsJF9cy7bq5liarV5FLbGJCrdBOaYDPhRldftRv2cwaJo03z8Lhg
         dw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681850909; x=1684442909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcTCjbZ7nBWt2PlzVkmPNGHNdIxrM7SInVISomB8raI=;
        b=bdtwpAio9t6lFH2H18/1fC0zAqxayFPtQt/IstGvSK6kXCOzCWHLpwNtGAoIl5rhUH
         H2NzKnbChTJJaFOhpNQhWanjwfiSID9mm3RgInrLLDbSd4hKWOOgphCkACw9BxrFGWrQ
         xFZTAR1aUqxekImdu+3sZQWSv/0paOHDHJh/IhkAsIHD4BvZ+v99m7wrGHu+EjeYVlIa
         kum7Z99TP8bafAISLKpRjf8hfQ3IsigeH1IRptmst5tfmC8/Xk4scRy4I9r0rMYHlgu2
         eC0WBw/xyQPJN+dDwxV1P0NiC8GrDhyspJrwTPmjRrJqiuSo7c/OhZMvBo3x7GoxvXSG
         gwYg==
X-Gm-Message-State: AAQBX9cffvSDDJ/WW/MAg5NZClXl3oNndH1GrVnt7phOKH9Nua33GdfU
	7siRfA8ezvTdOf3RXv0sXtdeaUxUpu+n3S5mrlcaRw==
X-Google-Smtp-Source: AKy350YaI6gJH0+K/ZzQQNy+aKyoer6ZKZEPUfakQp1y1BPvig9WjvIP6y+WfAr9MA7i/gVZo/V8cT5cRZ/lD6GfB84=
X-Received: by 2002:a17:902:d511:b0:19e:ad18:da5c with SMTP id
 b17-20020a170902d51100b0019ead18da5cmr3934317plg.37.1681850909011; Tue, 18
 Apr 2023 13:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230418192046.3235870-1-trix@redhat.com> <fe7da2c1-904e-ee4f-9a6c-443049c214b7@quicinc.com>
In-Reply-To: <fe7da2c1-904e-ee4f-9a6c-443049c214b7@quicinc.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Apr 2023 13:48:17 -0700
Message-ID: <CAKwvOdmFGVPddi98yt22i+U+3aow+dwhxKgdJ45h3n1i-n3bzw@mail.gmail.com>
Subject: Re: [PATCH] accel/qaic: initialize ret variable to 0
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Tom Rix <trix@redhat.com>, ogabbay@kernel.org, nathan@kernel.org, 
	jacek.lawrynowicz@linux.intel.com, quic_carlv@quicinc.com, 
	stanislaw.gruszka@linux.intel.com, quic_pkanojiy@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 1:46=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.co=
m> wrote:
>
> On 4/18/2023 1:20 PM, Tom Rix wrote:
> > clang static analysis reports
> > drivers/accel/qaic/qaic_data.c:610:2: warning: Undefined or garbage
> >    value returned to caller [core.uninitialized.UndefReturn]
> >          return ret;
> >          ^~~~~~~~~~
> >
> > The ret variable is only set some of the time but is always returned.
> > So initialize ret to 0.
>
> This does not appear to be entirely accurate to me.
>
> Do you know what analysis Clang is doing?  Is it limited to the function
> itself?
>
> remap_pfn_range, which initializes ret, will always run at-least once.

What happens if the loop body is never executed, say if `bo->sgt->sgl` is N=
ULL?

>
> Feels more accurate to say that Clang cannot detect that ret will be
> initialized, and we want to quiet the warning from the false positive.
>
> > Fixes: ff13be830333 ("accel/qaic: Add datapath")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >   drivers/accel/qaic/qaic_data.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_d=
ata.c
> > index c0a574cd1b35..b46a16fb3080 100644
> > --- a/drivers/accel/qaic/qaic_data.c
> > +++ b/drivers/accel/qaic/qaic_data.c
> > @@ -591,7 +591,7 @@ static int qaic_gem_object_mmap(struct drm_gem_obje=
ct *obj, struct vm_area_struc
> >       struct qaic_bo *bo =3D to_qaic_bo(obj);
> >       unsigned long offset =3D 0;
> >       struct scatterlist *sg;
> > -     int ret;
> > +     int ret =3D 0;
> >
> >       if (obj->import_attach)
> >               return -EINVAL;
>


--=20
Thanks,
~Nick Desaulniers

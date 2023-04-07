Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38253EBB
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 18:30:07 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1a04634320bso2027435ad.1
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680892207; x=1683484207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HFtEQBBSrqrPLBtxkiSj0n1tTAIZHxJ4QeL5qxREtA=;
        b=SGVhjkvM7NMsU3Ujj47loy8mP8KYq9yQKj7qCA7dGa6PS0QGifsVTLCvMX9UxzGjCw
         HT6NnidZGBo053+sewjwtJyGcjS4BoV9MUYXQDd9xRILSKr9204cTvzS2huicN0Fg5x0
         VW8PHcQrfrG/EesRu2lov5LxIsQw03EgW78SwfOHXkerwYqWrGckT2wpZlFFc+qLJXbg
         pXqLIx3yiEOUSdKq0fZfiKJwysQO1jEwJbUVhZuBCnDkSz4gKhfr9dkB/wGt0+7bEl7f
         UtG7bO146qYi7lU2K57GH3F31N+1GGgq+wW9M3CzOfDNs4dxg/65laKeUwfT2VD2zhVv
         cBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680892207; x=1683484207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HFtEQBBSrqrPLBtxkiSj0n1tTAIZHxJ4QeL5qxREtA=;
        b=s04bgg+ykNwVuGfWBkl62YJbSkcz/yN4BcZ7vFvrqt+hccDbuejlUtNaPdh4I8BQOJ
         wuo9SouceRKzEhLLTZVK4RyxePyds8IMF0O/6olDwHBAJnI67vvSiO65Las18z05pgy1
         ovAdfrgRCk0hE7U/PtQ3QC2xsY8kpHB08n8g7MnzUrif4pKdiAR3+Gw4sV8+Z/tceuD0
         goQQwVUTw70lHIzWEiWCgWllzle3fEgcBTdBbWkN0cDnpi49Vt1CCIYlmhti9/YgfS7o
         hkMBkUEovY97mWmwByzIvsbeTAGSoU+Dfa2toTlO918UJ4lWu7yEzi22iVMMOy7b26Yf
         qVTQ==
X-Gm-Message-State: AAQBX9dCWFOwcheCzdvZUjhUwQwHM/b1K8fMsK+C0EZXJ0q+uNExRYIi
	JyTQuJuMBGUMYTL/EJoy6uLJZ7SxfQxSjTfvPMBANA==
X-Google-Smtp-Source: AKy350Zn9nhE87iZkJPFl7414s8bVyJul5VukIyzyCsiFEtRHapVK5V9N1ZeYdKb2AlkJUj1xE94rcNxMRPPdz4DjIU=
X-Received: by 2002:a05:6a00:2e23:b0:62a:d87a:a375 with SMTP id
 fc35-20020a056a002e2300b0062ad87aa375mr1663621pfb.4.1680892206429; Fri, 07
 Apr 2023 11:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230325134503.1335510-1-trix@redhat.com> <CAKwvOdng_wH8qKnnGN=VpUhLK9q6wyc7sZKO7ORt-3QOKVP_nw@mail.gmail.com>
In-Reply-To: <CAKwvOdng_wH8qKnnGN=VpUhLK9q6wyc7sZKO7ORt-3QOKVP_nw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:29:55 -0700
Message-ID: <CAKwvOd=CVq3DTPwUgDgghJBKsUKgL69K7Hne5=gY9V7vwshfAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unused matching_stream_ptrs variable
To: Tom Rix <trix@redhat.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
	alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
	airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org, Jun.Lei@amd.com, 
	wenjing.liu@amd.com, Jimmy.Kizito@amd.com, Cruise.Hung@amd.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 10:52=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Jimmy, can you review?
>
> The change LGTM; but I'm not sure if there was something else intended he=
re.

Nevermind, Jimmy's email address bounced.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> On Sat, Mar 25, 2023 at 6:45=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
> >
> > clang with W=3D1 reports
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:625:6: =
error:
> >   variable 'matching_stream_ptrs' set but not used [-Werror,-Wunused-bu=
t-set-variable]
> >         int matching_stream_ptrs =3D 0;
> >             ^
> > This variable is not used so remove it.
> >
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/dr=
ivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> > index 41198c729d90..30c0644d4418 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
> > @@ -622,7 +622,6 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc=
_state *state)
> >         int i, j;
> >         uint8_t valid_count =3D 0;
> >         uint8_t dig_stream_count =3D 0;
> > -       int matching_stream_ptrs =3D 0;
> >         int eng_ids_per_ep_id[MAX_PIPES] =3D {0};
> >         int ep_ids_per_eng_id[MAX_PIPES] =3D {0};
> >         int valid_bitmap =3D 0;
> > @@ -645,9 +644,7 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc=
_state *state)
> >                 struct link_enc_assignment assignment =3D state->res_ct=
x.link_enc_cfg_ctx.link_enc_assignments[i];
> >
> >                 if (assignment.valid) {
> > -                       if (assignment.stream =3D=3D state->streams[i])
> > -                               matching_stream_ptrs++;
> > -                       else
> > +                       if (assignment.stream !=3D state->streams[i])
> >                                 valid_stream_ptrs =3D false;
> >                 }
> >         }
> > --
> > 2.27.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers

Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C42847C
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 17:49:56 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1a071225561so1170575ad.1
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 10:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680889796; x=1683481796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOYR5yl6ypiXPPEsw9LGpTcARLtmR0joIO+5Gy/Ym7k=;
        b=gSjbHOfHvFZTwg2Y8sJqAABr4qbOs+k2r0fQ+0VSOZk6KDkWrDRTPyg4C52MCNHNE1
         mBU7V9D/2Md0WXYZkvllimMI1smpQ1C1kFfkReM4r8ktSoI3kxRfchhJRzDwgRFuoOlt
         vbOvICGQVOBv1Qn70leZLT6df/AwluazWABijBn2vcVMO1zE/lo9kQiJeI00WteSuQzO
         4E7JC3dixEOti4CtUDh751L3OUzUjfxsuq57/AW2RnR6Le3p9lCuvLXaMRlsFskWX/9J
         owh1Fitcsrv4fXxFYKplshFL978dzQ3D+fBn9bMuWz/gIKi76FWckOOCuAdt9sSYV7S2
         Fb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680889796; x=1683481796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOYR5yl6ypiXPPEsw9LGpTcARLtmR0joIO+5Gy/Ym7k=;
        b=YEtXx+gyhL9uhRF7x4Y24dUJuqQdCI04hkOo2jiZ3HE/i34mgDV6On7SC96PSVTeIc
         H5E0+OVRVEhtfglXdKu1i96iS+C62J/EYZ2LMsQPD9Yw1A/v3bsDSuws+7snIEc0DO3F
         7DDlkhqSSmCChXryr52PgJvK6tH1THNu4n0xxxCQ+x5yVqgpMD+WTfb/Anb8ohdTBTqc
         C/x0QeusiwdotjSJKjKRBCuk2oNCjjg/lIE0O7t3DOuToCySPA12S3EGvZ46dEm2BNgn
         yCqIIwk2p8X1uXHo2HIQxfHDelKCotlJmeKfZjXSImM7Km9EIsgAbi5SjHI9yZK6elxN
         vnxQ==
X-Gm-Message-State: AAQBX9cm6uHzXhHJZDBLyBhIizKi5TUit6TZaSWDsp9UW+/pX7/njQ/1
	F2As9Ge0UIzdLrAn0fyVuHJxqOqJqMUnBw9RThsTqw==
X-Google-Smtp-Source: AKy350YcyBmqWjxSDZIDUgohnwuC5OCKa+DcG7pxNN+qXdDBC9rHkNcGfLqqt8MDPERyF6go6jpkdZN6egNSE+y9cQE=
X-Received: by 2002:a05:6a00:2d88:b0:625:c832:6a10 with SMTP id
 fb8-20020a056a002d8800b00625c8326a10mr1535733pfb.4.1680889795599; Fri, 07 Apr
 2023 10:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230324195403.2655148-1-trix@redhat.com>
In-Reply-To: <20230324195403.2655148-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 10:49:44 -0700
Message-ID: <CAKwvOdndQiSbMK6a7nU01HiovY-Bdjt4m4gOO5m5A36y8qQ8=A@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: remove unused mksstat_init_record function
To: Tom Rix <trix@redhat.com>
Cc: zackr@vmware.com, linux-graphics-maintainer@vmware.com, airlied@gmail.com, 
	daniel@ffwll.ch, nathan@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 12:54=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:716:21: error: unused function
>   'mksstat_init_record' [-Werror,-Wunused-function]
> static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
>                     ^
> This function is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 26 --------------------------
>  1 file changed, 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_msg.c
> index e76976a95a1e..ca1a3fe44fa5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> @@ -702,32 +702,6 @@ static inline void hypervisor_ppn_remove(PPN64 pfn)
>  /* Header to the text description of mksGuestStat instance descriptor */
>  #define MKSSTAT_KERNEL_DESCRIPTION "vmwgfx"
>
> -/**
> - * mksstat_init_record: Initializes an MKSGuestStatCounter-based record
> - * for the respective mksGuestStat index.
> - *
> - * @stat_idx: Index of the MKSGuestStatCounter-based mksGuestStat record=
.
> - * @pstat: Pointer to array of MKSGuestStatCounterTime.
> - * @pinfo: Pointer to array of MKSGuestStatInfoEntry.
> - * @pstrs: Pointer to current end of the name/description sequence.
> - * Return: Pointer to the new end of the names/description sequence.
> - */
> -
> -static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
> -       MKSGuestStatCounterTime *pstat, MKSGuestStatInfoEntry *pinfo, cha=
r *pstrs)
> -{
> -       char *const pstrd =3D pstrs + strlen(mksstat_kern_name_desc[stat_=
idx][0]) + 1;
> -       strcpy(pstrs, mksstat_kern_name_desc[stat_idx][0]);
> -       strcpy(pstrd, mksstat_kern_name_desc[stat_idx][1]);
> -
> -       pinfo[stat_idx].name.s =3D pstrs;
> -       pinfo[stat_idx].description.s =3D pstrd;
> -       pinfo[stat_idx].flags =3D MKS_GUEST_STAT_FLAG_NONE;

This was the last user of MKS_GUEST_STAT_FLAG_NONE, is there anything
else to clean up there?  Otherwise LGTM.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> -       pinfo[stat_idx].stat.counter =3D (MKSGuestStatCounter *)&pstat[st=
at_idx];
> -
> -       return pstrd + strlen(mksstat_kern_name_desc[stat_idx][1]) + 1;
> -}
> -
>  /**
>   * mksstat_init_record_time: Initializes an MKSGuestStatCounterTime-base=
d record
>   * for the respective mksGuestStat index.
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers

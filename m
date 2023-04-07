Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70686FBD
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 17:36:42 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id d22so24874279pgw.2
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 10:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680889002; x=1683481002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKQ/0jGnOo/TaPpGUaml4IRy69MNIBKloNhJZjKlyT0=;
        b=KD6ZnfzfidIvC2otpuKywoCEsPFpclOlyGbsChbiRW+NoHLgvlIIgbDR4G+StlGoIH
         70V+Xb3tH88TdmFrqGplFBGXqlCuzUxbpiYDRXsLBoXwoTz2W/3cDhHDXwaLaBxXrYgF
         HoyNSRrWgdMunOUk6NYADKkEMctFlUeJ1Iki7CFRPojkLCxojNZhXIY4q/yC9rhMflBI
         HVPtR1t3cZu8XwM35jE6pq6TIb9CglNvwwY1HkADONdXRkNJsKn9yWoPfVIRjtounOsv
         vbp2pu43LZzeofyFbChgOgo1nVZLGY29Dl835qQC8chqq9E88SUh/NyYFrzZxEKcCFHk
         R1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680889002; x=1683481002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKQ/0jGnOo/TaPpGUaml4IRy69MNIBKloNhJZjKlyT0=;
        b=kLMxhrFFXyxhXIWBKOnxYIIqtE1Ny6jMY/RWuSnG5c0QSDX3nIOs8hyvNkcqP+2QsF
         xekydiIgiuEcly+4bQZ1xO/RlmzCse23lY6jtSYms/n1Rw6hgAFc9nnW+ENZYx/BSPRv
         Xz1F7uWwUcY4jFbrJC6jUnZOtGQ3U0iVyd349FGI6/WRf/tGqDi2EC1eb08ffDEAr1tb
         x9+yg8KbxIIG0SXhR0Oa5+xeO1YMHnZQJSq+2lj8fvZfnTtDHzW+f8My/d2j8xEW1NUl
         /y0F2Ja/0+AHod2Cn+cvg97of/KLLE2bfE9swtPYwbqi/3K2QcE18UMgA9jKllgvoD16
         Zz2Q==
X-Gm-Message-State: AAQBX9eHMV13TShMyfRWlwD4yhqHUuxAOOreLfJI9tG2XPfMuj9Yv7Dj
	fY8GKIdbr9B+ZCCB16GtKA9ocfSZ5mn57tL2pKbrcg==
X-Google-Smtp-Source: AKy350aSeVgPhP3/iHKIqEYixpWTIqJFHUyWjp2+JIS3RbQGz3Zhh/BGeX+aSZcOD/B9rL3bBeCHzbu+p557vPjtJzU=
X-Received: by 2002:a65:578e:0:b0:513:a488:f05f with SMTP id
 b14-20020a65578e000000b00513a488f05fmr620379pgr.1.1680889001970; Fri, 07 Apr
 2023 10:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230318133952.1684907-1-trix@redhat.com>
In-Reply-To: <20230318133952.1684907-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 10:36:30 -0700
Message-ID: <CAKwvOdk=TGUTJMN1Am6EayVd1M9NRy_SwpUQBFWCb=+5KyMeXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/kmb: remove unused set_test_mode_src_osc_freq_target_low,hi_bits
 functions
To: Tom Rix <trix@redhat.com>
Cc: anitha.chrisanthus@intel.com, edmund.j.dea@intel.com, airlied@gmail.com, 
	daniel@ffwll.ch, nathan@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2023 at 6:39=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/kmb/kmb_dsi.c:822:2: error: unused function
>   'set_test_mode_src_osc_freq_target_low_bits' [-Werror,-Wunused-function=
]
>         set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_ds=
i,
>         ^
> drivers/gpu/drm/kmb/kmb_dsi.c:834:2: error: unused function
>   'set_test_mode_src_osc_freq_target_hi_bits' [-Werror,-Wunused-function]
>         set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi=
,
>         ^
> These static functions are not used, so remove them.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/kmb/kmb_dsi.c | 28 ----------------------------
>  1 file changed, 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.=
c
> index cf7cf0b07541..ed99b14375aa 100644
> --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -818,34 +818,6 @@ static void test_mode_send(struct kmb_dsi *kmb_dsi, =
u32 dphy_no,
>         }
>  }
>
> -static inline void
> -       set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_ds=
i,
> -                                                  u32 dphy_no,
> -                                                  u32 freq)
> -{
> -       /* Typical rise/fall time=3D166, refer Table 1207 databook,
> -        * sr_osc_freq_target[7:0]
> -        */
> -       test_mode_send(kmb_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES,
> -                      (freq & 0x7f));
> -}
> -
> -static inline void
> -       set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi=
,
> -                                                 u32 dphy_no,
> -                                                 u32 freq)
> -{
> -       u32 data;
> -
> -       /* Flag this as high nibble */
> -       data =3D ((freq >> 6) & 0x1f) | (1 << 7);
> -
> -       /* Typical rise/fall time=3D166, refer Table 1207 databook,
> -        * sr_osc_freq_target[11:7]
> -        */
> -       test_mode_send(kmb_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, =
data);
> -}
> -
>  static void mipi_tx_get_vco_params(struct vco_params *vco)
>  {
>         int i;
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers

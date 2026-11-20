Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195898;
	b=TASNwh/eAGMsI4RmPpW08ZamHnaFYExnTdTl+GxBz2sp79ot1oDJH5irnyK7bo+zaQk6
	 cOhHxQP7KdmZ21b2N3xx3MhZK+orTl4ccKOqp/xWoAITLYjRK+IlYIOW5oX+6ej5z847D
	 8wBiPy9tRSjlvhauFr32Nk5wqzJVASXKlteaJbGuqySo9RLRTSEDMpCXITSxctbSUVn7v
	 64dQTEKj3Bg3w9k6BnMRwAqahSUuqoiz5zanly/hJB/7YP5aiCCFTm3MbljFo/92cAQz7
	 oSbBKzr7KHyekyTn/vhJH2p02iqONetySKEs+8kJOheDgnwJxV+aslmihvDVsTzOBDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TI7DZVXU6YK/vkfYgR8KztTLGwad0zi129B1pm8/11Q=;
	b=0qZB2nTfMLkhRExL9X0KG8ecPXgl2fdpUSzUerldnvmFTsO939k2/PgZAGhNciT1nGj2
	 1xNDRlfrkxX55VwMDxjqsb9BF6VOn0mXzwFheyjKYjGpiCsHwb2CQKf4YvFdfqf4SUWDp
	 4cpXEogf0hP20CwQbkxkv7SKX6UTeXE0pntRF0CSQ4v/orjqB/qGct+a0VvtuQFvDCcvo
	 U2jcmdcjPWYMRBqZA0KpnlhQgf6zJ2XoOmYrRKD84nme2b1eoyLJpOz36em83Uat3o17x
	 b+Z4x222npu/HymL0U5E+90xzsa+718hyKPTZ+K5kuzgWX4WgMJtrMEGk0yEqbqO4Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=biS2M5u5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB572606A33F
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 17:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB572606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=biS2M5u5
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533202fe429so372891cf.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 09:31:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195896; cv=none;
        d=google.com; s=arc-20260327;
        b=T0KYx4mi6mi+t6Ujr4AqOIT8mHXuybHDO/nY0hghGloGf0M4bpB4Zlw2JCs1QLSszM
         dgOAdOBTmgY9YPHwpqwF346X6vMpeutTRaRp2VfHqG6AgOWP9DKXb/Ho1mEOrG3VwNLI
         a85Sg2dgGAu+VFarKx1dvMYYJ2bMXzLFle/cCIMGRvzHNFS6YpmTczmLyd5aSaSfx8OF
         rmZ0udbRawBVGnVEzuJWKpzVx31Hc9hLPPbsKJbGbbT1YP+1O3tJdGleEdYnvfy00JEh
         saESb5CaRTlKmNTLcLFGCWrXRyTUifcYkszJlrCbpV8Qe9WEes71P32WIfRyY+6fNEZJ
         EF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TI7DZVXU6YK/vkfYgR8KztTLGwad0zi129B1pm8/11Q=;
        fh=WNsuqDUHNJgYKOsVvCjOqf9P32i7JbbHBf/xsEmLZ2o=;
        b=DT4GzQZuoxXoNzRpBl4AVnf69arJJ2XPfYsVoQ1jpGkrC0PHp6yu83T03EKxoEzhLy
         QLHfK64zOp1C8RX22Dqy3p3eQVM+2Qj8VM1SHG67CI7k9QBVGxm8UHV4vGsfBsKofeFx
         GCJJVE24eFNxEjcMZ0RMMhRkhrPzKkYqnSY8oaBynr1TsLb7NzimBc+tv9cWrOsMq8cI
         t6DmOSSsn/zqtJH7wi69tl6Ggll9XH4yvRIW8DL8kql+as7YBzVJzHralt9GzsoyUtN8
         fLvXiIM4LFcyxkjfE9Kqq+3eYctOR/v1ff+5TYaj/KBNmGBaTm4E5ZuAORfeNcCvvGYE
         AJfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795195896; x=1795800696; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TI7DZVXU6YK/vkfYgR8KztTLGwad0zi129B1pm8/11Q=;
        b=biS2M5u5zuRwsc3cWs6yeFNNHNa4g5LB7ctww7DlvhiZbzloc0pRCWqS0ytXHhACr4
         knvxls9gNcA7ApNt3pDBEe4CDbPUr+iqC/4KCbv+KmphJgCNUWeu7rdpcEt32JnPkrVQ
         hp6g0jFB3M3O5V2PcQjW9A9MVUclTNw71uWiO7DwcZkjgTtqfeN9BJsE0kQnnNFjHXtQ
         oTo7fww9vRC7bGJR8JRd+PLcXnIA4xI2k9DrPsayO9yqzERShrLoPdRofTNUE7tk1r7B
         PfoRQ2Qh4Qk9IMKWBeTjtedd89dd2MkLfMU5E8rkWk/WZMIG4l/+mv2zpKm0ZhNgOLiv
         tc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195896; x=1795800696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TI7DZVXU6YK/vkfYgR8KztTLGwad0zi129B1pm8/11Q=;
        b=jDDFi7euwTfmR9kV3PcrOIZD3yDx1jY12neQZeepO05BKUIe8fBmzvpFyxkScUzz4/
         //o2EKcbzFjw+Pz+29jpplgA0bILBgpy8hf+fgkqKh+oJ1kqOok5ZjufW/MpmEAqp/Zt
         f/XNNVfyzjvNcVOA1rzhxCW4yceCm4NqTn6sBsBwpBHGoW5ab1pPUQvhO1h6RglMc+9j
         X7eIjfqtB2TVMYBmCgKrnQEIWrplhr3DLOFl+vWdVm2Ld/0EwHrwFUyi74SCxO2dHo8d
         oeG9ldFGoQn0NxLDLI3hSZAv/six7trHnzqIYCZCBCLogwYEvE9C4HbSdYVg5HM2hRDV
         6w3w==
X-Forwarded-Encrypted: i=1; AL+hErGleUn6N9aIODIdmOkebt2humZbIy8YlBxItrs5Gg5+Kzil+lRPotCqD6aO+k5oj+seTfNs@lists.linux.dev
X-Gm-Message-State: APuU4Z9toWCRCOB+hEgCHnNJmbjunqo3BsC8kcHSfl0IqetIbAsr5ygV
	rJZEDTIsa/aohxsLDg0wa0juHKu3j52bow71zY6LMINxAebDUCzye7riUZdBXgkpy7zIGgZa2KD
	c9jaY0COeUe/cGGyX+HcKfI/6DltM9zjqhHTp64W1v/YE1HXXX8fPDSfNpZg=
X-Gm-Gg: AZFdTZdbSh/mteM//bPelvbUC6oEO03Wry0IiuH+LTAim70IfoEbo4LWTwxHaLXAaN3
	cpS/GDpfCfwcwAl5A3Z2g6LAK7OLJI9voC/IrOV1kJiqVTXCU3SinOx6LNPWzK2URNoQr0irle3
	rRqpIQF2C4Fxxrag4ZC2vftHwIiDON+8puhygZIRfJCBvGnOxiOAFtobvE6wQb077ttl97shD2Y
	wiRE+EMPZVq4hPAdmLumO8qyr3Zz4gQDzmBkN48JpPcHejBCjnS9b8R33kacp34d/AjLhwEB41C
	/+5sjSqlbPQviBfjSxZPayf3dMSaESuoZHHqM/ddRfYBp0tACDD5qwj3WstF1saIeHoWa6sO7bB
	l3X8ZhGv2VLTp9tAFnrKlPoFlfPsUXpxKXAj8
X-Received: by 2002:ac8:6102:0:b0:546:92f2:7830 with SMTP id
 d75a77b69052e-55d7914f377mr24289241cf.6.1795195895205; Fri, 20 Nov 2026
 09:31:35 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1795106955.git.irogers@google.com> <6fcb1e5c7545f8bcfee9ac9a3abd296c475aa1b7.1795106955.git.irogers@google.com>
 <dc491d12-68f0-4297-acda-f122fec00288@amd.com>
In-Reply-To: <dc491d12-68f0-4297-acda-f122fec00288@amd.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:31:24 -0800
X-Gm-Features: Aa3M54pYUkUhv-1L_RAm3wzkZJVptY38X_B1tSpjk2kKiiLF52OLhk9KXrZQJlk
Message-ID: <CAP-5=fWN3zHAtixPSbaNwXn9WWTcxd1+XJO6uUb-S-FgNzrUtg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:12=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> On 11/19/26 18:07, Ian Rogers wrote:
> > In amdgpu_ttm_clear_buffer(), 'r' is declared uninitialized. When
> > consider_clear_status is true (such as AMDGPU_GEM_CREATE_VRAM_CLEARED
> > allocations) and all backing buddy blocks already have DRM_BUDDY_CLEARE=
D
> > set, every iteration of the cursor loop hits 'continue' without assigni=
ng
> > 'r', returning uninitialized stack memory to amdgpu_bo_create().
> >
> > Initialize 'r' to 0.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wconditional-uninitialized enabled; fix and changelog drafted with an =
AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.
> >
> > Fixes: 23bd7e67961e ("drm/amdgpu: get rid of amdgpu_ttm_clear_buffer")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 0f86777250fc..280fcdfb9cca 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -2675,7 +2675,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buf=
fer_entity *entity,
> >       struct dma_fence *fence =3D NULL;
> >       struct amdgpu_res_cursor dst;
> >       bool vm_needs_flush =3D false;
> > -     int r;
> > +     int r =3D 0;
>
> Please initialize r directly before the error label, apart from that look=
s good to me.

Will do - I'll move 'r =3D 0;' to right after the while loop directly
before the 'error:' label in v2.

Thanks,
Ian

> Regards,
> Christian.
>
> >
> >       if (!entity)
> >               return -EINVAL;
>

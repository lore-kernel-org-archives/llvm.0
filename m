Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195847;
	b=xMiI0p++gq7nVEI7c5DyPGBgoDe7cdO8FXe7oROEc3YEhrofSbix4DXnemcNe05k5Ve9
	 oUIF6u54kSOTmavxNft7QJVymuPAYsMlYUAUdF1hOD/Lkmo528wXAKGQyU82JHvIVzuwg
	 cvbPfwSxaKCGFoUITDvXfIfvC7Vbdwf/77y+R4npHbs+clmkCDzd0dsxsyRnPtxQw9qWv
	 ABJrrIUbCoNJG0Pj4IkDapXomfmMn1riovgq0NpUQEGPabo9Ea/C+IPhzj4v1xvPRrxdk
	 Es57iOrALG8yYoftXgfThWjL79npVxv9KXRETbuGpSx707Ph2pIxGVm0PpJ4By0oGhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YNjONpgW3BzEnvATPOG31tZu3+6J6bJ+/wDP0A0YD9o=;
	b=gJvVD5HfHHCwmpVBP90TM3yp0rlzFihuMSDvNBWksMbCoh9Ytu2cJ4wcw/pep50j2jBO
	 G3SeEr8jq1LNCp/It8zIQLJ1qqEp8Vkrao8fZbyhxjpUVuSwH0pcJY9Z8yTdwuDfbVlkL
	 33LFQOT9g/48USrA4tx9dqBkRB6IO95VSW/OugkqsjrBmmTCjElRX4s9DNet786ugk+zy
	 4oQhnGVF030Aj2k8olEGn0/2z57nlNSJ1RHF0QVtZtsKfJgoCp3UlG/TQ/P6xERFTUYDC
	 27py6zI9HT98EIOlLo6BoE1S+pNvZGxD8zUhsv7VOu1u73p7la6crXnWoroXwA+xMuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FVR3vjX9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769CF606A32C
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 17:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769CF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FVR3vjX9
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55be673e029so306571cf.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 09:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195842; cv=none;
        d=google.com; s=arc-20260327;
        b=RtGgtDj8+7IeR1UfSZVhlMf0ZebsSFTJaHSccPgRT5tkSt/m0aTz8gvvvIjH8UGJOv
         LriOlBdevyBzYaZUTajHz6qflOCFpJJbXQt8yhJOGarAG1jrb1SKknC21HnixyRHUmO6
         t9PSyzRGSB9G1Abq0vs80Qg0VkoqKMw2j8fIB3ZKZTEgo//IScd6lpjxz4aGI2zv+tkl
         GKOZi3wlRFjx8+mPUd6Dy5pF+LZn4wLl6j4xONUSRUth8+hMcz/E34LxsYZfHQ3g38li
         wN68SxasM9XNQ/n7D/araj2vGQpe4HgBULrCFX1pwWtaFlBSD9lGhmjhdZFL7O9yUZLQ
         LGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YNjONpgW3BzEnvATPOG31tZu3+6J6bJ+/wDP0A0YD9o=;
        fh=e/qZpZ9CJro9rSIxoo/PVnIr62zu0nYfD1/LN/7aQ/c=;
        b=MHdViX7uuftuYZDL9h7thRjsmbKXRcjfWtyxBx7F0znIEBnkfNretjS+py85daPraY
         mWXTL6PWQFShnuxDVm5V1YYe+f4kvmolqmSezc2bxbzx4hC/8aJeC2iaX2qD6LJ60Xqz
         CAH6gst4d30n+k0XG7dBruWSwzr4tvZ06MHs+1apCnU4JoVDdq/wiTtK2e1Uene/c2Nl
         2UrtTMajq5EqO32KlXxnBUhZ2Mx3NHmBU99/f+nRaIS0Z2wwO3R1NeiFS/NwiWF71Ylo
         WL+uF5UcZoknhg6mGYqomyn0uQksbuC0qs/q4xPKChqy13feSD9AoL37lwIj9areQQ8F
         B1nA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795195842; x=1795800642; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YNjONpgW3BzEnvATPOG31tZu3+6J6bJ+/wDP0A0YD9o=;
        b=FVR3vjX9eB+ZrrGibwrK54x+7rDbe9nt3l+wizhNN9DAag1Q6U/WGcJkjgHg9j/sb9
         f1a9m+LPjCNvvRu0anFUn+HwiKjkpECGWHNicPTRAp4kUF9h1sh8LKESewJx57/6hdbV
         rGVBpMA0otMzuCFsu2axaLkgX5b1TfW7jp5wN/x3t2YoZOSaBnG6iXOXGJvIer9v9Up1
         5LbBUo/AChDhIXfI+tRT2RzBlgVF+yfLobcwddJrtsvUaUJJRDPPlO1j0/Ud7KbtZtiJ
         e3tUPm1pD9Y5dx9tzQ3sK5Xztm7qtlcEvCVtv2K2dtK5NwjLTrXz/s3pF6NPWzuUoa8L
         tI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195842; x=1795800642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNjONpgW3BzEnvATPOG31tZu3+6J6bJ+/wDP0A0YD9o=;
        b=iaIOf3ohDwfj3pDzXhcY/3BDweGCZpZWo5yPulO6T6/YDbjFWP1cNX1YA5AaBpURw2
         IRObbpcSnLttrt2f33rAe24xbk2ovrG9jSD4Yx+Dv6VuasUC7u5PD0i0dYXofT80fiax
         AcYJIgP7x7sp2PwPJtV9UNjBwr4KUSSXT7RYG4GX0WJClvBLvNCS/TntBSMq0PhyjeyT
         uFBvSS93vA0R7xPn/WkgWoS/pJyIg50gi7PMducpfkrYTuKlHJ2anXvLRuZ+6KJ+P2IV
         yizwRggUQBSKI0XsRj50FHeOU6HIzpUGKTdkU1zP25kkYo0iu36XGpGWGwY+f4JSTMeB
         hzyg==
X-Forwarded-Encrypted: i=1; AL+hErHWLc5+nF6BnTzac8BKx6TZLxwNsLRv3VQj87ii3/ChSjecMsbN1oJouTC04ybOhQQPHt9T@lists.linux.dev
X-Gm-Message-State: APuU4Z/1Ra/Xak/c2ThDdafCS9CMFdtCG4jVxXzMyykntfMJZI/8gm3B
	gznzR1kl1I+eiGuoPmmqG7buwYxpOGPqxFHVi8V64I+vQ+m2ECtdwq2zI+FoXtaUKrlVrrpdttw
	Zwh03hKAqRIhJEg2qad39BSBtlnRcyzFiocookLge
X-Gm-Gg: AZFdTZcwPlIMWO/EdK6tXOo0zv2yLHIKRHfBDUEIjc1erNVN4WWnLWhJ9833dpLYRqE
	qfm7ZoRRLTtxM6wEExnOEkqr1HpH+N0lZeM/5Ly2tQuxukRItBxRK9mWGY0tR9Wcrx8I6+iBS3v
	hqbvU6tjgdh2WdKeZ3vnXSe1L8z0hnvOAIhVt5t3jeth4Lk9+v1pnDRRaRrdTC29+vYH4wh+uYo
	t9rs5C/qpOfWc3FeCUdN7U9BqCFx2UymgVIeodu9P5QETBUT3IQOrjta2I69Pf92cnZjJCGs1/l
	4V0QZ0fJonMjr/GCZIuWJeEyE5FmqmhyWZgV2gFu/eQ1rAkrU2FzLEwTyMkruePElQqdt7wn3tT
	ro8ChtYIJFxstLMuGRmzp8AYfepaCqKfoT0gP
X-Received: by 2002:ac8:6102:0:b0:546:92f2:7830 with SMTP id
 d75a77b69052e-55d7914f377mr24269751cf.6.1795195841498; Fri, 20 Nov 2026
 09:30:41 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1795106955.git.irogers@google.com> <e8d983aa6f81be52ea1bb9afc9c0f47d4632c1db.1795106955.git.irogers@google.com>
 <5fb8ce65-923e-4714-946d-ecaa4ecad399@amd.com>
In-Reply-To: <5fb8ce65-923e-4714-946d-ecaa4ecad399@amd.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:30:30 -0800
X-Gm-Features: Aa3M54oXyhu70SenU9J6OYKtnIDShLY5qmJ7ZZxuUaXwxMEM1-bkb09kjVtb0h8
Message-ID: <CAP-5=fWBN0=KCJcF52-1MrAQjXZBgyZ286_qQtfjN0JzDASFng@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: initialize r in amdgpu_vm_bo_update()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:08=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> On 11/19/26 18:07, Ian Rogers wrote:
> > Commit bc566781845b ("drm/amdgpu: stop syncing PRT map operations") add=
ed
> > an 'else if (!bo)' branch in amdgpu_vm_bo_update() that does not assign
> > 'r'. Because fpriv->prt_va has bo =3D=3D NULL and is updated on every c=
ommand
> > submission, userqueue validation, and KFD VM restore, calling
> > amdgpu_vm_bo_update(adev, fpriv->prt_va, false) when bo_va->invalids is
> > empty skips the mapping loop and returns uninitialized stack variable '=
r'.
> >
> > Initialize 'r' to 0.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wconditional-uninitialized enabled; fix and changelog drafted with an =
AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.
> >
> > Fixes: bc566781845b ("drm/amdgpu: stop syncing PRT map operations")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.c
> > index 82b9b2d5d0cf..091589b2c524 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -1303,7 +1303,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *ade=
v, struct amdgpu_bo_va *bo_va,
> >       uint64_t vram_base;
> >       uint64_t flags;
> >       bool uncached;
> > -     int r;
> > +     int r =3D 0;
>
> Good catch, but please don't initialize return variables a default value.
>
> That is often seen as bad coding style and often hides problems instead o=
f fixing them.
>
> Instead just initialize r in the if branch where it is missing.

Makes sense - keeping 'int r;' uninitialized at declaration avoids
masking future missing-assignment paths. I'll set 'r =3D 0;' inside the
'else if (!bo)' branch in v2.

Thanks,
Ian

> Thanks,
> Christian.
>
> >
> >       amdgpu_sync_create(&sync);
> >       if (clear) {
>

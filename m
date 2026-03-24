Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF3F3537D8
	for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774392929; cv=pass; b=fXapwV/EDoCtm4hkQMTT+C3KKr+6CpqvQ0NiBLnSDLOD3l8L+Vi8x9hGOC4j2l8/8vZ/Yvxt4aOJSPYheOIADLX3LlTo1iX954gmzjLj4W8gbhw3q0yKMG2Ae7FhqitFjWCqdjgh+N5H/5K0JYq6LDqgoIkQa5J68gJU0wuCS/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774392929; c=relaxed/simple;
	bh=Acn0BwQVhsSbSe+KwV3ejCkpYW1kVwInpusMQW9ka3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCL+6q3fS5Qy+Qgtip4lOg11O75AHKdF5wPU9CKkiSKgxzL1Md66QYKdg14UOD5cdKnWVELc580yk/jS7O0O04x3xGSdd7xSOuTbgqz2NTmphvBcaIo1/G5iT//65AMesLHWUiPHpFgoNMxnQMITvERqeyLBXuo761Gt7HzyT/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+IEXQgO; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+IEXQgO"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b976536806cso892273566b.0
        for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 15:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774392925; cv=none;
        d=google.com; s=arc-20240605;
        b=EL36Nk7Hf5PzTRAi1USJ/FqwdWN7Oi+Vf0W6Vx7XH/7GmT1+m5H/Km/IPLqbqQiepQ
         VmqCVLq+QjjvCEtdGymD8VNS+Yl1PR9kjRjOJJXz/ysB12NK9zjwzKwxwzwwnK7hkCcj
         n/azkZdejeHd0XVVHDEmm/9rNAB7GdL5j6oQA7eXHTmsmMRqON1ZzExSDHnEyLL8zW7x
         DBu4mixRD4mtKMCJjCv7nf6nB5OlME0/Of5B63/m8uuNZUxHQPeWF9gC8vUfUvo2Daza
         XilXxTrjjcPWF8VwswX5bGyVYRQKrtM5+jVhR2EGJXo0AwV6hl8IjouHc28/afb8Rc/6
         ZHIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BxsOL3qFQEwh4IiGZGHNeBM2vf4BVFOua4QJBI1ntYM=;
        fh=sIf2zVFH8EhpDHfeZlJqT3L000J+5T6uXDJxd//0OQA=;
        b=Si+cOLjWzpUDLdVo7Jnvo8miKhYq3Y+8FTp2LCYie5QTup9+lmF/DrTdgLUwu/+oZN
         ob3GQIP8NcqVvwO61nx9So2amPPvIJ55KqdAnEQXgzrE9VM5yxEEYOrvSyZg14lr3WVB
         vLRIyu3uxj3YP9XcoLQ2fy+J3ovlryJONvSZFCjgw+/JKPbxLEssWT0fp5go6exRYjDu
         VvBAJv0Lm+5KRIYuTvyDEsLYKLUeXgMFA+uUiHpEnLOOlQTpoyi1yvJTyryp6jKilbrU
         gAFnXSGGwyPkApftUo4fFQX/E/8SCZ6qsyKI43cbpHyGl7yESqjxU6kjkXjatbuhMaLi
         q6ow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774392925; x=1774997725; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxsOL3qFQEwh4IiGZGHNeBM2vf4BVFOua4QJBI1ntYM=;
        b=D+IEXQgOxe2bKe9dfLvzc7N7kCG3e4oP+32AszzpmKygEceOtUtqcukDdhEewBd9WJ
         jzpMSWfoplaawEI/z9TOOON0bmlh98EpFYwL7ZbyUHmVehvi4UOf3UXn2YQwP2wrZcTd
         RSc6dAcvGquelu0VoRJCBOTPz53iI3Z6V60J/rWUif1JRuEFbUnvSOxXt5og7r4HcHNK
         Q8NmdrUNM15j0KvMPvQGgCpyyd8d/aysEKGDTcUNdpLOL6uJGGlZ3gFIX0rNMWGWAYS0
         0p0NCwhk2xRY9z9DR4LXSZytluspMumF8K2Q/Z1gTR0MGRZLUPtz6UXnYeRpDq8R+N0L
         nODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774392925; x=1774997725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BxsOL3qFQEwh4IiGZGHNeBM2vf4BVFOua4QJBI1ntYM=;
        b=EkL0OMMQnqDwn1R7tVBFor+wrcX7GKUuKKWuFcyNPUlcn8NuJ45kKBvkt3DhdDTvaW
         w9AR69xAJr77JWXZxgWyjI5oTFPnDFYopGaPTvrMlGPzRTy3yKaGsDNMrJsuQ35wIoK8
         wnu9aprIkRBK57m2kM/o61ogWJVou4kfDakREu7mgeJ5JVlySnj5lEvb/hXKNLEZbHL5
         yYGClqN1yNV5Wtmd/mNZiq8qbTeh62u6nwVF1Z/fJ/ZmFPwrqqm9TL8fbvi/PuMTRllt
         apBWkVZJqzpJb36Oc9p+6PVzzF72lB0pv4139Htls0wEs2L9AJuDkkYYOwoSBX7UU0w3
         s0nw==
X-Forwarded-Encrypted: i=1; AJvYcCWKFPV6LQqIRVfVNqWYNpUaYwx72zjsKoR0LtTikeBPTRcpu2FFEBupWHP0g7em982jY2cW@lists.linux.dev
X-Gm-Message-State: AOJu0YzjF1OJOp3T3LV+uNcSstKytWPomj2qa1eWSLWXsr853QN6Z3I9
	vk0kC4xpAewvy7H9XnnHKLDy53dWYLpR6wDgTB0hcOwJexXdCqm8lMm45zbZrZ51ot20e6zcCgI
	x3ZPRZ7V0g7+jshSWaLRvxQqQPm8T0FY=
X-Gm-Gg: ATEYQzxbSBdzp7vCZpRzUJyvOM/kK6ZJVonQ3ICCD4SbbD+fcUjwRyNV9C8PAkFJhWJ
	n9Ml98eendYRb5WlifayqTMqtbiWg9R4iUiaJcza/wwJVQ4Ql48pnYgdhS7aNQ/9C+s3HDtKxDM
	ZWMXBIdOc3mrLcSiyoItbUDUoI3/RVqfE10Ud9CTiunXEX9kVuJ/9Ry5V2jKGDo2yByTDyWxc5g
	kBQs3tQfm3o0SN2ZA9J5WL1vcXGdw5obklsHRJIKpjJsp14hQndWsEStllxjm0HW/yD3cm89pyG
	n8T+Z8y9tatV002HAnr/OD07UbKZdYry71mg2PeuhazM3TsbeuLxramNRt0nblfQGA9Uchxu7Ay
	zAS4frQ==
X-Received: by 2002:a17:906:1708:b0:b98:528b:8462 with SMTP id
 a640c23a62f3a-b9a65c3b807mr52867266b.55.1774392925139; Tue, 24 Mar 2026
 15:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324192120.2959891-1-arnd@kernel.org>
In-Reply-To: <20260324192120.2959891-1-arnd@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 24 Mar 2026 15:55:13 -0700
X-Gm-Features: AQROBzDQZJrTD_T7ZKPT7WtEzu2goAEf-BbMJgaMHMcvkrnz2wCR3Pp47UnOy0s
Message-ID: <CAKxU2N-ORQZ-jcTAoR1CjS5pKL0q6E-2Ltta+qAcGuwCD2cM9Q@mail.gmail.com>
Subject: Re: [PATCH] HSI: omap_ssi_port: skip useless NULL pointer check
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 12:21=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> ssi->port is no longer dynamically allocated, so there is now a warning
> from clang about the check being always true:
>
> drivers/hsi/controllers/omap_ssi_port.c:1121:12: error: address of array =
'ssi->port' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversi=
on]
>  1121 |         if (!ssi->port || !omap_ssi->port) {
>
> Remove it, as was done in the hsi core code.
>
> Fixes: e61af3ca8933 ("hsi: hsi_core: use kzalloc_flex")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
https://lore.kernel.org/lkml/20260321034117.3746-1-rosenp@gmail.com/

Whichever makes it in is fine with me.
> ---
>  drivers/hsi/controllers/omap_ssi_port.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hsi/controllers/omap_ssi_port.c b/drivers/hsi/contro=
llers/omap_ssi_port.c
> index 50dde968febe..73932d7257d3 100644
> --- a/drivers/hsi/controllers/omap_ssi_port.c
> +++ b/drivers/hsi/controllers/omap_ssi_port.c
> @@ -1118,7 +1118,7 @@ static int ssi_port_probe(struct platform_device *p=
d)
>
>         dev_dbg(&pd->dev, "init ssi port...\n");
>
> -       if (!ssi->port || !omap_ssi->port) {
> +       if (!omap_ssi->port) {
>                 dev_err(&pd->dev, "ssi controller not initialized!\n");
>                 err =3D -ENODEV;
>                 goto error;
> --
> 2.39.5
>

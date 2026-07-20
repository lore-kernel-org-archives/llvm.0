Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25F4396567
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 19:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784575800; cv=pass; b=iXHr2/iePJ4qWOaimZ7pu29zb9kEOW7xZ+rIgtRmZjMjeP4Xxl5f/ghLuMI2ncKgJh+G/Olt0fH112geQX+46QODwjZutGu2epgyZfd2ZjxX6DKOJozceXNWydL1GGqwTLG3mlaEmYf6B7fOdvYVYFRGtg5bpAyNrQOjm4cxluw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784575800; c=relaxed/simple;
	bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgQrInMHjEa/jBf7mgLm3IQgW3a2Ok3ohLO7oZZH+n6ngwaiqbmaJVmnwWZG5OklAGp7Ma/3bcxK5gNmwsIA4LRTDoVqTRMdrMM1Wnb7uCS9IuD1NigKTYo8BtbeyGC/Nw6f7SErhgeL250sW72CM/AFW9QvfRRSfj4JQly5urI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ghBupU0A; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ghBupU0A"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c10e86e52so948781cf.1
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 12:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784575797; cv=none;
        d=google.com; s=arc-20260327;
        b=dPkN27VRs6K2waQvwAb9tUe+Bh6IxJZc/Yne5J7y+78vwEeXh+nfewxuQrBzNRQKUT
         y7+JmxvHIYAUPKSH1nRaLr8xrVR56BN1jFEzeUWjkGpPlMIXnPR3d8EkGXogVjImnbTN
         +BIIM2ikFLPxcGtg+Von+8VWU2bVlU+7IqAtFFYmLAiQYsV1LuUQUzL3cYYiKilXrdtQ
         CHeOLvwEeiFKlSJZ7faR+o0g/i78a3Axg5t3JUV/+Fq6bwlBAV2/ILJxV9274Kjgfa4N
         QYIarHpeLw9B+QsL92Vlfv2KP7zzpkoiONZuYIGRbuJNfoSyr39ViayOh9s9v8s/Hm5p
         eRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=;
        fh=jt5XuFI8r2H+Y7EXH49ret6E/dTGwJOnfPbpR0pE9Rc=;
        b=DkjntjS20VpTecV5lJuO+nRF1Fwp5+SuyBl3fqjdJhgUtR325guCsuxTl6PXZE+0lN
         06kp9svHIRU++c38/tsM9gHCCp8nePWAebNTjK2/chYOcFcDpJcI+PIZg7qZ7PcVgqv2
         49Ih8MW0foJkuGW7ETrG2+hWy8OT1tudW5Dx04t6vsqZYF5FWOPcDVwS1f6hXYfV09pi
         CsWB5T8Fi29K1ecc9KpRwLfRQrpXync5EjBjcTPQQa61RHQIiXeG4cLsooH5ihvj7t3+
         VosSRSruS9GunUAdpwbEMuQosPmcN7zfYpSBR4LtL5ou9y2m4w0MpvhT4GMp8UcV92uD
         PjJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784575797; x=1785180597; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=;
        b=ghBupU0Adakl1RD7df0+F+z88lSmKXswkCJAahGHD5rFSUF9a4rMJ43VXFs2Bo5Dlc
         n+MdQPk/AvSJ+gAExLrvaXAAYQIIFt1WgVPIutv5jzMy9kVPinexATZMizDfYTOWxJ+w
         Y0Dl0r+DV1PpGMfaS9VtGtsRRYVsq0472WLKZx4MUDqYXt5oSsEPt5HTofyWaQGLW2Tb
         O96WZtoQskOG7qd2LwN1ONIYF547rM8U2ENgZTkKP79Jf2ToATONHvbfrUyrckZtP2ha
         SrVUYRJPs1w69VS/tXatWnrfmCxmdHVp2gBdnSuPEzpBiwBvP+AFKBjeLMLVUUgG49hh
         NwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784575797; x=1785180597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkD3jB2s3IIbN08+g0w0TygpA5tj0fOSjjBWkNKDgEk=;
        b=s8OAnNQ1iufY0hEummiP3/zaoEWxiLRupIaFFCIVbD5ghRl7JZfyUECHlAj+h51LDx
         rmfuSvyCyqsZN60w+AlzXLuJVIzrynviyCRfFQ3ceyl94L11unKuteM/XuUwACOdvvmO
         cH83IkEnNdySAW11zw2yIZ4aexl8x3qpidd9cY4RC234eqk7jqViy9XIiDrHy1+Pvf0e
         +JNShdWPOwl6W0UpjlX9wU2GU3w8IYb8qC4KvM7r95+f/x4BfO54qwNrEHST9UholqY+
         qjNfUha9Qr1r/xpOstvqHlDXVVRv0ih8tUH6WJngidy08GLo68ZahOTVnL2uqQ2f0TOO
         +zdw==
X-Forwarded-Encrypted: i=1; AHgh+RpMSGl6fLiVWtCtFZyMBreob6Wy4rQPjXQ719VrUNzV2ziZ0vuRumAUICwJuc23Qe6ot4bm@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7/MFoBCDb7GsqBeqoZH2UND4t2OjPAdO+DA5LqjJRg06e97VZ
	nn4BsasgVQvHNz3qkiTp59c9YeMWGlYTIOKuOWThVryR4wZxJjL4BX/WAYIBjJHvmkeIuiT9qrl
	yRaaWYOszbHMeh0Kv7goA9bJ4ga+hj7NCgqJCtUrl
X-Gm-Gg: AfdE7cnNq1bHkyPNGXsQTP+LUuh2VZAhZBQqAxjknISLt8+lgk91BW7+EMDidHIPT7F
	GaSDo9vrCBwTVcSdOPvgMdMuhIJPkcfxwfegRLr5Sg006INOiJgLGDTrYcmn51jtj2lNWEbvUet
	ZLjmYeD6ljs666XqUHnETtlxxIUgexQnA+56mSgMGc3ImJjROo1bEYw3mE5cPBA0olgO0/zFAyt
	RBWxCRWio82ILWH8CDptcLmk8jm6Nw/tCHdHhiFWcmcGPaXL4Q+L7GNIP0=
X-Received: by 2002:a05:622a:6d13:20b0:51c:7a90:a79a with SMTP id
 d75a77b69052e-526033764f4mr4774471cf.26.1784575796860; Mon, 20 Jul 2026
 12:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com>
In-Reply-To: <20260718111340.159896-1-linux@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 20 Jul 2026 12:29:20 -0700
X-Gm-Features: AUfX_mz0YGJIXTAqoc42mflq1D8eqRe1dNjHeR1gvxIC8uUY_rJ9mhzujQ94LHE
Message-ID: <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 4:14=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> Relocated suspend code in OCRAM lacks compiler-generated CFI type
> signatures. When CONFIG_CFI=3Dy is active, the indirect call to
> imx6_suspend_in_ocram_fn triggers a strict CFI violation panic.

Would it be possible to just copy the 4-byte CFI hash prefix to OCRAM
when relocating the function? If not, the __nocfi approach seems
reasonable to me.

Sami

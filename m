Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805CA198A11
	for <llvm@lists.linux.dev>; Tue, 13 May 2025 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173162; cv=none; b=ByJZb49ZUq0ruHrIJnkLTqwHX7RJDKYxBUFWXjdhqavO6KKIwFy+HfKfrKVBGItcuGlo5EtJ5lwNSexMcQLLHiE4NxKYOtrRHF7UpNaF6lUq5miEkKPL3dZgqv/lVdBVubgO+v2Nh6WyvFKFa5DzDHcWJb7SHOo6/Qzp+ucPNgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173162; c=relaxed/simple;
	bh=LK3lAuBjsNAIlEIkMYgMLyfpdUyaTRXeTgNgmUeBqIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cy6RNB8HxAUyj77c2DcT02pvoKJrcG88dPQqgBWWG0usoKjCwI92a7aw1EBsVigFBN/pxJ2AvDazYXtP4XkYsVvKHtBtqR9ufx1EH4FwexlKJmqzzT5e+8wbJCsrKHMhHoK5FqQs3BEVqCZs/td284oQ583a5gljI0YSU0LZrug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OU5H+stD; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OU5H+stD"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso64217861fa.3
        for <llvm@lists.linux.dev>; Tue, 13 May 2025 14:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747173158; x=1747777958; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMrFM87rAmuG/UnGteKviZfWZXINuxFQCsV17IJbRWA=;
        b=OU5H+stDeVJdyeak0KCZ/DElpAhVIMoLvOWiPdP6GFIiPGxw4zo0VW4vV3KE6O/qDf
         npygrz4A8/6tdBiw8kdqyCCOJCF0ERyYSAzE4tVOd8W+zraPKyJiaTatGGDBM87wNKB7
         35mtsZT26u65GkTiLnQXwcaDLyjkJcxvnQ+zzYRQEVldH5zE3dYsDkGlWgYLmA3QUZ16
         ivAEj5g/ibs1KwLXf+tKmiLCJrUNNktQmDScVs+tGjutmtdquLayLuquXqFQmlfRZdNk
         OUgpUs7bi5QjByX1YsCoMT58HWrOp23mlzsVitL/uZdNa6ZTVLGh7h/DUT9fWX7pxJus
         Qd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173158; x=1747777958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMrFM87rAmuG/UnGteKviZfWZXINuxFQCsV17IJbRWA=;
        b=nRYWTjrmDb8CJhGIpA+22A6TvcsomDAqQvVhQejAGLXQevj+UblTCu9+AsEqEEQmn5
         Fl+ncUfWui3gNGX6/3YgdwT0g8gO4+5VKPnTMtEXu6alS0amRItUdgyho5Elwe5A5n6U
         J4sR4E+fORBnZ/4FPfeXi/rSTLy4z2Q4PNY+VePqLQfvUBlzTFMDIZvfXVlLrox8I1US
         YqM2ynkfTtz2INnxzQIMUHP+XiizCY5tefS08UBTVaG0ELaACX0c1KBb1EupMgRX5LhZ
         sn3Y4efhaiOaU7Do7wZDVEcPkCd1BIM/5PTWuleXFsjD8FbgpcZMIAQHXVz52Q50oAcw
         mhuw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Ac2n0YbJawGr7Ryg75QmHSNfYamHyZ7zbhQgw7ZAS9V0MQcoL0t6qd2wC+75xqNal0TJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr5lwNwCLJRob9UL/ZOMuP+Lw1MZVoUicYfRDb5m5n06CQ2b+C
	z8gq4YtONBTMtTbuOb9G1JKqThiZoamJYvfqt+8hRCH9mcTGZzPAm0CGuRuTUp/FB7S1A8dAuIo
	NFGy227VpEtAnCg5Oy2wEZTuyeeA+ba6t59zXUw==
X-Gm-Gg: ASbGncvJ2xOgo3w/9KTZCK6y/3wgkPGSb4ep65inIQ4jHe4Zu7FUiyU3YMW//VWbKoB
	8DgGouyao/LCft+Bl3sCWDxjPf2lKVjYbcP+6LWn603YBzbt4pPpRz6jxRP4271sM+57pzabCHt
	ecpmzmsrX420f/BYCG87B+FKzUqO+vl8oK
X-Google-Smtp-Source: AGHT+IHdxGQUgnLEP34p77bnggpFFcybep3eX0SRsxItjT7bGVq1s7hLEPXvIi67p9M416/+sOFwds+OUhyOtC4jV3I=
X-Received: by 2002:a2e:a545:0:b0:30b:cceb:1e71 with SMTP id
 38308e7fff4ca-327ed0d64b0mr3515771fa.9.1747173158581; Tue, 13 May 2025
 14:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 23:52:27 +0200
X-Gm-Features: AX0GCFuybBjzXgbZgpkhrGy02_JvRvbutbRLwY2ZvnnqoSf9SNzjLph5-OzDFPA
Message-ID: <CACRpkdYwTcHh5LZ7j94LbGYv7BnTCtrJO33j17YbP6s_s3TeVg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 5:01=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> aml_pctl_find_group_by_name() is not used anywhere, as reported by W=3D1
> clang build:
>
>   pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group=
_by_name' [-Werror,-Wunused-function]
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij

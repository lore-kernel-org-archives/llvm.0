Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0EC23717F
	for <llvm@lists.linux.dev>; Fri,  9 May 2025 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815317; cv=none; b=Ra0EpZqbRHlMoyaNsJCR1B4ibPw3ccipiMbgDffoisPgwVavrAAgFp5bLIyHqMN6asQrnJs4UYfsO/az4VIqXrIvXSHCXJHX6eUVbqs7yABTrsC6ee3v7pJmI+gIZkUsVUAkviBEUk4dHibzChlKSxGl9xxTsSu6IjWvVIjeeiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815317; c=relaxed/simple;
	bh=10fWKQkNnHsqIbf/pw3ZTsZtcdW11Mi85qpJNxHdr28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfBGKGNd8s302tXyk3PHyaXhAO2qtJbQxa/vQOJyNSG/s89sTbICUVYWRBBLJkBXkDNPG3VdS3Qh0IlnHO0jzzt85G5Vquq3WsdTDSmmzJDyBYRLUxXvIaDGsF3U/V93nEx5B8LqThoCtCEdBxooI67VDvXYLuIM2ZhXboISfV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=d8XBYHmL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="d8XBYHmL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e033a3a07so27254175ad.0
        for <llvm@lists.linux.dev>; Fri, 09 May 2025 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746815315; x=1747420115; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVjmITvg5xwQUhBH3cPWu+1Rci6sKZeIVD+X8Tz7B6Y=;
        b=d8XBYHmLDHznNpBP0HzgH5Nz53Lei6wbmCzl49PCCS2AZ4b2cs+uDyfp7+UunrpoJ0
         lYgP9PR6Xiqz1b57/NdBqLezV+iC+5ApwmIwwAc4pzNg3sh7CIiklb2V7Dt9mcPKxW4B
         PCxYqM99wmU/RGtn/+HPbt/Efl7ecrob8o3dxq3Tn0fXZumtmEpismJyft5Mj30id7hm
         KNNhmknunzOyKpShMlWZDcZ3pn4dIBMqi+wswusuwhtOmhwuLmTrwB41gqEpd8JCdNhg
         eJ63GdPwd93H2xwecNgoWQ+zDRozhSEgoBjvLjiqH2n2FLhx8LglP2tPlCwXucmo9EWJ
         SJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815315; x=1747420115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVjmITvg5xwQUhBH3cPWu+1Rci6sKZeIVD+X8Tz7B6Y=;
        b=QRisWpgSsjYyCSKK9o98HwlUonVF+C86n4ioyg0rhIpJNDQucITa8eu0nAK4P/uigV
         Et/561qT0uurBejmaRpB9CPlwJ+dJcH5fmctuNGIPv4e/g0ffyAgnX9V7J6CvfAuO58l
         s/yZAUC328CPa4xrTxLBb79A+30ee/Ny4dtN0VGs9C9mrn7X+fBEUCZmVIhqoIc8Stes
         bssBnKOWcQurhNJoJ89xu+2nIWYVJh3x5EqzcwOCFWpz+cb3st/Oon0bviaNJk8ZPG2T
         S9NpCPcIDvDeaLHuDgzhf4D/nzbSTBYmFiSuCcOO7PvyXz1Pb8kRvU2bpFrfMsnWN+Rn
         nSEg==
X-Forwarded-Encrypted: i=1; AJvYcCUqZDCxHgTGp3aDa+P+NVsdZpmpGk26qNgFbi+sb9Xoj3qjIbm2vd8M73CFMPFgBACP0Wbr@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3PaPvB4RY2XmlBIWFzvFe+XMaikRJiHdZA8QxaXvtWdxOszV2
	qHqq6MvGXY1E6LuxfZ64mEqCX4jobnSoaa+kywTtdiQQ1qWCJKX/5Q0cCeUALriVUBjKnwPtAlf
	BqQm3JWS8G226xP+3wGnnpcQxHpw=
X-Gm-Gg: ASbGnctFwcF9FIS9evI1RM+PLlrP1/pjUYqhEIB5/l5cgTJ0cdrN9DEbZp/xlP/y5YY
	n76yJE8mNXrrRr7Vv0sGuaDG+J5pFbdbyAzEF5/fDX/bnfSAFs+Ozh+QgNCd8b7Zn9zPgemb/CO
	pHl2IE8QN5sY8O9Rof27ey5CEk5Bj3f9SV5OV7HS1lrLhZh9T96FVRwTCkuSbnnI9nJw==
X-Google-Smtp-Source: AGHT+IEwd7AiDoJxpDhyTHw6FTDd796IjH1JzgkpmVh4628MtJYKSWng6hqIPivs5wHI5s0eCiBfNcWPOBCx0dc2UHI=
X-Received: by 2002:a17:902:f70a:b0:225:abd2:5e39 with SMTP id
 d9443c01a7336-22fc8c8eac0mr65654585ad.30.1746815315465; Fri, 09 May 2025
 11:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 May 2025 20:28:24 +0200
X-Gm-Features: AX0GCFt7pQHVyrf4n1xvCNGZ9D5D94k38mJZKPZaIgxrW2CstAdBDU6m2wUQANg
Message-ID: <CAFBinCDt1jDv=jhDoW3UtBUL8BuLL8PpJPKjpC1Sf5fifnw+6g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 5:01=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> aml_pctl_find_group_by_name() is not used anywhere, as reported by W=3D1
> clang build:
>
>   pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group=
_by_name' [-Werror,-Wunused-function]
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

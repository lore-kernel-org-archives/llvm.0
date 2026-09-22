Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35391550DD3
	for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083600; cv=pass; b=twVwvV6RNyQS4X8PG+meLkzHkBqLOE0gJtTvprw4Z4NeUWaIJ8TewAOH3gy+3+O+EDBxgYYangVv0ZK5oS6+GZHSVKMiTxamvq/iWqIKkM75JZ32K8FjqfBgnG0KKgNlDqhWBlbWetLCRFAK+tKNFW4OQUGAFzn0EQKFOvwQOn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083600; c=relaxed/simple;
	bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/YLQ0fyx5U7RxJpSTRdH98qrgX/gAMbSY0eK5GAhHUUxFh6/6Etc2pcY+3W9zy4KZApRV844W7K8n0IrFCFtA4I3kvLaxLqF57FQB3TTS2eqlrwvflfGn58Vcd7I7E6yp++MavrdYt+X3av8N/+7Cf4Ej6v0bFw9/Uih1uKQOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjR6WHai; arc=pass smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjR6WHai"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c29440ee0e7so280769366b.0
        for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 06:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790083596; cv=none;
        d=google.com; s=arc-20260327;
        b=s5UjE3MSAklcsn5KBLricdgEyh+iUE1R0jr+tyqdghhB1XXbGE5P7TF3WhMI2Hl/Kr
         QQoTRXImZmkY4lPHB2ViQE1+QQzn/9p0oR+n1IbhpGXXxrzpL9nBOBSuVipdKSGmpVRY
         xv5QnkgKMdcpqSJj11S7xO0hYuQhfyQQS1aXi9ho3RvkVmASg8I+fDxPuTa3LfRClPVg
         6WpSZUKUgsSv/nViZCSUMDQQgSHRiL6dr7P5O2e91tgJIK99ubcf/M1QtblSrHSbK9so
         4rjf0fIstn9XryBrleNnau41IyuySiF1GD/fPyAs718VaUuChIDy45uMfNkj7NwuwiGv
         CnmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        fh=LeYDR+wrkoqdZhwev+l1bZsNOe9PTwdZlXsg8RQmJBY=;
        b=LskLVGjiNq3VbDpVabv7rVjBWrGzxPifRnJUSLNWAxbmmfVhqUvq0u49jY0AzlwbQJ
         LyZVCccgpGhWjEgTZrWhOCqqg/rNCpZDhnmD0hB5enerpzMLvL/lB2t7LAqOguDsG4XM
         8w2xJIgL30l/vPR1+PnJvysio5drnWD86m4NTQ1LCAs2Haip2JbAyA7o+1iZlBuiaQUS
         FTyS191wDiQjHXOjqROXE2Nj39P631AN6PcZHBep7bWWECPZINDg7/r2zaDz6KTELWY/
         /7xgApgOItAJaMOVGFXYdAzR5A8A1CjsG7N2Knd0VZ0PjBYCyPD4Gg/6HW3eka+kGS0v
         Zlwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083596; x=1790688396; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        b=pjR6WHaiMjwOuyVYNERY53EWnjf4/BLP71N7w2Zw1e7oAOwoOnj77N5zKR2SiO1qIc
         xm+O9pWqO+aTADG9THQ1d6YFITeZWV5v3Aw9xxSuXSAl0sHarIi6hCwSYME26ybP8b5d
         Ru0OpLxZXS5b21RSLjhS6UgLAUvCorpM5Okj3NQIU3NFJJan/voH6yb5k5IoBXICcDFT
         6tEIdZc7fkPlw18mLIJr+vn1YJwgkJBNqVDibG1En/Of6QJocTUge89iIARNdKmBnIXw
         nzn5vpbB8Mhn+KaWKhqTWgEFWb0OP1tpz/UIy9KUCDO/zfXMXTHr/82O1TVLDH1MkR/4
         tB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083596; x=1790688396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        b=n7DFv/6yqZv+rqzz5F7sbYbFFMEmN64+7r716dnYuYlLDOzmgn3DdtsiAwPqihp9xj
         9KK7Cvu8IUQiTYBB2EetzC7JsTpab4s3DiX4d1ac11skKfjNJDAxZCXaO2MypSWDFXA1
         pD1RnJoHUezfJuN9pXIKZIH0fGyzmwVIl8sUbkS9AJ5naasuZH/hPpAcrhej89OvXcJ5
         iYZtMGKLx/H7AmnXIcC4Qklz5A2wGYS5vXCitWaL2xCH2iJnUAhttHus5E7THtaQ7HYE
         mPvPp37Xu9WPNHisxY4N2Oxxab4A9vKgNCbfL6IfSBSCYLnuA80vHG1hyXpnx6W7rfqY
         7HNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwimVgJ+MXh/X7pbMLq1XLLay7qSQOkFseW7f0h5HdaalcoQMRR6d8dMloXfktt42mho8+l@lists.linux.dev
X-Gm-Message-State: AFuF++kJZmXEZFQzWgwW43dl//LL2nqixBj8YlpaQNU7gk/XBtGuX67P
	cC6rJXnbKlviNSbdUUfAcajO9lnEZao6jY0CJMHf4SmvUTw43ZcwTqbgWwFzIO2vgi170cER7NK
	fwfWURsdw7j4C9ficB+z8cB3jTVfBOkE=
X-Gm-Gg: AYBFou1xOQWY+zZvrqhLQvVJ4x7yB9o1faLP7xdUNA2EXNxQqI7ZCfLVvKk8kCj+sih
	03sKgUrplp2hYnhceLoS6lIAImxPm2TaAfknFfpPqdkzNqoG+JJQC26ca7uuvj1fRA3UvFtfBK2
	0qW7tywQLW8LPOhd5dvCs7WxB90a0Yf3bp6vPQiregf8y2wvjQNLX9gjOcdxLOViesxFTXCjYbG
	RH60wZk0fpcFsuwa3oHqTiMLqtVoEv5fpt919bWugzCQAG1l8zuv7RBvVFGOBpWcC0ausafMg2C
	SB8LUu3VjqI0zqDxQfu6guU/doCiOIsy9yGrjZnLcEW7Bk4FQ8Rfc41H8g==
X-Received: by 2002:a17:907:962a:b0:c25:6c9a:88bc with SMTP id
 a640c23a62f3a-c2a156ed781mr1064393666b.19.1790083595818; Tue, 22 Sep 2026
 06:26:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com> <033fc935-c37a-4b0f-8b79-68248e45da8f@bootlin.com>
In-Reply-To: <033fc935-c37a-4b0f-8b79-68248e45da8f@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 22 Sep 2026 21:26:23 +0800
X-Gm-Features: AcwNN1Ur2tt8b16s6pIVEQsDoiyvx1gOYWr_ba3DyTwWp74e1eP8TDNhMjUzs84
Message-ID: <CALj3r0gyfggFP-T+yXM2P=ooyQMk0AUfnpxtArk5ioU+wMNrxw@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=8822=E6=97=A5=E5=91=A8=E4=BA=8C 20:50=E5=86=99=E9=81=93=EF=BC=9A
>
> I'm attending a Rust training until thursday, I'll see if I can squeeze i=
n some
> time to re-test on mvpp2 :(
>
> There're a few series pending for rockchip and S32 on stmmac that deal wi=
th
> PCS support and their PCS handle. It would be nice to have some stmmac gl=
ue
> maintainers that are using complex PCS to help with maintainance or at le=
ast
> testing, maybe Coia can help with the tests ?
>
> Maxime

Hi Maxime,

Thanks for thinking of me. I should be upfront about where I am though.

My focus this cycle is landing the RK3568 XPCS glue before the next
merge window so it lands in the next LTS, and so downstreams like
OpenWrt and ImmortalWrt don't have to carry a backport.

On testing Christian's series: my current glue goes from
ethernet-pcs-mii@N up to the XPCS platform device and hands the virtual
MDIO bus to xpcs_create_mdiodev(). Christian's series changes how the
PCS is looked up, so testing it now would mean restructuring the
Rockchip glue and rewriting the binding, and I can't fit that into this
cycle on top of the initial merge.

Once my glue is in and the lookup story has settled, I'll be glad to
rebase and test =E2=80=94 and convert to xlate if that turns out to be the
direction. I'd like to use xlate long-term, the timing just doesn't
work for this window.

On maintenance: I'm a student and fairly new to this, so I can't take
on the PCS subsystem as a whole. What I can commit to is helping where
I have the bandwidth: testing when I can, and sharing some of the load
on the XPCS glue layer (pcs-xpcs-plat and the platform glue drivers),
plus a bit of pcs-xpcs work. If there are stmmac glue maintainers who
can help cover the rest, that would be very welcome.

Thanks,
Coia

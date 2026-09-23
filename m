Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A231432B126
	for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152327; cv=pass; b=ucizLmiOgbiGAaP3/5RSm8Og2pzKVe6VbM7goT2AvYNpImfgog+YmKCp6LQAI6YmzBBbJNJMjJ8jhJ2I4/P9g463Uoxfw/0gzNV8FPyjcG9eakUM5AKASRLMVLwo4MjeF8mUyA8hFB2NRCsFVSEIg2a6Q/9g9SoVROcSZ5Cocdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152327; c=relaxed/simple;
	bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMaWIqIbpR0Sm+PuL6Lclv5eBdei09khOrX+EkOxWBdqK7JMbOB9BPZgdEOxSmyE5+MEHq7LQ5wtH16re3jhkgkz8ns4yUvOiG1fuOXwHZ1XvhdS+PASTaHwVmnPngZyM90vUMu1qbQbmzkQM7LMNOEKb/OZUUxGKlPfVmE0GJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vs4iyLwt; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vs4iyLwt"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530fa0716f6so8665581cf.3
        for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 01:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790152321; cv=none;
        d=google.com; s=arc-20260327;
        b=nG+RfKJ3+WAbYhVUnfvh/7y9o0NAV2q5GHOhjsT2tSzRa9qCAZffCv5F6aOGi3utne
         LeBa3UewPfBFov/Z1TFayKaCxHGD3RwVBjlYjlTq1xlHkffC5zMOOceY6qD/zLSxELHl
         7wphZtleva3qRHreb+Y8Tt+T+2D47ElEF58Y62+34n+3LBelPnYCVyHtz4KNdNilpimr
         zl/0x7SCnDX1Yw66ZmoJ6dhzUqR21osCA09vLhvlK2Neo9703ZbbIPneHQfDls65FMo6
         YDvHOLP9fHItzkitWxGvZ/Y9/HtYgLo9mQnfbySFX5ExmssOxw1tTkyaR8er/RUvg7N7
         GOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        fh=r6GTtCbTeQ4AqY3gez38ioNF6IXzWNYmicv0sFry1IU=;
        b=K1DN85anqw5fjxXhtZQ5JRJF9dPUGl7FbittXPkEeOEzHaOQH4JoJuiv2UNjcKzy7C
         1IWmn/Fxa+i5xMvQuN8HwwUyyKuZ/ynuPJEwsJF9Lx/ix3t04pr5tFOGkLXzB6gOLKVw
         8fwrqgG92u0snHxaB6jWAWmnkvYNJiCAaSAAaVnWcRVlTTcLVsPbPWsBlpubl8N/EpxM
         I/dg1BczMSCb+I6r+CtYNewpyk/SZdU6x82KFCsYO3J76zMsgBvpI2ruTirmxkPljYXT
         kZEiX6mS8hr2BLbpWJT0u4f7VSxig8xu5xZgyHyjE/+aijm6rFG0Rpq+3vX+9xl2zFIn
         loxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152321; x=1790757121; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=Vs4iyLwtKSktibH2SbLUuSdCHl2kZTmfNHM+Gh6Saj7s171GxFhOxKMN323RbhcKps
         eQyVZLrkjYBRwLbxNkZupUWzCSEVMbo6hjgiAEkk0jIrQvNOKzpPMZj9D8HSiN2xfpxs
         OraBrAA+SqC5kh0GvPA5pWfpy7rtsfR2xWT/EGwnHyV6AkPMDEAIERO+1yFls/NBd4ys
         /qXCpVbNZLZhiIvEJJXN7gjN36b7+x6jLVMoRNBOiktuKkDtujRIFJvcwufQg7gXuv2x
         3b6S+KdjvsxRVVVXkOD5OAb3FbuLMEdKE2GwREtzu4847H0MTWeoiECKr86M2rVXW4wW
         Iklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152321; x=1790757121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=ibl35sWkHAMLBSSVrd0x0fTxE9jkuAimWkxmhOj10MunilP+Xg0tT3JW8Sd0qvOMTS
         K+HhWUtrteoHYT4XJNi3Wrd8SyzBrKOPqFZuu320JSJHlGy1JwYbLVJIDM1h3MYOD07I
         ere21I1gqlBHdS4Zv4AUX+xTnUdtUcCJJ5yW5hJfK+IB5va1kXZEMvZeGFCN2cOz3dwv
         URfPvgCjx7Wb/PJfiCUnnFNMgz51HWhyQsz3y8DoXNEbc49bl77JKPG1wfkvEFdgzNqG
         3wdO1wPO/+wO69CkbbTOm1DCykdZFkFUwmVXs3wlRYYL3ly60FRJgt2/cNuGjzd7iu3n
         Pr/g==
X-Forwarded-Encrypted: i=1; AKwUvByn6yiM2n5aPbLa0VJozvj6CLkpwyfodhXJYdUjf1hKLyapKZ3MQapoZ2CojToWgFyG0tH+@lists.linux.dev
X-Gm-Message-State: AFuF++ncRHl9gnREThlZG+Vk+aw1RnPZApVPwopus0fX0h2Kbf8oCp7y
	ls5j593XBQXYv9tMJgIvFTnZqnk1l9xdl34cdOm5GVPgeJimXVeaZjNuvYwuli/mRcmn2GjIoae
	9mZyZ+K5/5Y2jDENgv2e82WsgZuRIRWQ=
X-Gm-Gg: AYBFou0JjgdvR4042yRxAoH+y+PGksPEK5c1IuNmLIbmtKUnOxc9CtmgQ15b3OisCqB
	MwDlHfbCsI4DhleSnAN97Yy9v9Z12ttcoFbaN/cgPZ0lpWE/8v89iojOdAH/IPurgIM402zVCqO
	sbyd+LsnuptD2EQvHR+6gw4m/9G/+k/f663V6Dt2ymQYr/xJ7RS0HGnaW/HSeXDvn9ahwBetnOO
	1lw7IBRFOzBVWYX+nTPWYfiMyhX08/Z8Zodjdl6CySqb8fmdtuRTCS/1ZGIVYFKuS1y643lfYlV
	KQL8HvJX1vgXBO9a2stFrKgf1GI7e39pl8cnOjrAqDmHVjW/rH0gHtjtgt9ytyjq
X-Received: by 2002:a05:620a:6017:b0:93a:2d15:f84 with SMTP id
 af79cd13be357-93c2511c2b1mr290767285a.33.1790152321118; Wed, 23 Sep 2026
 01:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com> <20260922172514.7feb6e7c@kernel.org>
In-Reply-To: <20260922172514.7feb6e7c@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 23 Sep 2026 10:31:49 +0200
X-Gm-Features: AclHuK8jGec2XT5CWPXvYVvV1bFvl8hmA75zakqIakpr84shp0cAZGnoi6_G1Gs
Message-ID: <CA+_ehUyFKZzd0uP4akgZxaLLJTwcvGGKz5ppCYsB++fn92Dn9w@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
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

Il giorno mer 23 set 2026 alle ore 02:25 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Tue, 22 Sep 2026 12:12:56 +0200 Christian Marangi (Ansuel) wrote:
> > The remark on the fwnode patch are invalid. The driver is expected
> > to return those error as probe defer is not supported.
> > (a notifier and late attach/detach is used to align to phylink logic)
> >
> > For the specific Airoha PCS driver it's really speculation from the AI
> > but HW doesn't work as described by AI.
> >
> > The only real comment that is valid is about the alternative way
> > to give supported interface with the .get_capabilites OP.
> >
> > This is currently not supported as there isn't any user and it will
> > be implemented as soon as there will be one. It's really to limit
> > the patch delta of this change and to progress further.
> >
> > Maybe FIXME might be suitable?
>
> FWIW no preference here, I defer to the human reviewer.
> We can treat the AI review as a hint if human reviewer thinks the code
> is fine as is.

Soo should I send v17 to fix AI that failed review?
I think I didn't got this detail.

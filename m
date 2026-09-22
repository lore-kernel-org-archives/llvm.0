Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284465304BD
	for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071992; cv=pass; b=qmB5YtR4X2FT+5CgH7YVpJm1tB3/XFDzqpj98pB7QvpjvZOMDXcZCqRQjvUjrEnF87exalMRLFiP06UAfJ6ji7jaIc6+WEAp7f0Bz7tq7CFOBVZWUdOkrs19o1igr63WjB9b2K99hFBbDcaz+Wf7etkTTant2dRsN0Wu/eZVnuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071992; c=relaxed/simple;
	bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBb37jbVhl7jOmHhjZFE8Onhzm9Pspa3QWtX0a5jVf28/86YhK2RxtRWpu1CF2t9PeK4KBD/uh2sYz0iHlQU2rrBmRf7nBuWpk+/hXz5xBksrhXjnlyNez/unu0CiWs0Mp/l1ilIGabfBjsDJC7drfxL/gv/zo/XeMglNUrGuL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBBOvu/q; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBBOvu/q"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c985f055b9so861809e0c.0
        for <llvm@lists.linux.dev>; Tue, 22 Sep 2026 03:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790071989; cv=none;
        d=google.com; s=arc-20260327;
        b=aq2/z0odLOWGcn0J0ZiIEkJnppfQv+++lItN6VlHW/Ko9mMFSNRcg9kmaShRgAh/PO
         m3eGkFmFBCI+X5UO8uX3AaTCOWv+U7AzjrUjMnV6wI3mExsTPuIT5s/FrpoZR9SYdYu2
         WnXwVRwWD8GCo+EizUwggjcaUPArzYye5VshAZaYAcA2r3WnZLX5SigbRK98QuQj0Z97
         QI+zQtOuc6RDdOM8vvk7GVD5cGG918v9SZkyGoP+m6CRr6xyD3X+s+d57odzF6rcYUu6
         O9fmqTIYcEKDrj2wasQXEmv00AhVDbNw0kh3aJzKfOIRy5qmZQbZ4QxpES/wtaI7zTfQ
         wWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        fh=mwrBtINp0c2AZ/B5KhMymquHa2j88fHXRiKPG+6idgo=;
        b=Jnb4z6fGTCPW/3gVf5gC1/vSDrKvXHGEi/qQoK8O+2I44n5lcWlI/03j99olReflfq
         SBfrYctNGqYigHZzNG2gf73JI4RX500kUZX/+YpLqPi8FQVUXA36RtwCEVMzuBTh7/Pu
         9HJGCDgBzsecqkdN5rglP5KoFYwP3xsM7VZi9oX9F1aOKNPj10zOvilhC/KoeX5eoJcu
         wAciTGEu0k+TjZcnHx+Gzr20u+M8uqWUYh/y/zcHpXuOOWbuD1vVFgl2ko0MoyGwn9tA
         VtrHG7h/E3L8szI/SOuUDlQZcQOAyV55eEXDJn2Hc5FjZ9IFBPycGA/FfBSUsF0/4Y/J
         MCRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071989; x=1790676789; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=eBBOvu/qBNrQktUxvEnr7rNcIiFiTXMC/j0DWuShhF9rFlrZtpjn+SU0d+elttlvjG
         l8eCr5vDL/cxyRzVdsdqIPBfEtOHfbytcz13lIO60WLW1rmESrG/KLi5Ikb95K9Zp1CM
         duopueOf3DktY2DzLL21WIJPKZg/qKjcBQnBGBd/8DuZlG0UZs5UNjxodsOmdcEgn0Pw
         pW3v/FNS1nBgfIxtMzXbXI4AZwTcNDxIlK1YIlj7fI+t/0/3ILnwuhRHkBU/qpELrYTb
         O47yL615mAwaRckZwb85TJkHC/ILj01iEyorA9fncV3eWvMwlsvEwnxgVIjqRArbxN02
         azdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071989; x=1790676789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=R0doYWlTwutZ/hfKtvkKnhvdAYPPuHg9UaFZiGUpPdQ7LJ5I7Q+ZThpX2UaldXsTw1
         XYfLOqAwMf7fe8rG8UOst0LrTP0MoVv82XBJUwuTjGTw/whCQaLICir+BXQMYa69/9oS
         evXF+f9hgKvEjKI8zU0kSY89R2LeMU7b5ZfEIfZvOI/eK5OVbYE8f2+4VOa8y4VgbqGZ
         XClIpRhEw0J0zGVo8iZAtoir7YzZGaX+w7WnWfzAtHUvLwckMturt2tvAn9fF2s/I5Bd
         jxef0H8N00OrwtBhaRZ28G5lV465/PCoCBufmWZvpIPEHNSTSMrOMuIZorOO2+xa17lI
         n31Q==
X-Forwarded-Encrypted: i=1; AKwUvBw+iMcgjTzV+p9LGDGboP8kB4y0C4cnYlqtaZhmeoXsvSAGG/yLe/Nv3KqHyQKoyeaQK2HS@lists.linux.dev
X-Gm-Message-State: AFuF++mUSPtXWDtJUUmp5H8OxeOnhPYfFUBmV042uce2iJWYW/XkdXdU
	5JAOypXEc/Xr19uYH9Ql3h8itqNRzzPwtfDaqLGkHuONwZiARxBZpylweG734rHAZHwIWSV76/C
	0tTZ/0kU18x71hqaH7XO3NZ9aP9g/xtQ=
X-Gm-Gg: AYBFou2vepvRJHcyZk0I3UmDIwcmZG5Ua4fp3Os2cp2OQAIk+6o2WHTW6s1K2NdjAr3
	lpOZWU+ufbCnbsO0NHcpTb8+7XopwvPCV8MiOBjQl6D6sOMy5EFZb8iFRez2ltWu514xM9XRiX/
	Q4ASTaMBuHNHGTTcfifnUn/iG/sRtqwr8KLIq9WMT//wZoFv2CLyAgNuBrHu4xWvdNBUm84CY1G
	0oZH1IYKusDHFFHZzzbfXaWGrbwfwzTeezuVZ9B3cykJgIoJjhUPsZyF7jXbcoPYoiPPVVvqnoa
	8vnueMn7D76qONzUJa7AjrsDXIh0m/HnvBZmkct1303HmAi1O1gkkw==
X-Received: by 2002:a05:6122:2b8a:b0:5c9:9f03:cb07 with SMTP id
 71dfb90a1353d-5c9e343983fmr1483343e0c.2.1790071988975; Tue, 22 Sep 2026
 03:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
In-Reply-To: <20260921135933.7e8857ba@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 22 Sep 2026 12:12:56 +0200
X-Gm-Features: AcwNN1XO-IQtQQeBFy8m7z0RqgCFyAn_vcQf_nLSSDZxar5hmkBbTIMafTrhl4Q
Message-ID: <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
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

Il giorno lun 21 set 2026 alle ore 22:59 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Thu, 17 Sep 2026 01:51:26 +0200 Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> >
> > At times there were 2 different implementation (this and the one
> > from Sean) but Sean agreed that this can be picked and used in favor
> > of his implementation as long as his case with race condition is
> > correctly handled.
>
> Looks like the review for one of the patches failed so it won't be
> emailed out:
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260916235200.20712-2-ansuelsmth@gmail.com
>
> Are all of the issues invalid?

Only one is relevant, but expected.

The remark on the fwnode patch are invalid. The driver is expected
to return those error as probe defer is not supported.
(a notifier and late attach/detach is used to align to phylink logic)

For the specific Airoha PCS driver it's really speculation from the AI
but HW doesn't work as described by AI.

The only real comment that is valid is about the alternative way
to give supported interface with the .get_capabilites OP.

This is currently not supported as there isn't any user and it will
be implemented as soon as there will be one. It's really to limit
the patch delta of this change and to progress further.

Maybe FIXME might be suitable?

>
> Once the AI review is cleared, some human will have to review this
> and vouch for you as a maintainer. Better still be your co-maintainer.

I think some revision ago there was Andrew that reviewed some code.
Anyway thank a lot for checking this once in a while, I feel it's a pretty
important change but I understand it's complex to handle as it does
introduce a whole new subsystem.

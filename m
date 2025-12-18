Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CA726E6F0
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766089610; cv=none; b=Fv/yrtNcUVEN1QtSTcWupd/+ulgAubWsoTGLEs+DhT2hzQOc6V58j13uARi7+yUfuijKMZoHumqYtcxU4hG+C5b4d3N2r8SKomYkjwvRGKv0aLhdxiw2lPJFcnMTq+WKUmfwZLXWWpUryCY636OK8BdB0/2TnuYtcak+PLG69b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766089610; c=relaxed/simple;
	bh=v5r1UHjsCj16c8Aasp3mvbgbCLuKmbAvogVL8SAdBfo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=US/xMmfBV0HNH5tD26GOf7kUm6i0fOURMPM0gkTKdPTP/Sd2P00iBmn5onl6d0n8iEWgp9RvTcSHYoQxuc65ENB7ROeabVFzEcjVfJZREy+k1VnjEXIEO91XolRgePjxxQq4vEpRWbHXrz0Lw1MMz6iGHxU25Djh8mGqmNfoJ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBJHeBU2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBJHeBU2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so6361805e9.1
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 12:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089607; x=1766694407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgQxtQzmfa6dtQc2HKAnCJeJmQcolaeO4Fk6tR2yJow=;
        b=OBJHeBU2UpndYGLAUsxBu8z9A3wTTy9ogw/nUjdjTGJyt6L+Uxw8OQBeHPb5JVPOqW
         NXLGBlOrtzUiaFfPuksCMhSbJWgLpUiYlhpUzDoAFfmuF0rFFozxA3Ksuv+Cafr+n4Qj
         wSdYQoQetqzOabRDl9ZTrADeDsBpE6UY/yekXfrH5g/ksobniFjpH/NVGR+1nCFy4pNr
         sTFnJiGACG/FvBrXHOXT7eiUPh4pIaCNS5NXL7FhriSw1WWm9ONZhK4XJBjPrP6sAYZA
         t0Sus2Rzku+Q7nyDaBaPXxiFC51djaK1jBTePm3gA09Y1HZ6g0NU5Gjn+4iri0ixGJ8x
         XAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089607; x=1766694407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vgQxtQzmfa6dtQc2HKAnCJeJmQcolaeO4Fk6tR2yJow=;
        b=GdFyreehl8+i63cp/RXlEOJhXEL3CMRICVJQ2gpuGPCBUBK8Lp3eg+OFoV8RbTZrxk
         LCwO/kmN2R/qepvHCbn4z0bjdVcc9WI3jpa49LBgi4jBXT60FXAA4g0LH7kpO8TjJUvZ
         RjFEb6ERvnGo47QdZqQZYiW1YGqx6K/KRRx87oLqxlVQdtue9XpACYVtThzXUpV5Hhzk
         dl5UtGIAvLfgdCz+UbHzjk91XaHe2nSPHhUickKJFTKguFRYWG9sjUf2iyMwMeT0sn0Q
         rjmxXLcElqXltbz2mn7zSfg+mephENbpqh3qx2fbiGsbxHiBl/DxPRIvF0OQqEoDB7ja
         Eo6g==
X-Forwarded-Encrypted: i=1; AJvYcCXMGmEQUDx4y0QjZ4XX9E826VuK3AxcTRwDA5fmAYee3KQJpQ/MpDerzrCQMoPZqvJD59mj@lists.linux.dev
X-Gm-Message-State: AOJu0YzP/4pKm75h6Gvsv1Btvg2SyunHNm7d0Qp9ZFu9A2Y32CW+9Hn9
	ULbjyXWAjt/JHecytufiunAyR4SKepIrS8rITHDkHZDOV6osEKx6CpF9
X-Gm-Gg: AY/fxX60m6dN999ld8uNgkoi9Nun8z2Mp00FNLlBb3e6WZFGz7VmnD+XHx1ZAn42eJ9
	yBecy3sQT4VT2dznjvnZEfnh2tf5AgV82/4ila2/4ue9P91MZnJKv9On+64wa0k2rTxxQHQ6y6F
	WR0/SkY1QD47gWn0vdDb4WE9ygn9W/rz34nvxCUR2PO/qfh11pd/Pl7SchZ227B2Gp+DvwvbftB
	V9Y+Vedau1fSCSlC4qvWrUTjlOq5RQ5h0hCPnYH3qns8q6AbUIrWMkEEsUF0ndFiZV7ogb24hPJ
	yca5R9zJzYzUYeoV2x/2lYWYGIFsCmvBXt1DJ3L23AHJRPSSn+Qs18SSH+BDZEoMmSMJqIKMe5H
	GsVWTLjrznKrrwX4ZWC9rOCtCHIrLy0E4MpfxGdEWgkRX3+c/yoxrORV4zoqqTueQI7hmn0j/WG
	VVt1vae5VEREFbaf4ntX2aEx6EqkJ4gnurq/8WBfWMF38mf8XcrPnd
X-Google-Smtp-Source: AGHT+IFDrnuciBUHAt5nZOA+oA3L3vvumVlk/WEBkRVYYRodfFUMiH6N2Ng/k7jEFXB9WnpS2Kxx5w==
X-Received: by 2002:a05:600c:46cb:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-47d1953b78cmr4635005e9.1.1766089606918;
        Thu, 18 Dec 2025 12:26:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08d9sm872464f8f.30.2025.12.18.12.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:26:46 -0800 (PST)
Date: Thu, 18 Dec 2025 20:26:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chris Mason
 <clm@fb.com>, David Sterba <dsterba@suse.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org,
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <20251218202644.0bd24aa8@pumpkin>
In-Reply-To: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Dec 2025 19:50:00 +0100
Vincent Mailhol <mailhol@kernel.org> wrote:

> I often read on the mailing list people saying "who cares about W=2
> builds anyway?". At least I do. Not that I want to fix all of them,
> but on some occasions, such as new driver submissions, I have often
> found a couple valid diagnostics in the W=2 output.
> 
> That said, the annoying thing is that W=2 is heavily polluted by one
> warning: -Wtype-limits. Try a gcc W=2 build on any file and see the
> results for yourself. I suspect this to be the reason why so few
> people are using W=2.

One possibility is to conditionally add _Pragma() inside #defines to
turn off the warning for the main false positives (I guess all the
BUILD_BUG_xxxx and statically_true are the main ones).
But don't 'bloat' the #define expansions for normal builds.

	David

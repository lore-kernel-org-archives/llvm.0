Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B181990C1
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 02:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305199; cv=none; b=YINVk+WeIDnwwZL907pu88pcSEN8JK4Wx2d/lU21wdk4mCbF7LCwJtU4nX2su1dnWt0iwCFTSTHwOx09bO0NShIvphgoJVJ+xmmOHzIMTkmBivqLn59fDfAVVXFFWLXRAOMuPCyxYxYyATVRH2D/9ElmbpWXXsL1hH6+ynVRmJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305199; c=relaxed/simple;
	bh=8QBiywYnc12HEznieADRoYmb01M7/kHiGPxLOVKRFMQ=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Y4PkKSStqpiyeWG4IoeVe03TKLbCxklVsDc86ziDSuclVoPc3QGI5WW+d78DKnT8bo+IRHLwaKkcg+8HIIVo9DAo97caSBejSnLq0FneG4yuXh3bERgWbaU70NADdZIeF83GlOkpmMET98A/Nf7mjW6U8ciWEcUUbwGcWztu7wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=FcXAPPgf; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="FcXAPPgf"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dd43aa1558so120336006d6.0
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 18:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305197; x=1736909997; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asoiHSEPv9nQtNvvZRDauQpkLcgnQc0j14C2mcfDNOM=;
        b=FcXAPPgfLkNJszPYvzXlZZZaaSvQf1P3Wt4j+dHBmEI/PDGYb2Eo+cOwXjnUvBvAQO
         gqbL3EDJfXy5mTVRuxLyyissqC6TbjdaLcvcojYzAvUKup4g/a5N4/PSUBar7GOx3lMR
         qXmDER5RyRuvRtqvFn0hWoyKTlZlNCtPSUgbZ2u3G3/x8bT45Yn3XlO4qSgdBD06feiD
         +EttyLPraZXTLHCLJ3XqaDJk4jBHZ5Ke7IqBZzihU1fz9uhQEYJx85JEjEXlzGJTkE2C
         LfHthdaj3aSoGcOm7n8plHHf+d6UEWksoa/YQep05IJt/N4fQr96z4yGP5++mQRUeFWQ
         LyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305197; x=1736909997;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=asoiHSEPv9nQtNvvZRDauQpkLcgnQc0j14C2mcfDNOM=;
        b=p7K3RRRL3f/8Vhxz3KU9jfPkdQH7zNQUnaY/+972hngyS2HBwGGOyKKbqQR69C6It2
         BG/DW4+X8sn0ijzzS4F3jUZfDURVbdnsDrCygpjAxC5s2PwLqhlGo+sKnAw4r0Fhfdfx
         sj5c1mVmeMaR/B8iKzNNKGm/0tYLn34073fMk1JhLPCnwpzB3pwALHGkTIal81cjSsgx
         YWwbpu4XRsMcltcOdCQ2AJEmAcKIts0d75AZAJ/p0tAOt2+569yH/Zh2Jgg4AvD8lFjG
         oseOzXp6n+/vwBQ8jF2mpr5lKxeaEcxk4vv4bozEFbMxLHS+XGNX4ozVYCsB09VyWIHC
         2TAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqhKMI1s/oYoTVOfS32MJKeGVDb0fGBM56RmfMBbIVT62E3s+vLX5YNsKgvktApHib9fVf@lists.linux.dev
X-Gm-Message-State: AOJu0YyNN36knE8OKsVVcLZtSAnaXmWGmD7yTQTCdwrMkNnP6JqdNxIE
	zzGaNhERGMP8WFYS+2y/3FQqmkN4nx046ra1NUpkys0xZEdqW5d2utcQNcu19w==
X-Gm-Gg: ASbGnctPIKiqH+RvlyX8V2VQqHDgHNJghl+6El+FJEeDzKvX2utfZ4KS+KKQPh7gVxC
	j1RkBG7udX5FxRr0hTxdKPcRoHd9wHeWI9JmcH8D1116gMO3b01yQeqwyp+ri4XAo5NXCr0JfV8
	eGymzvx2qlrLPLZ10F5DjNTZH0uSQH8m7ueGX7qiq+fCNqI3XgVEfFVoOKLRQaUq94EK6xuEd5R
	6LrWZDeTbGxbFdMkcEf8Tir5ZtZSJFt//Sw/sNbKpBEwLTkJVc=
X-Google-Smtp-Source: AGHT+IGXiPxmJ6OQ+Nw6PJ7nQML8xXaPqLaZmvndDFxkYNvKcPjBpj6CZjbdCHf88W788v2vfnja5Q==
X-Received: by 2002:a05:6214:3a08:b0:6d8:a1fe:72a2 with SMTP id 6a1803df08f44-6df9b2d62a7mr21771066d6.44.1736305196700;
        Tue, 07 Jan 2025 18:59:56 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181d574dsm186398476d6.118.2025.01.07.18.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:59:56 -0800 (PST)
Date: Tue, 07 Jan 2025 21:59:55 -0500
Message-ID: <66c03059a9fff1238ed9036ab0593943@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250107_1610/pstg-lib:20250107_1603/pstg-pwork:20250107_1610
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH RFC v2 2/22] selinux: avoid using types indicating user  space interaction
References: <20241216164055.96267-2-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-2-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Integer types starting with a double underscore, like __u32, are
> intended for usage of variables interacting with user-space.
> 
> Just use the plain variant.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/hooks.c       | 2 +-
>  security/selinux/ss/policydb.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Merged into selinux/dev, thanks.

--
paul-moore.com

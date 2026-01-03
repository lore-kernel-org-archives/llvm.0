Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D1719B5A7
	for <llvm@lists.linux.dev>; Sat,  3 Jan 2026 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767434577; cv=none; b=mCrNZ72StitYnIHDiHVtMLa8gEdq5MP3gP++Vv7FPGmTFkcvXhVs+JYPhioU7ZI7ittUtEQ1ZCcdReb5geHOkwnOxnqilKQq7hUHziwcLl2l1ogCxbMoRIRkdr4VfKfCI5wgpKtQ1ZPSlq+VVUsKiDTUMuNSBHfGCGg8zD/4dFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767434577; c=relaxed/simple;
	bh=qPbRsMMm0OalGU9qVWShgfi/u94dI5ZvzdhcCM49xKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0509y/ujl7GYz8ysdkHuFX+xp2noLUt7H+JKuuXvCvwJ6IL/oMoo/op5hvx4Iv1o4DzcTFOBCkhybEaC3bP5uA706MPUGpfQxoEgmUzK3pRQUt+o2VfQTFcTtwgdiVr2/LLNKRwkdyun4kB+YJySg01bGubaPb10yq6Kni6luQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=syAb+5YE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="syAb+5YE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2ba54a6fso5428305f8f.3
        for <llvm@lists.linux.dev>; Sat, 03 Jan 2026 02:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767434574; x=1768039374; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVMxWDM6IlrZiTwjie+uTeOt+ekq2BmDE9odN218w14=;
        b=syAb+5YEgsSp1bFZrEcFXZKtKnkt/6f37kBFmhF46c0wk4w4+18hO4OQCliT6Wmdjr
         wox9kfd+VjHJ+TgyaO3oAxWUCU3gcpRLNcSxIKopac7G1++n5FdEsUWkxAOXmIMldIyf
         K2s2dH71HhEuGkdrlNIHw0nAM02xogdvwz8nkofNr4b04IGzKHflDGLfrTyIcSzYdtv5
         ApLwP//zB084QcPavvL+Hh7Ipi43iMsRhclIFAopG0LMOZDyjUjkY8nCcCegZztxnPsC
         r2Q+zRph6lbWQeKPk8kgkk6JV72cO76+KEMD7Kp21Ceg47R91zL74xpJ+BK16uuXVCsy
         cQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767434574; x=1768039374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVMxWDM6IlrZiTwjie+uTeOt+ekq2BmDE9odN218w14=;
        b=n9GKqanmLmI67BBk8Rbu2KLFtKw06Tcwddoppb52ghExa1fpxH9DXwelTPygH3Y21Z
         ohPgtxK5Y5O+jMSeiIGXjoN9YiZZ3wHmbqBXp57DNTr9R47yLJq0Mjxr55PhPajccxvU
         Jkyc65hILn0Jqv3F0HVABXksjGyuFMlBnSTanJA9kDsOMBHoQaFEE056B5eQE2V19ylY
         E9PviARbVcUnEYFr8NGhCl1j9/kS72bK9q3lKhuIEnygFUXcsDs7qlJcQqfHvZ/ctKfG
         HT1FjP6UIzwwWY9uwpH4/APb7pusiB4L5eETPrBRHKzAddQlaEr0s1QNcDAQZZ0f6QlW
         Zb+w==
X-Forwarded-Encrypted: i=1; AJvYcCWDMpPUZaD7akT/LFQEOmqKsPndHsZmdJ+St2G/8UNdBNAsZmErI9xBL67uQpfpG2py3f4B@lists.linux.dev
X-Gm-Message-State: AOJu0YziwRtC+SlyQbeZlhCip9w0zms6++a+YSQKcjvQQWBazdXpQAE9
	uKGewOqQK7dusQcUp8tQgXVoMuJTURF2DT/vNaJA4/4V1cBe0tTXxhAS6ZUEtK/1wgo=
X-Gm-Gg: AY/fxX7jprB8cdrlQw1pIvOSDpYt8836p2YJNtg0AjI50Sl3Gh/R67l+3TDqEMIzz0V
	Ee/K63hbfZ2C3CYaejhAVClPaRKwBfZ7EHy2gQqHO7w0O4tJ4VEFIlcHTNFeOcvz82Ga0EvCezF
	FBN/qtRNOGuc/ChYfGdV/ba8FKlLjvAmkbwBy4ItlKoeNBSvpovo3Yu/4wgIrnL8fRr5euC5zrQ
	JQLSP/Zet8liS+MMHe4i5dRg69QFSuyug4MI4Hh67ImOenU2s2Z+KiN1llxm+a/vVeRTNt2PoCY
	gLx0dgdcKme4marwFZr1z3yePqkQz6Kq3pWnjxwmM57N0Gd6zZJZnTHuCTT9xp89D2tZWfQ1pDk
	LQkv9B1okKUHxGISravQShbHoPMu/OtPKJ/bNwA9B23A1s2dr4VwnccXsAE0DUSKfMmPJtiZ1Ys
	GX/Qib78dzHgOpwDA4Iu7mmFsg5g==
X-Google-Smtp-Source: AGHT+IFPkanq3RHUbcsbNCpasG6Z313jdsfGQVH9J5om8n/FtqWwK7E4sTbdu6zUmursa5ksRK1pIw==
X-Received: by 2002:a05:6000:3113:b0:42f:bb4a:9989 with SMTP id ffacd0b85a97d-4324e4d0fc1mr49661835f8f.28.1767434573075;
        Sat, 03 Jan 2026 02:02:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2a94sm89174903f8f.43.2026.01.03.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 02:02:52 -0800 (PST)
Date: Sat, 3 Jan 2026 13:02:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Vincent Mailhol <mailhol@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
	linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] overflow: Update is_non_negative() and is_negative()
 comment
Message-ID: <903ba91b-f052-4b1c-827d-6292965026c5@moroto.mountain>
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org>
 <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
 <CANiq72=jRT+6+2PBgshsK-TpxPiRK70H-+3D6sYaN-fdfC83qw@mail.gmail.com>
 <b549e430-5623-4c60-acb1-4b5e095ae870@kernel.org>
 <b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org>

Thanks Randy, for sending this to me.  I'm on the sparse list, but
I've been on vacation and haven't caught up with my email.  I can
easily silence this in Smatch.

regards,
dan carpenter

diff --git a/check_unsigned_lt_zero.c b/check_unsigned_lt_zero.c
index bfeb3261f91d..ac3e650704ce 100644
--- a/check_unsigned_lt_zero.c
+++ b/check_unsigned_lt_zero.c
@@ -105,7 +105,8 @@ static bool is_allowed_zero(struct expression *expr)
 	    strcmp(macro, "STRTO_H") == 0 ||
 	    strcmp(macro, "SUB_EXTEND_USTAT") == 0 ||
 	    strcmp(macro, "TEST_CASTABLE_TO_TYPE_VAR") == 0 ||
-	    strcmp(macro, "TEST_ONE_SHIFT") == 0)
+	    strcmp(macro, "TEST_ONE_SHIFT") == 0 ||
+	    strcmp(macro, "check_shl_overflow") == 0)
 		return true;
 	return false;
 }

Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846B454FA7
	for <llvm@lists.linux.dev>; Fri, 26 Jan 2024 22:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706309853; cv=none; b=SQzt87REzogtQwHku8/yQ4hJFqYfldBEbjvVSdYt32o6WJ85WS2JXAWpUOyXVBF1uJsYzFmJDmxPvpEYbYrSKxujN8nFAXdmGs7k9HTQmofvwmkObTwkacuz5h3+/xxxUtv6P4kt56So2mQhEX1fq7ps/dX1Z9Af9Vd+vfD9H04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706309853; c=relaxed/simple;
	bh=Zm28gy7JneQI86vjRiocJqTdrtybNTFIpBfp44vYclc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rS+7EN6sgZ/oSDrOySWg5Hi/CvP2L9+3B751oQdOr7dr0dlhc/VRDfzkmqIUzNOZ9h/fvP8Ra3lPLpnne4TcCOI9m3f2biUTzEZZcOwZS3RofjcQYMr02/50jNLaILgUU3MuAA/L4dimDOunemxL+wLAzv4agXk51Vk5cHNsGI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mjVpxSd5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mjVpxSd5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d7881b1843so8611715ad.3
        for <llvm@lists.linux.dev>; Fri, 26 Jan 2024 14:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706309852; x=1706914652; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gNeQV+teY78A4CeH6MOUnq15lI/jHlKDDnV2ttEl5UM=;
        b=mjVpxSd5hmhogdEAcbITxl5eEmIBOB2h1v0pw0xvPvYR3cjnHR+y5RaRlrt3fe6T5w
         ZpdXhEIM0PV4m+pg4Pu5YnoyD8gone+nfUBBog2zGy2kVUdmyN4EiFV83Un01nwJMThp
         FUIava6XsLYGeXN1UG+gaXYhCXvRt+UgqD2MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706309852; x=1706914652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNeQV+teY78A4CeH6MOUnq15lI/jHlKDDnV2ttEl5UM=;
        b=IrgpZbZ9PSxkcohkYcDNX1h+II8IZp50OWe5SNxLGqcVX/76jFGQknSMsH2RFBPAvT
         ihMJKuLK6a0fUxklcg/Yx6sskYWyWjvS3Rv3ajT710+Vr0nwMlO6raImgQh7NMKfHaci
         7lMwKkzkBDfBgHaWtA8aluQJ8uCxBEeQtgSTnqlMEDH/k5GllCykxIWWJ3da/4SCCHXY
         Hpxxth8g2maSR7a7RhSmrF1tgWweN4PxIIz63/TtC7KZlbS4nkPaKwhuxkMEz99850tG
         oh5tbTIBuiuTeDRv81yRSKcHJdlmAT1zprH0LY1++bkq5dYErpw1irHyn5HQKtynJf0Y
         F9FA==
X-Gm-Message-State: AOJu0Yzp5beTD3g43DtxKGABxRTSnANbb7LjdmShYQ0rYOMwfCPDPR6P
	WpgXs7Hj3mSnXbZbD5kNSC1YaXoDYZZDwJ1Qx6BwvgmLsMe4loOMnc6yplEqOUz4Ju8S0/By8R0
	=
X-Google-Smtp-Source: AGHT+IFa/a51ef4u5Txe4lN0/riq4dPPU5C/s4ogKAjOdUPLp9voycoxbrQZLW13AiNuVW2M7eXSjw==
X-Received: by 2002:a17:902:ea08:b0:1d7:24a3:278 with SMTP id s8-20020a170902ea0800b001d724a30278mr627215plg.91.1706309851913;
        Fri, 26 Jan 2024 14:57:31 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902c44900b001d71649bf9asm1413199plm.252.2024.01.26.14.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:57:31 -0800 (PST)
Date: Fri, 26 Jan 2024 14:57:30 -0800
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-hardening@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/82] overflow: Expand check_add_overflow() for pointer
 addition
Message-ID: <202401261456.3D126A50D7@keescook>
References: <20240122235208.work.748-kees@kernel.org>
 <20240123002814.1396804-1-keescook@chromium.org>
 <20240126225257.lfgeom4rhjzx2wrf@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126225257.lfgeom4rhjzx2wrf@google.com>

On Fri, Jan 26, 2024 at 10:52:57PM +0000, Justin Stitt wrote:
> [...]
> >  /**
> >   * check_sub_overflow() - Calculate subtraction with overflow checking
> 
> Does check_sub_overflow() deserve some more love in the future? I
> imagine "under"-flowing pointers is not at all common, though.

Yes, though I hadn't found any cases of it yet in the code, so I didn't
want to add a helper that would go unused. :)

> Nonetheless, this all looks good to me.
> 
> Reviewed-by: Justin Stitt <justinstitt@google.com>

Thanks!

-- 
Kees Cook

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB1117E473
	for <llvm@lists.linux.dev>; Fri, 11 Apr 2025 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377076; cv=none; b=oXfnHwOXgtv1j4Q623+dZsDEWIZkJg6CSCHekPDAHwNyBXtCR3EvAfCl+5iNyR3HTA9p4dp0TzgNsaxEMjXQVjJ/Nkio8lRgui47vq5SjuaG8BSE8LrczFOXuSU+j2Zi/t5KOcKPthJvD4+ainAlIQ60VLFSThme5A10GnApjlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377076; c=relaxed/simple;
	bh=b90QMSZdF7aLByNUjzfPWgG5MIx777w7nz595hC8aX8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uCRrSoa8VFI1rFJA4lxKrFHDGTphlIvxkrYUhYZpZHJ/4472q6mxSnCCt7+joqUCKoPStqYHkyjn5ZUiXqEj7nCSYFscQVNVG7kZrLNXnNxYTxcjB4PQq3bSDWz6FwDuXnzhGQ+L0wMO5zQ+19fOA6MppjjNZtSOv5M4QjO7Gsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fssDc4DM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fssDc4DM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744377074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sVZ4QSAu2dyki6ocaWRXYDX2sA20EeQkrcN4x5tVkmQ=;
	b=fssDc4DMaW5W5OtvxvE4w9SaX4O5G8jYlGk7TCvz7+9lvo+LSrNJyEHfSFmx2z/GfhHZOz
	zLbN94JqrkPXRaTLyeObNPwp+2ztovpQQzn8mxQQbY1DCUV2hyeoFa0cxe0aFZRHnaGIPE
	iefG4Y9LG9mJ2HyppYiALfyO8erggwA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-qLVqqsLBOAiHh8WkrLfdOw-1; Fri, 11 Apr 2025 09:11:12 -0400
X-MC-Unique: qLVqqsLBOAiHh8WkrLfdOw-1
X-Mimecast-MFC-AGG-ID: qLVqqsLBOAiHh8WkrLfdOw_1744377072
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so17647995e9.3
        for <llvm@lists.linux.dev>; Fri, 11 Apr 2025 06:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377071; x=1744981871;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVZ4QSAu2dyki6ocaWRXYDX2sA20EeQkrcN4x5tVkmQ=;
        b=QTlYWtF7ocbzkI1D8GAr1Z3cSVtBjnXO07Ja9+6GqqwenB9OnFp0q812LOIrZIuvbF
         LDiC6H/4wSQZKyjkOKTRn+WnfOKfFDt90J/VcJbnZKmF6jFxKfg1xY+49luHyIT6rEQr
         rB1oqkVUaOVGBWT3TbVrj0+RdCTXnyPyd8zPI2f+Nrym3lS9k08aelRaZBJc8Pf5R0YZ
         ITgm7I9qkz/O+SyVg54j0YYsn6dpa3K1rZUNM8N4JFnGzkT1j9/ePyn5NF4Mj/gp+o0T
         NLccrl3avZNaEvXj7OFm+5ybfzrrTj2MMuDt04whbCZTRcUpTeB3mGIsBtOhTotXGa0U
         i5LA==
X-Forwarded-Encrypted: i=1; AJvYcCUMwmvVFkCEz+zU8ZCzfi7rvajvGmo7s8ATRFjZhY5y2CHOiYSveWWvGxm/jdCqvVk1B419@lists.linux.dev
X-Gm-Message-State: AOJu0YwMy+Uv9vDbOOsMTZavj7N6edmnYIjyL5oYWRXzPFXRbxaCsCoZ
	rkhaSu2tQFWwZEf6u1czIh9N3vlEoZqvytF7HnFgZ5LK8Py08qcqMHH3rtobhrMZfBvn4lAt1ky
	xLc2PzPI02llbpumF/DCTIo/vR2upWJjsDpuL902iP4M0r+g9LSk=
X-Gm-Gg: ASbGncvjRFOHF2MfYKiGiI7v1LAShZKyjUk3igXWlrzproXBgD6RMzvOHK31OKLDo4i
	kW2tBo2L7g6OF8M5skh+CrAEDhzBU2r2W/y38ppBPkKZpJfRC8RA22xlRzqzOydGNPNJir5QGHO
	vO3VEoYEB0SP3FotfrGaU5ZZz+s7m4Jv/kQucneOyoQhl5JAbtunoj0htjnRfneDXrkg34J7MmX
	IEny2PtdfeiaZl85XXTL8IEGwO/fwQ2XKT253I45MBQvfVOADAsC/MxTL+QjRp7y9CHsafhmEpF
	Nt0qTFwC5UyGwY8kSC+Ac/flKkmCWiXXoIDOPAILpkJd7Yt4PYLO6Sky9GF317IFaBgrmw==
X-Received: by 2002:a05:600c:4f45:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43f3a959a54mr27221245e9.15.1744377071561;
        Fri, 11 Apr 2025 06:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC+z92vhh7g2ybLS4kL/brhBh5vT1DbMh4lJA6Q6ypcMXRNf2AULVsSlzOqoIHKKXQrjXtDQ==
X-Received: by 2002:a05:600c:4f45:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43f3a959a54mr27220665e9.15.1744377071067;
        Fri, 11 Apr 2025 06:11:11 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572d43sm81516565e9.31.2025.04.11.06.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:11:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/efidrm: ensure screen_base is initialized
In-Reply-To: <20250411125554.1453825-1-arnd@kernel.org>
References: <20250411125554.1453825-1-arnd@kernel.org>
Date: Fri, 11 Apr 2025 15:11:08 +0200
Message-ID: <8734ee3ksz.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y_Huoj4FCPIrCj6PRacnpYdxdla2PkYsP-u25p9yaBA_1744377072
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Arnd Bergmann <arnd@kernel.org> writes:

Hello Arnd,

> From: Arnd Bergmann <arnd@arndb.de>
>
> clang points out that there is a code path that leads to undefined behavior:
>
> drivers/gpu/drm/sysfb/efidrm.c:353:11: error: variable 'screen_base' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>   353 |         else if (mem_flags & EFI_MEMORY_WB)
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Add the missing initialization.
>
> Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

A similar patch has been proposed by Nathan already and acked by Thomas:

https://lists.freedesktop.org/archives/dri-devel/2025-April/500539.html

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


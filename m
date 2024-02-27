Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888C9249F5
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709053248; cv=none; b=Kqvn/aN+NoIm4pAp7srJkCZDcRDv1NX9+HDeLR0IakkkM7BQdufRdCMiBgeoj7aD3jxGQpD3d/Np21NyBZLlZs5nxMyu41okUrE8qEfJKOLLZajcTuCUWAVax03Vzie9sWyHmn0iCrzktUgBaM+QwL03Yj1j83M5aErBSMZPKWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709053248; c=relaxed/simple;
	bh=kaZPwy1DnnJwKmEiqW49+N4tGBugK5KqDPoQuOPHqX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeRI7hyuqPvvyV8gWtOFALLQ9BsU2RM/3y5TkbVM/vElahZVPw70LK4uqOn0GBoJuaXCs8I7bkd0JPsPQgVox6+qslAdcEF5uBGKLmwWXr7bVMiWCsG5dZ9e3Ny8MsSFAQJEHmQFbCPOn+EBb6RP+oiWliNfQxICsQ0hBZcPkFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LB34cpw9; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LB34cpw9"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29996cc6382so3133386a91.3
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 09:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709053247; x=1709658047; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fVB/mgTuOok+gnoF/FjLnOVs65Yn1KQT4qK8xBXRKZk=;
        b=LB34cpw9VFyN1TaB/I8aqkFH9pnHcjyzDpzV+3tQ2Ge0vG6tg6LQgrWM1edF6cPzxZ
         3d4HEI7oKRw37b/GgcSyNXtkSnWwWzAHAuN21a1ssgYphww6pXxxsUYHtJo8KBnWyYUx
         0tzNG1IYdEDlquZwzV2PGoWYJHbBUdM7we8os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709053247; x=1709658047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVB/mgTuOok+gnoF/FjLnOVs65Yn1KQT4qK8xBXRKZk=;
        b=syYh/Q+/hWuNDo1MSiG9IBVS2l39NfY15gHOv3mHPXXtlhdm8y+T7UUdj/lfT3xSyt
         mev1lxscgr5o543kV3ijPR946DO6w0TsWC7myUR13y8z2ELT3cR3BwLbKeqd8hJrIYcy
         WSF2iBE5sATIb9mRc5vCgKnO7h6x2oUUUYtZpPU/cwuyZg2h8t+iDN2lFRtXKRZj0lxQ
         mG0ZAeAdxU1VN6xr4mQMI0TCeRG104b9qnyhTaqA+b8Ch979irAdklHp5w8fb2BxTI7Z
         2u+FSxbDRZUWQ7rHMfyq5K9fnpnGr9pA6LMo1Qo08upwjmmIa83dsQwWyhfmgMibdOlt
         q3cg==
X-Forwarded-Encrypted: i=1; AJvYcCX3Ivm24NND6GPcYLahNmZ+PKKb+N9+30AAagJ91HFSiddAVp2LVkolIvWWeV3/sNHv4PNDfy3auftTaeki0svncsNnHg==
X-Gm-Message-State: AOJu0YyC1zdwhrzXLYdV6OJAetIdoSpqSADZ8unVNDw8pDV/UigxYV7Q
	siXqEty/bb7J9BAjbFYVwwWBcnlsmZAqyogpVsJOHPvM7oZyJ7Y8AqQ7dF5Xfg==
X-Google-Smtp-Source: AGHT+IFg0NCtYbETJpvRCOpzy0XTL7KtmhpC1VhxZupEkO0MpW4B3yevf7ZLibVvBRAtyz/LEba0cQ==
X-Received: by 2002:a17:90a:d90d:b0:29a:a39e:e651 with SMTP id c13-20020a17090ad90d00b0029aa39ee651mr7555235pjv.11.1709053246818;
        Tue, 27 Feb 2024 09:00:46 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090ac88300b0029a4db713b9sm8760981pjt.39.2024.02.27.09.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 09:00:46 -0800 (PST)
Date: Tue, 27 Feb 2024 09:00:44 -0800
From: Kees Cook <keescook@chromium.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, rui.zhang@intel.com,
	lukasz.luba@arm.com, gustavoars@kernel.org, morbo@google.com,
	justinstitt@google.com, stanislaw.gruszka@linux.intel.com,
	linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] thermal: core: Move initial num_trips assignment before
 memcpy()
Message-ID: <202402270852.E46A5268@keescook>
References: <20240226-thermal-fix-fortify-panic-num_trips-v1-1-accc12a341d7@kernel.org>
 <6a6be01d-3453-4268-8b2e-0279cc20835d@linaro.org>
 <CAJZ5v0h87k6xoi-9V0Cfb2rHQcr-STfG_bNWpzfoj4Dy46U0Lw@mail.gmail.com>
 <f81af0ae-7458-47d3-90ae-71d5217ee7dd@linaro.org>
 <202402270816.0EA3349A76@keescook>
 <bbc65508-eb0e-4d63-921b-85d242cc556f@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbc65508-eb0e-4d63-921b-85d242cc556f@linaro.org>

On Tue, Feb 27, 2024 at 05:47:44PM +0100, Daniel Lezcano wrote:
> Ok my misunderstanding was I thought sizeof() was calling _bdos under the
> hood, so when calling sizeof(flex_array), it was returning the computed size
> inferring from the __counted_by field.

Yeah, sizeof() has a very limited scope. __builtin_object_size() has
more flexibility (via the 2nd argument, "type"), but it was still
compile-time only. __builtin_dynamic_object_size() was added to bring
runtime evaluations into the mix (initially to support the alloc_size
attribute, and now includes the counted_by attribute too).

-- 
Kees Cook

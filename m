Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFDB1327FB
	for <llvm@lists.linux.dev>; Tue, 16 Apr 2024 17:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713288485; cv=none; b=qq3iDm/wNgOVFrNsgqGoC1qKZEtO3dFpWpliqGunI/WsFLjRef75ML9H2j02IF4oiHfYVa1eAH19niksHJa2j0TsKAN5TsVRFq13Ttf4ZKsSe6vK6SPu9t8JeNaNTibrJ3pGlWt7KGGBBE/+H7+4AgjPSw73Uqq4onVrk3V9NGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713288485; c=relaxed/simple;
	bh=P9tX21C2H32XeRZpclyE1jUdcQxT5hx7EiLUM0Xs90o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvdWRHdi62cHm/MPFtbTyIvV3KVJMqby4rAD+LABt1Rb/wau2rgJGRKquPmCix3sYIg7092DJCrSmQ1XUOHY9SyZm4zQgFM6ta2e1kao96xYiU3UzolMd8rmsRg+GDydldOWf2Qf8P2qN0NYJUgnIlUOWq8pg5Ppc+VWj9TOxCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LSxGXYj3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LSxGXYj3"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e3ca546d40so33931385ad.3
        for <llvm@lists.linux.dev>; Tue, 16 Apr 2024 10:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713288484; x=1713893284; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbYixWM2CqQRL1wOMDrzHbCtgA+kuvvqBpiFHzx5mPI=;
        b=LSxGXYj3vvFL3zAEzMSrJdJbEWXdo4G3TYdk0dwV9/DqXLMgMy79amAOFhqKtqUhiX
         j9u/SFrkk5ibISUsvO2NqC+a6MFcJqC+zD4mzjoxFDzTDxcmdjJh1N62ewSaQ94JkmEZ
         0y4FOEaJx2XIh9nfImjtRdriuLu2l7t1n37QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713288484; x=1713893284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbYixWM2CqQRL1wOMDrzHbCtgA+kuvvqBpiFHzx5mPI=;
        b=OGWChYkh4HY0Pqq94WTId+L0jJaLzku6ssVwCE8Zisy0maPIczt/49ZwhuqMRN1hDg
         qElakOgkOnRNLtSWTGNP84kX4mloT+k0EhXGIeJYUmfabIQVk2yG0NU5Ief+Iy70yes+
         lmzKnb1z/Kx71RehLeRHR/EVPTyyQMDH5itBRxnSU4FVVJsXDHoS9H5pDI/QT3m5ObvZ
         KipVeml+gb60G5RvI25ju/t8Hjp9ixJYeS8Xd2mkVHOC3NKruNJq69yRb0/FVKeFlMHE
         HYwnHVmkb57Ai+TqydP0TGi3C+xrczcpOHvXaoE2D2c7XaTCIpLArbhKQ3E5fDwnSewU
         +4bg==
X-Forwarded-Encrypted: i=1; AJvYcCUohY9WdGPlVDlt9wEnT8nMTAz/vwQXSFq4gXwV3jh92mUjEX1pW2e7BwWgfvOP//aJrUlyT6vV2D2h5PXue2UJLBX8Zg==
X-Gm-Message-State: AOJu0YzEdrvtKZ+i5Rcn7fT/jadFWohg1mzg4lIQy6nl/S/Fme93J152
	12M3sLSPo2AWnM23vT3nH7F9u4kKVXPD7V1U9RkbtYlyqsdbTjjy6uzjkRX/0g==
X-Google-Smtp-Source: AGHT+IHbN76rCh1Qe3W01Nc2eeKTGXKJ8Gpa83X/WpafmSVHalfqd6xohNVPAcA7T0vL3gX2KQ5VZA==
X-Received: by 2002:a17:90b:3bc7:b0:2a2:672f:ef6d with SMTP id ph7-20020a17090b3bc700b002a2672fef6dmr10647646pjb.49.1713288483774;
        Tue, 16 Apr 2024 10:28:03 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090a051000b002a2e4b593cdsm11862530pjh.51.2024.04.16.10.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 10:28:03 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:28:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yang Yingliang <yangyingliang@huawei.com>, kernel@collabora.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] selftests: exec: make binaries position independent
Message-ID: <202404161027.63F4D4FDEB@keescook>
References: <20240416152831.3199999-1-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416152831.3199999-1-usama.anjum@collabora.com>

On Tue, Apr 16, 2024 at 08:28:29PM +0500, Muhammad Usama Anjum wrote:
> The -static overrides the -pie and binaries aren't position independent
> anymore. Use -static-pie instead which would produce a static and
> position independent binary. This has been caught by clang's warnings:
> 
>   clang: warning: argument unused during compilation: '-pie'
>   [-Wunused-command-line-argument]
> 
> Tested with both gcc and clang after this change.
> 
> Fixes: 4d1cd3b2c5c1 ("tools/testing/selftests/exec: fix link error")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Thanks for this!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

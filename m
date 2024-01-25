Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A16012B8A
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 23:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224176; cv=none; b=FZLxT9FggQGNIlZ0nh2oPC2ngpCGeEfWZRremmoGFq5RbEp2/YATKUN8/tqoWec1g98b6UKKpoVutRO45PX02qLjba3FUjg+/3AeXD5M0groJ0bWrDAAk7qMyBiosoXEwL5Gn2QJz4bqhvNOxEAAc7jOUweVslVSYPBNJlJgmrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224176; c=relaxed/simple;
	bh=ePte//PcvI+POPvm5pOf9eY2yfLLJls6I8UsfkKqq8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPytuPU/dVVjB888gdRe3G5BamtY8ZP0cjHO017s96QhoJBrOpc6gMiIWq4WR/IKlNi/jCeCYPbfAG1iiIBnU45I0IlCu6rg5OMZxoviwWlGaJeOyBNgSI0wb/PmY9gkOUpZjmoxKFo69HIhzh7VwVZUFp98rtAyH3Ez4AlhWL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UoWpm/qZ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UoWpm/qZ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ddc1b30458so198246b3a.1
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 15:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706224173; x=1706828973; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NNidztSseW3f6ox0VaVwn+MmYmXjLmRwN6RuC1S6ZnI=;
        b=UoWpm/qZ3kh7N4S7Y9lw6Tj2qBMX4IC3wmKdtdGsY3VxJ9emT4L19c7sg6E+SnESld
         3aBDAXmsBVsMRfFz1lzr6Gh6tXysKg/JPqHFW4rT++3pLh3CGb6poCzjXqLQq44klsav
         N3hUVBYDWiwQWTFRjHwHRo/gPqc/4TWeDe8j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224173; x=1706828973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNidztSseW3f6ox0VaVwn+MmYmXjLmRwN6RuC1S6ZnI=;
        b=YdEdC/lA3kdMyOJ+mjA4LvqlWOvR3pDp6ehZhguyhhQ/eEo5OGoEgOiu2X2tm+4kB3
         RXuH+QLkbwwv7rQq6Eo+nPzj+tBIyoUJ/wyrWXOZhr9jsxXcJoV19WdWf2gVF+soFycv
         we4xZjklRW49AezWgfu3U4kqmksuB8RcfGilgAyARBPK9faZeq5TYECUgYCjnJBsKurl
         N6ESJi/Na5PVOd0x4glLhI3w/HayFt4VDti2K7+D3CfnCzWOFfdGCrBnAWpj/mE0mbpK
         ps+lAG/pTNCN7v2//uNvm2pUVYqjzNTusY7KsTPjl/PJCWqxCkhOgAyNzbJ0eb0fgqLQ
         25qw==
X-Gm-Message-State: AOJu0YzKF8xrndbO1DUwnV7SDwMehuoFt76lO1Pg3jzYsipDMUo97iCa
	/EKArL5sZLj1YfP5FVhAJdtLU3DMkakLZmq0lH9vbf6tG4Im+V/S9zxWNzEcRA==
X-Google-Smtp-Source: AGHT+IH4wMIY5onoDuNtmQW2qW/oiyEguJjb8r1Cdunh6LBtNU0O2EKFQ/LepjR7KIf8EtqHsgZMQA==
X-Received: by 2002:a05:6a20:1616:b0:19b:5cf9:45ac with SMTP id l22-20020a056a20161600b0019b5cf945acmr452465pzj.81.1706224173278;
        Thu, 25 Jan 2024 15:09:33 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m66-20020a633f45000000b005cdfb0a11e1sm27205pga.88.2024.01.25.15.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:09:32 -0800 (PST)
Date: Thu, 25 Jan 2024 15:09:20 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: akpm@linux-foundation.org, masahiroy@kernel.org, nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 09/11] fortify: Drop Clang version check for 12.0.1 or
 newer
Message-ID: <202401251509.70789B5D@keescook>
References: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
 <20240125-bump-min-llvm-ver-to-13-0-1-v1-9-f5ff9bda41c5@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125-bump-min-llvm-ver-to-13-0-1-v1-9-f5ff9bda41c5@kernel.org>

On Thu, Jan 25, 2024 at 03:55:15PM -0700, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been bumped to 13.0.1, this condition is always true, as the build
> will fail during the configuration stage for older LLVM versions. Remove
> it.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

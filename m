Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8B158D80
	for <llvm@lists.linux.dev>; Thu,  2 Jan 2025 18:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843155; cv=none; b=OKTvbtc4lWGSEE1732AEF15BUDjxbrxv0TSzX7kwn9EflAhgvE6ddrdKPc89Y7zSGI4BlBUJu0nvuBSyC0ZeGcvsJbi1FkP8Xra/F6JogVaU8W081ZweiNraX6GU/TKWEGHqtRvgZ5WS9l3qT1VPXUFjTpxZvWTHW+zdDFclI/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843155; c=relaxed/simple;
	bh=J7Ze9D4Gtuk+yC4T7+SN7mxojsKz3EYzI4q0AmyEC/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhoYpvYa8+3FEcfZ/LQxvUYMyXnyl2H4+EfoRkePYesUsmtjVKJ7+51J/SGcuAEvzjwlDQvzAH5bSFiOGafghhO9cQKlOTr3jogzc1tv0lJkEY3ZWNTq7/W+FLMvDGs9vRsiXScjnOD+c+QJCpoxvXbkJ3upSUOg7BlaSuK6ALE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NfqZxv9k; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NfqZxv9k"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso14389330a91.1
        for <llvm@lists.linux.dev>; Thu, 02 Jan 2025 10:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735843153; x=1736447953; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3DgrC4jHn7uUNb6XfHdL3EKmS6+pzoXkNziiabtfpDo=;
        b=NfqZxv9kGyTB3hWRtdQoAoQWM43e/Y8ViPcCVSN8bKZ4IWIerN9+KXNUvxC9N4V7r1
         e963Repa8we7FVo453DdBY391nnG0h+eB4myyYY0cAMGVvbGLvO8N0KshHVilaqcJUge
         P2+qO3CwXmzBPI9XcDxITsp1Ntws1l1SZbUzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843153; x=1736447953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DgrC4jHn7uUNb6XfHdL3EKmS6+pzoXkNziiabtfpDo=;
        b=iSwcPA10hdVVui2QOawN4Lbatk8YoOv8psZkic5JUn5dhYMu2V0ML11Jfs+BG2SZo9
         QnKINy9WI1Oxs+csIAqLycbdEz3bBjw+7k6JC1ePnMTU0zgJsAYiAu1FQj/uvdriZaig
         9Cbvjr/XWt4lzDD1de2L6KNJXHtNaL05/g5DstlPPBcKPJJDZqR/8FdVJyIqYKJX00xq
         pLNL1oeQsAGwrwHxlY/8hMbhObgUktls0G+gQmZvczwrWADAywhciZXoNIiZmAP7NgMO
         TtHDcberhCllr7u3oOVppBctno+lqr2NkTnwD8bB9mxJRKtps2DY1Kjp9Wbdt3i3IEmu
         mOCQ==
X-Gm-Message-State: AOJu0YynEULb2EhprhGKvG/Ifli220C6bJPuODR+wImNc7l/32tdrzEQ
	Q1XGstUoT5unV0QLLGhsmeei8F8qA+VSNafMzI+0rzZXgfc3+EFYRm5Og9KwBMiJxQSvfGmpNdE
	=
X-Gm-Gg: ASbGnctA9LDzPaf7yM2CLDY95ERvD6UKwrC7nd6lE9DrnXUaOkf6Hq9DCLr5PrteYhE
	SzJesDEytEMEgssiDjaGIaKiloPsQa1Ml2h2hnLPOCFllaUYlkXbgVbkRUO39AkmQudQEsYWT9S
	uLIDRTpw9746x3zFhPEY7RojIzxXzC6sZatUVMgTI///rkMNOGr+v7N22zZOHh1Hl+KJ4/dymJQ
	yxJnjXBSg1a2wGjXt7HUcoPpQKmd3CXHPXPCfks2dGYEYN9vXcoPzECbvGNQ+v2p32ItN8KGpez
	YacXEXcoNCXgEREL02o=
X-Google-Smtp-Source: AGHT+IGbNPqNI4c3ZBoEFAhUEg/ZeEAa1WlzTNBLfoqNKuh+86qctyL9gMC+Y3LdymYmk1ERcqebfA==
X-Received: by 2002:a17:90b:524d:b0:2ee:9229:e4bd with SMTP id 98e67ed59e1d1-2f4536030d8mr67313668a91.2.1735843153237;
        Thu, 02 Jan 2025 10:39:13 -0800 (PST)
Received: from localhost ([2a00:79e0:2e14:7:2f1b:db40:bb38:fa8e])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f2ee06dd46sm31630548a91.36.2025.01.02.10.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 10:39:12 -0800 (PST)
Date: Thu, 2 Jan 2025 10:39:11 -0800
From: Brian Norris <briannorris@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>
Subject: Re: [driver-core:driver-core-testing 29/29]
 include/kunit/platform_device.h:15:15: warning: declaration of 'struct
 completion' will not be visible outside of this function
Message-ID: <Z3bdT0DrjcV6UzHe@google.com>
References: <202412241917.orLfjA92-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412241917.orLfjA92-lkp@intel.com>

On Tue, Dec 24, 2024 at 07:37:20PM +0800, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/base/test/platform-device-test.c:3:
> >> include/kunit/platform_device.h:15:15: warning: declaration of 'struct completion' will not be visible outside of this function [-Wvisibility]
>       15 |                                                  struct completion *x);
>          |                                                         ^
>    1 warning generated.

Same:

https://lore.kernel.org/lkml/20241213180841.3023843-1-briannorris@chromium.org/
Subject: [PATCH] kunit: platform: Resolve 'struct completion' warning

Brian


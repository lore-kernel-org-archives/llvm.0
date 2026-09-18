Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0434E1C97
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734260; cv=none; b=a88YGLRwynzx9Zywyt9pNPjfJcGlH62anDNvqEqTtbWv85nyboQLfYEbsrAnWL4IWoJKgwVR4iazzu88FVIwtDcc+gi9HRV6dHebCOkQ9DULJ8ztKvCxATs5ry64M/SZX857s1BFXNllIEakES5gbg6hAn94ZQjdM70taRwadZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734260; c=relaxed/simple;
	bh=maSmLJEiVW4orqk/72EUoaWvFnMBkWSya0UZSf7eKGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FilkTXwyTTiQaF7VLo/qLJMKezZrBSohbRQRHgrDKPxekwx/M4q7Pev5y7v5SmXyulwyqS2d8aEp39tHLRJYl5Ho0H3wsVmGZLYz2Zh+5Ueea4Y2lhMBW/mQtOhyIpvK2kLa/vIY8M+3q+b1tyuhvVzumaOMDGqwBqbk04kO+zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKnOUHlT; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKnOUHlT"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d7eso4803741fa.3
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734257; x=1790339057; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maSmLJEiVW4orqk/72EUoaWvFnMBkWSya0UZSf7eKGU=;
        b=tKnOUHlTUkRjKEVVcKjhFkp2XCJziQsnVGCrRu6FuRSqCE+dcvfipzuWiaC039uAuI
         wZsskei/NThFkdl9U3iIXANRR4GWkU/AREaurME7J03ZUGjLFyf5aMjCd+1yEAwWqQUz
         3Bj7q+oqw+F2nmNjiUchin6z077kUjakixV8Yvl+rxxAauaPVFIgi8Fd54mB1UfUvpQ1
         zgWR87El3joSZNDInp/FouCHq6eVNXvg2dQccDhHqisROCHKLUY+64rH+6crcWOGDtDe
         lL1a9CzewZlPV633eNtoEhybndhfYUbq7lCYKKRuCE8TXpMXdoNev4i7PBjUAmbTWy76
         YTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734257; x=1790339057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=maSmLJEiVW4orqk/72EUoaWvFnMBkWSya0UZSf7eKGU=;
        b=fhNwTgslATPoEc90Ft4goG1FzkpnYtTgMG9Oenk4Y+5/FEuvCzjW7T6JV5xQKopTNA
         Srvsv3jqxFSNgOaHZfAotsLpPQR7b2Vf/qj2goQHoIZM9agB9T4LWAtp35hmI9iTuX8U
         Qf2kk5ZscPT0nZulsWsrvlkcX5T6/t/9xGjC/iEYlsggbattm/Epwwg5+Ryges41zn4Y
         X8P9iyolI4bg4mjcdSAuA/j3A+8ZaDUQ/VWjSr25yxAbr+pnaomg5inl1FXNz8uKSUg3
         Edxb0zpI7u4CIuRws1i93pM0g7AJ0vc6MQSOE7ZN7iidD7LLO66191JHy3SAxa4eoD+D
         16zw==
X-Forwarded-Encrypted: i=1; AKwUvBzEIzAV3ob25mLEMgVgw4mr+GKx7GYJ2PfOWgDmT+o+l7kDNv/F4GSLThE8sY/L9K1HVujI@lists.linux.dev
X-Gm-Message-State: AFuF++mbAkl01rqPlETkzNakjiAN+/ARaoIJsWzXz+1a+vk83e2rXocn
	PsEczNTBZ9nGl+U/nWV5Gg+XGpjroSj+McTHc0lEGnaD2v9hDvqk0xsg
X-Gm-Gg: AYBFou3BzWyGAKUk1FG9KK6dB+nrIyI44Q5Fwq+XjSO/2RTHQJ32lyk4ItFK1GLFfF4
	YeerhkdoWzPVD0W0Nifwq1i3ZpQEQVTDVa+7AjdKumXlh/zw8BP0YyHAHhaA0dxD2ZrSuweUSs5
	KQdz+uXgpLgfVKUIxmPswmvr0EvQ5M86pKeTdmC1JH3FZyYHNN+faK/+W5Ld0cekEr+BMJ3wfyr
	gZkWJZDVfQig9cH9JQasBVQjZyo6vD+hq8t7FY3aNBMfpbdoSJTOZovUSIeEE36GSlC4FoEyTeh
	NM7ZaCyGezqHG9OUufrkfbcj5oO3XGzWC5NGuRfw2DGmFkYIMnlc/u0lZl1UiSkIslAE8ok9Eq0
	pDc/X5X1srPZ0nWV7kAXwWBww6SnjusSjuq5AVy20zOBnkPMS0zSzSFvpZ9RBE1l192Yrp8agmm
	ltvHoi6AxPH0D+yuVYsRpS9PZ/RbYnkA+79l/xzVvYyERJmKzqkkBLNfNgN50jewEcgnsciujOf
	VkNpyZaNX2oFw+yRFY8Pr2VL7VLlpx035XRumLMJS6pQB1qgJwFIsfXKuOb1M9vuoEscU00ixm7
	/G1e
X-Received: by 2002:a05:651c:a393:10b0:3a5:f06c:f897 with SMTP id 38308e7fff4ca-3a5fc0f47b3mr3286371fa.28.1789734256702;
        Fri, 18 Sep 2026 05:24:16 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5fd5da086sm4172101fa.4.2026.09.18.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:24:16 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 4/6] iio: pressure: dps310: add triggered buffer support
Date: Fri, 18 Sep 2026 15:24:15 +0300
Message-ID: <20260918122415.375211-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178813888150.2788519.17461592150162820073.b4-review@b4>
References: <20260824201203.396651-1-zoone.rupert@gmail.com> <20260824201203.396651-5-zoone.rupert@gmail.com> <178813888150.2788519.17461592150162820073.b4-review@b4>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 02:14:41 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> As this isn't filling in the timestamp, I think you'd be better
> passing s32 channels[__at_least 2] as that final parameter.

There is no __at_least in the tree and nothing in IIO uses [static N], so
it is a plain s32 channels[2].

Rupesh

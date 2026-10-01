Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B3476681
	for <llvm@lists.linux.dev>; Thu,  1 Oct 2026 11:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853969; cv=none; b=eMD0ETKjxWkGzpwTBGe/COZprQD+6zvqwj5CNDEcvOnodMOunlRMLBY7s8NfHPON+SCBtqiVVKFDu19qNVlRaDjIJVuy87Rum+zj0AxnFx3fdwkm2RxCaC4I1s4z75KtaM3gCU3o2FiP0aJj57HYGWgpcWcpJpggieRKwgPPXPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853969; c=relaxed/simple;
	bh=XXJE9lpazIypG2rFZXwci5NBfeM4Y59+X+ByKH1vibk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvxJJeZkR6EOyZXmSmvInb8+V/kTFwuys9I/o3naY3FKnrnfndHQW5XNpaY8EVMIr+CPsWpNyYuUwp/BRN5WxJrpgW156WG7H4O6iCVivY/fOgrvb5cL+TK+Mm6KnoffZI9y7HMgATlE4s913PuXYsrfprYEAo2SMwRqpZ3zW1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqKvEsFg; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqKvEsFg"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b8f69a0af6so658691e87.1
        for <llvm@lists.linux.dev>; Thu, 01 Oct 2026 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790853966; x=1791458766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0q1MEXEb22UrsB8iQVi8Js6TB9YSw4vDK0ti4byYbGo=;
        b=JqKvEsFgMMMnmOknITcFEs6k36UtDWaxWZ3vxf3CLDGC4xtpK56qxzVKn2drLmEXrU
         z2UrYghQgN6JnkuRPUMUOiyBnFOnp129nTQ7foX9OsTEXGChL07jJG8yjBUv0lZpgOdg
         aAsL5XCLSBp0YA4aA/ECjul8mE+HNvO+Wpqoyu0d62ibxntYD3QKHGPt8HY5qmGLrbNQ
         FgWJmHKee35GEfMjvuAXlTBaCOBRArBuNlwuN9XPRYSYqnvDEulMZW2hG/fGJCjZG/Yq
         Bne0yGhPwAtHG8kWaOih4xiL647MHilZQk/3KMIj0dOvhFrHTb4pEOJOalPK3HzM9l+l
         C9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853966; x=1791458766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0q1MEXEb22UrsB8iQVi8Js6TB9YSw4vDK0ti4byYbGo=;
        b=k+Vlh0agaZHiixyy52Qx09iMPOEPkZHlNTBJXQZ8KeJH/R9kp8RzoOsqz+VtWpBK4D
         wbpJKgnMEAXUAl3kqdjc1nWdEiGm9WmkJda3qySewzzn5DVsUMtnjYGDJvSMPG0JYa3V
         FW1o8WTI0pVwx+0YzNSHHcYjrS1fM/csf7JLrlqu9HBCS7NoNRXGeq58LmMFCcwfK2g0
         +WYV3rS0wzue6peUpJDN46JmE0liwZ0/cpyUrU+wjonrWzuIWLKnB+93UsLBzv6o3uF/
         6WWYFxHMkEum8jS3CikBpqEfoQ5IzcuD3oZqwwpoHn26B58iFtD5Nh34w6Ncsf/C4H6Z
         J/9w==
X-Forwarded-Encrypted: i=1; AKwUvBwLHF+ApPHtpS1GMZRV0pDCDwCU1/n9y31i6/Ip776/naWdrAnG/oBYx8uQFBurr/mOONRy@lists.linux.dev
X-Gm-Message-State: AFq9FYK3oU3edf5vQXYrpEHyXgldjYa37k1IOyvUo9r7G4sqX/t7PZx6
	u2TinW0ww2qM5qUGdY24p8A8WJm98yX1y3dQjOeLmJWCxdWe5Y5dVt0u
X-Gm-Gg: AYBFou10dj38g2l0wlvZIzDAsAtA/wLAom/5Q0gA+AMT3fHVSyM25zCShg4C0qSnPfl
	sQzfOLYbF0SiSYwUZ+wB6fZ30xlsQl3fI6EZUXZ7e5C+wUFlfJ9haH8mB7Nzcu0prvL8S7kEd4n
	q5yOpSKYog4U+7bRTwRmtgfwPjOxBZcfNqSlzs6cPoIccAr/eHVxb+Dc0SIehV2RAsCJGLsH62F
	zeE+3IsCtGLOi0AN5rs7uQQkkGYewEUDQajfApDuS8I4Rxc7Iisu4nZpBMjcTmwwlhGOEDi0Ky6
	RcFVXN6rw32zJTCGgVosVqbSScA2fTUbZwD8JbpthpWPy1O/msfhNGO8fMyGkyp+KoPQ0t08xul
	swxtucFdfkuWfKIhABknJeLLOeiIYW/ZYgjfkNjjnBe+pFziv0bvvsZI5s0CF35rl/8kSwfp9D7
	+C8QpMo1vWb2gWKLAVYDQGDePKXMPFpaL8TbNghYl0LekhTefmFHWcy/AS3Bqrz9xE/hGbTuMJJ
	yF6r021VAyRJEg1bFpV2G7MMe03KlY060Av7UO/pUyBFwduD4GkteRowfqOTTh3CB0B++t1bM/S
	Fbmx
X-Received: by 2002:ac2:491b:0:b0:5b8:f1d6:554c with SMTP id 2adb3069b0e04-5ba433daf8fmr722764e87.12.1790853965797;
        Thu, 01 Oct 2026 04:26:05 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbebacsm649768e87.72.2026.10.01.04.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:26:05 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: andriy.shevchenko@intel.com
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v10 1/4] iio: pressure: dps310: read buffered samples from the hardware FIFO
Date: Thu,  1 Oct 2026 14:26:04 +0300
Message-ID: <20261001112604.15200-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <arzl4DK8vhP0g8Hg@ashevche-desk.local>
References: <20260930100158.957977-1-zoone.rupert@gmail.com> <20260930100158.957977-2-zoone.rupert@gmail.com> <arzl4DK8vhP0g8Hg@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 30, 2026 at 01:35:12PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 30, 2026 at 01:01:55PM +0300, Rupesh Majhi wrote:

...

> > +	rc = devm_add_action_or_reset(dev, dps310_cancel_fifo_work, data);
>
> Are you sure it's in the correct location?

Yes, it has to run before the buffer is freed, since the work pushes
into it. devm_delayed_work_autocancel() goes here in v11.

Rupesh

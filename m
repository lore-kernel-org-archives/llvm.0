Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863E42D7DD4
	for <llvm@lists.linux.dev>; Mon,  2 Feb 2026 22:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770072342; cv=none; b=s/GLsSwSQd29g7wLAPF9VmldvP9t0TnxPAa8yt1zruPnCCoDizsszxEpma2LtqQRCQqz+WBFVkb7o0ezaZoZIYrwqNhIb6pJd1smITaJgBtqW46+mVjB+FGx3d3JWrwirs+xiR5hS8GeE7xglYthya27YUZLjkD0lugrYTspYx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770072342; c=relaxed/simple;
	bh=5Kb5krIsfIdKzbY4UbV0w0i93VHuDl4UPIOiaxALKbg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uW8bYGMwwq1w+QYrMi6Du0bCm6K/HtagqhEWifQut74jaZRZFAxeJnly68LHygjlIJdIcJcSG6jneEpRJ/BCjZ5NgMg7xAW0I12WF5ku4tE4FyiQ4RzUmTWokKFfurP3bmugwIdKWTp2nXYpQwd0TtT4FbBNaZDRbYrgD4iM0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChmJdRRM; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChmJdRRM"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso1821555e9.1
        for <llvm@lists.linux.dev>; Mon, 02 Feb 2026 14:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770072339; x=1770677139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGqAdrVHnFu6PnnaHfHKQoFDoCwgyHq7ziHIdTjOCQs=;
        b=ChmJdRRMDiQWsi6x3G3IiDojMR+08+wbD++eAaXtSPnplzEjfUnC8iidkLvQKl78Cz
         nDGcjI3jA7yhoLpC1qa6ukzF4kWeeV+KV3WxiAodNcK8eEq6h9Pdf3d/WyqZMiev/enU
         PLGqdOwaWDNm6o1xluB+PW29D8sggNL1I0Bsu0l7xhUM4U6zK2etM9fv+T6xaWbrvXLX
         dtkYnfcudOrn5aKThrwTDrNzrXvbM3NkDcjr8/GDHwZ8orD6nQ3ka45uXWjOXwSlkzZW
         Fk83/pqiFhUMSYws8NyF2OeMLbZkfC/kq1TyGw+/NEPNJs2aPQU+lNk5ZKysotNZkLsp
         Ahug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770072339; x=1770677139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JGqAdrVHnFu6PnnaHfHKQoFDoCwgyHq7ziHIdTjOCQs=;
        b=aAtGyVMb114eCtAsBrp/qAuoYr28v9L7Z0BZ8Tlsv5ZlXIRJyRH4QMzqttVZIqnpHz
         ZNZOAj4qYFRO4gq1Ivj3zGKUQR6kcwsrInUgQ4YRJES5d2dqQkHFaWhPznRxJWB+FlU6
         zfkpqUfSCt1Pf+qwMCeJ63vyMkwEk3j/MXd6p9yBRjUR1ZDEGwQPIDdwTUaaAHhld8Dr
         /RWbJtA9zgxq8/cidpr3rRfzoZ11kf5FuyD9Fk/tHKo2/xgqyfaoi06DDiVPZOTn7aSa
         aK8DRqE6/VsQDhFzmERe0kFXdprtAKvuVPdZuUgjIfQtCnj56VxQm4OQ/we04MfVRkHK
         xUkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8RsCfEapSt5c52g/yw/qFOJItCExoDv9zPXn7Jd2Jj9YaT+eZ+t+7V7IHMYHupAM/BO7S@lists.linux.dev
X-Gm-Message-State: AOJu0YyG00QIv/SAbR52zHl5NFDiJR/Rs/y2MmTvbp5geoNByCKYNyDv
	+1hIBUr5qD8jZgxMh41z0zIhRLsD7z3jbk22u00vsoqGnmeRAnhNMOzF
X-Gm-Gg: AZuq6aLfVB1HU7spxojZZvCLVwpUUoqfPSbMPU6Bm+OcQ0qNROgrSR/e4D9Wir12pYV
	Z7m2tvjsPpFvdp4e9n6niu0OxbDc80u6aSk+SzOhhSTzvyH71wGsfNhdOaTsiUX5NgMoCK/IoMv
	0KRV5tCVIfCRoFh5RiGoGr2qpKGsixKBsq7iHLyLO82uu8Fpt6+tRG8YXv6CyBke64Ut5xDPMF0
	z+3VdVcFeuQUx8D7fQWNX9hKxdLc6ftGHbIuaNHwWmhmMg41qZLnVfIm3WBIAVuEc8NpIdx2rCO
	+ZuS6PEUIIAKYvQknM2QBB0ULGGhP6M63ioc/PxgCupePM7nAQWpraalz2+a0JVX6I+eLYLIlkK
	naIYT/NJgl41/r8kg2zOJDJLLt3Jb1mRNk4Z/LQFpwhYuwXqPKlO6jS8R4Sq3zZEcasjGMIy0YU
	1C6cOTPvkzQYD2wptvUDYxpfo2y2F7HjQPEjs7zLQLL9XBzNUygS/v
X-Received: by 2002:a05:600c:6303:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4830513aed8mr18382505e9.8.1770072338747;
        Mon, 02 Feb 2026 14:45:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2973d57sm100080575e9.18.2026.02.02.14.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 14:45:38 -0800 (PST)
Date: Mon, 2 Feb 2026 22:45:37 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Arnd Bergmann"
 <arnd@kernel.org>, "Detlev Casanova" <detlev.casanova@collabora.com>,
 "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 "Nathan Chancellor" <nathan@kernel.org>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] media: rkvdec: reduce excessive stack usage in
 assemble_hw_pps()
Message-ID: <20260202224537.16c16e13@pumpkin>
In-Reply-To: <070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
References: <20260202094804.1231706-1-arnd@kernel.org>
	<16baade123f563ea92e6117bf78c56e8617daf14.camel@collabora.com>
	<3b89635f-1c1c-4e4e-b0a9-2bbd0f21bc90@app.fastmail.com>
	<da9f044152383cacd50989b025fdce08a654bbe3.camel@collabora.com>
	<070cebc8-3cab-4f32-a203-9456506dfcc5@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 02 Feb 2026 16:59:05 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

...
>  - Since most of the fields are exactly 6 bits offset from a word
>    boundary, you can try assembling all the  *_field_order_cnt*
>    fields in an array first that has all the bits in the correct
>    order, but then shift the entire array six bits.

How are they being written to the hardware?
It would be very unusual for hardware not to have things 'reasonably aligned'.
This makes me think that the data buffer is actually being 'bit-bashed'
down some serial data interface.
In which case the simple solution is to give the function that writes
the data a 'bit offset' for the first word.

And to re-iterate C bit-fields are completely non portable and entirely
inappropriate for mapping onto device registers.
You can use C structures (arranged with everything on its natural
boundary so there are no holes) with members declared with the correct
endianness.
Indeed that is actually preferable to using numeric constants as the
offsets are tied to the correct structure.

	David

> 
>       Arnd
> 


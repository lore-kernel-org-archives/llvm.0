Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268460;
	b=bxOlFC1HLpdXXRogBOei6WC1JnFCTqmBl3aigR2QwxyukqCRVzIiGHLtKPFE+g66bkuP
	 Bb4GmJxUNKYput8vhjfzh0vfy1N51sVg361u988m+BKTuoaEMDkFPfubMJ5z2d6sipPjH
	 hVqtxdu/4ebIdIfwoA+nYpwq0hGysDdZYU48hvptudddu0G5sL1dJJXKqV9VvE3Rzv4Oq
	 cHJxyxA+qpXTCkokRvJiUN0kyyXQzYpgaDiTinSOh78SfjQzT+UBd7nnNW36sR5x/EqaU
	 Mec5IxFGeCeczMyZaGngnuSeI8X6QRJfwCn2jRI320U0FnXc04Vp0Inhdu/ddmGRDuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2pI/j71t4VuCaLXQJYxfTinJklKy3KjSKz/+nzofH0A=;
	b=rMNGHZrnSyQbkjdP2JrOvlLrFyjS/1P12EEVYn3r36dlEfT9oErTDbovfKHl26KZNYig
	 zq8hECwDGexA0ymRDqfZq3Cv/InYUTqfvtUIVZuEDcXvbUHDualDW52qjPLAwb3ZQnaYO
	 mXcRaSWwXXZw7fe5D15fTC1uri9H63WQ5p5Dw99p6ZuxSO2Ihim9diAB4778VKTDaX31w
	 VgjmW4P9YwbVSP0ncjL/7IE86N3h/pTyAqafajqN2/aA8qGCGzEm6/gJPPHDwXLa47+Wf
	 sjbETiDqn0Sf7NvUFqplFU9MiNznPAhwV7XE1eZ9S15OsujuoHzKQPmdLNTRXNx5xVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075DA606A31E
	for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 10:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso13318115e9.1
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 03:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1793268452; x=1793873252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pI/j71t4VuCaLXQJYxfTinJklKy3KjSKz/+nzofH0A=;
        b=i68KGOeGOELTh3rrM+EW9tB1koLKJSwRF5O73w36d9JUnbeAYl4JwUIgRffBj93l3U
         qrSL02WO2OF/HR3qDegFHsE9M+HRGJPaF2lou6iiaTbyaRZDOO+daoNBVbSHxcTlZdwq
         2sATt5c7JGMT513GWdpWas8cWJy/tCn4T2PJ5VPWmvnB7C3hCbG/Ay+98Kcqav8wwo7h
         we2nDih1HsGAZ4z3OGzn1zfO+zmYmsIfcNHnjTkIMKgEfIWGCBTuPmqCwqVmXwO58i5O
         2fxNov++DpXr5viGL4MskdSrudUxkcFEeGjpx2a7gPi7acB9e+DoV5+WEOv3+IE6+Odu
         BG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268452; x=1793873252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pI/j71t4VuCaLXQJYxfTinJklKy3KjSKz/+nzofH0A=;
        b=lA6mq/sGJhHy35EM7K6HvNslJWf3NcTWVnbdpvM7ctQf4KcEPKiGfIfmR+GdMOzA4V
         dg5RhV8eHIrLnYJmvbwE+GALSNnZ0JSRqzZ5YvGgm3reiQfJtZAOkVuwwApL92Dv/Fjc
         dxPmOfVX8QgzDaGnrBzDjY8nDXJQkuHi/Ad0HUpPJk9Pca9w0R1iGpN04uhyxMnxCbeI
         Mbc2Kzc4a6rn/jnV7OWwtBYFklO1zgGk4kJZMGbpTC3vyBG8wsVvsL54aUlHdmk/SsiA
         RE1NKqpUfSy7JsrWZViJQf2NqUnCO6Tgs7Cv3h2R5ebtfOsd7OQuQbU+sUYSirF/60cB
         qu4w==
X-Forwarded-Encrypted: i=1; AKwUvBw9cdseq56YDGG1qyPRVucRvbKMliS2ZuOB2mgI7jTL18ILZ0kqXEWE9xZsLlfgmDCyluZ3@lists.linux.dev
X-Gm-Message-State: AFq9FYIVFPOl4AewtssEN7FeOBr8NuxQUs4HfGdvQJcVjgQmMSBsyj7m
	H6PdXQV5Q+qyamvbcVqhO8Es1MUzLRtK9hONKctQbwsPP3q+wQ9JD3++xFoXNWaBCw==
X-Gm-Gg: AYBFou0eeEQDo+FFJuLUEdGsqadERFJVd+eZ81qqhxST5JKik9KIPSXDdtbpnRZ3VlQ
	Ed2lU5s4lrJDUd0XGZMQTeVyV1Siwd24bk8vVxSnRxao8I9M7agRas6ZEiQ0et9fYberfVQh+5e
	UOm/CpX2iTKw7vR4rl7og/fldcNWvWmus4qWa83mJ6gLrFRz4l2ChutXEtGxKShbRRiPUUslG4I
	dkSJXU7DAGP7XX/593MDqAvRVTwPX2SWLkafR2Kr9+FmM7diAbkVfPynMDQpyJk8Yd8cf2xPY+k
	GA0rwEiAS7iPRN749BRteBJ2KAhBeFD5PX67Cw5Jjasr5UmHv2QLscws/DMQdjyaMeya5n387fL
	TRtyJhyIohrsv4bAGWNkQJ2qqG+fqyHOZzmZW5f6ChfZ0r6rjB5OdEXEMp7rm2hYCwLP0X2FzAe
	7cOMHirG1p44+qW1apXGCu0TXfXZqcG26DILrtM4zNmpobMFLkZzS6UxlQl8RZou57xs5RsU4Vh
	zbMERqqvBo72Xs51KRe++kAvIus5Bj9ab4JcnkBPB7pedOPF/pkRdMCbUQE7udneEgag6wXKgsU
	i2CynB8uO3gT4ccfC9DtV0oV2oGRvFuDMBaq/+syi9SPJ+2pCwvOamUYg87c0VPrxeWW/+HtDwB
	qDAtB/htXmjv9VQHw/lO6xw==
X-Received: by 2002:a05:600c:3146:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4a96552d0b9mr101086605e9.0.1793268452134;
        Thu, 29 Oct 2026 03:07:32 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm11425165e9.12.2026.10.29.03.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:07:30 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: Danilo Krummrich <dakr@kernel.org>,
	linux-usb@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	gregkh@linuxfoundation.org,
	oneukum@suse.com,
	stern@rowland.harvard.edu
Subject: Re: [PATCH v3 0/5] rust: usb: host-side abstractions for a bulk-endpoint driver
Date: Thu, 29 Oct 2026 10:07:23 +0000
Message-ID: <20261029100723.4160932-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <DKZ34IA4DZAF.16BWFH4JPGROV@kernel.org>
References: <DKZ34IA4DZAF.16BWFH4JPGROV@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending, the first copy went out as HTML and the lists will have dropped it

On Wed, 26 Aug 2026, Danilo Krummrich wrote:
> Well, Alan also said this:
>
> "At first I thought that we ought to have such a guarantee. But in fact
> we don't, because the user can at any time write to a USB device's
> bConfigurationValue sysfs attribute even if the device isn't bound to a
> driver."

You're right, and the cover letter was wrong to lean on it. I took "an unconfigured device has no interfaces" as an invariant and it isn't one

What the series relies on is narrower. Changing the configuration destroys the old interfaces, which unbinds their drivers first, so nobody can be holding an Interface<Bound> while the device is unconfigured. The unbind comes before the change, not as a result of the device staying configured. I'll say that in the v4 cover instead

> On an abstract level a USB interface is a device that is operated by
> some driver [...] there is no layering violation in shortening
> intf.device().bulk_send() to intf.bulk_send()

Fair, and I overcorrected by dropping the patch outright. Io already borrows the interface and carries the transfer methods, so it's most of the way to your IoDevice<'a>. For v4 I'll make it that, so no I/O path hands out a usb::Device<Bound>, and keep usb::Device public for the calls that really are device level, like set_interface()

On IoWindow, my question in the 1/5 thread is still open: can the lifetime and higher-ranked machinery express a window that closes and reopens within one bind? Suspend/resume and pre_reset/post_reset need that. I don't want to hold v4 for it, so unless you tell me it can, v4 will carry IoWindow with the Devres comparison dealt with in the commit message, and I'll rework it if you point me at the right primitive

Gary is also right about release_driver(). It's gone from v4 and remove_all won't be coming back through this series

Thanks,
Mike

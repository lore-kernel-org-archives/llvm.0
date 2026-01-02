Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43722DFF04
	for <llvm@lists.linux.dev>; Fri,  2 Jan 2026 11:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351885; cv=none; b=sZiDzo6BYf10vOmpcbENvwBZruJ5T+toIMIoCvUNZeuF92mQ4FQMzE2cMmMWb/CJ733QZa3OJYrkEaxYvgWQ4YONIrjpu2ZaMfrz7khmVD7V32c5yMTVvTTda8lo/wtVuy91H2PxXawMj57gV2WKL4vEez8WIL01NSx6rqMrDe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351885; c=relaxed/simple;
	bh=wSApN7eIEmxe+ZlkFun1Wolx+BI8xxAaYv9APOnMXbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpyAz8k3ufIGIZ2WpN8+mvMMBFGlSjY5pHVWh/jEajpAyw2qpt4jqu2wdCa9h2EgkKVEJjnSFCDmBT0FX+tFG/+D4D0cU9V0vFJWgX+tYIIi0XCEBZNGkujYbV2ApVJdOIZON63A5gRu4cxIoT4V3ptOLNtgt5VDa6VgcrGhmg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cf09bk6V; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cf09bk6V"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a07fb1527cso30758605ad.3
        for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 03:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767351882; x=1767956682; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIDs7EpZgwjKHQTJkjqicwJWn0vuoECrubEqmgA+6vU=;
        b=cf09bk6V1/5JQgOtq3+wy2MtJ+OmgMzkbJDwwigKdMPQ/W7iVgYy8HyUymehd6ShCm
         oHwRFqEUSf0mYpq6YUPcLjZlpJHQhwdd7rW0oHRH1y8gG7Oxm9yfU/Ffgb1ZJa1NLlNW
         a6ElDhTzvTxqOlESWtxfIaFNY6fJ/DUDbxMFYdJNr8R83BDQKcNQh5+411/1OrhU/DQB
         iQtVKq3TAPZvwn2s0+6Q55EemFa2XFzo20HXtz3HaqgwteFCzvjwZPZtoS8RlyuAmWZM
         1zoBlsPqVSeFxlNP34qKSwUXPEvBwjRpb539II2XOE+kLGnakJpt6escFczR0oGmj87p
         5++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767351882; x=1767956682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FIDs7EpZgwjKHQTJkjqicwJWn0vuoECrubEqmgA+6vU=;
        b=emvrpqjYzEV1nn+pUVExSL9jk+I0u47Fnue01bcY1Iu8tRxpyWjRpXt/ALbWEfbdx0
         mFNV9ZA4iglnVFZNJrGjKchf6OxQOpMXGxJeW59SsZ139iArC/Ej0696/5bw9ilQo0vQ
         q1Z+M9K96roC5elfOawuLL7gmB9jZIsttyPNhfAq7O5g1WfPeJVcUgq7E07yq6bBpnt1
         yGABeMm3P+9WwGdLzLljL4NpGoLrl3xTP2WPFrVF7HTg1Eh3HTB6i0XhXQCLlsm5C6XC
         ns0VXmfhLjEPuLMM8FNPVoexJjbdQWeWEFhfML3MRkArkNmTJzcFKM0PMAB7ZXsF6fwG
         I4CA==
X-Forwarded-Encrypted: i=1; AJvYcCXzyVzovlmaKoxzsL5AQW11S8SjOlzXwo6paf2zvX8I8ErW4KuZRCbixXQebad5eYaE/uc2@lists.linux.dev
X-Gm-Message-State: AOJu0YzKJpqqCFKFunsGMfuCey8Y8Wj7J5bZR6vPmpyRpd77TPUqqJPb
	beHW2v40yECdTU3JSDsaWKy9GIQ+KJGlWL1W2IoUdqyEHf5sgv2I44ahymgxqZ08DzX1MHI/PcA
	lVQZd83JFxisvq2D7tM9oGD4aarzEhv8=
X-Gm-Gg: AY/fxX6N3xL0AWna93UF6ZUjsjRnyts6jDiHx03UbxeOSrB0ctRg9v/zRVgYAnDX9ay
	FmX4KnvVBPN/YHrFQ9KIMeUyR5635NGAtCKNOQK0UYNhiSd0xpZjMW5QxZ/poA0sIT0onCz43nD
	CbOnVRzfpNz0jOss31wZjM4YAwfwDz1tv78jnHw+ch66SMC58bFPNsJQDET9+RgyiL+Ihy9deXX
	hFaFXhnJaoGBp+EtG4Ibc052PsNtGXaPyk+UUyTzwCuHoCBtTX24XzsfnrxNY8BK942K8KMhIAe
	Mx9zoRTUTWqV4Q75pgwGzUgR82gXRkxl0c6nqGF/mTfYYF1sUq694Yx7l310IpQS3yHzsIEbhBB
	LYYNPsWpBIHdd
X-Google-Smtp-Source: AGHT+IEZHP2Tt0L93hKtfLRSYNZV76m0YyhGtrMg6HK8YOKF7WDdzMO7LFlzqH2gnVcYBfD5MuH9A9W3GVedPNVkD/I=
X-Received: by 2002:a05:7301:1509:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2b05ea19892mr15172023eec.0.1767351882060; Fri, 02 Jan 2026
 03:04:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org> <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
In-Reply-To: <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Jan 2026 12:04:28 +0100
X-Gm-Features: AQt7F2rb7qQrF04KAinb0u8Ra4qw05S31gwaEul2jMZEj1pMA4QwOapz60W1DHs
Message-ID: <CANiq72=jRT+6+2PBgshsK-TpxPiRK70H-+3D6sYaN-fdfC83qw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] overflow: Remove is_non_negative() and is_negative()
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 1, 2026 at 9:13=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> w=
rote:
>
> thanks!  I think it's a bit sad to keep code only to make some checker
> tooling happy, but for now it seems to be the right thing to do.

Perhaps a patch to add a comment explaining Vincent's findings would
be a good outcome, i.e. explaining the reason it needs to remain in
place for the moment (even a link to lore.kernel.org to this thread
would help).

Cheers,
Miguel

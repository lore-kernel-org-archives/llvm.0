Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13233346AE1
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853866; cv=pass; b=P03KyhN6/U/E3S1JZKxIikETSYgKUTedapTfRuR8jUjhRfktklmWWGxgGSnrmWpNZaNYmc/kD8m70O1Ojeo+n0yEaiMcoiU2DcXg85h4WWZXp+Elcq9KiBQCbwK8tfP2ClDqsmzt4SXGCUbl3/LNKCWT175WugCfttIgtwPq8ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853866; c=relaxed/simple;
	bh=NJA1sq/ln9dMh5Mms5930cfc/m9QjnEPzuzbjOo5u+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQtlWZgGqcRxDLbOHCYgc4kR9I6UGdU7ZTEEv7F43KPU2L4eCdaHj7reB/iryQ34P7EoKT9s2sELd3+hKxBWFjv4j+BiQzrWxy5jzm42t4XelIiZ548A6RwifEzyzi5UKLxdXTVmvbs7zcKE0LOJfzQVHHj7sMKzbRXLL8IZDM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKzu0TUi; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKzu0TUi"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c8ed67dccso249946c88.3
        for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 03:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776853864; cv=none;
        d=google.com; s=arc-20240605;
        b=LVzN3WQge+nIeHz0IkVi+h98UMNcnO24RI4s7dvx+ONT6AeyDa0CJRrCJrbIwfAga8
         bxMVZVQn3x6wKlNfu7HnHhQzIiLrc/3kWlQ19gXys9VovHYYKMqqMFeefLL5fHUE2lon
         ZrK8jhvSUefsYfnwh0c8/MnbQ0VWl2ec7ik6HlSdDCKJtmnoRBpPM81Mj23NaRV+uj86
         3+A5U4F+YT8wbVUfLjRxYSFHmHYpr56M9WPpCYSv9WhVaYiJsNMaEYHL2Ao02ulXBYle
         ygRU8EuxfJFzntAesVSNlGwOAPoazT8v3CFCpOUhJp8H6X4pKV9t32E5jWfTjWw/8knz
         W0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NJA1sq/ln9dMh5Mms5930cfc/m9QjnEPzuzbjOo5u+0=;
        fh=sfUgCzg3Fe0PNoQII2Y5y6CcgU4I/PhvcEA5kBKn7+Q=;
        b=ST9B+26qGjkrxFcw1RROMuBEmXkSraz9fLXtggpwJknAmN5r3WPFEX2y0gRDQyUeq0
         gKThxywui1pvcR9ss8M10hSZBEBM1X9Ce2WMIDV2sBb5KGjk9j2cUtlJJQbFGYEYA7SQ
         Pj1XNMDKKltKc9CRN3gsURKOolufTSp9N4vEDhKpzOM4I6HijuqvEpAv1uhYqLADARzS
         xXS0Rwd5LMCK+++DiSAfdOwed91iTV6YbDK8aYA1ugcnIwhQy4sq+rXTJ7bYNQ4hWevM
         AjNwxItQNshr1vkN8lwkGwQ1UDq3F/4HBNQPu3jiJzKjisumTCPB+5o6sMX/BYrYkqXa
         SukA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776853864; x=1777458664; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJA1sq/ln9dMh5Mms5930cfc/m9QjnEPzuzbjOo5u+0=;
        b=sKzu0TUiDtaAlDyo1XdeRc8a4uB5gbtR0mi8ELT1Kq5InvIk6p+De4DpFrjZFLyfqa
         Ga2WrPMqVbzNwpsouV5ZiLXULPfxvxXq5Xw34RsKU/bMeWf87IpQYWt03DXEnr/5K+9B
         2E4ojal7jaRnnUIGZWKtKip6hWXGrDaAYqkcnLhByHSEDRTXCvRD4g4nQiCbmHNVKv11
         fTyOdA1TOlv3gH/itXpT2+LlT4ZWhzy1LKE7kgOeHL+//prrBVu53F8BrDEEwhacQrM3
         OJs52g3ZGXID2eg+eU9huiJESmCJn98NPpTHQk9vZDl5Mww3ThlWAR7hc7KLSuBxHWhz
         /p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853864; x=1777458664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJA1sq/ln9dMh5Mms5930cfc/m9QjnEPzuzbjOo5u+0=;
        b=KAb28mmF/Ll8GuLfg2RT9YktC00e9bYSytZ/nXW6VievMZFIDNXLLC0Kt+Qi9dWKFC
         O3tkw0zTSv1ez36ZjfXcOp9lA9ISet6NCfCzwvDUHOee8yWgNJoagOK1in7n9rsQ7Jxe
         GDU8nLE55NT+JwFQkE8o+fiuFwdWkagCpsYyEkgUqzqv6Qc57jUxVb8hIyrCqplCOnsJ
         TpPzxURmZgnsu+3CVDqIVhxhN1wa2kUVQZv13WH1lMuvFL9A9JEGF0fvr5DXOXWCBtxp
         ZYSE2uzR93hsHP/uO32kQNT+Mm5qsWYaAlI9Y2gXt/SgIBFPCJ6jwdMjxuqQhmis7uB1
         tXtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qwM5hQtMs4iPM5OSmeqUFQkk6GMKQUCz1UINu1DpTquDOGu5A/LmkmNTgtBjsM3Su5D27@lists.linux.dev
X-Gm-Message-State: AOJu0YzdTJyrSThuF/fZ23e3xzvJEsyaznDl15+Dm2v3mqyjtpLTk+FV
	T2X6K4SmmzJr5VE1uk8YNS/+ZEicjfcDBBE01KuhcigUjmvoVHM07bUhlReTgIY5SFp7g33fyrw
	qznj4dS2cv4QZyqcK6WDv25Ayey9/uEI=
X-Gm-Gg: AeBDiev9GJou1b9h2IuW40wd1n+A4Mx3cfQ/FAHUi5OFy9mfQrm6bMX5MyT3rMSwGNM
	kR7KtuqF6VI9VPbJU+H5j8Qr92rf9snbAVZ8l2p61/s7LeBwAwaO+GxVidq9xcWHLAwL09xe/x0
	S+tPKXhY+814x0l6UOQoksGK+wNOfgVH5ywHw6eUVMsR3EVON7Qe/1D/FH3A635pIQqyxRvEBqt
	NzrfvIkX2BqvA7JnnUN38JiOVyS3atKj0+xA+voWRy8hvPQjSBJkkIHt5RlSp8zEbf3LQQyxE1H
	uPRQta843pOUZcSsUpRVl+HJIbL0dAhpxVWtNfwwWPpS59h01+LA1RfNEtwtNp9+4ESEK6FTM4+
	dxtF3+EaDgA+NE+Io9YYU3Co4easjNPazpg==
X-Received: by 2002:a05:7300:bc0c:b0:2d9:6373:ace6 with SMTP id
 5a478bee46e88-2e479e0cf48mr4606902eec.5.1776853864323; Wed, 22 Apr 2026
 03:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260421190351.1976329-1-elver@google.com> <CANiq72=45YiMnJiX-73gc7Y6tVTs3fzmVDQ4WdRBQcgqesYFAw@mail.gmail.com>
 <CANpmjNPiyXdQnEXw=YbCrj4R5+8CvzNPX+C4gNaqW0Kjj2-k5A@mail.gmail.com>
 <63e461c3-2d8e-47c0-9901-34b53e53f22b@app.fastmail.com> <CANiq72mzmrfa8-7G92xOdg2sqUgLMdzY_P8THUUYXcSmFCZ6dQ@mail.gmail.com>
In-Reply-To: <CANiq72mzmrfa8-7G92xOdg2sqUgLMdzY_P8THUUYXcSmFCZ6dQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Apr 2026 12:30:51 +0200
X-Gm-Features: AQROBzBFYeUwX7yxlggv0egaP7gdJkYKsloKxsFt8oiP46IYxvKXxBCkXRAr89k
Message-ID: <CANiq72kZX1rqccOqg0YUtYZDv9Qy3UUQOfe1hUkd77-XSrqN7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marco Elver <elver@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 12:25=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Which is exactly the one we use in #2, indeed.
>
> That makes sense, thanks!
>
> We should still change the number here, because `__has_attribute` will
> pass even with GCC 10, i.e. since someone using `none` without a gate
> in Kconfig or elsewhere may not realize the mistake.
>
> So we should probably add a comment that the access mode `none` is
> only available in GCC 11 -- especially so if we add the docs David
> suggests, because otherwise it seems like it is supported.

Either that or we simply move it to `compiler-gcc.h` or similar with a
`GCC_VERSION` check instead.

...which given what Marco is saying in a sibling comment, may be needed any=
way.

Cheers,
Miguel

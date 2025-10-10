Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DAA24291E
	for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 08:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760084391; cv=none; b=bpfz0Ofa1WIDV7PA+BLxWWT9OW1gfyViSyN9++OAfQ5OOZQBw9+f3/3Zb1ukfP5cky8QDU3AL4VeM1n+mvqN2GuV9dpHyo8VrZ4abrogjFzAsFZFOJOcLAclmKWq28ugOr/57UmMD3LbF+gN8tIkj4GR/+wDRQXfbu5RKYbn2ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760084391; c=relaxed/simple;
	bh=Cq5sJ7aSsShFxc17IH78w46REgBf/R4daQQ88MHxHWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGmz6tt1Staw8QVbO/VkHSUXLi0FLxpO1iHPTJA+R9OjuN0cOCPHI8Swzfcy1MgTS/03mr00LN4GDbn6gk59mAXhwrOhGgI5SRSo8SHlUo//YtGWTHiZ1b3ZpLEg5hd6dAjWkq8q3ri37YMhXMK6BbUZoZwUScYAXfzKYvN8PoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAQASiMm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAQASiMm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2699ef1b4e3so2767975ad.0
        for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 01:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760084389; x=1760689189; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cq5sJ7aSsShFxc17IH78w46REgBf/R4daQQ88MHxHWQ=;
        b=JAQASiMmzndZRplvCMenaEIybktdxfW1NZPZ1cL3Tb9z/aOKTO2mTCPC6ime1MF8Zr
         63dMo6oOIHwCVxp+bu3yhWK3u7ckauP9wyyzshhmAWEu0v5ApbZwzFKazlQg3vQs2a28
         5AWPt+bEq8E8JkJ4PHyE+uP/Vf4pGeKMiMQi4siJ8QxByqCU1gqu3qbXCx9ApmQr35nj
         oL28m6gaFPrRmsV8+ayraXdmrfy2CKCP0o8a30cTjqV/R40G4dyax1wqbVxwtoREOHaW
         Qp67gOEsOnXNp2croC2LBTxDqVqsm4un5yxEnh3utEVhSUdUTCBpay+itHxr4dDUBnWs
         BTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760084389; x=1760689189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cq5sJ7aSsShFxc17IH78w46REgBf/R4daQQ88MHxHWQ=;
        b=PO6sq4s5KcAFsRQaRo+f3fKV16ttV0MQa0xGrlzBV8nSXJVPVbxXk6JigTZevLIobq
         39CokE3oiHSjTbbQkW3VbIkNloygMh9sDdyu+MlFWMk6SOEzOGnw1IcCVZDESqbhnUi0
         b0gVAMOSyBsZHUXWfTFHapm1gNAY7CMqQCUtsPiRYr7kbWK875bP8BbIz28A1cTvetny
         BMCb7fBNLuc9LP3Hade9yQZwWB5ZcjMxJeGy3u0lil25kHIdV2CEK52d1rvrOzOHqtJG
         bRonq9QY5nUPX0TiY2XZPJ1HdCeTeev23vuj52heqdIbsBi3JyjvaX6V5xJ/DIOPkzIF
         FYzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVvibDKNu8BtBHBc6AfSgIsV0R4IgY7RCEExzmp2BAVy3HF0Aojctv6wxtYbXvjiXFYHUS@lists.linux.dev
X-Gm-Message-State: AOJu0YxTB2w/ix8JXXVsmI6KkDbYCI2UYE9RuKR6bcS1vA3V7rBG5CPl
	OhTKSkdkaqBWDlI2biiqur5qZ2EcUi/3LT2v8gdZy0D/if2Ce0aC0wDX4KtWCq4jzk5YeiRs+YI
	mp9/i0+8UZrDeNXRRAg/nQLpq50KoRrg=
X-Gm-Gg: ASbGncujN2k4/X/hyJnGmhKFIrti7XoODAMRIiKPf+9Yj/O+uV+SAdQQ21bsK+uGNUI
	W0zwsxxSTEiMRJAus5gEv8z7zkYRagm2PkVWmcWpnClUEuqwJYrBiFDfOH9az0akSUGkmla/aQA
	hHvRom7DyviQ49O8M2cZYfwxwni9YHsEwCEoZaV/fDkhEeyhwnaZzpZ737+JwYnJmyFifrQHTVr
	rrkIlY07MPYWW/nPYFSpTw06QP+IAp0IMAr9d3+4XQH8rUYUSSc1MliX6ZBxhaK4NUgszasdBmm
	/JbVh2cRYsPLsnnL0BnovRbXmxZ1m1AMxUMbFZT7MgLA
X-Google-Smtp-Source: AGHT+IHsGqk0VxZVnRC6qblIgP8WmMkDMtg7G1rQix4D/f/fNxV3LDfDLnO6Fj2/zAlwLN0dYCpWL+UWmTlPxiqHxts=
X-Received: by 2002:a17:903:18c:b0:27a:186f:53ec with SMTP id
 d9443c01a7336-290273040acmr83793555ad.9.1760084389280; Fri, 10 Oct 2025
 01:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510100127.yuqhg8uo-lkp@intel.com> <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
 <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
 <20251010060618.GA80465@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
 <CANiq72kndiqwEm-OZLd6JumAaBy7KrzYf_rDjwhtw5Uh4vdTCg@mail.gmail.com>
 <20251010074458.GA91144@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com> <CANiq72mzrJNTe6aw5zJ_vyhXO1jDR96hmvQEXPkqFj=dnwSnSA@mail.gmail.com>
In-Reply-To: <CANiq72mzrJNTe6aw5zJ_vyhXO1jDR96hmvQEXPkqFj=dnwSnSA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Oct 2025 10:19:37 +0200
X-Gm-Features: AS18NWCOn0jUQlOTDgY6ZmGAYLoWjP7H_Q3V1N2lr7McmrZCKjd0e-TiKap1ODw
Message-ID: <CANiq72nkvd0UApjCYUcYu19nv+Ow2irz8WEPahiAf=6N5RZiyg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value `VM_READ`
 in crate `bindings`
To: Jakub Acs <acsjakub@amazon.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 10:13=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Otherwise, for the moment we can go with [1]. It is just a single `#ifdef=
`.

And if this becomes a bigger deal before we can start applying
`bindgen`'s feature for this, we can always look into imitating
`bindgen` to fetch the values on our own, i.e. with an extra step in
the build or similar. It wouldn't be the first time we do things like
that...

Cheers,
Miguel

Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4F01E25E3
	for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760079561; cv=none; b=MkmZ4j1U9dAN/dr7ewrScru0ZOLZwiblx8kF8snw0rpWAs31n052uRxBCcSFJFaAAPOEQlktJrKpjCwI9LNwHFFZJ/cfFBvohvxlojOB8DR5hvIGDHxbaD/8zEu8zfxMPOB8FY93AiiAhGBt396NmSUxlC0lbztWzfvKiSEqC2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760079561; c=relaxed/simple;
	bh=2dB8tTCAO9ji3Z4boU5e7IS4dANk0Sx09hvrwHzIYTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ytd+/V7XqAdCdNDXx31uSJ1bn5N13FA7Dp8wo3by0q1eWVcoqM7C2p/yi+SoUDE1DsxNHt/AuNABNVIVFP0dOxjOphaExouAeLSYXWc8HmZoE8VaiL2M8XPCzSaHPLxat4Y36JEYsVuEBGYeS/ZwfVdPe9/zPI1UQ4dTMLGHEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJrpBy45; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJrpBy45"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-267fa729a63so2888445ad.3
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760079559; x=1760684359; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/KsRtAPQyYYfQyL6T3MHYdC3MZg30zHcUpFS/EA2b8=;
        b=DJrpBy45jQ72ugpw+wS1yJKBIFoguKlKPSJBGKzSwnrj2qoPWSHOhOPOBzyDAIwRwc
         fWzBlDLZNnROwiZpwIsGVHeEQAHvDvOznnw63z/WWfCOSyEelimyCVquOm588T5sHqar
         oQM1fBfJd4veUh24a4hrUyqBexgQ/Y4tFb4H2ViOozQ6JGqucbFap8GwvPGlNxtnAm7T
         SeRSQdbNEOuF01a7zG633j1NQX7m/N45hPhP8v+QoNmJTgyYPmpAN09310i/2MHI08a6
         I2eMMTzoLFMhrhHx3EQ+fsnxoavd73B2VCP/chJSp5w9SqBvSEB4DS8Y4P7x+mI7Gcir
         vKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760079559; x=1760684359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/KsRtAPQyYYfQyL6T3MHYdC3MZg30zHcUpFS/EA2b8=;
        b=X25A2ME3zcOcBxBQCb+tf2kcCPpje++4YwJ0Ii3Zk17gvg+X9+fh/s2QQeWDiqFPN+
         KgDZHAwTwTCpfAC402LxDudU+/Zzl2ZkWh3pCPQo6FHK5NlBaOkrHm0VJj73A9GUVvFm
         Ysl+6x5mo8Pnh63Ky95H1h1tkgEmexmju6wzoTAMhTKjGG9znYHrCgIo3qBdzSp8Vk0w
         0J8Gfxsrp/Y9oA6h40B0LtIItZXXqdB2xJGOa3DaNi/HMTGx/HwGI2rzfVpBBvkcljB4
         EYaw4sfPBAPbeqpALfE73nCCI/K4+b3Hx4Bw6/JkbQ/ehydOogmKyyeITJ7MZtO0r2jI
         UWBg==
X-Forwarded-Encrypted: i=1; AJvYcCV+P43BdZkw3zOkR78/0RZJTY4pQxH4U6DP8rH+tzRJRbMTzSBZI2uIQgVRebT0a2I14Fxl@lists.linux.dev
X-Gm-Message-State: AOJu0YwGW3paMABCcH+GWfTzu3+CjhbB0BfpTKkHEBB3mT8HyCOd/7L9
	JNeiCm32zgmAgvqC78z7odBm2u6jgRG7l/CnrXxWIX9/RuiE+H1H5mTd6wsFCfB/T9cJSp9+yGI
	4g+5yJAxBC5U+7l0956AdNWKv8NlN+GE=
X-Gm-Gg: ASbGncu+HliEY2KicHEQrfWOt9+9SE82ICPbVAHMFPgVLnB7TFLXpxodq3f+BhjK6hi
	Jn1xUb9Vi6KoheSy5RIJN6agZb6YyCH7B/RflZ4cCLjaX2rjRwilT4VuE6PZQ9uk1iyY/lGdER4
	5Ejix/Fx1PjuNqKHzwH0ShCdlB2ZUUIVSdvNFB+Lc+xWimDYiUDmrWTRte0ljsZCVJ/YeBocaJv
	hX+aeLIATHThkfcleXeyQj2dM4761iDN2zLYfejBmzUIXU3nuosiKInXZUBwVpLNqJCpUTpV611
	IEgc5a+MgXvrq1ATBppd0QCcitrx2iWGyWNXaPyvjh6F
X-Google-Smtp-Source: AGHT+IEUQCZh2bXNZHQ88G1WlQFzYGLfnLI6ghhtXSvp0Cccxl6SfEYz7wbupJhdzFbhRIa9rBWq/hVI+k012AHDODc=
X-Received: by 2002:a17:902:ce87:b0:27e:eabe:7604 with SMTP id
 d9443c01a7336-29027449af2mr78609005ad.9.1760079559298; Thu, 09 Oct 2025
 23:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510100127.yuqhg8uo-lkp@intel.com> <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
 <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com> <20251010060618.GA80465@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
In-Reply-To: <20251010060618.GA80465@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Oct 2025 08:59:06 +0200
X-Gm-Features: AS18NWBsqvp1_UAZLl54SYhCuFPQy0caeuUUUgRAWv4x_WbqElbX_D_UZSSrijI
Message-ID: <CANiq72kndiqwEm-OZLd6JumAaBy7KrzYf_rDjwhtw5Uh4vdTCg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value `VM_READ`
 in crate `bindings`
To: Jakub Acs <acsjakub@amazon.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 8:07=E2=80=AFAM Jakub Acs <acsjakub@amazon.de> wrot=
e:
>
> FWIW Alice suggested the enum version and we discussed adjustment to the
> patch in thread [1]. I was going to send new version of the patch as
> soon as I figure out how to test for the issue pointed out by Derrick in
> [2].
>
> Please let me know if that is desired or whether you're taking care of
> it here. And/or how else I can help.

The `enum` approach is what we usually suggest if possible, and in
this case it also avoids having to replicate conditional compilation
on the Rust side, which is good.

However, using it here as-is means the resulting type of
`VM_MERGEABLE` is `unsigned int`, not `unsigned long` -- but wasn't
that an issue? i.e.

    https://lore.kernel.org/all/20250930130023.60106-1-acsjakub@amazon.de/

We may be able to use a dummy larger constant to force the compiler to
pick a bigger underlying type, e.g. something like:

    __VM_FLAGS_FORCE_UL    =3D BIT(63),

But note that older versions of GCC and Clang keep the smaller `enum`
constants as `int` (i.e. small and signed), even if they will pick
`unsigned long` for the bigger ones. Newer versions will pick
`unsigned long` for all.

The best would be to use C23-like `enum : unsigned long { ... }`, but
sadly we don't have a recent enough GCC as a minimum in the kernel
(GCC 13).

If there are extra complications with the `enum` approach (i.e. second
link), then perhaps just replicating it on the Rust side is simpler.

Cheers,
Miguel

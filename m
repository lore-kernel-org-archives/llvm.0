Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81073F39E7
	for <llvm@lists.linux.dev>; Wed, 27 May 2026 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894473; cv=pass; b=Eoafmgib6sKI+zhUFZMj2Gow/X4t4kys9XWmpmv2r8y79NvEeebeKsL+0KGh8/o+zPMtpiK1b+KgLGLvxrNtdsvMbQIxIX3qVkWQHbOefSlTzJrxhQ63G/GcopmsWKqFGfxLZr6vzJrRzbU4Z//rBbprE52pbDdJZK3U7dc8PNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894473; c=relaxed/simple;
	bh=WCwg5pbDRX2C4UbA/gW/XgKMt6UrtEwG+ztEccAsZEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALPWPW91MiFDvDWZ7L5/45tB+jMZ0zN+4EH2fic/lT6vqUC5RMuzJ56EVBjBAM9ArodKEFTYREz9tOXVTtnaPweM7rvRhhP1TcXw6SPQEG3EG7aokaTf6d99LjWm2nxU43NEExRLtLZBQIs+XYlXuFycfYw9oj99fnlnQAig+8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XeBgIMw8; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XeBgIMw8"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304c5605b62so49491eec.1
        for <llvm@lists.linux.dev>; Wed, 27 May 2026 08:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779894464; cv=none;
        d=google.com; s=arc-20240605;
        b=WPUnmgxJrzSMO6sqRrx4tEjbA8jsVgzd/ko9BnNldnhZNHOirDOh+JBwlGWz5xoW9e
         bPLjRlqST3ZjJcq95KRVMV1yf+Akl/A2Pxg1fJFlhDgVIZR51X45Er5RIisVoI9u2fEI
         2WUY+p9dimZkfXFSpUeDxZe4RiaSIJBKy6zRe4rqVWufuBVBj2sgPnKx1KEamUF6bAHb
         V62Tbsb8qrYwBOjTTudsRTB9E0BxXcWlzLJuxC6MjiTEBw+YcwYUz6kT+cwcI8UyKkai
         lJ/HHERnLReoC0zWoR/OpW4buhc8ILNiKOgeUaObMEEcwkye91AP02BBURwumAwrPaN0
         T4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEwnhib4nkvpt0rXfQJbJ57eMeH99vbDgzBLq1NOetc=;
        fh=jascpMkNyv4JVa+ZQxo3qddQaoC1RO96jAzD7YUC1rE=;
        b=Njx7KzRu4qydhq7ooqsLa+nIXlhpi2a/gpCgEZguknPy2H6kaVbbfiFB9czr9OgvRE
         EAOIRbh3EyOGe9DpCYPYrHoLLDQdnhDxJzXLgVF5xm8HfyIGzX2fyCmEyZmZmF87ZzeK
         w9rj6AMVEu0CwmJwd+rCH+MrlDHSIwhd3OyVeoUaDWmkN6JCWaGBfcMKbl6Z+mQrDt9I
         keZDWs45yWIwmv5Jy37wa6W1wLGG+OyFnSxv/POn9NSmBiakPzOvq32DheOoCrjb7/Ik
         SeW37Xca0xRf3THN7tPlLP/aWi0xvKbzJdZynPzb4oaO83Fj3hSkguy4MGOEUw0ZnaQZ
         0Ejg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779894464; x=1780499264; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEwnhib4nkvpt0rXfQJbJ57eMeH99vbDgzBLq1NOetc=;
        b=XeBgIMw8PERTGMQN81JpMCY0cfa2L+Gn6vjU4yFGCa1Uj3limh+myWHZJzcN8IY8cZ
         9LkTNCEG3udr0/Pl+1ylZ/ODcGxwnFI1CKXXptY6o0+7ILCeR0+IuSnf+T6ZCYG1pj8b
         Ama+QNH/Fp/NdPjd+FyloBjsPUgaI0d8LmFi0NeA9Nd2xh8peGDowS3d3dJ5h3vUYEDs
         NP3TEraJIz1DeRARmRph6IaUmFQ2WvoOHRoA8f1cwZFxUJqaz2kdbbFeacx6sjCGaaKo
         rdWGcyfSSTrdAfqpA6xkPy+azIDQNQd/lhwOjxKy9OmeCneEtwWjd2ESiFBm5HBIyhvX
         xrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894464; x=1780499264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZEwnhib4nkvpt0rXfQJbJ57eMeH99vbDgzBLq1NOetc=;
        b=YfOYqIOu87IXlAxJF5lTkImR2pQKA0wxdzbdd8oO3Wv3AhJCWKlGscSG+MylRKd/vf
         mwY06dQS1RQcLojDrt3XQ9DkrvJa0hj1aEPaAedNvLRHMvhiiILc5jXmtBNoHvxgOKMp
         xnDPIInGc9qiuZqTTQyjtdDSdTLCVjpfK1B9n/yLHv2xR8sLOX8+zfWT5nrGi8RJF6wF
         FTc+enANAXDaMId/U2iNsdqSSbdlkiz/F9OLQ66VBgk3ybSCiyOq8uAUk8gEHI4HW6XM
         DIB+G9cGIOud8ShaXWgFRltHxRRd+lNo5K61Gp0J6rG64ORvG4mb46lgIS/GSpirC1LS
         ROkw==
X-Forwarded-Encrypted: i=1; AFNElJ+OEAaTo0ryrSWC6A4+TRlNctEcsr8sVPk4FDofkaQkdnUyZ45gOnxOhoqfTqgR5I3m4Zk0@lists.linux.dev
X-Gm-Message-State: AOJu0YxdDRTpz9fBK29EK1/S66mbqbuGFK4Et9nUIfGKklbKarJJgj9/
	uJkSxbnUfVI7QaVheOUXaeP13Bj7xxn8XDc7NTWi56sahzDOmGhbPkdvFMvyFkoqOH7cp83RSHl
	XwprhVC5lMp5ebaQi0o3OoGx1g/CjFwQ=
X-Gm-Gg: Acq92OGgwfZUlhF3QJwsOu3qBb74/ULbuyWaCFEyF3y1B/zsp4F8wSpp9zIe6CoBAv6
	MImkPfPhq4KMFL8h/DBUW2QUzq2rpvkk+SGn0fs8HfLx95LX+NXm8N32kCOfOVXfrChYn15TVD+
	6JCeuUDi6d9m43UU0tbxpgbptM86tEv6RxdDxNj+j2N1Dtd22rf3kg/WrktTJe8Zdfyg51wF5Qh
	ZP37q1VLrgUf6DihAxqXXTxzodRHirdN97K8NR03p/G5/aJfpJXsJ4CHWib0jyTz1hrI3JZ1PJ9
	rzq2vQaQPVUakYUvrgc5f3uhhjXSuUaKAjFj0BENke8ye4WJv2elfjSp49JjC6GcF8d9xZIanNH
	pFpZxfXFX8VKQEm2d49z6jXI=
X-Received: by 2002:a05:7300:a189:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-3044911cfcamr4645170eec.8.1779894463667; Wed, 27 May 2026
 08:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
 <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com> <736d3bc7-9285-4c94-8a68-afb37ef27167@sirena.org.uk>
In-Reply-To: <736d3bc7-9285-4c94-8a68-afb37ef27167@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 17:07:30 +0200
X-Gm-Features: AVHnY4JNMs7kCdOvzHvGPMQC-7E9j9XJLu5GJN-qll7EskvBOU_qlWl50COP3MQ
Message-ID: <CANiq72kj0i+qUSAc-ZAQU=KtMS89miZL3=ni+b6Vrkeravo9rg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kasan: KASAN+RUST requires clang
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 3:58=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> FWIW this has the effect of turning off rust for an allmodconfig unless
> you're using LLVM=3D1.  That's probably the right thing to do but it mean=
s
> you might've lost a bunch of coverage.

Yeah :/ Thanks for the warning.

Hmm... Do you happen to have "exceptions to allmodconfig" for
linux-next? i.e. configs that you disable after `make ...
allmodconfig`?

Cheers,
Miguel

Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377C02309AE
	for <llvm@lists.linux.dev>; Thu, 27 Feb 2025 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663601; cv=none; b=iWe7lTGWgxxBSQs5Hqgbs7r0oc3zELncnSoIHc+GHiVsBqC1KvP0XEgKW1Of1luQiUe6NzlmUJGPBUDR4MYeu+drnzPTnGvdbFY6rn8+JATKa9kJdQwbQGh+LH9RSeXqCO8bXUGpdzY+SGiekep878IFKqXL3JKdvbLqyeInq0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663601; c=relaxed/simple;
	bh=2cSgpAMzuRDyg/OP6JlvBhgcN9wqw2ZkQw1H+nq1MIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFXrWO4qmZXfFXdJmRtoPG0HfmskUasnMpTkw1ZJvqtS9oGiGzRJCTaoZFGnv37xtFSTOkWDZZpr7NamTp6QneK7U6GciCgrxx2Q3eJH/zBK2eLLTHNA3BO66MOm7CXAjYpPeiCi7FMX9dMolW6KCNYZEZ6nykRDp5wfDZXxM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbBpFwqM; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbBpFwqM"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-307c13298eeso12196441fa.0
        for <llvm@lists.linux.dev>; Thu, 27 Feb 2025 05:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740663598; x=1741268398; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0QqIj+Xj2KKd5yOn9wT3FKv7ilH/QlR+xG09MXlqr0=;
        b=gbBpFwqMFZ9VagA8IbQxcu6kgqfhR34hFhbZ97BEPVJk1Vwy1kFzY2Q6EpgMIwuVP7
         htreaD+iU8yaU5bYuQVIGIA9FQ18B50tV+26rwzggxRfrwPYHLrff8YkimayKvYajlCw
         teCaDBiSVVSHe18uC7wfWoSgIijSoQg1kH02ljaqP8bxxM0qg4ypRn7DWC1EtiqUKtvy
         pFkdrOcwIomD00mJfvRBVNlDSeqlur/WKKZy0JFGKCx8oAPmwTJrJ2dWo/uE5oosq/+d
         vBkgxc63YhlIY4rvtCvUlLFXfNxZeRTIdGW+vUoZ0obTnhscWeR05Rq7uivEWD687L6v
         zZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740663598; x=1741268398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0QqIj+Xj2KKd5yOn9wT3FKv7ilH/QlR+xG09MXlqr0=;
        b=h0nfs4iNjd1/dTGqEuj50kriq5+WpAfsHIUw/TmGsPeoG1OnlDVQjKtiIGqDObw4EB
         vKBiZGP3rjaOSVQx2XaIzj4Xych4NAhc53pF+8Hh7yyOwTG1eZa1h4C+nyluRiV4w57J
         VMgcevTR9NRHtJlpMWlo0zryRPqWev6p3DkyWqwMVN60cP2YIApzI/pD61tiz5yzunFq
         qXEre65g/VV/nD1+U8VJaq1affUEyt9hl+DEwtm12yZC5SRtLSVvgvHnW4oWhgmOBBKm
         aMep3mNmOt+SXSio8a8omJ4pyb2cf+kaSj4jmFl+KbXCpswmIQRT4XwMxGU2ajQEs9ux
         NxWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWoE5ZhiHHCLccyKEcBcItUwfyIPLyqAUD+4eDuXJnoZ4G54Zb1QljKzbeZgZJS8ug2jt7@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8WwPWc9quH2jW+yPOQhTdQH1PpuGFU4jKGvKr3Q/F2f6Y8qYu
	nvbd/8DiOKXvI42tMmxJuRlBfmC13dy2X6Exh4iahTwecicJ77Ca94zOCQbXkBtzHYNAz0rSyj2
	PbqEt+wVVZN7MlfzotXmuOFqANoY=
X-Gm-Gg: ASbGncswXxu9yKp7P4YbqIzFf+HIaVrta2dd/hgPUMHp0uHmSG3bYlBYNEEOGLa5tfB
	rdOXNlBb3Y7UaDZxZY6Zkzk9r1ywEthWLXPZgmCNgeJ8Rrb3HCvGvckQt9GTAiqNmZdAmKk4MPG
	9g/yBFdUTbMJpY2Dy7DwI0o3AH3d+E0EC7sMLE+whG
X-Google-Smtp-Source: AGHT+IFv8UCQLBFW+HmySTIopoV3gqxaBg5wvtyqxsA9/SWPF9AXdxTyZjDvJBXPJMy/X/nEAbqTXjvKUANVm2PlmXw=
X-Received: by 2002:a05:651c:50e:b0:308:e54d:61aa with SMTP id
 38308e7fff4ca-30b8464a2bamr20649531fa.2.1740663598018; Thu, 27 Feb 2025
 05:39:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250224-macos-build-support-xe-v3-1-d2c9ed3a27cc@samsung.com> <be5abg6u6wm62nhak7xrhtlkqxcekael6ztnkatwqxcil44x5y@p6yrbfingm4e>
In-Reply-To: <be5abg6u6wm62nhak7xrhtlkqxcekael6ztnkatwqxcil44x5y@p6yrbfingm4e>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 27 Feb 2025 08:39:21 -0500
X-Gm-Features: AQ5f1JrvujnQrNdPwimNUvnOfF-Py3f8kwIyufq_KgAHEzKnySZFBMMWJGb3ArY
Message-ID: <CAJ-ks9=gaxW2191c+K0E0MgjsQWLYoKxJZLxGb6RMbPRVHc4tQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v3] drm/xe: xe_gen_wa_oob: replace program_invocation_short_name
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: da.gomez@kernel.org, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Klaus Jensen <k.jensen@samsung.com>, "Theodore Ts'o" <tytso@mit.edu>, gost.dev@samsung.com, 
	Barry Song <baohua@kernel.org>, Daniel Gomez <da.gomez@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lucas, chiming in here since I also care about building on macOS.

On Mon, Feb 24, 2025 at 10:05=E2=80=AFAM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> Is this the approach taken for other similar issues you had? Note that
> argv[0] and program_invocation_short_name are not the same thing. For
> this particular binary I don't really care and if it's the approach
> taken in other places, I'm ok using it.

Believe it or not, this is the only place that
program_invocation_short_name has ever been used in the kernel. There
have been numerous instances of:

#define _GNU_SOURCE /* for program_invocation_short_name */

but never any actual callers (that I could find in the git history)
other than this one.

> I was expecting you'd take the acks and merge it all through a single
> tree since you received push back on the need to build the kernel in
> macOS.  Is this the only thing missing and you'd want it to go through
> drm?

I believe the other patches have been applied or dropped. When I last
tested building allmodconfig this was the only issue I ran into (macOS
arm64), so I asked Daniel for this resend.

Cheers.
Tamir

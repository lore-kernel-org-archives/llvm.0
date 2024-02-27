Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC7013B7AB
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709045264; cv=none; b=kGU4636Y/8MfirfHOFM+rPtzrEYxWap6XI14rC0tpWDAn5iINEQCrzQj3dnqrWgilS6QtH0cVNFu2Qakxck377JQBPfTndtl7z6TzNCu6gvoEna5AsbQrxenz1ATbXAmMF6BfpM5umKf1o5haDaDEnEvxSHs1r+f61+3Wxhiw38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709045264; c=relaxed/simple;
	bh=I7STVGxFEhzeUUnynFVCazQYTKSuDkuz5TcCbE8wTBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXB1HXQg8zsQH+ot9MzyRUgIpY6/ryWVloarc/dpbQKkMihy0M3b9aMRRbWQsO0waeZj/oQVtF+9VehWwN6x199GniBX4B5h4wyPPviOHBvSJpwGLkd8CzTPJ9vSubvsYF4j7h0qnOuHhNdcc+qAlNL3uQH2XwlfKxEqvdgrc0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxhYr7+i; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxhYr7+i"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5dc949f998fso3000639a12.3
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 06:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709045262; x=1709650062; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCy743fk4tyJkNw6DXsgUea2FahrCbo/h1GwjkT/m8w=;
        b=PxhYr7+iA3GGNrfxjjSPovQvpnz0VGcnqiuJ5dS+eKwtZejIIeuOZjXjZU6myUuYlZ
         C1wqGWV+im3yKb6bDitAQUeJ1sAJ2j7oK+XLXRwXOJQE9EZP5OTj/1z+bmaudUzOTt4K
         r4ZU61rVgowPzfYPgqIytIORsjQnq1CkylFP1B/rH/LCW7XqiOrr4S21C0YRnG1i1GLn
         q/vYdmZqlotrJnCCAEsiEcp4ja1kp52JEurtKAjGyAx2AbzadfvBMBp5fuvOxOwQcvHK
         GKvFmSqYEADpAj8J8K2Xsy4s4q0mZt4ulX6/joyZL7bXQ2xoL37ATugmXD5JDvf69xAo
         fnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709045262; x=1709650062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCy743fk4tyJkNw6DXsgUea2FahrCbo/h1GwjkT/m8w=;
        b=HWtt3lk5j12jDkg0ycyuPzOHWI92gGdvx6RoBcxwTOntSuk4O2ac8YAn+VpCFpkpWh
         nURyAJ0K/Xu7x12j4JnxtcKdmQPWXVCxRhU5sWA0LxqzEhZAqs6VtgqoC1z6l1nM3dh1
         N+in8oJP/opMeNKJImWKxlsLzBrZYKoRKNo6NvJMW9IVGVQ4VwDJ/ZDt5HlBVJAd8+PG
         H3sntcEPL3ZRtE5wdlMlljS59+rLgNo86VG28w3EEVFeomWRWdeGtWGiOGKiRi2Wgj6y
         slsiwteJHCmJnj39UJC9xjw+uX694+XeySEitAUR8gV48XidO3iMc5nCCjg/hdTvgsca
         D74Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIGCeusUHWhHjgH0hL56gjp7l4CuzCP+tsVJKQ0v7Asn+vptAwq3cpMH6v6TZYrQb5b15DUE4+9+k+C5gC2Cs7RBIcvw==
X-Gm-Message-State: AOJu0YzzY6X0d6lP1WIzQ9bf4ea0KbfEMvi/L1ENT0ihRkGU2dWzkbEi
	He138TCbqfAKycs0zwRo+waaMa0VTKK90B/V4fMHTmVdbDaRylaJvLFSOiknXPSAi4F1FiBx2qA
	jAr++zZLxmnkPMDICBseMVMxVyYM=
X-Google-Smtp-Source: AGHT+IFafpLdk0evJiKKq2WOgHZJ334wUaliiML9yKUEBDk7ieZRcShNP65NIpPeHhXYIz7pBy67jwjYFUhaFlkV+Ak=
X-Received: by 2002:a17:90a:dc0f:b0:29a:b713:8b27 with SMTP id
 i15-20020a17090adc0f00b0029ab7138b27mr5063628pjv.46.1709045262472; Tue, 27
 Feb 2024 06:47:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-employee-pessimism-03ba0b58db6b@spud>
 <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com>
 <20240227-resolved-deceit-4a59a6af5b71@wendy> <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
 <20240227-glove-underwire-f562a56cf2c7@wendy> <CANiq72=f03_bw9B8ww8UxHkVyP2F7ZPyvC+KWCyhO3Nk1yqdaw@mail.gmail.com>
 <20240227-swarm-serpent-2010b255f68a@wendy>
In-Reply-To: <20240227-swarm-serpent-2010b255f68a@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 15:47:29 +0100
Message-ID: <CANiq72=69uBBhKMrw5P8K6eDHPiwAw_Oj8g1aYcywEYhhUG8OA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on RISC-V
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 1:37=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> Looking closer at those targets, all of them enable compressed
> instructors, but we support hardware that does not support them.
> I think that means we are stuck with the custom targets.

Did you try `-Ctarget-feature=3D-c`? i.e. as far as I know, you can
disable target features even if they are enabled from the built-in.

It seems to work from a quick try (in userspace), e.g.

0000000000000000 <f>:
       0: 9b 05 05 00      sext.w    a1, a0
       4: 13 05 a0 02      li    a0, 0x2a
       8: 63 84 05 00      beqz    a1, 0x10 <f+0x10>
       c: 13 05 b0 07      li    a0, 0x7b
      10: 67 80 00 00      ret

vs.

0000000000000000 <f>:
       0: 9b 05 05 00      sext.w    a1, a0
       4: 13 05 a0 02      li    a0, 0x2a
       8: 99 c1            beqz    a1, 0xe <f+0xe>
       a: 13 05 b0 07      li    a0, 0x7b
       e: 82 80            ret

Cheers,
Miguel

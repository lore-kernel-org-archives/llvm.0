Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CA41E5B73
	for <llvm@lists.linux.dev>; Fri, 14 Mar 2025 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944135; cv=none; b=b7T83eU3SyvH0GfLtOzNbWj2C//515HXYoqmH9DRZXIYkHN/IZNR2ZXmrYYZUbkU0yrjqzMRb3QqniXoI3KE+R+HhGG6EzsPdo4LzyqGfc6kBN49Luaip0YLu7QjzFc+GO7QctX/AzpUMK8mgxCXY1Dt+wn8oMJ8U8NAGYyTf1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944135; c=relaxed/simple;
	bh=wSLy/tKZRMSxZhgOPYP+lRHCiDRNfSCHCfpnD1lPsyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoqDwDgx2g8StXxhW+rbXn/HEIfynsfn9GL/oHFQ8YaSZzieGUPXFGWB3CBlruybaiVG7GL2UwpKIsoECFkHx57nEtJq2utHk3m5ps5zLzSrAAzRGjmXaiJ9GEcssyAqpoUCMkw6COD4AmJQrhCMvwvbNihQkBUIevfiX/6qfTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hTE8UPMc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hTE8UPMc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so12460495e9.0
        for <llvm@lists.linux.dev>; Fri, 14 Mar 2025 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741944132; x=1742548932; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+KUI4Lx73PJKjwhnAttQQrPPQ9GUBTUAKyve2K4V2c=;
        b=hTE8UPMcmPu4Lz7LoqMyoWW26VYuCQqllBm+4p/3VXaTSbYjN6CTmNMR4612WA5DPv
         gCGe9IM4piBErs0kdlcAC+b2z/ky2MIy0JuaW3tOpBhsqFarAOQ8y2qBoTY1ppLcr+vm
         icX6mq1zctB/h/zeNMvPiXfVFXzatMJlWprv0C9yRZgGYWLMYnX0wkvC/HeCAp0Qdh0I
         lRAIbu5Xax1f7uWFP2IYtSDTG/UOsvISNSq0eE6BZgphz718z6OpZpfDvB4iWiw13ZAY
         QlkQgKtaP2MTi+o+Izh701+ElkmO78xWbpHoLfFd1tSNKYJWs3b0CqB8/EkmIh79i/yD
         8A8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944132; x=1742548932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+KUI4Lx73PJKjwhnAttQQrPPQ9GUBTUAKyve2K4V2c=;
        b=iYe5MU2DePoZnZwOmz4caOJRJbKWHZRIAttb5tlU7aCPB4jZoxvq8Xz0orBXUwnLF0
         VgyuevbRitdZiuWz9QisY6gtCEiZqe89S4o0prrnzgpi/ayOJZ+p5KKqxXFYsCdq3EC/
         PIjOcU8fnCEn8bhaiIPFk1ZJ5/Rh6Hc86FOx7TV9FKDDUixZbRcKBXppbDnIg/6/xF3O
         IZofCcam3tAGR7FGND37OQLnXQYGIatzFKZ5OJgHeUBMZQEboBxWT1b2WwpsPzvdpX8n
         0iAkiG4Q00J5YeS5mOxNNscTWBMsz23SCwwRRRVXXOvyIrnPjMdpuXe3PNDlSu2tOQ1J
         S/1w==
X-Forwarded-Encrypted: i=1; AJvYcCWzCJlftlYwbIEjBdBs1ERPqtprhw/sxM6ZF+BdYlF1UmozqUBQXZ7zljLKrmGk+UVn6GW+@lists.linux.dev
X-Gm-Message-State: AOJu0YwinKSG2N/nscyksSwyXP2ArWM3n+xYaK2vJT5gGn0y5qO7PZl6
	NFEdHzeffSUwDGG5g60RoTQiyjqmnswl2HTrqkDDfPDovCko5b2ufpH4Gdn19tRuK5YU4VOQoHu
	SDl2iwX+0NZKzkyuuPSHtjA7PlQVsNDIIGzON
X-Gm-Gg: ASbGncvshlUm77cdLxn8TPv39FhfAOIEmqspCirsTo6oTniatDBU9ddDgaShaiFAMbq
	vzbEsxBZW68JyBLsYibjn3nLitkLW8jYS+YXKIbyV+0F0KM17BEWSLfSlq8yPTySZ4rTdPxVPBf
	iQcJm0lGsQHulVTQtWFerHudU5/DTkqpVHtQP8sILSPAKN3/wl/jhKyEnq
X-Google-Smtp-Source: AGHT+IFl2389eiJnSvgHMzd88pzFUgRlQu1y96idOrhkkY6/IW7t5kMp6T08rutu3B31Z91o7d44iA6hdHEiErEfyWc=
X-Received: by 2002:a05:6000:188f:b0:391:39fb:59b4 with SMTP id
 ffacd0b85a97d-3971e2ae150mr2211005f8f.27.1741944131623; Fri, 14 Mar 2025
 02:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250313084525.773620-1-kunwu.chan@linux.dev> <Z9K3vokYu5osMCwh@google.com>
 <6c874a4f-439e-4ab2-807d-d0f59b9fe569@linux.dev>
In-Reply-To: <6c874a4f-439e-4ab2-807d-d0f59b9fe569@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 14 Mar 2025 10:21:59 +0100
X-Gm-Features: AQ5f1JpGzEAx4sBwjKxQGUxQi3t0tVfhh5Eh8mkLZ_0xoZt0Q9ivNhpJmJHKzV8
Message-ID: <CAH5fLgjErD9r8h_tjekZ+sNNDmkU3J3kcSmCG+Mew+-6zQq8tA@mail.gmail.com>
Subject: Re: [PATCH] rust: file: optimize rust symbol generation for FileDescriptorReservation
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 3:34=E2=80=AFAM Kunwu Chan <kunwu.chan@linux.dev> w=
rote:
> > * I think it is easier to read the symbols if you list each sybmol on
> >    one line like this:
> >
> > ffff8000805b6ef0 T <kernel::fs::file::FileDescriptorReservation>::fd_in=
stall
> > ffff8000805b6e60 T <kernel::fs::file::FileDescriptorReservation>::get_u=
nused_fd_flags
> > ffff8000805b6f08 T <kernel::fs::file::FileDescriptorReservation as core=
::ops::drop::Drop>::drop
>
> If in one line, checkpatch.pl will report a warning:
>
> WARNING:Prefer a maximum 75 chars per line (possible unwrapped commit
> description?)
>
> If no need to  bother with the warning, I'll change it to one line in v2.

You could do this:
... T <kernel::fs::file::FileDescriptorReservation>::fd_install
but if it's still too long I'd just ignore it.

Alice

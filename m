Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD625392A
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 01:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763947486; cv=none; b=op8oZbLeXA7mQkugrVeQQ73M+d9yUE+TgA+5Exd8wTKpxXCqAUnixeAkQzvEVVQIIMGciW87Q3GDMQ4NKu/hMW6E7BEfEJfRp2pKcC9kEwpMRms/U+Ldk7TSl9K8VpgvrshzvRlpgnrsMQ6dp4v5M5YV9fjXxr+4/UYt6OblmZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763947486; c=relaxed/simple;
	bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFBtJIqxMupB9kZsylw7yVySnYAP1Mj7oxBNSA895XYptUaey0vV3UwUHkSjvdc84Inr+U2m+SX+iJgdvpJIIdDWw6vz00oGPqg1CewKK7GqDYYmEN0SfbZadgROo8BriiNDyOkTMPxHG7Iv3IVSRNc7jBGwHBZo2k5ZhMCNC74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOIzQAaH; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOIzQAaH"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc07266d011so109835a12.1
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 17:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763947484; x=1764552284; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
        b=nOIzQAaHx4lpR4JLqx9Hznge1zTsnJYa90ftSUzoybS2kFeov3vdmmwcqUfXqWM9uY
         gEUHBaZP2Fx6H1IhhvptI5s/yigTqPNTWr9r7S04MoR89yroNEfSnoDjMi/qCZzBnZcA
         2PQQ5CGGcYz6V6KaoNhLDx/3apFaUBvaWUGeHtnqcPkhvVKh59Tmfc7tuPAIwGxh/RWW
         yZ+4KvLNyxKiXXJYpSNacKIucTj/9pM0hi7pdaLQMzM0rOaKzgFaG4moSmEFUVrBx9dk
         12LxvSYiwji1t6jH+Kmyy3pOTUgUrxXYxYCG7aNP4uomeeS3g6tEi9WLyHd9av7WguTo
         WQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763947484; x=1764552284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
        b=BjN7bg/aXWYB1kwAvyd5VjzLxJ5zr5R7ldkcqqFbTN5jJohWm+BPNPR4y2m9Kk5Bs8
         UnKuIHSR7ZQuu2lXzBSi13i6B/Sl4SWg+YSkjUqnK+ImTspqvsQNKOXdd0a96QBzFvbo
         3CNi4WQzkcfkdw8d7BU979Bj9de/29fpVXUIA5NnmPsk+7tumtf7TufV0/NOEMVsvthh
         lS/3lljaB1DfXE5ba3QZQczWjFKiuF4/aapHrfbXMinRgIKcNqQ0GyJba3Q8C0UPUh+8
         KG0lP7yTiyaoJecINmy6khdGfOfGqndAgBZ/NlAJsMO/Cuo73EguyOuOBaWlt6oyn48B
         INgg==
X-Forwarded-Encrypted: i=1; AJvYcCXLBNSQ8eW3tsbZHjg/PiPL2+/FWVqz4dpbv+/8OFIOw9ldl5jo50OrYRcN0q+GPWudC4PX@lists.linux.dev
X-Gm-Message-State: AOJu0YxD4/v8EyUbxPbngfgKIf0H7a+V1zrqkEY9CQ2pkBHYzbEx+wsT
	amtx5FwPhjAQuwhzhsDkrvAtCzuD73coe2HgJrBnMUcCH7j1JbOHaPJc+IjWiuW4+UMjd0Nk/4k
	MZL5NoiwueQ4qikNxP2B9uf45goqv+gw=
X-Gm-Gg: ASbGnctfN1ffK3uXol+TuKmJO+pajAeR4Fl8xE7yx2JvL/1qyoSqAPkKujwdk9YdzyL
	l/zgLFy10ZDRqehV1kPerH9ZJhQXPGi+kGZm3JAbIA65U+yHQcoQlFDDhuXlpgq3e+kL+/dCv3l
	HqfPdttsMK7cGtXV/FXtZTycxte6WHjQ6G9Tv0ToxZXPA0Y8O5ZNny5+WAiPbBQJu9EvaVJA5Cm
	nPAEcHoj5Vg9lik2Qm6NiLUxEcYToWBYPtlEHFfagvyRoikZBhnF4uJRBRcS32BiJYB1h+wXxlk
	3peDeUOnns3kNQ2XCxtsD+x0Y0ZMpRQuugENKCGvaPqyohM0hQpjxyZTYLxHGdkLHJZYMOr1DuL
	sdbFcgkcgdkbDjQ==
X-Google-Smtp-Source: AGHT+IE/FDIBNqUZA/G/+nKiTfBaSa9copxgf7FlXf8Svbk+fth/f6d611m28X3uKTN8JNKPOU1LrwubVCZnNZk0CiM=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr5377066eec.2.1763947483691; Sun, 23 Nov 2025
 17:24:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:24:31 +0100
X-Gm-Features: AWmQ_blKJN1cEm5aJqBoq0agAeCfqxj6IncPPqpzjooJxt-eYO2MrWfk7cdiYl0
Message-ID: <CANiq72mJqN09FvfjDeo+WBN=Pht74iidRxoU_JcMfXV6oMmKEg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] rust: generate a fatal error if BINDGEN_TARGET is undefined
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Generate a friendly fatal error if the target triplet is undefined for
> bindgen, rather than having the compiler generate obscure error messages
> during the build stage.

I normally suggest putting in the log the errors in case someone
searches for them and for future reference etc.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

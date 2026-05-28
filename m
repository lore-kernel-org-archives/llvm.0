Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F37318EF4
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 05:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945982; cv=pass; b=iSLBUtQy1R6kjk2rTDK+arfPwn35L5v4eXnUnZa61oo22fFKfl8MkIzpVu1hb2qBYzIZ1e4XIMUNd46Ubus2Wd2a59n3qoX8sq/EmhXOCCGmjaFcJPyEDMNUNtauYOh8Tg0uuyfYS5+LEplXkIVAQSL7Jp6LJYUHQTVCxJhl0VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945982; c=relaxed/simple;
	bh=wf88XchxCYIRzw5GxK/rHjVoB2l6TgPg7ppMUr6qr7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2lcXGqpIi/+IzZpRXLAeqEmLOVf14Qf2xnmw1odY+aP7DIDmvaI1+lHplRFbpognRA+XoXy9xKlKZAaQIW28lar1hqAMxs0/+zp8NDfrVsd84XESFOpLhsZ6KgoCFzwrCvdUYodwV7d9h4Hsf+x8hiT64m5IhiYYAe+MRV9MMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3FiLWv9; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3FiLWv9"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304559733faso509115eec.0
        for <llvm@lists.linux.dev>; Wed, 27 May 2026 22:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779945980; cv=none;
        d=google.com; s=arc-20240605;
        b=BkGW7B38uATYpP5vRqocT45Zr9bACGj0iohqIF47LV50fzcYP7qY+wGmieGo0keT7a
         8I4zEI8Cm8q7Ul/Du9e3K3NcWXR/Q8rZno91Ar6r1HNwlPfaLi0VDjGN+xJT7vYGCEFt
         L326wSQROKtCPVbrAGJvU9dq5DiilY2vwbkiMH+XuQz80e6iV6fQq0D+6BiqvI0JBTVo
         ivqLum88w9t9Qy5uG96dmoQoT5WFkYQjyHxR1os5mMzq5pDcsBBvmhszRyUt+iIFeOol
         VGOWPzvYGrmHVEDgU8Gv+tH/pygw0BzW3d9VV8f6uCa/oNv0G7ljPODf6Xg9XEC2/x9g
         99Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZPB+UbJ3xOm/x1ryseHShdbECkKLBZAc98p8FpEfJY=;
        fh=8iMUic8F4CajC282LGE+6tzAM1C/3OdQm4obUnOjO/0=;
        b=f1NwZptz1yNDqgwl8ox4tWLbSf26o1ESAw+gcG5sHouialdr1lp4MY2BZL/29u4ujL
         Sxxb+XXB3lKLWPH1VDbHGWPht2LfAkCSp9z8owcGv/EuxvYx63SILOZdwpF4PIM3bFVU
         XytVey170v9ZgNovM6KQ8Igf0XNBCwgMLXHjGI3htISXbFjjJAyof75DF6+SPKfbMTFA
         nvaZPg243hZfY6Q0K90NXtDNrQWJQDttsDJNRrTakdJyWs0qyei02ht94F+x1d80MOOY
         86IImoyKhOOWWfrphwq99dxtDuqlKhfmVe3qhlSvA0ECJk8oAkzcwRkoXoUj2SN8qOKz
         HXfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779945980; x=1780550780; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZPB+UbJ3xOm/x1ryseHShdbECkKLBZAc98p8FpEfJY=;
        b=k3FiLWv9uMWBYda2Is4fHrcn+NuZg3A414Q17fUBtavBirj0bJq069sEALoAL5SIZr
         Pc+ro0H9mwUdfI3zNa5YUA3YrHClc/CnL32wwv2heMc3XhbgMeo2Zsvhg2KWJXQ9xIxO
         ubWfRcWOv7vQkZeRDvDnUTQa41RDBvuuKUdC/2jXZVJ1AWenZIe3tlwqXinqioErxmIC
         fSDcat2n7Uz5osKw7CgiwzrXmckOxA5fgtx7TfkAvNwpHTX6pjGzv41ElC68PWzUUqhG
         YiGiV1Iu6cuUL+fzccTwNqhi7exUUVAN6Rs5dwCH3wENoe8KQPsWeg9VskhQX7chsruD
         YK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945980; x=1780550780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZPB+UbJ3xOm/x1ryseHShdbECkKLBZAc98p8FpEfJY=;
        b=eDLTcn3V+/wab3h4wrrNt3dyO/GRN0YGxdAJ0nqGy5IO4HczNMkIsvx7/gUUuWfyWF
         v1s7dNU6InGC5pEmqcv/olEKzGnhbz8ecV8/Ch0TAgEJYIs5rmSTcmUq1xdrwU3BqNdB
         Qc6Adon/RCVpJ7sZgaRfB2daUEER+5eDgyfec4JACtqN5tvMoJh2cmXhJWqG8GYnWstm
         KyMMG8cz+Oid8unmN/FNdKVfgPKZOCh3QT8bC2U153rT5qYsq1ATW4OydjsCrHnptWDC
         5yKWTRr0nnbJvVx7Uy5IQmEykwtiV3m9YT0eNtN1BoErUDWFxlt2rC20t6ISbWoUuCzP
         R83g==
X-Forwarded-Encrypted: i=1; AFNElJ8YLx987Pay7A+z99A2SJwN9GKEMXz0qIs//x/ECqecNZNlPBBIjyfR2Y7CslyiDPOHXB5l@lists.linux.dev
X-Gm-Message-State: AOJu0YzrXnUXzoveQYocEvt8iqRETn9T5vdtjfQeAjqHWkLaEzom8Qul
	99itofHEypmgb9SxMIc74L3qQ2vWOSulMpbm5pqA/v76/w75gmf0UvEe0ZiZoSun5fnzTFGEBmp
	2LA160r3AqWT/L8iHSNggNiGjZ99va+8=
X-Gm-Gg: Acq92OGnBul2Nq/WjNTdlPe5j7VSNWMVxb1p13YocYeaXvFxLCQ3CDkiinw8jgqQgOH
	yiIdOuI3F8PdHBE6gSUiIy9TKlT69rXcGCkvs3BYWm1unOsLwb196M4bZvbZSUhlHPrdhvzzNam
	B3kgRhwdWTPhhLkeXwArDG0otyKrlgAvYucUlDBaTjdTIytUVnErSBA3qIQEfpfwR3jpc51qW82
	ZSZ9pTMMQPT94ETdmCSF2SL+kyH9ALo5aWKs2t3bjuWV79WbIPXTt/lP3edka7Z3R9r8Mjk9S4b
	sToRPY2auhwBLiR7o4q/jBq2uROq03V0CzCWppk60x31EEtQ7gxXxxyJabYoJfrXTxsbo11X6jH
	Edg+GwnRbwXP6EOxnn06xoimLsJNR0RGVQ/ZJWaSkn7eV
X-Received: by 2002:a05:7300:df44:b0:2e6:b55a:76c9 with SMTP id
 5a478bee46e88-30448cf0ceamr5032661eec.0.1779945979977; Wed, 27 May 2026
 22:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
In-Reply-To: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 07:26:07 +0200
X-Gm-Features: AVHnY4LpfTWCciL-kun38xNZkmFlALMcz5bmeoJdgZ6qhFC5eHM3rUClaReGlc0
Message-ID: <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Once the fix lands in rustc, this flag can be made conditional on the
> rustc version. Note that passing the flag on a rustc with the fix
> present has no effect.

Already landed now, so if the uwtable one is enough, we could already
do that since it will be 1.98. But since it has no effect, we can keep
the fix as-is and do that on top too.

Added and linked both issues (i.e. `uwtable` and the `frame-pointer` one) t=
o:

  https://github.com/Rust-for-Linux/linux/issues/355

I have to send a fixes PR in the coming days, so I can pick this one
up, but if arm64 will do so then:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel

Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2715A275847
	for <llvm@lists.linux.dev>; Tue,  1 Jul 2025 13:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377336; cv=none; b=P4HklnK4I3VwQg0EHmuXeIBxuKmSCBy9CRdprfXK7CjA5OwBsG02Sx7bX8nTafD78UIk/nKpiz+bIZBP6EFmD+I6B2d1t0EKsMh0XdkLA8RBkxjeH8Y8dHG2Iy2dNVbbeFRbw+VhJmb3Xk8dl7u1N84gLp4A6FW7rhm+YsvFJyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377336; c=relaxed/simple;
	bh=l53+up7iBS1qHbvga47bs+kjEPQBMaO+IwNLLfxJzHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zs3qviEttahx7Lgtoe/2gI0twB7/O0B+xJ6bbGPTOAMy5ZnwYByEouCLIYnFzbz+w+gtaVOYGUbH/q7UD2TjOjCES9XNY8brGChIGXiHqMECirCcReAeWcgh7zWwMo2MCmnvPgrJsTVmNtBImu3KkBvXztspa++2k58rR0QWL7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=usEgPqFE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="usEgPqFE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so9327a12.1
        for <llvm@lists.linux.dev>; Tue, 01 Jul 2025 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751377333; x=1751982133; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l53+up7iBS1qHbvga47bs+kjEPQBMaO+IwNLLfxJzHo=;
        b=usEgPqFEnbV2pAWe1hJqMhS3b0/hORtwytgP7Ya+OJ1LxETjIl/VuzptnQ+5wspB4z
         5XOzVzis8ZNOwvmO4ZOiIumE+CWplOg0lMFXu9z1z9Z9/ML1LmwxHjDcIWouLsQupoga
         7oX2iMXMJjLapuNMsTV0/77AU2hT5wJE7opEk972mB6XbsdqETKZmS6ffnaHIT2ZFRjL
         oT/9KO3G1wm0D6yGwAfgb3J8G1lCEl6g9CUDcYCevikPC2lUfc75mMYRHMOyrDkT2c5+
         CFaPtHDcSJHy8kfbNBgueL8TpeslZbGnYrot9gYzkCKu27V58wF/fNaeszWpxCT/eJk6
         IEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377333; x=1751982133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l53+up7iBS1qHbvga47bs+kjEPQBMaO+IwNLLfxJzHo=;
        b=u3h1pQWb59QRDkCGkI+ft1TaN/DZygO1V6FIj5jNlmOBBvDIOqyFS77xSznP5DgxsQ
         MtQDF1Sng5ijAdfHWop93/hK+jJlKPJeCNTLTwBWRQAOj8Gc3yiP9joHRaD+E1c0QoEU
         CcH5ns06r0YSB8AKzEvEg5LpCxFn/wxIzcrd+8pYZ039FY9GDJvwCIjHJpX2EQ6IOIXe
         jCY7DLkMzT6R0Jdp/9glVxcZ+kvZS4RTKBXdTXX/eFGWLCUnNEtJVbtmLp56ZDRdtVkI
         TmHs8ylanr0F8khEIHHhpR/iNiBJYqtxoAYfk+iF33KmQXYGVjsQrjQ02w0YXqmTTSO6
         SmEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUh+P0ej1UWGqrt8Ciah6ubL6Ui2KQyPFiqhqezy/tSNl/lXznbo3OoR1s6A8kD9LUzy9D@lists.linux.dev
X-Gm-Message-State: AOJu0YzCgVmY6ZAxhD1kdLTfdAOGC/jMc5ZnohS2OIAQdA9ZVf4Ym9vr
	Gh9XTGpKAVux8uk6eJ6up+IBgd+4UBUyumwPjYKMUGHAMAab2YBQNLts1RAtTq5uEB1bcrCmUwp
	f67JbmB5WwsyGj+VkyBFk/a6GKhAFv6TBm+PqKqow
X-Gm-Gg: ASbGncsxMjslSCRS5ANHXMXAgY7xlm/U8Nzptgl9zp9yzbjW9nloV7qoGFj8cuq3ER5
	1HmKS5K6ZNN1M7yFXfD/o98bjGEWUmpEHaFxyE5913fzXlbU9ILGoatKi8eVo+mPd89S/EGHUCz
	aw/qm08ugklAb+cGVBbLlmEAOFy6uTy1eiQCmyKNcmz0x4yMmHq33JzwFxGIFlFe01FVeQjmUVW
	T/0jwLsBg==
X-Google-Smtp-Source: AGHT+IG8i4Y7S9H/asInCH7TGD9/vuiOqqrIhQdHNEBY4YIe1hmb0pRdeOhNZmNhr9/Rh8lPWDairwcma09YPdiesMs=
X-Received: by 2002:aa7:c342:0:b0:608:fb55:bf12 with SMTP id
 4fb4d7f45d1cf-60e38a44816mr71027a12.4.1751377333023; Tue, 01 Jul 2025
 06:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250628234034.work.800-kees@kernel.org>
In-Reply-To: <20250628234034.work.800-kees@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 1 Jul 2025 15:41:35 +0200
X-Gm-Features: Ac12FXwCp_bfivLffFtsPlz6EADiU4bpUi0pVVqVqpSbuvTlWBItorTjM1ha8VM
Message-ID: <CAG48ez0n1E0iuOxPe=jq4MuuP3w2wMSNixmfNmBbB89jyJBSbA@mail.gmail.com>
Subject: Re: [PATCH] kunit/fortify: Add back "volatile" for sizeof() constants
To: Kees Cook <kees@kernel.org>
Cc: =?UTF-8?Q?Jannik_Gl=C3=BCckert?= <jannik.glueckert@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 1:40=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> It seems the Clang can see through OPTIMIZER_HIDE_VAR when the constant
> is coming from sizeof.

Wait, what? That sounds extremely implausible/broken to me.

https://godbolt.org/z/ndeP5chcb also suggests that clang does not
generally "see through OPTIMIZER_HIDE_VAR when the constant is coming
from sizeof".

Do you have a minimal reproducer of what you're talking about?

Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8DA3D7D87
	for <llvm@lists.linux.dev>; Wed,  3 Jun 2026 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780504983; cv=pass; b=QescX+EV0kSekRT+3Mii0Rb5rtct3HaIk7LpLTAJKtPQN41cUuB2hKhXCiwjwzOc3PifAggUfV0ft4nFV3e1ntxsZT/8EEOyom9BlTVZrgyvb4PYYuscytq9/ch/MnZLJKaqCpYlWOGOUatocBM4m2DharFUk0np6l2+Jz78OZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780504983; c=relaxed/simple;
	bh=1AMJDBJnzFy8lH5AxoXrkGKpd5ExdwnDz/rNtrevc/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFbtbVy5z+Rlv3Dvn7v1rHRW1xNc0OgiN1GU9VUqiMTXy4CyJR35jBUSQpNl6pu9KaUwTRYgheHhFrDT2DSGFRSbR+17jsPP/Ojoi7ZgP2YYAbzU5dprCV/eZMia/p3f1wPtBdhWvlzuZv33ReC6TmDbtF875ZFBDFJfg8D3joc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kej61dCl; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kej61dCl"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so519443eec.2
        for <llvm@lists.linux.dev>; Wed, 03 Jun 2026 09:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780504982; cv=none;
        d=google.com; s=arc-20240605;
        b=Nyh6oQUWw+FqjrDywTXxNl4YBpsi6m7FqcZbw6aKKFKITY+LK0DGK6BbQpoM3H7Oxf
         /bHXfVYyZ/Mh8Ntpck2XH2oQwu9g3K1ETxYMclDPNEEsmjIX7YTjdqtQsyhKsp1Y8ZzJ
         pRVBCwz+5FOQoPgYQEtCselw4q685iRnThh88xwkuh4uWS51+ukAzmeLaxeXiL4RPOin
         ToRLIi9czyOP9B619/RwVW08Ss4darfnQ/NNPH3BpygrUoQ5MzKJhzzeRPog8VdupoHS
         fRC9oPo/TQyJd6lvL7Zt3xkvMIob9m8J7gzyCtXiTncoI0C8nmJBizLL3yqjpvKw4st7
         Q/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1AMJDBJnzFy8lH5AxoXrkGKpd5ExdwnDz/rNtrevc/4=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=HkDNbMKPDA1FfR19dfQqRaaGmdBmnILSVnnC6GGepQUvJ/gck31ux/kcUC8vkBJQLL
         qmsyaSlMUhSFKXgnSoQ8I4Wh9VMNg9+k/MKnbtFGWTLs3+VSArVSSlXyiN/a43ZxtQh+
         kIGhVBkUQ5Rl3k8FLv8wa/OOPOQT4ugeeEOMCoaDlJotaf/kg7gWzPmk3dPSNN44GL8V
         wFmVtUphsE09R2/FlRqS0rkaFcVScrblwqFitKC9U2B/r+g/rtJx5uTBQcOipmL5Dq3d
         LphCcCcenGKZtzKmPTPPTvZTiWg7Gv7oz2aw8T9fgg4ADh8H3KwJW4Nsy6L52J+f/E2s
         mugQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780504982; x=1781109782; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AMJDBJnzFy8lH5AxoXrkGKpd5ExdwnDz/rNtrevc/4=;
        b=Kej61dClM1gbG/BfNX5vO3FKjlo6kYPLd1ydPP2TGG7a3WhiRDkoCCIayY2X1wNsED
         QE8f7c5Po/chD0OIj2rMyt8Nlwn1Z8Cf3/0cbZYGP8sKH1dH8E442imtd4JXeJLX4Ypy
         B0kNxMKAI3ycg95+0TSVrGyYxbGYLglMOSvewCP/XxU/eGo9domMDFOS5IROOu3EhCLM
         5aC6xf28jUZI/1vS29cmfrYw1h9ii3bqeSZpuYgtjQ29OM/HmEoQF6ZDdoNqlatO1BKA
         CM7Zcq+vcU8+t474bqZfMvUMvMBtGWEE/9ZzegyGLgRdz6xMPU52T4MBG4jW+kdHQszb
         uAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780504982; x=1781109782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1AMJDBJnzFy8lH5AxoXrkGKpd5ExdwnDz/rNtrevc/4=;
        b=gEAnSKVATzlKGdhSjSgaJH6XzVmaswknK/LFdQVdaZyqVcNhPAoZIUYxzAae3qZEMX
         VJgAugV1qMA7JC/CBJJ9tv5dxzp4vpY6VjkOnJPm202M8rn6LSceH8akLAz5QeAkfWkj
         Rcp6JmZ0sN9w2lxjGYHqPWxI5Gf4hf9UW+WDaCUQ/PxR8Ot3RbUVPsFuvPXv/2301wWu
         ZxNYsm2X/maTd2Z88md0Rxkpp1CRLUqB+Y4fkp4rQ+xRyW6OaaB5t/9MhG2PxRXOFBEI
         NqaH/3Ujnoh2hwGkxcEaxZvOurinMw1YRf5Q2hSyNSigyyDpwYedTdMiuwHcEXetipTC
         lipA==
X-Gm-Message-State: AOJu0YzO5apnBWQ+R6TUOIWzlCSh97gPka9fkfCXwRMNZnSRX7LquoYT
	gBrR1ukqblyl5Sb6yzsph4AVspe89dGZWNcBWZaAF+GrI72UC2tbnRJhNrodABrEyi1KIi5MXsf
	MGi5lSZVujKbWAae1/SmtxRxSIGjhXBo=
X-Gm-Gg: Acq92OEWiPq0V77G7m22jjlgriBjpqI+ay0yKaPQhYbTP9HxRtxThuxiUn4vHQSPDGx
	KLqdK6b2btHKEaKa5mcWzJJ0fTZ6bFgLiA5VSi+oZ+mQvG1mEVtUhToWQBo0pTWfS0dH4LI6Ern
	+yVlCF2FthXBiKHb7i148iYDbiMB7NgXe56aE8A//NRCfrTOFS/Qu1qoLTbM2iBmZo9Op3UXI8U
	GJZSobku1WdLJWVnDgP9hlU+oNteKNu5vcU4Tf1L46R0Li4pBMQVylMfXe9cSyB7PvGU+pw2p+k
	5oHdkPlw3cY+qRkl7RbPZiuoK/6/orW68zAVye9sApjBIhSivg+FEYD+y3un/MrBukFFKN9Kv7F
	41EFdyyPUmL09Dc9a7q3wV2yJ4ywGTKhFAA==
X-Received: by 2002:a05:7301:1696:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-3074fa4f1cbmr1221005eec.1.1780504981819; Wed, 03 Jun 2026
 09:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602215932.GA1352412@ax162>
In-Reply-To: <20260602215932.GA1352412@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Jun 2026 18:42:49 +0200
X-Gm-Features: AVHnY4LYGJL8_QbN7RjIslqKzzIW2ru7W2BMyU1QX4YrYsXH3DYXTMj3EAhTZwU
Message-ID: <CANiq72mJRmCiocSs5eN2cYpvNOm198zNvHqW_SoSLMLzMvL=7g@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.7 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 11:59=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 22.1.7 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 22.x
> series is no longer supported.

As usual, tested for Rust with a x86_64 boot test under QEMU:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel

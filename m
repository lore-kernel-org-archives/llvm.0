Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6AD2066DE
	for <llvm@lists.linux.dev>; Sat, 11 Jul 2026 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774616; cv=pass; b=HmC2OtMOZIxWQoYBhH8mvr9MV5M3ajFaYIkFQwxur91IWGu6bslTck29LMTcZMD8ZHvGzRMrjy+JgBu8FbVSSMbFUFFrsQijKK2MvmzZU2L/EdcGnJLchf4FM4APXc5SFS3Kx4mJhPxMVMHUCaPaA4DQQZ21NpV/hsA3qk7rllA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774616; c=relaxed/simple;
	bh=cr34BVttG6VMuUWlKjc0l0poutE/RxT/K6tws13Z0Rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGe5HTeN329T73LrAaUTSGIflCnf03wvVQs5CZv9MgHl+TYuXhvtjd2gECX3Z2STypnI47xV3QCSfzzNY9pAt9NgtMfJKYp+wTa0Z46qQnpYpbVdML07tskeEIwNCnp6Slyg42n0W6kuwTio0bRS/P5dBiVmsW3Ytv1zgBPYn+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oj1est/G; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oj1est/G"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c988e16bb3so6189845ad.0
        for <llvm@lists.linux.dev>; Sat, 11 Jul 2026 05:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783774614; cv=none;
        d=google.com; s=arc-20260327;
        b=ZA+skQ0Zhs3qmqQr/z/9Td+fazJsNJp5QXvut4Ca57+BuAu5ipR4ZpH7eE7mKhgSIU
         VsBGD3RGdbukjt5YDw+8SFUlssZRmh1+YjjiYrxVJAepkjGB3lt0yQEBlKvzgDZwOkq/
         vWINGHOGwx7YPIcC4N06uvCVOuyfoNq8+Doez6kKG8IAf5MNHeEzSDIkVDtNYESJZcqP
         ZEcdL0vun7TDFCePliR70/IJ5hA2zeCbsbP9d+ZTYerQAqg8rKDGRtjPtLCMOgKlchTJ
         HbucJGI7OOD6mq7/321a7z/m0gH+YoRIV5xdKIl6Va0UK7PtL290FJYmQeaFHyFllGUp
         8gSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j6tjRunywnAeib7tZl4T028gbRZoamS1yIZMH8Mrn+c=;
        fh=hgRFtUWMalRePKFFuD+SzeFmPiamwZiyNJLcunPgLoo=;
        b=MX/MDbFJRLjAg8+MPzk777ytbe5MeyO8ySk7F9yRwGBXMKFesaJMEr4vejEPAFgXUv
         D2nXFWENINj9D5+UCFTEwI3SA+ikLOAuY4yLQh+eWoay02msKiiinSngVu6lvwueojDL
         2hLxMv4fC7cOs3gzsN1CsH2tBUYVCPVJ6vmjXJNBo7RLOqoNyJjr6ZIPg+epQ5spzieH
         neKONVfwYAvGY4AYsTv0cUxNNJLojjulem0AShehAN1SyWl4J5XfhDGAVU2+kncrUpMY
         p6i/WAwHfDHksc33mhOrdcuuMXX3cK2bxuBaXOA8eW8E92kfCCeuBv0spTQCSlFA8hLC
         oA3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783774614; x=1784379414; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j6tjRunywnAeib7tZl4T028gbRZoamS1yIZMH8Mrn+c=;
        b=Oj1est/GigBqI4xTMLEZt69xZFcjgzn/XJpHZt/Ur1UZMPHEiAlWrpVbfuSiWKKdeP
         /RXxXHJjXTUDGUI/6s6pB78XREUZwiFZkCXNMPNGQ+enDKYToR6f4t+7G9XvnrDtJvvI
         UC8qrSXnLp3TdueOdHMP/ZOalKUf7ba4cs0raXyzIrJ18ILjAxl8DT2ax+uqk3LOPnBU
         /V216JHd8f/12kfmCH1pN+M4AZ5GUTf9/oZgMYRY/r8rBjHJaXVDbtG9YktisQ0/owji
         rPROixWnv0HedHEpnmpHZ+g/TELKAJq3uNelEnGKMQeRssJp89DZVK5iZGE7G57azfOe
         Bs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774614; x=1784379414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6tjRunywnAeib7tZl4T028gbRZoamS1yIZMH8Mrn+c=;
        b=Issbmh16wFaRk14EuGxT9F1kbcvg251EzPwmYfdXlDxMkuUIgZqkKx19XL4bB5hAKH
         Xha+mBknwgASwdHEcCfRg6+ji8W+5WDRC2QAwwc28wdJKN+86DgmrTHRXfQjD8Tn0os/
         SNgb/NKyVKlpVsKtPpzVKflacyUl0rK/grG0qEC2s+jRXXmBhsSC8/mE/wLjpKnTxI3k
         byy1jDF5k9LOc1bvokw0F3piFU7Yy/KWxD4sjtVKjcOAAQKXFXliKv/cTtQNrnHsLgoy
         6CkqH0RwE27ij9oD/NgNNwHBMgNFcvVatEKtH4yJOc9RMMo+SEEC3Qg+AgbG5VLOHK+k
         mttQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFnKwqYAy/FsvtZRorzvM/z7jvNDPq+d5tjkQLFPzraDCy9iL0OfRqL7Gf5/GftrVwcarH@lists.linux.dev
X-Gm-Message-State: AOJu0YwHaNK7FquJ7JBA5aeVtFfPC1v+1uOM0P/+bfLo5Fuvd9kFwlIT
	ZhcEVnhsYBbJHFJLYLMFFd/fDqIiybRjv/C8NokmbxnNtbymbmv8fGFoga/mnzAdYsnmHnM4CPx
	/PTdF6KwIJOEM/KQ/HlEKmZyIik/Zfns=
X-Gm-Gg: AfdE7cmg1z8nmhDEPURyNNtMNOqzaslplAuVi+v/mklR/je2KdXUi9nf0pa8Y3CUzh0
	gx/IzaOlEc/UF/bPMwjjhfUOpBX5UriLw4wscXZi/Ye+Dv0QlZsPbLm8gsLlGdO18dps0ZT6TFq
	36+ewQsRJ4Y3zyB2mLhash+o1wM1ZID098DzpTiFCExZy2KzQMZZl5UNBbgT/NFd5YoibetNBF7
	0e73Sr/7UwDfGv215TUi4gWcOn1hvWquCZimSiTGdg58SEj5+GrLPBcNj5Kg+9cXEy7zwGHsS6Q
	KtL2eD6OKY42xkci8oVCFm2RauKZsFdWgk/yRJTKxJBuKwfYmVJcb6GrdkbUuMmxLkbIUD8Fd/v
	AOmvivpW/tdQp
X-Received: by 2002:a17:90a:dfc4:b0:37f:ea8e:ab79 with SMTP id
 98e67ed59e1d1-38dc78226dbmr2320021a91.2.1783774614151; Sat, 11 Jul 2026
 05:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708082454.1254320-1-mkchauras@gmail.com> <20260708082454.1254320-3-mkchauras@gmail.com>
In-Reply-To: <20260708082454.1254320-3-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Jul 2026 14:56:40 +0200
X-Gm-Features: AUfX_myT4Cl9iDVoRO-w6Sfw5_PJOQ6oQg6JiFlTfoXu1j8VbTkYVMyuZ_7giAk
Message-ID: <CANiq72nw6SM21M3y=xXd81kT+bPbctnpPVi4QGL4K2XUS6bUzg@mail.gmail.com>
Subject: Re: [PATCH V17 2/7] dma-resv: Fix undefined symbol when
 CONFIG_DMA_SHARED_BUFFER is disabled
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	fujita.tomonori@gmail.com, joelagnelf@nvidia.com, gregkh@linuxfoundation.org, 
	prafulrai522@gmail.com, nsc@kernel.org, japo@linux.ibm.com, 
	lina+kernel@asahilina.net, j@jannau.net, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 10:25=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> When building with LLVM=3D1 for architectures like powerpc where
> CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:
>
>   ld.lld: error: undefined symbol: dma_resv_reset_max_fences
>   >>> referenced by helpers.c
>   >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)
>
> The issue occurs because:
> 1. CONFIG_DEBUG_MUTEXES=3Dy is enabled
> 2. CONFIG_DMA_SHARED_BUFFER is not enabled
> 3. dma_resv_reset_max_fences() is declared in the header when
>    CONFIG_DEBUG_MUTEXES is set
> 4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
>    which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
> 5. Rust helpers call dma_resv_unlock() which calls
>    dma_resv_reset_max_fences(), causing an undefined symbol
>
> Fix this by compiling `dma-resv.c` file only when CONFIG_DMA_SHARED_BUFFE=
R
> is enabled.
>
> Fixes: 9b836641d3bf ("rust: helpers: Add bindings/wrappers for dma_resv_l=
ock")
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Andreas sent a similar one to:

  https://lore.kernel.org/rust-for-linux/20260708-dma-shared-buffer-config-=
v1-1-8c1571000855@kernel.org/

This is earlier, but please see his approach & Sashiko's note.

Backlinking here for reference.

Cheers,
Miguel

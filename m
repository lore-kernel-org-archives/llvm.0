Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793137573;
	b=bu/L2YECn4aTGdC8P46526FQf3udkq7gV9f8OwGv8f190r7TxguxYRzb2d5J5ar2oXXS
	 Ur7HZEFG7YtHdlIEcyI3kmgRFtc002WG2F1X1qY7mW/Yi/8EbGgR3ag0x4xnbFU2xwmnV
	 wl5qmK/S3rAHdnZY0XKmYmiwx5QmnukaPHK7rQ5t5KdVN0PjwX7256MSPZEAm4VTk9bVa
	 U0aCXCrm4MlGUEAgh85o/9eEGGKevNqd9DPWMK0yflJyYaGqYL9yljmFuewfqcI0MPYgu
	 K7z2Q6h4XHPDsTlmzn1HxnklH+EI5iRZwen3Qh5a9Usu/pRYkoQ6vGzndAUsWMbZd8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
	b=k1sbkVV1QvYvFsJalT+vJU4y+gwh+3IMWz02ognXk4iTgmd6jNRWaIFnlwZiAPkSGxQr
	 yV8NFyoJ/AqL5veRuW56wWUnOwamkqEHjMFlzggRrLRgySy9csFh9cBQty1qppgXbmv+K
	 lu/carkcjpXonGHDcZBOonTiWHcxherPvD6fbw/xl84tINWREGrKKhQTWoxFY2Feudabc
	 x8pbli1BjPxERqQWM9C+GvBdzZhJmCdEa9UAlKyDxVwYyZ4Gk8J3vn/iQr8m0M75oHx2T
	 2Y2KxhFTSJQsnlg4kIgygPiyBDGWiS1n0bKHrA+2HnA9ZvSVMmdBiiU38dpVX/oy84w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QcYdxwIJ;
	arc=fail smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5768606A31D
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 21:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5768606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QcYdxwIJ
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so531205a12.3
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 14:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793137571; cv=none;
        d=google.com; s=arc-20260327;
        b=LdXyjNfc096ihcBjCgZZLJxrwqt5phqovU/e7lizEAU5qgV2rLltmdM3+pyWiqX0aW
         jnhasHS0U0XHlTSFE/tcHnao1mK4wgG+f+LN1FZce4ZHwb+YhmRUd2XJuoX/ezn5vPQg
         5ZBS9x5T3zs4Ak0DNLov0u1SIdnmwzvGxpRTfuBwGjBbUNDmW8sYwG2op3I8tiaEZngI
         8E0tDBWMV96Aa4FvHoYIxuC271IbszMG3pD6QMs/ELMJhWrF5Al9kn0nUIb3RY0IF+wc
         ityo7BxmTXeoS5sYQtuSCRHfcN/UNMQYzQnlX5t+s17BOdXl3jZT6WScCyzlA4ZO9qhQ
         gwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        fh=7qxz5e3fZIQF41U4jqRWfS3AUUg2JHoAgYS2QXFMYMY=;
        b=b9+L/HTIIStW+YzQDJOCbPqHNyenTjY1Sf06TO314mPrjQJgGwX73u68bOToXhvamy
         irm65Qxt5UxHCXGmeWwYTA+m2Iuy9Wq2l19O0ICeHXrDjdfY47CR79ziRTXVHv/vMroh
         MPWFkJwKZVPlIWZ9V9Omf1S9Vvmy2jREMp7doaFPFhMXeQ5fLep6PRaUqNlwazDHDvrf
         G0/AmkFvdmltcGLs6+Q6ohSfiyGYNZl4MkmXs1jnH9DxDS3qz7W4rc5YqwRvyVtoweIo
         e/Gjxz0u4KxcWLgyJVqHUQeWK5XD0J7Gdks84e6ES0vhySIvT66+wk0BAwK96374z7fk
         eT8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793137571; x=1793742371; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        b=QcYdxwIJlfpC/8WrzTE2j52wAQckiHp34o+IRgcuAxEisQbyGsxRHZBTRazvrUvbK/
         rkXpOkT3mxpCFBzyJSu6fsBdXRWD20i97IXvDdjPOwWBwKA7Cg+Bc2iGQZGZtPkVcxDe
         VfKuz3ZrAvHlR0TU8Q9h/L0knrTQLFqlILXi7VLEKCWuJbuOlQEj7MaEN2LTWsgg1BuB
         WYenLTw26dvrwMEdcqmZyDRGhg7TJiFDFPUGGB1uYO+AmcwRDAnAhoWvR2dd2bJeqjRC
         h0ziViW5r8B4rXU1DwhhvjkteqsorhqPLdNSW+6VwRvn6F/Hr4+Kx5D4f8BNigowho6Q
         IBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793137571; x=1793742371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVSNb0KQbTxZM+AQXhdYZUTzoSM560pyx9+jZ9Z1qdI=;
        b=LUzwwRc+B0ybxpS0bMPWAiVFVx6Px1rTp7sY9cfmdk0hgnqB2zV2mxpOBpG4scYsK+
         zYW0Tc9ChcAPTi5FY0LjixchY9/UjxXibTRzxpiF+DynxtHNL/a9idwFjjH/oW06KMeL
         cvQG++f7uzjsTWHrKZ+18Mugxk5uQBQ+HBk+FQ3xNhFD4Ubu2Ppv0ho91OkOPzxjuBfe
         lwmXWBV3W9yRg0KWmJiSYyOD9JyyXKdkDkphk8x4WNB/eQ7uuXKo/lOh5TOmOvWMAdWN
         fyHuiKfXgEqLfjJph4+6ptOSA9b8O2+fiqu81/EGfRfVx03JCWriwtRokH4ChcsiQHes
         VZxw==
X-Forwarded-Encrypted: i=1; AKwUvBzeJK8tatxXUYQC1KuusJXbURTsVNKv5GhbwGB8nOfc7xFDyC4KXbak+OkAK4Khzuwfy8mj@lists.linux.dev
X-Gm-Message-State: AFq9FYIcaUHkoyBGb+XKB6hUjsEjRmGVTRPYB9Xds6lOP3WZpFe7SuFq
	iI5OVsOxF3eHtuJieYTVO/1HCGnRzs4ZTKsRBkid0CYLhNsoEm4f2fNtm5gNOFHA27EdR457Bmm
	7ayZ4aYVWkzATPrW224ClN7G+OgghDj2sAx14PFHE
X-Gm-Gg: AYBFou2qdruY1K0HEUYvG+kUgT1dLmYviLjRBm8y0UYse2HfJlEsnGz+yoYNLAMZVeO
	YgiwVSnwcbXFj95unfKq1jXXBLOKJsALC8LJfFrpPGQh33d4c3+yEj3vPzmZ/pt+tQ91uQrwdCO
	Vjlf2FeBpiBbBxJ+RrCN5i7JtEjxttzp/xaJz7v3f2N0ccxjwFnNabXFxUAbvGIV8ORn1zAyb9Y
	N1647EMLnfT1z6D4JZ2hdFKR9GY3WdZfAHI6d9bWQ4k9X3VajjhH94LMcES0edH+ESTFYiV4z+c
	Hqjw3PSutzPfIEKic4Cm77CQPPS3USNa1i9fghtVdCec44sgy0Ew6XUZ4Z9JaUJSbPyj6xcYYPX
	o+1lKmXISMMmJoHKGXoULim2n9TYOSrRy3wNkd03wnAadE4MTj3YaihuKS5EDr4oNIl4=
X-Received: by 2002:a17:906:794a:b0:c36:7579:fe6d with SMTP id
 a640c23a62f3a-c49bdf3769bmr41163366b.11.1793137570881; Tue, 27 Oct 2026
 14:46:10 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-12-wusamuel@google.com> <90371d2279a5eb08966a82325922e1f15eb93560d4019f5c9020956cadb4120a@mail.kernel.org>
In-Reply-To: <90371d2279a5eb08966a82325922e1f15eb93560d4019f5c9020956cadb4120a@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:45:59 -0700
X-Gm-Features: AclHuK8QaCDsAbnjPaGufNN4kMFz5cqAaOc_WFmJQjgBqVdaEIaSp_a56eCEZoc
Message-ID: <CAG2KctpuWLxdxB+LzrBO8eGsL2E0m_DphcG4cauB0cHuEDEoRw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, andrii@kernel.org, 
	eddyz87@gmail.com, ihor.solodrai@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, martin.lau@kernel.org, 
	mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:51=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:

[...]

> Would it work to fall back to libbpf_kallsyms_parse() for typeless extern=
s
> that are still unresolved after the ioctl pass?  That only costs extra ti=
me
> when a symbol is actually missing.  Alternatively, the kernel query could
> match the .llvm. suffix for data symbols.  I did not find a fix for this =
in
> the rest of the series.

Yes, for strong externs. In v3, if a strong extern returns -ENOENT,
I'll fallback to /proc/kallsyms to scanning .llvm.<hash> suffix,
keeping the same semantics as before.

Weak misses must default to zero without falling back to a scan.
Otherwise, all objects marked __weak would pay the full /proc/kallsyms
scanning cost. This is a slight semantic change, as a weak symbol with
a ThinLTO-renamed static now resolves to zero. However, this is the
behavior of the light skeleton (gen_loader.c), so perhaps it's
acceptable. I'll note this in the v3 commit message.

[...]

> Should the fallback cover any error other than -EADDRNOTAVAIL (and other
> real lookup errors), or at least -EACCES as well, with a pr_warn() for th=
e
> errors that are not handled?

I'll update v3 to log pr_warn() and return on open() failure or lookup
errors. And then I think I should reset partial state and fall back to
/proc/kallsyms on ENOTTY, EPERM, EACCES, and EOPNOTSUPP.

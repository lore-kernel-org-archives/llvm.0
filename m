Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8C1489FD7
	for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814695; cv=pass; b=oRiiQT1L/a8RP8R8yvV9qyAMoFZjrAJXVci3FVevIue4kwuTCIBOpA9zBHVQlHMPUuq3oz4USn7bOFFhdofk4Qsre8/1/qpd78nYyayabZY+r6RwMPpyYbgFEnofJ7DY6/rmzUUdzM1L+/I2Iakivf6cNtXQoR4GngHTeHVs+kM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814695; c=relaxed/simple;
	bh=g/BhmG4j9ffr0oFBvhz7lb5ueTvQbhXIGndnnY78eok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucnwNGjPfP7RB82j1jkKE3B7x0v0JGJWbE8srUHYtLZwL0XcbcYt2VQchFmSFqkKdrDHgnumL1ozY1eHFq8SjAjAkOH5faJKxOi2+r+Ao0+vd8Bv7Tu4xDQ7Q2DM5abG4At9A+bwAFPiz7rwF/ocK4IcqoHw2isT0rxiS4PVsek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pguPq9K7; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pguPq9K7"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bb5afa736so189724eec.1
        for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 07:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814693; cv=none;
        d=google.com; s=arc-20260327;
        b=o73Ns5c94niRd/aWy3KGOH5QGbux3nS21sutOsbJ5cC8Xk3LpzolBPm/DTmVhadIeC
         nOddt4LZnYETrJaoryjPQ4bmS29Gx0gF0FreQJFFvjadSLlfLjrQSAoZzDP4KwIy50M7
         L00zZQekh9iWIDAJGhZ/k678iJPVcmAh5+iB0TiNBXmSuNx+g55C6vbr4QY0NNOAnkyJ
         3wKrlmj/7b7gPC1/kuP/f1ATZMgr8Knmvj6gAruBjYzTdrzAbo43blIX1kXbE5q+k6UN
         UTc6c9TDfLleQS3kDLTT6z4Bpq73yBblBRTdtMMlxEL5Ve+6C1rjvAeM8O7Az6ees7b0
         f8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        fh=Hm9eYqY/htM3+tJBpXDmGKN29lbvktZXnbBwCp+dYBY=;
        b=Ji0b8xHWGJ/QVdO2MT4w5A4pFp3IuFLI67kHgYC0sF12g0uteQTkaZxElPJPd77Udm
         +kLD8s79T/p8Vx6oXncR3T2FAGpqr8gbflT0tUO962Asep9RqFUfRQtCnODKjVKCOavf
         9uwv3tat/pxMxxAnGpme7LD3pFAux0ESEydX0GjX78Ym5PKIdG3S5zfqvud34UrY+ant
         WyrunUZOHSwa/twGRvtfNexWrelD8ESqx0Oqv08aN0Ns7yk2OcaehaSm5yXP0TJBfRLZ
         Pblj0Fed5BqYnVvJxJewr+zcasPVtujv5UFsJqI0ASrxzfOEAY3ZknGpyEnNT51wiAlX
         MkJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814693; x=1792419493; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=pguPq9K7BGrpDUyn0gGp4SKt6rkd2fV/onLtVE4XJfGvx/jNkEGTFcylWcXIzCbpeP
         2+RfLl6UJmf9neIOf7IGyWnubRSGHRsm4kvN7pGQbEHTTOpwfrrgGFo1N9eKpZoWOGFk
         ISACigCGjZSSJOTrPIQz12xBqJ5IhKh8Lg9CJzi4uFBhTdoGr1a1Z/Fm+pEu77QWB5Pr
         7tKnbewanadNfIMZBSqkz97Y+PUavGuW+cDYdWBkRsQbQjBZLDqX4M3KaO8wJZhCHANP
         vVntek+m0noYGHe6api3oGzvqNC/osRB30y0dtAgXLNA88ZkqSv9CS1VNiESx4aR8JLb
         CbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814693; x=1792419493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=ETDY+o8UF3A4zkD5c2/m22VWPzpsMYHhKioRt5kIGe2Z0C5g1IKdN7oNgeLBoWSpBQ
         MpIsctxWSz33IipdkH/Tryoe1XSJy3/6Qn/ribfA8vxP0O9wTkUGYdwotrDgikYb5AE7
         hu4kXUBEnS8nayM/n60YFNAYEkg2ofAAX61zNmldbgQD8hARxq8BeY1ZFVUg3qwOYUP3
         0xvGUHcJN1KyO3kX19cOB8w6TaOsraNXt5nlFOTUzTnH8PBQ1TmIgwjMKHCCiUjoe2Em
         gDAWWe3eGWVuh28tSR2SZ2dwkq8sDNuW8gvD6wPxIjKZNfEEalq6i2v1WxlWNpcFkWLN
         yUPg==
X-Forwarded-Encrypted: i=1; AKwUvBxdIaBrpKMuoBlblgXySAbgdETEe3MxcmoklNhfhZXIqeAWMCoOt+Rcdh/loKvM0Zm/b98Y@lists.linux.dev
X-Gm-Message-State: AFq9FYInszxJqxrPGHYFHIMRVgXV/aCde+e7kE8daNs9zjrmjC4INrQP
	0NyssY26qKRd1pfbDfUMok3SsvF/WVNXDoLAJKF1c5H5cfyAfzBjJ2nZWvJbnzE0CIAGk3S4HlF
	acgOvHFLURgRR0hD4fKwuf+crDE1jFWI=
X-Gm-Gg: AYBFou0aHYtuwsGhl5Zn/68xARwe1jS9mVz+qxNSA/lHwTs5OHJWy8qcjxzgoIwDLNs
	UOqcZWqDXpPxZF4aXHpU1GvutfO/R5uUSqjAsAo+EkDOolhKq/y6I0YqFvbB1tJOXGXxIcOGnQQ
	AeZa457DAEdnqkW9x7waGyqQOVWVdVuSrTPl7CAL2mOKLxkQZAffsQmL0JrmaYczudM0cQbE2yn
	oesEZe46dhBlwrxmzWwzWwaL41Hrf1oyldrUwPi5dKGyiKWU3jy/dMkkw8j7KPUh/io4JxDUMwb
	UTe92WJBZzNI4TlBu4lTJSc+urD8qojEK6cwPIuuK4pEmDqp2HQ+iMQX+k4SYuGUq/bNP4ii7+H
	+HnEqJRnQZm6nh+OruR33ITaGdTN0t9fDMNKhgTSlWlQxlAWdncIVC1cI/ZoqV0htawEyK9eCSg
	2Kk6bNx/01g00srpXjForsfuWDqQ/V1dXh7R9dhicVIt/XnzCQh87dljddT2Uxdw==
X-Received: by 2002:a05:7301:428b:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3587ee40938mr13997955eec.0.1791814693087; Mon, 12 Oct 2026
 07:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com>
In-Reply-To: <20261012134159.912183-1-elver@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 16:17:59 +0200
X-Gm-Features: AclHuK-Ywlbcl-S8KQPaD-1cIH6SBhIHUu2wWCV_8Z4IN4dYEXXQbTyoeFpEilQ
Message-ID: <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:42=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> +Rust code is instrumented as well on architectures whose Rust target sup=
ports
> +it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).

Maybe we can omit the x86_64 bit, to avoid maintaining the list in two
places, although it is convenient to know in the docs (but risks
getting out of date, of course).

> +  Note that ``rustc`` rejects linking crates built with and without KCSA=
N
> +  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>.o=
``
> +  cannot currently be used for Rust code.

Would `-Cunsafe-allow-abi-mismatch=3Dsanitizer` work? Not a blocker for
the patch (and in fact I don't know if we would like to actually
support it even if it works), but perhaps in the future we can relax
it using that.

(If it doesn't work for some reason, and we want it, then we can ask
upstream for an "escape hatch" as we usually do, since things like
this should normally have one...)

> +# The minimum supported rustc's LLVM supports all of these options.

Just to double-check: does this refer to the LLVM version of the
upstream `rustc` binary (LLVM 19.1.7) or the actual minimum they
support in that minimum `rustc` version (LLVM 18 major)?

I think all the options exist for a long time, so it doesn't matter,
but just to confirm...

In any case, this sounds all reasonable:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel

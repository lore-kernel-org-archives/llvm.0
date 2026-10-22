Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792709899;
	b=QMSgpgw4CzB993X/5XuvOa8ke3ls713MQ7JyYyUXc00PzaOo02ETWj5rkvY9JXROHLB8
	 djtvgA1R27yZGsT2NZ8rdf2kLh20sz4ytq8SzEVuU2WKKoNTwg74AyRWSTgMTX/tPizm4
	 kgYJB9k9AjIejYgcHyqoeq6qz3AshmsOegOvyx08KvRkefEKXDFRdR8VA9bc6HKzSIFWC
	 uYH10sVC6/jKlpsMjJbMP8aHyzbjthOUmvVcFNOa+q+G4RrSSH+8lSSwyVT+ztSAHHghT
	 PusZjgm4PwyBkvaNZmBTsSfcgDyhfuh6KvFcVMmZj6bytbqCrTPO34dg5ldBfk0A+YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
	b=ONu1VlCGfCgpIGuyRW22SAmTSv/zIYfLgTi2f4+Mzr7hPRpLNa+wOm+p4ExH5dJHDZwv
	 qVe1K1hQEVel4sPL3cUA/Q9aZEOcgft1+n/MLVF48DaZbeSgZH/Au9lx02ShhPtp6/7hn
	 beovekKO4symcM2geFxE7E0w0h42lARhH42/6FtKXwkAPszKuefWJDSpmRCA523kfh8+r
	 7vle1GJl04xbonQMlWl7tpbKzdyIjgNck3OWIpEosQTjx5aLP73PQLBX+p5FbbPuP2Wej
	 b8pVQv9BcC1nveYQtdxIYv9OE7BXLV9Sc7T2wEuYTnQK0gVBoiBroVxTwSBLTmJR1tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CPkDhxHo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B332606A31D
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 22:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B332606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CPkDhxHo
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1950a12.1
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 15:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792709896; cv=none;
        d=google.com; s=arc-20260327;
        b=pTzT0jkwQ+Fo57ldks+80l21HsHHGDhF4lrneseK+EGj3GOy0QgtJ47cnoDRgyVzhP
         Bn5qmQo/uGjzvud8/H9olCqF8EnJIcCcDM81nnIamV348LXNz05NAQhd+1mYrIEw7TMY
         rHEz6AFScK1UC77m0bdeSYYwNcI5W7rmK8/v6FN1OXMEZRMD1nyLWKaxBWgC+pGkegNW
         S0stK42bwn3Iw3oy0fWOTtbxCx3tRdm2r3nNbFWoEH/MkYeB8tKd5/ux8JvGR4q3Wlbp
         Y7hE6HKVAD5Wr9QfpeSR0ynYudfqv0yDprFbblBxJorBPqfgAcKH/MsV+RLMlZfVNU9H
         cVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
        fh=4SRPmKVH30RgDV+3pBFLBQVFUXfBQo6SvOeYkExiU/c=;
        b=CvUnipEpjYmrdakhWhuPqTjGGXwXJ/i9YXgAicuPiA7loah9q6zBTLNEvfGTFN9Imp
         uYyd61jcA5XxI3ZcjrkHUOWsz3r917VAMu7JHe3ISu2Kzb+aUwOsoX68X/FqVRXbHGnd
         fvXJgxHnZ3B7EjgTv+FQUYdQeYNI8zp2XyFGR2VT5S3ccxAjM24Y+RXJToqJTRf8g5x2
         xLqUzQd9Qgna0DhfNy20/XQ7GkzX/jSNlDCHp+4XMp+xRxUEkFagn9H3f2DF5vcGUts3
         HeYH+/S51jyjnvTHbH9khnIxF4lOTFclyT9ltrkLL2Ao+bfcOUqG8b0yTAil9n+udrZE
         LKUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709896; x=1793314696; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
        b=CPkDhxHoBQPPYPkZGcIOGiKjGgPw46j7OCu13nbhybp0CLedT+KkqgjSz7bX8kgUKx
         qMScXzYJyd8Zr/wVfDf357TfnB3l+fV++I9izep6uGV0LXdEQwiIYtOm4QFLBXrRh3/Q
         sNnQCgzSEo+4N+/y8YvlCXGVlvqI/gmhY9CP1zdDvevRV23BwyDGhzkut/5edk1CQYga
         2ODDgtZjjlFoqvmGq2gvhQK5y6mvyVjogiKTZ+OHZw1yr3IcPN8FejYM/1oaAG5zYK6F
         bP4apcyLLs/QyMxraE6a5P5VkBK/hfvpX+wXUjr+qJ8zoGgbQUWbYPvLnD5azVc3bRyb
         t/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709896; x=1793314696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4h8EJtUuQDNTtWsFUTYQGXARXr8rvvu+aTdvO93crQM=;
        b=tC9A+Ppct+/KryLEcca4e77uV/ZGPT8gSZ49XMg2jooNtcxd+k1RoXmxL71zuwfAs7
         W7Lp9mSNem2A+6w8E1lcy4POA0dC9v36+KRStOcC2AR1gk65aQ5XfkzJnIeaSZJgcWQj
         kguhsADNwD9Y7mIbeYD7EuWDlheDsLdCKpB/J2SNH1Z0Zz/cA3wVD8adp+IjVYH/y+PU
         3THT6j8SkUe7r/zUOciM3AoS5HYwDc07/hmUsnfNZ3yXS3I7L+x0caW+xUstKcrcYsTH
         6lVnfj7GCPLPtQMMLaA6nK2ah+f5FD/ElWasJOqPqF8Vgu66+9Vn9AuJPAAKlXOnhe5T
         RKxA==
X-Forwarded-Encrypted: i=1; AKwUvBw/ghiEuhLFn3ceJXe+R0kAPI1VibX3wLnimNx8M8P2LBeeJ4aAzlGqYtBLPk0hm2hwa3wo@lists.linux.dev
X-Gm-Message-State: AFq9FYI95iwZ0NoR989BUbniycgDJ+REF7bldpl2rvHDWYjfSZm9hmTJ
	kSX6f2ZBdukiudD3z0DZE5KKps7NkL99wq/lAl3zu5J23Jbf7vBJ+C8wmKlaKXFZpwhspRQKRuw
	tlh1mTvaWEGOCamW/aOzofsI9DMoNC7Etdk3oVB5A
X-Gm-Gg: AYBFou39WAI/Rc6I4bNPh8xXDyOjLkBmYI2EkuRwZZaWV0PMdFSblkrEMsW5B949G+y
	HnV8tjcRv1SoZ4OSWI1AiSpWNNI1O0vBIBeX7fRVnXlh+gxW5chlxCWUsEiiUlrmaFQ7VJKL0Qp
	I3J2e5jQcWutHSjQiHHswqp57EblRGxNycD6GzyM8CN8pEEqluTvJHopWhVbA9IUkZvVEDzp08P
	MG+dQSPNiOCGvt+HIqPQg75OulDz09m6Msy4yXaFCydYSnymT6C4UFKFdicWK7ADfBZeIbCUy7i
	4iuFaHL6JTRPX6P+SCpRMo8ynmuVydPXuz6i7+f7jQCQ7sHxZujwn/RT+BytHHaKFP9z7jsHrRO
	lA+zlx249UmM/+C0tchfQvX3OHVyuMub5Vg+h8P+FcZGhjDs4uUfrvdbcue/8gRaO
X-Received: by 2002:a05:6402:20cc:20b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b43505cab5mr9309a12.16.1792709896086; Thu, 22 Oct 2026
 15:58:16 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261014-update-autofdo-split-machine-function-option-v1-1-5c71b3005e89@kernel.org>
In-Reply-To: <20261014-update-autofdo-split-machine-function-option-v1-1-5c71b3005e89@kernel.org>
From: Rong Xu <xur@google.com>
Date: Thu, 22 Oct 2026 15:58:04 -0700
X-Gm-Features: AclHuK8dO3MsAmO6cAa68r7ozQ6JK-D1flEqoU6M1Xnqf0FQ7RSBHTS-OpOYYkM
Message-ID: <CAF1bQ=SN8wZ1hKDTtGspBiZ8VQBoUtQP6uNioO-ZOOvS2tLZAg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Update split machine function argument
 for upstream rename
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Han Shen <shenhan@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks good to me. Thanks for fixing this.

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Wed, Oct 14, 2026 at 4:40=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> A recent LLVM commit [1] renamed the internal LLVM plugin option
> '-split-machine-functions' to '-function-splitting=3Dall', breaking the
> AutoFDO + ThinLTO build with:
>
>   ld.lld: error: -plugin-opt=3D-: ld.lld: Unknown command line argument '=
-split-machine-functions'.  Try: 'ld.lld --help'
>
> The plugin option is needed for in-process ThinLTO, so handle the rename
> accordingly using ld-option.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2186
> Fixes: 2fd65f7afd5a ("AutoFDO: Enable machine function split optimization=
 for AutoFDO")
> Link: https://github.com/llvm/llvm-project/commit/3e6acc87c58843e551d6e8e=
4bf06c26712b04622 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Makefile.autofdo | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 1442043da139..57a3aba6ffc2 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -22,7 +22,7 @@ ifdef CONFIG_LTO_CLANG_THIN
>      KBUILD_LDFLAGS +=3D --lto-sample-profile=3D$(CLANG_AUTOFDO_PROFILE)
>    endif
>    KBUILD_LDFLAGS +=3D --mllvm=3D-enable-fs-discriminator=3Dtrue --mllvm=
=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto
> -  KBUILD_LDFLAGS +=3D -plugin-opt=3D-split-machine-functions
> +  KBUILD_LDFLAGS +=3D $(call ld-option,-plugin-opt=3D-function-splitting=
=3Dall,-plugin-opt=3D-split-machine-functions)
>  endif
>
>  export CFLAGS_AUTOFDO_CLANG RUSTFLAGS_AUTOFDO_CLANG
>
> ---
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> change-id: 20261014-update-autofdo-split-machine-function-option-d4edb03d=
370c
>
> Best regards,
> --
> Cheers,
> Nathan
>

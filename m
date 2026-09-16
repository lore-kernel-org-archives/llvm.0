Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A69C4AD4D4
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789596542; cv=pass; b=OTU51P6x8PP0Y+QJqi2YUBGlLxFnfJ+vey1lzm/QOH/U/0Ayn6EmbWXpo3iwmYNhHybvVeCc5lyvdZA0v8IcdPB3C0YNofXaeUElPAESk2CuM0Jc4YnD475mupMzTWasiqSa3fUCQanzSiqAg7D0YkWXFe7V6qnbtf5FVNq3bVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789596542; c=relaxed/simple;
	bh=/sL4aX/lvFF0OA1HG7h8In3Uw6TMinzp1Ww4YC3zU+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7rfWoUnQZsn1iYUTCRzWtFDCDvVVX/omGT+HQ5deNCjOZid5y9q/cqa3zHQ/+cPhmQe4tIMLnAhYlgQ5ZwUGQItn+Gmy+JqdzvjL8NANf4tYK3Wqspa6XizHymcE1UMsE2MOEeFKj2W2ZbktrEKKVWdEBj4GDUp3tpU9R7tWf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s4fgZgLC; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s4fgZgLC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48586861639so50216f8f.0
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 15:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789596531; cv=none;
        d=google.com; s=arc-20260327;
        b=r3wVIXJaoopIUXyME4Ai+mDgh/SGhLe1v6P66Gp1M8otzBqIYaHrQWWJi3leTfREcF
         ledSil7PCZcLxuvXVYnRPl4FVOE/a95F1mdSzZu8kyE4tsJhuLs53NVynxovQOj6wxPY
         w4Kl+1F384mf3i3pfB1PRKNjBum1jWWXkS9wFFyknY8CpIxlHt0G/Jct9Dq1R9qrTK9y
         tQqO6bgDUHRMKzKDmm+en6xF1Ug6Lk3HSjCqKyyIFpxHzMaZKIoTpMGRFG1jxvJnpamC
         bR6SEWLUdlDHPpTjJlqcuFLUxALDlMuZ19ua+263eCB7mEIJGGd60w2q1x9oKIEUCTDI
         68Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y8Yimwq73XmAEZlRQgIp6o8SBW0zq5wMQmBJMpzzOFQ=;
        fh=Pic5ODvRGwr9/V9K8yECzlNTPLhRzagCX5JaxH6rQCE=;
        b=Df39Rzt3PA3yEC/SiwnWh4GLlKXZ26Li4DvL5YGqtyelFJpv1hWhRuFzFwyjt/2OAz
         kKVf4vxfEkpTRli6Bcs94ICvYyNvqzzXR33ayJrSvXVzSFD/Em0mHiKGlEhBn1y+e+H7
         02wdFJaYUEfi0xz8OJTsX/6HKmYansCgYXQc/cL2fcRvqxQySaWd95SZkA4CyWU6YlcR
         WM04dZSYPI53aRMnc4sf65xOev5e08kZ/GVlDZO7BEGaUF2Q50XRYh+w2kPHEqbuweiv
         QgU6CY1/79ALrE1H9rokltfHX7ywp/M+WZwFWmhGQ8820iM9GM0P0V1XTQ8uOn+rxVoh
         /yZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789596531; x=1790201331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y8Yimwq73XmAEZlRQgIp6o8SBW0zq5wMQmBJMpzzOFQ=;
        b=s4fgZgLCiZ75qOCUkKYJp2bAnw6R5+B8AMZmTpe8AhWn8nDANQwN9WSLcU86mtx+9g
         dL94AC2XYvvRZTmPm9p+3wvh6bc1f685da3CwGBRfuYwr894EOebDLQL0/UUDTfi8zLB
         LcP4BzvbFZp/YytCPNhTyZ/Jt/SRsYlFCioo1dCQ8LdAygQp4lSd4Po5xMPxC3ppbJu0
         U9nGDTk9pBzqmr4HFHuvatSLJrRTEvHLthkzmNDhC8upyRY1PeIlcYdZxWVcVAqmwM0U
         OpabqieSwQtAl7YQZvb9EpvM/AKbU7Y6qhi1XoiHDxvRCarc3Kudau3AsL2tAzORq1sw
         CG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789596531; x=1790201331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8Yimwq73XmAEZlRQgIp6o8SBW0zq5wMQmBJMpzzOFQ=;
        b=YcoG6mOHnJKNxREd54cOt/q7zhgRbcZV189CIfenV8n7z/kWh6YL2SoHflNwwxDSGs
         Vi0wi+6Ei6WH1zM7IJ6RKqeBq48CdpuXirl9XdKUB8LFMfFiduQ3jR1FAxEFUiaUn7Uq
         ocCfsnaxbrdtOU722sYTBwyct7uTSW8RHTOre6s9bgPk+w7FqEPjibyGyTr1ucCLS7MI
         yI+ib8kei/OiytUBqtRLJ1kh3vOSlyBxBI/XxpSr5qEmTqoABIt1jmh0HpHHqeiVNBDF
         lOVUOzgBPg/cu+X30LKqNL5sto2a+KHyQ3rgEVEhOPibOkPgel+8hdIbc4ZeKLnaY4iA
         6Kjw==
X-Forwarded-Encrypted: i=1; AKwUvBwvcQij3DBicY9yXpQCAc9bLqCpmVM76pbJGfgVQ2PfNaw+OPwQ4izruyKHVOBbVbw2Rmv+@lists.linux.dev
X-Gm-Message-State: AFuF++lPafPKIf3iQU6Ub4kZ+pwhAccsTOQuBDipJMNtPmRo7c7cIiuF
	1zb7Oy1QMngMRA1SXqnBeUMDqeMXZn9orzs13vMk6b5pO00Zhveq14H7SsLwMs79Kq4r5CA4A23
	kLKGAx5/C5Nf1FeBXDPPmtqkiRe61uQSBhNqjQNRl
X-Gm-Gg: AYBFou1g5OBA/ogaYWFrtZkaJT3n4W3U1DhpPgAdwvFpZZXTCiY/fjAmuwqaRN4V3aU
	eXuNJs6ysm1EdHaRDe88E5rfCsoEnKcdpoOscsyny8lqU0aMsXLzb2sC2MtlLOT47vI1CCGLIJA
	s/DGgn1HyzUkrKjWsiaAT/7W3wIwtB88ti66onB6sOrU8mecC2E4q3EE1/bZ9lsdEi+HK1w5CgX
	GFxPTxpFn6xg/qmhB1sHtgPZWfnHlc8tk/o/JEG7cLrzS4FDqv0qK8ge+GNOMv25wvasubbXYVs
	+iWYfRu4DHJWkod+wrSOsIkC0/61+6frxLU0JFs9AWX+bUaB6D5UyeFLCLBGvciwo9Ho+XwNgV6
	HYKvs2dIcBYExEZ7enJfB+V0aR7OChPHpvLVwx3RK1U8BNlrH7VL4nMCHSSjNNQoVlOqZ
X-Received: by 2002:a05:6000:2586:b0:486:fdd9:a0d9 with SMTP id
 ffacd0b85a97d-48713c59d8cmr1446175f8f.20.1789596530608; Wed, 16 Sep 2026
 15:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
In-Reply-To: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 16 Sep 2026 15:08:38 -0700
X-Gm-Features: AcwNN1VRyt7hIoF182EzNYbfGSDx1mocH1ME-nj3k-qk8BkWMkfk9ELup6-RHnM
Message-ID: <CAKwvOdmnfkra0N34v5w8qh+8bb4X5AxLTtOULu46S8q9KCvzMQ@mail.gmail.com>
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 2:59=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After a recent change in LLVM [1], RISC-V builds fail when checking the
> vDSO:
>
>   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not support=
ed
>   make[4]: *** [arch/riscv/kernel/vdso/Makefile:78: arch/riscv/kernel/vds=
o/vdso.so.dbg] Error 1
>
> memset() is now generated when zeroing params->reserved because LLVM has
> an optimization (now run in more instances) that can recognize at
> compile time when it is assigning a static value to a contiguous area of
> memory and turn that into a call to memset(). Both clang and GCC assume
> memset() is always available [2].
>
> Hide the value of the iterator variable from the optimizer using
> OPTIMIZER_HIDE_VAR to inhibit this optimization since it can no longer
> assume that the zeroing is contiguous.
>
> Link: https://github.com/llvm/llvm-project/commit/90cebef1411617fc3eedd35=
9bdf00cb44b1c2439 [1]
> Link: https://gcc.gnu.org/onlinedocs/gcc-16.2.0/gcc/Standards.html#index-=
ffreestanding [2]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Link: https://github.com/ClangBuiltLinux/linux/issues/2183

Do we need to tag stable (I imagine this might be visible for older
kernels with newer llvm)?

Any idea why we only see this for riscv?  Would think loop idiom
recognition would make this transform for any target.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  lib/vdso/getrandom.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> index 2851afa9154f..d48d1fdb3351 100644
> --- a/lib/vdso/getrandom.c
> +++ b/lib/vdso/getrandom.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include <linux/array_size.h>
> +#include <linux/compiler.h>
>  #include <linux/minmax.h>
>  #include <vdso/datapage.h>
>  #include <vdso/getrandom.h>
> @@ -83,8 +84,11 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng=
_info, void *buffer, size_
>                 params->size_of_opaque_state =3D sizeof(*state);
>                 params->mmap_prot =3D PROT_READ | PROT_WRITE;
>                 params->mmap_flags =3D MAP_DROPPABLE | MAP_ANONYMOUS;
> -               for (size_t i =3D 0; i < ARRAY_SIZE(params->reserved); ++=
i)
> +               for (size_t i =3D 0; i < ARRAY_SIZE(params->reserved); ++=
i) {
> +                       /* prevent compiler from turning loop into memset=
() */
> +                       OPTIMIZER_HIDE_VAR(i);
>                         params->reserved[i] =3D 0;
> +               }
>                 return 0;
>         }
>
>
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260916-vdso-getrandom-avoid-memset-llvm-24-74d45fa6031e
>
> Best regards,
> --
> Cheers,
> Nathan
>


--=20
Thanks,
~Nick Desaulniers

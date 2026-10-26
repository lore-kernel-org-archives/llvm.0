Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793009350;
	b=SBMPWz4fbtXHZVm7jcKTrc7KyKXcI2kh5z27mltKjAJxCSgg9O7OCjZ7YQ6ZQDMxsLrL
	 UBdxlpoHmgXYEBqgsf/kC36oEcVOI8DatEamQHFTR1vUOn1Tqs7pDoMbfwLqtTwp5XmvV
	 L/gwZhgyjQjobWCHIyOdBKQoZxBQCJe6ueGlGVr17s1MUhHZSafGq+0nmhARyGvNjjRxT
	 bodoTxJsnlYFB7UTMcWkMtHANrRi9kPo6IE0nMmrLkOvaa8Jt6Hj4eXWlTCDFiqgR7+od
	 GIZR67hTKjiowII2CoSgZr0yZeT81/IjOCqX1MRSxIAXQC1u+COrCB0Ob6jZ+mOmeOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lqgswGVrjDSSdxxGQJBHiCq23U2S/DjC2jo9ZomP9DE=;
	b=D0tUfO+YB0O3QHPXPu9HNv2C4kYaJDAMccpvY0AdijimjOl8eyxx4+7Od3RZcIlYcfLv
	 L3EPAWK0ndAB5X2kkZlN4XFQgU/fTiKAyKeOL+baIg9Ucc2hiwm0X5QuvBEjtQW6jCK8B
	 JC1INB6vmSr+h4n5E0SKeMoXgxD9o1pxeq9lFF7YlVOcrPwk3BQ3nxA1lOFtPEYYB8sBD
	 +fotlG71p9cFObVJGF9hCQVgSUoX1krH4Uyl+guYNdcfb7uLqK5XYmB3XxUAHGdcEcRZ0
	 0uhMC7egJkP/lC/htumrzowjt5VQi9M8oPrnExwDtX0KKFA5DbZq4pPHtfk6w+vDY1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pt20n6gu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117C606A323
	for <llvm@lists.linux.dev>; Mon, 26 Oct 2026 10:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2117C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pt20n6gu
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so4806644c88.0
        for <llvm@lists.linux.dev>; Mon, 26 Oct 2026 03:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793009348; cv=none;
        d=google.com; s=arc-20260327;
        b=K9U0H5xXQ6a3mj1ktTnnV4xIgPa+dpZSpHNQRpy27xgO2VeMwEciwrVAdhMiFmzHPy
         GJjjvOsoWEVWDTU9+18hUQSFllQa+OohkoePnhtrt01kCpU3FCOCIco8GkFQzZKPHzk4
         IddH+HnFoNVLeO7eX9ypAqfma95gYj8DkLHNrrLWVzxXYXJg6S22bzNwQ3wd59uQREFt
         PrOIYVj+iSEck17Kdm3eTtNZwKTGpWwHiL2mfNH/6RPQUuKBBHcoknrk/6k/Ibtgkk4j
         sMrPxBef6QH1KCy0MRD0Hh/G08cXp7InzkWUm+CYJtDz0otSp8Yf4+67/gac3wk7mTCJ
         rKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lqgswGVrjDSSdxxGQJBHiCq23U2S/DjC2jo9ZomP9DE=;
        fh=i2qX9iNQ+kv3Zil53Gj0kotVEl80DLesbmayhgUQNqc=;
        b=QVCs6TMdFlfm5Thx1kypfWVjKo8y8Eqh++eHz8cgalgmtf9sZbnMHd0e3LE8Ai+uY6
         NbdVATJizY8dZN/4JEt+h10Y+/2mZ7nKtFEYnw7bdBDsUrLp3zvwnJ+2Q3RJA1N7YPgG
         lSzAfOfQAiOeSRBdm1CmznI1lc9sN60Y/cmQnOf2Epi+bbsdfQ4DAhFcsN/kPbLoZFyh
         ErtkO6lxxUKZjeMalKb/VvmI0di7WepdgCeR91SGAvGgibYYEQn5YgEtLRVw3JOo6HuU
         2Io77HLZ8JR+BNi5b4/dkeofb0U+nt3OECKUH6kqxooqDxyMw9lrGX95xnH0zDtRdbtO
         ak7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793009348; x=1793614148; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqgswGVrjDSSdxxGQJBHiCq23U2S/DjC2jo9ZomP9DE=;
        b=pt20n6guQUVZg6awndzSTJ3oxKP34XfrLgB+3cKO+zVvEdVpfV8vcgv1onfXB6mOtD
         WzhpvKf1Cj6q+6qBPPOe6cJKPuuzsCW7zIwTMMJl+9efCjVd1yZoEJJy+KRew0DiRHKt
         iEmSmT/URUq2Q0VZkBH8yKTXIexf1tEb7l30C7zMvsEPQkovEnfyVbLiJAXvIA9cfog9
         5m4xCtmKCeqp1MKXJUxPF+676S61HimPPiAJaoiHozPJ5L/h35ibikyzAn87L2aQ3sra
         5/L6ve1NtmY88SswBWCBoDt8jUiBApGVavacNnlmpXQOaEmxdCGtdDGLfrBalcepvscW
         HeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009348; x=1793614148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lqgswGVrjDSSdxxGQJBHiCq23U2S/DjC2jo9ZomP9DE=;
        b=KmliH3yqTBXQj4yNk6obFcP++kr6kRb/mn1Fu3tZFlbx0Fm27lF/2A5EtM14tUljub
         4C7KimyJAtYMYZfSkMD8w8a+lXJtnjvMA+5dvlv8QyaeSG6h7x5bY00eMuWxOnPaQ2GX
         AUsHKmdKLqOCkmKbcT4XDVPWBcDK9S9cS46MZTg5zKxlWCMPZbZw+HnklddQgJpFENL6
         RRY0nlnu+5KRk2AViJijVX+YMDP9AdPC07WvE2kYTlclOohC8jYUnmqpqzzlXr9SNGAE
         NrMQHqvI5otEy4q91xKtciYQVNGRowCsLR+9UBwNgvjye8YUOkduv2UvwHoHzPGpth6X
         6tcg==
X-Forwarded-Encrypted: i=1; AKwUvBygwb71MsZ7dvSI7DKZraD9UkJnST4M4v4S2KFgM540LMDU4t5LSCJjtCiQ5r1wTJoctNk2@lists.linux.dev
X-Gm-Message-State: AFq9FYKSp2Gm6/Xi9pRqFU2Fld4zF68yYtqvKxtY6mKOsEtTN+ayQErb
	NHI3j4uzGq+wy4Jz111jDHr+RjBgVZ/+HAQgMlcqiaGnCFiA+5ElDEPMjbVPLOIvq0qilT6pAsO
	rVJZ06O5mMoBz8fT53XQ0PY4wKWqjVzMNJZHuY7cW
X-Gm-Gg: AYBFou2E5iLQpQywzY8dNX2vWy09eDTnUj2H+xqyoDPbEl9coRne1shMYoaFG1JD6Kv
	z70mQReUtzv7AJ7pSkVi7vQzXfEDVLw8CUG9vxu3gN8UA4/jacVRJVnF1z6RYTXspkRtp/mlZ2l
	4f6eFvo8vu8RD9UxjYQ7Xz7pxYQAS8ZjQMXR/uSOR6PT1VygeT65pBW3r3/6bnEvU47+wdBEMWS
	WHUrAhOka/pwgG+SEdbFQMfrGKGHJjnx0KhsiRkx/ZgYU958pYJouURPH8/xRbeXGuMWMdznHyg
	/pCFrYAi5FCtJUzUoJqBcEecRQgPy++oCS584GQuDU/T/QEx4VsvxBVM5Q88nh9zVRfFoe5V0rv
	SzOx1O90zwzyHqdSrZz2fJwERGcsqJq7WyI/yITQ7gK2ckgZYc+f270sWJkYDIkMWhru9
X-Received: by 2002:a05:701b:230e:b0:18c:640f:7f48 with SMTP id
 a92af1059eb24-19936b56ab7mr8768054c88.44.1793009347392; Mon, 26 Oct 2026
 03:09:07 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023-ext2-fix-context-analysis-clang-24-v2-1-a33961453899@kernel.org>
In-Reply-To: <20261023-ext2-fix-context-analysis-clang-24-v2-1-a33961453899@kernel.org>
From: Marco Elver <elver@google.com>
Date: Mon, 26 Oct 2026 11:08:30 +0100
X-Gm-Features: AclHuK-_bb8psGiBbD_JTWNAC_hBLtM-Cc7GOo20LnSEwgov2hxqFzjQ2_-lDFU
Message-ID: <CANpmjNODG_MBuSJvRkzUjwWqeD=hSQLWtHkre8=9Z6-3ZmTKEA@mail.gmail.com>
Subject: Re: [PATCH v2] ext2: Make sbi an proper alias for EXT2_SB(sb) in ext2_fill_super()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jan Kara <jack@suse.com>, Timothy Day <timday@thelustrecollective.com>, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 at 23:25, Nathan Chancellor <nathan@kernel.org> wrote:
>
> A recent LLVM change to fix parsing and validating __guarded_by on
> structure members [1] reveals a couple of warnings in ext2_fill_super()
> from the annotations added by commit 023051c2d0f1 ("ext2: mark
> s_mount_state as guarded by s_lock") and commit c23746524faf ("ext2:
> annotate s_rsv_window_root as requiring s_rsv_window_lock"):
>
>   fs/ext2/super.c:1040:7: error: writing variable 's_mount_state' requires holding spinlock '_res->s_lock' exclusively [-Werror,-Wthread-safety-precise]
>    1040 |         sbi->s_mount_state = le16_to_cpu(es->s_state);
>         |              ^
>   fs/ext2/super.c:1040:7: note: found near match 'EXT2_SB(sb).s_lock'
>   fs/ext2/super.c:1138:8: error: writing variable 's_rsv_window_root' requires holding spinlock '_res->s_rsv_window_lock' exclusively [-Werror,-Wthread-safety-precise]
>    1138 |                 sbi->s_rsv_window_root = RB_ROOT;
>         |                      ^
>   fs/ext2/super.c:1138:8: note: found near match 'EXT2_SB(sb).s_rsv_window_lock'
>
> Context analysis does very minimal alias detection [2], so it is not
> able to figure out that sbi == sb->s_fs_info == EXT2_SB(sb). The only

Right, though function-local aliases are resolved. We just aren't able
to figure out aliases that propagate through non-local variables.

> reason there were no warnings before the above LLVM change is because
> the annotation was not parsed and verified correctly.
>
> Rework the allocation and assignment of sbi to have a direct assignment
> of EXT2_SB(sb) to sbi so that the analysis knows that sbi and
> EXT2_SB(sb) refer to the same object, clearing up the warnings.
>
> Fixes: 9708538ba204 ("ext2: enable context analysis support for ext2 filesystem")
> Link: https://github.com/llvm/llvm-project/commit/217e229a1f32785fccdd3b3f51429f0d309dea45 [1]
> Link: https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#no-alias-analysis [2]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Marco Elver <elver@google.com>

Additional note: This was uncovered by an unstable Clang 24
(unreleased) change, which was meant to make the analysis more precise
[1], yet stumbled over this. This change is needed to prepare for
Clang 24.

Thanks!

> ---
> Changes in v2:
> - Fix allocation size (Sashiko). I thought that I checked that they
>   were equivalent but I guess not :/
> - Link to v1: https://patch.msgid.link/20261023-ext2-fix-context-analysis-clang-24-v1-1-2b35c33cd0fa@kernel.org
> ---
>  fs/ext2/super.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ext2/super.c b/fs/ext2/super.c
> index fb217ef2d69f..bde5b433776c 100644
> --- a/fs/ext2/super.c
> +++ b/fs/ext2/super.c
> @@ -883,17 +883,18 @@ static int ext2_fill_super(struct super_block *sb, struct fs_context *fc)
>         __le32 features;
>         int err;
>
> -       sbi = kzalloc_obj(*sbi);
> -       if (!sbi)
> +       sb->s_fs_info = kzalloc_obj(*sbi);
> +       if (!sb->s_fs_info)
>                 return -ENOMEM;
> +       sbi = EXT2_SB(sb);
>
>         sbi->s_blockgroup_lock =
>                 kzalloc_obj(struct blockgroup_lock);
>         if (!sbi->s_blockgroup_lock) {
> -               kfree(sbi);
> +               kfree(sb->s_fs_info);
> +               sb->s_fs_info = NULL;
>                 return -ENOMEM;
>         }
> -       sb->s_fs_info = sbi;
>         sbi->s_sb_block = sb_block;
>
>         guard(spinlock_init)(&EXT2_SB(sb)->s_lock);
>
> ---
> base-commit: 782654a3e9c4065dea2e9f10539899d348b7a1fc
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> change-id: 20261023-ext2-fix-context-analysis-clang-24-504b5dd53038
>
> Best regards,
> --
> Cheers,
> Nathan
>

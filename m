Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795127440;
	b=Sg2Z4CtK8dsfQwodDQWzYiQSmPpWEIVvQu4YJaSXq1oQJS2Uk1EUtguSQLgoz3JJulOz
	 PRTHYIPcD2L7T6BpXowBLd3rj+uaFVv81H/YxZjhcfQlp+pAiPYDmBeigHWofDWlYi4yf
	 hJaBsatdkMCZ4V1Yzr5DHo3Vzc93n+lVFkf34unx50KafZg2MHtgm5BnuabNLa5peVJbr
	 cYWW4CarwBzdzFxe7da3mJQm2QNEdmpDkjZBzAGypscG8gaTZOkt2HKrMx5mvHBbaURn+
	 ySlZA/jyWqVK48WCZnoveQ/D9/XPaLjK73cRjBDkzjN9QTORzEpCjiaUwI1ypCkkDLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I2d2DmRRVx5LZro47jpLhN3VDh+vWYS8zmDUFy6y03o=;
	b=Y37stQ/2TXc0gEmgRWuqMO9pg6x+hkNI3oTTeHb/B0XS+5KBKtXs325dZ91ir4D/hAJ0
	 wS2SLD/80kRmjZwBOWAEr97CixyRns7Yivc/wsT8E40opj4YXRogLCRB4VWoBYbqktTXn
	 AiMISk+dXVHwEfkb0VAv9Lyoc2PC30lUreEKVec56X1k83RFiMIoy7djX18g4Za+qcQaV
	 5QkDlfLgN0M14nuuNl1ZLzuE++KS1g0mtAzyLLk16rtI3t8cBFIqreuUQlAxb9tUoV9+G
	 3ArarYNxzEPYZsIiJESktiFzxB8LhkCdhxgd5AQPFjjV8dmkojuKqsQ3HgX1Z7jst7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LZicResU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA665606A32A
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 22:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA665606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LZicResU
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso187722f8f.2
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 14:30:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795127438; cv=none;
        d=google.com; s=arc-20260327;
        b=AqDsIJuoPLTUReK6vb5ps7Ez1LYjaXGwijd4iFAUqxkKI+1bo0kq6dVj6me1bD0zA0
         O3xOYxiaWdkMK9NIyirbcNuwIQzEPeqf1IXPPs2LVuybMh44rJzDnzCJyfFxwCvp1mh0
         J6VDDWVStUt4O9FR/dt2kOOlZJckuUH8VSNZFzrspSxTXX0mfd2cVFSkNx3GcjAyfpwF
         A4OIv8jnAitrJKkh47msD35UVvLYa1Ibd+MZFIYLxkv+SeEQuLZECs61uMo6qsBFYZBY
         LofMIVs8FPG6zESd/zyWXxWNl68/pt0YqzrNd8OTczehszjDgDKz3/RJLk4xZviiaKph
         E5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I2d2DmRRVx5LZro47jpLhN3VDh+vWYS8zmDUFy6y03o=;
        fh=qUQNVCq+/DoOsH29TSGZSKnBCfpE4CBky2duY1sQu48=;
        b=KbcAHONhKIL6PiWXd8OxNvpHHCe1K6xh+BUUKAx7TX0qboAs3qCf5ErulruQWm4OLX
         MMeE1xshaH6MwuNqdkekw4ikALUPUh26BJpT7cFNH20bOws7mntJoYnWUFHjxLttq9iE
         Ycb8a8LwXRf6F41iMyFvPRDy5wRcwbvfRG0uoQk6Nh3U8X+4CTH8jm7sYYdtfiIkQnxL
         Wy/ntiuC4G7JqOQWtY+VFM6J7iRwbu02CTywlit830aVBiGZNFCc+MK8zm8+9Zc4D5Hs
         WdjAqGtFzdYFefPE5t4HHLY1PquxKX4IIrF5E+YZ+g1W7LZvd+80t4hBLBVGveX83iV1
         u/xw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795127438; x=1795732238; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I2d2DmRRVx5LZro47jpLhN3VDh+vWYS8zmDUFy6y03o=;
        b=LZicResUlQnruYUPCEGo9Wzgk42YZQDQEHlaoyW7WmudvwA71jXJv/JehuQNZlgz98
         f4xG147/BX42OemvRDLLIl9ZbjAnE110GT12F8QZmhxbwWeLvMXHZFRFcoK4UNB3s1mF
         Gi1K/TPoKRgBFY52deP94y0HXURIf3Evyripbu38XiChrNQTzR7VYKAccKapRbMUWedQ
         22Gm/VzQ+uTQzcR97m3rRO2iSJPGKau+Sn4MW65G4CVp5C3xxZFqjW08WolMKEQWqHo4
         CspBmTppF/ZWz73leH2ZOkNw65Tko7pDrjuGaGgB6/G+llO5a+F49hLookmkyyUNmIWj
         0aLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795127438; x=1795732238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2d2DmRRVx5LZro47jpLhN3VDh+vWYS8zmDUFy6y03o=;
        b=0M/mspEZIYzJFjOH4TsaITynQZx2iESJ6Lthchi+sawHlskilKzmZpj+MvsCkrVr2z
         RzvLCevTCzTbH/mdhvfLahJfDf0mg/YXlIXYi9CWoNsNF8avJAXfKKtOu4/TgFhi9Stb
         4WwPiaH9SDHjIiFzBUGzMcxABdHTBvZ/6dnMEiTWrDjqY+BZ7aaaz8Jt6p96ayVnGBhq
         kM29T5EdB30VDWnZmYE2wjkpvWTygSS8XlbGgcJFym0ZWPCBhoENdv6S2BGtwYQ5gu6P
         Eb+4tRNeRzBfaTJzR9Lwklb+0yyb42Xt69Q8EiO0C7iWTvol36446sdW3sdEvUK2SOPe
         c84g==
X-Forwarded-Encrypted: i=1; AL+hErG1MD2D2I3dw/qPBSnjpJVZaGR9yOiWcbBPP6Kgcp3AjBcvt1E3G12qBSkcHLSBK7Zi+RqA@lists.linux.dev
X-Gm-Message-State: APuU4Z8GXd9XcK9+2l3AulATxcIMv2GFQQwf55+JZtkA/00m3sTccENF
	qkSzijayFSB3ul0HnWVrRMTg/Nqi0LBqj1ZCe6e7L3/I149267GVOKX9n1SyzeyLDDMPAzP5MdN
	D+7M2MPO1ok2iwgQ+f7FPedOxYTMGbYW+7JY5J1te
X-Gm-Gg: AZFdTZendciuocq4SoRNBIcDXiPtHx0fFl/bLvy9Yvc+eY6A21LgERXV78yk93DUnGB
	72+IAZShkaJZybmMGKb1lPtsmwsD05WXJ0fgjM9Wrgg4JgZwkywK+44I+5WSINUcQcLHKCtL1GK
	hpUzc7/XxIo7TSp8ceZWRTegSVQt54NPIxHX3n1uJpyfWZp8eGdzSsZXOYQOXtRBsiRwc94lU6Q
	5cDW4Pln3fDz563mBHhyqY11/AzFaYUKZ4dr5TtkJny7YNFsl4Edh34LtNF8tZWQHnBIHKLn/zo
	ttLkQXjG+HzBEVGK2qJH/sbBdJerTJ7vD5RXrHodKgc8TjNZPjJloTerJe5KAqU2TFjPrdBB90P
	vaWeFiBD54cM7UoYOEcrzzZaLhjZyDrIYwItSdQsHZZLfFBIZ6VHtlOOA5lRa6JFfTUHX/wTQnm
	srVKn5mv+orNt4Yrdb+EVlddvLX17Jp1G5RUUWYeRyjNaLV9jAbzmlNiB2cqepRjLeVPYm/bB8j
	yTbyo5mLYI4FmkOMxRIglY0EEwgF9wDtchN
X-Received: by 2002:a5d:5f42:0:b0:4a3:8b21:51c1 with SMTP id
 ffacd0b85a97d-4abb9de7e00mr1547177f8f.53.1795127437643; Thu, 19 Nov 2026
 14:30:37 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119213147.1094488-1-usama.arif@linux.dev> <20261119213147.1094488-2-usama.arif@linux.dev>
In-Reply-To: <20261119213147.1094488-2-usama.arif@linux.dev>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 19 Nov 2026 14:30:25 -0800
X-Gm-Features: Aa3M54rH-aa26JdIN-pUYW-8cMRdCYq4lpDC8en2IEgeQrnp1pYq2y4nekWn-HI
Message-ID: <CAKwvOdmCuYrdHX1ACVyC3BBo7V5vQ9HiqSx=+vVCYQ=9d17Kdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/boot/startup: Disable kernel stack depth tracking
To: Usama Arif <usama.arif@linux.dev>, Kees Cook <kees@kernel.org>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com, nathan@kernel.org, 
	morbo@google.com, justinstitt@google.com, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com, 
	shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com, 
	atish.patra@linux.dev, dgreid@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 1:31=E2=80=AFPM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> Commit 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
> renamed DISABLE_STACKLEAK_PLUGIN to DISABLE_KSTACK_ERASE everywhere
> except in arch/x86/boot/startup/Makefile. The old name now expands to
> nothing, so the startup code is built with stack depth tracking enabled.
>
> The startup code is linked with every symbol prefixed by __pi_, so that
> it cannot call into the rest of the kernel by accident. It has no alias
> for the tracking callback, and tracking stack depth there is of no use.
>
> At the default KSTACK_ERASE_TRACK_MIN_SIZE of 100 no startup function is
> large enough to be tracked, so this went unnoticed. With Clang,
> CONFIG_AMD_MEM_ENCRYPT=3Dy and a minimum below about 90 bytes,
> pvalidate_4k_page(), snp_cpuid() and do_vc_no_ghcb() get a call to
> __sanitizer_cov_stack_depth() and vmlinux fails to link:
>
>   ld.lld: error: undefined symbol: __pi___sanitizer_cov_stack_depth
>
> Use DISABLE_KSTACK_ERASE, which disables tracking with either compiler.
>
> Fixes: 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")

tsk tsk, Kees your `grep` might be borked!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  arch/x86/boot/startup/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makef=
ile
> index 5e499cfb29b5c0..0815105e7205c7 100644
> --- a/arch/x86/boot/startup/Makefile
> +++ b/arch/x86/boot/startup/Makefile
> @@ -3,7 +3,7 @@
>  KBUILD_AFLAGS          +=3D -D__DISABLE_EXPORTS
>  KBUILD_CFLAGS          +=3D -D__DISABLE_EXPORTS -mcmodel=3Dsmall -fPIC \
>                            -Os -DDISABLE_BRANCH_PROFILING \
> -                          $(DISABLE_STACKLEAK_PLUGIN) \
> +                          $(DISABLE_KSTACK_ERASE) \
>                            $(DISABLE_LATENT_ENTROPY_PLUGIN) \
>                            -fno-stack-protector -D__NO_FORTIFY \
>                            -fno-jump-tables \
> --
> 2.53.1-Meta
>


--=20
Thanks,
~Nick Desaulniers

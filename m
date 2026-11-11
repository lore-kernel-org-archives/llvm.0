Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794415879;
	b=Ekg/odF+r9Z02Rltxs6LIfocAaQPRdPQbsaVz59oQCcWuaUQ4O1Zj0XBm67EAwtZg0Lx
	 ZluPFvYMQR6lyR2IcUSAdG9YWk+Bchqpw+ZDL+zjNyR6IRaYD0dJ2BBAUkmWxltqt3yDT
	 V9ydcU5RZpMoBZA3daxE3ZpI3pmVNx1arqvwSi5UxG88AXFD3+BesaV9eTkSt/fUA8Awl
	 IIKjJDNb4lEcvuc8d6LPfGmpfrVR3mHqsa/VcG2iEyXcV0wRqufNQ+eKmMly4jWTLoJ6p
	 mebw+9ZtLEd0+62fuMyaRCAGNF+OC6HdToYyPkk7aDNWZUSpsCL/aPFuFNXJYjWPBtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
	b=irbOGifWzRtWMT70cpId9w1cQd9m3E55J5jA2RxKljb2+qAelmisn3xrcKzLD+7B/GVH
	 Isors3BGSZnSfx6NQQqAKzcKZrNk8A5z6omzuzlm9RUxFtS0gP6X45/dL6iDHogrpGUDv
	 yPCy7zMSHLLrjMcEzkkQMqIAAgt0SKiLGWydchHjr7TnFEvGz1xMU4acR+ioxctj/30Y+
	 /9Cqh94JpgqtPXlxPXfBakXXerkOL5q09OmmVMc+XYumzeG/WI7rQHRZarZg4TJJoXncx
	 RmozTGu+g4LNf+8eVJpmYtvuQouZ6G0nEHNXpbLjT7asiLQiGW2m56F1k5vaOPtXMMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e5MyGnB2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975FF606A321
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 16:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975FF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e5MyGnB2
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3edaso15654f8f.1
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 08:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794415877; cv=none;
        d=google.com; s=arc-20260327;
        b=JOpaLUWDUiOWP11UWYxJX319X3YnB/vfsig2X9ucXbneNlpqDK0lBH3rJdEU6zu/YA
         bFWNj1yxx/+R9SoQ6TlFKhrUWsB7FbeN1JuD7XYnNRc1w4xabUyMF8LDEcaR+YL91Sct
         IFLUYRMsbprGn4QYAbmO6y7YDCJSnFB8OZCwcx7pYxi//ZXDfre2aJhhmh4aSz4iTWnc
         YsqQy25Tv8HJhxeqQLFQdksd1XYnYhag5zmNOHXgflisMIemhMg31rqkso58sMTAfoCw
         V5kvwTI9soK68cTwx57I/wNRb54I4WBfLM3F60ybREISJrIaV2ZNV8cMnis4sMmwnEIu
         HQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
        fh=SSxXPR2YNWNndMsgh6BAWAz1THZI9OD0ibOsvmQJgyk=;
        b=DmFDxAZhppsZPhFkuSPV6rImlvJKatGuzv21ltBYABX5QyGcgjs+4fJ6qHOIPHBIPV
         6kzEtWdsceDIcjC43Z9XZJUNA8ewSE8zeBlCMiWzPqQgtGxDmyBDmf5EyL4/PYXqU8Oc
         7aLiSYGK+fIumeLVZ4OTkOLzQfdWCIRHuDOGYzSLEw/WOh5uYOUvSt5w6bOuTWkMohow
         G8daEy1lGI108Du28o81EecNVLWvt2S8pXe6PdLiaT/w7x3hKxWtrawqmCY73UimozqE
         YFOAqWX6uoD4XxGT9sGT3BQQ0i3u1VHW1TgGbYSx+caXf+h71VSsUr8bRJQL4BDJq4GQ
         UFwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794415877; x=1795020677; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
        b=e5MyGnB2b/tF4oNDHDslbmr+V9YjhjRaBP2HJPe5uvxkCXtmov9u8O6vxE9WLcQBgd
         X5qKgJz7Ng5xVBwSLXuw4Zhnzndjt/xMbdo3ZOgOkHMEn9erWcxh4wV6NsNSUxEhhyur
         alkq8giWy/M82VHhIL8HkKHnSfO1nBCWlaTZDvMspYkefhOTMRKb6eBRm0KscSEDBUEF
         a2PyzN1rDOkewAD9IzScDiQvltC8385eQ6fQUhkEwsPQafwtGvSQ2w9jHw2y09EtszkY
         TCDTj6ZLcb8hLAd7omb6tGTU2gezcVyhdd8ijNfbmZsrb3F25T2GHUegkywqN84Soein
         sT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415877; x=1795020677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhP8DkU9ic6BIKk96lun3f4n8KqpEb7oFPMlil4MVPE=;
        b=DKIg7ex0j9A0EMLw2LqiW5yzVEMND4jrgj/VK69p4I/gSvAjQy9NIOn2IOwoZ14M0S
         /B4YWox2GVSLHVuhoSKH1ynjd6bYOaEYy1khl+b16NkPzESE7mdJhmBoukfBIEob8HTU
         G1h+4C9EwbVlk0C6y5CPDvmizkku0Q86YMoQRZ9euPnyZ7VzMMHrIuWpbybVoV+iLDDD
         o1QUnN02FDvq/qaiRFaa4SvUbWnCbmZ2Va6dN6PDRWDfyTp/Gca89i+vUHdQSYRDQRFM
         S6CU5cnohdXQCgm1sQS8heHJbjrDfSedZR2kf91CieRRySj1r8jpneT3qZP/GszrfXMB
         0M6g==
X-Forwarded-Encrypted: i=1; AL+hErG3Gm8JkAy/Bi3qoymr9GrCUYRIFNd+ZF8FkzRVCPRBxGucuF8g3OkiQH9mbpUHbfa3wrEy@lists.linux.dev
X-Gm-Message-State: APuU4Z80LS1NPvPcFnRKH/E2X+ZNBy7DHayRDzSY/T1PDg5bI/KXg3Yj
	M23mr75ypmGmFnQR3Z7Dbabx2WqJBoIL5ixMDQn7zDGXK5n0su/jiOqcfRVybeq8L0TXLm6MXst
	VTu/OngeoxSjD95uxq2uQ7BDU7outgR99YZgZBC2k
X-Gm-Gg: AYBFou03bNv4s5KP7kPfmFTeOZptZw2agtLZ2s8VO+PMZpJNaYKTtPP9hBhGS+mzhMU
	fI842O/GjeXpghQGc2o75WDPbv1ZjbGBgBFGo4h4EwMV9Zx1LPXu8epaHGPWPtX2C0thuyg0dkG
	FKe1DKMldgf7ItwvcRfZbhCpfTm04xE/QjOA1TvuDEWBHOHfuLIZv8vlDAYbLeU/rN/UrzwxyLc
	tgTDqi6f9kcCktyGTFh4pX5wgxucuHgCXCiSZskBrntq3/j+gKmlnhxl4TCy69KK5w6L9Uu0QCu
	3fyKjVH0pQatbU+pq6WW6qrUhjL8WehGwC64ijb9xuO6Qxw2dKoDsAD1VJhqvXyWSEWkpJz7vmE
	jGbZA1hCD6NB4TIwj/+n4GbgjNnkq+VMFOs8QTM9puW8dsfyupIm1DVljhD6K7WIGp8X9hIGDSu
	7ar5cOxhRyng57VJIx+Odv5mQ7N3x8C4EOLqWkMlw4lxBaIQuPKaD3DdnavCwXdu+07N0zzJwRI
	nHc8ExNM5FiIqJ6CtNNVvjlCQkMugSukT1LJA==
X-Received: by 2002:a05:6000:27d3:b0:492:aff5:da60 with SMTP id
 ffacd0b85a97d-49b01cf341fmr22869f8f.13.1794415876621; Wed, 11 Nov 2026
 08:51:16 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org> <20261110-kconfig-toolchain-updates-v1-2-6d4fb636290e@kernel.org>
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-2-6d4fb636290e@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 08:51:05 -0800
X-Gm-Features: AclHuK8l5K2eY2r26mTBewSe8bSK1J1SDnVW3Q9OiGp7cZxgZU2dOMsZVOmiB-k
Message-ID: <CAKwvOdnFG1ACEvGPXGW1XK_3QN+5UaR_9EumhmrsyKOs0aYCPQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] scripts/Kconfig.toolchain: Do not dynamically probe '-fno-addrsig'
To: Nathan Chancellor <nathan@kernel.org>, Jordan Abrahams-Whitehead <ajordanr@google.com>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:43=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> '-fno-addrsig' avoids generating the LLVM specific .llvm_addrsig
> section. This flag is supported by all supported versions of clang, so
> convert CONFIG_CC_OPT_NO_ADDRSIG into a simple string symbol that
> depends on CC_IS_CLANG to clean up a dynamic probe that is unnecessary.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Jordan, I know you were playing with -Wl,--icf=3Dall recently.  Looks
like the kernel does not use it; AFAIK, no one has ever tried.  Even
-Wl,--icf=3Dsafe.  Worth a shot to see if it boots.  If we did, we'd
have to update this kconfig check (the linker flag is only supported
by LLD).  Even if the result doesn't boot, it's perhaps worth doing
builds with BOTH to see what kind of savings are possible at the
limit.

> ---
>  scripts/Kconfig.toolchain | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 666d44cc6ba8..570c5a31016c 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -164,7 +164,8 @@ config CC_OPT_ZERO_INIT_PADDING_BITS
>         def_string "$(cc-option-str,-fzero-init-padding-bits=3Dall)"
>
>  config CC_OPT_NO_ADDRSIG
> -       def_string "$(cc-option-str,-fno-addrsig)"
> +       # supported in clang, not needed for gcc
> +       def_string "-fno-addrsig" if CC_IS_CLANG
>
>  config CC_OPT_DIAGNOSTICS_SHOW_CONTEXT
>         def_string "$(cc-option-str,-fdiagnostics-show-context=3D2)"
>
> --
> 2.56.0
>


--=20
Thanks,
~Nick Desaulniers

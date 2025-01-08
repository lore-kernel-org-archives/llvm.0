Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920DB1A238C
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 03:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305212; cv=none; b=emMmUNZ91IzUNCn09w6YHMV44oD4KC6EQIVfuXQb2+BVz5bjgV74Y5WVR+/BrKuucCZeQ8vMO7ZgCjkxEYbv+EsNip+oxA69oGqEQKbUvs/OnaYu+UdR9+oQXGCB1nfpOJ1ybgWOpMEDdJAFJ7AdAk+0V968GqXoBF8xQYg1+8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305212; c=relaxed/simple;
	bh=0VG17PRuHlW3P5YOhYh3yyxpCMq13IluxgCP9Xm0xDs=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=lxRvA+eL7w8Tl4N/OCJmnFPSO0XhrF/uESeSgJEJODpW8HxB/Eo7IkmLXKTClC0NgBKyuohkcMSZ6CEnPstsCS54WsVPeshAeMf0SNdj/j56xsX9A0M7vjfBSQb99iLTiItDjci2SBCtWTSZaNiyYZAzzjA0SAZt0HcI+ihEsLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Evd8NqU7; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Evd8NqU7"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467838e75ffso24144641cf.3
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 19:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305209; x=1736910009; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbS3FaNV2ZChC2KdX4lKqZIM1KAT1GNHxbb4N/ECpgI=;
        b=Evd8NqU7++FlkQCXdJm21KWkkrpUgIdvWTI+Up5atvAYejSCFijyEo29pIPXFrCVqu
         yUKCF2y+v+5oggq0gW3E6nIFmU2SvZmaKAYEnYmYqTnobduL3nIalWpa3NqGI/9YBYcg
         H+yzxIEY1P1/vqTy/Jg0jUSN3B1OJC5ibQmiEpo2ujHQcamA00hDJvNJkit2xK+4WO6A
         ls3Y8hBdNUEhT+mTnFwAcNQdWpy7UmPPzmUPqEvYi4KNrM3nNFMqj5fPPrpwWPEaIzND
         CyNzn3CCx1kPpZipBLTswUPnHuzriEmvkcOIW0a4/YsEjGlEncNYts6BPfKTySUfkRSz
         nSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305209; x=1736910009;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bbS3FaNV2ZChC2KdX4lKqZIM1KAT1GNHxbb4N/ECpgI=;
        b=Q9kCVNzqEYAUNiIklt/mynsBdSvtjlMHd044gcKedGHUE5g8AKUOBmPcHZ6fsVbc+7
         FzIavzunkeHL6Hc4VvH+m7Z00Heuglgq1DOrM5A2d2kxt8tmBi5Aj4A6UMQxHnb8Af74
         nf0gr+xRVuuyAlRJEpHtgEt9BddAnpYM0BZDtHEpxits8CSVH72QI8DBH/7Nd5GEHsdh
         PSvLdR2W93zWLOzu/xxoJsVn6powVa1AwwomZJO0gEvZajCn8FFX/F5YqQKm6ssgu1fZ
         eBon/MrKBmjX0SZIsDpI6j6iceRaE7edoLeEJvLs5wnyNhJoHjiH+fW7UcZEv8OT0BVi
         2dpw==
X-Forwarded-Encrypted: i=1; AJvYcCV/18oz2/eOdCaU/11GTkO0glMkOlwbh0btL9cFtzYbLGBMqG4NvSUOXxG8xld/3d+tsRED@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd7OL7eSS01779XyBBaSLKsfPUv5VDCV/6oZAQ9foOCNSToXBL
	+VqeypIvklRRFlTdqBCm1XvN0Zmfg/xRQkFOqZeXHgmp3ToPWlRoWN2Qr78t7A==
X-Gm-Gg: ASbGnctI7sAlPUScPI3ulVTAbFp90pCuk03CK/1p5c0HlaW6Cyuq/yfXRa3nsLx30UK
	SdK0jVb51z+GN7Nkc/FvSfcd7m5JIQ2zoVJpFIkR/d6e5oG4ZKyHPYnSkeTDYs12NLdJCVyMhGE
	B8fOljmA5vRXYb6bs1UIEEktfDTQ5uFPQSW+H4IKymF+zL2acpLcXewLe9FiMG93OcalH3DyFXk
	qQT9xYdE2Mc7HuilznDr+5YLSoTOx1URCt4Rymchxk8Ie+gb3o=
X-Google-Smtp-Source: AGHT+IGlvlEtC2oSxSG/w2tS74y+OnJ6UIskVvDabz5llHEY9yRt3+4BKZSyuRVj3w8/8HU/CBRy6w==
X-Received: by 2002:a05:6214:20ce:b0:6dd:d24:3072 with SMTP id 6a1803df08f44-6df9b1f453fmr22476186d6.3.1736305209150;
        Tue, 07 Jan 2025 19:00:09 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18110450sm187110216d6.44.2025.01.07.19.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:00:08 -0800 (PST)
Date: Tue, 07 Jan 2025 22:00:08 -0500
Message-ID: <00d497cd0162f3033c8c7aa57daf4630@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250107_1610/pstg-lib:20250107_1603/pstg-pwork:20250107_1610
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Eric Suen <ericsu@linux.microsoft.com>, Canfeng Guo <guocanfeng@uniontech.com>
Subject: Re: [PATCH RFC v2 15/22] selinux: introduce ebitmap_highest_set_bit()
References: <20241216164055.96267-15-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-15-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Introduce an ebitmap function to calculate the highest set bit.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/ebitmap.c | 27 +++++++++++++++++++++++++++
>  security/selinux/ss/ebitmap.h |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/security/selinux/ss/ebitmap.c b/security/selinux/ss/ebitmap.c
> index 43bc19e21960..5d6b5b72b3e5 100644
> --- a/security/selinux/ss/ebitmap.c
> +++ b/security/selinux/ss/ebitmap.c
> @@ -257,6 +257,33 @@ int ebitmap_contains(const struct ebitmap *e1, const struct ebitmap *e2,
>  	return 1;
>  }
>  
> +u32 ebitmap_highest_set_bit(const struct ebitmap *e)
> +{
> +	const struct ebitmap_node *n;
> +	unsigned long unit;
> +	u32 pos = 0;
> +
> +	n = e->node;
> +	if (!n)
> +		return 0;
> +
> +	while (n->next)
> +		n = n->next;
> +
> +	for (unsigned int i = EBITMAP_UNIT_NUMS; i > 0; i--) {
> +		unit = n->maps[i - 1];
> +		if (unit == 0)
> +			continue;
> +
> +		pos = (i - 1) * EBITMAP_UNIT_SIZE;
> +		while (unit >>= 1)
> +			pos++;
> +		break;
> +	}
> +
> +	return n->startbit + pos;
> +}

Squash this patch with 16/22.  We generally don't add code that isn't
used, so squashing this with the caller in 16/22 ensures we have at
least one caller.

--
paul-moore.com

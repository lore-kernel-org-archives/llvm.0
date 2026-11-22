Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795320368;
	b=kS5Pte4F3yHuNj5B6Jh95QT0j0hwDkHFBlF9n4M9q4I51gV6cnWmjmzdzv4bV9+FpSQo
	 B/ScyG3Pv0h+Suwwr6eRH5zOTPsNjMRXRuAUQcFY31zEYDziIYwWI9NWOSn9oecOHHwSA
	 Zo8ob7C/Mo43aYtYqePta3/e7MZH6dsqooZdp5U3Y1HEXhk+alGaIAQUdnfqWl1mSutpA
	 TusKsn9vN8XefVJkAHQPPSeFvY+WSuycrLB4xteIAoNGRqeRO4n3A4FjMYTYjolZy0jTZ
	 Os15bjFJw6a3ZjL3PgFQoa71acVkGMf+FTHTMYA7tyylejlRJkf0Q0S8E9FFiQLrtGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795320368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9PuR6BxW1bsGd2uW0XkZ13RLiKGF+CwssnUyvB4C4G8=;
	b=Kg6wzktmYmnPI+PJiR1BhmqImgn9XzIXwKjgMQkSgvnjijiNt0NmhhOkklqa4TSPD6n4
	 vPYanEBFbDGK4oiWjPZ0DWfdZuZTfeP6eVbItOLIDgFHr4ssgmlGKZSj8E7jp/Kn8N6ro
	 IlX9r15DN2GbG1UfU7I1My+RVylbovxwxXaQz4VtJno8/y/XHdxD5XO5DsAG3hGtnKkQS
	 9F9Ms7Ir4sKn12j/ZmDqWGRTz6M3vYCp6ar0g4CRRh3/JzD7cLZLOT6CcpDuqXwK+hbWt
	 4bvUbnTYcv0nqohu87vmw0fxJXAa8wX5z+xb6M6dR3dOgkBFFHh9d33Frlkg6nb0nXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qp9OY3Fn;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C44C606A32C
	for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 04:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C44C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qp9OY3Fn
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f00fc215f9so15222935ad.0
        for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 20:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795320368; x=1795925168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PuR6BxW1bsGd2uW0XkZ13RLiKGF+CwssnUyvB4C4G8=;
        b=Qp9OY3FnzrJfQZoHMD9a67hELZBhK+p7IsyMmXY+v3X40t8tNtEIVopfKwH3rp+28R
         vOiHq84WjnzpKNqYmoSEjCtDK+E7aW7ylMDs65I6w9I0sBy/f395kAK9Gn/PcCTnMbWc
         z6saJesUvmWyVg4PvKfSWKTNGsWQV2ELK9IXbuCA2zDxshp9dtFj/UCSAezLhKpotb45
         Yxo7teAICgXeak1oc8JgAxnVLcOvi4XCuuF9NVN0mTGEol0ZX4JFyvfeMeoFWoRGblsW
         GEGaD1PahNYB+nMjNWgojHdxpQkDvy9kMoDTTMZXJ15oJKOONCOWZE4ZsojSVBYNmsFj
         KmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795320368; x=1795925168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PuR6BxW1bsGd2uW0XkZ13RLiKGF+CwssnUyvB4C4G8=;
        b=J7IifJ2aXIsfKYFLum42awdauHV8/joI4dRNyXKIoKN6Q1uH7tU/8Lr0ccP1Zl2jOc
         EoDulluSY9VlLsHBIORY2zYlsKIGkSTYpvoTitvZTwtQ+lUNdK37uNSxayg0Gebry19V
         MxQpa/ruYPTC2kUmJRIeyFfLyofOtykFPw9QdeWwecNFnnYZPvt3zLwACZUTIRYr66F6
         5XYsiShGSQ1g0Y96ylLPFLe8NFJj7HNcSzXbtrgop3sA/YSak51DFwhxw+OUH+VK4ryS
         exDN2fgHLyoaCpVb1PM7P3UB2zuOqmLGdFEw82DU4mPunw8w4VNPSk2yq+xSXoxWsjn6
         ycBw==
X-Forwarded-Encrypted: i=1; AL+hErEl+se26ilGKQtgFPDpmkMO+1tXmo/7kJr8HXnauLaoePkQ0j7XGYYb4tTqDfi61z3ifTbu@lists.linux.dev
X-Gm-Message-State: APuU4Z8J3HWeiVYlTmochoU83UOSE/P4T3/V2DnhMEdUtOt2dBJHKdi/
	5BBFrBp6xfzTypc3Chj4HQvx7X5AahvKJHQmmALqNBF/dZJolQ6btAPU
X-Gm-Gg: AZFdTZc006k5NXvdwUh8vDxvKhumIp9VhrF0YSHuqsboc3nTc1WQp0QvHme7lkvGOTG
	oXy69bl2IBpgC/DLMRJWMGvgoUjcsMv6ebVpuWoHZ9GR7NBFX6Yf8dCtjTB8WkVu/jeAVSqM415
	yx3aY7D3l8KVShckjNCU65k3iMtMLFi+5Zr/x48zObZltDmEFOO5hd2KXKp6C7kl56BEiT0pDX8
	0gYGkrZK7W4sPELqoTXKuEWzMlxdq62BlIAzT3JYBXJA8RiGXBpyCTf8vr78aIpvmxe9aWS9CAv
	DcLUrF+1eV6Ttv8F57rUT194ts7ly4pBOGGWVMFv8YoxoHZ/JPse4nIGCx0/5ssH2GwVbi70wPb
	hkUApW1DC03BZsT0YdyKWHngsHfWdBvFzhH1EoclRF6NPoq+T1EvCVqoPTBsjVTGd7TMo0o4Bte
	DaFnLw1f/jY8HKzDj53weta2/3AZ2K5W2DK8PtoraC9pKX/4KZO+URikIjOR4dh4KtIr2r+TvSN
	RkTWvMjJKcjjHvI35WU7Bj6VVebvOGlEszhNKFmxmRp4day3IouW1K1YaDnFDDiTjppZc1uj4qe
	VFsUMsNhOy2sCntekVZtXShjuvhExNOb6Q==
X-Received: by 2002:a17:90b:3d92:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b41c8de8d7mr6039371a91.18.1795320367746;
        Sat, 21 Nov 2026 20:06:07 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm10947018a91.13.2026.11.21.20.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 20:06:07 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-mips@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix genex.S build with LLVM before 21
Date: Sun, 22 Nov 2026 12:05:59 +0800
Message-Id: <20261122040559.1120594-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <alpine.DEB.2.21.2611040746160.6502@angie.orcam.me.uk>
References: <20261104030147.3117325-1-shingekinocore@gmail.com> <alpine.DEB.2.21.2611040746160.6502@angie.orcam.me.uk>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the late reply: your mail did not reach my mailbox, and I did
not check the list archive until now.

On Wed, 4 Nov 2026, Maciej W. Rozycki wrote:
>  Shouldn't this use:
>
> Cc: <stable@vger.kernel.org> # 6.6.x: 56651128e2fb: MIPS: Fix idle VS timer enqueue
> Cc: <stable@vger.kernel.org> # 6.6.x: 2b6d718c8dbe: MIPS: Fix whitespace damage in r4k_wait from VS timer fix
> Cc: <stable@vger.kernel.org> # 6.6.x
>
> then to get this all picked up?

Yes, with one more prerequisite after 56651128e2fb: b713f27e32d8
("MIPS: Move r4k_wait() to .cpuidle.text section"). I will send v2
with it added to your tags.

56651128e2fb adds a .previous after END(r4k_wait), and the .section
that it pairs with only comes with b713f27e32d8. With only your three
tags, on 6.12.118 and 6.6.162, all the code after r4k_wait in genex.S,
handle_int and the other exception handlers included, is placed in
.init.text, and a malta kernel hangs under QEMU about when the init
memory is freed.

With the four tags, the cherry-picks and this patch apply cleanly on
both trees. For malta_defconfig, genex.o builds with GCC 8.1 and 16.2
and with LLVM 13.0.1, 17.0.1 and 21.1.8 (on 6.6.162 also 11.1.0), and
kernels built with GCC 16.2 and LLVM 17.0.1 boot under QEMU. On 6.1.y
and older, 56651128e2fb conflicts in idle.c, so 6.6.x is as far back
as the cherry-picks apply cleanly.

> Or is it unsupported annotation syntax
> where a prerequisite matches a Fixes: tag?

It has worked before: the prerequisite named by 4409df5866b7 is
its Fixes: target, and 6.1.76 and 6.6.15 took both.

Thanks,
Tzu-Ching

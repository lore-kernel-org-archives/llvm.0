Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95DD4086A
	for <llvm@lists.linux.dev>; Sat,  6 Sep 2025 17:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179071; cv=none; b=CDAB1tTeAWx89goljUN1nuvdiOSQgB/xEo/Yle6JNvuiqDMreGc2nukkwQQ8F+uwOsHGbGpgDwe3evP/EoOY5KdLvT/B0dyHOXkKaknLikC/QImA6jEzRK/wpnD8vLkuVIsJ/03ocod7vJc3E9VLI5EHQra98Kpov4TRTbaR4Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179071; c=relaxed/simple;
	bh=kKrq/MCCR73lY4AEd/I+jf9g1amuIeN2wz2wvgU7fls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVXBW71aKImx9cVh2b/fxTMYqfRV+7yHOy2qwQzlxY8FE60RGAtbmq9zoPxFWaeWG8XpszEGADiI3Ui+AIrxFhU5ayEjhhEqNYwbkKSoGMVJqEw2k7K+Z7HuXUsSLqELMF1qZMOhUgTeI1G26EnTou8slbSIwVkVnvhuwhmMqvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYpVaMNk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYpVaMNk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45de2f5fe86so644075e9.3
        for <llvm@lists.linux.dev>; Sat, 06 Sep 2025 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179068; x=1757783868; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLznC9wbj6fsrEsXcR7N+oZqquNx2F+cSjxXWY46pjI=;
        b=ZYpVaMNkuVY+3TbzqBHLaFej/VFzquflGrbIGqDaR1em0GgfFiWi8pipackOUrEr7H
         5BpOemXlp7ZYXDFrVrvEc7e+9y97ytMS4xU4I6NX14W7cIAMQyJJWnUOLFZ3of8MetOZ
         4m4H8zZKnW9S/5O0yHC3Qelmxs4KJkCXWQszexLCE3536gln4pivd5dEw+GBj5jZxwiX
         +QI0tcOHfheG+z5vmZN4gf6mwYIngX0N1i3vx0cOGS6MO68WRi+ZTP8RAvO8PRxuNAyu
         +JUyL4K0HcrifW0K2bM3isEEKRVF/FLHdxo2kHUMdu5cpNM6YPqcCAdryuUTctdl4I1G
         DYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179068; x=1757783868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLznC9wbj6fsrEsXcR7N+oZqquNx2F+cSjxXWY46pjI=;
        b=jScJ9itergk+Tu5J3A18XoWqWaDz7yn1W3EO0cVmf++W3JKL9PmwWgWzyliZpsq1L1
         9Cc9fz9qxfaDEWp+2OIizVuGFS6uu24jLc69aktSvh4P8x7m7PoPcVMDk0YGtgpsBy0I
         +E1liiBAXWEknFwC/lEPfcWvi5O5BJMHTTCCOh3pHccukSjmamMq81UjSekGOyzerfuW
         sIED1UbcQivCA8uyetCOq8Emvh/MHq93iXeafhxxXMYriPjxs7PmXTgmHQGds0B6WB6W
         pU2Rz7Fcp5W00niyRstF1+dGy8S1MUGcUz6pN5XF1fbU7RNyXWF838LvOQlRj2UApT+P
         8USg==
X-Forwarded-Encrypted: i=1; AJvYcCVMZvL3TgPuBorU8Ut8Ck6GehbWlP3Qj5GjkJvC9Z1G0a3Cd8PXp7qK8c2Syw2VU1iMv7O3@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkd3S4+Rk8nLwDQIBBR7UgFhiBrxy1u4HqXcb2qbXeYkMSxusU
	hbTqzr7bPsYMfneX8y4Y1gFiF5qJSEv8nTIMRVD4vfc5sY+8Gd8csRnAG21/GXOTQWo8hHnBuPV
	CDekt72R34j6znyFGwCOd9uqvthrX8rc=
X-Gm-Gg: ASbGnctcYekSBEvejtuxV06Zj/Tmb1SoCSlQFj64cq44HD4ZWfyCywKnmViCdn3Hqy7
	g9SakISYTSDycd0HmA9JS+2Uf6MDdSROhx7a4Ve3ODgvcNDIsxJfhx5lQY2DLF60/KoxsM0/i5d
	zzMCgh7wqfirj2wEzl8scncozFZb2JTEu9zv+APHxqXO4T6eP1VYTaoPJom4oLUiGdtz586sdp/
	b1bjPo1
X-Google-Smtp-Source: AGHT+IGTe20HJiXqLSJfJyxPwH5laIdS/e09aggAl2LoVQ0seNUv6wq8RVdpjnRNLbGjxROfKqJvUGIbnoDiK2kwDcQ=
X-Received: by 2002:a05:600c:3b1a:b0:45b:9291:320d with SMTP id
 5b1f17b1804b1-45ddded3454mr23011575e9.31.1757179067563; Sat, 06 Sep 2025
 10:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <98d2c875da80331a51a5c61e8a67ca43fc57cbd3.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <98d2c875da80331a51a5c61e8a67ca43fc57cbd3.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:17:36 +0200
X-Gm-Features: AS18NWBlGrTUf2BbYo1ooSpg8yIusv-EYuyVF2j8Xf3UqWFYOvg4hL7GWGKDqp4
Message-ID: <CA+fCnZeUvsvGy02k4zQwkGUkL7KbuLzah5XC7kp1m5uwp4bPVg@mail.gmail.com>
Subject: Re: [PATCH v5 03/19] kasan: Fix inline mode for x86 tag-based mode
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 10:26=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> The LLVM compiler uses hwasan-instrument-with-calls parameter to setup
> inline or outline mode in tag-based KASAN. If zeroed, it means the
> instrumentation implementation will be pasted into each relevant
> location along with KASAN related constants during compilation. If set
> to one all function instrumentation will be done with function calls
> instead.
>
> The default hwasan-instrument-with-calls value for the x86 architecture
> in the compiler is "1", which is not true for other architectures.
> Because of this, enabling inline mode in software tag-based KASAN
> doesn't work on x86 as the kernel script doesn't zero out the parameter
> and always sets up the outline mode.
>
> Explicitly zero out hwasan-instrument-with-calls when enabling inline
> mode in tag-based KASAN.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v3:
> - Add this patch to the series.
>
>  scripts/Makefile.kasan | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 693dbbebebba..2c7be96727ac 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -76,8 +76,11 @@ CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress
>  RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-hwaddress \
>                    -Zsanitizer-recover=3Dkernel-hwaddress
>
> +# LLVM sets hwasan-instrument-with-calls to 1 on x86 by default. Set it =
to 0
> +# when inline mode is enabled.
>  ifdef CONFIG_KASAN_INLINE
>         kasan_params +=3D hwasan-mapping-offset=3D$(KASAN_SHADOW_OFFSET)
> +       kasan_params +=3D hwasan-instrument-with-calls=3D0
>  else
>         kasan_params +=3D hwasan-instrument-with-calls=3D1
>  endif
> --
> 2.50.1
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

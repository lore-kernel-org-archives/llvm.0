Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE23020B7FA
	for <llvm@lists.linux.dev>; Tue, 12 Nov 2024 07:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397509; cv=none; b=oF8zYw4eRGN5mo+Ig/vtdCA8FE2t1iT3i+q/N+0EN7BFZzIzhpUjupsm3NhXhERWrSW8/sFkVbGP1i15rF/1zZj9JfuEQhppUDPeEZHjyIrHX1QWBlI1LKjrS7vmWxSIaLd/OlzsSVkX16Rb99jj/ywH2Rgu0KFn0gqps9vwUug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397509; c=relaxed/simple;
	bh=6Co9+HFhkrAyybpuUDGbybmXfat+6GD47OYnwCaf5jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khCgzn1DwhJ/2/ScmIljzz4wRoLNrOFMFwwalWt2Fs9PukjqM42xIhLnB46ns9GP5H8Koj7UU1r0q3IbPNbc5o8ZG9TH/OCERduh4rrdoHVCzt3dSDRnH18U81vsoFfK5Gcb8vRjQSrWd2BQxD8IobN3foJN+xu+cIZpHf07KBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXu29udE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXu29udE"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53c78ebe580so6887770e87.1
        for <llvm@lists.linux.dev>; Mon, 11 Nov 2024 23:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731397506; x=1732002306; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PvuH9yhCeBMlG36zLRmS+IcsMk1yHd7W71vxP6lAfWA=;
        b=FXu29udEBqHaoYfMi+XMmNy79O8xnv9qnPZ2XU5MSUwpAXzcwu0H3OaukFlf3m7qAq
         fGjqh1E+w/K5G+0aVbuljrb1sfo14owd3D1ZbJFTHs+utdc/ESU+DwpuQK6fUOWq0QfQ
         ZeqXlTS127quq7lg2Qu4K3I9cA2nrz7B/lDLy7sfEPxt8hZn0iCrwoQWMEDFzDSVBuu1
         JbcsOdm5NEiSCYGiFnuyT3N9FJHPiGNg0FalmYTZMa6RcxZ/vvvB3tly5SQFfFEunkjY
         kOVClMK/Bxn1ehiMNNVXJBPAkIRSdjHaE0UjNrSXhfDCUDtqI5e8wSaHvnwSjvAgJqnh
         mQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731397506; x=1732002306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvuH9yhCeBMlG36zLRmS+IcsMk1yHd7W71vxP6lAfWA=;
        b=cK/wfosqxeymZMap6IMIRuDiKs6yx32xfLsJQnAAMe9/+MTswRMf3TYtb7uP3IFqmy
         7yHWMZLF+mzdM/LbmW0x4HSkIhriQh2LWE3hI3h32a7fFuWuF1yOMp/e9mtHXuxGVOTG
         ffK7+T+LTZszCh1EaqAE9kII6eCCOmFGaRCV09AA45ZiOEn8lTgu6ufJD9MFL8NZxIKj
         uVaXek1w2TVuxvRboh7mbMauBbfGUB4bxCVVmJoCsFXFMuYzMPV9LOc4t1S/tHP55MzQ
         ZTTWrFks2b/yQWs+geZ7ECRHQrmU6f+2KMC+YSH/81PXRK7Sjcu/msROLY/8Sgh8W/a4
         5+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCV/tAzkvmc08eqYcy4rVk/XSr2rQK45hu4336nflBl73ZU+XfyYyL7JIbLIa6o3hfMx/2+P@lists.linux.dev
X-Gm-Message-State: AOJu0YzWZntjfthrAHcaG5ofOAMGlGDWloTN8GCmpCYWYfMTtSSkkJUg
	bSxMMc8camPQwUksjomY5sIQPwfFo50ezcfLaKT0bKCklh84KOW2
X-Google-Smtp-Source: AGHT+IGMIr+lUOiAWgiLqS9sR2Hcfvkf2KB7t1d9QR2hVKbD3J5J6DiuP1/RdyjRc4cRHYP/8VQpkg==
X-Received: by 2002:a05:6512:3e17:b0:539:ede3:827f with SMTP id 2adb3069b0e04-53d85f231c6mr5858903e87.24.1731397505707;
        Mon, 11 Nov 2024 23:45:05 -0800 (PST)
Received: from ?IPV6:2001:678:a5c:1202:4fb5:f16a:579c:6dcb? (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff178eec81sm19427331fa.33.2024.11.11.23.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 23:45:05 -0800 (PST)
Message-ID: <70772ce5-9dca-418e-9714-80ba4ae28959@gmail.com>
Date: Tue, 12 Nov 2024 08:45:01 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] Adjust symbol ordering in text output section
To: Rong Xu <xur@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
 Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>,
 Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>,
 Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>,
 workflows@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Maksim Panchenko <max4bolt@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>,
 Krzysztof Pszeniczny <kpszeniczny@google.com>,
 Sriraman Tallam <tmsriram@google.com>, Stephane Eranian
 <eranian@google.com>, x86@kernel.org, linux-arch@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20241026051410.2819338-1-xur@google.com>
 <20241026051410.2819338-4-xur@google.com>
 <44193ca7-9d31-4b58-99cc-3300a6ad5289@gmail.com>
 <CAF1bQ=ShjoEQZGPjDoy_B6wZdD_jr-RevVXwEDPA_-o-Ba0Omg@mail.gmail.com>
 <e7cd2746-0ad8-452f-aa12-e3a37e8a9288@gmail.com>
 <CAF1bQ=SYeeKLUTfbqw-KH1rHJCj_CfJBuk+mZUrnnb7aDjRV2A@mail.gmail.com>
 <CAF1bQ=R18HLC2vjCGj+M=VYidrVzz3RT=U8cckXgpgrxc0kG0Q@mail.gmail.com>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <CAF1bQ=R18HLC2vjCGj+M=VYidrVzz3RT=U8cckXgpgrxc0kG0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-11-12 06:38, Rong Xu wrote:
> I compared the System.map files from Klara Modin. The linker script is
> doing what I expected: relocating the unlikely executed functions to the
> beginning of the .text section.
> 
> However, the problem is with the _stext symbol. It belongs to the
> .text section, so
> it is positioned after the unlikely (or hot) functions. But it really
> needs to be
> the start of the text section.
> 
> I checked all vmlinux.lds.S in arch/, I found that most archs
> explicitly assign _stext to the same address as _text, with the
> following 3 exceptions:
>    arch/sh/kernel/vmlinux.lds.S
>    arch/mips/kernel/vmlinux.lds.S
>    arch/sparc/kernel/vmlinux.lds.S
> 
> Note that we already partially handled arch/sparc/kernel/vmlinux.lds.S
> for sparc64.
> But we need to handle sparc32 also.
> 
> Additionally, the boot/compressed/vmlinux.lds.S also the TEXT_TEXT
> template. However,
> I presume these files do not generate the .text.unlikely. or
> .text.hot.* sections.
> 
> I sent the following patch to Klara because I don't have an
> environment to build and test.
> ====================
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index 9ff55cb80a64..5f130af44247 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -61,6 +61,7 @@ SECTIONS
>          /* read-only */
>          _text = .;      /* Text and read-only data */
>          .text : {
> +               _stext = .;
>                  TEXT_TEXT
>                  SCHED_TEXT
>                  LOCK_TEXT
> ======================
> 
> If Klara confirms the fix, I will send the patch for review.
> 
> Thanks,
> 
> -Rong
> 

This does indeed fix the issue for me.

Thanks,
Tested-by: Klara Modin <klarasmodin@gmail.com>

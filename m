Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794544353;
	b=LcJw2PPznw5FnQMM5U/MGEl46pJj9vRGKS1eY2Q43ycsUb1EdQojv9aEGwzfXbEFBasc
	 yxpBFFc7COQ4+N8nG+P64fGVrdxQBVrXNZnnOgDAGTVa6/0iuAQSNhQW/1rK3m70348ri
	 E4L4vUIE2fUj27Yzu+lXEmbaONaND0GwtL3A/eo0u3oKjghl2MhWXx2kn1Rn/esAJz6Ez
	 JV1K9f396kDaaK4lu/l0oi6cmu3S+KljBhCMCRA1YnJFq1Kd/itaDXCWvlJ631S4Lm9Oy
	 2Gc9taSLrKra3zD8vi/83d7eW8yNZNLTXtky9HzEmxyDmSNn+QIkIsJaT6VJV5DYROQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sCCLjXvB4SGerpvauilZuDN1HnIkE/zMTqJ1S6MMnw4=;
	b=OfY5JnSv8sAXO6Fj2vzUToXpkQIV0mHAAVI9yNLLQnL2JNBqonJIStKAPK1/9XnuIKS0
	 j63aGOoFauielGIXDURVfPtCxA820RGMUn5Nob/kXDz01XRRQpCDGjq0lDpO/st9nq6pd
	 8ohp/71fNaKyaGmXZVqFI7o+wPCd2fyHCRWMti5fwh/eaTik5MUd1RQji0B6GQTbamWaD
	 YLi+HSZYLsZ2Dat7+uyLTiP18KvIVTb6f321Rv2DsG+Iwg47dx+cQZW4ZhzS861q62TBF
	 P2i04XNcGiSX3zDJsdWT9/N41y8qsLih+Nvzy/T9aNhfOEye/9MVyGth8UedAM6VmjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPFYA56j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F9C606A321
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 04:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F9C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPFYA56j
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b10d24345dso6190697b3.3
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 20:32:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794544352; cv=none;
        d=google.com; s=arc-20260327;
        b=sMCLY26MHBYYI/j377JrwISf2XluprkiHMFNZv/4zFdMqQrsqbm3YTDM8Y1Aph1dfH
         ETquXiyGLKvjIf/w0QZx8FOyhSjkQulkw15Ti1rwEa1Vp1pNQF1MRjqDLgVFuYqG7oM9
         Ba+SoHDyEWZWO+oOoBE7tirPifxFKpccoD6X1stee8cuckSekyE2Bu8B4vSDasLIlabC
         th79mAjNq+01tbgXnekdah3FTgOiR4CoBbZ59ZsTozYxyi/y6TCRjDYLgJFDAEjUt1f1
         3gDG0RTkVL+JFO2xL2ICjRsai54/BpffN2MbYM9QWMMvDf+ATCziEobUIb+FlBnhsdT0
         ajUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sCCLjXvB4SGerpvauilZuDN1HnIkE/zMTqJ1S6MMnw4=;
        fh=3SUnhBi/vHZEEktcZX5uqdYjra8/Lxi9erWYf0agn7U=;
        b=R8Y7Gea9kku1Qs9yeVr+l0guuAhhp50vwVPh44/LFUozCJkRBdB+XEMWus+I8ZYC+T
         1a5uW6xQo0vn/chxsGslSZZBr9ugvx3NKrdgxzGUw0mzz0ah9yPsv054cM6ujMX0hx0q
         7/1mzlqbZlspgsySzbKQafEg8xo068eH/l2qSpjmdTu/gzpzYt3dz0rEP2k6cFpo3MQN
         QdNu2rP7BQiyd62b8IP8vsSj3KrGdEebHe7u40gvuBzEoWJXiguolbYj6nNHumG7rNkE
         2IeSEJpmzGrAflXsoOMYjrKw2IUC3QWvCZRvBl8dia3zU/37eFURgZJET72yYq/X8+2Q
         Cy1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794544352; x=1795149152; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCCLjXvB4SGerpvauilZuDN1HnIkE/zMTqJ1S6MMnw4=;
        b=ZPFYA56jNeO5t003oyoy3COGqw6ioiYcG9QSf/TUmlTwXoEBy4v6F5Ypv9OayqYk4p
         L4ZMWkIhGVwyXGpnjt4Fo/Oy8BIr0k2dPK3rRn4e/UOAQqfjIyTx5cx2jnFXJSstESn5
         PokohC0PedOqG9jcWCwzWBmJZRAryOt9QxyEsP1pCt61hMfUEXATjihCtzTfLbat9FrR
         olWnf8cXSg2BuUDopFRnrktDnlCVn/Uv0qL0NaLFnAiRJyQz9g1x5exnEydWM7AiXhjW
         ZvUu055OTphy1ufY8XpsJeTALWXbH7Hn7hpmBI5rvnF0i2N02LJBSfjB4Z8opqKempCJ
         4rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544352; x=1795149152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sCCLjXvB4SGerpvauilZuDN1HnIkE/zMTqJ1S6MMnw4=;
        b=DgRCqIiQhTam2wvZQn3bLE6aAGDbeH9v65fS5iqLRSQ+lLenp3uW8YPzXGsitT2BVa
         0pxYEQAajTdWq0r3x/mvYmaAsMvC8gNMxak2QW2jgh1+CaiGhVmAUhL5J4X6ymoLVFS1
         gVSufClzxoptanCln92e1ODT8KuBP1KDw+2GeBCNeQK7nxav/q25RzKgeA5DJnKaP3ar
         HXWximeRHmSxkyP68XFWaU+btHX1ijwPXmnvPXEw5zYMCrMpZR2cstr0fGTYgA8nZ1Fc
         iXBOOoafgQ/JA2LxliyinZEn6X0rWDYrbgtSODiyFnfcK8F9gN4XzdKhgpEWOIa6b4rq
         /SKQ==
X-Forwarded-Encrypted: i=1; AL+hErE8pSZTdRFa9ssD4wNllr3I6t4o3vDRzucGACS8IbiOr1xKZNRaRuUD5PQr7QQEe8UqnmJo@lists.linux.dev
X-Gm-Message-State: APuU4Z+nS4KdXjTjEu/Pjb6dfTB4UfqpyAI4UiUSMsoT49K4BoLlhjJ/
	HN48cqXnGmb8m3XWHiJD+EcnxLtil2sMLtL+8Ph7yEnux1+fTx2kwP/8doXdUXqsjttCAGn4zHc
	LQJ9Zg2ltqLiqaQSkV8lxSQEGt3TmEbw=
X-Gm-Gg: AYBFou2u3FxWfl2xFarAhIGLqY3bnNw9Nj58tEU4EgPmW+xpsi/YIp4hhzM2rd9t8VL
	r2xqZlYbsP881lhxf1G0jyAaXfIjQJ0qKOsL1zo7xC2VahAT7LqFomEzQ2WemACBYApXfU6GzzF
	L2T2vwe+aW+Gea0l5k42FSufG+R4AwhLXBg/r2s4EsdhrDqKl91ZfNwmzLArBQbmoSsavp9U412
	+y7Lxobmv/202tj+aWaIJvh6McUhLsB3g7OwOk4tuizrK+JcRXNLsNTwB0uNBEyzirvWB26Vm95
	NOqF5NjnDUSW2RyeRtZsjeoECmrDoi7O9xYoxbkTJ0zbq5RWODUtmgFGGdeexotzbhTMP3LYRk5
	KqKR6HG8oq/rUpff0ahjYGvFkumFntZKCktHmDg==
X-Received: by 2002:a05:690c:e3ec:b0:8b2:e0c3:1f4d with SMTP id
 00721157ae682-8b4aa31790cmr11872837b3.37.1794544351872; Thu, 12 Nov 2026
 20:32:31 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
 <20261104133158.3187525-2-luolongjuna@gmail.com> <avZ3jEbnuVu5Qv2G@jpoimboe>
In-Reply-To: <avZ3jEbnuVu5Qv2G@jpoimboe>
From: Longjun Luo <luolongjuna@gmail.com>
Date: Fri, 13 Nov 2026 12:32:20 +0800
X-Gm-Features: AclHuK8qY8jjtI7qXkHC9b17eYQlt9s3RT5E2Xs4WB3O8zx_JowBcXEsuGQNeh4
Message-ID: <CAKL4jwX=ctyjXmm=Oz_+HXe89vOHWHgT_-KGyL47fOBEQTYJiQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/11] objtool/klp: Fix checksums and copying of
 wide strings
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, puranjay@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, live-patching@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sorry, I left out the debugging context here. Both comments refer to
specific kernel build artifacts:

On Thu, Nov 12, 2026 at 06:42:36PM -0800, Josh Poimboeuf wrote:
> Please give example(s) of such "wide strings" in the changelog.
>
> > +/* Wide strings, such as the u16 PSR setup table, end at an all-zero element. */
> > +ssize_t elf_string_len(struct section *sec, unsigned long offset)
>
> What is the "u16 PSR setup table"?

PSR stands for Panel Self Refresh.

Source    : drivers/gpu/drm/display/drm_dp_helper.c: drm_dp_psr_setup_time()
            /* macros expanded */
            static const u16 psr_setup_time_us[] = { 330, 275, 220,
165, 110, 55, 0 };
Section   : .rodata.str2.2 (SHF_STRINGS, sh_entsize = 2, Clang ThinLTO)
Bytes     : 4a 01 13 01 dc 00 a5 00 6e 00 37 00 00 00
                        ^^^^^
                        220 (0x00dc) contains a zero byte at offset +5

objtool   : strlen() returns 5. The checksum hashes only 5 bytes, and
            the copy includes only 6 of the table's 14 bytes.

> > + /*
> > + * FIXME: GCC's range_string() uses a one-past-end string pointer.
> > + * strlen() reads past the section; preserve the string base and addend.
> > + */
> > + if (entsize == 1)
> > + return strlen(sec->data->d_buf + offset);
>
> I don't understand what this comment means either.  Please make sure all
> comments and changelogs are written by humans, as LLMs tend to write
> nonsensically.

Source    : lib/vsprintf.c: range_string()
            p = string_nocheck(p, pend, "[range ", default_str_spec);
Section   : .rodata.range_string.isra.0.str1.1 (8 bytes: "[range \0")
Reloc     : range_string.isra.0+0x9a: R_X86_64_32S .LC22+8

GCC note  : Uses .LC22+8 (one-past-the-end pointer) as a loop bound without
            dereferencing it.
objtool   : Passes offset = 8 to strlen(sec->data->d_buf + 8), reading past
            the 8-byte section. Fixing this requires tracking the base
            string (.LC22) and the +8 addend separately (left as a FIXME).

I came across both while testing on full kernel builds rather than in
production livepatching, so I'll leave it to you whether they are worth
addressing in practice.

Longjun

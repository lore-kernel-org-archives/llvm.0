Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653871;
	b=hH1QztPletJOpAkkq4y4D5Fh8l0SD5XYmB3J8gIXt+NoAdVk1dpXNlAx/2IyvnybbuLV
	 OYk5bqgAzGmECmrimuRrguHKarmqqRh4bCMiz4S2rowrIjaieYNltytz+i3t14mi5LlxY
	 I7LbPYsUTPZY5uxRGzXEeaFaS08jou/vHPSoHvcoOfo8CBXPe97PXg+XHQojQPDCtoWCF
	 tVPG8oSYhhwDPzsqJo11eY6Q+qy+cYl8b2ugqwNADjfjjuWt8s37I6sEZG8OGDtGcrUgf
	 FIoOC3LI00jzoXXYW1OJYcmFJV5WJV70ZJPK7ghqYQsstI2LPMyUoHvHd+SzvLy4u0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
	b=zpCpCflR2BSoFCu0JAOlOjnpOXQ1kgL2aT4crl0cJip9PFswE9vJrR5TlwYF7oWJ0Qgs
	 ro0pGVa1x6DiFBcgTjMi0Fp9h7P1cntPbaliYkE1Dv4caUuLgJmmRTjMSxB8x45fw924c
	 WTH1oG2jD/JImgu/IIL489cOqBd0Gyg/Ex34hPxGfh6eSr4XzbKNbkcVr0Uin/YibBcXa
	 gF4oFgUHlegA2X8QC6Fwl2Zt3h+Z9TryAnI/3QkiJrJmN6Vi2XFIA/jE/IIE3MevgJFh0
	 SlPQWWaRxgCTxPuK6hWZJIJtiOZ22cTZRPOoP+3CDtRVuPwLrAA6K5VL+OzJPtjnXag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G5d+3jKj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85535606A326
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 00:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85535606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G5d+3jKj
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5133831027so909696766b.2
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 16:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653869; cv=none;
        d=google.com; s=arc-20260327;
        b=XhHB9632Lh9oa7Pb0ZeJJqh/REYDSGsreJsL0liLGnHDXMgIIG9po7qQLWchjNIndg
         GbDMt0n0pyrqcMX9N6gNNhhe3K6AY2/XYKWR13Z2Ml5RqQ/mpER7kLyH29Xa7CIkbAft
         D/EhiYUTYLOLS9MlN4dM2uNKOcwO0vaZ9Bimy7V7JnM5l+6RsqGhY57pXL8bTX7i0Ktv
         0YCSXOY/Fgj2nNGaMj740steE9F15UFUXaFSfUAupoUwVObMRxOZT+TTQOgQ/zA3dk/z
         bPmaCJmUe6E0OESxYeiMbTvcednBcSl+83Fidfwk1+SP7qMycf+KThRiJB7oKlG4BHvw
         b7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        fh=nsztrI0MOzEEodXX8px7kCY81GJTDzBJZXjq3EreVgc=;
        b=czUnZu6iw+79EueLBWvE90HDNwMJBEjXQjvv5byDIIXhRyJ/HJmtX+cEOEsB7Z/jzu
         7PrdtpIGr2J/4eGDWwvWO9+7ZJeRCVQi67zhBd7kaBVA5ufvvHkV1ZdyFstdn+5yYPat
         EupTHh082tDBdY/HbAfLOltArorZK2wPREDVDVA7aKSp8OxTwqmqa4j8BjS9f1d666tV
         9P/E1j8oNstbDFL7F9QZeDoPUxCWmc85fYkSqszBcLsEBiWjbMtTnS9nFkXvoFEwX9a7
         EL7R6iNwHFxfjVghYpndCdHWgODKLsecfCeTpdo1DUyXxN+GXLMx8WtpgMNirqwq0Dhe
         On7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653869; x=1796258669; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        b=G5d+3jKjce9rqESe/KYXdNeHfl7iDBCEDID72tg5DqgBHIAA+mq6dst9GAr7z+NG/x
         WWdkuJLd4vq2oxhpUBOYaPEsPVzm4jv7TWkTPeBHX4ykE0KcUUZGzCRGtxIqHoAIF1UH
         lfn9pmBLhKyt/qnbj27ObSy+ugDKuwnOqm5tVjoq6K6WgkAzJ2ULzIC5VIwtG1AdxvUX
         kTmYOq6uqGX2fJZ8DngtsTmqAfJaav4T39ZTL7DE73WMXnOG4rVhMHX9tdZxl0L8e7ye
         z/1m8tFV4wAWuqQAQjIysu16XF1Jg43vlzwWvNYmgd3IKaVx27MALeekwzu8IXe1n237
         nC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653869; x=1796258669;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        b=JBQfOPCC4dTe/GTrfWRL7QwqCDKGd+n6gaQzi0nfPRxXiNAR/JJKFpe2CzDIb17nK2
         OjEw7+AgxrZIfLzftvyNBpjUeD7B/udXpLk1gPsGsgk1D3++6dPftEn7XpTDdlyOyFZT
         piOPag65GG7MwRybUIInGtafejqrsanhJ369blgXyqhfSnxN4lsBP0HmXjihnELEjRt4
         4TG2CWv3yLIdad/wF0Z/YuA5jGeq1hlwA7tdijW3Wt0bgj+f6krvZ0lL/JU5zBdVIdr5
         HD9jU5xH9oktR/fEU7nYvOmpQViCoK9sJyzTS/hdXPL0tdF4P3x20E+sUVGnQWuJepi3
         tK0A==
X-Forwarded-Encrypted: i=1; AL+hErEyaFkxnWsbPctUscYq3BnVSpsrasRW3I5LfpeY7K4SpM3oTex0JfCcjXAnaE421vofNqgs@lists.linux.dev
X-Gm-Message-State: APuU4Z+8AtEtmk6vJCP7/2yBea02lW4/unW9BUb5um5bTWbD8NlML9i0
	tIdxr1cFRcHKeV1pPHWPzW8y/M4YFsJGdThahMJWdRHwEBLz+8bxZBfSIod773wPPhHIlsgbDSz
	Wn2+hJUAMBeLrqjv7ZjnDfDgE9dlfppFbj+GSecJe
X-Gm-Gg: AZFdTZeRuXBxq76zPvByAz324OtVGdV7PS2C6HIzom9Y0H54T3uFd7a00vYMFDFc0Tc
	t87ulMegj+kxP5+JhKzsSuREAofSDIEKpgYnRtNvf9N+LhtYZF6+eUgLWG9hHsueEaRV5g5R3OU
	dzUMpFxcaitdaPBEgsvau9eyuhD/fvfTo7SKy2CrqzgnTrXvQ4E2NxGe2y9kfIzBoMpCBlZ7hwu
	qZBp5GReGx0gc6uTHJL1ZsqPArV2WCGCV2gSGbMK1lIzpIlSltq3Rm/O1VY2Fwtti/HrQVNmTrK
	7H09NUnW6L9DuL1hJfBinCMWORABOfh2Te+smQPSOWI01kqbDUoFfwLRm9lgnlvzRE0nmyseErK
	/HHmPxUO2q0+AqDkgcQtwu5ccjFqI7kLzruTVsB101jRLeuD5BBK6gFz99foba4nwav4=
X-Received: by 2002:a17:906:6412:b0:c51:24eb:e5ed with SMTP id
 a640c23a62f3a-c513aabb094mr1147878466b.42.1795653868573; Wed, 25 Nov 2026
 16:44:28 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-13-wusamuel@google.com> <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
In-Reply-To: <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:44:16 -0800
X-Gm-Features: Aa3M54p3EatRpTsPAm_mcmxJ6hPDpQs1114Xl7F84nCmfTvZhGsQScuZoJFkxmI
Message-ID: <CAG2Kctr+6-EESkYn+Dspg0FxTOMFRoj8269UZaNNDFNf3d+bHw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[...]

> > --- a/include/linux/kallsyms.h
> > +++ b/include/linux/kallsyms.h
> > @@ -24,6 +24,13 @@
> >  struct cred;
> >  struct module;
> >
> > +/* Exact or prefix name query, optionally in one module. */
> > +struct kallsyms_name_query {
> > +       const char *name;
> > +       size_t cmp_len;         /* bytes to compare; includes NUL if exact */
> > +       const char *modname;    /* NULL matches any module */
>
> will "vmlinux" match just vmlinux? or how can one express "I only need
> symbols from vmlinux image" with this?

At the ioctl layer (patch 3/9), passing "vmlinux" in query_module
restricts the search to vmlinux without calling
module_kallsyms_query_name(). I will clarify the comments in both
patches in v4.

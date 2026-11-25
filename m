Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638304;
	b=P7ue3h8TZdV23RzXlNPwvp0Iur75Zas2GuWrtGvt5wasOi8xcyoi7Y8D+EzzB8iGCAhD
	 dFHaFrUw744r5+FTfj24lV0mCiN7WTYEKeUEJ9bGYgosw8WHOifEmcDYeXhj66118ALYN
	 qKj3reAepnwBq/mrduhy52MmTKOQ5Nc9tB6dT4VgRTM9dZ0UOF1vUrItHDEkndrllg2Sb
	 HnZ8r/WcDDeR4iniH93B4wUqe/LDTAPj4Hiip73gbDrcqZbAkbSgsBTC8QLKPbW/kF0Xr
	 aEZUU11/qMZO0NTRvrA75z4q5xd8qC5ucoQKux4pYyeLhx9xt/ghgC0o2DNpwn62PNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
	b=YClQNZD4+s5rhoi5kzSl5bN1V0qlES9FtMUo7upev1NUJUcpKmRn2SegtqtsWwpBO4DB
	 4OumxhubAfg3c4DR3EzQqfqJJ9fal91fmA5Otq20B/rxWeViQoKQhWbhkKRsq5BOJkAxV
	 hlmuwRwZJ0OKTqH9Bo/LQLR4sckFbPp1g2xa4Y/F3XQ96RkZUbnMCjU9C+5qUSqAaDkqk
	 HkopQ/GsWFY9MKaPJPdex3KIv+aFlSe8OMAwi9O5e7iX8aiBOzIxz2cbc3E0hqCGOMuRF
	 8eZr/8zfdWqsgYtIlB33HRuR0gwyy8rtG4Tgi7wpcTdY+4BSf7/7UEJ9RwQXIxGsN9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+90BSlQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8723E606A327
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 20:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8723E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+90BSlQ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so10735805e9.2
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 12:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795638303; cv=none;
        d=google.com; s=arc-20260327;
        b=o0TuC4/LVFP98lfbMIkVHa0BB+CmGwd+0I5/p4W0Zb02j8unr+WTuQ+kURAzBOzKST
         J18Jl0HTtfGSUTZLg7tMJA9LruaW1IFq07TnxmA/1upJLdqCTW8MPqf5GSw6WzQZiLVW
         gcXvP+zowfjv5TLjT9IjfEO7CvGoH9cCn3MMAbS6Un2VehcNsZjhotQw0jjVoPDO4bRj
         I0ky3pNkMJKvuCndEDN7MmEj0n3qx/JVvSJDHVVcz5Me1ipSDSRpR2votbqSRDDdzXMZ
         fAnLzsaB/XfvfEI5k3WNuYxbzFEZdoqVFpcHsS2CKgXBDKb4WZf6MMSsTClymEE1DT1f
         pJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        fh=vrbd8XUrJsROMDwtrKKORsIzcRDdoKfbDZ1eCWtACtE=;
        b=BifJpR8uV2NXLpuaKFIBCFKrKx/c8ry5FxuEWHp36likEANeQM7zL15NunY0Me3A80
         sninKjdPihN+Dld7fhn8PTmwfdEaZzTB8JiK16eBwZ7uZlfSLddamIK1YKUrdnxV3nVe
         GIySEawgYqtlYKcpdm2zqSjP3lz2iCm7MpWh3lqAml0Ns8naxibKd8NQGbcsBEF2YMVf
         P1CO7KREkPeWYRrth7AkbN+94XutyQYfI/pPp5fOZ8g+mTtFPkqTCaX11BpNCpiSZJd0
         IwNJuK0xMr3myzfghRVpHQxGW6T0UPeQ7uu1C34FyR0jliRTOVvumq7hEOv3n1dzEUI1
         qfYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638303; x=1796243103; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        b=k+90BSlQCTa7mUfzvQaKBnFTGmgfAjRNRbqnQw+eDORnwTbDdBD6cnLq84+Hv9sPK/
         zeOF65H91Gak8mJ4npfngQC+ebcpY9p/hYB0vIGnYiCYBL9HXORjHcFnRsWlbuhmvpQy
         lI+fvEejWvLFUtIeCOGMwSzKoRRbvtSmHVT4c1DIY2IttE9f7KNo/GfkvG6u3ZSGeifP
         X4B+P6T+Nv9+abv93zF5itL/mCyoZzY/tsikXcDZkO4Y7y7tr5BKqOLFXZ49hG+WbK9W
         pzw1nVUBpfW6P6SaCYUQbzc1SmCvjxDvqq7osB3maWCJCK0uqRSl1L/sVTk7CWHbld7q
         Cjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638303; x=1796243103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        b=MyaRK5sMBEybgrVN/khBq8c+MWH7VhOqu0nXWomJmZqb/cBTekfFvCM6OUjMu+XKgf
         eHsLQqC486FIH+A8vbnJtoS7OM79cg43WdUfcrjvZtV9uffUoDltSM7efC0jrv7Sjwxx
         2lHRQi5vbdr6C1NJHY7T39AZQbsM+ZOrXieciiqDxtfVPYIXyFsmH0no70l+Val9Zys0
         FhO8Ia69zphN4vbYlBw/UG7N0gu1xJr3t0fEZ7I5WpuTTxnWNX5p7a9GzAJ3kmuDmUrM
         xHl2LLDtfDMaqnYyioG8YErbRzFazwBFipUOKyUeJLL8XWsPiaIcgWimh2MncdHdzXoM
         zBVw==
X-Forwarded-Encrypted: i=1; AL+hErF6HkIp9HPK0cexJJ0Q0Q9qewKz46htATgkGFic3bFMMeIRlnFr1rSfQeXyYfH3uX639wBQ@lists.linux.dev
X-Gm-Message-State: APuU4Z8v3date8nRYfnt8jbIyoPHKMng2vv6O3GOpLG0a+o7m9qJJL2U
	lBJL0HCmBdpuegxRwfWOfNm4dCJviCBK53R0+4VeZpYlXSZAQ7GxzwAX1FKWGu6om1gCa0u1XTb
	BAbBXS8QCfMNfZ3CH/+4omXdt5WitFfA=
X-Gm-Gg: AZFdTZe/+RAJILRlaUIIEpk2ZY8buBTmSk8qcinc2a1MS/f/ZtDZdV6GU4AqxrZP5H6
	FkADGkrE0C4O9bnT5awQ9KWi2SeOR8H37zChiPvIIqNM/ZHKFqSwjBoqx6/UYejW+g6b3Bm6rpt
	RmoO00VqgrkRbSqLpch3kShNh5VT91R2zJk4UgUw8jX66Kx9VVWJNQJJiDxESqwHjQlJE15n1CP
	sg/F0VB6E1sVpJRsdLt6k/pA2AmlbvGMTvWFR3lgAG5e0QrAvvGoj9gZfFnr7Rr3FrqUWOWEz0b
	VnJea14G8QBMrn8eRYFb/QvThwEM8AVkEzjRVKghdmCdIUKx8VSErXMRq2HoPsvo6wDsI+tfgNT
	r4A/XLQk8wpxTH0TezMxW/ffXLSigG361o1MDEA0mhJFLakYd+eMob0kLhv69BxFKuZt/AbrC5d
	eZepBXfsBB3k3zcr6Dkw==
X-Received: by 2002:a05:600c:4ec9:b0:4bb:6a5a:782d with SMTP id
 5b1f17b1804b1-4bb88925fcdmr394635895e9.17.1795638302754; Wed, 25 Nov 2026
 12:25:02 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261113221248.3535369-13-wusamuel@google.com>
In-Reply-To: <20261113221248.3535369-13-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 25 Nov 2026 12:24:51 -0800
X-Gm-Features: Aa3M54paGFwRi6x8xvkBaed95VaPlmoDIEKWnad49yMfBgn6GjtOde1UijdiQkw
Message-ID: <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Samuel Wu <wusamuel@google.com>
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
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> KALLSYMS_QUERY_BY_NAME, added later in this series, needs to find a
> symbol name or prefix across module symbols in one pass.
> module_get_kallsym() walks the module list from the head and runs an
> export bsearch() for every symbol index.
>
> Add module_kallsyms_find_name(), and put the shared query struct in
> linux/kallsyms.h, so we have a more efficient linear walk.
>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  include/linux/kallsyms.h |  7 +++++
>  include/linux/module.h   | 13 +++++++++
>  kernel/module/kallsyms.c | 57 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+)
>
> diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
> index d5dd54c53ace..d31f2f436159 100644
> --- a/include/linux/kallsyms.h
> +++ b/include/linux/kallsyms.h
> @@ -24,6 +24,13 @@
>  struct cred;
>  struct module;
>
> +/* Exact or prefix name query, optionally in one module. */
> +struct kallsyms_name_query {
> +       const char *name;
> +       size_t cmp_len;         /* bytes to compare; includes NUL if exac=
t */
> +       const char *modname;    /* NULL matches any module */

will "vmlinux" match just vmlinux? or how can one express "I only need
symbols from vmlinux image" with this?

> +};
> +
>  static inline int is_kernel_text(unsigned long addr)
>  {
>         if (__is_kernel_text(addr))

[...]

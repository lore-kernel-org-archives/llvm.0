Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654102;
	b=z8Qh0UUS4+MCYK4sh43xxI5+22rlbzB6x6O2RLu6nxGaHvR4WMsHtSavORtXKpsqrcMg
	 jItgHi8n22Wyuw+BiRilxjf53vW7kzgrJMMWiptxAW9hjZVwNLlD7XvQXquhylDBxubqS
	 y4Vf43TDx26qTHAhGQk8lqiDGtWhL7NZT36TKQ/U3+AVRN0DeG5DrtRyiHjlwQ6AcgCw0
	 zeNK4wDsGUyPg/y2pTaloKjSSq6EOojeIVp6TqB+kLmGGRWXKzGvSUEk/CIVFBcTqpak4
	 wyJrAJ9pNZjmR8IMVp7Qzmyjya4vjixs5/YoPY0XJ+df+LAOLRwMk5L8sttEOvKQvfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
	b=eizjnGNh0LqlohB22Pv5daciUt3cG6a0+OBA4zg09IoakpqRfjZ6VcltLIkqSCBpj0RA
	 LUyiyIyRZR5iuYwSpOyl//2LmyxzmGVdFSufiT5QNSxdVNNJWHGQNu4ec84cnemp7desl
	 LWLyPnFUudPL2KjFah+435x0FsWuOpfk3yLObzVEew3AcJ+iEpUa85e/i8AnZLbTenB42
	 q2u/JsrUbtgJT3+JVpQaz8KMcoarossx8NppbT2Uj5NZzbBhWmm7M+kvICl2qjheIQ5XN
	 cS+JHdMm2cvN9hpcc9ajBl6vpn23q8exzHvnX2Fyp3BXHxlJyD/2hN0uDkv6SpaBmVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lbst4d5Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A46F606A321
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 00:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A46F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lbst4d5Z
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c516a1623d0so677918466b.2
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 16:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654101; cv=none;
        d=google.com; s=arc-20260327;
        b=rxl18353LD1wx38Je3bfEDemFQc5RZT6l4cJBEkCz/TGlg4l7kndli3i+TuF/G/A/J
         5Q3VzWB/RIaRC4w69B+s0YvAahY7j/59EDvMZs4J6yEfSHlcBTMaRDaKyfhJFoXFykzm
         IBwuqcWUEFOCBBroB/OZlv3M4xO2udcU+FhEAhhz9gkh4uvze0mCjNcQRnRbh8Nf14MI
         xq7ZbAMkL4MyAi763sji+TZuLknfmDnUqQibIY3QSOyw2fKQYpACBCX91V4RMqx4NMkn
         b7UrWDAuJgcMlWXWJZQwVJ1T9UazhX9zbIzACfIc02rGbcRnat4AwWz8NfQMjB1ClIZw
         rUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        fh=ekT3z9MONxnGPp3SgMNn8Ys10Yh2rzUDotURSlVVNb4=;
        b=WD2UEumPO3FvD8XKAKHcmvxYD/kEQH6VLwmQUCbHLowN2wjKs458++ZqVXetWzegjE
         1QNxrrb++UW2fY7jXhExFbM7f5ZtBBfinCIZWZ46I49htfZPzuixV12/Rod8G7QNYVL6
         hRzkTtmu5qQ9i+i/8zv/oQz61LZgKpUgWZLMbZZMNOx0nrDfDZ4tRtxL/paTxVGbuWzA
         v9KiiAQFQPQPYKBvQm4xO6rqBM4yJ+JU3sntO0Q31+umAjH0mwQGoTVa7t9C31faLUX1
         ijLiaNU8PW4/bV154to/JpEsR9HtHQMQjtyOiOTtZVzpahaJo2QiVPUfyc7XdO3SaLdr
         59yQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654101; x=1796258901; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        b=Lbst4d5ZrXxhmHLMcCYP46mVCNNQbtdwkPKDsTMder6uXzMSy+rqjrFUkRJcnhFCqN
         pCHmushQTJRGLLalAbZKzP5zJ5srI+T2p/lqyTGXy6Udy5dtpkPBigMA7AvQB0lyzpGO
         wd2jac/Zz7kPPbRUu7BmaVCa7qNTrrkekg1ol8GAiFMNutuuK47gUVIW0IFRduNoyM9R
         QhlGgUyoR43nfYyQOK3u9jUfjJ//2QHC5RcTYuuX64PJ99lcwR6iW+l6YH9peDwVqN9K
         WyAcnb/OMS+bH9jqKuwR9uuf4fI8RiuQcTlD3E+BQE3ySt3VT5x/WuYnyGxXgPRHYFv8
         J/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654101; x=1796258901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        b=H8WD5HRqhqDgSoT0BUvH7du1S+PKq+pFb0hAbGBBKdtj9f/hvWCcVNBAOMSYoUDdSs
         qwVjXZ2EbrQVX+dvzLadZQJEBbmXvN479uiaNw7ZkO30gLmFVOKwAWUQPS4BCq82JCQI
         Buj2b7ijHX9r8RlRI/AorROvpnT2UqSIw9Vj961w8B3Bp1q5ACc6x0Pb+vFVjCTETfBF
         5F5zH2zyoJKixwLb1ws3z6JEv3/hVOeaW5odnyRYcExllsQhTRvyiB+qfLBZpHMOABNF
         s21nSfxF38bHU3mTCJxBlsw3DV/y3EcTPxUhgnI0jajWMzst511HB8lFFY4EJV+vTwlA
         lh1A==
X-Forwarded-Encrypted: i=1; AL+hErGmsDSOzviB8JWCJR45CUbvqrnmGSauLkivjPikVjd6aWUsoy+o7w8xRJ+4TA7GrNH+U4lm@lists.linux.dev
X-Gm-Message-State: APuU4Z+2RMyG8+KMpjJVhKK8M5Ke+q8/NrfdmYx0uD/Gp8VxC59QmLls
	QQNoyq6tWwh+GQzDdSisXMolbYU4v/ZBduvD2Prp8DL5+gvKwASAlRSd9McLHAt5RcVhgtZay+8
	SZlC+1gFRUUYptZLqQLW+VuRX6CinHt0HdN4smUzA
X-Gm-Gg: AZFdTZeGyAAK+n5oxRqzyWUWPRzhf4DLa2Diz3gYjRa91Q+GQFJkhJO9hjKn727BlYA
	r8HjBFEEResBoX4p2qrBRlKiisyLnN+jSSBLMzvARCjuMZ1XBoEhVU9he/9hCxummod9f05DJT7
	p652BrbUD8kkhLL3KXY6FMoxI81WqpGv08ayCHgngxOXX+tfaGRYMEkKkGTGR8SANH2j78SVjPv
	b7VVN13QrPDbiDK7uoGqvdBTt+DvPhFQODs9GfP2AGX37SAiDR9BBIm6ZLApqooveVW8xz2rxD8
	kXluF4MU7lbh6K9XEiJgnoyIxP8LYhab08lEVqlva0zMmAVpelKxPS3YSU1Z9HTnWuRUkJFMc+h
	1Q0+sAC13JS0N1lbiTmqPbNvMemp4ZKj02+Y4P55E4jaM15H3P5WWEvPd4wu0UunL+Y0=
X-Received: by 2002:a05:6402:1d4f:b0:6b7:f106:3419 with SMTP id
 4fb4d7f45d1cf-6ba37ed40e7mr16523342a12.43.1795654100281; Wed, 25 Nov 2026
 16:48:20 -0800 (PST)
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
 <20261113221248.3535369-14-wusamuel@google.com> <CAEf4BzYLqCCwxSAfuzB-wZiae_tgf0yxAVsFc_wzfRAdeqjDtw@mail.gmail.com>
In-Reply-To: <CAEf4BzYLqCCwxSAfuzB-wZiae_tgf0yxAVsFc_wzfRAdeqjDtw@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:48:08 -0800
X-Gm-Features: Aa3M54pWdHazBU-AqLK5TiYQKtZxCNreXkIezAAKXNEVmmWGCBCO_8U3jzAUf4c
Message-ID: <CAG2Kctp-XoiK-Ej3eHWnYyijydej6Bw5sLKNNi-S+xEGDB+mGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
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

> > +/*
> > + * Find a symbol by exact name, or by prefix with KALLSYMS_QUERY_NAME_PREFIX,
> > + * in the entries of /proc/kallsyms, except undefined module symbols. vmlinux
> > + * matches come first. A module_filter of "vmlinux" selects the core kernel.
> > + *
> > + * Each call returns one match and sets pos to its position, even on
> > + * -ENAMETOOLONG. Start with pos 0 and use pos + 1 for the next match, until
> > + * -ENOENT. Use pos only with the same query. Matches can be skipped or
> > + * repeated if symbols change between calls.
> > + */
> > +struct kallsyms_query_by_name {
> > +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_name) */
> > +       __u64 query_flags;      /* in - enum kallsyms_query_flags */
> > +       __u64 query_name;       /* in - user ptr to name or prefix */
> > +       __u64 module_filter;    /* in - user ptr to loaded module name, or 0 */
>
> similar to the comment on the previous patch, how does the user
> express that it only wants to search vmlinux image and not consult
> module?
>
> and naming nit: query_module to be consistent with "query_name"?

Passing "vmlinux" selects only the core kernel (noted in the block
comment above, missing inline). Will rename to query_module and note
"vmlinux" inline.

>
> > +       __u64 pos;              /* in/out - start position / match position */
> > +       __u64 sym;              /* in - user ptr to struct kallsyms_query_sym */
> > +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym) */
>
> I'd name it "sym_size" for consistency with "sym" naming, and the
> comment/doc here is unambiguous about what that is (struct size, not
> the symbol's recorded size). seems fine as far as UX goes
>
Ack, will switch to sym_len
>
> other than nits, this API looks great
>
> [...]
>
> > +/* On -ENAMETOOLONG, *ksym is still copied, to return the required sizes. */
> > +static int kallsyms_copy_sym_to_user(u64 usym, u64 usym_size,
> > +                                    struct kallsyms_query_sym *ksym,
> > +                                    const struct kallsyms_sym_match *m)
> > +{
> > +       size_t copy_sz = min_t(size_t, usym_size, sizeof(*ksym));
> > +       bool too_long = false;
> > +       int err;
> > +
> > +       ksym->sym_addr = m->addr;
> > +       ksym->sym_size = m->size;
> > +       err = kallsyms_copy_str_to_user(ksym->sym_name, &ksym->sym_name_len,
> > +                                       m->name);
> > +       if (err == -EFAULT)
> > +               return -EFAULT;
> > +       too_long |= (err == -ENAMETOOLONG);
>
> nit: if (err == -ENAMETOOLONG) too_long = true; is just as short
>
> but also you are eating any other error, maybe write it so that
> original err is preserved as is, not special-casing ENAMETOOLONG? if
> you get EFAULT later, original error still takes precedence

Sounds good- I'll simplify this to preserve the first error via
something like `ret = ret ?: err` without any special handling for
ENAMETOOLONG.

[...]

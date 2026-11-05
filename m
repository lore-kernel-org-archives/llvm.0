Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793914614;
	b=WuF8OvafTp9yonT2ZXw5mGvLR+XrzqLgux69VuSfAHeXGYq5v85rSg1ABRWdcyCTMI4v
	 eh8gW6FnBMbOe2ldvJrMnVqs2ny0Yu5luXYCv24HYbf38PKe1htcYuvfLtVFNqFgiRL3C
	 GZMbV9RqHt3WXaAiAzjjW29JUtVdoFmIWBvqp3+aCOlK9fRxTL7hI/fCkqWmiSvDDWrPs
	 YPnvxOctBTV0uxbuLTZ3+GyKEKFKB3phtful3/MVzvLVGDIii3YBTKC8TgDB6Rgaj6hBJ
	 LZa/IbV44laLe3xXqRO1FKolSFAJGvJfjbdqMwAYJIkKUeUeAuKT+wmrzmaD6tXKK2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
	b=00GsJq5BU6T3fYRXhPzV6MKHYzWB5nMoiUUGPtm4nUNpstMu1wIFL6KUunfkg7PwdQsb
	 NRQZd5p87FUHSjYYhHwOvj/4QAWPoQP4aglOtpPsqKoQ9xBl4m2MjGZwqg1s94EWK40G8
	 qPITA2Na+uC5i6I+PBDSemEbvsu6fSVCHtPZ7+UixVKfWDUmGS9VabMpdqd3zCToUq90Z
	 BXsWUuJX0n0VYFq3kgdA6ig2goa8b0BUhOf505DjCCKku/Re7ZpJDyWs63OIFbkzWYDtK
	 Tc/uos58wBt1k334BGpm/u2vkCFAhlAISiLc5b0kJJF7m8sOtPjt0wjA8dC6zIo8IqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Feq5SOSd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC389606A33B
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 21:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC389606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Feq5SOSd
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4682977f9aso275646166b.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 13:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793914612; cv=none;
        d=google.com; s=arc-20260327;
        b=EO5e0jb5tLOOsgAlQ1MwJmV1Df21ropl398/H5fJdRcpc65/5sExynrz/GzYrhCQ07
         u0yQCc0LSK9QscE3RX7SDZD+wvUBxb5XWClSQDJGdxpgELZLbZfqiY2nkGzd7mN7zYLq
         dpkTjpr/IRw/haX7VyqOcW/li0py8Ndd8vwYffPzi3PFroVpfav9dJR179Y5EdQBSSk4
         HX06Jdjhyec1sC1s/vLKa2iJw64JPwnIEjVHap/L8bZYiQYNjTiej9SZjlGpBkyFa1b0
         G6m8GoPCJGmtsgBExb6phDFwhPvdCoowcL82SdVon85mMAiz6b2ABn5zPtHMw/A0tKoA
         IlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        fh=qPvdq4gfLQmdi1FXnclFVj/1U9xy3I6GLP0QDqHlH/U=;
        b=PjUBHt8Ztges9k0eLIZpq4R4F+6BOY0R5oQ1/xbfLwYoaA7o9VpDauStzwCuLnE4qh
         N/WA3kKfqavsI13h7vhZs2S6I6oUz3AAvTSvkhjBAkGN0E0FlkG8ypVnHGK4WKf47Jl3
         bR0y9f+r5piry8NoOFar+qVuFCULDzY8bC7AOS4X//EZKq8uA9iVXBKtbUY/d7fBIaMB
         222cUwAhqi8doPw7QRzD0k0Yo7OgCVFjNciEOQU24kXsCZG/uSLZiOiHGVIG6HJCsG74
         30q8lx8tc0uicPRNTM91qjNQXq4tTGaxt1zDvIDp+r4eLukbt7uUi3KIbz/SLGWg8tVT
         LTEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793914612; x=1794519412; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        b=Feq5SOSdPIbDg1JsM/UedFwnFq478zL2ayxx/j0HrIJ2tz8lNT8Cba4K+lKUW/VQI5
         Al6AaFrlvCTk9A5B0G2eJkYRyCiGwSol0/w6IgDbJNr5NH6LZar9nbTWGOlHEHmT4uuk
         sbFnz5v/BZnhKHZdnaVxjmtwddnOSV2M+oNNkt5jkwt9b6CcUhRqR6hroQUEwC8Erxqo
         z2JdWEnfgbX3mGFIsXScJ7D55orSsXndoYMrNq+cPZxAcC7hXSsroPj580UhJgk8c390
         x9rf2sdjLk0bJxWJHcEY4PtO+O7FKvZTgAvlxLm//prInLNtxWLzrMPn6U7r+44xJo2u
         bo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914612; x=1794519412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        b=LbZ7DUNxsPsTax6szNscyJV6LaoXzW+zLJVafMyMN8Fth4iRiFZtKH9RJX7k3vTAHo
         +u6iI7q6T6UuP8OuskkvpQe2wY+7GB00ljRcbtRidcUFMWpbxjpV0WWwRsc2/3XmLRXY
         H+DKqU1fMcDiXvhacUyOWVzjS3A5ZGnmkH82P3RB9ET0MiTdc3XrkYRwZaPVTP+/Wdh0
         NIe4Q59hzc5gColYV7aesWKK7OYhwelugwuxnYk9e8VWHiMXSlE+zxZwFpw742fFS4Vm
         Tb9Dp1BTrlST5xGpqXxivId+5GHePKrY8Ql4jNwbl/L/JwkEHzZ/nreSPKif2zNcNr/z
         qXBw==
X-Forwarded-Encrypted: i=1; AKwUvBxpWUUhi2fkCgSkBcW1VIAHW0/gWWrQGEXbn7+XmAKL8+grNIHDeMj4PFmeWEd/9iXKlyof@lists.linux.dev
X-Gm-Message-State: APuU4Z8g6ke6Xb7n1OdOq/rMRV7UCQfKtwNIeQ95LYrPLmnShFGgG3FE
	catgmv4k81ADQcsv2Ye13nSfSyFUFfVC46poLEQZNC9XB5u84VeCHPpbGmAT0a9qaNEW+upXxzP
	sYhgl+sfrq1J1pL27UKr1RzRAWN7bM32UzV3YDPoj
X-Gm-Gg: AYBFou1TvlMwTDIlV+MFSKJOPr9uD0cA96OqN8SZDiQUnkkkiL09lns4/swSXWREac2
	RllCVJC8bXpZnvjAeyT8js4VqjN9iAZm58YmnIHGy8fDwP3aI5PAMoGpn5oKybGGCVasZxw/CJ+
	YIZpDq1vsDHDZiC3lPfQljxOQz0BlyjBpE+RbOP8m7PxdiW8jdDAE2RXc+nxN1INhUGY2fOoSTT
	A9QL4Vp98jTvIguOIvzZGRkZqo8n/7OUHoNqb2EtUcIweBMPa/BW0f66PRGUqFZIO81erbiB+7Z
	UVXOJJZF3OY9AN4KbzGyv3gE7Wg/Ndj4kNqwugswa7itWW8ckovw6mCJVGOk1sjhKuJYCQ27MA9
	NQ/QruxfbPYIgYZlt4X/TiYa4N9prYQFbmhr0enpphk/rBf5zo7l80Nafvz519j9KSCSuPWY=
X-Received: by 2002:a17:906:9f89:b0:c46:645f:cedf with SMTP id
 a640c23a62f3a-c4d3546bf6emr55329366b.15.1793914611758; Thu, 05 Nov 2026
 13:36:51 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <20261030100215.6f8e0d4f@pumpkin> <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
 <20261104142307.431fc12f@pumpkin> <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
 <20261105083712.14847dcf@pumpkin>
In-Reply-To: <20261105083712.14847dcf@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 5 Nov 2026 13:36:40 -0800
X-Gm-Features: AclHuK-4-3cdEVpuwe7ZR8h4IzWEsLs5z4V7r2FIsMuL4z-PpEQaIZ0fXLkqICE
Message-ID: <CAG2KctocE=kj2CO29D0tVmrBeWmCDYA6FhpHr-7ZbD63GM1CsQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 12:37=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 4 Nov 2026 16:05:52 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > > I think it might be more sensible (less pitfalls later on) to return
> > > the symbol number - not that of the next one.
> >
> > What pitfalls were you anticipating? If the current symbol's position
> > is returned, userspace needs another ioctl() call and an -ENOENT
> > check, to learn that there are no more matches. Alternatively,
> > returning the next position means every call pays for a look-ahead,
> > which for an unfiltered query walks the module symbols even when
> > userspace only wants the first match.
>
> I was thinking more of the kernel api.

Ahh ok, makes more sense now. I misunderstood your previous reply to
be about the ioctl(), not the internal kernel functions.

> The 'position' is just an array index.
> So a 'read by symbol name' would return the array index of that symbol.
> A 'read by symbol name index' would return the name (uncompressed) and
> do the lookup (binary search and linear scan) to find the value.
>
> I've used a bit in the 'sorted by name array' to indicate that the
> symbol is a duplicate of the previous one.
> So checking an 'exact match' for being a duplicate is cheap.
> But for a partial match you start needing the name buffer to be in-out
> on the read-by position request.
> So you start needing 'read by position' and 'read by position with
> name compare'.
> It is likely that the caller will need to validate the name anyway.

Got it, thanks for clarifying! That works with QUERY_BY_NAME in v3:
- In the UAPI, the input query string
(kallsyms_query_by_name.sym_name) and the output matched name
(kallsyms_query_by_name ->kallsyms_sym.sym_name) are separate buffers,
so the name buffer is not in-out.
- In kernel/kallsyms.c, the vmlinux lookup only needs the two helpers
you described:
1. lookup by name/prefix -> index
2. index -> uncompressed name + address

> An 'interesting' idea would be an ioctl that returned the value of
> the nth symbol along with the name of the n+1th.
> That might get confusing though.

Agreed, it's simpler to have the ioctl() return a single symbol.

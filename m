Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795713688;
	b=krWF+iXqRe2eEozChNdF9cUlSLfbC+OVz40bPlDVE7hjl0ghn1LTKGH/CuiAnzuwb7Gg
	 m3XxyNQAAyelNHmj1qBOBK76gEDZ6JRn25BKA9cUopzr42nawSg//dFZPW0yaW9+6EY4A
	 3W1GuZ61Ac3haGsLHGo79DlBkpub7gw8iSct4jAXWcim0ArARB2n7/bBJ1QOc8QBvaS0q
	 /NUjALrX/KE4cbKKEPn3JD4241Eavvg28aGAh+Iig8M5+1XeWzDJojrMkvyArljU5jYGY
	 VQE72AT2cJBmhtiYaLv/AlegqC3T0yob2KNqJt+yNYVZMd8bt22bx7Aasdn8KCBIaaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
	b=jshhBMzhX7osxLwvj5dcXREee8wRX+mSze0Zjwks7G/87ALf7DCgbqUtewr1G7ckJxna
	 UxKSJ8wZ5eh/qpj4sVgJFCLhHhMczx46pi83LN2lW4KBElcWUjtiIv7n4MTFvOxx//Yn1
	 QVd6YFzgTl3b9/IEwxAlHx322vbWkxOAh/5kUWWhx2DU70/8nYhHYuNoP/PcT0pA5hsy6
	 usv9AQZ0ZN52WKLn8yHAJpy3SzSLHGI81U8nsBcXSMWc0patRn7eofezZeo8n1qpm54et
	 7L0zr/jqH7TuXGTP4OGdhV4sRz2oAKVxDRYOdl1zqkI/XsQN3GwH98AkNkCnDd1QzVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Npo5ZX3u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACB9606A334
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 17:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACB9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Npo5ZX3u
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1205186666b.3
        for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 09:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795713686; cv=none;
        d=google.com; s=arc-20260327;
        b=V0RfomgMjd5Wxa+3ileVbuhgUc4XLTY8AGoBUkY+vNBmoY1++rGFBje28le99PMOOD
         ZV26wvK4JpIVA5Xc1Bl+tDyMdje4Xig5StJa+mBqV3ZbuYf01Cbps6PHyc73Mt20lvpk
         puwfui6HuzW4wuu+yz53wTiv4rAwmaAc3u8SX9Yu+c36QHU+nwY8MrWYwLRI5wyaFiJN
         /n97LAtVa028m4JY7m/qrCQbXfS/BHfpElpBHv05Y/rpnlRDEFfIHDNdJAedH8hb6QRm
         JNMfVW1Jwf3O8KNVAxRubtRS/BjqmeMon/YIzgy3W26/I8S6EuUYIzKkUV4YVZa36emT
         Ge4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        fh=1Vvm8tTC8h//Hy24H/iuMppfI6lLy2IQvIt7OsRkhXU=;
        b=jdjGLjGfCOCz9Rh0/6roo+Yqhn1UcBEfpQCd0NOFVgkntIyjCVRrY/XWbemrjp9aZn
         I91ASFOTSPVFl4AEgJH62Z3kQfXfil0WLZLKjF8g7ZG3w1qqfv6+6Vkm7hCHXa8y79jC
         Zon4GcqHXbvD4JXsrXrbCg84+VHPYOh6JYLVMDgGFXbDEm5T79dsjIBa7usIS/C0D0d7
         zTn/bQyLGOGZIBY9n5geOJ7S9VIh9sqltAxF+Ox/Anax6Yay/+BFcqLjcITDqvBnaCrB
         CEGWhafq/hCkmirxP4wjcxEQX6iMV8WVeaJZ8YGLZjlUZKJIAToVzB4Ca2nufl0cZkkB
         W9Xg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795713686; x=1796318486; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        b=Npo5ZX3urd25V/cTue96R5mh8dy4LBSY7WrKVR8Dq4CC8olvOge7KJALJKdE9wqULY
         UIgBy3Ckp43Po5+r/qOUYnj2KgAZ9Wfn/QUD6TQDkAwSiIx97ppQhhjTCojfwoqUatOU
         0F/1/r1+F5VHGlH0RcWHfe5LtJMIsKxKtLSA6FCxA5IvK+MTyV6BjPt5Yh7l+TjlAsHs
         Gtez99BD+NkWmT1eNGu95LNG6kwitvFmPSX28CF6hdfWtK2wELCvY64HOEWvRn9VWVoA
         ikdwOlZBZRFbKf8U5wYEY2XpzFpYXA4kB/pqfg4Tbj7mVAVIA/Spw8+zac3FN1MYmESd
         6Fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713686; x=1796318486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        b=ESW+f0PzPvunKfmjrHMGCVDHkh2H6DhDgxKXl37qmRff0cMI2hLYhevjUGfjpB6ru/
         SCkWc9A0puB0JCf/nVazV3R+NOK0ZvpjzI/bRJDTj5m7nXh1aAW/VwNO9TnXc1uvUWlO
         IJ6uLqtn8TlTTELfCSCKwauSK16kJlHWpn8A4He4kCkpMnOJTmmqpQo7rC1VMmGTZoVy
         9jwF801f3QPfAvWSEiMfqdkL3BpF6IXnXq5PktpAaQPscCyAsTQCKKXLWp3gWtG9TUxH
         Zvbxgjgj1H/bZINfInIePKCH8kqATUQ+uN+cYucMfdZN0GrU6j8OZVAJaYCTzhsmW6CY
         0CIg==
X-Forwarded-Encrypted: i=1; AL+hErEep6TnV/TdmLvonZ8YPLaPQj0VZaezj7RxqFor9ZqutVaDieNYHJf39yIjAs92fu6yKe/q@lists.linux.dev
X-Gm-Message-State: APuU4Z/M1FUa4DaOvLXYD4fUj5r8WVNMPxvxZ3yJPgyN9Rq/+lTEZ4ak
	dlgGe25BPaJgAG8incEnzWpvtdkxCza473Ks4vBpKqIFh5XCuP2TVJ+8F8iv+rRKYI4iEi7Cupm
	5wxm33FbTblBPi9ke75wMKCVMV9JsSBFkKIn/S87x
X-Gm-Gg: AZFdTZcrgtXmhvA2TN+l+OPLNegy8OfBks90TIXjsYXSRn7a33t/25y/JFZ1A9sphzP
	8kOwGRDmcC2I5VVPR1FThmbYu4LFWT/SvULNdZBEblaqP9xWggKW7H0DsMJlTHijlDv2vRECEnJ
	nTMWszH/E69d2UlqtMLUHJq+XDGClBSbHBK7ARcYOsvRzp5tcTVdvdG/WIgzrP66xC8U1+DOAmK
	mKPrU6Lngr4gsWnGGQg4jbmvnU9NTKQgSaEdC8PZBaTWylHV8iiy7p56aT9gLDwbMjAkhD+S1QE
	FTo30cLg9tXpwfpH8MJWtp1ZrAZKUJ+7PZv0IgTVX8QLRGf3cF4wfj3OZOUWd4xH/Pd17j4IejG
	7eWZ2THYdU3kxQZ9uMdqY106GM7501MSvVA5Serdyi1987G1J86Iv+6oedb9LeevsZNcAfA==
X-Received: by 2002:a17:907:9612:b0:c2e:2baa:a642 with SMTP id
 a640c23a62f3a-c513a8845femr1932673766b.30.1795713685324; Thu, 26 Nov 2026
 09:21:25 -0800 (PST)
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
 <20261113221248.3535369-14-wusamuel@google.com> <a40ad738-cb7b-469e-b67b-353b64622dbd@suse.com>
In-Reply-To: <a40ad738-cb7b-469e-b67b-353b64622dbd@suse.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 26 Nov 2026 09:21:13 -0800
X-Gm-Features: Aa3M54rqUPDLnBBM9ls6-9-k9q7s0wsA5-hr6KgHVGGraAEFEEYG4syBhxuXwjw
Message-ID: <CAG2Kctq7Mb=pb-SFU88eRA1cp2Qt_HJ0nADY5fET7Es-_CcCOQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
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

On Thu, Nov 26, 2026 at 2:45=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 11/13/26 11:12 PM, Samuel Wu wrote:
> > To find a few kernel symbols, users such as libbpf parse all of
> > /proc/kallsyms, which is several MB and text based.
> >
> > Add the KALLSYMS_QUERY_BY_NAME ioctl. It finds a symbol by exact name o=
r
> > by prefix in the entries of /proc/kallsyms, with vmlinux matches first,
> > and optionally in a single module with module_filter, or all modules by
> > default. Each call returns one match and its position; pos + 1 continue=
s
> > the search, until -ENOENT. The output returns the address, the size, an=
d
> > optional name and module buffers. A buffer that is too small gives
> > -ENAMETOOLONG and the required size.
>
> The kallsyms data in the kernel can change between two
> KALLSYMS_QUERY_BY_NAME calls, for instance, when a new module is loaded.
> Should the mechanism provide a way to detect such changes, likely by
> tracking and exposing some kind of generation number, or is it
> unnecessary?
>
> --
> Thanks,
> Petr

I'd like to keep scope of this series simpler, and I feel it's
unnecessary for now because:
- today's multiple read() of /proc/kallsyms have the same race
- vmlinux symbols are immutable (I imagine most queries come here)
- ioctl is size versioned, so a generation number can be added in
future as needed

I've documented the non-atomic behavior in the UAPI comments, so users
should know what to expect.

Thanks!
Sam

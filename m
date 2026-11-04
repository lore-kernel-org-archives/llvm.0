Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793754880;
	b=TazlLOVRqtU0BcN989aqj3KDr/T/rURlc7MNqR5CMeLhq7NT4EjUTrhJY6tlb3nCzthL
	 hodCApaoLV9clGpIB6BoVhQM6jNiWvIFu/3SoqI9bG8EQRNfogJsB/ve1JykdY6HXLecT
	 UvLYWktV/SrbRi2Bn3z5md9OODm2+FfFeLHAf1VA5InpQuIjgPxsV4mVUrZuwH61JQhzH
	 01iXnZKUUttVKx8MiDaZjgZDDT6bz8u2sOao+a4+6Al1zr+cdlFswqgMe7u/wT8T/kLIL
	 /4HJJh3EeG/He8aBPlZnMxt90bYeg2oJBnXrorNVERfhJ00h4jO54EzaA2L6SrAgFVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
	b=R06HP6Dl9DNxFu6R5Jf/niRwbhT1+ZT6hexnhJT7dSHW3O4ctjY42qazzQ3uuYGImv9b
	 2Bra69zQ3FdSRkQ/yINgX0cwBvbWebCD4/kBg3krQIyfZhdjqY/blJe/ZWvtaQGJMx650
	 B9FfTXLa9Ye1XF4YOYYuUa6+nNVw/xJRMspPvLY1sTJ7WmdG11oOZ9DTMG744giqhT/vg
	 Og0MqwMgdRWrUEjGpyuMueiUql+wR+TUFr8y9aDRawe+3NQ7YN6HQ76pSMSXDRp4qSYzn
	 iRtBOh5e10gpG+MKcs2FFlZWaMgT3mA9y7mUg/uaVfeDczPj0erFjVftoTEQSfHpKqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O8Oe2179;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65439606A32D
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 01:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65439606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O8Oe2179
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1867896a12.0
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 17:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793754879; cv=none;
        d=google.com; s=arc-20260327;
        b=AJp7nJ2UwVkbbvV5NGpKt2SGMmuh41UmpJTwnmNEdtE3qUSuwurDknJ2Qe9q+DauQV
         u6bpgr1JMhKR5OGd9a740foicwFfLMBi/GD5HxAYXUVUAhL7DcYeZcfBxNKGf4R19vvH
         DjINN+a/5SFPB7FlP0Wmprk+jRKiKxuMjN4G5LH21mfG5Y3tKlGjj9TzKo5TC5bE6lY5
         kZGSwxaAYN/8w6bGG5j36jG9zjtv9oTa3yQshMYeRkt38flPnZCSdMN4FpW9VNnCjMVI
         aRuaUXZ6hUIIXvsF7tRBpDSFjP4RRaLJFPdYz1ikDUinwiALrFa6RWckji8bkMiYN6a0
         HqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        fh=nRpmXk48fyYSfsscQNCgPl6SoGq3zSWPaMZhJ5rujKY=;
        b=M56ZxWSFzfuMe3Jhdgx6Ofb8+u/dSTsJhiG8nsdwps3t1PtnAv1BsmO1TdoNH9YaG7
         7JZ0qwGL85oq051vKb2L/q9u+G0/GgWft0DTMbNHPft6G6aGO9VKvwmtLyQRplGZjL12
         Y5KUHIdyBW6lfXgWt7F0FkMj3FQ+x4mYdMJ6W8lGW5fDY7Mmmv1ceUexTo423B02+FLW
         1zD4XwWHrqv+u2TG5mqtyUvixfuD9GCawkm+H639nZz119Qyu/+inVBzKdz5Z6efnQO2
         4W5s1odH4bmN2nlIcc2Chfr+JWmZQsfoP6/3Ed4Lw/beOZiPLYIBwSMSCEMevAADBqhu
         PcSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793754879; x=1794359679; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        b=O8Oe2179MYAlEyoZ5pmdXBBrq4UBdl9Jut4QhJn6G11v9qfBAR9d8Z/c04YPwVJqdY
         Lu2Q8FMCzOmv4g66/AcZUWSJqE3svM60vxBvDivQdDbgVsi8eJG0G/BwD5HzOFehRA4l
         ckl2kBsdmBZquVA3kjNUoWqJMiUwiGzAPrpehCL3XrWAANwZE6N0EgGr7OHDj/0ORN7C
         qsjvSl+J3K2U72VmwJOVdNpArwak5R7iAk80KTPUjvSafzVaDoKhVmbr4H3xvstjf0lE
         giRRG7FBPdf8dSW6f50Jl4cUeyX+/UFZEivGhE3VlKve1p6Rk7MdaIgq8dmxKFytCeTd
         YCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754879; x=1794359679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        b=h824z4HLvTa2rgRI/4Vufq2VPpCTcI9Z6AZa7XDPOpQRuSbtFHrmcO6W0GS9u2FGs1
         wTCLTnDc2JTZ4NVAxmyydBqiR1fZm/Dli3U5ZPK3tp4ftVZXqp8BDZPYgSYzR2KYP8AM
         NX/UHOas3Kd/bdPa73jRH6rnr0/ZjgaLM8TVwz7LiG2DEzLKfochtXnlDdop+ZOhvyKt
         EQybpnv7ilhs8YmfYM7EHfH48xAZMBKC+hO23/LS4Fqi5FMyLutgZ9l8Cktf5Tt9Dj1/
         tXFj29uTNdSg8k/G6cFTOxb5WfnUu4Avw2VNZW6cGyeAjQjQN9DYEJJA2tNLAsAFSoQ5
         Va7A==
X-Forwarded-Encrypted: i=1; AKwUvBw+Oz8iVoY6fkBZBe9kCYT8mgJh64670yFPILGIbAcN+oT2mpeXOOgrIZ6f/aIrSjBwnb1+@lists.linux.dev
X-Gm-Message-State: APuU4Z9glZXnRX0688tY6mglBHiNejfV49PSdIYjM/3XO+/MPb7/KMQS
	ElU5hyXm1RQSORlfle+YButdXtscL5iG5ZJnDDkbIolnNxUvUwvlh+39jFMtxA+vp2KxCKQsxWg
	PEj8gANqE942/zU1oqzFDZ8wmFxDOS2fTmnZ1xOQM
X-Gm-Gg: AYBFou2ks41qXy7+5pGIFy7bG9FIJkjQuyItEDIcXVN14SL1944emjBValDzi/DIofL
	/rv3pDi7xiLnjmblNT4nH2zZq1KaQEmFixy3+Nca2mYZFAX7KJwjTfV9RtyWXxUbdTHKjpT5OWx
	w7lp/F5vll28kV1Lleh0RuRlhWZCkNmW6K8X0Doz8LJIZfVVfADO9mRInBHd7SZS2UnA7o2Oko9
	P0h4Rsh8ffwlrciVFll5UnKV0DbAG4qGOrME5GxvAqY056Sb6lZMRBbUFseauYW1ZGZGais+wji
	GusltyI8dSWvt8r/RgB95UY8tq0jsfJxI+iNrJPjCH6rp4IMIf7xHF7vGqX2TnQNrFVsgg761e0
	vZyl7lGA05FrusQm5AKtuPvWxEu4TbSnWRfFllvWmUCcecAtQET88OHDbi0fHQfhp2Xj83QY=
X-Received: by 2002:a17:906:9946:b0:c4d:939:526b with SMTP id
 a640c23a62f3a-c4d0939530bmr80653766b.0.1793754878307; Tue, 03 Nov 2026
 17:14:38 -0800 (PST)
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
 <20261030100215.6f8e0d4f@pumpkin>
In-Reply-To: <20261030100215.6f8e0d4f@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 3 Nov 2026 17:14:26 -0800
X-Gm-Features: AclHuK-cSPxC_sFXLW9VVvDKj-9cMyP8tHQ9MAfu7xEMrtFl6vQvJ8w_LlboHFk
Message-ID: <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
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

On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 29 Oct 2026 15:05:45 -0700
> Samuel Wu <wusamuel@google.com> wrote:
[...]
> > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > would be different symbols at different addresses. Please correct me
> > if I'm missing something here!
>
> Only that the user might really want one of the copies.
> Sometimes there is only the copy.

Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
pagination to cover these. A prefix query for "foo." also finds the
copies when plain foo does not exist (expanded on this in my reply to
Andrii's Oct 30 mail in this thread).

[...]
> > > Have you tried measuring it with my patches that speed up the kernel
> > > 'search by name' code?
> > > That speeds the lookup by a factor of ~18 (testing the code in usersp=
ace).
> >
> > Not yet. Can you point me to the latest version? Happy to try it out.
>
> I've just forwarded you all the patches.
> (They include patches to the tests and scripts/kallsyms)
> I'll copy you (and the other people getting this email) for v3.

Thanks for forwarding the patches! I'll be looking out for your v3. I
tested them across baseline, baseline + my series, and baseline + my
series + your series, using the same two benchmarks and setups as v2
patchseries:

Loading a BPF program with 11 typeless ksyms via libbpf (8-CPU x86-64
Cuttlefish VM, 273k /proc/kallsyms lines; BY_NAME, unfiltered, so each
query also scans ~35.8k module symbols for ambiguity):
- Base: 156.1 ms
- Base + my v3 series: 2.05 ms
- Base + my v3 series + your v2 series: 1.95 ms

Perfetto symbolizer (8-CPU x86-64 VM, 175k /proc/kallsyms lines;
BY_ADDR; init / 50k cached symbolizations):
- Base: 129.1 ms / 28.0 ms
- Base + my v3 series: 0.04 ms / 3.4 ms
- Base + my v3 series + your v2 series: 0.04 ms / 3.1 ms

I'm seeing your series help most when the vmlinux name search
dominates: on the Cuttlefish VM, a vmlinux-filtered BY_NAME call is
5-7x faster (hit: 8.3 us -> 1.7 us, miss: 9.5 us -> 1.4 us).

[...]
> > > > +     __u64 query_flags;      /* in - query mode (enum kallsyms_que=
ry_flags) */
>
> There is no need for a command here - use the ioctl cmd.

Agreed, done in v3

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793319844;
	b=FSJbjcFe7nZPHC+jJGlA0In0JViruVqgYffpv/daufvOy27PvqKZWP4bCNBZhA5u2wlP
	 mId4clP9NMrAad3/KvIPVrJS6s5VFk6Sk3xWZKozonDjarmZQ2RIlt3D2OnB3x9VV3XZj
	 IM3Dhvgu8C0S0UZRFWKrE0G1rpihf82vRiDjCiSOTb1koqQN6n6ctATrN7Le5PAizdiVN
	 UzQupAtkRkA874tG4hqrGrVmQdc58hnpMnqFwzzF8kkmH7Vo1xmmqVgpxxKk0POpDBVC4
	 2y8m9v4hvvtdY+Lc6Jcn2gSDIxDSC5V5S5HDqL6R7Gzy/Vatt/rQVYxHeeVpiMvv+jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793319844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
	b=Up13BWVf6MDktu1Wu+U5/eG19vMo3+VKasyhKiMU6nh4TQMHVkG2CRnnMamn7tlA84kh
	 alzh2Yg4SEynIz7LCjeljX7p8Jbgehk5atC1sVypImirXVTuj2LPwaohViesQT9fWM+BF
	 JFNxfvNLfdkadkb15WB7ACgI1z+eN6cSptk091BPF40tF7RWrg+DuH4PBd+Z2l50FeFji
	 FEMp0UlKKpzCOtyFN9HMhl/IxA9dDJcAXf54Kw/gSp7rWBtBR5N1KWgWaH3BCoQhFekfY
	 jrQRH/Lm0wFp2KPDKSTwo2vQgsaatHNd1500fJPY6FjUF7lIOuev4bEUSr9cTNwh+xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QKSF3NJX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57177606A32A
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 00:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57177606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QKSF3NJX
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so180684a12.3
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 17:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793319843; cv=none;
        d=google.com; s=arc-20260327;
        b=JMopK9OF0ydD0l8OQhHvukNdS7FYhViZbviponma+/UmyuBNRu0ZqrS0poRe6kCBed
         Gt1aPvgbHRUxjNz4YCZnlnXEnHCX+TtOx0QGQfTVGrIHDO/PiHj7fLY1kzaxs7cLsFlu
         VwMqhWFOfgsOEUTNrTYe1FYUM7tTJMjrYAid0kJPE+3TxAhGZP85lwkUpXl9FAWWYAo3
         yknurNw1VUfw4LzAjxtj1oumSaaniqIo1i+CMo3G/0UnWGIIQuDcT5uPnTIj7Q5ozn3T
         FafrvvDaQk62Fn7bBmI7VVKcMP4v9FKqatRIEIf39V6S/zC2qQ+gOVaO/MQtwKDgqiwe
         eSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        fh=pRU/+pZD1cghyTpwi9rX2ZCiGF7/k4K7+K+0t6avLMc=;
        b=GCVdTZmAlA/cx2O+rS8OABSTcfRubqTCDEiCLY7Wfmf2m8iO5djB+ba8ML6XmkhfGr
         mh1JjioYw06Z7pzhsIaVu1fe7gQaXEHXX/96JtgMhTm9YWUUUUa+IMyKDfxlgkqSZHLu
         4uZs02t8nuCSfT1FIkMIWGBHwXZ+pdU8KZqOu0saixrUaVf/hk4L+2ZsaeKWMjsp0rG9
         e0GdcfU6NUotQOJ6s4gEbnv+1aj0s7qqcck5q61xgSklQDleNnz02wZoAGU0tg4/kPhc
         v6j/BEuTtpuyxmH3ES6VrtJ/5z0hOSdSxc9Rx/musB25pAY8du+dlaOv1gqBQQ794gEZ
         ywmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793319843; x=1793924643; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        b=QKSF3NJXn2m9a0++osJ3ANiAi9tJIyIdNYmmle7iM+DNOmS7kJGf4FrJHtF9FYqv0a
         HGeuf+mSbuMQvgZMqwNqN5sGP0INIj4tZ/cL5AUqW4TYUBWOTKek0sYnzixTxWO8Uqj7
         ywtRvRBPYb3wzd0d3WCble8kCrYYDgKeENAEarig5gd49k+u2SFc6wsQvnJDlw73ETkc
         /b5mn+sRKGuHDAEqhhUxCt2dBUwMwXIhVQbuhRL/PI+IzJmbXOpXUGEGCdpnsMJs3+ca
         xeZVrZPq+0XCHEjO7vi+7YzlL6orWehC1uw55H05VuPpRA4eKFh5+LcMdvkyfwbbTthy
         INgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793319843; x=1793924643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMmqUl9uJsPT0M2OBCk5mwHznWO8pexQECw7k6bATJE=;
        b=iWA8bXdU3Xa0mih4o3oUQQ0OPiP3OD4Gi60GkAATsuQSk+9KWiXPFSNGyvrpezf0Qb
         Ch84J119aDD4lMk/52FTkWE3f0jJye4SYok2qMaOKwzV1VTLr+iwn2uBozncOCT7xFEk
         WEcR1F+zEbaNe6SXwKMooq+tdpJBN972jSeAdmv+RKSE4bVOMLhc+H7Y8uNrYVsvn20+
         SxGtnuOeVsTgUfyq3Ry42UxowiyzLg8Ymt3tOZG+WXbmJENsvo1BAqm85oD4PTXcvpMW
         mOSR0gbJ3AsWIR9qZVIUF0PZ0j4KwxS3yJyT6DncZQ9N6OFcNdd8pmJSpLJKFlx5FuKW
         u2og==
X-Forwarded-Encrypted: i=1; AKwUvBxu1PDY/snWZ5Qcxqc8Y+/LaUWMqubrQvii35LUaCk1YdO4bgNa5tqrpaa/DWoNVs5el30m@lists.linux.dev
X-Gm-Message-State: AFq9FYJr0vJFXJA5L0O9K0vGOXM78bTH5qPtpO+MW8pyrBkoWJHMftP7
	XM+D1OePxXR4ug1pPPcgKYx90/l9k8QrnXY8PdbQhOxmjhott5bpsRIn1iRoub6XS3UTNb0EyGA
	2Oo2UDMlFbyDAc0O2fqFMrmtmsZO9cywEdm55dNr1
X-Gm-Gg: AYBFou31WNlsD5Ke9spTya2Bk/eqfE0ajbmHTUbAT3AxfYTwFZZhJvNgcUgbfJLFw2k
	XgrUizQeVMYQ1wTNgzaKUjncZ+E0/zemzeEaK+38URwcs+aa9ntRC9khepvGKOXluZv0Pq0HMaU
	oQufjrstEdFnvTMH01WyoY7IZ4EalHOQW2xYzwRVH3Q8kIfM/RQUu7UtQIKSdHyqpDOk3Z/ThWG
	F2/YUO78PgsgG67njxmJl/EXA6hogHoxpUmQqLhaj1rgt0U+toXCAMxdKYxd5tUP6NifakvfrTT
	YxD8ITYaZ4Wvk1z5wWTmWzFa5Y5GFKEdbm1aigA2JctvFDwpi/DM3Zn0Mz+WSte3f36e03Lsay7
	lddt3v6cPCtvqE88/LlIvTqBdm9O+r45SU95HxGSfeg87aoaaEfhkulj5FtXFL55Ewm8no+FB+e
	en+JMO7I40AyxhFX4M
X-Received: by 2002:a17:907:6d20:b0:c46:7643:ae91 with SMTP id
 a640c23a62f3a-c4ca7a08673mr59997166b.8.1793319842360; Thu, 29 Oct 2026
 17:24:02 -0700 (PDT)
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
 <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
 <CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com>
 <CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
 <CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com> <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
In-Reply-To: <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 17:23:50 -0700
X-Gm-Features: AclHuK_8kDb2R9N0iMUoVO0Y5pzDVtS-1XOT4NszWcH8axoYKkVXrpd6hnWmpKQ
Message-ID: <CAG2KctrkKOTdsjWVRBEHuH45-9xpYsxDTk8PpZ4Gu6Ygq1Azew@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
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

On Thu, Oct 29, 2026 at 3:54=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 3:36=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:

[...]

> > I envision ALL_MATCHES to do some form of lower_bound() +
> > upper_bound() on vmlinux since it's sorted, and then linear scan of
> > all modules. Of course, just one of the two or both aforementioned
> > things depending on the module filter (any, vmlinux, module).
>
> no point in upper_bound() if it's sorted, you just start at
> lower_bound and go linearly from there. I don't think it's realistic
> to assume large number of duplicates, so I wouldn't optize for that,
> one log(N) lower bound + linear scan will be faster in most cases,
> probably

Ack, lower_bound() + linear almost certainly will be faster in practice.

[...]

> > My understanding is that the size is encoded in the ioctl command
> > itself: _IOWR() puts sizeof(struct) into the command number when
> > userspace is compiled, so _IOC_SIZE(cmd) is the struct size of the
> > header the caller was built against.
> >
>
> oh, interesting, I didn't realize we embed struct size into ioctl cmd
> and match it exactly. I see that pm_scan_arg has the same __u64 size
> in the struct approach, I'd stick to that, and when we extend any of
> them we'd need to make sure to either ignore or hard-code the size
> part, hm..

Ack, will include the size in the struct for v3.

[...]

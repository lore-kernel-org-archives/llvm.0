Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794425380;
	b=z/zpjOQ5T+w80AYJhf+kr8OMeiNQWUAWEQazhbFV+nY8f9a7m2Jr7C1HVj0RFl3JNWqc
	 aKS493jVVAXpHvInB4AYTZM51h2NdFns2xMZJploEyDG4hthLgFcfydkALrXy66N+Oiv7
	 8DqjXMtrbEF0HLB8g+4orXRWzBHaH0AveGsQX6HANQJBnyo+Qt5QZxZUHiAa0oZ+ONzJI
	 mmh/QyfNFMcvyBRD6S+s5jqX/rWH+QB89mvjFZrxnp7yKYXdyY/FcI21g6kenQzQIUv4u
	 fZ3irf1XmRD3uM5w112mY0V35SEAixCWPmLFp4fgtflanRuQTw156ZFraQfwTxYHIjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
	b=1IRj5pRgWR7Cuw4YmkcvoykmyYbt24t78dlgddvITRPsw1TnVTz0dJSM5Q8d7uBai19I
	 EW9bhaQluziBxPH/SKSo9mzeqOYoqk+yUK56P/gprbPs2SjRZ6oIdm5XCKCv1W7eZ9M94
	 IftWpcO6p04ChGD80NVHnBwTNDJR1lT2p7GtM/C9XJeJFlG673MjaXIqRynRwZYrSqzXA
	 NNy4PJEtmj21ldeMJ6hrhmPpUntGh3UrAeAvKSIgj/TWYjEUEK11xy2QvGTh6RT53Hk7m
	 CVTvXipMcZ1fl+AJvJtXZcJJClwJFgMQF19xleLq+DHe83HJc8qf1dloS9OPkmbOogg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EJXJkUoF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D47A606A338
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 19:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D47A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EJXJkUoF
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1913465f8f.0
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 11:29:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794425378; cv=none;
        d=google.com; s=arc-20260327;
        b=qMN94DrWJcYYqv8j4Wu4ir6I4DePFn0i54QGl4lUuwCPU6OIaJSkMW1uShH2APYoLX
         INxiKq7l/beTlhtLo/C/9LFruArNkCED1QlqMYNtZideqCCWMu3wrsmd/WA5TWDGIKwa
         17Z3MdMCR25yPb03Y0s35+imdI0ZT/6yzS+bbNfzbrLziH6nuRpvkfKLYDKp6kF/cQ33
         1Ie4bYnXwLU6ugoNyrbgqHDIP//N5Ye5tmvlaFIuzorSdgotI48NGNPevNqzbWbUotsl
         HkOYX9mjGfuMNPYB6lpVU6QPSDcdO7CSjrwHv3WaC9rowJhRw0qivhDN9RjdoIm029T+
         6SCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
        fh=g6/RG7+A2BtRJN8+IqaC6Yf1krXlT+jkJE5xwnwnTZ8=;
        b=rY2mziBOYk8rvrOclmu0jNr2hP/mDXSJy9zM20rV9URJ0RCffL4kJinu5+bBtZvQ2L
         vsHriMmKVlLs/HPNcO5mlIqtYr/WIKV38yj146iRU7sO9cceer/ZmfYguteGxkAepHEr
         1b6+7raCiLT0laDiGCoqPCKFdlFL36Gd0SWVMoxTriQQszZLXdljnqypuC5HXjTuc59i
         VfLeZSPDLDIjJrJPSLtVI/93MyiQUYmO4KTZLKscJ7ielTwT/YDapTYiL+0k23kixlnz
         C9l69KiiLVYUwyhCHe6uBGZb7jamKKAinMrTzeB9q9hhyXYKJlI+gGNH6fKxrYUYiaRm
         VvkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425378; x=1795030178; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
        b=EJXJkUoFr4VYTveyfjX3627XHu1Nz67ms0xhg98S3iiwNsYMDnv3EjTgwjmrci5LjL
         w9QIIE28gPyJ6ipSJ+HSlaylq/B8FlP7NQdr56C9v+eQTyjhxK4YJ+2TYoWEAG9TOZEc
         ZcOkmchuAk4bWWyv222tr3qm2WUwhTdLSNsAgizexE5bN0w2I418bZ0bbJf+FkXiJ5hz
         W2JwATTZU4Q/qBk5hAXouzoszVwC7ixM0giIPQQdP+lCe9JUZPW9b5Hh/25/3+9LT73e
         HMoG/QPnf0p+F+t8XVoQ612OMkxKBfy/0A9PgP7lKG3/BvNZBOtBDMsgtvHOI/Wif7RV
         wuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425378; x=1795030178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uJtF/nvnofFmtS9WloAogRLdDO2MBpuQLg70NOqM6Y=;
        b=bCf0H7g60y4bV3WoMQ6MG20xvrUhN9HrXww8uIEnjBmg2JM7cgINdr/5ooBTw7X0Qu
         Qi6+9MW/A2Na377SfZ8mlecLBWO44FF2NXDv/0Jz8jmAuZoHRsh4vIQOnOg5JVPh8Bz6
         Ju7gdzRhTWQXhylqW8KfZ/hs34HZbzo14xe95qCytRrT9Gkj3rEgeFgn9d4yS2QmZFTp
         +C4K4PatO1VEh2wjeP24TBBzDc/dHSORPfNU5/cjdX5R33Mv86RuK0noIRKFa0vk5e3e
         LbiHg/XhXW9pC34drEv6SSYqg1aWCppGVT0Drc/AWdljhfCbcGRLPjOUyM93gKi+jHeC
         A2Yw==
X-Forwarded-Encrypted: i=1; AL+hErHSepzxPGQbWDSgpDgHICKOjxRJJdLkaO9eRul3mdEG/7gBHR4diWuCQWlNtwB/tu++HEvd@lists.linux.dev
X-Gm-Message-State: APuU4Z9+QtVAa/73L014clVujyzg/zxuAq7pia2a8Kg9QAUfz5zO+vQR
	VHvAV2J13ZkX7UjbknmmRzoOur1qpzsfkWF4mrDUULVKTcMvgQmDx5aUXs2dnlHNir6dTakjzNr
	WkOKulGa/hKu/We3/Q8f3p82WRjSph889fE2svLri
X-Gm-Gg: AYBFou23TDkd7id08ezGUXVQfng6e4+dJK8/jiHehq4/RaxGVBIR+UTPvGvphzuL8gi
	VT7bYghY3AqaMY9yTGPmbCsKFYb9TnspQednB3Uj+6WlYzhXGbP0Rr35pzKDaiTwIpRC8uUX1tp
	1rcYdGNYe10BsFiJuGpk+HsrqsIj8ujcbQqi/MaejS4uy1E2Eu24nvt8CGqi9OP79AxQBH5V0Mh
	qBkuvm/LANf6sBX6RyvN1gIpMK2fZx0AJKnntuRmlTkIMD0r3los108YmSnGtBiG8KlkoqIb8U0
	3yp6MwvbkwEsXQFP71LE6Ky13SKMIoq9JvnxUxL9MHr2es+Pk+F1bH4vx3pe748J2Do0N3wzobg
	r5g/ZgUUyZeoQt5Y6S1TuhzRTfdAY6HBIH2hhgH3cxX9lzDwWr+lY91mH+v7ydC5k/OYP3DYo5u
	0pEuyJsQvGFsnUHfajI8N6+nms/N8fS5aGZ7soSyaj/VlSk/jWn1sn0UGJ1NnUSCKU8jNekUU3/
	hP9C0L2hxQfDT6RAFObRWtXEBcNMK+9FAYcBA==
X-Received: by 2002:a05:6000:2512:b0:48d:dc6f:219a with SMTP id
 ffacd0b85a97d-499c6405960mr5972764f8f.27.1794425377867; Wed, 11 Nov 2026
 11:29:37 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-1-6d4fb636290e@kernel.org>
 <CAKwvOd=gkPRazfqjd2xpvW-Pr8gLXVvxBYuzuyAOWi2xwinRTw@mail.gmail.com> <20261111191013.GA2689488@ax162>
In-Reply-To: <20261111191013.GA2689488@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 11:29:26 -0800
X-Gm-Features: AclHuK8M0r82CQVvygYUkMuWGiTf-D32nwsvHptLhG_qlCYowPaCQaKeVTzLjSc
Message-ID: <CAKwvOdn83etoZPhe9AGkHaY=Xkzxo3jwLgjAAySmgA_dbAxMCA@mail.gmail.com>
Subject: Re: [PATCH 1/4] scripts/Kconfig.toolchain: Remove CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:10=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Wed, Nov 11, 2026 at 11:06:06AM -0800, Nick Desaulniers wrote:
> > On Tue, Nov 10, 2026 at 9:42=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > > diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> > > index 04f4ebdc3cf5..f62de2dea8a3 100644
> > > --- a/kernel/gcov/Kconfig
> > > +++ b/kernel/gcov/Kconfig
> > > @@ -4,7 +4,6 @@ menu "GCOV-based kernel profiling"
> > >  config GCOV_KERNEL
> > >         bool "Enable gcov-based kernel profiling"
> > >         depends on DEBUG_FS
> > > -       depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
> >
> > did you want to retain `depends on !ARCH_WANTS_NO_INSTR` (deleting the
> > ` || CC_HAS_NO_PROFILE_FN_ATTR`)?
>
> No. If CONFIG_CC_HAS_NO_PROFILE_FN_ATTR is always 'y', this whole
> 'depends on' line is 'y', so it can be removed entirely. The noinstr
> part of that dependency was only added because the "no profile"
> attribute is only relevant for noinstr.

SGTM
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

--=20
Thanks,
~Nick Desaulniers

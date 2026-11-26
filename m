Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654191;
	b=VV47MrUJlEYV2CFb1Kr3XVVulzTBOXbqEy7RFeGMNkxvv9nCn+48ARMgRiIVhxjVNWMq
	 R+30oIYaPnUZUAy7ocyo+4vAUgkEhDwvY2MnAF2zOveMx4l5tHl6s+qzN0suvbXsYMUTL
	 jnkTiBnxKF05gFzLd8+aEvzhXcQewkB8/jOau22ZQuDTwJ35w+1Ypy8a2QGFNr0b4b/4Y
	 Q4znDaypKm81iAr2YxqkqBEetsfdgQieFQCD50Dnygr+Qz5XGq556nh9HsWQEuX+OYqV2
	 Tpw110iCMKce3X+f8S6QktkCCForW47raB49fbze/uqVNCQDKtSN+/osAfYZY1o4CBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
	b=bfqxMSysDi0f4/3CrA/CTTyia9ctlZaI8gRA9s0dFwTlokQFUJbY00hSk7dNSvykVzcw
	 4nvwashqyOQxfYySaaxWuqe1e/Bgl6lLsTERhZlHXFdor43vz9qK6JW0AifQBXA/yRCfX
	 huyyDo8PgHXiM3tUtmnmEaVBpHAnMdqJUCx+kAuBcoVBv4OZW16NNtPAYBsr6n/0/HIC1
	 7nleDZs+pMjZun+WMCtQ/ZfeZIlpvaBpFXZN97zgMXbEek0jfl/muCUjDdiX+DeP7gsFf
	 OkarWL2pn0gPPx7MutWJYYzXHTWQCee2OTT4uMDL9o1677sKtNButuSenqiwMP6WPgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i7fqJfNf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41794606A31E
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 00:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41794606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i7fqJfNf
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50e26763a4so105430466b.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 16:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654190; cv=none;
        d=google.com; s=arc-20260327;
        b=Y5wLs6lVtxfNPEHQLiA1Lwt1B//LOINk6cnku5CN7Z6GmyVIUCxOG3JY2x6JAJNUWH
         dTUe8RRLwXNBNsU78C6nVt8brcAcieslKltnzj5yL48ump9/wGs8sA3vvN01Xg7cdZdY
         Mn/PUxsh8kJdnun2o3NBgw0Gjjodv0mQJjTt3EOr7xUdsvSYCMAG7Jl2h7S/ShljS+n9
         2kMq5aXA6zg1nf1HlIGy8N/prHiHNRk4+YTSQiZdR5O4tJcM8v4Q3/r8omPUm0qn2V3l
         5iN1K6+tHb8tjaLMu0of+SWScrPivM7YP2SvQnRwj+iZcPcRAvu0pMi9BQx1sSwoldNs
         fLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        fh=4toq7abG8yFYccRGrc8FKdDf/jXYiUXBZDtgU1RW5xY=;
        b=ibUUGxm6csVtngsSSWVDF9wsh1pT89TzBTMTv1whyJaGR5678KVN8qNuXGwVQEvouL
         QgyVTVtpk3V4RLRhPgWVZaP8CLtaooVOSnhNu2NvNc8WpJn05nr02KW23kXvgbqHV0XM
         8aBrHO2rhJj18LpGqZYCA70Ac0E1UKFfBrIcxd1nlDqKWk7wQD2lB/yjgfB//ZXklCkC
         6S8HzZxge0toRh92iUAZ9EJbGRPq3pWBCOFSFLjEdCx+/6ihFnCP/IRhEqn6Oj+LOqQi
         piDsTN0B9R53saDzF7HyBxyb+ErG41o+/P6XaraERRzjjwdDHUa1LMo+AUInPkXf1uo1
         c31Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654190; x=1796258990; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        b=i7fqJfNf9nZVPQIrHVb8QGjK7StkSNoSU2qT3dhdQUFRkhXu8R/omnNg1A5shqk8eu
         ivkO+ybW4R4kfA8rrXyF81lKpmpCJeYt96M72x/EQmXKuEJ7mK1pvNBjaY9+dKarN2An
         oW5Pu2XIWVGCduj8K9hHeegqpi+Vjya42uYTyQ9zJsiWRBKQcxrgK+rE9As53A5jzROi
         86kDfeGCUYeJRY0Lww+fqlrnTVpMq2kDweBBwebFhhgGyuRCi2UU0TX00I25ay/1ocWv
         4EAqjmoOhV717d2g0SP6/fA/2P0ktOh59bfqkU2k7v0JZUgIdDyiZiBkBiFqZdls5bQa
         +L0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654190; x=1796258990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        b=lsaqQFVvRTiPkXiu2mLOLi9ivAM72Nv4qX83fTpZaG6ECrGz3F/tPJR7bjbWzEJMD+
         wu41WsIe0HhG6d02gTYES5B0gpB55JR/OjYnIiqUYKQcAhlH6vgC4KjShE3/H7Gk5fiF
         +4vFecDfAPRBtWRJkQaeAq1UVjdN0Q1v1MJRyTRzATQgnweMAsp/khuselynFXr3z5DT
         JAwwfc3unSNM9nJHlGdUhJhSmjP/pAaLfugg/Ej6YHEtAzZ5smwLN/GNWaBGOsSNqk7t
         V+TS2JAtcQZy2zQnnPG8WEibFICpExQOB1/MIKvxlR/PxSr+mVwgECaGs1cTibeMN2M3
         bmDw==
X-Forwarded-Encrypted: i=1; AL+hErH0RUQ35Ykv/Vf9YQQ1SLePG2sQ5ouoyNqspwVFx/SVmdcZmSt13UqC31YO7YRMcMuIZKK1@lists.linux.dev
X-Gm-Message-State: APuU4Z9NJA7ToMvH2yW5nY/MXZca7vvJjah6lHGDXWAre22cz9w3Z+CU
	2fFdq7awtBXLUTrHK4P3xQQJhtfM/Qs1mTUe33TSksBvQz+h+94IQa5u1WWAY3WD3y3IpWnld9E
	WIhse1Aif2+5mMR4jRQ2TFUG6Dy7F8bg3tIPATPod
X-Gm-Gg: AZFdTZeuBEJ11XNvTNWBTxg+8X7Mi+oZ/6iQZ/syKpg7wh5XN0E5kgetunyXXkBOh1c
	cFOrkrCfTYGVjVVMQmPUI1JhYGgC8RVTb2hXVoiwUwQVRE2wjdW4BHOGvGbkLor2vwXZbX5IVf+
	Vx21ZJf7MPN2z1GZ0WrxUjTpUbWLTz4qM0YKgaRPv0+Cb7N1yMF+jh2iwhXTrjzAeQuhLkL+iik
	A80wMj1ii7mj+5PdzxrJbA2e6JIS+JYo9Hz50ArKj41fNGLGmiKu6MNgFXklCdWweRzk5NswpIe
	LeAG1reZJMR98p3QUYQUsXS5bTpNzx2fihYeCaMXFSviexwrH2UenoqfRVJHWsEZ3Cg/woOf+ou
	/ooO6DfTRWqFp9MP0dVy9//P3prQUo3Ma5Vze0B4ZdG/03rgbn6vozLm3lbGuXB7tGGo=
X-Received: by 2002:a17:907:e11a:b0:c3f:98d4:dfe2 with SMTP id
 a640c23a62f3a-c513aac21bemr1112327466b.18.1795654189395; Wed, 25 Nov 2026
 16:49:49 -0800 (PST)
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
 <20261113221248.3535369-15-wusamuel@google.com> <CAEf4BzbdGw4=yWxFqdFuz1U7RBSFqh7baJX=SpBNJJqnaW5P_Q@mail.gmail.com>
In-Reply-To: <CAEf4BzbdGw4=yWxFqdFuz1U7RBSFqh7baJX=SpBNJJqnaW5P_Q@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:49:38 -0800
X-Gm-Features: Aa3M54ol7ULgIQ7PyJ4MZUA4jeAQllgic7NBQxD7ZgZ6wx9FC8B6-VKox80ApLQ
Message-ID: <CAG2Kctr9Bg+4uz+cKWw79S6qFRPtW_PRDt0rFY73F6WpauXG9g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 4/9] kallsyms: Add KALLSYMS_QUERY_BY_ADDR
 ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[...]

> > +/*
> > + * Find the /proc/kallsyms entry that covers query_addr, or return -ENOENT.
> > + * ftrace trampolines and kprobe pages are not resolved yet.
> > + */
> > +struct kallsyms_query_by_addr {
> > +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_addr) */
> > +       __u64 query_flags;      /* in - must be 0 */
> > +       __u64 query_addr;       /* in - kernel address */
> > +       __u64 sym;              /* in - user ptr to struct kallsyms_query_sym */
> > +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym) */
>
> nit: same as in previous patch, I'd keep "sym_size". But hey,
> "sym_len" is even better and follow same naming as with sym's
> name/module, no?

Ack
[...]

> > +       return kallsyms_copy_sym_to_user(karg.sym, karg.sym_struct_size, &ksym,
> > +                                        &m);
>
> nit: if it fits under 100 characters, please try to keep code in
> single-line form as much as possible

Ack
[...]

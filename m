Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793754316;
	b=RHBHZ8G18XJoWSGn+FdPlWXBNmECVhSZKuW4AYk3Kbvt2gT+LVheqNzRntVOasPvbk9m
	 u3kq6/GvkodcI/3Eg1R8Po43nOZsGv9sk/wJd0vg0kQPLSRiKOyGPLEy20Hxglcs/sO4M
	 6JrAFkn4X97cm/psnfxsbKlZAYS+S6k+hH0gqkmZEAIwhnrb4tyXI9rfaLO9NXmdv+2uu
	 10NZp++rf0LY5noqpg+emGKopgVQnV5H015y72mW4OQ0njdrB52FlJ7BcBzxW/ai991hO
	 0fcwbg0+/B6dUQKmaAdUV3u4BE/XTmKsxRhiWYvshRPG6BFs2R3HGfCavqYvEeMhhNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
	b=QKsCWM/RMIAEHLS4+Cmwn437nuIZ/o/XzQeq+CaF4fNB4b8iYWPct1jk6XQ9a8I8aCh8
	 fMWXu7INkjSevY4lmpqJh/HCMFRmzG3ynF8CiqK7SDXejTCRoxBtMlKCGXSSRU9V88K0I
	 +gHomqMQgyOuhl1GFelMl4dztaax4IiJ9hCRJ73uFyAfmKZFK5KZBR3n2moL/Sq/Tss5g
	 NX3OSnqmyoIwa8srk0iuSWAXCI9DI3f1Zjqu+DIHW/vX2Vooa6ECXd9wZSjbFZ6h5m4Fo
	 1nYBDvo7h73VusnOk8DFkGBNVoBcmCmRKNLBXTABjhSPzKZc0PZsV8zAVuhDo8lkagw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="O0Cu/ojI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A2606A31B
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 01:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A8A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O0Cu/ojI
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so27698766b.3
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 17:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793754314; cv=none;
        d=google.com; s=arc-20260327;
        b=hKRJyewyFIy0uuCe+0fOZ5D39otmm6Ii6+LO6xrDiNO+fnq3INVFM2O2A9ZA3wdjy/
         ImxX+2rUq+mgZiQjLo9YfDrDOvc45udb1reWwWe+zes8bFvq/xsMGCKRmrXnwNFswazV
         WCjBz3yhIo5Mt6V8tlc4zLeE2QadJk73Lnz0GA/mLmslsLRNYRL2R8cazXlK6Mvu/hZF
         GyaxKizFtLaAG1J9D3vebNymyEbUbEnKtEFE3HQ24HoWaATG4t/4gqb6hwiSL0c4C4IP
         vx9IKIn7S/RxZ5ltel6p1mBjl3MSBqO7otjqKsw431+A2HFVjsavt5f5VBCmxwRjaItO
         PnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        fh=UXjgRb5VjzuG9/u84A4arLSVsPkrdctjMXXrdsKCZTw=;
        b=n1paSPc9HWCyXV9MCAWH9l2fum5ueAp4AD8TmG+QPhrBQL1TYTV659yIHab+Vb1+Uw
         V0JrycjnMtkDgA4ZJnZueDaLl4whknAa3khSdFojEhFTRbjs0jeXu3JW/0H4Btepe2FW
         9yZk8QcISP9Vnvg+mBku+5+veb3iK/ROov4hyt6aIB/K9YllVUz/2rgTtxNpzci9RrUd
         yDzKXJPD/XUFFBJaSdjg2BEKhxy8uYjh/TVpBAA5Smcvly16NqwYrm6AquyIXSzaXXj2
         751hz2wIg0014d+m5qAGTJ7elJRtsl2DfW/ALha9464xgVGFVLwQe3iMTLefgBNnPrB+
         dYlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793754314; x=1794359114; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        b=O0Cu/ojI0HbKSnMCMdeSXHkMWtetEvU0qo7gCie+xfRDEgX9YpVsL/LCz56a0Ldvju
         NS16WkVbrzvbUW7b8H8fI6hLRVj0b54YGhJRRk77ykWbz5bRJmkpH3n4qhDATt9e0Jdg
         yF2lyuXpJpeSCe5tOar9cQW2eQZGZyfxAYwedwLcA74TdYVoi6cMAlNnVOf1kc6Nv58q
         wiYR9CyHbLnwJGPADp6gqekYC3yxyKMj74elqThYQv19PdN4/zj6RlHCTsRTPAHBC9hy
         gWqikkguUfhQm6PEmlPhroKGFE+s/pmfPUHzNNiwfKZgI8b6rJvosNZMdEjQzhEBXujW
         9dIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754314; x=1794359114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGVgNCMMS0dFIobhgfKFI81188J1mL3nz/OKckiJVo4=;
        b=c/DWJlauhvf4vhyrgOd0bMkFKMiv/hX6ROiOtK8woeuXmRAcVTxp5pNr1ymtJXvHYe
         ZTTcQFtfR7VdLj0g/Ti8vHcHzMd8ByMKMlcoQ0g8P7te2fc6P+QgqP1DjwcfkTkUsl5z
         zxBvCAiQ5FHw8Mow9IWH29zHbEnKr46PxflyU7svo0BWm0FHDoSdEaUsT+GIwAVXMHaX
         KbSLHEf3oLevp+trtrnhJpa/LfmXrlXbXMRGo8X9YFQN+/epPeueXrppvxqUm9MtrhyC
         o3HA6x+lXzNIEjbxRBk7GB3OJ988EAACk1c+l/O8vVb5OyvrxF5mp6PdG2rfYH/NauSx
         HOiA==
X-Forwarded-Encrypted: i=1; AKwUvBx9itDJCgdIkX9QpYbcLuwmrLlk2IB3R9hLrYGF/xGY0PoPky0zqZ98orZDIBxu7/tRUz9t@lists.linux.dev
X-Gm-Message-State: APuU4Z/stqZ1xRnj9PogirBUx1NBLVy1GQJpJTxsBI0qHtxwvl8M0dzI
	NArok2tvgeTDq645o3rgmCwX9R4zMlTX3MGbQqGuOFo9unmL5+obSqdANM3oYo9Puy10NgaYJN5
	RYDSxdIdxa6jqQdLgV79P0cd6fyyw4ToFbv8WF6Q1
X-Gm-Gg: AYBFou1mnbwO5nB8XbKkDR7I7Vq19u6x+smuvKaJfbPJCoYSMDYecv9MH4amAOKpNtw
	/z5NH+V+x7sXsO+0UvAk6TBizS/aTD0UzFahL4YCBV/Md82pllFeKdVNK9Um1CZsvaz851e5gfq
	HJMgE7s9habjPhzoAcRmB8iDoXzpl84/OZijqT+jh+l0YE5pMacnyUW2Mb9QDDxUgPW2Q0qGTlj
	YbGXC1yx1soU7I9rEsDi6/y2UrP//VVzi1CurDnQt88xL3mJnjvyBt9Aa9j2Cti80e0+wx4Cj1L
	wH9CIXmdokDnK0jYXaYQ+LWSICDG+TALdwyu1rO6H0W4kyviVtMMLZmd4uIyW2mNeghVD1I29hg
	In+YDHH+84TPRVt6Jrqu4/iBu6e6GIzhchMjWAl2NaXAGryNwgosYdDUtnjqIQCXcsj6TpU8=
X-Received: by 2002:a17:906:c145:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c4ca7a1c3ccmr1392142066b.14.1793754313888; Tue, 03 Nov 2026
 17:05:13 -0800 (PST)
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
 <CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com>
 <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com>
 <20261030153528.0d5113e7@pumpkin> <CAEf4Bzbw6hZ3T6uO-ah7c0+K9_kc+k32hV88YFP=qPnHos+-AQ@mail.gmail.com>
In-Reply-To: <CAEf4Bzbw6hZ3T6uO-ah7c0+K9_kc+k32hV88YFP=qPnHos+-AQ@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 3 Nov 2026 17:05:02 -0800
X-Gm-Features: AclHuK9b_Pt7vf67g62PZ8vH_eaq5fO461r38gdQA-3gsipu-4DIyrTVCZocpdU
Message-ID: <CAG2KctrmAVo-jC5zHURvx9-V_Wu4U8PctxEevycV+zq+6GngUA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 11:42=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Oct 30, 2026 at 8:35=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
[...]
> > Doing a system call for each symbol is probably fine and scales nicely.
>
> Yep, I agree, for BY_NAME case it should be totally adequate. And I
> agree about not needing to do full count, just whether there is more
> is good enough, good suggestion!

Makes sense, thanks both. Nearly all symbol names in /proc/kallsyms
are unique (~99% on my test VM), so I'll have v3 keep the kernel side
simple and let userspace apply its own duplicate policy via one-by-one
pagination: KALLSYMS_QUERY_BY_NAME takes pos (0 to start) and returns
next_pos across all sources (vmlinux, modules, ftrace, BPF JIT, and
kprobes). The kernel peeks ahead one match, so in the common, unique
case a single ioctl() returns the symbol with next_pos =3D=3D 0; when
next_pos !=3D 0, userspace can step through the remaining matches one
ioctl() at a time. libbpf does that and still fails the load if the
matches have different addresses.

Paired with a prefix flag (KALLSYMS_F_PREFIX), the same lower_bound +
pos/next_pos also handles suffixed symbols cleanly since they're
sorted: querying <name>.llvm." (or "<name>." for .constprop, etc.)
lands directly on the contiguous suffix entries in the sorted vmlinux
table and userspace can choose to step through clones via next_pos.

[...]
> > You'll find that _IOC_SIZE() is used in many places.
> > Amongst other things it can select between 64bit and 32bit compat struc=
tures.
>
> I see the trend to stick to fixed sized __u64 and __u32, which allows
> to not worry about compat. I'd go with that (we have used that
> appraoch extensively in BPF syscall and it has never backfired, as far
> as I know)

Ack, I'll update v3 to use __u64 fields throughout. There already is a
precedent for this, and it is simpler to not fill holes that __u32
would leave.

[...]
> I'm intending to fix PROCMPA_QUERY's embedded size (so that to
> user-space it stays the same no matter the evolution of PROCMAP_QUERY
> interface). I really think we should start with embedded size zero
> here and have size embedded in query struct itself. This is another
> thing that we've been doing in bpf() syscall for a really long while,
> and given how dynamic and complex that syscall is, we had a great
> success in building and evolving API in such a way that user-space
> code doesn't have to care all that much about multitude of different
> versions.
>
> I'd really-really want us to not have
> KALLSYMS_QUERY_BY_NAME_{V1,V2,V3}, it's just a pain for user space.
> The evolution logic for versioning is simple: if user space provides
> too large struct, unrecognized (by kernel) fields should be zero. If
> user space provides too short struct (for initial version we can
> enforce minimal supported version from the get go), then we just not
> touch any fields added after that size. That's all there is to it.
> User space, on its part, just provides its knowledge of struct size,
> and then kernel will implicitly assume zeros where appropriate.

Ack. In v3, I'll update KALLSYMS_QUERY_BY_NAME and
KALLSYMS_QUERY_BY_ADDR to be _IOC(..., 0), and so the sizes live in
the structs (size; sym_struct_size for the nested struct
kallsyms_sym). Sorry for the back-and-forth, David. Also, the nested
kallsyms_sym needs its own size anyway, which _IOC_SIZE() cannot
carry. That keeps userspace free of V1...Vn command variants as the
struct grows.

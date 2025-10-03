Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B4C263C8E
	for <llvm@lists.linux.dev>; Fri,  3 Oct 2025 23:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759534657; cv=none; b=iH3+jAjPubW3Lu/CURR7+40+yI6pS3rKpIJY2hZMMhkl+PMgK5AM/q04bzL/Utm7YX0AUJ9veKbWIPgaZGLztBQwoxXklfmqZZP8F5A4W3ZbQbO3rKjUB0+kG5OIE0OvX73VzcEP6fJhiXCfAqBiOYFbEd3E7ymuhtOcRsGO6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759534657; c=relaxed/simple;
	bh=GNFmT2VxEaPkh32hnm7rrBTVz4auBq5soR9sb5kDJTs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RCWX8XXDP1FejQQhJ+CoBPJD4tPzPWsiX0capt9Cp+YKLw7Fb61EClcCnSjw2fcoRyE+gsB8kI933wdBWDhcJCIHAaUmeC5EELeP9htq7NgYE5u+rireZhYiryy/141TSuP2otiX++IxSyHnWVP6NPW2WtnNFKWvvL3H726SeVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yh8fvLFF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yh8fvLFF"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77f68fae1a8so3800333b3a.1
        for <llvm@lists.linux.dev>; Fri, 03 Oct 2025 16:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759534655; x=1760139455; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8opnbw/m2Z8T5yDXIhCeyupu0RmNSEU/h2Gk1+QmiW8=;
        b=Yh8fvLFFx0gMujnYVsiZIkTXZKQU/1BoL5ETzPB36o9+HHOYiO9nNF1Ai26sdyYQqi
         YL1EsULU6ZRUux23y5LqlfVAHcLY00+wroL1Oj4+hApxW4l2X8+uuHWudCGi8jWDG844
         Rb10dxsNTbH6243JgqdUc0plDHhtTkNHUOmRUuv3YR9wqrzEqkkTPStChHk/9eFkXOrI
         +3147QIaBytXPQbllni/O/i1PhCcV5Eh5KVKMXRzokbGqyoSH2/NgYTKVPscP7Q2noNY
         B0Ll/Q5FSgWrvOKxAo24D4VjL3ArC3whghdCG0tnre1tQAgksw1g2PhEATOcwpzncDeH
         rlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759534655; x=1760139455;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8opnbw/m2Z8T5yDXIhCeyupu0RmNSEU/h2Gk1+QmiW8=;
        b=ZikpG2+dUq0mMnKpwSv5Hzso8yVqxB++QRNuA8Y61JTakDz9d8jj0bnkdXfMlx67pL
         G7oNdx8hwoJCk7r740seCqDaDzlA7wB5uCxP+lIBS5Hun93Sl8ZCe2tshZ8vXDdqhzpg
         uhFPlPzNBxSUNFRkOMAATplRZEUufuGG9JklkAeV4M5saJj2RsW9CVG1AIBOI4xgNkFy
         6w1+9Fuh7dpsY5tbV2Y+glr7Jpg3cQxIcyeAflHTO0995nB96j71Gk697XxwutTXICh6
         wOYa6sjhbZYCuPfCRdojEhJnorGkApSrK+F+e+LWp0E7N4s6ZnGfVp/YZAryM7BLy6cw
         KZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcfdH0OcA+o0e/VzUIOq3etXy9Bd3ohHB+yEtK7jAMqUZBdpvnCa/c9QjGTC/cKYwORx3T@lists.linux.dev
X-Gm-Message-State: AOJu0YzLOh55TngLAHi8QbayDV2BMfaqPbw10Kr07tHhE3+hgo84cDPE
	I1Qe/b9m24v4UFXH1D8Lym7PwHra4NrO2+/uwfoK0QFaCTmekB1o+wPm
X-Gm-Gg: ASbGncs2uhbeoI56cJAsH0oj2n54yAL5l+AbbuXr8YUL8mbHa/URnS/Jcw+Qc/hEQCl
	jeTH1yfG+CoRpDOo4Ns83X/xsVRoxZhxm3S5XC1Nih3sNHSOW8xWUib+q7r/NramBfzOalH9CSx
	4Z8w2+HJYmE+AysAqm7NPgjm2t93J4HAWNG7rqvZHwtFY3iqpoIqnHT2uVZHoGJ9gD1bvJsdRRA
	O99wVxwWT1no9w35IF8Am5cvTZLZ+w+Z75MgV5pdir+lN4hvu79zHNRkrqfs8bnrOzaulW1U9GB
	3u1mEqQNE0BQSXSppzGTVtPUZnwOIdTgn7QWcVZZhnpYnk40LphNyFRxEoqAEzg9ZnZktx1vTVh
	slXKhJQW/A8U5ysww/vvF4ecHaFoDF4qdTLDg+c+tAwXk+ivszOb5N1o3rDkMXcx9niSZwwv5
X-Google-Smtp-Source: AGHT+IHwNn3pqjoWotecuXY2Bk382T7KlekPldLWjd7xtyWnaXq++HkfhSeL9JeF/XIh23fgTqEc8A==
X-Received: by 2002:a05:6a00:22c4:b0:781:1b4c:75fb with SMTP id d2e1a72fcca58-78c98dd945emr5793503b3a.18.1759534654703;
        Fri, 03 Oct 2025 16:37:34 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:2a3b:74c8:31da:d808? ([2620:10d:c090:500::4:e149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9ac7esm6083494b3a.7.2025.10.03.16.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 16:37:34 -0700 (PDT)
Message-ID: <d108d59be611a63c73303347d07fe0ba5f2b74b7.camel@gmail.com>
Subject: Re: [PATCH bpf] selftests/bpf: fix implicit-function-declaration
 errors
From: Eduard Zingerman <eddyz87@gmail.com>
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, ihor.solodrai@linux.dev, 
	alan.maguire@oracle.com
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Andrii Nakryiko	
 <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann	
 <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu	
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend	
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev	 <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Shuah Khan <shuah@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers	 <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Date: Fri, 03 Oct 2025 16:37:32 -0700
In-Reply-To: <20251003-bpf-sft-fix-build-err-6-18-v1-1-2a71170861ef@kernel.org>
References: 
	<20251003-bpf-sft-fix-build-err-6-18-v1-1-2a71170861ef@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-10-03 at 17:24 +0200, Matthieu Baerts (NGI0) wrote:
> When trying to build the latest BPF selftests, with a debug kernel
> config, Pahole 1.30 and CLang 20.1.8 (and GCC 15.2), I got these errors:
>=20
>   progs/dynptr_success.c:579:9: error: call to undeclared function 'bpf_d=
ynptr_slice'; ISO C99 and later do not support implicit function declaratio=
ns [-Wimplicit-function-declaration]
>     579 |         data =3D bpf_dynptr_slice(&ptr, 0, NULL, 1);
>         |                ^
>   progs/dynptr_success.c:579:9: note: did you mean 'bpf_dynptr_size'?
>   .virtme/build-debug-btf//tools/include/vmlinux.h:120280:14: note: 'bpf_=
dynptr_size' declared here
>    120280 | extern __u32 bpf_dynptr_size(const struct bpf_dynptr *p) __we=
ak __ksym;
>           |              ^
>   progs/dynptr_success.c:579:7: error: incompatible integer to pointer co=
nversion assigning to '__u64 *' (aka 'unsigned long long *') from 'int' [-W=
int-conversion]
>     579 |         data =3D bpf_dynptr_slice(&ptr, 0, NULL, 1);
>         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   progs/dynptr_success.c:596:9: error: call to undeclared function 'bpf_d=
ynptr_slice'; ISO C99 and later do not support implicit function declaratio=
ns [-Wimplicit-function-declaration]
>     596 |         data =3D bpf_dynptr_slice(&ptr, 0, NULL, 10);
>         |                ^
>   progs/dynptr_success.c:596:7: error: incompatible integer to pointer co=
nversion assigning to 'char *' from 'int' [-Wint-conversion]
>     596 |         data =3D bpf_dynptr_slice(&ptr, 0, NULL, 10);
>         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> I don't have these errors without the debug kernel config from
> kernel/configs/debug.config. With the debug kernel, bpf_dynptr_slice()
> is not declared in vmlinux.h. It is declared there without debug.config.
>=20
> The fix is similar to what is done in dynptr_fail.c which is also using
> bpf_dynptr_slice(): bpf_kfuncs.h is now included.
>=20
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
> ---

I can reproduce similar issue when including
kernel/configs/debug.config with my regular dev config, but for
different functions: bpf_rcu_read_{un,}lock().

However, this is not a way to fix this.
Kfuncs are not supposed to just disappear from DWARF.

Running pahole in verbose mode I see the following output:

  $ pahole -V \
      --btf_features=3Dencode_force,var,float,enum64,decl_tag,type_tag,opti=
mized_func,consistent_func,decl_tag_kfuncs \
      --btf_features=3Dattributes \
      --lang_exclude=3Drust \
      --btf_encode_detached=3D/dev/null vmlinux
  ...
  matched function 'bpf_rcu_read_lock' with 'bpf_rcu_read_lock.cold'
  ...

Alan, Ihor, does this sound familiar?

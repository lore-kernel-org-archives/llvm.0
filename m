Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522CFD531
	for <llvm@lists.linux.dev>; Sat, 12 Apr 2025 00:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744417827; cv=none; b=Riqkmq52ZrVTMMy2nCSTstAAlvBNm5AX8lZkfba9tV4Ge6GjBFSyzXLT/Ez2dh6WlBDo52jXGM97ASrqhuClUNXzB+6efT4zb+GwU83jNPQSAhtE7Kc6esgk0GjTTmI7qzdtSI6+NkuWZHINShe41k5Vc74igF7mhQ/bvp21Onc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744417827; c=relaxed/simple;
	bh=/T7qziyieFTegoHq1quoWb4FCMn7r7gq2B6DB98pUrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGNpMRH39mqR6g9VT2C6AhkowK/CWLTiwF2twfWg2Imjfnq3wfiYTPcxgTSfhYRDhnaJtfR1aTOJcvb7RxZxgM2II7gkKYbO3h7so8j4PfP5KxbUAkS2hDLWPJsbDOonjd2bXqJnv9pATaTvNRsktFjsrQvxJvwaGRQS225b59A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZU7bgVQn; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZU7bgVQn"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abf3d64849dso479192766b.3
        for <llvm@lists.linux.dev>; Fri, 11 Apr 2025 17:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744417823; x=1745022623; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PY0NYpmztQQnq3XrvsDCNu1j/I4xBInhxN+nOQvSP1o=;
        b=ZU7bgVQn8GJPU6qhMnBI0bI0EM8HUScY6yLCu6V569jk2N701tWwiyusRAQq15c2gs
         Yf+Y+tNcDzz/bB/OqqnDxlEH01KWaqvXkLZH1f8BuvNcVL3I6M1SpFis03Q9GyOSLWUI
         Pp2UK8wGGKEQKdp9MbU84HNwrZqi1o7oLr0Zts6zjlGFYCNBR7HMo1gOPv4SZsSPyXKu
         ysv+pLpOdhxWl68FhLxUbLDU+Eaz03dTTU5d/PJzn87IWaW6U0bZNVa/XsQCdFSXv0+b
         mUy7W6lXXUBY7+JfJzqhO2T1POs3b6LJ40aMNLfAJ3JxxaeeoNyUWyo26e0rAghbMf7e
         hbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744417823; x=1745022623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PY0NYpmztQQnq3XrvsDCNu1j/I4xBInhxN+nOQvSP1o=;
        b=R+prIjJvofvMW1lUOSFP7BueKmokeu88yG/Nt8NYxlcD4NZe/1Z2wGV1fmlT1Msvfg
         YXT1XqqOfeR7nOXA63vyTC2CXntVe5EpZ0n6/YKclKtBZSq9jsHeDN+9RbPHfmR+ceYo
         NnwHQq/B8fTK7BGPKVKSIv4b433ckS4P5Y4CJA7LY+8nQBLsP2izQAb6Ub4+YIOwJqBZ
         YszvGrCWWXgheom/h4xvnTra/8YE+jopgmxl8King6RcVlIfHD+9alYOBLDuA7dkYrOv
         yCpisk/SPELVHBIwhZrj4gXtn4nTR4HoNGdKasDtLWuRXQybH1VnbeUrVOMmTkxcNjzs
         wbbw==
X-Forwarded-Encrypted: i=1; AJvYcCUVcEcufTTfFAmYAv/w7UnrRRNBW4BHaUcY6OZUp7QQUB+l3dzslGJVYzrryeJ6a/RzpzRW@lists.linux.dev
X-Gm-Message-State: AOJu0YyMkl4ZL7R08KZAcAwTo/wPvzKlSiQYLDjnwGKnBBK+hbVR5c6y
	oqpQCBcudSaQ5NcaWguYFGaPpA1t7Z8Z93D6P9yfSfSTChjngckOdlGyY+Np2PDJ6IBfc6kE0MX
	AWLGhFRtcE+N4L5QhhHuesJmv0V4=
X-Gm-Gg: ASbGncsnxG4vwGMh+679VFDs+oMIr9k6hE9lnqidIpHHHKC4rpgAqe+D0SNkwQSmpPV
	UAWz4PqKevdcw4djX3qMPraszlnnJsj3f431JOwsD5xlHLJmHr/aycPqDpCt8Jh+fw5DHGh3L27
	WGGEyWDLWlkG+s4QstlCnz/4ph7Iaa0Y5v
X-Google-Smtp-Source: AGHT+IHV6V1Nd199fyktCVt8NkaX19y3fkdxuYg3faWj9lISfY7XX+/TP8euSAUokRbzoCnATi1D27aZXunIc9oKc/4=
X-Received: by 2002:a17:907:a05:b0:ac6:b811:e65b with SMTP id
 a640c23a62f3a-acad34fca94mr400892066b.36.1744417823251; Fri, 11 Apr 2025
 17:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404215527.1563146-1-bboscaccy@linux.microsoft.com>
 <20250404215527.1563146-2-bboscaccy@linux.microsoft.com> <CAADnVQJyNRZVLPj_nzegCyo+BzM1-whbnajotCXu+GW+5-=P6w@mail.gmail.com>
In-Reply-To: <CAADnVQJyNRZVLPj_nzegCyo+BzM1-whbnajotCXu+GW+5-=P6w@mail.gmail.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Sat, 12 Apr 2025 02:29:47 +0200
X-Gm-Features: ATxdqUFPaRCdqR9YUd32953YWnbRjZkMYnjK4v1HZns0nPmHonjmjDP4iQ6M380
Message-ID: <CAFnufp1erGboUtRaqLoKC48c+9jmqzEfFW8W46xt77JMC0PFpQ@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	keyrings@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, nkapron@google.com, 
	Matteo Croce <teknoraver@meta.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Il giorno sab 12 apr 2025 alle ore 02:19 Alexei Starovoitov
<alexei.starovoitov@gmail.com> ha scritto:

Similar to what I proposed here?

https://lore.kernel.org/bpf/20211203191844.69709-2-mcroce@linux.microsoft.com/

> The verification of module signatures is a job of the module loading process.
> The same thing should be done by the bpf system.
> The signature needs to be passed into sys_bpf syscall
> as a part of BPF_PROG_LOAD command.

 static int bpf_prog_load(union bpf_attr *attr, bpfptr_t uattr)
 {
@@ -2302,6 +2306,43 @@ static int bpf_prog_load(union bpf_attr *attr,
bpfptr_t uattr)

> It probably should be two new fields in union bpf_attr
> (signature and length),

@@ -1346,6 +1346,8 @@ union bpf_attr {
  __aligned_u64 fd_array; /* array of FDs */
  __aligned_u64 core_relos;
  __u32 core_relo_rec_size; /* sizeof(struct bpf_core_relo) */
+ __aligned_u64 signature; /* instruction's signature */
+ __u32 sig_len; /* signature size */

> and the whole thing should be processed as part of the loading
> with human readable error reported back through the verifier log
> in case of signature mismatch, etc.

+ if (err) {
+ pr_warn("Invalid BPF signature for '%s': %pe\n",
+ prog->aux->name, ERR_PTR(err));
+ goto free_prog_sec;
+ }

It's been four years since my submission and the discussion was
lengthy, what was the problem with the proposed signature in bpf_attr?

Regards,
-- 
Matteo Croce

perl -e 'for($t=0;;$t++){print chr($t*($t>>8|$t>>13)&255)}' |aplay

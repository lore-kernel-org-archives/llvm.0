Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4171E522
	for <llvm@lists.linux.dev>; Wed, 27 Aug 2025 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756267421; cv=none; b=RVe1Hj1adxyAHDldQ94AE203vyNak+DqLbW99hv1ODrHTI/uZH9LKl7K/G5np+IEURp1mhxaYUPI2WpmXfS0Nnz7xOxgJx3X3tQAB88bcWBux0c2daWlU6V3AQG6uHFNbMgWcmBqI/4f7wFUVMeJcXkjJL+XOhAOa64IAWSV/1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756267421; c=relaxed/simple;
	bh=A87iSRfscBq7P7SkJu3Iss7j2q8ndX/POmT8sGhRjPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZY2Ip/eSJefbSH4XkSpBoRr6rFop57gBv7YkVuCx9ieGKcgqqomNn2b/azOgGbdgNTswi0y+Iu0oEfw40nhqJ7G1X8DkhJ6LVpaADS6N+p9Ou83BZjVG1kSxQC/ti55nh/1EbR5bBLlUVaCRC4PppaLXot0w36x6R/FtDLgYCgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUj2vLBQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUj2vLBQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3cbe70a7923so792471f8f.2
        for <llvm@lists.linux.dev>; Tue, 26 Aug 2025 21:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756267418; x=1756872218; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHKcYRsTqnrv9URkPiuGk0iej4H3twd5JOLJiNJ/Tfc=;
        b=YUj2vLBQkznFEQEsa7RPo0NLqW211xKjgy8M8tFBmAKaqFSU54SQljutzhRiYGo94N
         Xb43atyrZCslqYSnrCJpiEISPievBmczSxBZ15xdnKu+3jVVgdu6uX4N51MWUelZkDBw
         CpAYQzeHoLRxlAoUeGzwQIb9seP2ICmr9yw4T7xVbbkeLMyX015Wt5xBmcxF4JIbn9yb
         bMBYmsZQgY/VsHZo4huR1J5u+iy77svPty2T9BF9thFJkFkmoKjFm8wv6OrNs1ZpWtLp
         kQ6iygaTKfu9rzKBZPFkv2DUxNGpxhklI1Z3OJks1SHhIRfJY/hftuvnQVDMmrzE/hGY
         fvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756267418; x=1756872218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHKcYRsTqnrv9URkPiuGk0iej4H3twd5JOLJiNJ/Tfc=;
        b=H21LziM6MlVscmPJAlfx5jRzu2Cy9XPNBQsM4V/mDDiw18po4oldKGRL0jOVQ5FNre
         3lATV/PtpFlGsYZ8XSDrbKomNAn99SoBxuDpgvH9XLpSUzGpyDqpnHHvh84oMxnfWTOr
         8HH8khn2De8UbpqIjWqCXTFtyMZnw/VGwO9RHARt6dfL7Ef5eBI5vX94vauNyWOEOjIf
         HdG7m6WlGqInaDq5obotkY4bjX6QjQu3Z6SZ8vJkoY0ov7n0NCwGTbVmOYbvY8iHL1AM
         LcqWD8OBScO4TyjOz5PYjCueax1CQe4zXo4s2gy/F+ZGSiHApGILRL1CNbH486uMiAx2
         dJzg==
X-Forwarded-Encrypted: i=1; AJvYcCXviFJzx9lDQZv69LQYDNHev8VkDQg3xZJ0Fuxk4js83oI1RwdyBMBt1tUglVWBTfJjBCf5@lists.linux.dev
X-Gm-Message-State: AOJu0YwJCXn0RP6sjx7ImoEZATsIU8sZkMKu+i0vOEKNUTlEXmTVIUMo
	hS3H7r6AcOPcME1gDNXkICchnEBN/d8AkmI9BWDg7QdbfFhiQ7L+a1NeZ8vDQL7VNOA7j1FMbFH
	/jUBbExQ2quxNhjcHwEelTVgkM9VN1BQ=
X-Gm-Gg: ASbGncucSOwLPtOMPqdPWcWmk4HWIfekAv6J9q5fC8SVZyfx5zHCbz3Z31IjF6BIpnP
	fNVBi8QprdCFA6gH9M7f93oc8EHiltcakXumjaiwvIvgUbhoYX1paRcVjxMynbr946u04ipzp4D
	gu7wfJO1KmkoWZAw1rCkvFK4AayAJvrQwMCK/LpdUf02yPx8dUMRqlg6ciO7zYF0cYEhuGG0w3G
	mY39BiqD6ZtU1t1/gzML8WHke9+hlrEfbg8
X-Google-Smtp-Source: AGHT+IFDWKI4ZGd0VrwR+tlbRT2bpFaa0Wri3a0FhO4T8VY8YDpJ6CXxmBVYEC8Zpvs9OwA5CQ3stiQLNQBhXkLhC/w=
X-Received: by 2002:a05:6000:4010:b0:3c9:79fe:f4f6 with SMTP id
 ffacd0b85a97d-3c979fefd71mr6751069f8f.18.1756267418019; Tue, 26 Aug 2025
 21:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250827031540.461017-1-yangfeng59949@163.com>
In-Reply-To: <20250827031540.461017-1-yangfeng59949@163.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 26 Aug 2025 21:03:26 -0700
X-Gm-Features: Ac12FXw4hTBUHTL4RjsVAGs1lO8wZQ0GKceQVN45AgylHH7YunDvWiMf_lzMnqE
Message-ID: <CAADnVQLQ4=sLwwzuzip+FoeW1RDxKtuhDRbBSnigeQ6O4w8m0g@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix the invalid operand for
 instruction issue
To: Feng Yang <yangfeng59949@163.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 8:16=E2=80=AFPM Feng Yang <yangfeng59949@163.com> w=
rote:
>
> From: Feng Yang <yangfeng@kylinos.cn>
>
> The following issue occurs when compiling with clang version 17.0.6,
> but not with version 18.1.8. Add a version restriction to fix this proble=
m.
>
> progs/compute_live_registers.c:251:3: error: invalid operand for instruct=
ion
>   251 |                 "r0 =3D 1;"
>       |                 ^
> <inline asm>:1:22: note: instantiated into assembly here
>     1 |         r0 =3D 1;r2 =3D 2;if r1 & 0x7 goto +1;exit;r0 =3D r2;exit=
;
>       |                             ^
> 1 error generated.

and once it compiles what happens next ?

pw-bot: cr

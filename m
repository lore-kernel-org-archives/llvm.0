Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111CA372686
	for <llvm@lists.linux.dev>; Wed,  4 Mar 2026 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772618540; cv=pass; b=cRlsLKf7D/f/F+A6Ww08ZwfPclrxazONKPETKl80IV4hOm/lAiISyoeZwV/hEL3mCPoYFE+wOFaPBCl0FIfFJD6uYpADqFKU+/r3oFd/eeuJA+zrMrgDPYljmkJN0dghtcKI1djRtSSKe+9HNVvL7ujbOti7L/yiG/A+D454mKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772618540; c=relaxed/simple;
	bh=LIXUkQND/XUYwmiVyoCn3iAB4eY7xw2BT+VhHfmIACs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICXyuXETgAXudgaQ9/uOxC0kYJsxD2QJ8zQ6XgvbsHUIWIaBoBsE0qL2oJfp2I1in7A0trD+z/9aX+wZk0pXNqlGVnZ+y3qqmj4cgVYsuv9AiLzaV9MJBTWkQBQblc3qpX3QUdTfgNdczZ9b+VZBHSLFaJvgdzoZIlb8FR2qoGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=T6Z013fc; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="T6Z013fc"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-506e287dd53so58645371cf.1
        for <llvm@lists.linux.dev>; Wed, 04 Mar 2026 02:02:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772618538; cv=none;
        d=google.com; s=arc-20240605;
        b=kJDxScfQnnXxS34W2xPJv1RwxESXKiiB9rBAJigszjRx2vBI16LJhat4jZ991Z3bO7
         8M8S/rgI1xQMlU+F1O/z7QaKzhfgdYlhit2sDRKL/0bQ5W6cx2XVBpqaoJm4Ppsbgs5H
         PzOpL1qXVu/AcTRIz7TtN9o+XyHAccguj5yeAYjSRgAYXJH/64xCpOBh8C5tZriDF/mN
         s+t7R2fztjKkExlZYUUlRFV8MylqSvmFibFkyG6NaJR8dTPKc6Vy5ALrUG79h6DPGhpN
         8404cS96jSkJqgT3IT+nKw1l0/ggqKLp1tb3h8rEujvjnAj+GYhPEnjEnF1VteSHfjMZ
         nbyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5rljX6QFPComIDSDQ1Skhem5NjDWFGniNxooYJEikxQ=;
        fh=qX4CAtbawPuFkTMWrP+4hMFzgRzTong0g41/8U0cNPE=;
        b=L/sNkxwwqH4HX/WOO3EgQkzWAs16Kf5NyLV5YJCLbRdAFPxswqa4kFwnogP7X3w/xk
         yrQM0/i6oIE9fexmN/tbDMWjXThtlJ+xmy6aQYxlmriVH5QwFpWuMLqb95o7KZkZoS+A
         G+ydjn6HkyzubpRQrbH44k3li5nYxgFLXHeK5Fru2ImnefS4ykpweMHcyUQgzOJZfTom
         n5cPzcka+V0Knes6mLR/seZQ2qyJWWK0sMY53gFj94okiLndOjDOVlAaD1sZVfER6B07
         BwOQy3HO0FYGGEe82OgmhYB9OEFKwQ4WFFxW+LUhzqytVSAs2+fBg7Wt33zHRhE+OuIm
         QhJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1772618538; x=1773223338; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5rljX6QFPComIDSDQ1Skhem5NjDWFGniNxooYJEikxQ=;
        b=T6Z013fctX8tQpV1DjmBc4mZ5jvqqcC0NNW4C+5YZzFLYBDUZOSF4tkllEyEL8f2YZ
         +zlUbcX0h2i7zzekqdx4Zi8gcdNFmJ6N+ClxG2s9Swa1dKYtqM8SjuNzBr1xsJNHYIrj
         CE9N/4PUOmE9XV+qmZ0+BZWq5Zasz9ka86AqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772618538; x=1773223338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rljX6QFPComIDSDQ1Skhem5NjDWFGniNxooYJEikxQ=;
        b=C7mutU0LUTuvf32FKTkJpkSB6Na4fLDaPMKTpTh1SsSS6u8rd2Wm7nRR4Kwhjh82S7
         AYHXVYQDxhTVOuscxNDfxbIUWE/TMgor2DH96TIpHB2XmBYz8oF3dDn86hLlyKLJbbbT
         L78GvzgtyLKnhp3wiRb0f85B5Vl2mrT4NT/TA8F1xdp2dBPmcFfuTOtWRozyMFcVbYJX
         GkvWXLi8W4w8eAlOoyGfb6Pg3b4T2hL0ALsaAOj5NRHWs9nQcZrTtHPfOUwl0//eqI6K
         4eBeXJaglIbaR6dnaXsBNxwn5PNuVYHYh29cC0fzbtqB6Mr9+e96hsJd49UHxSzPlj9Q
         IqEA==
X-Forwarded-Encrypted: i=1; AJvYcCVe9LfyjUXxqysc52MlifIbPUkjyiuUxHYfyU4RWqpL4YuYqa/Q1SrASt/0N40pABkerlu5@lists.linux.dev
X-Gm-Message-State: AOJu0YyOtscbrvk2QkisS5Jhe3f3vz1Ue1ysDe5C4G/zJMLNVKx6e895
	CXjcvdTLKHo31PU1MTtGzztqeBfCD3gw+V0ZENm1r9ZNc4auo2Sz4Ouj9eNTR+oiOrjfM4vrxFx
	AyJh5Yx4u9GpAyeivWbOxJLYl6rStEmDvUFkZdWRz9A==
X-Gm-Gg: ATEYQzz3/vDgl8DRiOzphX3faiUcIgLQzD3wYvNpoSNRFCNFBJYb54SUCAduZhN3OkT
	NoHxi8/Xi+A2b7Djl7/JTToO0rmoV55vU3nTEUhXh60zFsJFmEWbx5STGz4gyTnx5oUan+I+oNM
	C3TQDNhgDIfIYSwLyqn5VKem5JPuU6vb/Un+qrij/fZDDsTU7f4n9fum46YfEFY0YzuIpcaR7rT
	vG5Bz03pgYNbOwEbUxiT+BQO9d8zQSoK32vcxIdQKK6W96iTsQMj5oygRPGKqiyY3d2biy1iLwC
	D8cAy2jdLg==
X-Received: by 2002:ac8:5d08:0:b0:4ee:42e5:f5ae with SMTP id
 d75a77b69052e-508db2a0f46mr19747451cf.25.1772618537934; Wed, 04 Mar 2026
 02:02:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603031522.e4lroM3J-lkp@intel.com> <CAJnrk1Zj=U7DkaQRRfbqqAUQ3+3R2hS6agtj5iOLKO5+ucBRmg@mail.gmail.com>
In-Reply-To: <CAJnrk1Zj=U7DkaQRRfbqqAUQ3+3R2hS6agtj5iOLKO5+ucBRmg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 4 Mar 2026 11:02:06 +0100
X-Gm-Features: AaiRm51FsggTwyckvNK359mX--xhf-NMyHgCYBKJtOAb9mDYPUQDjmmmHDb7Z1o
Message-ID: <CAJfpegvgbMMmxt7P6XeWt=ZWqsF=db-u8YmpyFz4inW-gZe0cA@mail.gmail.com>
Subject: Re: [fuse-devel] [mszeredi-fuse:for-next 9/12] fs/fuse/dev.c:1818:43:
 warning: variable 'folio_offset' is uninitialized when used here
To: Joanne Koong <joannelkoong@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.sourceforge.net, 
	"Darrick J. Wong" <djwong@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Jingbo Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Mar 2026 at 18:19, Joanne Koong <joannelkoong@gmail.com> wrote:

> got switched around. These two lines should be swapped.
>
> Are you able to fix this up locally Miklos or do you prefer that a
> fixup patch be sent for this?

Already fixed up, but the push failed (I was travelling) and forgot to
retry.   Sorry for the trouble.

Now pushed.

Thanks,
Miklos

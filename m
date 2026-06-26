Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B3B3EC2CD
	for <llvm@lists.linux.dev>; Fri, 26 Jun 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782469086; cv=pass; b=Rd+FUqNifrAR101HP5fuLyQSs2lagXOqZ1XhxBrpMZkAgbxi95kWBSWhzeVKj0fts9j7NQPRnjiWNSZKTahqxjo95ARU7ymYRAfA45mRbC0oTVu3yf7pBg25tuQMKcCUKX1XJ4n7HXeKuLGeTJy15sXlcjtjJQ5Rmj2BA3r5FZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782469086; c=relaxed/simple;
	bh=OwEemPqInwbSVk9dzdDs5pHQn5Viy4wnF3S49Fh17/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLT78w0dyzgBhd3ALsP64mEMoayOpN8wOFuTJPA2aZnbFa0F/IrpJDi8CttOkE3Tyqud0NkcSasgd7Y6fdsQA+dUOS1mcYYUTibvhmvca/tXq/NHOsKi+TjxkYhvPW0eYQffNLgrjxzfRhz12w3ZBK5b1Qe/dlTBG9NuRSHlUaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1++0myA; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1++0myA"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bb87c90deso74137eec.3
        for <llvm@lists.linux.dev>; Fri, 26 Jun 2026 03:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782469084; cv=none;
        d=google.com; s=arc-20260327;
        b=GIV4+wn4JYE0bGw8ZBfb6U3Smfd9LrTtyic40xic1FvHDCUMmB7TvNFYVrCN+VMoFT
         kRXD8wVhHsfbwTN1Lpxn9UUog/LE4jtYMLUuBPcU0WtLh1V2da/lLCvBbfb2rrUpNm/b
         HG7F1m6NxJff4ibqxGdEWSSNHY2rzSRBT6RL1EDW48Ya9Zci8Tx0P52NF5RTc7mEmoe7
         Oakh9pe2wi+YiUlmjcS2J/aU/pj7uRElZ+IN6t1WZu962nIcr5RgLHfR7OSJmtyOwBPS
         6PaOiQ5nMVsa3w+rVYqtZsY5CYOwRjRz6es3vqBTPTRV/RZqB1F/UTKg0WfQIXFMKrlW
         SMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OwEemPqInwbSVk9dzdDs5pHQn5Viy4wnF3S49Fh17/k=;
        fh=d04pUyJF0mSivdcsPn3Q5Dnt28pmj3JIMUTfufoe3Lg=;
        b=dKKRm5sVWfTTU0Cgxrad3pW/70WdXuxIzREo4aRFAg48LRHfRf9ysa0NGi/vgzn1gm
         sRKs0ooE9owbCHcejAOKcpBxgMPJsMd5BIZUe8+4W8pB/xF8QgVPf6P5cfpkEE546uGv
         AqqkUkSp79X9DOssDMy0h19Rg5MfhxXtfVUyvknHTR6hRnAw0TQ8EVxCnBpOvyd2U8tT
         yRcb4l6I+YqOkO7H5MnxZKLWy6UlaWQKVNKbAWXmyfuuLsWkm7ElEOSpOec4loDfboJo
         KmwYsdxy87UzCM+V7UguuvnMXetkv+md8u6nt7dlXEMrlxAgHMAmcR1GnFa9tztyj1G6
         n8Lw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782469084; x=1783073884; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OwEemPqInwbSVk9dzdDs5pHQn5Viy4wnF3S49Fh17/k=;
        b=d1++0myAqjQqJv/bi4B6YyqgmykjW7eJln/1XsDdAq+szPF5duBP3/8kyDGcllYE3d
         I23v49/3W7urGo+VUyH84i9MOx71XmdDljJGVEpN7gAtozI+Vq+uuKBtRrhjBfo6LVsI
         kOoZnNJGkjsLqXWZKTEK0BhTMb4UZqJUaccQuk7m//60NpJ2aK8WJhpaargnMDWky/Fy
         2Y8/JFv0Ypp+TVzWGeB9v+SK4no+d82Te3y21T0B4zI/XieFrFSd8Ze702vim2sSHBSM
         VF53zZYDkY5ijfsqniXth9Aj71pLaLbJiN8zabyf41w8d64EqCYoq6rPWDIL7UrjmKiP
         CKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469084; x=1783073884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwEemPqInwbSVk9dzdDs5pHQn5Viy4wnF3S49Fh17/k=;
        b=ob3DOecYcrw8f6SVwXinlhpy3ahJBx301K76CS3x9hmqWx7xDJRgi7ekjWPkFamHwf
         5b15wrHvhdbDxK8wEJH8Lpdo8+OlZIiJNphlLPe8qBcnH0Xdseuwvl7wgTpP1UUPzGWq
         Y52L1A452KTdJ4whvdZxEhn4vj5jYY6wz2j3+b4JTVs7KdDc+Pif2lqxl3oGuXzDk+Mw
         hSoZLZsWKYw4ZryRR814+yszyw004Yba2oR9xHo2MgnqOYRLBimGMxhELNmo7Jf7+DgA
         Gf99o3McTYaIqRo3aq0b9CW/6uF3nNueL2ebL+BOoK+l4zIye8eRIdRXod5jhSAk4mgg
         CZvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZs1oPHHtdfwRwugAXlC1Y4QVlBwUHXTh9fLFoou05LgghhQPaJ8xrAfnmsD4HBhnfVbDg@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5+luB35H3ijkmunT2pBy9NhQB6NGbBkkamm4qUxIIIK2B9zyi
	DDm60e42taw/0F1Anw7eJDZO5iIA76/vBDJPrfLNL0tJlgb8yb/xzpJhGdgCg80Bc5XD4T/ojJC
	yTVJKFYIyGEkpCjD2RmRM5zVZpWc45ps=
X-Gm-Gg: AfdE7ckVMEa3VF0cGzrNwaU7FP/Xl/jt+ggyTEjFShaxa5gc0G0lefpmttqtCOxP9tA
	uRR87l+Bz2Q3rQjR9wHXHX9lJReQG+79jAxDbXf0vjQphIBvKID4FqoRHZiPeBZ0OM3gb6okarq
	HbmE2GH+m4zZy6Ovg+T4rlvT6zOeV6Vkvs+H9xgEZ0QgR8nwBCilLlXh2BExofUKBRN57Z7BY5b
	bx0F4MYZiV6qjbe4kWMYrKafyN8+HYfYysX2616sWYneXa4MzieQZ78qlEaqT2o+qW/c7IUixgp
	aiiK7Wtvx/mkT2GGOcv1z5zQAh/ew2n+l2aZStCymwlJoZYeNVaKudl+dt2XhsBiYJv0y2tIdl4
	+fw6w7hbrcAxf
X-Received: by 2002:a05:7300:e6c6:b0:2d5:9438:2a02 with SMTP id
 5a478bee46e88-30c84ad9f55mr3026758eec.1.1782469084327; Fri, 26 Jun 2026
 03:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520064630.1785283-1-mkchauras@gmail.com> <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com> <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Jun 2026 12:17:50 +0200
X-Gm-Features: AVVi8Ccrx0kRQsHQymdfhdPBE1X5e4EB1kia4xesGjoItezYgW-_bvi72bKccEY
Message-ID: <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, 
	kees@kernel.org, lyude@redhat.com, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 8:50=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> This corresponds to a floating point instruction. Although we have
> disabled fpu, vsx and altivec we are still generating these. Seems like
> we have some issue with the rustc here. I didn't dive deeper into this.
>
> Is it ok if we keep 1.95 as base for powerpc64le?

It may be that it is generated but unused (we have that issue
elsewhere -- see e.g. `rust/compiler_builtins.rs`).

Having said that, if 1.95 is fine for the powerpc arch maintainers,
then that is fine (s390 also used a higher minimum -- please see the
recent change in `scripts/min-tool-version.sh`).

But please try to bisect upstream Rust to see where the change
happened, i.e. what is the root cause? e.g. `core` changes, `rustc`
changes, built-in LLVM changes... It could be that it is not tied to
the `rustc` version but LLVM's.

Cheers,
Miguel

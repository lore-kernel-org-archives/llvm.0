Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A741E884
	for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714117141; cv=none; b=BAZDVJ6v0Mm4w8j/jLt+a2tDAzGZo54XFBSHVape2csqKvFlIj8ujnuEKHcGtCGIiZK1+T1dcxACV9LaUcjnU4qy/p6BAtzWU3QOATWwoT9VCtrWNgJtsrOED3HgRL7SggLhiiooH5IKTPuVI76wS+WyUIgeCeBS5Pqzml6yD4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714117141; c=relaxed/simple;
	bh=0fY+v8jAh6tWCLz33v0P4ja0L1VLAobur3GCDQhmp5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lycCjTt2zGMhc8lbJdIkTuac/9f9I/xU/Zw1HNDkRlrnndWMN9/omdOyWmNFMz80o3UvQL6/guYqyrVn4x3GxYfA935uGGStATvYjHa/E3ajf4bZrDnhXhdBQjnFdWVbGPtYFPzXBgGh9HI+cflihii6+26Ctnrky/BnpQJfjPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZYVxNeN; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZYVxNeN"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-233e41de0caso999520fac.0
        for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 00:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714117139; x=1714721939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGBuvvToC0OqPUpGTpLM7JYQ+5mkS2lL6n9tHklK4Is=;
        b=OZYVxNeNzU291xhEEzDrhmtjEScIE6PpZ4imW2zLGvVm6fyR+NDzjoTJ1uf+UldDNc
         rfRtf2nRtC8IzMqALEYnlLdyqHIzF1NLqDWxtf/9lK5oypxjRLMg4ufQ/xUeoG7XjgGY
         YPek0wbmYUXo9CtXq2pAKfZeam+8aHwHAL0g8DxM4WEaugTEWFL3GpAlkHBGgrRIpDlK
         mNl7Od1PiijQnLLTEtkCa8vQceQC5d34+PLWSdeSRwtQFCFSqQKDuVeGJtO2azmrbzMw
         mC0W8K9EKQW8/oZFGouTtQwNK0GzeOJhzlsL0z4z1G4Y/Mmkm5f8XVXWY6Md8qB/Gzk1
         mArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714117139; x=1714721939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGBuvvToC0OqPUpGTpLM7JYQ+5mkS2lL6n9tHklK4Is=;
        b=tJ9Y2jLA01o9ueQhkxOTxGGZJ+2BoU0qQ+n6iR+OLAatBSDyPgP/jT+oMl+XpMvwM1
         xBZXGVT9MjplnOzYOqQmRsgf+OcfSWZY6CWfghwVNL04QnXhJC0JqgPoXyI8nwz8PiK6
         ZgUsh5cDHHbKLGZQYEwRdntgkG8V1x4USI8YimAaG2Se9fo+IE+YllEOQthLj79mVKa1
         V+fsNgGA4XgvAWRZ/24mRBU4KdSxphCyh2U+6PaUD+AHTBLyN3qpsjr4WxOetGDWdqPm
         u3mVAiLJ2GA+UDin7GkIwMtgwLuE4nTrXQBuM7H2zJIHUpxNXO1ywrxr4MQjQfcmjHW8
         mYkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIXE7BzKNce6q/dDvR3YAL2DeAOY08w+Te0p5FO7X1Ql58b7jZ0asr3a4MCTCCPycXEvGgyXj2LiXRrga53FQgPHbbbA==
X-Gm-Message-State: AOJu0Yy6xHaQJI8pK8AqXIf9pnBi7gEvi2dyzniKhe4wSi4DdZsIn3np
	76vJfHlfkOOR74ZgQlUniM41Oz933dVB15ZVUI8KvzH6kSCvvCUTPUcnwY0fd9qnNbFn0NyLnmn
	fS/65fISPexoz5cxET5sLf8rhkNo=
X-Google-Smtp-Source: AGHT+IGIDbfoLyF/vcAyw4u9+mdZJ407ybr2DB4NCliEQjhEnWJKZ1nn71+acLQ5mnPt5EZKBCvLyLs+Ddg52AXhG7k=
X-Received: by 2002:a05:6870:200d:b0:22a:8e5:940 with SMTP id
 o13-20020a056870200d00b0022a08e50940mr1651801oab.37.1714117139323; Fri, 26
 Apr 2024 00:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1714113680.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1714113680.git.siyanteng@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Apr 2024 09:37:52 +0200
Message-ID: <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 9:00=E2=80=AFAM Yanteng Si <siyanteng@loongson.cn> =
wrote:
>
> v2:
> * As Miguel's comments, translate commit 01848eee20c6
>   into Chinese, as well as commit 81889e8523e6. By the way,
>   these two patches haven't appeared in the doc development
>   tree yet, maybe we could consider merging them into the
>   rust tree?

The former is in `rust-fixes`, which will be sent to Linus for this
cycle. So the English docs will be updated sooner than these updates,
if that is what you are asking.

For the other one, it is in the RISC-V tree and I assume it will be
sent into the next merge window. I don't know how you normally handle
that (i.e. translations being updated at the same time or after a
cycle), but either way, I am not sure why you would want them to be
merged into the Rust tree?

Thanks!

Cheers,
Miguel

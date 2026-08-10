Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E82419FD4
	for <llvm@lists.linux.dev>; Mon, 10 Aug 2026 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375757; cv=pass; b=bNkGQujjoKWXAIvs4o9rA8Kk2nZzrL3Uu/KEf32jXmK6wwdMt01OFUDO9uO+XxMqwQIgtTTVsrFxNCfP0Yy4Tj1nsdl2NwTijtDb96yrmq3cb0qrNdk6Y1CNj5qDLl2x/rXn5f532+RMb4R9flf9TbuwULqf4lR+sIkYvRh6SUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375757; c=relaxed/simple;
	bh=QQcvjpFBxvOWe2H86cB9ftedEn5fYdXPQOL4eTzqGxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJnO+A64U7KLNEpDhzUMN5G9qMoSQn6bhdOY+cCWl1WmjvE5on85HqlcYabLb+nD+ujNzVFObhtwspTNZnp45O7BdrUVIV+mjE5gjdwJGmohPhqoxqN/OeocHjxLIB8IBwdzsYaQYjvOh8YPuYyXibww68qLy7jupQaTDEj2RMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/SGi5dh; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/SGi5dh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cffd93cdedso1409405ad.3
        for <llvm@lists.linux.dev>; Mon, 10 Aug 2026 08:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786375755; cv=none;
        d=google.com; s=arc-20260327;
        b=GI4FxsyW61c3lMsyQ5ouqbgPH6FbtS8nJVt8aNlTaNsCd76+gmVtqq2g+WkHZLsNAy
         vtuM8zWvSLZaGbvfG0wzak/KHuvpJrtSzoPyjk2+VXCTAIzxxEocGEDihvkD2ysBuQrb
         keECDEG1IlqVZ7uTPmOT08PZHhS9FLAU7eTgRi3ESrwzG9E2pxXzhvD7XWa6Lzw8jjnd
         Tlx4nH7Q8Ur2ZUdAZuo5FZNs7JLI1SE7nrOdU/5mHgsc+KQekqzxMhNR4R9MOpZmRg7P
         sqGvljlUI42ImMFniUtngKIi55jxIp64cjjXHMyj7j+779YEMGt1UigqS5p4j+nN49ta
         g3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s/Fm2bHN8R9mk3eCDzFoDCiCVWfHB3t3hyd10beUfwk=;
        fh=fgDvLLxs5nH88NMb3Mx3BN+BZqY6+w97Hd7gLHvMq48=;
        b=VMHTOO9MqdtPNeurBQCoZbL99iyy3LRyqYj98DOAYidyKvL3BUj4tyUYUOJ8WJ535h
         WtW7vw/Kogi7FKgw/jRr13EzmGOuuHmGfmq+c3+d609JFfO0rZ9uAzbhfpmgo9HI+O1L
         NcX9Sj1avkZ3x9+i4S3H7gDpN/VctBBPL1n0GuRYJnrBUxpuRs8j5ZgpM1vuW+wD4ztk
         bRxD/gl0pbA20vm7oE7vltbeVEpFgFer8Z2valPRUpaNY8eJcVIIWTWZNWg7jjSmk4lE
         t4k34Mdk6hmG4XcHw63a0An9SNNZgY7IY+aLUMzXY9NxYqwU2QRe/m7oM5x7G1XT/SUN
         JJ+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786375755; x=1786980555; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s/Fm2bHN8R9mk3eCDzFoDCiCVWfHB3t3hyd10beUfwk=;
        b=q/SGi5dhje1qsyrAnj3fUyXvK0ffkc4KWgcc3f8pgb69LwCGELbky2WvbVh2fxqUP2
         pbkzoqy6C8LG+KbH2dWFbMl0dX/6bs6ORoVfBfmHuQaM7of/Nz79dKmZJWGYQXH/dVBr
         Ii4SBXsiAkNib20QZL20uqw4s7xqeHVUyOKMyDl1yXSVQa2JA+QkM67S1Ksf87xrHo2G
         859f+7mc3W+4myvQf3v4ee4kg7WD3++6di3HIZJao6MWdtYTjFSeRdUnPpqymuyxQ6Ti
         fYWtVMbPO3kr0pL7qv5AqDQJRFdrOdprKgtM+xRzHctJXmzkSjh6BETCcOHOF55uDnJ0
         RwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375755; x=1786980555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/Fm2bHN8R9mk3eCDzFoDCiCVWfHB3t3hyd10beUfwk=;
        b=k6eAUNqtPUpDJ8Rk2KT//brzrMlXaRlDWPNLQuhy8r3M7h/ULrGSl74JgMvLxu4dZr
         S7vvXN1QatIAxYlkfkdKHGUJpC5Ka27QATb1ioO1VWbGMLPFAuZjNhqzFOjelYbgMIbx
         fr6B+WzumlP9Glkgf8lZwezNLOPlJ3WYvWptkkVhCzyiMqG3xFB4zajjn4ioivxu5Wod
         vLl1E1ISzcWwuCVC1g/YlZGZMgtp4QAIg0AJPrrBPUQqno/a7yLKEhXz6TXUpgW92hfB
         1ihnyWwoLccB6klMvLeSsNLPoGwYUmZXCwLComge4TxMjLj+feQKB+A8vm4by+gGZYgM
         +BSg==
X-Forwarded-Encrypted: i=1; AHgh+RpOmflmseJW9noaeG0lFQJ45lzk6ZLo/QL41Sd/jmXiqqKIGf5PohABF3Nbw9jPOINyXL3+@lists.linux.dev
X-Gm-Message-State: AOJu0YxxcdgX+u7sE4gNzygbuRyPJpbuO6h5b5I1v0wBoasGgnxSPukT
	3Ii5rp2drwguvYdWw0cNe6OyrM/NyLbJqGSSSRlojB7z1MLSm0oUAFFmrc7WV3ERBlO9L6F4z72
	EJ7wWCqxjcfit/2IUQSUMb1siVA9ktcs=
X-Gm-Gg: AR+sD13p8klFntqDLVXBJ6pWKfVtSjenrBSt+N/okjzwTiiaCIeNyrMfS8Wy+hrMjC7
	n8s5Yla8gHcz5eHgZ/1Y9GKiAU2vOyjlTnVCrvNbRPrKnDESo70pE/wpUuct0WMPzabwp0GYA2e
	ktQirFxbT0uBWREgJCxPQrU2aU++NIZfD6U7Wy93UZf1NPfUKnDzkh+Z/9FOD/V8zIUg/K8mqTM
	/uuVB/e9r9QYGVfFdCnd+d9drwQ7/bHEKzFc0PePP9el/IKO6tZlJDL/wbCdh75mKsFHHVyPkwP
	4+xuPh2BFi1rkZDAio9l1f7qehsIb17ZoV5TbXRzDhbac4cGTMujyUBpRf3tYqr/dzoiKMLsZrw
	9JmpBHuLlUqe4Gf+NCLlerIEFYsZbGRzxd5UKncdEADHHHmD4QuH9yr4wndRh9A==
X-Received: by 2002:a17:903:2c0c:b0:2cc:d6de:d58e with SMTP id
 d9443c01a7336-2d0cab4cf8bmr342919145ad.4.1786375755110; Mon, 10 Aug 2026
 08:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260808032143.2767112-1-mkchauras@gmail.com>
In-Reply-To: <20260808032143.2767112-1-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 17:29:02 +0200
X-Gm-Features: AUfX_mybYBfAvOovDrYOcTyd1C_fVfPz5haDD5xVrOIi_oQVnqWaVcjmgOkK6Dk
Message-ID: <CANiq72nH+7P0PtE5h_kpn2oSK3-CgM-q5f3B=YemJOgQ-AfwPA@mail.gmail.com>
Subject: Re: [PATCH] rust: uapi: replace direct asm-generic/ioctl.h include
 with linux/ioctl.h
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, wedsonaf@gmail.com, 
	mattgilbride@google.com, boris.brezillon@collabora.com, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 5:22=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
>   uapi/asm-generic/ioctl.h: warning: '_IOC_SIZEBITS' macro redefined
>   uapi/asm-generic/ioctl.h: warning: '_IOC_DIRBITS' macro redefined
>   uapi/asm-generic/ioctl.h: warning: '_IOC_NONE' macro redefined
>   uapi/asm-generic/ioctl.h: warning: '_IOC_WRITE' macro redefined

Thanks for the patch! I can pick this one up.

I am wondering: the quoted warnings were shortened intentionally,
right? i.e. I saw longer paths when I reproduced this.

If so, then we could put the full ones (at least personally I prefer
that, even if it goes over the line length, because I want that it is
easy to search for, to avoid edit mistakes etc.)

> Applies on linux-next.

This would normally go below the `---` line, i.e. outside the commit
message (and ideally use `git format-patch --base` to provide the base
commit too).

Thanks!

Cheers,
Miguel

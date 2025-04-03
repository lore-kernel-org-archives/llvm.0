Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC17724167F
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694835; cv=none; b=q73WsG6bS/CXZapMB/svq1KN68+iaRePQxWI8rvwAW9QTbxZqMvAPStk1oQRfdwLSfTT2zSn+uoXktqBRemmNGhTyxotpZXdeaT0MY8FCmsPTEEVu5YsKIoZb1CRmSdJ7MdnuATdLrjxu/Mytp80ETpkoQomjEoCxyyvSbk0q5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694835; c=relaxed/simple;
	bh=LLyahjp8dUbS0PTJb6Wv/3FQc531IuBzGwgR5Q4UtNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yxy6RSavCqqyFnXt7jaZXw4XhBtBunqcS3KGmtKyyJrztpyILYd7tHtWIdUKIsFbsw5JxxA7Pyr+woYItknMfhg/vSs0iOj6SdnU05XuRAxmx1Mb+Aa+9Zgm1pfkKBRmrCsBbgG1GtNaEpPx8/y+ZxO7DeIC3St6WwjXE3H5vu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=AEt1CEdD; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="AEt1CEdD"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e53a91756e5so985971276.1
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 08:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1743694831; x=1744299631; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pTVLra0u+1FpM17aNh7S4PmJQcdVxjLqXOG1m/fwvo=;
        b=AEt1CEdDBu7dQmLzLqLNGS+N9cUPpUa7T2xUEkQboNU5ncs7zwZieobv1wD8vEGqd4
         2R8hXTcdaXY+9pX4gNwuZ4nQtxFQuIoUPAyVHydWklq9Gz8jyTkbbWnzhyKP/EPIwIdi
         Cy+sfvC5XguPzxMyX+GGZGXl4ymJy2tRnGZ84cq5F+TKQjbH7R0kKbv8ieAm/UULmMog
         dndDrlI+YDsygn89mXzXG7/iSJvaUb+pB7bmpzZHbQfMuzqRB7wNUqfQilLYgFuaC8J6
         ad09Vl1U3cd4iebiBDkc3UGlr9wsOTF9+7pPh5YJLMniD8j3ek/OtuEpI1nzPix8IhQM
         uHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743694831; x=1744299631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pTVLra0u+1FpM17aNh7S4PmJQcdVxjLqXOG1m/fwvo=;
        b=AVaQPUTbdlby0ZO0gOdrLDjMBpIqvKzEaG2BvBofyw3hKAg8V4qF3lPSzvufuSEapo
         8OWV9h/BDe15ZbrTldan4+rkHq/ayWwIqZ839naW9eY/WGIb4E8X6HOMKOfZfWCjhL+P
         T2QH0ehdBi3Pk6LyXQD4nUuDeS8SwxVJGjalth5cC4mOUbSlUrbX+QCoq2Io/Yq/UO21
         7GQswThUDuuZxQL+fbCdrouSp4fdj0E/oTvDARoULOu6exbF8zIU5f+bvlg5Hpn4i2VJ
         8Wxq5bIl97D6CPCg2ZmfWURvTajdtMu4sQlHdJd7CZ1iUXuiibJPWRYXuoPM0fhq7MZW
         O7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXSRqruLCgCWELFFU/jvKWDMlo6fofTmQMq0O70D6k+6VQ/bkrBxdxqFma5qBj3sGpQ/1hl@lists.linux.dev
X-Gm-Message-State: AOJu0YxhLqhcMRJaJDesCTSkMpoby2tyiz3cz7wjZsigrq01t4dYDvOR
	+Vx28bVgw9MsLpwiMSkj60C8wY8eSTio3B62slVL9qSbDfmt7zqhxR5zPof0hTLlMYS0WX4s4aX
	HCyJ++T7tdNBlzuiLktXW9MLJxoQjaraPAIWQ
X-Gm-Gg: ASbGncuasxWZoq99fuSpfp/9fCkXP56RNnoKf2usSEKdhRWSPcpox52QSeOckN5DxSS
	t2AQN2lKu71QzWeyolm7ro4XdCVzrFBeE9/n3eaWdwbHP554UXJStyH38/uXEBs/jbzAbPwWKF7
	tY/nf6QcgIXwXv+DxpOpYlk6SzEA==
X-Google-Smtp-Source: AGHT+IE5YGq8DRNeSsm9U1iNJDEvoCJMUq0s3fKOzK6HVx45MwQM6mHF9XCGCBw2DL/ytY3QnYWSaOU0LU4h9G7Y1qw=
X-Received: by 2002:a05:6902:1a49:b0:e65:450f:47b4 with SMTP id
 3f1490d57ef6-e6e1c2c0d02mr83229276.21.1743694831610; Thu, 03 Apr 2025
 08:40:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321164537.16719-1-bboscaccy@linux.microsoft.com> <20250321164537.16719-2-bboscaccy@linux.microsoft.com>
In-Reply-To: <20250321164537.16719-2-bboscaccy@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 3 Apr 2025 11:40:20 -0400
X-Gm-Features: ATxdqUFIj4dyrFJX231ICUhqYjHRv0Gra_aYTiiiEKPjs4MluovUd6s356bhD14
Message-ID: <CAHC9VhR6J+G7MqBSBQemwQsYXdatEhhKCDJ2o13fpXpMgfY66g@mail.gmail.com>
Subject: Re: [RFC PATCH security-next 1/4] security: Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, nkapron@google.com, 
	teknoraver@meta.com, roberto.sassu@huawei.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 12:46=E2=80=AFPM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
>
> This adds the Hornet Linux Security Module which provides signature
> verification of eBPF programs.
>
> Hornet uses a similar signature verification scheme similar to that of
> kernel modules. A pkcs#7 signature is appended to the end of an
> executable file. During an invocation of bpf_prog_load, the signature
> is fetched from the current task's executable file. That signature is
> used to verify the integrity of the bpf instructions and maps which
> where passed into the kernel. Additionally, Hornet implicitly trusts any
> programs which where loaded from inside kernel rather than userspace,
> which allows BPF_PRELOAD programs along with outputs for BPF_SYSCALL
> programs to run.
>
> Hornet allows users to continue to maintain an invariant that all code
> running inside of the kernel has been signed and works well with
> light-skeleton based loaders, or any statically generated program that
> doesn't require userspace instruction rewriting.
>
> Signed-off-by: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
> ---
>  Documentation/admin-guide/LSM/Hornet.rst |  51 +++++
>  crypto/asymmetric_keys/pkcs7_verify.c    |  10 +
>  include/linux/kernel_read_file.h         |   1 +
>  include/linux/verification.h             |   1 +
>  include/uapi/linux/lsm.h                 |   1 +
>  security/Kconfig                         |   3 +-
>  security/Makefile                        |   1 +
>  security/hornet/Kconfig                  |  11 ++
>  security/hornet/Makefile                 |   4 +
>  security/hornet/hornet_lsm.c             | 239 +++++++++++++++++++++++
>  10 files changed, 321 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/admin-guide/LSM/Hornet.rst
>  create mode 100644 security/hornet/Kconfig
>  create mode 100644 security/hornet/Makefile
>  create mode 100644 security/hornet/hornet_lsm.c

A reminder that you'll need to take responsibility for maintaining
Hornet and provide a corresponding entry in the MAINTAINERS file too.
I'm not nice enough to maintain Hornet for you ;)  If you have any
questions about any of the fields, let me know.

I believe you've seen this already, but as a general FYI we do have
some guidelines for new LSMs:

https://web.git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git/tree/RE=
ADME.md

--=20
paul-moore.com

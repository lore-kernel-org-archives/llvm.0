Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2883A5435
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 06:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036371; cv=none; b=tYPqhFij+T7O5q+JY/JLnBvjZzMjXp+QjCKHsG94+CyPbtm1vnweRv2D+RLL+K9YTkX/Ho7Q+F13EuP+pua3bteY8drqZD/p0m0P3wqBfsEtmF16UBykp9Weol99YtUmfw1MuXBRz6rqDkmNGs4MdeJL2MfvE1irQc1gPzsXKbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036371; c=relaxed/simple;
	bh=1Ac+5uIaszjTdXeXl70hvJYRphte1CL/Kiuce7KK8/k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r8q9YhUpHIpDnsgq504uORlDQrhfWfRRsYTcolc5qXBH3ovzeawwcHE/vE0ZTTLqHYAPUAcuGjQknmJNH48Jf+HoOmde7E9V8Q4PzTA5rizNxHaCHyjlErbozv7tyOM/K2RoqnOqLSwuMXH1Tij1Yo+KzyieOVRYUgN1anIm7tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LuqPfmM/; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LuqPfmM/"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-68bd951b4bfso618999a12.2
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 23:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780036369; x=1780641169; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ac+5uIaszjTdXeXl70hvJYRphte1CL/Kiuce7KK8/k=;
        b=LuqPfmM/j3/N2H6zw7yZCIq1GEdpPd+WYVsjKzZunOYScHFq0QgW3sUBUKgMwgWdXT
         hx2FvvW7VB66iefkbubEE87uGlmEYloTOKyFeB6SODyr9Xfc3zAzzJG2zoGGGLdooOeA
         XmhpxokP2FBm0NqjD5zF4mWMBsp6dPRt5cwphu3Vkd2N5l7L5JI409QpotCgCJuCVvi+
         pRvl92qyfAhNLDUbeB67LcIG83oqJAioVO+4B1YceIDE7xW/+kAJXGWt8lxZjiIi6xQa
         kWWoffFbxBGgu8Ti2pT0lsp26xc5kfJQbzI7n1hrGLwsoGcBoUP+oyXRKLuESnb+j82e
         N+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780036369; x=1780641169;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Ac+5uIaszjTdXeXl70hvJYRphte1CL/Kiuce7KK8/k=;
        b=ULvGDIi7cgUzhgLWZFu9/meIHRLNyImaA+Hnz+dtIs2iv9C4Hcqwnu+k5kBP06+5Q/
         gQzAyE9v7wJVe+COKnXOr70MTyCxzecymrHhmscgteW4M8iIOUrZZT+CKurhUngqQ+2E
         ln2SLY5chKBNC+A6ZMoz8wxv8e3sg9zAjHnMfxgSXeh9a00xiWuvybQvst9TtL7GOHWn
         VFXIIIVxoNnJYt1wihhRx9D8MR46s91aWGSCTPPzwiCoDprXo6WZj0JVPFUUOULcgBdq
         smFuUrfcJuH/bsIoZNTso6ibirOBUQ/Imhv8FgAhMyJgTfUcwXIz2PgPjLr7fIzjdode
         0xwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gYjuk4ZKY9oa74/2Ai7dmRa6JUxA824SFgLpE2H3VheNrHEK+CPblYkMqTV64CyeZKO5E@lists.linux.dev
X-Gm-Message-State: AOJu0YwdNFbYEb2OL40v3NG3zHuRsztiUNLt1/VhAZApXbwIC0CO7fTZ
	FGpma7fFRZAuypmOYqNyDGSURG+wbG21liMLeSOocQLTZw+Rn1wTEzwwnLyCbhNPNsg6KRkDeg0
	XkMToEEkcX8kGEo+ONw==
X-Received: from edbev9.prod.google.com ([2002:a05:6402:5409:b0:68a:ac9f:e69e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5113:b0:689:bbd0:45b0 with SMTP id 4fb4d7f45d1cf-68c10681fd1mr663109a12.9.1780036368563;
 Thu, 28 May 2026 23:32:48 -0700 (PDT)
Date: Fri, 29 May 2026 06:32:47 +0000
In-Reply-To: <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com> <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
Message-ID: <ahkzD01e14wOTNBk@google.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org, Bo Ye <bo.ye@mediatek.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 07:26:07AM +0200, Miguel Ojeda wrote:
> On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Once the fix lands in rustc, this flag can be made conditional on the
> > rustc version. Note that passing the flag on a rustc with the fix
> > present has no effect.
>=20
> Already landed now, so if the uwtable one is enough, we could already
> do that since it will be 1.98. But since it has no effect, we can keep
> the fix as-is and do that on top too.

Hrm, is there a way to perform the version check in the Makefile, or do
I need a Kconfig for whether the fix is needed?

Alice

Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792492027;
	b=I3DYxf5IzK1OD7gJ+ZETBqjbHykAvcL49kaA4XuTNX2bcZZljWYWWloxmAcD5D+gzsV5
	 9wrc0qY+FS0FTkPYRKUZ6XrTGb7WE58n0ozNTq54yzIVKqNQb8tr+Z+9CNllt+8y3Nj3E
	 q4qIJNjA/KQgu+FoFRIAXHW2JsVHS4SqvVNXvtbwMDY1byJSb64dZKjUvaphDIfgWl7nD
	 P6RWL6TVbhiXU05E1P2IVndWhxTcni3vAJL+K2OXDf/Yz4AU01/HFfatEWfwWj+YUNd2R
	 mTJgbhTZgjFwY0vKloYMAYATvwdii3eNO47kodartQT7VQC/k8Xi5Y13IGVDElnKGlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
	b=0ZfLMV5Ml1olmUYhkTqlLWJPFfiCC8y2zd9Gdu5i1dclq8z14rqzBeBLoQc1Jm2nBm7g
	 xbCUOcBGsQLzKPKzpIvyIEWVEnltPmRIdkkCDp6Htawro2IepwyQ6hLVm0PYjXavyP5jr
	 00JSt3cOjktbr1HC+k14t0w4pXULn06EPPTOWpJjFxvG5XauLO5hI74lA1Hx/JTofqZhY
	 UQaTOCX+MMtCbFF3lMy8PSzAHX7NW15BnxaF61ggQein/gKntWviVzUnaVjuNm15ArJcF
	 WihTRIb8qzfxls2bkeMPU7bGMR2xcVUZ7GC6PSt8Nh9MB32DgjnP2k6HoWrfabpjYog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kIYgw+kR;
	arc=fail smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9F1606A31F
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 10:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B9F1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kIYgw+kR
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35159e0092aso361836eec.2
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 03:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492026; cv=none;
        d=google.com; s=arc-20260327;
        b=h5SjOg5/H7p9lk3WZd5AfSX0Sg3Qlgchnd29CDzzFoSckmSZWnijEZk1AkZDN1Fvur
         JkMDTFE8uRfvwzUtA+3QHVVnmTaQ6sr+v8LAbqjAdH6Ho0qjOBE69aYZbFHxOPjSHBtd
         d/5fJAU6TiRMk+4WLnMjn9kQgsSiOtG3S/odZZ5NIarYeYJgLs5tvM/P2V3iJiMxJzPj
         ZvKuEoSIjOifZob9IMPxv56K8/ZgJ4kjZzNdLsjry7l15zKpahGa1cCjh5by46BjNt+J
         CGKSHYOocmzGvYLhGW0nEDQk8w4JljxOGD3qhh/TZH2vLxYMcIUC8nhqJW6zsjWmXUTy
         Hgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        fh=ogNZ0e5aztM7Ppz4H2ohUx8ymXRB0ngxsd7+vrOoFvY=;
        b=H/78GV//6eZ3y3jozqzBScyYxd10iuvIRtRK4CcN95zOHI6tFlVjIQEdxArTfMOIQR
         0yzJNrRQRZEqVFQrUSFs/VB0OB+Rkfd0Vk4H0VSVzjGt10xpI2EFUyQfpCK5K9AU0e+t
         5wokLLvwcEfXuso3d+YjMP7RZhEa39OfzbTyRCZJmlx1mi+eeScFrbUfx6aX9S4S0QTl
         I69t5wM/Xj33cFkKyandwRMw56P5iR76rd3YBdLFhl1hTQuzEjcYYdW/JVDq4PKvPPZ1
         44r3a+t1iuc7vHl6Vme09sJMgFNwT6gJ+PNAM1VLxX3hNtBREYgjfRFiy/2GXRUixch/
         u+/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792492026; x=1793096826; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=kIYgw+kRaixEoQ1d7NvXEDS0XBOLdswgswsIj6CP4UMWH1GKKSg3KiZFwh1Ah/Ols1
         6cher0soeq97aAOvQH+ARZA2E31jJ2shbux65jja3dvP84jhWEgYEglPax0b90eiTPtS
         c/sfKIv1RLiGCcqG8e3NUzvR3LhBOBwEN+Sq0C5qeXOIYbOWMbkzL4DyCAX1Ed689dPz
         njezwOl0Wdy7begoB+rTbWWE3b7Oa38hGwcI/0PrcFBA63KJI1YZfZwQgLYCNrQsysBz
         jobzpyCZroo2gerW5Ph4OZEVziU0FU4l7f+pZxWi48Bno4GFu1pITZuGNI5u3LFaNYlx
         GvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492026; x=1793096826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=lLsQRhkjRgDQpKT4S3Bl7LuqjIGbb+CafbLzI3k2megWiy/aUrszjvxSY38rSOqAiN
         fYW+Tg9kb6X5QciO17vyF3jilK0YmRcvcxKPyMNOQG8zHFt3aN0m5N28d9VRKIgK7hMn
         Sa1+NkV9OPYx2tkHkRS/lCp3z9Kvot1C2W5fPjmuezqY3boeBYzFBd3xf+VRxfY8EgGr
         4mhL7RubPwhlbl4EGi4Nka/RoKNEkb1z0VkoDy6kBZ3ugX3JzHFDeudt/GWWFOe+1hvX
         a+4VijRXA0yS+XD2j5t8GLiEnz/FGp1HU1NKo1EO5NA/2pWkad1rrTgbPAWOsp7V6P6K
         oCPg==
X-Forwarded-Encrypted: i=1; AKwUvBzr00aS8Rf1MPk4DbUy3ffwDjTUqphljijfGd1rkSKONtkXfWqTI21IRxIFbbPy+kCk0UDx@lists.linux.dev
X-Gm-Message-State: AFq9FYKdbKmAPzwq4LvfqDj2/wEpfrjuAuMIFiCKeub9EQQnSGJAvMhv
	wpisJdKWOhEs+yNHeCuUHTBf3w9yBA/A0osZddLkfD9GQqcdLPuj/7NVfxTtuVVy9YUwwyGp5NE
	eu3ZeOHPxO+WHtupFrUTfOEf3uiflwFg=
X-Gm-Gg: AYBFou3Y9Go2wwpqDvOfyHvgX+Fc8c0gYb27yc7KWmAqjpwkitO8Ay2Tqj62/3B6mhs
	7Em0fy6oERPkVZNnFUvAhaJ+EArTBmnAXQkq7OmqDIZsSBvpRDvF8Y4uW0jNXEkX2RKKGdxsS94
	7o/Bz90p5E9ndJZVYC++HiAoBk66XGMipbpOSXE+hA7vTKXJSDcdgf/lqkkg3lJ3SF8+fOCfSj6
	nn6CwlxsiCrVWReRHo2jzpMX6U36E/7dapqsoEJHA21bfRfgPWNT5aA9EwuOo+zFRKwdDPhgdHC
	U8pYbf61pMrs1y0wj/R/5wfAeZMaAPe58TL/z3T+emfQc4OKefkI3gxU00T/Wnvny4wC4Afq5dd
	MONddMprLqE15Tl/b7syJ+Mz94btSEBg8zV2d5Zo5kQPbwpl8jd0YGBdkpVfrQkOHvh9ONbdQH7
	ukn5zBDrbFqNGbGqS9MKdd38ui8GH1LG4DvVDdjDd+Zi6uAe8Upec=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id
 5a478bee46e88-361a136a601mr21744064eec.2.1792492026480; Tue, 20 Oct 2026
 03:27:06 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
In-Reply-To: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 12:26:52 +0200
X-Gm-Features: AclHuK-QCNlJqtXqMEy-POlR7cKE_rSWRMxYBpanQuZ3UPD3z8WuYE16A81SYDk
Message-ID: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Which tree should this go through? The Rust tree? Probably too late
> for this cycle.

I think you send KCSAN PRs, so I thought you would use that, thus the
Acked-bys (I suspect others thought the same). But the Rust or Kbuild
trees are also a possibility, yeah.

In any case, at least for Kbuild and Rust, the PRs were already sent
(and, generally speaking, I would have expected a patch like this to
be in the list for longer anyway).

Thanks!

Cheers,
Miguel

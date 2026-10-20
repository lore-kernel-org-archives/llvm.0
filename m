Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792516189;
	b=SZ/KM5vsCNPwYEczDv0j91Zmnx4PgAiWARDqox2wBxioRR4vpSxsNL+dTfCocK8Ar2Vp
	 N1RAKzvginSAZUkSz1FidwtcxHDTT2Vp+pUKlrVaYL1e4ZMYN5HE01b6lpiTaLclg9clz
	 rT7AcEfxtt+iuqWnbXG6KmsUfxwYQbGXpy2PxrY9LUI0m0B21axt8lJ/tKVMQ9vOtaMQJ
	 EF1T71JSgtikzU6nMSxxp1wM2eid6GYdHFD9U1ApqnHzHNDo/TVd/RknTCWAG3lFmowzf
	 5HU9dBourAfi0O8VDJ6dGiLFzD912hOXePVAwU+jztRmYzgYlf9PJ6gHXJ5FNapRSTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
	b=yZb1whm1p5jKFHrPDBVUYW3pxXgAKqOxwGf2nMSnTQ82qYvqWl08L40hNE9gSFCZPg5f
	 BaqPiark/dpVzcWTiiCODJGOTlpJbXNPp7v20G1GJHfO7yLMKrwSylH0mzzpYtnQ+UurP
	 qhSwqCkrJ+klVNsgAIpmRKeEBz/hC1r5lfhtIXrnO23goQaPSEJi69RYNUZxyFUXW/7ch
	 wf9dPcBTSliUDLbG9HFkf0EalhkgguiW2uK5f2XSPA9tNc68ZTY9hR17/oqdRSQ32LPVt
	 zEVCMVsPo730wXqdR+xIbEsBwD0ZkMvKp20Uz72EsR3PK39vCixXvivhbtP1/FzuWdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z98e8dJ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C84606A320
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 17:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C84606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z98e8dJ3
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bb5afa736so418327eec.1
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 10:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792516183; cv=none;
        d=google.com; s=arc-20260327;
        b=sh4eBi5E4yG0t4o7fAKvOr6hf5KGVY4+SyzlbTiq/4W9PB97SBBIaRKtyWPFmaklIG
         tDC8r5fze+2Owe4sJZ8eNpKgQQjytzgZXF5nhb8dyB3VGgB27n2+p0wBFF55nodb2zkx
         9nvJ9mMIqDCXXIj9rl2yvI1kXiIjOeiY/SJBr+XyYFVWWkRsrXkzKcXJQ3gomSx7d9XG
         oCg87lE+QyIpJ8sXPK32C7bFOD2DOC9R0bEcV13asE/VvDZhgeXGXOnYUMYoCm9jT1gQ
         IoVB5OajjSw5OBwOSlSLRykjZ72XRlXGIRO9AigNNbX/+j2Xx42b1VCg98J5m7WHMZLh
         SNIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        fh=3HoxMC8PsNB7AJIRT09rqFQEL3ARYhmmw2dnew6QQ10=;
        b=DbBnaauNeWYUjR8UeSdf8Y/4xr7FLabhI8FhIKixjbkzjqMOGH4G9s6y104e0Nxq64
         oFzRUjrAt1f4Kt+vbfpHgjqXIzbkKGYFsYRnXBgk+HHPlEE9IMxBuqXxMhMliIe1tkFb
         xA9xBTPWoWHH60KZaQTykq2AaCzrzIA/Nv88kxoeiIVjXLSoL9NrPtUunZ2cl88mxHY3
         fudVRR0YkotiRPm97ZTp/OwbCefymQjkm3Xe9fq0+ZD7RS2cHPQv1JNaSbdeFK3xaEwq
         If+lLXUmftcl6o/5ytRNscpVtMULWFdfQyxPn5S5/BUkPBGwxc+dXJh4bglTvNxEnd3y
         wvsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792516183; x=1793120983; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=Z98e8dJ325S6JCmV3UfvqU5fNO8N6qDf2doNfLx6cTsEh59+tAOH5YFl80vny4sSfi
         A9ofbHUhifzVFsjy0UjtXKTAjH9fYIGem7gXLKp2xtdymsYxuwQ31REEKQcRMW1dOAFL
         BqVFQGnCIaFyiUd07vqsbZ7wje2nnkLLxRZY7Hk8sWm4LFfQ7qx0OIVGmI03mCF7c66B
         nWV+kcrrkebkcKc6LQRt8iG/UW9aP2ltOwhR1E2iHM/2RRL/kFs/lQZ9FF4IdOg8LZMr
         ddgtE8rypnMlbBtUrowRI2/mSm9xa6dW31OM92U0Y0LI1L1l9tXAM+9lVEFFUMkAgude
         /WuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516183; x=1793120983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=trOx0CG/DdBUtFdFQ5eDx8X5xYWSnlXiM2CBP+AVPThy1OIisfUwXSnKmIEagRs8sl
         GCOXSbeutYSqwE4vPeLas+DH9bzwQjoLi73q2FUtt9TBZ34P5SPG/40p50ymMIIuTQY3
         z/ByF3mG2Yd31GYL29JxGd1S01h8qrc1Hm47DnH6VIArOXun7Vn4/hRzeG2T5s+RUm1L
         MdSZcGY8djPSaXst+mCjKuD4vxcJ5YJW8+t3LT7xPcXISF8EqClXCYULB/VmSP64hsQY
         W2lyyYqOEokZMcXX+pHXNMAJNYVEgOOw3DabHq/q1ZdWY3VJZH1E7kBGiXEDneqRkl/U
         vDWg==
X-Forwarded-Encrypted: i=1; AKwUvBwjY4mcGvc3n7wEXvh5M8LGm89Ke+k0SvRParaCzRbAd/vjPYC3OyV9z9nmUbXlXTWwW88W@lists.linux.dev
X-Gm-Message-State: AFq9FYKwDy4nOJh2zPt2lGr7SEGVVgSVQg5WWqyW3H/SxrBfbBCgHwLG
	4p/sBfiCml9MfUQVwGz8Klh0ODrbzCj8DOxv/qf2L3371K2BOE3+sbX5GDoIAgObXaOrm7xqJwk
	aZZb91YVUdyh+yaBqueKbd8Goxy9Gm4M=
X-Gm-Gg: AYBFou1Boz308PgK8dYNhX2guSOfHnb31ica180SHuH6opWkIN6nDOj2u710k0uJnVf
	jvrZ3JPLFvjk64OqsYYQFkCtlO4CS2n+SdFeWynkXBX6kHpSQPX31CJB0zS2TrKrvfH+oEQdseW
	apdJfR7Lx9agiYwkVjJD58XlKgpYpmb3G3OrcqRg+deHbWOGcdzKK2DLDfVWPqmlooobgxXR1LY
	KGga7sVhCCSjvRyORukdQJiKGGEmMfrkbHE+L8zJa0c9JomTIIIEHcs7IYgZU9XllExz8ohgmRN
	d1js821duDjB8pC7wkRX8AFWe2vQ4j9OAdALJoe2+F6mqzRj3Ykut8N+AePGf106pAJHaLJpDbc
	k4zZoEY/Hv0J9pEagYKT2FNsLr9dwUllz/htEADONT4FktsvFBhxpu9tP0zanuLs9naAV8QMsMX
	E/cJkOxjEzMWZWZfJ30rmf5qd9frBYA5cI4kJ4yLaIV++AwrWfyTw=
X-Received: by 2002:a05:7301:da84:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3619b212ef3mr24985185eec.0.1792516182799; Tue, 20 Oct 2026
 10:09:42 -0700 (PDT)
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
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com> <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
In-Reply-To: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 19:09:28 +0200
X-Gm-Features: AclHuK9D4Eg255wKZ2sPBwolmAnynFBIgoIfmMAgFcQGyxFl5TrsNoPPIa_966w
Message-ID: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
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

On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Happy to take it - but in the interest of avoiding conflicts, thought
> it might be better suited for the Rust (or Kbuild trees).

Same -- happy to take it too next cycle, whatever you prefer.

> Needs some -next time, too.
>
> If I don't hear otherwise, I'll pick it up later this week / next week.

Do you mean for this cycle? Linus may not like that, but up to you of cours=
e.

Cheers,
Miguel

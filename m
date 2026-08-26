Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C9F471429
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 16:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763354; cv=pass; b=eqkCK0AuhW6zAUSWoT1mx1owKtE8CMS2ZvuYcz3jGq1/f8SVirsVTeTaAiLWiV0uQdIdVYoQLygIaEeNtXiMcVv0bx4FiwfQw7f7iLDvP2tGInnnXPDcoLqHj4hTVjv7Kl2A7CyYcYcEryAixhQ995n4Se8EJ87LmC1UB/D4uN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763354; c=relaxed/simple;
	bh=GW17/ZxJ8MNDoRZbROrkv3KzmlyE+9Ay32tkfuqbqJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxBKRxhIocOqHC9YTd5XP6WD8igam2/U6Fop0J6k6B+cuJ8MsEHgL5VDhHpf/hcProQFEM4+/gPA9icOLf/szw/fMDWc2oAENq5UPGg3LLL8hXDk8re1UjIcZj/EPZxA0juhs237vu4OL23Ebx2ptcMXKoVS6CCyuTp6D8Ik8xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhVI8td3; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhVI8td3"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf49dc28ccso1193215ad.0
        for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 09:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787763335; cv=none;
        d=google.com; s=arc-20260327;
        b=HhBBOelqcA/w5PCGVz7rl6fsyT6wHNd/t53nA7kP05fsT+wj0ZiHypD+YHb4WH90MV
         68OnX9clZpyEKZhXWld8BCkpD7h5kuNoX39PDYnre7o9NnoOnuMP1lMBhfrbosBRQd46
         1UgJgLWP1NRMeDeSTtf+FFzuY7L32Rdml5zfoG9PsDfxl2BuXQzs83ppwFW3L9k1go5s
         Q+RGMYT+3DWoktrnXreZDafiKlWf/tEIEJ97cOhd/eIGMDo1Uaiqm4PBKvaI/21hnnVI
         Kxio3TJcUkhBl/KBfO9jp6MGJ8bPXdW34XbKrj3x1WZtHSuEKMyS0YeaafL+4J4bLtAB
         G0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nSbpEAS6WMmICAlTJ0UBJ7KBdfQ/8TLnB7NiZ5/ZiLE=;
        fh=ihsVw0VvtDdCo7hHTxy5MQuC38P6j1WZq+ZsUNo0IBI=;
        b=BEy1PV0qc4moPyBKR9j+W8WM+hGNHZHsDFjcFH7jD192V3g7xPme3mndaQYqAOyz0A
         w40s6xVuzUqZ4Mg2rdZm+HIBuexQC/fomfYYuuPF7zwvQm5znxWQy6FEBEzshhlmBVr2
         E9TBS6FLSevwrCGmUsA+Jg9ga8KdexZzdIh7lvTVnthTUYdVLyTkXMw9zMZC1hETrV3Q
         orLm9WmHZ692NXd/06v5+DozalscMsNBxPpC/v+EuPo9FNSKhd3k80NkK6uNhZ3qhlzN
         EXoQngfO5bSW8ay6wlN8sZUTRrdehHL9A80bdyIMlI/kU5crRVlM6SXDrisER5yettcw
         SvfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787763335; x=1788368135; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nSbpEAS6WMmICAlTJ0UBJ7KBdfQ/8TLnB7NiZ5/ZiLE=;
        b=lhVI8td3Qy961uKnYICEwFMakU4/VstSIWMRAaZueRrJn2CM1jRhTFR9uh/Wwb2WSS
         HNzd92BVCKvfXRdiwWF2YIP0HCbIWqIQ/4NHHp/H/iM5zg/JjHidRqY69jn5lLGxsMOp
         M3dOeq9LKz/J0e+i97k+Boel3J1Aw4ne66ASq0aH/onRuL+X/9rnojB+avmqH9ob/TKq
         5Rvq+22Eqjxtm41v787+3/ONL86je5idfJ5VN0ZabzAfjWjiqSUgZ3KQbilC4wPiXJBE
         zX+re12NtxTuMU7nuTG1Zli2PjmPW6VvEUBI9shDbc08vTzk1ZKRS8VpZiFTYYRjzKtY
         BRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763335; x=1788368135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSbpEAS6WMmICAlTJ0UBJ7KBdfQ/8TLnB7NiZ5/ZiLE=;
        b=eBn3qOYQgZOTaIY0kIZPThX+XumWCZQntf/7QTAKtXV7CXAU0w5FJo3HXqdL5R4nT8
         pmfpCHs5dc8/vAKurSMFdsvpppH7/hayz3dClgGxZfF2C2SGbTPSwJFhz4FRCk5bgK8+
         2DHYAbzzmNaYuQWjhh9xzzEbcT0puy5ixgbnnm5S5nFlbCUVsMAjLxrrtPOF6URWKULx
         dGEGkthkCv3Naf+0xV1ulxHHEckPPIXvt5hGLD7Ym0DwDAIBtVU1BbM86upDI4qIkkxn
         45b4Yigz5RdprKKETZfklJJSqANddfguB0AZ3O+k734d0n7hUYxXCNZ2rMAcy/q/8+Q/
         gUGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUGgyhh4Sm537rUmePEGstmZOv7zzQAFYeKYchyNylnBpK4Y40kMyXeej0BUhBEZRFXdE2@lists.linux.dev
X-Gm-Message-State: AFuF++mMzzsqzIkPzAzSjEC6ZZEuapzrIge1Fezpqh/AbUcwDct868T4
	UdgO08YIhGrrNw9slWQ3Lv0psXEJwV9VNzM3Y/CnXcHdoFwHqVs2Hp5HreyDtwXtoWnhhrcZfLp
	3xBsrh5ey7bfp89VV1rPJJDLG9AWnbR0=
X-Gm-Gg: AR+sD10eEecZHHxK/WxRN88TaWsW/se8onbp6H2r3xP0yRhxZFInyaWb/1BZTV7y5RR
	1Z7J1SBMOnMWLFpAH4IHaNsMCENBfooJs/wMIhxGJCcxZfqlMUdD8faEOVw6CelpJksLD6bERXN
	qf92xIeEpcukUkaglX4zgG1yNKGQ9WmOT68dMJMLZUcE4V3eTqYkJl6BXiiRawjk5yxhf9X5vqt
	fxLCMy51Jte9Sg2JROZ8t79edyja5WwlE9zBnpnbbbL/PxVkBNPJNckk0Te5lvBs2BhQ6p+2BLK
	oUoWDlSkUAzRN7Se19bvbvgm3clgtIHppKw1Cn6Ie2WOnfuvlQxOk2/o6Sk+hlOrm444uQnN8Yl
	yIR3NbgtimqqfkPsq4ndqv6vuA5q2g0mPo761FbYBm8gdMzO8dq7gwvd5XVhq
X-Received: by 2002:a17:903:b84:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d71e0d8599mr16720625ad.0.1787763311835; Wed, 26 Aug 2026
 09:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260826162851.2497-1-mike@fireburn.co.uk>
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 18:54:58 +0200
X-Gm-Features: AcwNN1W1vbX_egm06LItcK7I-iqCsSdSy4wPi_4vCfmdRA4BWPr9Wuaq3tVEUxg
Message-ID: <CANiq72mQRrWmHG=6h0U2n4BMGZ6hi=8+Nohg0eN739n7NevEKg@mail.gmail.com>
Subject: Re: [PATCH 0/9] rust: core abstractions for a USB display driver
To: Mike Lothian <mike@fireburn.co.uk>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 6:29=E2=80=AFPM Mike Lothian <mike@fireburn.co.uk> =
wrote:
>
> Core Rust abstractions a USB display driver needs. They are separated fro=
m the
> driver because none of them are display specific: each one covers a kerne=
l
> facility that has C callers today and no Rust binding

> The rest of the posting, which is one series per subsystem:
>
>   rust-core, 9 patches, this one

Just in case it helps: these patches touch different subsystems, not
only one -- some of them may want that you split things up
accordingly.

I hope that clarifies.

Cheers,
Miguel

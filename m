Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BCD3FBECF
	for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633559; cv=pass; b=f21c9kqk9ahkYYN3OgwsuLvoys7/sboulsMmxJIUdxxHiBEl2Tnj2z2fQ4W/2uCTCycoKT+1ji/ZlkN+bmAYENacGI7IduMgYVTVfL4w9STMiDAZwsuqYQTinPcM6y+NnxBuseU6an4i3YUjY5G7YXCT0rgrQLEP9aF1keZmOXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633559; c=relaxed/simple;
	bh=m6hW95/C3ET1V9mEwYcyKNAogg+hpF0krbdZ9S9hmMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xf7Ejsu5U2iBXMkgSTx6gXwY9Xm946wppC4iyEOn0bpviNx8ZxED6tdB0PKXH1ZyYDzA5op6iRexMJFIdOUDuADhmPd2Zvx1qzhZjulYPO91quyi5FjxF/GkIpyeNdeY1Z4j7+tnKcvK2MlU5FfSNww1brmTuIU02fBwR1sJVbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMtjQCk0; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMtjQCk0"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-128eb45835cso135878c88.1
        for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 10:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774633558; cv=none;
        d=google.com; s=arc-20240605;
        b=HYD5LZ8JHShH4A+BKDtJ6nzjSB6xaPlFNckrJQTZyl6Zun4JTDuCW20NgrlkXTzQ+d
         JeKG3L7IguUxMwD0z8vQpjT6DGRW5lQvNaa8lDLPsvIrJWQNRFMnBW9teI52D2Q/0BIx
         fuH17Ztnog3+YJvYGnMIUEQM7RsFexNnRRnl/O8ixX2Qhw89WUQlBxwfvMWppvtWQYXi
         NlWgjIJ3Xzst468R/Tgk4O/958g6KWQ03/e+OdxuOaDEG5cfyqcdrNHGlGx6n7ZcGpjk
         TUl5A8EPaU3aqzM/M6mlMJyNCrI9uNTCWgtJIGn6YmEL/HNCbyeS1bf4X39fAQxJ1MhQ
         iTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m6hW95/C3ET1V9mEwYcyKNAogg+hpF0krbdZ9S9hmMw=;
        fh=L3Me/NqZaTqDZtHpO2rIo5R62pKq4cfKnKTcv4XeJfE=;
        b=O8Fhpi+STIW7pkSMxd0hR/2JBqLpb8hHfAnaFrKyJGvrIlJQZSClCQys2napVi92MF
         6caTxgAqzSjlUlWDBnnwlqg258JJOJnRnbXaGCK8FmzqKYHH1FZMVDA2pawxsxLSicsj
         +a48zOrRYSQjkE6J1pr3rjRDZgcxOON3CO/cDpwVlLQRAELCbU+nb+AUyTiattWw/2LM
         ZeWSIGLibTXD0xOwyFFfcn1PGcS1duGFMaksG3uGSZaHGu/OcZZdDgn4IsDSxA0/dAr4
         ZoDG/qhjqN2mmooD4FCNWpw4eg5Xnc6wybwvx/J9XThG77MS3DcRKPrb86fUsw9HGnkA
         tALw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633558; x=1775238358; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6hW95/C3ET1V9mEwYcyKNAogg+hpF0krbdZ9S9hmMw=;
        b=iMtjQCk0Zdr7BOx0vWetz9EdKOGFh0uEazEqXheoSL10rhk8pc9LsP+w5i1r96XlxC
         py0hgH6etkAEaLUu8XbE2dENDaRrP5jjV0sSaeL3gUQnYfHzAHiSqQdTRZf8+kl9ONe1
         lVk8Zj9zBaVJOFzaVJh/DFML0hOva02HGJixjGSFMWY52OvbhHy3hk+8S8eHpMFAS6jQ
         LvrU2vXBY3daSfg8nVHC65kpMYDhTiKanfyPRgs26PHT/FNMKDlaVPOLyeaIyp7XQfR8
         zPImzVs6eiMoMEDWuzHay/Y4UdhnJ+zQhbelazVnoGiIP8hxGlV/0zyH3siYlfRuDywx
         2cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633558; x=1775238358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m6hW95/C3ET1V9mEwYcyKNAogg+hpF0krbdZ9S9hmMw=;
        b=fgl/sWCBdHVbY1xOeomdeUS63AP9PRnIKHJ5FaTLV4ObiIg6p7yWlAa8Zlk5F8FAW/
         +61saFpD/mXlSV+x8nfolIdHqvfGRfsd42e6YGCKfySr7G7RGRV5rG5EOhrfoRustqWa
         uYNEUpluDZyMUZmiqglMCdupk7pqo6vREbZXnbsZt8ZSqhsy1HjYRK8MYG+75oiSlfcj
         EwlnQyxQdggvUJaxA3/lrw1p/xx7e4y/XzQDfbaKCQo/2kAlhlJ+Iy8RklcTOnpv3Cl7
         Tm8BkczseApS4aA2A3XuzXhh0vIzfjnrFyBmDwphRCX/jk5uhpkFcPLQCq/jeuKjwaRH
         TbsA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Bt441kDWg57ZpoGS20j+qa9FlNDkm5QxN8qqbokdmZXYb1xO43ZoOsCycOnxxtKeQ4XJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxtYR9m/yxfKDtUrAOw57qY86w3egPoJZuL+fMr5O8XQ17AjVZv
	xWm4+YjP20dircFvJzCINqqMuPJAJhb7FCCV/RwOnzUcTVvkrEOpJbvkEMfVPczZQlcVCDFDEyJ
	qTu4d6FkhTH7gkOGfY7GtXFJPOZi6Q6s=
X-Gm-Gg: ATEYQzxz7VihHgpino3PmBn9TwoEOQhvJHRK3xqXya16poOKCQQwUc8uhgO3JR4nB3T
	N/1L3dpOcPf2RkteH7Aio2usoFVmAUkmX2WVyEauzgkjmfdZLzb8MgO+fXMGsKJKnZwljvyoU3E
	Mg5YwMQ9HWI8/Zl9XtMTquNv3dJfT1/wJNcvzz2xPjH3aw/e7iqkIZJjr+cXmIDoioohxRVJxE2
	i1znA5mpDmGEirw/CI0sO/En2St9pB68wKyjYZeFb57E3mQVKFH7qqGBeXYFrfvBcEbgMK6mNYa
	AStJDwQuFVXZf5bSv06vz7v3NK8jKkDWhzlUQRTVRi9XR8IqeR7ht5gcwFD2qa1ECAACaMu1szp
	z8OlOyHWDeu780c5OyFLDhhU=
X-Received: by 2002:a05:7300:80ca:b0:2c0:d9be:eb09 with SMTP id
 5a478bee46e88-2c185a57557mr875171eec.0.1774633557661; Fri, 27 Mar 2026
 10:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327114741.91500-1-pilgrimtao@gmail.com> <20260327114741.91500-3-pilgrimtao@gmail.com>
In-Reply-To: <20260327114741.91500-3-pilgrimtao@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 18:45:45 +0100
X-Gm-Features: AQROBzB5tJkP8M6dPCGpMeaOv63a95dhaN59p5xt7LwFdgRiK0mSmaXLq6iSY1Q
Message-ID: <CANiq72nFSyKSUcRJL-uME7QsvS-4aaNN2nVp44W49Q6VZhCJJQ@mail.gmail.com>
Subject: Re: [RFC 2/2] tools/ufq_iosched: add BPF example scheduler and build scaffolding
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: axboe@kernel.dk, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 12:48=E2=80=AFPM Chengkaitao <pilgrimtao@gmail.com>=
 wrote:
>
> +3. rust >=3D 1.70.0
> +
> +Rust schedulers uses features present in the rust toolchain >=3D 1.70.0.=
 You
> +should be able to use the stable build from rustup, but if that doesn't
> +work, try using the rustup nightly build.

[ I have no context on this patch series, but since the filter Cc the
Rust for Linux mailing list due to the Rust keyword (I imagine), I
guess I will take the chance to ask. ]

Is there a reason to have a different minimum than the Rust global one?

Currently it is Rust 1.78.0, and soon (this cycle) will be Rust
1.85.0, so that should be fine for you. The plan is to follow Debian
Stable's Rust toolchain.

In addition, you mention nightly -- why someone would need nightly?
i.e. you offer a Rust 1.70.0 minimum, which is 3 years old, but then
right after you mention Rust nightly, which is essentially 1 day old.
So it is a huge contrast, not to mention the availability of unstable
features in nightly. Do you mean sometimes you may need unstable
features?

Thanks!

Cheers,
Miguel

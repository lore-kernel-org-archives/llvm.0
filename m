Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6360C3B8BC7
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 19:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291618; cv=pass; b=gSx+ljb8iJvWZeHyq+M4WXSYcYOpD3ovOf7OhfoExouh6aRMw/b9X/6/5kW18EymCFbevLbKMXYOgHCT8y2zECOg40hkGLxzIKcrHiy93SItSlvcK/O09crv2CeOYEriv1a8FTttto/CjcmTnRmL8O9+qQcFKaofrX1yDe0a7Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291618; c=relaxed/simple;
	bh=vPIlT3/0q3DmEJlhpdxnF5yqYyOZkdrfaCmYL1+wp2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGC60uQHVeYUDL3CHcggVrgSk2BoueTHbCcjqqHnQqO4z5MSHUkzrx9g3+OubZl0/VqqHz2WzXgBCgaEHd6Z7z/o9ghUC/PDw9pTWoTBlJaYkilE5MwVhwZtgsxd2dE4L2xiM2yvooSMRqV4wcpXNUW7lcayYPsmC4ELLXoiab8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=McgAgVYg; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="McgAgVYg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4996e2575dbso11665e9.0
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 12:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788291614; cv=none;
        d=google.com; s=arc-20260327;
        b=QkFGOoH+Bn61Z6ZU2wZDwMPa9+ZeAvQvljYQ4SK93LPsIjYb+uW7IZ4AaBY4K53E0E
         5YypjQJfOOAGjeVpFCXY5a+Yff5efP0SNoXaFB7yj7L+xZ7HFSArWUSjUveNtjbCUuYn
         HVzxXS0rMjWvuGAYLXcXOvAYYWMdOZi6WF7quKmi3QzsY+2mqjcMYWXji9RhOgkzW7cR
         Rl2jWof9kGLWP0yVDD4tuftO0lZ9Dcdn0JPFukeb8/5gQQ+0UqaKyqwSQfn5mO85/APk
         tPOQ2/BZ1kMrAV6PFoDPhFyjG99q9NUhqeeJAMvHu1ftOK5Pl9o0jcBM/3R7ZaiA8VW9
         GhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        fh=UcyL2pkKXmGD7kCrzD4iJKvToJbOjcarwMOV6h+d6i8=;
        b=RYTfG0GLeLFQMnwQvW0ZoVEt/Ab0dyUBSbRA+ZexR37D8RuYkjc29XoLQ+XyxelkdJ
         zWFLcRwzFalUoD6+F7w+aaHnr+4sNzSFAxVIKmC/XB89vbd37gE1p4nfDuvTVPpdBE+m
         bfFCxWZ+exZ3n1zjhZiEMsmzlIa5v/2P+fGtehpcULdhAWu02ZAvEPiTgUnHkL4fgNpB
         NFmqnxWQB2JStrcrVtDnIHCoF6I4Oc9KYzcE9gvjltil4ku0pYmrIaG0nxg0QB97AMX5
         NjuuUTC6aUk/O1PIDtoI+22z6ZnU4Drx0yS54D7SViq82vg4Ng3nrXx8abVRngeNldeA
         FVlw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788291614; x=1788896414; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        b=McgAgVYgNAzu7RnAVQI5oHtbuJyzYuCHk+hbFzfw5rudnokOwNwEz+/NQlS8yIUi0n
         9p6txVr5bOGRocnHI9MxRgwrnzUnVpNyEFMa4qc0TIOaVOZ07Le07izPrbsf/kYymiiM
         gcImjZq2GE5ASH/JGdFDZfJE4ve94lcZkhvxpgZnPm2fXWhIYifRUmQepBkX0koBxI0w
         MdZ1T/kfpEZXhHsBuPpQmkPHJerJ+lVOoaNN0FTdBtIyy19xV9bOLqnt2xB/Qt2qU23q
         /11ec29JuNtgzBV7L5k71xNORUmXokfCNHJc9naXlT0K51SnxBvxcQI3yXsQVOzSmYtv
         5FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291614; x=1788896414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCPNVjswzrfu/6ewp3QsYppMVfdEr2MBSoZ8rIPqMgs=;
        b=ppN+5r5Oq6dpjdtE+r22bCVAOwknWcDu7wlKvPFFW+soX7qsbKAS3lowoMJrPF3vCn
         nioXLrK9n51Iv7kIuiO/cmz4oFjQPrtmgvUn9TOIgCjZB7twJThSKrJ1lcMm7/JkDhXj
         T4u4XQtRD97Ub0eyVKYBlwnv2NBfNDLDDS8Hq6hq9KbFG9QpD3hWTPcme05YJmOiVsWG
         KVNmJ0ZfTz7yTVOnrRcFxlOZePu10xI25uSw9TUFA0YWeG9HMXuaea/DzbXhPOjnbdsh
         x6VqvMC/vlkvwuje5k27iR3KjJ+Z0j1QsZ9oGXaOOnuywprM7OHz7C3LKhVWa4FC4cyV
         pJDA==
X-Forwarded-Encrypted: i=1; AHgh+RoLhWRFpLvqSoE6tC5u7mMjDXRmx2JYvh6ptGQvmxf7tDuDJk97lAVi0HR9oQLGR3bUpSBs@lists.linux.dev
X-Gm-Message-State: AFuF++ljeErcMo1XEnfRNBXMkE8LQWA3BNST4nD5/+PjVuMkdkXh7G5l
	P5r9vbKGCOmFp2dB32frCjMWRzig1WApWJQvfvhA788FbAuAIHQosl/FrQBrIytzC/FKom/nlYw
	oWIznbm2ejWDRw9FW71iN54Tpq9HP5R7CysMbXD5m
X-Gm-Gg: AR+sD12O4QKhkPJfv2HVrrorCyhabC0kLbhzIglffZky9dSUa6GJOiQMFpQygPmjDT/
	cT3UVw1Yfl8CQKiEVeya5hqtzBULFVwKhtdpNGOFYNc8QNswdOawOp9i7LzhxTSOd3nRREhzRNW
	QN4RfBur4As8G+lurnIXjOF8ZMsfYfJEEMz9yXUSz3pKmLnIKRsXrSeVDCDPJim9Xn63e8tOUN/
	hmmQdewcBt5i+nNpPm9Xb26Mln0g74V6PfoeqblqeEQlJZGXfLBp0AkvYSoT+Gmtueqz4BZJyW1
	SYGKflE+tNjG4py3/ZQtPirUCrqTkKjeNTWbXVnqu2U3RoVi0RL6CtFmhAW6I7F3DqEhJFmZmzU
	w
X-Received: by 2002:a05:600c:224b:b0:499:7da3:dd0c with SMTP id
 5b1f17b1804b1-49ce462122emr115145e9.0.1788291614023; Tue, 01 Sep 2026
 12:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827194508.446733-1-linux@yoavmoshe.com> <20260830155100.1020620-1-linux@yoavmoshe.com>
In-Reply-To: <20260830155100.1020620-1-linux@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Sep 2026 12:39:36 -0700
X-Gm-Features: AcwNN1XK0l8thrBV4rYONxxoAFHyd0qFWNxSTWm7rTcE9pRg3SR1YhO1gQnpQwA
Message-ID: <CABCJKuecSgC2yZ1QHACv3gfOYf+cPXvR5TCEM_t67NX-putr+g@mail.gmail.com>
Subject: Re: [PATCH v5] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 8:51=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> The suspend code that runs from OCRAM is copied there with fncpy(),
> which does not copy the kCFI type hash preceding the function. With
> CONFIG_CFI=3Dy the indirect call through imx6_suspend_in_ocram_fn
> therefore panics.
>
> Keep the call covered by CFI instead of exempting it:
>
> - Add SYM_TYPED_FUNC_START_ALIGNED(), a variant of
>   SYM_TYPED_FUNC_START() that aligns the function entry rather than
>   the type hash preceding it, and use it to declare imx6_suspend():
>   fncpy() requires the entry point of the function it copies to be
>   8-byte aligned. The macro lives in arch/arm/include/asm/linkage.h
>   since the requirement comes from arm's fncpy().
>
> - Add a cfi_type member at the end of struct imx6_cpu_pm_info, which
>   directly precedes the OCRAM copy of the function. It fits in the
>   struct's tail padding, so no sizes or offsets change. Fill it using
>   cfi_get_func_hash(), putting the hash where the caller's CFI check
>   expects it: four bytes before the function entry.
>
> Also mark ccm_base, suspend_ocram_base and imx6_suspend_in_ocram_fn
> as __ro_after_init: they are only written during __init, and the
> function pointer in particular should not be writable afterwards.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Yo'av Moshe <linux@yoavmoshe.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

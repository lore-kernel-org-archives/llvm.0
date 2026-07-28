Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D963AC0F3
	for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219265; cv=pass; b=ZF/I4HL0uecW38ONKyL3VG9p02fR3ykBNHLNjycJMfEcig0uR3w6UvZehnBn4xwBhfQUUcw+k2T2B7PmOVLDPZi6LQKcrKnquQTwFlN8Kd2S+kTEKvaKbGhC9YFhua4dUEIYnTWVt1aVM2qrezwHiTcjlahFQ+g+qTbuSjRE85U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219265; c=relaxed/simple;
	bh=T9emucQeZo8TGHwKdlSTbVZSHcqzzCT/Oq7w5042AWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDsciEHCUM4quz20TawsNLINmpqGxxN4OUQiDR0SD1SfMwDxf/wUWZAne1ITf1/vZeNuTgBGA84pv9jMrow/1YVZToZF0DQZcs+Zy/hXUL65T44csxrO8oaeqRiAmQCEDrx+Es1q++CSlAXWkemXjD1WkWIJAcZGrPDe1RTjwr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=G9fP4Zg1; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="G9fP4Zg1"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3543549a91.1
        for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 23:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785219263; cv=none;
        d=google.com; s=arc-20260327;
        b=OvH7mSlBQGi6Pf7xqvFBw0pDEaOfNgFLDPAsxQLsU4rI/SV7EaYW2n4QV0E3G98HLg
         wDlDnWfwWJeV/dtYxOJSF8V7BQf1rXGD7ks065X8SyqSt2L6yfdYP94vYafiSrNa8KDc
         3oluH0a6uol8QvOTLBFAawfpZ6Fh0b9dOiWZs0nldrzI10MYX79sN+DfZJA0u97AHtBo
         7Xjad+DkpxqvioGk3tcYWEhKZAA9PJ5qk+gN81tEn+lR2u1JaNgrQCObrE6ufYuKZ7B8
         pwlcWyYQzlES45qVw1gBXDZK8hSIlKVZ7OHQDEOpzAqpz4bmen1a8TVXB6MR0yGrwXgO
         9I3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T9emucQeZo8TGHwKdlSTbVZSHcqzzCT/Oq7w5042AWE=;
        fh=rXUZxCLWGriDz48XZcs9ZTdo611/HCXPO07Cnp2fDnA=;
        b=O4T1EfZ2Awr3xWNTri5ulve0yab4lLnMGw0Pnyx/o4mijBDZKSgw8vufo83ePBSwmO
         tZp3tjSROV7dEIOcr1r2Li7MHzUcFQdE+IRQkqXqM0EvkEQxaCNi3+4tNeLFgJjKjf03
         KeDYWrpCnfXCBW1u4gaS68ejO95DHBw9sdyCFdmqtF99J35/9Wss0xbrnI83gZrV7Tsw
         F0oh4Crc3pT6FszuBiD4nR2AH9yCRzffvByyPaPcqqN+vjsnOGwrl+T33e5Ra0rHHihB
         An46RUeFI0MGzH+r4xFpqD91b3Xxc9WaNFeiONRD4MdOvXdB98DESLVPy2JLoI9XIKXS
         y0eQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785219263; x=1785824063; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T9emucQeZo8TGHwKdlSTbVZSHcqzzCT/Oq7w5042AWE=;
        b=G9fP4Zg1MUjKOKO6A0buomeUXHfxW1Iz1pSVJ0IMXWAmJPjNcx+95Puts2TgNMyL4N
         0RShk+9n6ZArFY9wF49EgG6qeWXuTKzgaVfgJODZ6Y9PX20Ad/qcDSKN6bDEkft4M5FO
         SHClf+hGPEym4kCOE5Xr0GMuKfxYSxe80aZMq2FGJmayerPqzXd5e/vzSH6ZscJpUIuS
         isbMJVT59Pxngdaa3MFcezlZVYLCyT+razu/I2oh01gu+iBhxwWWCpAPJsjkxGdkd5fP
         dVatIbZnP2Wljsc/HTvxkfUmnPWR6QrfW8/sFLy1e/OOuqOH57WaW9Y9ey/LJQW33ab2
         n6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785219263; x=1785824063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9emucQeZo8TGHwKdlSTbVZSHcqzzCT/Oq7w5042AWE=;
        b=Wr7bTrIvMIY2ulGsjvuqWC02IrpyLnLuqDFi+HvrCre7q18TIIj0Pza+++EeJTaEPH
         VlwzRsnRgw+J/ZFTEDPvBRV9RhiaTBaGTCyY3jlaSHQkv15U5n1emHLYueTTYpv9G+lm
         Jnel9GghVgfB0Kq6Hgwn5Zl3uJtNs7NLN4HLiJu/z3k65gy48G2H3GVvs2TJnPQSM/2D
         wlq6m8qE6IA0/LRKqmO7qHDG63uGOxgzbG83o8iPncaA37Skprvk7vrERsiNsmaC1LEX
         UWNnQGDZGCuJjzGjIDPoYcJ8tLugnIdwcWV6+HQY2Km2tuRc7VDBMOFinBkPgjK1n5tb
         hlsg==
X-Forwarded-Encrypted: i=1; AHgh+RoLefvFvXY/K/77eiHAALKpo9r8/FG9zOJBorhD73Wsc3Z00TGfW0nMteFxANanLcoH9HKo@lists.linux.dev
X-Gm-Message-State: AOJu0YyXYk/bEuApmv5eTyvouZ/V9hMP80WEPQQwvBKtMjrY0cEY6TsL
	FKd5Dvw4X2F50AvKvpiuAT9f9rQIOvKZdMKFpKEcdCALrEAQA393wHV+sgKFhq2apv63LQZ6W9I
	VjsGLJtQVWLGOP3koet42HYeWGBFkE87csvIRw0a0eQ==
X-Gm-Gg: AR+sD10xzCiOxr3n6AVzyhN1xunQWf9ZpntGNvh+sSHKLomuZwBMZj+bLbK4Am03jhk
	0tsuSgAI6g+/L10zgtdYitAD9PUejpyrgX9MfqFw7vcnF4bbKc49Wk/uAi51RajI/WtwHE1XpCA
	beCLJad4AlsS8tJ5RilIIyBc6J/85oc4blVaklSa0Cnyjo2iNRwyBwqEU/SVzHiliSSGZOWpgIl
	NqaI8UF5A4RMN7sswvv8bqyhCVsy/Iy/tvybQTRdGAvG5hEl9+DT83SUrkmuLubFxQtkwGag+YE
	hlH6RRxiJCH5BCA9SsrOqEgfCIgGg2I=
X-Received: by 2002:a17:90a:e7ce:b0:381:cef1:11b0 with SMTP id
 98e67ed59e1d1-38f6a54400bmr1094669a91.33.1785219263585; Mon, 27 Jul 2026
 23:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-4-ammarfaizi2@openresty.com> <8bdacaf3-7f93-4095-8875-4c13a273fe3d@t-8ch.de>
 <6a5f7481-124f-48ad-ab44-577b12d33592@openresty.com> <4e22086c-8a60-4965-8d78-a946dc54eaa3@openresty.com>
 <625278ef-06fc-466f-8b69-9a37d5097b18@t-8ch.de>
In-Reply-To: <625278ef-06fc-466f-8b69-9a37d5097b18@t-8ch.de>
From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Tue, 28 Jul 2026 13:14:11 +0700
X-Gm-Features: AUfX_myLYoIJCIgc0mPggQI10oPJrc_4hFq4UqwvYtZQeCyZIllsnLCigd4kxHw
Message-ID: <CA+KFgX7vVA8sUBz_ngVCnA_DW11eC4r=EDatKBP0QUQYcC62Bg@mail.gmail.com>
Subject: Re: [PATCH 3/4] selftests/nolibc: add abs() range test
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, LLVM Mailing List <llvm@lists.linux.dev>, 
	Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 11:13=E2=80=AFPM Thomas Wei=C3=9Fschuh wrote:
> Do we need to hide the variables for a regular libc?
> If not, we can have a dummy definition of _NOLIBC_OPTIMIZER_HIDE_VAR().

I think not; I'll go with a dummy definition of _NOLIBC_OPTIMIZER_HIDE_VAR(=
).

--=20
Ammar Faizi

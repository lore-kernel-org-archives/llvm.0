Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4CC3624AB
	for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784732484; cv=pass; b=AvgBsIeSkmeltoncXspsdLRGHmPiLPYqTR4R/+bVinTy+K2IgT35uarhpvY00tHcnx0Q7sEu/HI5CoVXrKRDV7d40GSCkFhLrvSYIA886y366naYgv3b9fCvrqre+z3pqfQvfdKTkkoS0ECUgi4kWfIs5VuCEku8w9ljbRBWAq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784732484; c=relaxed/simple;
	bh=VI4OwuFEOitISKsCf5TtIc8+gelg15Dp+6Rf9Tq1qX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqpNu+cFjmpK3uZ/LZAVhwOkbsecmPNH4uzo6bP46Wb5na/youxEooXe77sonvyWuAF9WTBMnxQ78nhqQm9Af/tybklbCSA4Ai7TOMid5NeMBmuJgFH4Ss2OcCPMM2lwdr0uqtQPBRrc6UEDpa6iPnnZofS4poMBxMLvkHgsvSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m/OgcmjJ; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m/OgcmjJ"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c01c79467so1415831cf.0
        for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 08:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784732482; cv=none;
        d=google.com; s=arc-20260327;
        b=lmssVR8TJe6ClUuFBefQOBJUSMdGWg3p81WfgUQQTh3r2KsA7nXhekcmeFBRkkb9nL
         r1zDEuazjbPC26vZGyOK1qN2rHOTEFvXEcuJBgjMFhyNUOsWFfdSuEmn3t0wyGS+RcjG
         xvUlj/9cQuJQg6Z+py7OMlc+MNnhxf0EWWse8bL8N9jPxZo4onBKJcqS8KRQ7NnCxhET
         Y/x4JW1WP7pB2LEmdVCeUirqaWyst2+dxzVIwOiCc7cy1KceVL0ydYjgkP7dXewCMvdr
         eKpU1vkl/OIWU8VUCGSny4aLkmyruMMQOpuXU3GBSPQJhSb+hvoboBnkDJdxKBfr2v4Q
         /y7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IUDdFmL3+NA+J1/tlIoHIkJZpryeycSZRENBb+lv4ow=;
        fh=BkD44RNs4+6Fy41tu+KDc9Azrq1dTIOnhRsHCZ4U4GM=;
        b=PWfSnqsm5++Plup/XbxkRHnWlBMXkGcbDc9K/Vtnj5hIoK4z2DbAWLe+T/QxpZHmPb
         woO8iIOG4a+ZORo6vOOaO8EKdSv8nia+EAvRmuWAepEPlt/259GSSJx40Pqx6uKFTEls
         mtcZDJDiVEi+iieGoK/NUoTmmR2ECeeWkFNs8gCysmm6dyCtIbQxyKnlYdmeLCnvtaa+
         LyvNA95swtxn72YL2PzUM8GJzXKAYbebU5UggOYN0AXu0hf73E36vFRjZtiLSYQW+9ZO
         qOyaGUcv5skj1/H9YR5S2KTF+uAqSna7MF2HEKlTMmULnY8YV5gEnmuctH52MDyoifKV
         NaPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784732482; x=1785337282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IUDdFmL3+NA+J1/tlIoHIkJZpryeycSZRENBb+lv4ow=;
        b=m/OgcmjJaUFF49Zo/Ih0sifXwPyAHCiacPyMPt6iMZQZYfrd3Yh1mlB8sxCoe9vQ/z
         fqQLq1Xe6UJQacZamWHFG5J4evTzZnFDsrwdrHdfX1dhvEVkngv/INrWOiBo1BwnHmwg
         1IqSr9m/oDpRza5vA8asd6c0fxCHim6qAgCZTEKup/SQpupFTp0EMqY0xhvZ6vs8KRpB
         oeFCXRqq4oct55TOQqJPQUKALSNK14dRnkM+8uuYAKRoBW4OkndtuY57k1eW/z/aQ8yt
         JzUryfxpI2PIcZLoNIHuyXvLJsqeN6sAhlqiPAm1fZRZxs4jO5cTMF7IKDIqqcrtjCcz
         KU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784732482; x=1785337282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IUDdFmL3+NA+J1/tlIoHIkJZpryeycSZRENBb+lv4ow=;
        b=PhBC6tZ+qcwyzKdwhTQsa6JYHapTMA7mtm8APqNhbiQDsIubjTGRJTEMUToi5bngJM
         RRUkgFGZCtAqz2i52c+h9Th8t8lCcsvzMx5qn5R+tJ/DLpLcxNFwaH/aMUPxDpWRWgEw
         Kwohcnt/kfp80XCGppwQ60PEXD/d0WtrVF+6eiPlu8hRmQKxYIe87ejuUhc9i4Z0qwzc
         LwpWyrjAbhH1AcEmvcQhtMmBHxLOpZheR/nPfkBrHd+TGHUAOqoGA1EHW7EYXXZzFJ0N
         yPcIqcjzucqaDC9pWR/pZWGjblCkKdcLmxzxSelAGixpQcP/vEUNlX8MlL7BeHiLf6BE
         dVVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKCrhjuZqkTzLm7IaiTkAF/52gyPgaHsHvkiodWFXewvJv42spDUD9fjQB39QCU7lXbIAb@lists.linux.dev
X-Gm-Message-State: AOJu0YzRuMY6gfRS7kdoeTpY7lGOm8CGt3/M5VIQSuYr8pYZ8Ht2UkM5
	LNTYxkrYKyIgmIBLJHrzdFD2pf5Q4Lyna7AuZnfXgIUSrKkpajdY9nHPF/z1VpAvaTBX3R61HF0
	+rX4HPsajU3ZmVkq0QuA5bZKDVuYSqz1JXqzO3Jag
X-Gm-Gg: AR+sD10uQuO+56kTsLe8W8Ab4xfTNZgGxwjP+kHLAHNr3i+XuwslJZVkFdOFoZiVkNb
	mgMWDuLRz1W2+px/0F+dnC+13Fe8KmHXBhJTUhNMlGf0W2KIqOzAZPN1nTi1/9olp3Bymzv8RDZ
	2Uqi163cEK7mJ/LcIF7M4QiX+0h+K6UzHuNswk3sVHqc+ue1VUYLu6E+NKMYjo+Jhg5ghe4Too7
	vGotpPRRtB4fhNXp9XXcIgiCEova45xxuzoFb8YZSrP7JK2PTwek8LIvIieblxaahudqg==
X-Received: by 2002:ac8:5fcc:0:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-527ef057dc5mr8866391cf.7.1784732480733; Wed, 22 Jul 2026
 08:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com>
In-Reply-To: <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 22 Jul 2026 08:00:44 -0700
X-Gm-Features: AUfX_myRDvh7sB8bTl-K_5M53o7Jc2MxCOtToMgfXS4NBIZfb2fG6H4OMTOIhfE
Message-ID: <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 5:54=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> On 2026-07-21 8:09 PM, Nathan Chancellor wrote:
> > Does using SYM_TYPED_FUNC_START for imx6_suspend() make that work?
> > Something like this builds fine for me and I see
> > __kcfi_typeid_imx6_suspend generated by Clang.
> Hi Nathan,
>
> Thanks for the suggestion!
>
> Unfortunately my physical board died, so I couldn't test this on hardware=
.
> However, I gave your patch a try under QEMU emulation (with CONFIG_CFI=3D=
y
> and copying the 4-byte hash into OCRAM before fncpy), and it still
> triggered a CFI panic when suspending:
>
>     __und_svc_finish from imx6q_suspend_finish+0x78/0xd0
>
> It seems like the hash generated for assembly doesn't match what the C co=
de
> expects at the call site.

Are relocations applied to this code before the function is copied?
Because SYM_TYPED_FUNC_START doesn't embed the actual CFI hash in the
binary, just a reference to a symbol that contains the hash, and it
relies on the kernel to apply relocations before indirect calls are
made to the function.

Sami

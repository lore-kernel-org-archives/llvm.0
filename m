Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35F3F8249
	for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724319; cv=pass; b=gY2ObpiKNym+io6xhAQ+/ts5CIOSy/PFCK9/UlW8klPWZEwH+hrEEGh77mu5JdCDKAxCLoEOTitnz6ZdmNlYTSC4Pxy9S1tj7kWNbtXpsOjQ6yM12pLWpxJNCpt8OtjtwmbR0H1eBnodYqOc6thCfFxvZsedz3wA2pgiXkG0dwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724319; c=relaxed/simple;
	bh=5T5WebhApI2QU7tVIw9fLdCQvq2s3y9zxINx2el0WJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISxey6eV00f5/Qohs2kSyMyUPBi3+Xec38K1Ljd9OX6b1aOJ+4PwIKPaNvMe7qNhN1umgghU/yrd1L5MIzEvYteDE5RuyQ0YXZGr9nU7wLwmPU9zJC+GocuIyZXbwM3FTR9I7q1KsCyt8Xly70mp5uS1hSBeoDCg8tVJG+L903k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQ0X5Td6; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQ0X5Td6"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-137eb8e3491so254415c88.3
        for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 02:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782724317; cv=none;
        d=google.com; s=arc-20260327;
        b=dvDTDyPzm3qw44Rb0NJ1b/5V/YBowPlNyG0wfUWl+G79++jsOINPnGYCBYD8J776SS
         n4djqN73Nb+shg5UsJ56zJnBVNGMKm0fk+5m2HVqRlFJzrOU0wixGG4v6NUyLnX2cjsc
         BzuzKKWUop7bej4LXoF4EWemqW9n9HVpKGtAjqb2D0JPseYEgHMHl0U4OWwUjkU9CtPw
         IYnJ+hiVlGZD1bVOFvHG6EB55jSlHUTP1kX9Ui1I2pSaMkqJrzsFoKEn6L1PXo4F5wHH
         042uz2y95A+VU9upesyI+TKvq3xpuVZPSwRrqt04sJixZlR1U/JNA6IEYF1l6WxUocZp
         Ql2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5T5WebhApI2QU7tVIw9fLdCQvq2s3y9zxINx2el0WJc=;
        fh=rhVua3CjFQL8J64golnw9TjrvkUgVIIvO/gZj9beizs=;
        b=KgDX96T3m4hPZhsaqDycRG+X9Z5/RpHuFtytpOm+qkC1zNtQn+4tVUEn9J3oSZ7LE7
         Mql7E1PEf8uFZZFp7CtXpZWT6PpGKFQpEwpveysHiE8tI0k/1ci/tStDZW7gnI94KsC5
         lTUtwNsWG0gwbClemX+VXKtco9awT7BB1KU/uev4spUhvY2B75fA8GS1BMKNj84TBp//
         mQcob8+dPum9WnAbm5RDQWnSTkE0Bqh3kQIwuL0CiLAT/FR8YFkcFXCkKaz9gWb/89FV
         OIEShnDo8oWZNEOdNt+xangFPUjsgVGA9X3Vq/IJCvyoFz6NzR70HrgcYQAyzzw3ckub
         cjBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782724317; x=1783329117; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5T5WebhApI2QU7tVIw9fLdCQvq2s3y9zxINx2el0WJc=;
        b=sQ0X5Td6ldCmYIFjxAfOMB6WMs2Zq+KGd3otKMp0DD1nGBnPrzJb68HWYVZpTJ0uxw
         /V+ACALProYQTu6ev5UUpwHKBCayQ0gmP4bjIoye/rP8RaMApBsQ4YuFunv4hdT2ETug
         ONiEMVt4xmHrjAtSDeBYyDoarF8wTH10RHzfpAjUUxt5pKAl3pR2CoCH6okF6SnkKZo4
         eSnuvDsuDZXp/lhtYy5uuxT+PbHrQ73IfmDT3PJEIezzaAxsJfu6GfF6kgwdmlzRgkHi
         MWSu3ARWys2d40Cq9gQYjDSMUT0SIUpKIYzv0w4HrcTvaoHrkvHUDCJHRf14c9ZBxs0m
         9vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724317; x=1783329117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5T5WebhApI2QU7tVIw9fLdCQvq2s3y9zxINx2el0WJc=;
        b=K1TU6SBYqmxZ+S6tWMqlS31m6gnyPL6ut0ocRzXN/Hd9Q7MUX9cUDd93RETrEwopN0
         6zX0yYSAvuHPUzt45GZ98T8SOYcfKNfPfWVd4kTlXy8ZHr0NlHDV4IgXPzEHaBsUYpbF
         Sz1ZdhwQyKGat325jIzvDtcgEOKCUsCRde6d4eD5GKIiPAjDbvp7Pm33fP0/q8lukQfm
         5A8KrEryMqJqjeVdYfRPMcubyTMJByv8uWCLFTpoFzFexDFKHRrgvAQgVSpQllyGfnE+
         G6Tnrjr/nuRYuspCTx+FSY2cBSsUceFNa8gy02BcFkDIIxBar65dfejwQCR91mi14Ecj
         quFw==
X-Forwarded-Encrypted: i=1; AHgh+RoxZdiYlr9KjsTsKI301nd+HXpF1MFZa/EqjohBravvCwpWvJtSUFr3aR0q1DUstL3WAe5V@lists.linux.dev
X-Gm-Message-State: AOJu0YzL6u5HqpmzeNYtlmy9+ObPMRORXdcVC7rgdsKjgVCupLKeEVJz
	9hU8fM3k9AFKKwQOSF2SmtWx62Ga0tdeDJJSF50201HSwiqZV0nSa7SL1KthJmn42cRLSzoYPjx
	LPFVW5CMu0S3hu3yE4LZoT5zWvmIPPSY=
X-Gm-Gg: AfdE7cnCV8Gv6V5RxGYcyQQouBwVo1E6h6cVHVtUWP5z4/E7SoxnhdE03poMfc9SC2v
	ZQvOR9qLckBGOIK4j7PYw4pRGz3ACjzzE7tjpnbvtcebho3e2+ACdeY2L+TP0P2BMl36p7JhcLh
	Hah04WNjP+Lec17tBEZyie/vmRjs8JMNOMaKHdZ+wiVIxvWJMINwtMPYGflMCCaYitGu4HTSWWp
	jjtA8sYxiBOzVe3ZjOqTRP8vjfaiTOEDcsaFCex0sJcPmsEtGlrSFwaNTjAEn2j/EcieuKjNd9/
	Ume33XhNJ9PgOkGgoG3DdHZ5pSLibwX4oy8wr19Yf7r+DQm4nmFGreTAI4qN+PYtSOiTTLWYhI1
	Y5VKKDDZB93rb
X-Received: by 2002:a05:7300:e82c:b0:304:5074:83b1 with SMTP id
 5a478bee46e88-30c84d1d771mr6422203eec.6.1782724317312; Mon, 29 Jun 2026
 02:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520064630.1785283-1-mkchauras@gmail.com> <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com> <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 11:11:44 +0200
X-Gm-Features: AVVi8CdD4UZYMSdVoz4Zj4b5OG2locYG8F0KrVqjoorstpkR9yzH0nWzAh9oltU
Message-ID: <CANiq72mj1P9QykK6vbPK37hZkMLwd7RcgVWEcxxuE=9OL+4bAg@mail.gmail.com>
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, 
	kees@kernel.org, lyude@redhat.com, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 6:57=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Sure i'll bisect. Meanwhile i would still like to get this upstream.

It is very early on the cycle -- I would suggest bisecting first.

But it is up to ppc, of course.

Cheers,
Miguel

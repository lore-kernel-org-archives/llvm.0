Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF7D3B8D6C
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227820; cv=none; b=ulixRjr0Sc99ECd0fItJxaH1V/IcDcDJyRaGFQKe1TPYq5sdS/qZjUZw87GKUSXiT9TcArnGAC5CoieO+MRtnfNOilI+mndZPZbMtb4vLJbXm/0WUKlQ+v7OqIM9xwGJdHE0xK60L12tGsojheo+Jyi3cB7eqfFo4dAVc1+hyzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227820; c=relaxed/simple;
	bh=g/DecqvuFJyw1Ly1GdjoDlkRpaj8IFIhJom+NSNKplk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sABpe9l1JlPvbOQ8YKYwgetzUelnIHU4u3ODrudi+JePgO/Qtv32E0C2zyhvzDHYdPsu/Vh8s9UzpIJgqUNU90F3o+qRMYuObS9/jqFf2bZAD4E/QwlKOdxsOiADio9yLgfr980jwXA79sB9pxppF9VZT4OiVSFEMoXyPrGYegY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5T0oPnI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5T0oPnI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a7bced39cfso1254315ad.1
        for <llvm@lists.linux.dev>; Wed, 04 Feb 2026 09:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770227819; x=1770832619; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YsaxEo1afPg+Rotp0Xp7sr+H2iiL8qecJpuRH+ktCAU=;
        b=V5T0oPnIwGoygORGLCtisOeDXrKimpi5bQuDm0jLZwx/VRYZQAWXhPXpnV6KDx77Kg
         7uAjvs3XVohS26MjCUpnV8mxy9N9HoS3FQ9AmiQx3t9v2JxA2uR60hjj2q9cr/kPNpFo
         7/CXzU+ITbxg4YiVq8hEwEjaP/B50LW2XL3XQf+rKAgc9kG83L5kndrDmQFUDNDo9Pw+
         h+afWpd/rdbfoJGIFT8kkPRUCQz9boa056qzcdMUNshesysrQMfx2z4PR1JalFgJxbIW
         73I7/wM3K4UItnHw8Iive55z9ssxD80i1lG6O33ZHHhHFIgw1vQu+qOI+ypz8MVpNjzI
         7EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227819; x=1770832619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsaxEo1afPg+Rotp0Xp7sr+H2iiL8qecJpuRH+ktCAU=;
        b=ky7nETZCqysZOALaQe96vQrSVOMAlSbeTDpGBvUohwnfeC5D5GsHlGlsI+vbqvrNE0
         yivyclwpfbblFjZc1JDUIgB/QZG8o9PCIfZwybA7WB3US7/NgIRaMvk5l+EW8+3kQb8l
         tvZq8OBPQQd2bo0Jgn6D914LCh9oYVU6MRudlczzAOn8er3XSAaM1/21fkfxYJg8O3f+
         bco1XmG/TWP6BsQmGzCpeaxtsGKsA2E/erpKsROyrdkaO28RpdUHwHMeaVYS+lGxFMVa
         XArmJUDl9iEIx1o5Sd5wcQgfhY39upSdYq4m941rczTHpH8rLHcs9cWZUyZlSAz5Ie6r
         QjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWolN6mE9xd+Ji2LgM1Z99rvBP7kL09CM8ry1HbPIiLQLF3M+txdeasDKMtCAzqPKPDrOb3@lists.linux.dev
X-Gm-Message-State: AOJu0YxPsFGW8Vg0qUHiEvC4lEwTq2mFLIP7i03hvN7IhT7K7wiHg8Ra
	WT9wLcMisIU0CHSexVDgnBNqvy7P8RUE+WN+W0IxWmPKlFmFDhx3FRyW
X-Gm-Gg: AZuq6aLWO7KFa1GYTL0PUQT1BQiasgDb9zZaFPpTJximanobQVuT/Nl9rCvt0p/n7GB
	4N5+bLNIuaqagzlyva1GxyyVvlIwU6WmoyU7A9NoXPpuIiU6ziqJ/h5Qpsb7fpQfTPeRs7upgIW
	KrAYW7KD7DO6kA9fqtW9koPSDDrUq899N3bNyFkerZv0Fao2xU+7Rx59NK0iIURP8/A3GwACGzy
	e6QiiTbatTOZ4PbreAqOu4EnsjfRKi7AXh0A6DExSRregBHnNKdHE5Gq/r8v2lHXm71gHAlMVZP
	6MLmI8cZTjeIMw/+ciWpmWR8bP9QuXybMWb/glPYXbCA2Gv126XblFX4PXspQI7fV5bKdkz7yEt
	WcLboCUl1vr1QPadeOpSDJVlh0Gl10b2On8J7Qxihvyk7KbUgEgdKwrw8xPWHt0Yih/AcbnxUkQ
	//jccqUTtpPOk2os+ozgtpDdncrGQuunJ+6HSYeytIn2eGIrHPAxAX45TcXAk=
X-Received: by 2002:a17:903:faf:b0:2a0:d692:5681 with SMTP id d9443c01a7336-2a933d1f2b1mr33270555ad.24.1770227819453;
        Wed, 04 Feb 2026 09:56:59 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93397c472sm29066135ad.89.2026.02.04.09.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:56:59 -0800 (PST)
Date: Wed, 4 Feb 2026 23:26:48 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] powerpc: Enable Rust for ppc64le
Message-ID: <aYOIG0HSunq6-Vii@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204042417.83903-1-mkchauras@gmail.com>
 <CANiq72k41tCq7-LccTz2NNpUF-0sOqPvbj-z+Qz0msud3O-3AQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k41tCq7-LccTz2NNpUF-0sOqPvbj-z+Qz0msud3O-3AQ@mail.gmail.com>

On Wed, Feb 04, 2026 at 06:49:23PM +0100, Miguel Ojeda wrote:
> On Wed, Feb 4, 2026 at 6:54 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > +    } else if cfg.has("PPC64") {
> 
> Can this be done via flags, i.e. avoiding the `target.json`?
> 
yeah sure. I'll do that.
> We are trying to avoid adding new custom targets, since the idea is to
> remove our reliance on `target.json`.
> 
> If it is not possible to do it via flags only, then we should talk to
> upstream to add the needed flags or perhaps a new built-in target.
> 
> Thanks!
> 
> (By the way, Michael back in 2021 did the original integration of
> ppc64le before Rust was merged into mainline -- he may want to take a
> look at this :) I see he is in Cc).
> 
> Cheers,
> Miguel

Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D9318639
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707950421; cv=none; b=WYe6by+YbzemKEjnVdtVGycy7rOGQQWgqNpYx2jBYGwBO+W8vrC80mishksFxnoEb1DBBybG398isI7GB2dSGlO3vGLUFdtmGgGgRT8L9iQnJzeoPVbsEIQX27ElFY4LhNJrGeGCxiBgakBuiTxwL3xe8ddCisuTc8Jp9IF8zNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707950421; c=relaxed/simple;
	bh=cANzLdZ69BXZUyjsl7ZwBQxdKLwR8JzDdiDwyOSPWKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r18MLaQyWHIBDyC4NNuu0l+940B5sLORm/iLIVE9NzmiFNWlkKv9y/j2J86AtnCrqRHqOnl347grwlx18fD9cWmzvFqGhtHX0PWXbNZQZUQkGmRuO7tg0OMBLUfX3KUM06+zzOjw8KzXx1qaxWzS8Oz1tCcW9RmLNMRyppi69Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jDahnuiV; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jDahnuiV"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-59a94c0fb55so139391eaf.0
        for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 14:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707950419; x=1708555219; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BKV6eQTwSUgCbVKAYzQ+RCk2l6zXw4xuEU/9A1u4Sz4=;
        b=jDahnuiVaS++b6t59AXVoPIiIKIpIDrmGOVrmxktfwouw6TgMux10UFDR6GwXR3HdU
         4Fwfaj6sGGviIJ0f+/MsRwK4Fajb2cJap+acP1C+OdTM7YwSkVyzAX8XZ7Kw/s0fnG3l
         F1zGv5R8xDsiC5nVbh9AanRK5icbh47wQ3nGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707950419; x=1708555219;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKV6eQTwSUgCbVKAYzQ+RCk2l6zXw4xuEU/9A1u4Sz4=;
        b=UAdbL4B+po5qFIwLcbsQDNXHEtDj4hT5Lxvp33g/E8V3j69QqDzvt9jx16i5sOwAzW
         Ac3BEHeEjGK/Y7BlreZuM6Vycvxp7qUAGb1MiG2xkQT6Mk+4xE23WIEo/OsT4o1AWflg
         yrdh+L0y5YiTZdwYGeMJ1/lOrhxEuJMbhpsEoswkjt9ddBRAXaCxMzlSbdcnZG5sNc81
         lh9MWfBq1lfBNfmYCY+DDN+MDLllx/QjAYOI8J5diHvKieszUqpFSToH7yyqfb1C3bCB
         foGnFVKv4ZEIRXUHeqqHZ0NCl2qmfwJqoajnucqWOZmGncFTQUG1eqEGoj1IrwMo77/M
         TsPg==
X-Forwarded-Encrypted: i=1; AJvYcCVk6V93qgcdioAjOZ0pVy5A7wXm5T92A5WJQ+y+562qJglnL1P5+2UwNQ9fQsQiNDJCscmWmqahm8BEP/RfPUYFn3qAJw==
X-Gm-Message-State: AOJu0YziBx0Atw4jIcDVsUsnLTIU8s+GyG5UoIbu5J3ZOgwaK7uhQzQ4
	mThms9tumo7Fz4RBHAZ0bk/V8KgFhxUywnEeyYJxpZrNxOYrPM2NVQTNCznpnA==
X-Google-Smtp-Source: AGHT+IGcdrio1ldk5+vxaJFwF0luoiodDJsqYEknT7Yw0yQZLAaWvxePby1AUdnoF7c7Z1tLFhxtqA==
X-Received: by 2002:a05:6358:3a15:b0:178:b7c0:323f with SMTP id g21-20020a0563583a1500b00178b7c0323fmr3714184rwe.19.1707950419171;
        Wed, 14 Feb 2024 14:40:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrvjO9kRybzFmkrE+j6y1WylSG4Yl9Nxy/NnfqTM85wBBNGCxsWlx4otJemAN01Dnozo2f8CEFdwODsT2t1t+a40dKRJwtBYywqwilIL40XNIKoaxVpuX7Nj+Ag/0x67uPLXeCkdGUmWYuZTIwtGOOPm13TJST93bBZKp4By+OxB5JFePRpMOXVeW09l1ZUa/gDvVrYWN4r+MDgPyBeaaiQRU2ODWk
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v11-20020a056a00148b00b006e0334e3dd9sm9710190pfu.76.2024.02.14.14.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 14:40:18 -0800 (PST)
Date: Wed, 14 Feb 2024 14:40:18 -0800
From: Kees Cook <keescook@chromium.org>
To: Fangrui Song <maskray@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH] x86/build: Simplify patterns for unwanted section
Message-ID: <202402141433.AC69F2A3@keescook>
References: <20240214212929.3753766-1-maskray@google.com>
 <202402141405.0755DD4E5E@keescook>
 <CAFP8O3LWBHkbLwFJdmy7iSGD0cMSy1jczETo=N6oVapCgPY=sA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFP8O3LWBHkbLwFJdmy7iSGD0cMSy1jczETo=N6oVapCgPY=sA@mail.gmail.com>

On Wed, Feb 14, 2024 at 02:13:01PM -0800, Fangrui Song wrote:
> On Wed, Feb 14, 2024 at 2:07 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Wed, Feb 14, 2024 at 01:29:29PM -0800, Fangrui Song wrote:
> > > A s390 patch modeling its --orphan-handling= after x86 [1] sparked my
> > > motivation to simplify patterns. Commit 5354e84598f2 ("x86/build: Add
> > > asserts for unwanted sections") added asserts that certain input
> > > sections must be absent or empty. The patterns can be simplified.
> > >
> > > For dynamic relocations,
> > >
> > > *(.rela.*) is sufficient to match all dynamic relocations synthesized by
> > > GNU ld and LLD. .rela_* is unnecessary. --emit-relocs may create .rela_*
> > > sections for section names prefixed with _, but they are not matched by
> > > linker scripts.
> > >
> > > .plt instead of .plt.* is sufficient to match synthesized PLT entries.
> >
> > Do you mean ".plt.foo" matches ".plt" ?
> 
> I mean we just need .plt : { *(.plt) } , not .plt : { *(.plt) *(.plt.*) }.

But then, for example, if it gets generated, .plt.got ends up being
reported as an orphan...

> 
> The linker synthesized section for PLT entries is .plt, not suffixed.
> 
> > > .igot and .igot.plt are for non-preemptible STT_GNU_IFUNC in GNU ld (LLD
> > > just uses .got), which the kernel does not use. In addition, if .igot or

Right, the issue has been getting totally weird sections emitted by the
linker. If you're saying you'd rather those get reported as orphan
sections instead of being validated for being zero sized, and that works
for all the architectures, then okay.

> > > .igot.plt is ever non-empty, there will be .rela.* dynamic relocations
> > > leading to an assert failure anyway.
> >
> > I think at the time I was dealing with avoid multiple warnings out of
> > the linker, as I was getting orphan warnings in addition to the
> > non-empty warnings.
> >
> > >
> > > [1]: https://lore.kernel.org/all/20240207-s390-lld-and-orphan-warn-v1-6-8a665b3346ab@kernel.org/
> > >
> > > Signed-off-by: Fangrui Song <maskray@google.com>
> >
> > Is anything harmed by leaving all of this as-is?
> >
> > -Kees
> 
> No harm. But ports adopting --orphan-handling= (like s390) may copy
> the unneeded .rela_* .
> When people read .rela_*, they might think whether the kernel does
> anything special that
> .rela_* needs to be matched.

I added these because the were being generated. See commit d1c0272bc1c0
("x86/boot/compressed: Remove, discard, or assert for unwanted sections")

I don't want to suddenly start generating warnings for older/broken
linkers. (i.e. a change like this needs really careful testing, and that
needs to be detailed in the commit log.)

-Kees

-- 
Kees Cook

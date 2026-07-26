Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1EB280018
	for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 06:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785046144; cv=none; b=HMpKJs6KYVf1Fb76GKFRAywhgOJz9Zd/+iRIZvKctCpXJ60ENo2go/tDk0LkFwmqW58HEkxUdbSUz8PYD/pCiWT3cloI7pxv45YYiE1GusG36IeObCynG3udKLgR/xgPZNWu31TaTVDdL5VJZNPWNLbs70t7SQTy2TYuW4TIDTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785046144; c=relaxed/simple;
	bh=Z7TFJuHVHJKvY8/Mc6ddE/wit6HJie13aC7mOZ54YNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZltCVuEtBXVrkFTaYS3yMjr3XkTMmPztNXM3dwUtoA4h8m62B/QHXyYFsr8AxMGJ8bCpOJ3kmPD3KRHKuMGtoXpah4yrYLsw8FKXiXSBrZGcIdwoY3J8sINhKxA80QO7DLI4RZkDsmgxcXCJ7u/aW1n21drAhnk65KC+nCox05k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVimlzul; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVimlzul"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e0688b859so935304b3a.0
        for <llvm@lists.linux.dev>; Sat, 25 Jul 2026 23:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785046142; x=1785650942; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7UFhWQOa/vwyik9QrUHaltpmfCg9gV5b8FYD7Vbdi7U=;
        b=DVimlzul2fRc1PLxZtxNNJS5BokxTCkz3sS6UUaZwzZMA4/2BPS7dWOwlnjY3Gruza
         Jl2df60qDPMds3bspRhTGpzS7q5LupRKgPTiQG75nr76iPWaPoERHyIlmVBRoP6iUdWj
         ppYrprecWVN3xlwGUr6veUqa1KR5DM25nTPgT2oooP7IUWPcxYyM84TX22T3P5PZ+pjH
         Clo/USu7k6eV80JQa6ZN2vc6ld9IwHU2I9zIJ1aEHnWnH+Wf01+vvA1fVHvogojKK61B
         39uImDR/22FS/x2Qfs8DGyDGBRqPqf2D5ORsdh4SNoUHW9hlWCATfEofBT/+c8pL9e74
         64EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785046142; x=1785650942;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UFhWQOa/vwyik9QrUHaltpmfCg9gV5b8FYD7Vbdi7U=;
        b=NyDZaz2KmcQJXVMRbBvnQHtnM1nizi0a371kW9dsuWWe/t/6F7DhGvq8x8L/Usp032
         b8p0XfaecEZ/PHj1kTUyjLGP6ANbfTN8GvfmSxJ7xhU3SBFtSdSzGUVJrYHvEXLmhhCs
         ucJYHto4k2zDD+4NQBHFKXQF3O0FG5qNzlQrkNkqiFV8rm4vDFf2kNKxgXGibcsmY+62
         x3C1fX46ACVhhMjK8wcD8CwuGTVEdAKx6VpxrEYeDuuTeSlewiXbwP92T7Iekfu9SbFH
         hSX8k4bo6iipOP6hVmKsMU2oqBnf3laxq6e23AqDoTc6pUBQUusZX89pcIOZ1QJEx8aU
         yNCg==
X-Forwarded-Encrypted: i=1; AHgh+RoK5mOXt2a00lvrgFixmRQJmGpFXfXqAZSMKvAKl8glW5PcLD9siYm4NAs6dWGTGCzPW5XQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4vSp7NxTPQb73pkM4lRSUqf8shehhS9DrvVD49/My2G4wMnME
	gJCYZcoWZWmTTI5Ru9YolrWdcA+idOFtVYdjp5Db9O+w4Guw8rCsODdj
X-Gm-Gg: AR+sD10jg4h2k0bGl9zxfZSz4QUifgTsIG2ySjAkyn14Psy1n8WLgTl/YMGF6TIIb/m
	MlU07xyDc1g/ib2ZxreeI9i+YsX/vKmFw12vU+lxG6f5x+J4LwMM3HDaFIY1WOQZYrv2mv/hCZq
	oJR6ehefSrr5ot5Y3Xkw0MvUXHbxD67qVssZTOt5qspRliL3dc5qfzOHDGIsPjQ/YitoN2cBWbC
	rVkmBPyrRgyeeyVCjqL6XLIcevqKl1GJyHTanUfpko8NGy646ywsuqS88CVis3doy1KXoP3zdLL
	Q/opVmEYENEgbIFHdbF1gUrDVRLh6QVVN0npPasr9fWR5Hj/Q7DGuDo1TtW0KxkLHW6SufYz5u7
	9rnm4UMk0EKrxziOCzyR6bDdswdhR93FS9OBJc+PHfI++Jjil9TWLgWfU/LAA2DTcFoaGNnVqui
	JC5gbImR5G4Zf+KG/QCwSh4pO2UHjhBgPJyQ==
X-Received: by 2002:a05:6a00:390f:b0:847:8d54:f4f9 with SMTP id d2e1a72fcca58-84e595810c1mr3014064b3a.51.1785046142393;
        Sat, 25 Jul 2026 23:09:02 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1644sm1609938b3a.37.2026.07.25.23.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:09:01 -0700 (PDT)
Date: Sun, 26 Jul 2026 15:08:57 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, 
	"moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, stable@vger.kernel.org, Ard Biesheuvel <ardb@google.com>
Subject: Re: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels
 with Clang
Message-ID: <amWfjDyn0jrnIf63@buffalo-ssd>
References: <20260722172443.534251-1-akkun11.open@gmail.com>
 <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
 <amHYO1c-5vzqSekt@buffalo-ssd>
 <ef007a23-46bd-41d6-83ff-264831341093@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef007a23-46bd-41d6-83ff-264831341093@app.fastmail.com>

On Thu, Jul 23, 2026 at 11:53:14AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 23, 2026, at 11:15, Akari Tsuyukusa wrote:
> > Can you send your fix as PATCH?
> > I think your approach is better than mine.
> 
> I think we should wait for the llvm issue to be resolved first, to
> document whether this is considered a bug in the kernel or the
> assembler, and to see if any other kernel code may be affected
> by the same thing.
> 
> Looking around other .S files, I see the same
> pattern in stext(), cpu_resume_arm(), mcpm_entry_point(),
> all of which start in arm mode but end in thumb.

It's a LLVM bug.
The LLVM assembler source code explicitly mentions this limitation:

  ///
  /// FIXME: there is a corner case where the state is changed in between the
  /// label definition and the .type directive. This is not expected to occur
  /// in practice, and handling it would require the backend to track IsThumb
  /// for every label.
  ///

https://github.com/llvm/llvm-project/pull/211641/changes

However, it will take some time for an LLVM release with this fix to
become available. Since LLVM (>=15.0.0) is an officially supported
toolchain, leaving the kernel with bug(s?) on supported LLVM versions
isn't ideal.
I think we should apply a workaround in the kernel for now.

Best Regards,
Akari

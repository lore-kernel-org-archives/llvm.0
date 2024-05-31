Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CAD7E788
	for <llvm@lists.linux.dev>; Fri, 31 May 2024 21:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717191610; cv=none; b=PKRS057qJrknUSfNuWZKDJJD1awKq8/vxp/uYb+27oOGY27W3Si1ARjlf+U++2M+NmXlq4cCs4UOHDxuqt490EK/rWAXrlUI3H0KQ/QxDXknLlz7DmmfctQYYRSucnC+7ZKBlVynfbvLIPWOHJo3vXuMna7scRMbKl8okVuwhGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717191610; c=relaxed/simple;
	bh=+mZi4Mdqo9n1pYWIVXTvtvOG+w0wloffDYS2OkMLVMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LyL7/MZdNZzBkNkmnOmBT9cETSfp9SF3BFORRcnS3gCJ0pbC2skBm4kvXRH5r8sX4mUu0ZLLwQSGCFyHRHb8Sdc2cRiLx5BoVu6cQTfqyPkC7aZG6UOO0kt28TUF3blagu+ePZKXapnPmVV+fyQl5MDZW2li6D79N++OWPfd1kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Rghcd41w; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Rghcd41w"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f630e35a01so12213065ad.1
        for <llvm@lists.linux.dev>; Fri, 31 May 2024 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717191608; x=1717796408; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbxzTHPbCC9+OSlgnBZBAHLV896CAURuJytC4yPNa7k=;
        b=Rghcd41w/TQcgESrNu2XIdXPLNmqRZshjBsO8OnrA4y85uq3VKRafYJzOlPRFlFlYm
         br8EMzivDztGSpaEFiPpc1WOwdQD7ZfUogfjizeXGYdihsbW8Mvvb1AxZM8g1A9cOWLF
         b9G6etaguVjTO+oa6lYa1F3LkbU1uZly2hHr8G6rPljHn2PfI+/IAyDMYQMPgFqAaND6
         SxthbUeUONHCWf51SoexVm+RhaGXTA1v98JN2RSqUatv92wOAVJi13ntSk7Fgfmv8+lm
         TZe88nEF/eKEkFIQDqIz+NkzqyadZ6m5cUNrbBA7m8Uh9Sehb4IZqlTryYiWQ2JaqLbM
         PYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717191608; x=1717796408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbxzTHPbCC9+OSlgnBZBAHLV896CAURuJytC4yPNa7k=;
        b=ScRMuHUE78kxVcK/1ecaDaOS1FWl1Okw45OdD/plPnqCzgYJZFkmcpfZbVBZt9KnXr
         mQIdm6fJq4O7+odMMlDXxg/cZJLwx2LKyvzSzTC/vdTqOoK+zw9Nym4L1NpQ7A+f1GZA
         VYj7qIFnMRAAXYdx1zG3LQnF5UcDerFwEmpggjkI0CG1i4N6HFH9dcXZdCy7Rn1ijgim
         qtEtnSCSesI/JUk/gdUHWZtEVtAKcj5m9DaDtTfpFf8ydxbU5uL24XKYsbb9gt6xWlJk
         zBYF3nJZ2tEln52p9dl3mjca0G5fayDCsn2+8y/kwmti9dISVbnwIaNRbs8rkEBsH8xf
         /ARQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm7r7097EsdyFpruziX0yniAsc3y1FURyni0G5q0r9xMTXSPQY1TpQjpA4OzEy4vEFXH4sZH0ebUN0G+GFA1ve/o3JAA==
X-Gm-Message-State: AOJu0YwWM3dVvYqF9hj10h0cZymEuSZoLK7lWbqKDS+Q8k+sDjlDBiVd
	ryzHzCA4EYEz5IUNOY8vIy872yOmU9NERshA+hoAasMWU+pwSabwS3+bV+nu5DQ=
X-Google-Smtp-Source: AGHT+IH2kNxy+DP2BxFop3mrfOTKvOonyr2h+6QlVJwdZ5WJPUZsjyyTJNbm91WWm+wlyt9/NWx0sA==
X-Received: by 2002:a17:902:f9ce:b0:1f4:b7ff:ac41 with SMTP id d9443c01a7336-1f63701f241mr26562825ad.36.1717191608125;
        Fri, 31 May 2024 14:40:08 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:4d3b:392b:5722:91c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63235ae5csm21720615ad.79.2024.05.31.14.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 14:40:07 -0700 (PDT)
Date: Fri, 31 May 2024 14:40:05 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <ZlpDtR7ch+nE08lm@ghost>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <ZlowwohstpT0sJVl@ghost>
 <20240531-cough-yearling-bdfd49244885@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-cough-yearling-bdfd49244885@spud>

On Fri, May 31, 2024 at 10:36:46PM +0100, Conor Dooley wrote:
> On Fri, May 31, 2024 at 01:19:14PM -0700, Charlie Jenkins wrote:
> > On Fri, May 31, 2024 at 06:31:09PM +0100, Conor Dooley wrote:
> > > On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
> > > > Dectect the Zkr extension and use it to seed the kernel base address.
> > > > 
> > > > Detection of the extension can not be done in the typical fashion, as
> > > > this is very early in the boot process. Instead, add a trap handler
> > > > and run it to see if the extension is present.
> > > 
> > > You can't rely on the lack of a trap meaning that Zkr is present unless
> > > you know that the platform implements Ssstrict. The CSR with that number
> > > could do anything if not Ssstrict compliant, so this approach gets a
> > > nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
> > > it, so you're stuck with getting that information from firmware.
> > 
> > The Scalar Cryptography v1.0.1 spec says "If Zkr is not implemented, the
> > [s,u]seed bits must be hardwired to zero". It also says "Without the
> > corresponding access control bit set to 1, any attempted access to seed
> > from U, S, or HS modes will raise an illegal instruction exception."
> > 
> > There is a slight nuance here as the definition of Ssstrict is:
> > 
> > "No non-conforming extensions are present. Attempts to execute
> > unimplemented opcodes or access unimplemented CSRs in the standard or
> > reserved encoding spaces raises an illegal instruction exception that
> > results in a contained trap to the supervisor-mode trap handler."
> > 
> > The trap that Jesse is relying on in the code here is related to access
> > bits and not related to the CSR being unimplemented. Since the access
> > bits are required to be 0 on an implementation without Zkr, it is
> > required to trap if seed is accessed, regardless of Ssstrict.
> > 
> > The situation here is slightly odd because the spec is defining behavior
> > for what to do if the extension is not supported, and requires
> > implementations to follow this aspect of the Scalar Cryptography spec
> > even though they may not implement any of the instructions in the spec.
> 
> Firstly, you absolutely cannot rely on the behaviour defined by a new
> extension by systems that implement a version of the ISA that predates
> it. Secondly, we're talking about non-conforming implementations that
> use a reserved CSR number for other purposes, you cannot rely on the
> behaviour that the Scalar Crypto spec prescribes for access to the
> register.

Yes that is definitely a slippery slope.

> 
> "Non-conforming" is also a moving target btw - the Andes PMU (I think
> it's that) uses an interrupt number that was moved from "platform
> specific use" to "reserved" by the AIA spec. If you only looked the
> current specs, the Andes PMU is a "non-conforming extension" but at the
> time that it was created it was compliant. I think we're gonna have a
> fun conversation defining what "Ssstrict" actually means when someone
> actually tries to document that.

Sounds fun ;)

> 
> > > For DT systems, you can actually parse the DT in the pi, we do it to get
> > > the kaslr seed if present, so you can actually check for Zkr. With ACPI
> > > I have no idea how you can get that information, I amn't an ACPI-ist.
> > 
> > It is feasible to check if Zkr is present in the device tree at this
> > stage in boot, but at first glance does not seem feasible to read the
> > ACPI tables this early.
> > 
> > The CSR being read is just for entropy so even if the seed CSR doesn't
> > trap and provides an arbitrary value on an implementation that does not
> > support Zkr, it can still be used as a source of entropy. If the
> > implementation does trap, the entropy will be set to 0 which is just a
> > different hard-coded arbitrary value. 
> 
> Right. I can see value in doing something that may contain entropy, and
> is at worst no better than the 0 we can currently get. But the patch
> we're talking about here mentions nothing of the sort, it presents itself
> as detection of Zkr and an actually random number - but all it actually
> detects is whether or not the CSR at CSR_SEED traps.
> 
> To be acceptable, the patch would need to stop claiming that it is a valid
> way to detect Zkr. The commit message, and a comment, must also explain
> what may happen on systems that do not implement Zkr as you have done
> here.
> For example, `if (!riscv_has_zkr()) return 0` would have to be something
> like `if (riscv_csr_seed_traps()) return 0`.

That is reasonable, thank you for your input!

- Charlie

> 
> Thanks,
> Conor.



Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFCD1DDA18
	for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 06:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317320; cv=none; b=t6Tg0VdOqiQR/oGw9PP3ftkRx+T/wMi/rTUneDs54B69txV7fe45QF/t3pKpETn6TnZbTb4XQBhCIYs7FWfcWA3dPOEFe+fLp7jLh0bxiYlh1L/9AoCNwScdxkumNDDLBDZ1aIAbBpmZTKCKszPOjKWlL9nW2c+0ZbogBq3NM7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317320; c=relaxed/simple;
	bh=UjlgwLbgeh6LAkjBfXyoi1ibUIo+DP0JvbI95ZXgWUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dP+XAwxEIAac5v+AswymnX792DCScD0OViJBcnYORtuvXb40RRjqCsZ/6JnJCMBHI0wHZz/R/6z5H5+4eMTA5dvWV4uRpWghIT9oy9FUjAjX32yx9HeyNL8PDccmio/fhZBuhCFE7Wqe+Um5EjoZumTSCGMlFfX2TbFlzieU9Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6DxJH6S; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6DxJH6S"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so558679eec.3
        for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 23:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790317315; x=1790922115; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=peRJubAzt5CBA3DlGa/amJu9ZBZekocmcGMZ2nqjKzw=;
        b=i6DxJH6S4RY6wblKE1K2aawshPNQmNLFDOqv6ZSpBNervaewWnGGZH8VvC500Gj4dF
         q0fqU+WugsBH7WwA71W2jRbXXpGiM1k1zUmJR5X8re3iiLMog7wHjrgb0b+TLxQPmGhL
         oaZDt/1zlsyA+RkLJXlrogUlNPa8y259/U2jHOkVElX5g4/bWvh2Fbw5QtpWaX2M0y8v
         KRGlwDNlMf/T2RMi031zmVfPHpkDFHlTD/mXccbSx3gAhU0CNLLpqXaCFBppzgDJNxNp
         7dBHyMdSqsrzzHK29+I92ByxzHRrulPuEJfWvmzlDYhrB8yXj2T1RQ0GlpUudkehqoOL
         SzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790317315; x=1790922115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=peRJubAzt5CBA3DlGa/amJu9ZBZekocmcGMZ2nqjKzw=;
        b=Y0p4QWORDwaxwGfH/PnXUNLeEa8st5Og229z2+qm+Y9DSIiCsuQG2pJsjTbh5KqHvp
         T4whKQUVKoh2ekXIxbrahtEybXuzykRSxCOnLir3gbgZgMzq0taXHkAXh9yy1t5KXsRn
         XcZZRpQmQPEseXHgrtIqew3pqrDp3uZpXHp8MkFfs9RFwL1iVx+bzXtmX/rFXxCFO+qI
         eqcOdLV8WWhd5aGD169BR1zFesqB6rXmDSN55pKPZZrsxuIpaV74xsDAnsEYF8dnN8Po
         YciLaOFFatKx69C07hLhKpnA8hWj299tl4Sb08eabccl/SxuBte5nbGRMi0p0VUsy6+9
         xb+A==
X-Forwarded-Encrypted: i=1; AKwUvBwyb5jCQ4CLFFfa9Te3KAuCWtmKDUJ1CcNJJ73jGOVzTe++4BZwlFB6vsriD7oMpP3CzPON@lists.linux.dev
X-Gm-Message-State: AFuF++kAaCOZRgXLudPLC1/iylqpXy0KAhndmhjhTfXfBdV5ggAEWoBE
	pFBXdigbHnSlL7nRGwYieQg9ubuJwbs1eATZZUI1alj/1A4n9jFRukxW
X-Gm-Gg: AYBFou0+vuwmpODodWZQhm9rtLkEpj3RSRJSwiaes9VCJUYeo496EWCoWA/EruvBNL8
	vwZmzNRfSUdPmvHV/LOoJLE4UUSowZfK8Uxr+WW77MlgdXQP+bQYJn2beEZdrarsi6cadNbe1TP
	ATWd6br9kiXiatDcWmp2LyI+HLts4b3s1KinHQdqn5E9IEZF7ylzhIakBOTSp3wVMEWTpxPQzNL
	FW1iYQillTAPHI+5ZUgunm3nMValcznlvzwBlHl+t3Ytg1ey2QgHpG1kvcvYxtprHm5FKKDSJWR
	gyPhm3BXeMLuP6VHw9qokiNv3QCv5zQKHarzlT0AennxtJ7mYnAzp8/ZghNaWQRZ6hUz+tTLyG1
	eKjABLgSODKhobQDJmzcab97uc7I86Zb3yU5rmvroBtb24m1Cb7nKb29WDHW/sCiDuoPr5aw2XU
	LNe19k/fua+pU+0A24oAi7LUa6gj7dMwrbQsmvxcv7GvyxBYo5CyRlUhuQQOKKbtgBo7dQ+D9AK
	fKWZxPmk/pEYsA5cgSpMXA+dTkfNyd2i+DE4jh7yCFN
X-Received: by 2002:a05:7300:dd47:b0:342:94b:aa28 with SMTP id 5a478bee46e88-342095b08cemr188044eec.27.1790317315073;
        Thu, 24 Sep 2026 23:21:55 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm5598126eec.9.2026.09.24.23.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:21:54 -0700 (PDT)
Date: Fri, 25 Sep 2026 11:51:33 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com, 
	sshegde@linux.ibm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, jszhang@kernel.org, japo@linux.ibm.com, 
	peterz@infradead.org, jpoimboe@kernel.org, seanjc@google.com, pmladek@suse.com, 
	thuth@redhat.com, ynorov@nvidia.com, joelagnelf@nvidia.com, david@davidgow.net, 
	fujita.tomonori@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arYR4GrzNnFko7XO@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <arUYLsJJewE--wqo@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arUYLsJJewE--wqo@J2N7QTR9R3>

On Thu, Sep 24, 2026 at 01:31:42PM +0100, Mark Rutland wrote:
> On Tue, Sep 22, 2026 at 11:20:00AM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > Verify that the __bug_table entry emitted by ARCH_WARN_ASM has a correct
> > bug_addr displacement — i.e. the arch's trap label reference resolves to
> > the trap instruction — by calling find_bug() with the exact virtual address
> > of the trap, mirroring what the real trap handler does.
> > 
> > To support all architectures, each arch that implements ARCH_WARN_ASM now
> > defines ARCH_WARN_ASM_TRAP_LABEL, a string constant naming the local label
> > at which the trap instruction is placed:
> > 
> >   x86       "1"     (ud2 at label 1:)
> >   powerpc   "1"     (twi at label 1:)
> >   riscv     "1"     (ebreak at label 1:)
> >   arm64     "14471" (brk placed at 14471: by __BUG_ENTRY_END)
> >   s390      "0"     (mc at label 0:)
> 
> I'm not a fan of exposing such a low-level implementation detail out of
> the architecture code, and I don't think we should expose this.
> 
> What exactly are you trying to verify here, and why? Has there been
> some _specific_ issue on powerpc that caused you to look at this?
> 
> Mark.

Hey Mark,

During implementing ARCH_WARN_ASM for rust I broke the bug entry for
powerpc so I wrote this to verify. I sent it out mainly for ppc but
few people wanted that if it needed it should be done for all archs.
So separated this thing and sent it out as an RFC to check whether
other archs want this or not.

Regards,
Mukesh

Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAA41990C1
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865465; cv=none; b=sjC3g6uaxWVIxFsR2faQtiMyP2Wei0tJCyAprNlDFI9RspJvOacAhdXFR5qyFi96G8eaaKGRlNoaHG8yJr9mNTnsIjngjVoeZilCDHtikoqlZSltV1Dn7cu1EUE2PHwmZKSrWEUF8JeAI2r/7PwWMDIS/YCeZHH53t8UnDyZ7ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865465; c=relaxed/simple;
	bh=0ttuWAvJobLlg56YrOVOmHOt13ZH7wD3gGicocchpzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ReZwOLoUVkuh7Ehv+uvyJKgYeltai0I+J2pkabiI8qaKXR4n2o2+cmLBNIaEx0ZJ7IGzsMDQ9D2akwEM2LvbqXOsSAPitZqXxtwMqFP93YM1eUdGEmEIUKdCkBSBWW4huOdOl6dZnXmsn++cfB/HASc0bIbOQWHDrp/Sd3+YFms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klDt5Uzm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klDt5Uzm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so8331825e9.1
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738865461; x=1739470261; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ttuWAvJobLlg56YrOVOmHOt13ZH7wD3gGicocchpzQ=;
        b=klDt5Uzm3G+vvjLUJa/pkdDCvGPlrU24y8XQk9LphJIMx8Pz0ezlp4Uvne4vtvr4bm
         S1s18/1OZm0uYCgnl+4/yBHyW6laalLGvn8HFy2WGqpTWOChkX74ZI6D87ZPfauI3DNf
         6s6R8ktoSv83gMOZAWETaC3A5BvoZanpYq1+1V75XBezxPDtMTrTXMiBYT3dFgtPpWDd
         NrpSN//kBiFKcsQUZHp8wr856zf0s5D4zJuueHCBuTlPmULJ0miDRq46AgMXWdYSZrEc
         j5IDGGxSsO6WmST3T1NEn3fp6RnlgYvHHxymJeOiQvhLaYakY2nMNMkF7YazsPoZ01q6
         KlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865461; x=1739470261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ttuWAvJobLlg56YrOVOmHOt13ZH7wD3gGicocchpzQ=;
        b=TdMHhegOXbGaOdtrvWd76zMN2kiEct3Om/2DO1LB8vpxDOk/oAyESrPwJkfApFnrc6
         JigU8n3TvcV009J1yTfQQ3IRizqxAcWiG9hE+rUFv4IVv/XO7W0xAM+lGNvmCSzstiRe
         ZbGlZeSnvIaJnZO5SVqpObORwbQn4ldlTJGwFWB2ZlU67ceZ+TBbjcMzdXM2k0jGjfQr
         k/IRvFavbxYdl0zZ4bj9tP67cLUorq6sAhiSuCyC/m77bpoKmtnVu5xhpxo2WtQQEEQ/
         6DPgkzuaahvxRGwf4W0SgNCR9ck3fHu5I7DBGSVKAcaT4Qt0LGEm8hotfQp9L0Xwoei3
         WMHg==
X-Forwarded-Encrypted: i=1; AJvYcCUGyEBfCsXWpdCxYQeLGMqHWHYPMB3ZR3HA7Dn8nJw09md0bA039FK9W7ZY9rv/crb7wkaq@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2ZjpuT7K5q6NxbIxiRywXxA4p2aowFscx+1QZp9p/mLgWWfJu
	jBYEIcA8gF1ojOY9LMeryQhwxsbNxo5d5AhvNQZW1AufYdkdTvuTWOprjRy4XWG3E8yvoz02VdP
	h9rVZ8zboTkbjjf3YCaWros/XYbA=
X-Gm-Gg: ASbGncvgt+FZ18w8XWKiBNw26a63UuueE1P7bKHQqwaxZbKlMhL7dNRdFWxr+z3rMza
	FxeSypWvsvKLm9nH4nrbptlB6PLbSJQNAiRZoxi95q+i2ycr0951sI1hNZjUKLdm2QJ2E96dxfA
	==
X-Google-Smtp-Source: AGHT+IGjlT6+E7s19Biqi+L66hD4CAB7+vWZ8IxthOzy0VOqSvauytoG4hxkI1K7a56pR3Wt3sBZqEuajrgrIm/RerQ=
X-Received: by 2002:a5d:6da4:0:b0:38c:5b52:3a5e with SMTP id
 ffacd0b85a97d-38dc8dc342amr4349f8f.8.1738865461496; Thu, 06 Feb 2025 10:11:01
 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZd1dpqv+rM2jD1fNGvhU_0+6c8MjzsgEsi2V-RkHVteJg@mail.gmail.com> <cj2w476ui6g6bjtrnmhozgruhudjx7dbeifxtx4q26c4sqmobt@ill63v5yc3ke>
In-Reply-To: <cj2w476ui6g6bjtrnmhozgruhudjx7dbeifxtx4q26c4sqmobt@ill63v5yc3ke>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 19:10:50 +0100
X-Gm-Features: AWEUYZkYq87i7dcuraqL9nv2V2zM6XbkuTsSw_RSaFUD-ppNitROYVtIB8RMtyU
Message-ID: <CA+fCnZfTvFzX32ZU=Xa0qsNACM4Y1vA1xQDtJkhhk1fYH1QxRA@mail.gmail.com>
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 11:41=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >I started reviewing the patches, but this is somewhat complicated, as
> >the dense mode changes are squashed together with the generic ones for
> >x86 support. Could you please split this series into 2? Or at least
> >reorder the patches so that everything needed for basic x86 support
> >comes first and can be reviewed and tested separately.
>
> I'll try reordering first and see if it looks nice. Since the dense mode =
would
> make some parts arch specific I think it's better to have the two parts i=
n one
> series for easier reference. But if it turns out more convoluted I'll jus=
t split
> it as you suggested.

Yes, please do. I also think if you split the series, we can land the
basic x86 support fairly quickly, or at least I can do the review and
give the ack from the KASAN side. For the dense mode part, I'd like to
also hear the opinion of other KASAN developers wrt the overall
design.

> >Also feel free to drop the dependency on that risc-v series, as it
> >doesn't get updated very often. But up to you.
>
> Okay, I was mostly interested in the patch that redefines KASAN_SHADOW_EN=
D as
> KASAN_SHADOW_OFFSET and then gets shadow addresses by using a signed offs=
et. But
> I suppose I can just take that patch and prepend my series with that? (af=
ter
> applying your comments from that series)

Sounds good to me!

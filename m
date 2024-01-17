Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895E18D
	for <llvm@lists.linux.dev>; Wed, 17 Jan 2024 00:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705450083; cv=none; b=p9ww3Cwip8xkDybiycVRis9pq0jELlwEueTDKtEPvjuGXXU/S51ZBORe9/lPjmJghMffwjGHv5GbrK6aHaxhvNXx6phYMQ7ufW3gufIO+IggwycpFVnHGE01wCre1nw0pEI55vTpgKIEPa0Z5HZzU71T8WinQ1r5j+Or5q0ZeS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705450083; c=relaxed/simple;
	bh=6upvCtqLjlcvlesxR9kBuGN9SjzKudfUSX/ZwwWZTf0=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=Bt/91yMO8FAyZ4UcLpcKv4o8Miu99u00SQfQECIZBiEQJGvbIMNn04IB+ebYhKNwMV/1vqYRTKVB4UNGMPS8B8TI4LyAgAnTEOz3SToUuzaPXi0JgaT70MCVzjPqSmUKt3qOpQ2ygEIPVQ7LVtLcQBULS+yEh1/s4ELNBG8S1Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OMroT9Ee; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OMroT9Ee"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d2a1d0b916so268809241.0
        for <llvm@lists.linux.dev>; Tue, 16 Jan 2024 16:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705450080; x=1706054880; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6upvCtqLjlcvlesxR9kBuGN9SjzKudfUSX/ZwwWZTf0=;
        b=OMroT9EewVLoiE90Tqg4lVFPCJgwfeEgRh/sZAiiYTTKV2fwwfb8SBV3bl3dlKxAm8
         8vXQzSw/62OiQmRqSh+QgnCOLPjMNmKGGT0vndXYY3A7My8ZLAANTy9JNjzl2C/5bx6m
         oS0CcbVXbptJK2ONnap75lq6GEdjbgLnjGc8SEyybVJV7ARU09IrSpdam/rkFUzI3UI7
         x+rYYdq2BYgx7Bw7bL3mPgMJaRRNnbTJTnwuA5XPZO/B2ObzJqme27aApkGmDj29OEIm
         ncgi4a5G3VQO6HWX+D2+adb98Y33BL56UNaZK+IN3J5KU23ZIeVXaZkpbk69pWcGLYg5
         hp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705450080; x=1706054880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6upvCtqLjlcvlesxR9kBuGN9SjzKudfUSX/ZwwWZTf0=;
        b=QL/x+KU7lSi8gpaeYs1w1/FoHUyYJIRFmWIcAHSTXvX53ypqGW5Sfm1Fuf2Bc+wSSB
         C42Is5HLn/zvuQaLJV96ApH9j7AqpSUQk1qC/zQyuyywgTpIKBmWa6rwrExUv4omBQJw
         o4zCgUkyyZWW/PTq5i+AgnOA6ne+osv/AAGgzUjf2V0OwtnlEwkwMqUJAhKwC4SolvKx
         wC8J8zjFubNK/dVxvlonrS/F3cpVR7i177OC/MQS2jG4+qiw6wfpJWZ5Ow2u5Sw/n1V3
         jQiUhZghm8HmwbXRGdBbny4n68uDLK0yw0/y1xDEZgEFdaQV2MGOi7ud3rCWDPb951vm
         nAmQ==
X-Gm-Message-State: AOJu0Yz6NstpDs6zhepQ6yw2kRCvrXPyBZQ0EoZ9ciRHcVZXuJcL9UXe
	29yzmkeVrTXT43TC+pYUnMadG+Fk7l3E8cofv4ksUzc42tSx
X-Google-Smtp-Source: AGHT+IHr7lzQyz9jwW6UGOICXM7ITCqnEobPRCEMvsZFRSTl5bq/rJJXAaclo9WBisLE2K4+VHiQY7WqeSLKiU9GHr0=
X-Received: by 2002:a05:6102:3134:b0:467:dfa1:3186 with SMTP id
 f20-20020a056102313400b00467dfa13186mr4450748vsh.4.1705450080348; Tue, 16 Jan
 2024 16:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZZ7YuEexYSaZYmLK@tassilo> <20240111223650.3502633-1-kevinloughlin@google.com>
 <20240115204634.GHZaWZqsVyU_fvn_RW@fat_crate.local>
In-Reply-To: <20240115204634.GHZaWZqsVyU_fvn_RW@fat_crate.local>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Tue, 16 Jan 2024 16:07:49 -0800
Message-ID: <CAGdbjm+fMBnkKDVFpf-fAEbYxTUWR0od2JzTTbEMoPVS3J_Faw@mail.gmail.com>
Subject: Re: [RFC PATCH v2] x86/sev: enforce RIP-relative accesses in early
 SEV/SME code
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Kelley <mikelley@microsoft.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Arnd Bergmann <arnd@arndb.de>, Steve Rutherford <srutherford@google.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Yuntao Wang <ytcoode@gmail.com>, 
	Wang Jinchao <wangjinchao@xfusion.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Brian Gerst <brgerst@gmail.com>, Hugh Dickins <hughd@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Joerg Roedel <jroedel@suse.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Michael Roth <michael.roth@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-coco@lists.linux.dev, 
	Ashish Kalra <ashish.kalra@amd.com>, Andi Kleen <ak@linux.intel.com>, 
	Adam Dunlap <acdunlap@google.com>, Peter Gonda <pgonda@google.com>, Jacob Xu <jacobhxu@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 12:47=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Thu, Jan 11, 2024 at 10:36:50PM +0000, Kevin Loughlin wrote:
> > SEV/SME code can execute prior to page table fixups for kernel
> > relocation. However, as with global variables accessed in
> > __startup_64(), the compiler is not required to generate RIP-relative
> > accesses for SEV/SME global variables, causing certain flavors of SEV
> > hosts and guests built with clang to crash during boot.
>
> So, about that. If I understand my gcc toolchain folks correctly:
>
> mcmodel=3Dkernel - everything fits into the high 31 bit of the address
> space
>
> -fPIE/PIC - position independent
>
> And supplied both don't make a whole lotta of sense: if you're building
> position-independent, then mcmodel=3Dkernel would be overridden by the
> first.
>
> I have no clue why clang enabled it...
>
> So, *actually* the proper fix here should be not to add this "fixed_up"
> gunk everywhere but remove mcmodel=3Dkernel from the build and simply do
> -fPIE/PIC.

I believe that the key distinction is that using mcmodel=3Dkernel (upper
2 GB of address space) or the similar mcmodel=3Dsmall (lower 2 GB) means
the compiler *can* use RIP-relative addressing for globals (because
everything is within +/- 2GB of RIP) but is not *required* to do so.
In contrast, fPIE/fPIC *requires* relative addressing but does not
necessarily require a specific 2 GB placement range. Altogether, I do
think there are use cases for both options individually. I can't think
of a reason why gcc wouldn't be able to support mcmodel=3Dkernel in
conjunction with fPIE off the top of my head, but I admittedly haven't
looked into it; I simply observed that the combination is not
currently supported.

RE: compiling the whole x86-64 kernel with fPIE/fPIC, I believe the
required changes would be very extensive (see "[PATCH RFC 00/43]
x86/pie: Make kernel image's virtual address flexible" at
https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@antgroup.c=
om/).

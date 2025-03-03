Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEF01422DD
	for <llvm@lists.linux.dev>; Mon,  3 Mar 2025 20:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032914; cv=none; b=ZlMjbfEGzNry/6Lw4hzhLRKeRCybEyW8JwGhpOfOOlcQ3/xGgiAtJ00BJ4/otwukwkXrdi90D7Y0echs9YOVpod2X/rmlDpMyi1VyyAT2T1N8eHQYw7QLr+JVcEcXi98RePegnQdECkL2OlOvkyBeiFWmznCIqVJmPrVFxNwvaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032914; c=relaxed/simple;
	bh=a7tjVGX/fWg7trjOFWAiSMlw93q/R3mkYEIjqIsDTq4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l23kRd3yBbShUFBJmk3qRK11gE/teBPr/mztiN7YrXezGlBFANh4To8htxH9bGGVySsoO3yAueQwx677RMDZ4vt5ZNM5v/eDc9ce8TFNq+7N5l5u4uIj4jMpzL4ggjQYSneA+EgcEDf60WCyFXB9N97M6G+yH8qNvcxm/dQCvqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7Q1aPVT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7Q1aPVT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390f5f48eafso1374590f8f.0
        for <llvm@lists.linux.dev>; Mon, 03 Mar 2025 12:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032911; x=1741637711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HISwtThj2ckJiw/oP+EKb6mnu3LLOXUZTz/QPS9xm0=;
        b=Q7Q1aPVTtdxbJstbY2ecS0yjYoeEMNiimYaD6d1bj4xjcl74VtPMC9AKT5UngpcT5K
         pwsRDyjpu6eqebPJRl3I1PSSrqeZh0VRtga7oDg+wJkKndQDpKIgQ0X+xePLsTZZdvgz
         JkEXcg+a/D/JQmiLFM1zdrB/b4mV/XZhmPtKqBU6cejODxry8tlVOG2Vf44F+yKDZS9B
         C7Wb4f2yrI+DvhkllSYSn+UdwhYt1kRF+Gucjew+EgN+tNHfsXuj0L4FKIQS5/oPuem2
         wFADYBX+zb+f4/lUkdxfU88WgE9Ptr5HpeuAATcjZMzDIq9RF2UBevV+4mSv4GpXQeWF
         kKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032911; x=1741637711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HISwtThj2ckJiw/oP+EKb6mnu3LLOXUZTz/QPS9xm0=;
        b=tW5tGJ4ye7jKWWvLvKXTUogQ8U6ea6foifzORTW9h5Q4/x4Fst0JjxQgPnM7Wd8jr+
         D/78eBS5i+sX6jo1+h31f3WXlyFQtCpM2HdTRK5AP1KkIMa2tu2zalH7HyJFAUh/t51K
         zXZbRwVeqBA9S+ytASrzzVv8s4egp7P24E1NKySMicdpEE9v8ljHK6RHv8GO3yoP5SGk
         KRIvhhXzA0yEONYQ47Oi4FjAykjhS+zoEPSkDivrgBFcVxIsxYfZFprIGDe3UskSPEJL
         f/mQkoOSM8M7l27f8aE6/WYoV74y2jTDhgR2y2DSrOBSASxZnBhqZeQOgseGX6ndnlEH
         V1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuv0HQPFzCQZNOduRbLFY6+1zE2V60O6k2q2YrtzBoefuix5jusWcszNU+NSkQcU1Gsuze@lists.linux.dev
X-Gm-Message-State: AOJu0YyWK8rboSDcONKiFrPy24X+v+ZNuG5Lffrg/bpuZoubLhuoRtXw
	kxWtUqcxXtqNm7ysQFPS+OO83289U8pCHJTDthNkGYv4GrlPqspx
X-Gm-Gg: ASbGnctnJ0/JeRutsnro1I1sPP0R/YOrqJONHnNv991nav5BgLd6vmQYxe7YncY+VWo
	lYkOoR1ECXW/fHEyZoL9OeV+pxW5AsP3CfGqJ8g4ZXbmJivGH6omF6aXnHPSHbnmD63vvawi75I
	tTgcVybuNZpJh1rcrGzeG3q0MCByQg71I0wS6AF9X/ISqfDOQS9AwIX/3AYdU/fk1xBNyrV54Mi
	DAo6p0FRg+roYs96fF0aKcqvAQo7joQ7+He4Am3K7cwvPxRJAaRBwinp6sgcagKI9/eXIYtNcFd
	t7kyXJMsipPsApEoW03WHQAvLpvmOT0SgnGmuAIPY+Dq/7svGXkNqWrIcsEYz1zR0rNU50Lek4P
	pe67oY0g=
X-Google-Smtp-Source: AGHT+IEZcFcEwop42cS1sSfMsNTzvj2OjK7gTdBaNBV75eJDj3qnhXXQFC1+gCRjILig9VtED+gPKg==
X-Received: by 2002:a05:6000:4188:b0:390:ea4b:e89 with SMTP id ffacd0b85a97d-390eca26303mr11107065f8f.48.1741032910822;
        Mon, 03 Mar 2025 12:15:10 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbbff18b3sm62631025e9.24.2025.03.03.12.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:15:10 -0800 (PST)
Date: Mon, 3 Mar 2025 20:15:09 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Bill Wendling <morbo@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Eric Biggers <ebiggers@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt
 <justinstitt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>
Subject: Re: [PATCH v2] x86/crc32: use builtins to improve code generation
Message-ID: <20250303201509.32f6f062@pumpkin>
In-Reply-To: <CAGG=3QVkd9Vb9a=pQ=KwhKzGJXaS+6Mk5K+JtBqamj15MzT9mQ@mail.gmail.com>
References: <CAGG=3QVi27WRYVxmsk9+HLpJw9ZJrpfLjU8G4exuXm-vUA-KqQ@mail.gmail.com>
	<CAGG=3QVkd9Vb9a=pQ=KwhKzGJXaS+6Mk5K+JtBqamj15MzT9mQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Feb 2025 15:47:03 -0800
Bill Wendling <morbo@google.com> wrote:

> For both gcc and clang, crc32 builtins generate better code than the
> inline asm. GCC improves, removing unneeded "mov" instructions. Clang
> does the same and unrolls the loops. GCC has no changes on i386, but
> Clang's code generation is vastly improved, due to Clang's "rm"
> constraint issue.
> 
> The number of cycles improved by ~0.1% for GCC and ~1% for Clang, which
> is expected because of the "rm" issue. However, Clang's performance is
> better than GCC's by ~1.5%, most likely due to loop unrolling.

How much does it unroll?
How much you need depends on the latency of the crc32 instruction.
The copy of Agner's tables I have gives it a latency of 3 on
pretty much everything.
If you can only do one chained crc instruction every three clocks
it is hard to see how unrolling the loop will help.
Intel cpu (since sandy bridge) will run a two clock loop.
With three clocks to play with it should be easy (even for a compiler)
to generate a loop with no extra clock stalls.

Clearly if Clang decides to copy arguments to the stack an extra time
that will kill things. But in this case you want the "m" constraint
to directly read from the buffer (with a (reg,reg,8) addressing mode).

	David

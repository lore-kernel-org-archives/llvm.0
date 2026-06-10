Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449A43900F
	for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 15:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106616; cv=none; b=sllgQxhGd3ULXHPPKFJ52uGfHgDCCGic/WwYjcMSi6JbZjQu4s9ZwOh/k3R5rh1hBkrhZ21Dz880W1WJqEMWQ87pNGFQ3CXzpvNK0593idyPtUINxEn+bQ1tWmGCtTskXMeynPKBot+UZ2A/CXMthN2jino82m009bo0JK+T8AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106616; c=relaxed/simple;
	bh=Uy1jEB3de+y/OfX3XHuNkFbcXv0lUt9DsP84+jWEy24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfvRXZ8fmAxzoDu+s49TRPl41TVymMU7X8OixH8my7xmEnkCmclBsv4QS1LxLNnU34WdcoH5l0ov9fhv4+LYbY6ZUlk2vaVnP1Cs+ew3BZzIx6dQJvmmq/cxL2BBfuAsfjMmEYBgYQw0Qf96+s/QFJTTTJfTrk/BPKc/akxC5gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hnWyNs5Z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hnWyNs5Z"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c132ac5ec2so68697675ad.1
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 08:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781106613; x=1781711413; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N62HLkzXr48klLfiaIQLz719iwqu6H5OvWl+Uf/YYek=;
        b=hnWyNs5ZP0AXD6VCml3WbvTIpwI2Y8mRHEW3OxOBxY24wdSqaTS9r0Sg/w8Pe8Ec7x
         sGFOT7TaFOlWuX3Zn6w0z7qd0aLtuhFrl9fky7TxCerZkTGX6C1CnVqDxcREDfe9wJoD
         OzDfItXQELjDqwr0gcoYSunr3lZGcTiuxr3vFxYi4oVdGDm9cRWPkEB7+YdkdaGdcfIq
         1t5hTbjOplNJLy1ynV6/af1loziY/4HeO5LzrnqHjcq2bx1VjCe47pfth4CuLe2PUpYy
         7KITJVOl8dX5goEEH0kdZX0OyznWwAUjlRXOS37x6FoWh+/n5wrRuQd79xPMWPuXcBuF
         Scww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781106613; x=1781711413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N62HLkzXr48klLfiaIQLz719iwqu6H5OvWl+Uf/YYek=;
        b=HzRPL+kmFXqTcXSPoMB37rY/6QTGmDDV4+2o74HRqxxpWgj0R9/0WT5U/S6Dx02BcO
         4DzDpXf3DMqwFEv7R/0DiFGqPDwqoF4c89h+la7GkXMGF+WYCyEHcUuAu7L7dj5gStpp
         Di3i1s+HSoi9kkuLOvPZVZqmA3SFjTGF66wgjKTCnQU8JM4nhGPd+zegng4aO5RctszN
         26cXulra2qvS0X0/YfzrIYYryqOntEICEllEKN/yRQpdGIXY8CR7qYuWiNJZZvO2TrDJ
         xt1qYTwV0NMNbfgMlb4+h5wHbYfn3dLQwrZN90bDU9C1WWgNWkcMhq729cC+fs4n5pF1
         nbjw==
X-Forwarded-Encrypted: i=1; AFNElJ/OTBZUx76MFT8Lxyj7VpVmOO3sfXaxtbxsPgE4o2vz34oDtWvRF8P3v2w4f4BcKxu3A7pI@lists.linux.dev
X-Gm-Message-State: AOJu0YxnttGMtqt3+grjLd8OsUFRlT+AoRocPa7d2sgv/FmEvwfLwYCS
	YvJwMCBviflPzzrnxtbWdKflHT3csN38NgUnjxbKXy5uR1+HTZImfRT5tzQfxeR52A==
X-Gm-Gg: Acq92OG4Z1lVwIrpwK0U6v+aoEDY6M2d6h6qFxMpScAwoa/j21vmDqOY3hY0acmdFob
	4QIIqcjtD9/AeDL+lOk/vaPyOb6vw6TQCb39S6CyIGipB86BITDT2NHMOUoNYw5SeN2/TljP4Uv
	NkrNKic7tuwHqj+Gmh4HLwyqLu30YNgryf4h6H6th1fys51yrPrTyMfwjZMzZpbLIjz1pstWLZr
	QJdFDKqMNo3l77eEBHWExffM+bpX2zynN/WgxiHGFVPN7bjEfBjlsdGQS559fvOIxqKUHEwF057
	3tky64KyOEFFDPxraP6z3EaezXnq3QpLXOs9M/PPf4j3rEhGHbYrvkjdLspEUWSkwHkYmZ7qMc0
	98wyaUwyPIg5rdiGd+td/EUCbpMylFFBYZiy9DYnRksBaiu2o0QwiOqeJ9DwEOQKaMLB3ITfrNo
	HwItASZv5rndNmpr+oVpLilDMms/mL8O2XbV7Cp5etuI1uZJmqmK7utEDLDiSyzcw9kMYLvXQk/
	MxeQr8a3Jh3nHs8
X-Received: by 2002:a17:902:fc4c:b0:2c2:1982:527a with SMTP id d9443c01a7336-2c2198254f0mr234468445ad.16.1781106612163;
        Wed, 10 Jun 2026 08:50:12 -0700 (PDT)
Received: from google.com (112.173.50.34.bc.googleusercontent.com. [34.50.173.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm56793545ad.61.2026.06.10.08.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:50:11 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:50:07 +0000
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Subject: Re: [PATCH] MIPS: VDSO: Avoid including .got in dynamic segment
Message-ID: <aimHmmG48fpqtcJO@google.com>
References: <20260609-mips-vdso-fix-section-layout-v1-1-0e80ffadf7c7@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-mips-vdso-fix-section-layout-v1-1-0e80ffadf7c7@kernel.org>

On Tue, Jun 09, 2026 at 06:31:21PM -0700, Nathan Chancellor wrote:
> After commit 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into
> MIPS_GENERIC_GETTIMEOFDAY"), building ARCH=mips allnoconfig with LLVM=1
> shows some warnings from llvm-readelf while checking the VDSO for
> dynamic relocations:
> 
>   llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': invalid PT_DYNAMIC size (0xa4)
>   llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': PT_DYNAMIC dynamic table is invalid: SHT_DYNAMIC will be used
> 
> The blamed commit alters the link order of objects into vdso.so.raw,
> placing vgettimeofday.o after sigreturn.o. This ultimately results in
> the .text section shrinking slightly in size, which in turn changes the
> offset of the .dynamic section.
> 
>   -  [ 9] .text             PROGBITS        000002f0 0002f0 000930 00  AX  0   0 16
>   -  [10] .dynamic          DYNAMIC         00000c20 000c20 000090 08   A  5   0  4
>   +  [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
>   +  [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4
> 
> Changing the offset of the .dynamic section causes the dynamic segment
> size to grow by the same amount, which triggers a warning in
> llvm-readelf because PT_DYNAMIC's p_filesz (0xa4) is no longer a
> multiple of its sh_entsize (8):
> 
>   -  DYNAMIC        0x000c20 0x00000c20 0x00000c20 0x00098 0x00098 R   0x10
>   +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10
> 
> The size of the dynamic segment was already incorrect before the blamed
> comment, as it should be 0x90 like the .dynamic section above (18
> entries at 8 bytes per entry); it just so happens that 0x98 % 8 is 0,
> whereas 0xa4 % 8 is 4, so there was no warning.
> 
> Looking at the section to segment mapping of the dynamic segment reveals
> that it includes the .got section, as it is implicitly placed after
> .dynamic by ld.lld's orphan section heuristics and inherits its segments
> from the linker script.
> 
>   [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
>   [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4
>   [11] .got              PROGBITS        00000cb0 000cb0 000008 00 WAp  0   0 16
> 
>   Section to Segment mapping:
>    Segment Sections...
>     00     .mips_abiflags
>     01     .reginfo
>     02     .mips_abiflags .reginfo .hash .dynsym .dynstr .gnu.version .gnu.version_d .note .text .dynamic .got
>     03     .dynamic .got
>     04     .note
> 
> Explicitly describe the .got section in the MIPS VDSO linker script
> after .rodata, which switches back to the default text segment,
> resulting in a dynamic segment that is the exact size of the .dynamic
> section as expected with no other layout changes.
> 
>   -  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10
>   +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x00090 0x00090 R   0x4
> 
>   -   03     .dynamic .got
>   +   03     .dynamic
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2166
> Fixes: 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into MIPS_GENERIC_GETTIMEOFDAY")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> The fixes tag feels a little strong since it seems like it has just been
> luck up until this point that there has been no warning but I decided to
> be conservative and include it regardless. Feel free to remove it if you
> see fit.
> 
> I think this should go via timers/vdso with the blamed commit. I plan to
> send a follow up series for 7.3 to add '--orphan-handling' to the MIPS
> VDSO to avoid issues like this in the future but that can go via the
> MIPS tree, as it is not really a fix and I will need to properly test
> it.
> ---
>  arch/mips/vdso/vdso.lds.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
> index 05badf3ae0ff..278ab6444e98 100644
> --- a/arch/mips/vdso/vdso.lds.S
> +++ b/arch/mips/vdso/vdso.lds.S
> @@ -56,6 +56,7 @@ SECTIONS
>  	.dynamic	: { *(.dynamic) }		:text :dynamic
>  
>  	.rodata		: { *(.rodata*) }		:text
> +	.got		: { *(.got) }
>  
>  	_end = .;
>  	PROVIDE(end = .);
> 
> ---
> base-commit: 13f6218e6fe79dc64aed76d738b765b45f62492b
> change-id: 20260608-mips-vdso-fix-section-layout-262bc18d0c29
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 

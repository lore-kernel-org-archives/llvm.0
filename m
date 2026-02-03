Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4AD25776
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 00:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770163971; cv=none; b=rK4mtOIyum9WNctjbIv3bAcS1r1Pw2DMtdZw2FlyiwJR8HVM72MZcvWkMyhB8qEnkE5/OHpDwpUkV1d51i/BrvW+CjcmjapVpO7yqiX2wuGhF3YTLHqXcQa5CbMHHl2ZLkX4Ud6dzeuGv8E0h31n6EFYfCSVkhucOMu69dl3SzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770163971; c=relaxed/simple;
	bh=z1YMuEvB+WobiLyte1+fX5m3PbH/vX9UhNhRHJWTihk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c36fXPyGXzB2ex+GLxTUfgtaNbNk5Qkt0Ft2HNhyH2N8zqMjHEsl/9GQFzSxrVE19AzKRv5RilOj7aIJsXyB8hl37hI4GCkHEZ1FmkS/fcB7VQVRNUxQ/c2zXgCQwNyoZ+HfSDwhcdsi0PUYPDahzy+1jptwd0DAiumIfwLAYOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoPRHqEu; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoPRHqEu"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b883787268fso895370866b.3
        for <llvm@lists.linux.dev>; Tue, 03 Feb 2026 16:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770163969; x=1770768769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgKK3ByONbvoWC+ll8e6+//MuLfVWAgLVs4G9qm5feQ=;
        b=AoPRHqEucPySicHp5AthBvI15YMY+froFcXZAZR9kIgNXRivXwOeq9SR7HDKxzx6SD
         3pbL6yiMQwrNkPkQWto05Ul5QyVw5cqkOqoQ98qRBSOqwqLduSulsmXHKKdtwqhGBRkL
         /RTnA1dJYIfx1DW+cUObFNjfFSNncvZIVXeqjjqCg9dtvkskIM11EBHP8DE0eMKCZRng
         IDrn58DcE0vhT9QAqfXET84donmwOpxbkqx/+2J4pbKczLBr84+7DNsqWthQMDlbOakl
         pSwwRPfr0rSgAWupkFWM3JsVBgONJSpIqCDruRpE+OH03aCRXiVSsbBVNys4j7pzpq4n
         5gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770163969; x=1770768769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YgKK3ByONbvoWC+ll8e6+//MuLfVWAgLVs4G9qm5feQ=;
        b=wO2tLbmrj0ycuu/QxYH4aga4XRGRmjr3+SIHV5xGpeNA0daQYhh/pzXuzj0gpCoF53
         D7/dKdowZqQKEJq70y7rp4Rt50waRbio5oK/6c7EaO35P4JthxD2OMrKX6PjyaNCgcK0
         cnyIb/Xmzh7QfN1zJ91ZiOO7jovSJBDE1hHe6q3M//LSn+XrJ/oWUQObnUQZAgjN5TIz
         VHa2/luwkygrtjnLzchhfmz11JLIKxZNPuPM0LCpGetEPYyEhoEpN2tkc/tdTYkQIRub
         jfyxPuEGcWfObMnyCpwDkWBnMya/+H9l4zPxbRnCCBTLer9VB3xNRFvZvz4pGY6jF7il
         yFlg==
X-Forwarded-Encrypted: i=1; AJvYcCWRIdjcugLJ/bus8OHCis7rsZ9cjj79atdQWrSw+2vRb/nOzzQydBxSSFfPfNVqkQEpmQWe@lists.linux.dev
X-Gm-Message-State: AOJu0YyT6QAkmrRW8XNYD5CyiryGratqfzNUvz+D6NRFsoeWa1ewhJhO
	JAX2lrJmSI55YcP4CB847svWk6OXOX0dyvX3WcBoocsXJDBckgJ4dJ7hoNxcexqd
X-Gm-Gg: AZuq6aKi+JpOZIGXsae4Z8J2+Kfm+QMEOOMXpkMKvL+HMaYAxD+ivitUP7q3/rCE0CQ
	4fA7L3EXIHNMn9/dUE1brjWkt3HbcxfbrXXcd9PME0mKpv9J+zwDwd3OyopgmihwpzaIDF0mbNw
	aQafBm+8pki6lTxKYOQAfVHJEv84Bp57slC+FVrNsA3mofLJn/2qFNYJxgnDg+Dejbwmu68NHX3
	MCGqjyJqnzapVnXG5KL2FvvDR6XHHGgsrUYrBSPZfT1B06Gm5dugzKhwOFgIfXi3pbhgca2S9/o
	9FiPvvyFZNfVHNG9iqAs1Hym5aJ0nZYj5LOend1t+qUPV4r55QLOUlElW3tFHBzLB3AJUOvGAKB
	3iXYaKXA2aqwMKRqFerKHagm4COcPfELHcLItSpmCBNl7lbvAyOVkDsVWvhKlK1pYoiYlRvraJt
	7CdKibhdckxGTbLuAVY/YttCfnBhMD2ePVtuhv6QC1H9YduEm0tuxmFVrlXufYToY=
X-Received: by 2002:a05:600c:3549:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-4830e92cc18mr16039605e9.1.1770157181418;
        Tue, 03 Feb 2026 14:19:41 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48310858ffdsm906015e9.7.2026.02.03.14.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 14:19:41 -0800 (PST)
Date: Tue, 3 Feb 2026 22:19:39 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Segher Boessenkool
 <segher@kernel.crashing.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH] powerpc/uaccess: Fix inline assembly for clang build on
 PPC32
Message-ID: <20260203221939.059bb903@pumpkin>
In-Reply-To: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>
References: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Feb 2026 08:30:41 +0100
"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

> Test robot reports the following error with clang-16.0.6:
> 
>    In file included from kernel/rseq.c:75:
>    include/linux/rseq_entry.h:141:3: error: invalid operand for instruction
>                    unsafe_get_user(offset, &ucs->post_commit_offset, efault);
>                    ^
>    include/linux/uaccess.h:608:2: note: expanded from macro 'unsafe_get_user'
>            arch_unsafe_get_user(x, ptr, local_label);      \
>            ^
>    arch/powerpc/include/asm/uaccess.h:518:2: note: expanded from macro 'arch_unsafe_get_user'
>            __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
>            ^
>    arch/powerpc/include/asm/uaccess.h:284:2: note: expanded from macro '__get_user_size_goto'
>            __get_user_size_allowed(x, ptr, size, __gus_retval);    \
>            ^
>    arch/powerpc/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_size_allowed'
>            case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
>                    ^
>    arch/powerpc/include/asm/uaccess.h:258:4: note: expanded from macro '__get_user_asm2'
>                    "       li %1+1,0\n"                    \
>                     ^
>    <inline asm>:7:5: note: instantiated into assembly here
>            li 31+1,0
>               ^
>    1 error generated.
> 
> On PPC32, for 64 bits vars a pair of registers is used. Usually the
> lower register in the pair is the high part and the higher register is
> the low part. GCC uses r3/r4 ... r11/r12 ... r14/r15 ... r30/r31
> 
> In older kernel code inline assembly was using %1 and %1+1 to represent
> 64 bits values. However here it looks like clang uses r31 as high part,
> allthough r32 doesn't exist hence the error.
> 
> Allthoug %1+1 should work, most places now use %L1 instead of %1+1, so
> let's do the same here.
> 
> With that change, the build doesn't fail anymore and a disassembly shows
> clang uses r17/r18 and r31/r14 pair when GCC would have used r16/r17 and
> r30/r31:

Isn't it all horribly worse than that?
It only failed because clang picked r31, but if can pick two non-adjacent
registers might it not pick any pair.
In which case there could easily be a 64bit get_user() that reads an incorrect
value and corrupts another register.
Find one and you might have a privilege escalation.

	David 

> 
> 	Disassembly of section .fixup:
> 
> 	00000000 <.fixup>:
> 	   0:	38 a0 ff f2 	li      r5,-14
> 	   4:	3a 20 00 00 	li      r17,0
> 	   8:	3a 40 00 00 	li      r18,0
> 	   c:	48 00 00 00 	b       c <.fixup+0xc>
> 				c: R_PPC_REL24	.text+0xbc
> 	  10:	38 a0 ff f2 	li      r5,-14
> 	  14:	3b e0 00 00 	li      r31,0
> 	  18:	39 c0 00 00 	li      r14,0
> 	  1c:	48 00 00 00 	b       1c <.fixup+0x1c>
> 				1c: R_PPC_REL24	.text+0x144
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602021825.otcItxGi-lkp@intel.com/
> Fixes: c20beffeec3c ("powerpc/uaccess: Use flexible addressing with __put_user()/__get_user()")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
> I set Fixes: tag to the commit that recently replaced %1+1 by %L1 in the main part of the macro as the fix would be uncomplete otherwise but the problem has been there since commit 2df5e8bcca53 ("powerpc: merge uaccess.h")
> ---
>  arch/powerpc/include/asm/uaccess.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index ba1d878c3f404..570b3d91e2e40 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -255,7 +255,7 @@ __gus_failed:								\
>  		".section .fixup,\"ax\"\n"		\
>  		"4:	li %0,%3\n"			\
>  		"	li %1,0\n"			\
> -		"	li %1+1,0\n"			\
> +		"	li %L1,0\n"			\
>  		"	b 3b\n"				\
>  		".previous\n"				\
>  		EX_TABLE(1b, 4b)			\


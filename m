Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342752EA730;
	Tue, 25 Nov 2025 23:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764112720; cv=none; b=bq/wlVUOCDEP80RXOYQ4JpsM9IvZtvF46VDryIOLYTU4Lx+FVl6tlgysixqOn0/zQDmAxJLzVBdq2lKPJTW6KTgDlJPuitw3RGrkiEvf13KpeEOxmYm1KfsRDBMlfFxl28R2GuaVnJ8q1ZAJEt6ScWfb2s/HiQhqbJrlIljMp8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764112720; c=relaxed/simple;
	bh=EP+I/OB+/gkIIlYRBPDpfe/MYnzPkdpoIh9BAFVe1Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaIjO84ndOAbw4OnPkjEb1Ri0nFbljvhBXYgic8x9khajkbD0dz29Ut5mx6XO4eBgyPMPVRYF4P4+Go4APmYeBpjZIv/Ux0bcOdbKPJzp+l9kiI6O/2axYz6M5thiZVZJqSYcFBpnGzN9nOnU0LdzkpAv9PPuspWPiBz9HCW2z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dR5WcjLv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dR5WcjLv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C03C4CEF1;
	Tue, 25 Nov 2025 23:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764112719;
	bh=EP+I/OB+/gkIIlYRBPDpfe/MYnzPkdpoIh9BAFVe1Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dR5WcjLvKrM+sMfACkD4/tAfNcprzACyFoL4nUDMA2TQeiSKSTXQabeQGQxlEJaRw
	 jscevgQvd2WZ5VMimJGElz8sElnhRXq4IDUlkm+f73+6dZMlpe6YTqRnh4/V5hT8bQ
	 nkCrZejRGlt6w6g19BsDeayi5764tYLPpxELBjQyC6LUUcrrBizgLbsBBgFvBHkltg
	 jIvmxO/9VbRyXb/ZY0oGzKt1nTohuD/WitwBFbvqTdfTCPIVQCvxZBXBaLWveyODRu
	 mkArj0xds+pCM7qvBMXnH1orufJscq69U4D4kKY0EZ1MVnygApgRcg39pXwsTbWWYC
	 K/B+uWaB9QuKA==
Date: Tue, 25 Nov 2025 16:18:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [tip:core/rseq 25/39] include/linux/rseq_entry.h:132:3: error:
 invalid operand for instruction
Message-ID: <20251125231834.GA4012217@ax162>
References: <202511250134.i0Jm8d7I-lkp@intel.com>
 <874iqji6n1.ffs@tglx>
 <897c6ba7-e27d-4170-be56-4d0f544bfa42@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <897c6ba7-e27d-4170-be56-4d0f544bfa42@kernel.org>

On Tue, Nov 25, 2025 at 08:38:40AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 24/11/2025 à 20:15, Thomas Gleixner a écrit :
> > On Tue, Nov 25 2025 at 01:37, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/rseq
> > > head:   21782b3a5cd40892cb2995aa1ec3e74dd1112f1d
> > > commit: abc850e7616c91ebaa3f5ba3617ab0a104d45039 [25/39] rseq: Provide and use rseq_update_user_cs()
> > > config: powerpc-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/config)
> > > compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202511250134.i0Jm8d7I-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >     In file included from kernel/rseq.c:75:
> > > > > include/linux/rseq_entry.h:132:3: error: invalid operand for instruction
> > >                     unsafe_get_user(start_ip, &ucs->start_ip, efault);
> > >                     ^
> > >     include/linux/uaccess.h:606:2: note: expanded from macro 'unsafe_get_user'
> > >             arch_unsafe_get_user(x, ptr, local_label);      \
> > >             ^
> > >     arch/powerpc/include/asm/uaccess.h:458:2: note: expanded from macro 'arch_unsafe_get_user'
> > >             __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
> > >             ^
> > >     arch/powerpc/include/asm/uaccess.h:282:2: note: expanded from macro '__get_user_size_goto'
> > >             __get_user_size_allowed(x, ptr, size, __gus_retval);    \
> > >             ^
> > >     arch/powerpc/include/asm/uaccess.h:273:10: note: expanded from macro '__get_user_size_allowed'
> > >             case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
> > >                     ^
> > >     arch/powerpc/include/asm/uaccess.h:256:4: note: expanded from macro '__get_user_asm2'
> > >                     "       li %1+1,0\n"                    \
> > >                      ^
> > >     <inline asm>:7:5: note: instantiated into assembly here
> > >             li 31+1,0
> > 
> > Definitely not a problem of tip core/rseq. It just ends up in
> > __get_user_asm2() and then the compiler gets unhappy about the PowerPC
> > inline assembly for whatever reason.
> 
> I see it is a CLANG build.
> 
> CLANG might be less flexible, can you test with following change ?

That avoids the error for me. I notice that this does not reproduce
beyond clang-16 for me so I am going to bisect LLVM to see what fixes
this error.

> diff --git a/arch/powerpc/include/asm/uaccess.h
> b/arch/powerpc/include/asm/uaccess.h
> index 4f5a46a77fa2..33d5f7ade254 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -253,7 +253,7 @@ __gus_failed:								\
>  		".section .fixup,\"ax\"\n"		\
>  		"4:	li %0,%3\n"			\
>  		"	li %1,0\n"			\
> -		"	li %1+1,0\n"			\
> +		"	li %L1,0\n"			\
>  		"	b 3b\n"				\
>  		".previous\n"				\
>  		EX_TABLE(1b, 4b)			\
> 
> 
> Thanks
> Christophe

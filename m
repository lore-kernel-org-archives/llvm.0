Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C604366
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 08:20:43 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CC32C40E01A1;
	Thu, 10 Aug 2023 08:10:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id h27nG88cpW48; Thu, 10 Aug 2023 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1691655047; bh=bklXF/DHbuGo30BuaQq22d3Ct4ocEDegyFq07OjfRNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BbpcOwFBCMPFh6N/JYHIoE4iXyVyngmQpcRJJh5SjIrD+xwCRMn50nuKFcu2xa0i9
	 2OkQ3YJ2j/t2XROPHK8D+pFDoh+NtwcdNAPiZnvD6OdxGAmtUFChL6WhZcvHJgUUwr
	 Xir9m5raYtaa6AGOnDWysiHByQzecL71wLzaSu8XgkuyF/+ltGZfjHqXx1l5IV0TKp
	 80wVp9EffQIMJ89jN8lCZZESzxA4vqiHjp5EYlmjeJEGFLQ9uZhD+gHSNz+eWzkYDK
	 8o6Kf8fIfYlBeItKunfD2BeI2fJh8HRzUdD4Tfw1O2E47DKzn/ALjT7iHAv8X1iR6B
	 rQivLGXjXmoXnaWl6hdQfhI11zZZx8IBSMURYcYfNj+M+bVLHSPkvftSDE4VMa9Kig
	 3QCXFq7B8cH5xjy34vMKg1Flz9/UWlngRJlmZeNblsLzbU9mxBCdUIfuebYg7gfNkE
	 bviY56l6gq9szlR6eq07T0gVuzU1/by69w3IobXKOCOpb3MsIQ8iBs8v0pF2Z2FF3b
	 eVEiZOhk5+tXkvW3oYmuSnimHxILry8xNiD1e+PnnrRfSzhPo+Tv5gdcvFzGGCFetr
	 KM7piDeWGq3OSZiB96PiHd5CINzHeE5EvlJes6hxgzS8vDneF0lvITJmxWGdTMMb/9
	 lHUphj6FY8fav2y0t1tJ7XA0=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 85E8E40E0140;
	Thu, 10 Aug 2023 08:10:43 +0000 (UTC)
Date: Thu, 10 Aug 2023 10:10:38 +0200
From: Borislav Petkov <bp@alien8.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: Hang when booting guest kernels compiled with clang after SRSO
 mitigations
Message-ID: <20230810081038.GAZNSbftb6DOgg/U7e@fat_crate.local>
References: <20230810013334.GA5354@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230810013334.GA5354@dev-arch.thelio-3990X>

On Wed, Aug 09, 2023 at 06:33:34PM -0700, Nathan Chancellor wrote:
> Hi Boris,
> 
> I updated my AMD 3990X workstation to a version of mainline that
> contains the SRSO mitigations and I am now seeing a hang when booting
> guest kernels built with clang in QEMU/KVM with an '-smp' value greater
> than one (I am just testing 'ARCH=x86_64 defconfig', nothing fancy). The
> host's kernel is built with GCC 13.2.0, in case that is relevant. The
> issue happens with all versions of clang that the kernel supports
> (11.x+). I do not see the issue with guest kernels built with GCC nor do
> I see the issue with '-smp 1', so it could be something that clang has
> done to the guest kernel that causes this but I figured I would report
> it early anyways.
> 
> With '-smp 4' (for example), I see
> 
>   [    0.102817] smpboot: CPU0: AMD Ryzen Threadripper 3990X 64-Core Processor (family: 0x17, model: 0x31, stepping: 0x0)
>   ...
>   [    0.109778] smp: Bringing up secondary CPUs ...
>   [    0.110559] smpboot: x86: Booting SMP configuration:

I can repro this here with Debian clang version 14.0.6-2 even with -smp
2.

Lemme poke at this a bit.

Thx.


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

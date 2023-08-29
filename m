Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E25A21;
	Tue, 29 Aug 2023 04:54:44 +0000 (UTC)
Received: from nazgul.tnic (unknown [78.130.214.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 48CDD1EC014A;
	Tue, 29 Aug 2023 06:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1693284466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=svoEHK0EPymug74DR3GYZ7vqQNbIUCYgeqMTVKQpryQ=;
	b=dqfBVu7vVfy5UmFDeYn4sMW/Nu4hzvIcmAz1KrmbzRlwBxXpiy2n/N+bLAmfJ6Z/HAQM4S
	gd00afBxqEcq9g8k4AdMDkdQxkuB85A9oZpDI45Vu/qfIimTpn10BD5eidSNvKvtYV1hbS
	8GqTFQ8ndSzEN99Llmv3PxiiORqvJqo=
Date: Tue, 29 Aug 2023 06:47:45 +0200
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: arch/x86/kernel/cpu/amd.c:1289:6: warning: no previous prototype
 for function 'amd_check_microcode'
Message-ID: <20230829044745.GAZO14cRtwAnfERdR9@fat_crate.local>
References: <202308291220.DOn00Y1A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202308291220.DOn00Y1A-lkp@intel.com>

On Tue, Aug 29, 2023 at 12:07:59PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   1c59d383390f970b891b503b7f79b63a02db2ec5

It doesn't trigger here:

$ git describe
v6.5-1207-g1c59d383390f

$ make ARCH=i386 CC=clang-16 HOSTCC=clang-16 allnoconfig

$ make W=1 ARCH=i386 CC=clang-16 HOSTCC=clang-16 arch/x86/kernel/cpu/

...
  CC      arch/x86/kernel/cpu/intel_pconfig.o
  CC      arch/x86/kernel/cpu/tsx.o
  CC      arch/x86/kernel/cpu/amd.o
  CC      arch/x86/kernel/cpu/hygon.o
  CC      arch/x86/kernel/cpu/centaur.o
...

> commit: 522b1d69219d8f083173819fde04f994aa051a98 x86/cpu/amd: Add a Zenbleed fix
> date:   6 weeks ago

Likely an old report.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

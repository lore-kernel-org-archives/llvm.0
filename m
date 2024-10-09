Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15100169397
	for <llvm@lists.linux.dev>; Wed,  9 Oct 2024 23:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728517090; cv=none; b=Mb2+/i59MC2WYu6zkO9LebdSeRXCoCQWbntmU56wBXz42/gRDWSyOkaHpVEYzHiI1PcX/Zjy5sxlzLxXXnL/iEV7FFz6TOL9VmN7UnfGSTy1MzW0FY46+vWqzw+2pyIOG/uhaEWVRmtZ6ddcfD5tCDzZDnVQ+Aq4fCf7oJ/PEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728517090; c=relaxed/simple;
	bh=3G/6R++b9vYj4FRd5vTu0OZai85D5ZFaHhqrAG01FuY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLSqvehEB2JKJG+ebNw8WDgkJ47ZmplZVmlDERyEa9WLxghUrxTbHq9zB1xmXrWOSCWiU1Aqb2NlyDhZN5vZQgOooTqnr1t68cvw74PYo+BKo3UkRrJoS0G/KjltkX+BqhnOXzJ2NwkFcvzoeZWBXb9nz1AXt0tpYbtH/J6K8v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 84804db4-8697-11ef-8860-005056bdd08f;
	Thu, 10 Oct 2024 02:37:59 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Oct 2024 02:37:59 +0300
To: Sean Christopherson <seanjc@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2 1/1] x86/reboot: KVM: Guard
 nmi_shootdown_cpus_on_restart() with ifdeffery
Message-ID: <ZwcT149jx-iOmEfl@surfacebook.localdomain>
References: <20241008191555.2336659-1-andriy.shevchenko@linux.intel.com>
 <ZwbazZpTSAn9aAC7@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwbazZpTSAn9aAC7@google.com>

Wed, Oct 09, 2024 at 12:34:37PM -0700, Sean Christopherson kirjoitti:
> On Tue, Oct 08, 2024, Andy Shevchenko wrote:
> > The nmi_shootdown_cpus_on_restart() in some cases may be not used.
> > This, in particular, prevents kernel builds with clang, `make W=1`
> > and CONFIG_WERROR=y:
> > 
> > arch/x86/kernel/reboot.c:957:20: error: unused function 'nmi_shootdown_cpus_on_restart' [-Werror,-Wunused-function]
> >   957 | static inline void nmi_shootdown_cpus_on_restart(void)
> >       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Fix this by guarging the definitions with the respective KVM ifdeffery.
> > 
> > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > inline functions for W=1 build").

> Heh, I tried fixing this too, and have patches to clean things up, but I ended up
> not posting them because I decided the W=1 warning was less ugly than the resulting
> code in nmi_shootdown_cpus().

CONFIG_WERROR=y is the default (at least in the current defconfigs for x86).
My goal is to match what ARM builds survive (to some extend?), i.e. W=1, so
may one apply either version I provided or yours?

> If we're willing to take on a bit of weirdness in nmi_shootdown_cpus(), then much
> of the #ifdeffery can go away.  Patches attached (lightly tested).

-- 
With Best Regards,
Andy Shevchenko



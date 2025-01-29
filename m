Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B803C38;
	Wed, 29 Jan 2025 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738158413; cv=none; b=YuMVLpv6tQabses+xpfrbbBcnFmc48XkJB7zXb8x7b6/+j1c3HRU7c7tINr3RYKkTL0rifgpSLisTlU15nCHGRe22i/D5SKzcN5DCfHKEaxTYrF6R+gjQQvO93GHYu4cUdFLeDg6YGKCa5/cbzwkfRi0Ii14hu45zdrH1GieIAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738158413; c=relaxed/simple;
	bh=9mzkm+Oz6Y+AjP4AzXjIl8gbqty5LiiCcQU5PR3ySuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCBCZ/23xme3vctstvyTRdcXiKkrF2mZhl5GHWl54X++0SS/484Ql4XWc5XlV0ANS5VINwsvVSK94CyDhngatY+r0hOyuFasplIEO/DASxxb3PP7IlhoFR5PZzFjp3Agfat7UpdPE63QCP1H9Ag0kJhlhqTJUsOxt6nKXGJt6oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSNxnJuW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSNxnJuW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76866C4CED1;
	Wed, 29 Jan 2025 13:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738158413;
	bh=9mzkm+Oz6Y+AjP4AzXjIl8gbqty5LiiCcQU5PR3ySuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSNxnJuWeParDruisF7PTxoVNGivPPMbgYbw+ObXhXpRTwTHujmm+RfMjkGLYb5uW
	 qyU7N0ffytX6V+E90mcaakH9gMacU4a5dOj7dtJNGF6Km9cNitN4nvQGVk4C4Qhihu
	 ok6yXJVIsst5uVp5fK2IUAnqkkn2ZGUSvhF78UvX3kSfaxEHtWAysesAA6AXivqtaR
	 wcCMkDATJahbCTf/A+pJ6P8Rqptf0JiXse3opf/Jb2lFLtqD0wR9OiOcFaeUGK8kKY
	 TvMFz8M4B9/oCU32KeWIhccHfKzKto5SY9K++ibwt49xfIRUcQE0TtHCDRcfp9sEnZ
	 4HBCDgQ/p4Lgg==
Date: Wed, 29 Jan 2025 06:46:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: drivers/platform/surface/surface3_power.c:243:2: warning:
 'snprintf' will always be truncated; specified size is 10, but format string
 expands to at least 12
Message-ID: <20250129134648.GA3884012@ax162>
References: <202501291646.VtwF98qd-lkp@intel.com>
 <CAHp75VcOYyVx=wcopvi-0iA5XePsGOrNO1wUSzYcYB4q86=7gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcOYyVx=wcopvi-0iA5XePsGOrNO1wUSzYcYB4q86=7gA@mail.gmail.com>

On Wed, Jan 29, 2025 at 02:45:38PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 29, 2025 at 10:09 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > commit: 85f7582cd484dbf491b6d9bb2af6ef1467a024d2 platform/surface: Move Surface 3 Power OpRegion driver to platform/surface
> > date:   4 years, 3 months ago
> > config: x86_64-randconfig-071-20241231 (https://download.01.org/0day-ci/archive/20250129/202501291646.VtwF98qd-lkp@intel.com/config)
> > compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501291646.VtwF98qd-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501291646.VtwF98qd-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/platform/surface/surface3_power.c:243:2: warning: 'snprintf' will always be truncated; specified size is 10, but format string expands to at least 12 [-Wformat-truncation-non-kprintf]
> >      243 |         snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
> 
> 3 + 'E' + 6 + 'E' + NUL, that's how the compiler thinks about this
> formatting string...
> 
> >          |         ^
> >    1 warning generated.
> 
> I do not know how to properly address this because it's false positive
> due to the compiler not being aware of pointer extensions used in
> Linux kernel. The w/a is to increase the buffer if we can, but is it
> practical? OTOH, this warning will be translated to a compilation
> error in case of default WERROR settings on `make W=1` builds which is
> also annoying to people what want have that clean.

Hmmm, I missed that -Wformat-truncation-non-kprintf was only disabled in
the non-W=1 block in scripts/Makefile.extrawarn. We never want to see
these warnings at any level because they will almost always be a false
positive, that's why the "non-kprintf" flags even exist in the first
place:

https://github.com/llvm/llvm-project/pull/65969

I suspect we want something like this.

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 1d13cecc7cc7..8878f71463fc 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -31,6 +31,11 @@ KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
 ifdef CONFIG_CC_IS_CLANG
 # The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
 KBUILD_CFLAGS += -Wno-gnu
+
+# Clang checks for overflow/truncation with '%p', while GCC does not:
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111219
+KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow-non-kprintf)
+KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation-non-kprintf)
 else
 
 # gcc inanely warns about local variables called 'main'
@@ -102,11 +107,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow)
 ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation)
-else
-# Clang checks for overflow/truncation with '%p', while GCC does not:
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111219
-KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow-non-kprintf)
-KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation-non-kprintf)
 endif
 KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 

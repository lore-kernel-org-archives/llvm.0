Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5152513DDAE;
	Fri, 23 May 2025 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993399; cv=none; b=ddmcpCStL7H+Cn8QvtCdDRzFFGoaOAmPNONgFWxxkbY4Uf1mD6LEvvLimWUknI0XyDjZ39oho8X91b1PjTecUEiwgORo84eNydYTtHjKUw+baXB+8Ld2E5lCBeK9eKEcsKKYbJRHYUjIB2lOsLsCRez6BnnE7ErTf9fxW4ro1z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993399; c=relaxed/simple;
	bh=CEDCw79LJctjQpVZ3uZ8cM78GRz7tvEzFoYryRMdOrc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AyHUJzJ+y/RCnmyVfyOSCBuGTbcOaIAdgKIw2gJBdjTg607RcyokqFpOG9FtZD7n6ku5aLyVWhkQbyWXbG/eQnSsI0/P1ZB4riAXmZhwssTgnHKq1Ra+AMJ9gMwgNe5JluC5HUJSDFDwDfmYZ7E6CjfW3Gpfq5d7KJmbtuGn7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSdLPQJq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSdLPQJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747993397; x=1779529397;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CEDCw79LJctjQpVZ3uZ8cM78GRz7tvEzFoYryRMdOrc=;
  b=XSdLPQJqZdqRn7Mh94o1icxgGgrieH/R1T1E2COWc+WgzckfBlVZTnr1
   lp1EOsHgoQJ7g3Vqr4a2jJ+7DbnHXJtHHJE6p9TBzhnpoaPikToBuWnme
   JNZW0Gre+UXSvs6nZGMBcPHhL4trv7spoXAIzr6rmZ9kU5X3AsXD4bABa
   kxC12Z5eQXu2dGVDA2YBm74pfT3TwPRWrXwBuhC+ta2SHPkQSfM8PRZRP
   5Wo9hV5l1qJWfykyd9usqrBMf3dUkM5ZjRISyjUS6chWuMaVBhUGrcVKJ
   d7m/wy1wlH1qKkwEGBw6ciB0XrUHwWR1LP4EAt6cWJMhPcSCwwNNlN9gs
   Q==;
X-CSE-ConnectionGUID: quH3kXBwTZmgGOd9Ljc7bg==
X-CSE-MsgGUID: TZrfrqOQSNWIVKytYyGF8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37669140"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="37669140"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:43:16 -0700
X-CSE-ConnectionGUID: ceSpxjaZRESIS9zExvfx7w==
X-CSE-MsgGUID: QYXYHeU2QNuY0dZSF8wnWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="141634035"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.150])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 02:43:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 23 May 2025 12:43:10 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Sebastian Reichel <sre@kernel.org>, kernel test robot <lkp@intel.com>, 
    Jelle van der Waa <jvanderwaa@redhat.com>, llvm@lists.linux.dev, 
    oe-kbuild-all@lists.linux.dev, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    Armin Wolf <W_Armin@gmx.de>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 109/109]
 drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator
 'charge_types' does not refer to any field in type 'const struct
 power_supply_ext'
In-Reply-To: <85091184-1d5b-4a11-a940-2d818d46afef@redhat.com>
Message-ID: <680a00ed-d701-4d5e-9195-af0b27f376b7@linux.intel.com>
References: <202505221051.khDhUKJ0-lkp@intel.com> <f981b9ac-41cc-489a-9f37-c9e87e748c99@redhat.com> <ba4bcvf3tjqunxncrqeire4j257px4plbk5eew7sfbmycscbys@xymzswpfmadw> <85091184-1d5b-4a11-a940-2d818d46afef@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 May 2025, Hans de Goede wrote:
> On 22-May-25 3:52 PM, Sebastian Reichel wrote:
> > Hi,
> > 
> > On Thu, May 22, 2025 at 11:36:47AM +0200, Hans de Goede wrote:
> >> On 22-May-25 4:39 AM, kernel test robot wrote:
> >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
> >>> head:   b2012b38080e2f92d43eca59e8249c174a27527c
> >>> commit: b2012b38080e2f92d43eca59e8249c174a27527c [109/109] platform/x86: ideapad: Expose charge_types
> >>> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250522/202505221051.khDhUKJ0-lkp@intel.com/config)
> >>> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> >>> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> >>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221051.khDhUKJ0-lkp@intel.com/reproduce)
> >>>
> >>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >>> the same patch/commit), kindly add following tags
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505221051.khDhUKJ0-lkp@intel.com/
> >>>
> >>> All errors (new ones prefixed by >>):
> >>>
> >>>>> drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator 'charge_types' does not refer to any field in type 'const struct power_supply_ext'
> >>>     2044 |         .charge_types           = (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> >>>          |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>     2045 |                                    BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
> >>>          |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>    1 error generated.
> >>>
> >>>
> >>> vim +2044 drivers/platform/x86/ideapad-laptop.c
> >>
> >> Hmm, this patch depends on:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git/commit/?h=for-next&id=c1f7375a246e5f810191a6c3031d2fa2b80e9f5e
> > 
> > I should have merged that through an immutable branch :(
> >
> >> I guess that that patch is not in review-ilpo-next,
> >> maybe Sebastian can take this patch instead of taking
> >> it through pdx86-next ?  Or it can be merged after
> >> 6.16-rc1?
> > 
> > I will be on trekking trip for 3 weeks starting on Monday (more or
> > less directly after sending my 6.16 PR), so I don't want to take any
> > late patches as I cannot handle potential problems.
> 
> No worries, I guess we can just merge the patch after 6.16-rc1 then.

I'll handle it after 6.16-rc1.

It would be nice if the patch submitters would inform us maintainers about 
such dependencies up front when submitting a patch.

Have a nice time.

> Enjoy your trekking trip.
> 
> Regards,
> 
> Hans
> 
> 

-- 
 i.


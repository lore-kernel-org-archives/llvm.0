Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC1C1B392B
	for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 16:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919464; cv=none; b=J2z4LGvtRmv0G2NrZhh8IsCKjuazURbGua5xT88Yp5mtF8cTJLw7WQVRtU3TrnLC1e/x4/+cpl93Z7T96j81d8TqdN2KScGukbQt9Du5F8uxa8za3aOcH9aEdejNx1OCHAKZfaq36/dAnHvCnBvq0DiGfJMgX7kkmZh7C3Hpuyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919464; c=relaxed/simple;
	bh=v8ZyraU08ohLvJyvM+Yz+14PaHZD7u7W31u6nmaUlf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvERAQrWAo5JsHKFsqJV0G7WqqBWp+Ag9tsdZyrsIuIBTTjjeN6WW4AHCMHY1LdGmU5EKDoSBTLFyBuxVGiO4afQsF9WEbchRdy9k7NjTOxaHn9oueHwwwe6V2VzdeEVEWO4pt+WVUfOXah+Rlr93iym/iRn519yhcSDDYOtX84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: x6xxcOWDSKC8CKOVHqTpXA==
X-CSE-MsgGUID: 8pkHpJMiQK6WhaatTMmr6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="66631897"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="66631897"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:17:39 -0700
X-CSE-ConnectionGUID: HoJJbwymRLqSBcxliNKrew==
X-CSE-MsgGUID: j6hdDJqnRsemhCNWtAwEPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="129265650"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:17:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tx6y6-00000005ndO-2Jrv;
	Tue, 25 Mar 2025 18:17:34 +0200
Date: Tue, 25 Mar 2025 18:17:34 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] wcslen() prototype in string.h
Message-ID: <Z-LXHssrcpdtFqqn@smile.fi.intel.com>
References: <20250325-string-add-wcslen-for-llvm-opt-v1-0-b8f1e2c17888@kernel.org>
 <20250325-string-add-wcslen-for-llvm-opt-v1-2-b8f1e2c17888@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-string-add-wcslen-for-llvm-opt-v1-2-b8f1e2c17888@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 25, 2025 at 08:45:19AM -0700, Nathan Chancellor wrote:
> If this is desired, it should be squashed into the previous change. I
> wrote it separately because it is slightly more invasive.
> 
> In order to export wcslen() to the rest of the kernel (should it ever be
> necessary elsewhere), it needs to be added to string.h, along with nls.h
> for the typedef of wchar_t. However, dragging in nls.h into string.h
> causes an error in the efistub due to a conflicting function name:
> 
>   drivers/firmware/efi/libstub/printk.c:27:5: error: static declaration of 'utf8_to_utf32' follows non-static declaration
>      27 | u32 utf8_to_utf32(const u8 **s8)
>         |     ^
>   include/linux/nls.h:55:12: note: previous declaration is here
>      55 | extern int utf8_to_utf32(const u8 *s, int len, unicode_t *pu);
>         |            ^
>   drivers/firmware/efi/libstub/printk.c:85:26: error: too few arguments to function call, expected 3, have 1
>      85 |                 c32 = utf8_to_utf32(&s8);
>         |                       ~~~~~~~~~~~~~    ^
>   include/linux/nls.h:55:12: note: 'utf8_to_utf32' declared here
>      55 | extern int utf8_to_utf32(const u8 *s, int len, unicode_t *pu);
>         |            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   2 errors generated.
> 
> Rename the efi function to avoid the conflict.

Hmm... Why not split this to two, rename patch as a standalone makes sense to
me even outside of this series.

-- 
With Best Regards,
Andy Shevchenko



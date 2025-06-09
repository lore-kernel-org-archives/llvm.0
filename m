Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406A1401C;
	Mon,  9 Jun 2025 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487400; cv=none; b=tBulyrcgGAGoESJ1BEUOTwhZxRPu0f0B+QcJSz3AV8pLZoUHUSiamN9ZjM9Bbbg35q0tw6CyE08hXSsY7YiAXqs1PPtc1U0rx0s6yAGe5CAl0Kk1lHRaStOTjC/jT28ANgjcir+nnWuG58UrHVEIxy04itJMw3snkfMC1WZyDUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487400; c=relaxed/simple;
	bh=UOEVM3hrIhfZTulUKBSQzzFVVECPLdYJKEB6mWdIt4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KViQoUYnn3rSoG7L+61Nuc80BvhrRd4jyD7nkyPsNq02i1RUQFK1ufPEMcNdFLo9Je46qM2E8U5/7bpD9jkCWKkKxhNjCEqnZRRf5f1TEJdjXf2Y7JIgoEiGxeb8mPLs3O220mOCpnebj3o6FmcxXE/++WYTv4H6ewrHh20NVKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5q/KCLx; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5q/KCLx"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235ea292956so44063835ad.1;
        Mon, 09 Jun 2025 09:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749487398; x=1750092198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RFgoM3J6BSLbgmxNY+TMoktoz9hQ0uEGUiFfdNsdxxI=;
        b=R5q/KCLx1e6n0LtUCX5Cf3xkWxpTyC+YMzd61ucjTbQ/a+f2mpdUMRDevTnvlLZ8yL
         fkj0mtfRh6NDO/kPga722pxLl8nUiaHVox62cD3wMFeydwbe4LJm/9YuWXDgZqGoxsjH
         e9apX51cM69Cww6DGtc9lsFDpQ1SItwle1hRtbSjp33ovW+iDm+5cz63biGCRvxbTkYg
         qgr8XqCXmrN22UkKp4cf51eZ5ZExdbiEC0YnXQtLb/bddM+CAqBBqbuWAUfsIz9Jgoat
         7y+gYkjxjRMxhsu2iQQQA1Bu88Ce8NymOLrJEUoKksbwAczcDh0Rb9AZNe67alHYvX7d
         Rf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487398; x=1750092198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFgoM3J6BSLbgmxNY+TMoktoz9hQ0uEGUiFfdNsdxxI=;
        b=a5P4lNbA6NkqnO0TDyVLhHSfdmTBkEpVO78t3EX0Hlb2+sKJQ6TaDQmL5/TvalqkTM
         a+DmMXJBH+AGU+xYDeV4So0vWKnZC6QceqZ93cnHq5QZ5xkLiK0b6J5f84O8u1EzW34P
         LALDgMQEutz+ur2QBiAeCGBQ9uxo1rG45aDJz2D/xpUPPPcbm9AzxdnHyp0vFZFRJ+5A
         UHQ081AFUExL20o+Hwk2DgFqt9YvmPEgd4jM4xGZBNSx6K44eczGUtiLc72F7aoe1/3p
         s51fyoEUTQZIMsUPOOkrg1vihmWXaXj1AH10IA0i+n2Mtjw7PYa9v/Y5ONBH7oLtZrdR
         7ung==
X-Forwarded-Encrypted: i=1; AJvYcCWVDGpbxr02rzp+IYzmg93yzlAHtDxEcztxboXzRBHsSGQvVUxr2suaqzFKdcWH8PhmVdIsyvB69pnZBP00@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8fL/E5BmFyPflaYvaWOi/+JVB1JYQFXm64qPxZKxTmN4pKeBh
	Qgue6zl7PjpkmrhApLUPlj7AK18UOgN/4QNGU9j+LJq1ZSWziSd87FqmUUiOJA==
X-Gm-Gg: ASbGncvb3n/ugh5ykUji52HSz5Y9zCauf/gq/L+TExRTtVBh4J2+t9p+/khNncnWZrT
	igKwZaRhwujfCQqxmFiF39Dwm03oU6MPhQLkQI824ZMbSsmDVJJZUm9Nh7ayqPLRU1ur1/e+fam
	mXGIsKKjew5EjuGMb3JDF6kmyBfIfFGPCL2/N65icQwk8slGYPeG9+oRKj7y6G6UXUmQ+5OnL+C
	l/sCVRsqCEGK55r/GeHgyiCYd3CS0LcrD6WG4Y9543tGrMYq4IC50oXK3A1TFROIHRIs0NN2J5v
	bmZU9DI/PuK/QZqPpSqarNYwZeGHx49mLVzTUribp1vZvC/0sZawBUoq8JZjFu7wr0vInpfixBG
	SRdY=
X-Google-Smtp-Source: AGHT+IH7PDtB5d2rUnOD0GNZZ7JWJG/aqnngqLoqGTFSMsKJw3Cl3XnacUHsilJQZFtCEWBpW32qbw==
X-Received: by 2002:a17:902:f545:b0:235:1706:2002 with SMTP id d9443c01a7336-23601b49461mr193549125ad.0.1749487398099;
        Mon, 09 Jun 2025 09:43:18 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360340fe73sm56130675ad.198.2025.06.09.09.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:43:17 -0700 (PDT)
Date: Tue, 10 Jun 2025 00:43:14 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	Tal Zussman <tz2294@columbia.edu>, jserv@ccns.ncku.edu.tw
Subject: Re: [akpm-mm:mm-nonmm-unstable 32/32] ({ BUILDclang diag:
 _include/linux/compiler_attributes.h:138:56: warning: attribute 'error' is
 already applied with different arguments [-Wignored-attributes]B
Message-ID: <aEcPInFT31s1lCZP@visitorckw-System-Product-Name>
References: <202506090716.JryOipkx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506090716.JryOipkx-lkp@intel.com>

On Mon, Jun 09, 2025 at 07:48:46AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   8172857ac52869c411762ce86802d127b0bb7546
> commit: 8172857ac52869c411762ce86802d127b0bb7546 [32/32] riscv: optimize gcd() performance on RISC-V without Zbb extension
> config: x86_64-buildonly-randconfig-001-20250609 (https://download.01.org/0day-ci/archive/20250609/202506090716.JryOipkx-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090716.JryOipkx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506090716.JryOipkx-lkp@intel.com/
> 
I wasn't able to reproduce the issue on the latest mm-nonmm-unstable
branch. However, after I manually applied the patch "[PATCH]
compiler_types: Remove unnecessary indirection in compiletime_assert()"
[1] on top of it, the issue appeared.

Since the patch pointed out by the test robot only touches RISC-V code,
and the issue shows up on x86, I believe it's reasonable to conclude
that the dropped compiler_types patch was the cause, rather than the
RISC-V gcd patch.

[1]: https://lore.kernel.org/lkml/20250607-compiletime_assert-v1-1-a8991a9be729@columbia.edu/

Regards,
Kuan-Wei

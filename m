Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F98D1F5F6
	for <llvm@lists.linux.dev>; Mon,  1 Dec 2025 18:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764612099; cv=none; b=e4BUMtfkrKHzMFtSJOpqg3O9Oa4RPRrE14zbDW42T83i3SfMMLqwrWYEIYK+A2V5zIYB0usRtUt1oXCUohVCbEOjGAE8XKF2BX+2Ha9612b7SKT7+fSL/a4y6mccjCwZpKswqZgDV5C73/nNXIZNf4w4EMxIm9Ohef9BgM3dAwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764612099; c=relaxed/simple;
	bh=Cl5MfZTmygfRTiyyEyEUElbsEfjllDUBjhPeeZiTfkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ieDKdrXi3ReO7zNjSWC7eBnJoqECkWyfti/a9RCN6aDvSQe4cIntAJrNRlqBj5jc53i3Vi1ysFnbSmMwSrobm9gBb3J7KGy8iN2pksSGL2dbhhMnJWbIArt4CoVGS4piWq7bT3gMV55Eq1ikNrv7ExK1GGsflkMwnMqLDr5XZ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVV5cBDm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVV5cBDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764612097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cNpwF+vE1biwEuxq5v/m4qt1meHle77L6rU4xp3q9yw=;
	b=UVV5cBDmtsXriK3e1ZP7WQ9rmTBV+9S4o+sJGjGLQ/lL58HxeimkgXgw2YIauw7JKaGBD5
	lJcqchR1jUlndln/D5XuVk+SvvHTbpajvaP95vUjP8cBxfjuwIcgfNs9pu8hYtIpjwb90h
	2uPJDo2UjhLovhPaK1HOqQ41+lLqzuA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-_iWpNTo2O9KUzS7WFb05-w-1; Mon, 01 Dec 2025 13:01:34 -0500
X-MC-Unique: _iWpNTo2O9KUzS7WFb05-w-1
X-Mimecast-MFC-AGG-ID: _iWpNTo2O9KUzS7WFb05-w_1764612094
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee21a0d326so65545341cf.3
        for <llvm@lists.linux.dev>; Mon, 01 Dec 2025 10:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764612094; x=1765216894;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNpwF+vE1biwEuxq5v/m4qt1meHle77L6rU4xp3q9yw=;
        b=HAohCJCQcZ2JSvxLLtKHY6y/0PXm1/yFMc4WrFtCa9z72avoZUuE1Ut0sReE2JMEnt
         WoM129GPFwuw+8ccqDIkbCgeZVlJAQAfTaAVtnyZc9A8z7Mc0IF6yF0/2JggmAjIwNvt
         f8Fpk7gE4+l1jMhC/Tb9qsWuog/uViPpv3JXb7p3XUmLrxjpnB8tmYuTMa6dA7oDuimo
         dBSZdRNvvDUPOFgRSizTGnzu+1QOLrt15AK1RC5ZuC3md60nF/k3cMTC/uUm24YgLrPr
         mrTaFTSXDJmv/nJs9vHvNqinEDCODj9zYH5ZD0IFbPdFAsF3UO1TL5LeLBaeMSxMY7+j
         q5Zw==
X-Forwarded-Encrypted: i=1; AJvYcCX/aBJgIcG5UA1lSS4jnvENaH0x0mZmyXHZP0ZC832UI7V5cQVpBcwGGUxMrBONZ1gEnDsD@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+mEXu8TeGoLu8Vca7XbrNdLBp74THyIwyRvO1efHWTWnnX7UA
	k4tHR/mjdQYT8cOvmV6eP/7gfYW0a4Rylf5nEYKLMc7ugghDTNEEEPBg14h3zuJJ7ecZFALTrGA
	z+uv6FtBlVVk4l875wHuDxDAdlNjByvWgih7+a6FcWkWCsu70bFT9tCc=
X-Gm-Gg: ASbGncuM1P05gRPDsZQgxE0lDbWYF96jauYxvowsvJjUdgEfi9KHpBKdRdfm4UXvyJl
	/M7/z1dXxU0Aq/govAwrBo1n3zVfob/DbgiHDQyONdbNmZDPDMOomrcOdP5OeVszMIgIV2A62zH
	cps19lyhUeun79+ZVchsuhq6JL2rr8S2tFScFVGc08inb5dFFQSjY32AbLcaSXcaCPBYYmc/Hqr
	B5iIWa6oM+zgZ+rErkf309P1ntAFIvA/v683rm2ndCTMXfzbcvppjGKmMt7q5N6947Y4SGWANad
	4RyKekEcbHp11gKIPThm4Mnpd/DRwIlmuHS9YhOLWJvY5GkuLkoySJ+/5kQyU9g1h4TxLWbpAS7
	VhD+nbfKQxRlBv/hy6bG0P05E5uuBfruZ3JHcxYckBzqc
X-Received: by 2002:a05:622a:1394:b0:4ee:1b36:b5b4 with SMTP id d75a77b69052e-4ee5883fc8cmr441494881cf.15.1764612093607;
        Mon, 01 Dec 2025 10:01:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFka/sclAcykb4EafMCqkmrz+Srgtgtrntu+M3uKtzXPbszU0pI6Loxjqn7JQekjtJjw+Qepw==
X-Received: by 2002:a05:622a:1394:b0:4ee:1b36:b5b4 with SMTP id d75a77b69052e-4ee5883fc8cmr441492521cf.15.1764612089955;
        Mon, 01 Dec 2025 10:01:29 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd2fbb8d1sm79292921cf.9.2025.12.01.10.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 10:01:28 -0800 (PST)
Date: Mon, 1 Dec 2025 13:01:25 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aS3X9VXVlKNQyDoz@redhat.com>
References: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>
 <202511270924.0uDTpEE9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202511270924.0uDTpEE9-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vjt3rIa85reKDlQUZBJQbDxlwD8sA6kLbcf4Q4kfCEg_1764612094
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 27, 2025 at 10:11:12AM +0800, kernel test robot wrote:
> Hi Brian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251126-035403
> base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
> patch link:    https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9%40redhat.com
> patch subject: [PATCH 2/2] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> config: loongarch-randconfig-001-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511270924.0uDTpEE9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/microchip/clk-core.c:12:10: fatal error: 'asm/traps.h' file not found
>       12 | #include <asm/traps.h>
>          |          ^~~~~~~~~~~~~
>    1 error generated.
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for TSM
>    Depends on [n]: VIRT_DRIVERS [=n]
>    Selected by [y]:
>    - PCI_TSM [=y] && PCI [=y]
> 
> 
> vim +12 drivers/clk/microchip/clk-core.c
> 
> ce6e1188465998 Purna Chandra Mandal 2016-05-13 @12  #include <asm/traps.h>
> ce6e1188465998 Purna Chandra Mandal 2016-05-13  13  

I only build tested this on arm64. I'll post a v2.

Thanks,

Brian


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2293642EED6
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 17:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931207; cv=none; b=XZDghlgZ2OkBaiBUzlbkwrIORN5x05B1dd9UYdgPzyGH0sN7fZ2lQDE+yYrdRoTDLDqxFrSryqqxwnU3nmGY04nsHEyMp0yDk8gQugf+Y1hD7hEUOccOTktwj7fwG7UDlkzAXpGUW5Si5OfPZxW2l0w3DuF2HK0fmy122Ck4Qv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931207; c=relaxed/simple;
	bh=bsHD5ASTyZQ6NgkQHF/MszE1ynvH2TtdgFI+ciczVR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=s1SlRcc8k/Lp7UfsVTUoezYD53I8NA8+h8/Enr0kYEJheLw7oo0KHPWupcQEs6pE5b2cxFSfA8eYFxGIwM73UK+9TVKyWQWGwY7o7m3ZbISNGDY37CJu8Oetl3y1pkYlDCs5qmcWwt1gnkbyCJuNZAafkfqxf9b9YT/H28drn88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EJLnx7gb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EJLnx7gb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768931204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QFl9G2ldA1TW7qySDFacMiOzzulOTOkp01NTA21hmOA=;
	b=EJLnx7gbP2kaZU8NiWEagylTkFhSdJls0aHzUsTuldnmobRk1hgKdctalwrBXs59Dy/vqB
	0J16GODAnI74Ui6M42LGPgGP3ZvA3uPRgzM0YxOkcqdyP6U4DY2Ou9Poh07oY+X46d53l9
	M9wmnDN0kuUi9cn7UG/7ljWzjeZQz0A=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-PMsmQkLnNF6wdBftXFcn8g-1; Tue, 20 Jan 2026 12:46:41 -0500
X-MC-Unique: PMsmQkLnNF6wdBftXFcn8g-1
X-Mimecast-MFC-AGG-ID: PMsmQkLnNF6wdBftXFcn8g_1768931200
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ac39bd5501so5049392eec.0
        for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 09:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931200; x=1769536000;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QFl9G2ldA1TW7qySDFacMiOzzulOTOkp01NTA21hmOA=;
        b=cSQhK/el/5IPW3KpeLFofCwQWNMS3bQKXNjVzYMMz69tqZnmZbflJebRknQiJqYR3E
         L5I22gaQfvo19r4rhyxgKPkwSwyePKFpTI9PqrDwmC6jyXDuj7dEdZO6Ap6w/UFyh3Qe
         AFxLSmIZejo+2Pbk6I5zMiJbYj6ru5DLfeb3oFihijqOD6aMMpPiycKkllLmSOpMNz/F
         OciH+dCDrgzE0UJZz2hPNY7rM5OgLMPIcEWqrreFuNlEeLo60W0YNjny9jE2uCwQnm5V
         /1NIKsuG/z4jmalvDzAwxoVDQUMuaorNmcMX03MXVZmeZkNfZSZqkSmxW2IgZQWjwB5J
         /5Rg==
X-Gm-Message-State: AOJu0YzfpnRIfJSTPYwHvqvxpcDOitVUaAiJVEO4b4vMAV/j+2ySQf+l
	JGBQj1oMx//W8uzC/7D6/OKfZ7Fm8JSW4jGrxSw9LZnTfzRA5wysk3FZnTaz8cj9VQy9QzmaPmi
	LHP/zcuUBjn+uKT6kqXJk9Du3gnHNMVVs3h1zM/e/JFx28IVnAxyt8f1DRpZb1xE=
X-Gm-Gg: AZuq6aIiMCH/Xon0lKKVECduS9cmkRiaXFf4n8KngGuWZibnXmyfu0wS+p6V/Ll16z8
	tIY/fJCTjPm1Fyz/Mg1Dt6/Oo1CvYGptfXiu67RRXiHtaXn6M/r4IbTBbjfupHmIJJARbLAeTNt
	XtZ2z75GGIhmgykj3V9+w7vJm6kKxZHwX6hjNYbhrKTU3rU7zorDZ64cS/fbWQ+pm9Wv+flo2kM
	hSJwEvEpRik7lbDm6mgvjVsu4wD1BWwbbucY69sfJGRGRc1qZaOLSLsja7O4R1FjoAkhNUTniSN
	+c2TlxKGQ78dDx3GQomDZN1vMcOTDs1VEYU+SPdv21UuQhNwNW5MA1hk3EjqyAXsLot+EPDzxgK
	0vIx5oy2Zv/WOjZFSstIZCVDuYF5zxUBJaTl4SK1FKNdb
X-Received: by 2002:a05:7300:e8ac:b0:2ae:614a:330e with SMTP id 5a478bee46e88-2b6fd7bd308mr1523547eec.41.1768931200189;
        Tue, 20 Jan 2026 09:46:40 -0800 (PST)
X-Received: by 2002:a05:7300:e8ac:b0:2ae:614a:330e with SMTP id 5a478bee46e88-2b6fd7bd308mr1523481eec.41.1768931198215;
        Tue, 20 Jan 2026 09:46:38 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3503ce3sm17858047eec.12.2026.01.20.09.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:46:37 -0800 (PST)
Date: Tue, 20 Jan 2026 12:46:32 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/13] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aW-_eIjcRp7VM0bt@redhat.com>
References: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>
 <202601162110.K1eWGORM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202601162110.K1eWGORM-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -Pc_0c81DfX9hA6gbqeS8qKq9GveWunBL0gd4HfDFJU_1768931200
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 16, 2026 at 09:20:36PM +0800, kernel test robot wrote:
> Hi Brian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on f417b7ffcbef7d76b0d8860518f50dae0e7e5eda]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/MIPS-copy-pic32-h-header-file-from-asm-mach-pic32-to-include-platform-data/20260110-005057
> base:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> patch link:    https://lore.kernel.org/r/20260109-mips-pic32-header-move-v1-13-99859c55783d%40redhat.com
> patch subject: [PATCH 13/13] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601162110.K1eWGORM-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162110.K1eWGORM-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601162110.K1eWGORM-lkp@intel.com/

None of the errors in this report appear to be due to the changes that
I made that allow drivers/clk/microchip/clk-core.c to be compiled on all
architectures instead of just MIPS.

Brian


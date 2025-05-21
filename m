Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F53239E9B;
	Wed, 21 May 2025 22:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747867495; cv=none; b=E5twtJrzt3Dxp+aOpM5+DFRIfNE/HLz1DwiUIpWvpwPXT9UJNPKAu/YmMccd8kLEpiMhlqkg7aw5H5FAsKP0yzKHz1SWEdaaoL9FhTv4dLywdM4+Z3gAhYkT+9FKfEa9TB86jMayprgN6XfAGJygJFlaptBZNk8/qPXpsyn4ZNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747867495; c=relaxed/simple;
	bh=RFci8NiCtNuJUGrSSysrHVigN36hprEjbgn8kcBN20I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZroYqVRUASDMSLUu0Uk71hgWnX57jsLR+C+1YKsofCyFWsHaxd1xxOMuv4lT/6vCWsWIFQ46Xw+nq3NSB1SrSMdxgm+muup7gdAyTZFPrQDn+B9OtpRcRZig6nGTcEaZ1PNqD2e06HZsE3+fv4o09RF4xf+WuS20fHTz9aoHOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMKWrxAy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMKWrxAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1F6C4CEE4;
	Wed, 21 May 2025 22:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747867494;
	bh=RFci8NiCtNuJUGrSSysrHVigN36hprEjbgn8kcBN20I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMKWrxAy8kKFB5xKLhVcMtSwG2PQjvTSK9EwzeQ62FislyBlZcZn1lKJ45TzUp3yk
	 NUhNbJc9I8ov786tLhYNuoVga0u6vkPk7pumpKeLxT/kuc3dSQ5LuCLaQ+M3hG3qbr
	 v3FECu6pISOduDO2hX1oGz8MZbsU5WXiJfIPSvncrSRb/qU+m3ZCJjz1iTe6MMGywl
	 eBeWwFRtfV0FGVqTgc9yvwRhtW5WC+QZsNCZdlzakkKXILaPEAFUvjlEPdof/HfwAF
	 4RQtkONYQlVtkLfhB0e8aPSNwDw93CdBTrGDLf+avLoy7byVG1VZCkWa9QIS4Wxr4P
	 1XfD3oWDUo+ag==
Date: Wed, 21 May 2025 15:44:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	kernel test robot <lkp@intel.com>,
	Marco Crivellari <marco.crivellari@suse.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 5904/8679] <instantiation>:7:11: error:
 expected an immediate
Message-ID: <20250521224450.GA2412476@ax162>
References: <202505071331.Z0N2eSkr-lkp@intel.com>
 <20250508164308.GC834338@ax162>
 <aB0Lt7e4tnRK355u@alpha.franken.de>
 <alpine.DEB.2.21.2505121141400.46553@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2505121141400.46553@angie.orcam.me.uk>

On Mon, May 12, 2025 at 11:47:45AM +0100, Maciej W. Rozycki wrote:
> On Thu, 8 May 2025, Thomas Bogendoerfer wrote:
> 
> > > If it is not easy to work around, we can probably just leave it broken
> > > and tell anybody who notices to upgrade their compiler.
> > 
> > I wrapped my head around it today, but no idea how to solve it...
> 
> #if defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < vvv
> #error Please upgrade to version vvv to build this source
> #endif
> 
> -- or suchlike, I suppose.  Someone just needs to fill `vvv' in.

Given this file is unconditionally compiled, we would be better served
just adjusting min-tool-version.sh to show an error during configuration
time. Technically, this is only needed with LLVM_IAS=1 but that is the
default and adjusting as-version.sh to check the version would be a
little difficult but I will try to think about it more in the next few
days.

Cheers,
Nathan

diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 787868183b84..5f5176505665 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -30,6 +30,8 @@ llvm)
 		echo 15.0.0
 	elif [ "$SRCARCH" = loongarch ]; then
 		echo 18.0.0
+	elif [ "$SRCARCH" = mips ]; then
+		echo 21.0.0
 	else
 		echo 13.0.1
 	fi

Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9B4173
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NlLs77LK/wVjdAfQ8SfyJgTbnmFTAuvu/ZrfrkqzLic=; b=EXiaIIPmNTubRMiFY1iOdyBcgx
	O1sYvoBAJ1aFmcbVW/1Myjny2Juv6zcSjOzutXyi451H84w8iZ1t3HNNtEtbqh+o1vrw3iTQfYNO0
	n3GFkrwKxrHhtMNXBJS7/qf3mo/zOWlX2fYVRkqktm6zwfWKu1U4u3u7+RDBePReqJLc2rRJdgs8q
	XEEfl8hrvbgDD1fv5Q49Zo3AKjy2NWvNyWLNmbnZNDmH/2nhMkv7GaywSS/75aCZoeYuy0oVbwT+n
	52svAmhr5z8QvqDXtbi9sD9BwCaPnsB/g57U9wS9VebVfWuJtUfiE7AAfAGgKATCHuEGg2VJZ035g
	j1tf49Aw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56204)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1mvLRU-0000BX-86; Thu, 09 Dec 2021 15:34:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1mvLRS-0007Je-Oa; Thu, 09 Dec 2021 15:34:42 +0000
Date: Thu, 9 Dec 2021 15:34:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: arch/arm/kernel/traps.c:775:6: warning: no previous prototype
 for function 'abort'
Message-ID: <YbIiEqxPfbYr10pQ@shell.armlinux.org.uk>
References: <202112092330.MRS9Xygy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202112092330.MRS9Xygy-lkp@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Dec 09, 2021 at 11:22:48PM +0800, kernel test robot wrote:
> Hi Ard,
> 
> FYI, the error/warning still remains.

This is nothing new. You claim that the abort() warning newly shows up
as a result of a recent change, but I can most definitely assure you
that abort() has never had a prototype, and it's there because the
compiler can generate code that issues a branch to this function.

This can be seen in the blame output, which references the first commit
in the kernel tree for these lines.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

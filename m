Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269DC33FB
	for <llvm@lists.linux.dev>; Sat,  3 Dec 2022 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b8jU26nVv5zOpuzDY4RwO7PBnJsJWgH0sc80AjiDjCg=; b=0Opbfyx0A7KcUTzMBxsQam5MR2
	l6MSrcSSRtyJaDFtsvuJcPz7EPzYJo8F4ynaXRbCsckseKpHhXtY4+iCjwqSTJenHcMa5yeXLC9sk
	nUEidgOVOL46zFwEyJgxDaCUWRgVII7sB5/A1M4lqWymyUKmAPx2EnMsVwJFa1NHXI4a3YFSALpt0
	kamqwpd3Mn/B3Xg2VIdd3wesfmfG8mrHhfIn+27CIwFDR+pX3P7Z16usnSlH/4VY5F1Bgixddfcno
	JLwkg5LnNx/9PQnWHj+gEDA85AnJz1IlZMBoUDNqtj6NQRH+Mo3hhpXpSi7YCWHLE33+2M4W9LZ8Q
	Z57YNhHg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35548)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1p1WFe-0005Gi-11; Sat, 03 Dec 2022 17:24:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1p1WFb-0005W0-Or; Sat, 03 Dec 2022 17:24:31 +0000
Date: Sat, 3 Dec 2022 17:24:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: kernel test robot <lkp@intel.com>, devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next v2] net: sfp: clean up i2c-bus property parsing
Message-ID: <Y4uGT19d1Euz75Vd@shell.armlinux.org.uk>
References: <E1p1OIG-0098J4-EV@rmk-PC.armlinux.org.uk>
 <202212040026.WN9NQzqq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212040026.WN9NQzqq-lkp@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Dec 04, 2022 at 12:40:25AM +0800, kernel test robot wrote:
> Thank you for the patch! Perhaps something to improve:

Sigh... this is another stupidity.

> 73970055450eeb Russell King          2017-07-25  2701  	if (pdev->dev.of_node) {
> 73970055450eeb Russell King          2017-07-25 @2702  		struct device_node *node = pdev->dev.of_node;

"node" declared here...

> 259c8618b0099b Russell King          2017-12-14  2703  		const struct of_device_id *id;
> 73970055450eeb Russell King          2017-07-25  2704  
> 259c8618b0099b Russell King          2017-12-14  2705  		id = of_match_node(sfp_of_match, node);

... and clearly used here, so the code looks to be correct.

However, when CONFIG_OF is not set, of_match_node() does not make use
of this argument:

#define of_match_node(_matches, _node)  NULL

which results in otherwise correct code issuing a warning when
CONFIG_OF is disabled... and sure enough, your configuration has:

> # CONFIG_OF is not set

This illustrates just how bad an idea it is to use compiler macros for
this stuff - it actively hurts compile testing, because you have to
test every damn combination of configuration options to get proper
coverage, which is totally and utterly rediculous.

of_match_node() and ACPI_HANDLE_FWNODE() should *both* be inline
functions when the subsystem is disabled, so that incorrect arguments
can be detected, and warnings about unused variables such as the one
you're reporting here doesn't happen.

While the issue lies firmly in the realms of the DT (and ACPI) headers,
I will yet again respin this patch to sort this out - but really the
correct solution is to fix the bloody headers so compile coverage
actually works.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

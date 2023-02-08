Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69E99474;
	Wed,  8 Feb 2023 14:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E0AC433EF;
	Wed,  8 Feb 2023 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675867161;
	bh=JbqZpU27yOcLHEwpGp6fv33iNCb+DQaQiTJ1X82Qbmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPNbuKtUJFMMlfuXdjq+EPrr1zHnytdlhDoURKxFoe3usu/H33TaJHVYuP+bzDT2W
	 IFI7gndkhhJoBy3R17pruPbOJqwLcHUltoUAi9Ivz8cPr3MI8j4S8Y6qPKcebvoReQ
	 nzCq6LbupdWsWIIQxVVFVx0GOPH8LH/bcwtZaMt+25Xnd/2ATiAb78TdgcXOiC3Irn
	 UrSeWFsLr5neFZExoZ1MF5lx6vQ0G65LfeH8eeizvHhh8lFGPKTJc2G8k59FyL9xa7
	 CSLDmcwoItgkq6vMHNapTCjfQGpByXKMbTN6Uc54x4lDLnWWFmbBYC4GYmeDpN+RRM
	 pv/ty4pbn/EOg==
Date: Wed, 8 Feb 2023 07:39:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel test robot <lkp@intel.com>,
	Saurabh Sengar <ssengar@linux.microsoft.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	daniel.lezcano@linaro.org, tglx@linutronix.de,
	virtualization@lists.linux-foundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, mikelley@microsoft.com,
	ssengar@microsoft.com, dphadke@linux.microsoft.com,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 6/6] Driver: VMBus: Add device tree support
Message-ID: <Y+O0FtUkLyvJLSrR@dev-arch.thelio-3990X>
References: <1675756199-5917-7-git-send-email-ssengar@linux.microsoft.com>
 <202302081621.odizDzHG-lkp@intel.com>
 <39350ee9-c899-ba88-2e4e-103f93dcd722@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39350ee9-c899-ba88-2e4e-103f93dcd722@linaro.org>

On Wed, Feb 08, 2023 at 11:25:57AM +0100, Krzysztof Kozlowski wrote:
> On 08/02/2023 09:22, kernel test robot wrote:
> > Hi Saurabh,
> > 
> > Thank you for the patch! Perhaps something to improve:
> > 
> > [auto build test WARNING on next-20230207]
> > [cannot apply to robh/for-next tip/timers/core brgl/gpio/for-next wsa/i2c/for-next linus/master v6.2-rc7 v6.2-rc6 v6.2-rc5 v6.2-rc7]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> 
> All of your recent patches have build errors. Can you at least build
> test them before sending? It's a unnecessary noise in our mailboxes to
> get non-buildable patches, just to trigger compilation which you can
> easily do by your own. GCC is a free software...

For what it's worth, GCC does not have a warning like this, it just
accepts the incorrect location of the attribute, which has gotten others
in trouble before:

https://lore.kernel.org/CAHk-=wgf+kHeSZbpkZumWcTXUD7ordqTMvPRNL6aQVG1DSBDnQ@mail.gmail.com/

So the patch probably did build clean with GCC but that is one of the
reasons that there is no longer a compiler monopoly for the kernel ;)

Cheers,
Nathan

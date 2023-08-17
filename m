Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA88314F65;
	Thu, 17 Aug 2023 17:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF986C433C8;
	Thu, 17 Aug 2023 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692292127;
	bh=luPI5+O+LsNz3+a9A5QUGynXLWqFb2U+2TUCsHEXHE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQZOYoI5TSwahkn8oTnO+N4bI4wNAXEDDpMMkCV7Q867MlJ8Yto2jcDcjbvDLDSmW
	 5PPM/KjDuO36p0bvE6V/9lJp1wMsFhJuWBWdD05EtuEyK7FptX06cAuD5mv4YogckA
	 w6oC+RQ8Nq4Yu17ZvnfqzJV1ZRyId5VL13e6myEsTkRYe2Mn0CwsJ3RCQR4JQAm6EM
	 EHPAkgAMqkEQqVyEJrYCizr2VRF59nb+XrE5GA0CNv6aIb/NnxxWLoAgdr+UVyDP1M
	 6QB+5WnKW/wR8bhaB+9xttRwlhWSAl8vISScqnKkV66f/UDLSPc8oSOfOXQq1qyLoP
	 cOxiSbeTdjq6Q==
Date: Thu, 17 Aug 2023 10:08:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Artur Weber <aweber.kernel@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [linux-next:master 4727/8441]
 drivers/video/backlight/lp855x_bl.c:252:7: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <20230817170845.GA3299567@dev-arch.thelio-3990X>
References: <202308091728.NEJhgUPP-lkp@intel.com>
 <20230817170602.GJ986605@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817170602.GJ986605@google.com>

On Thu, Aug 17, 2023 at 06:06:02PM +0100, Lee Jones wrote:
> Arthur,
> 
> Please submit a follow-up patch or I'll have to revert it.

The follow up fix was sent a couple hours after this report:

https://lore.kernel.org/20230809114216.4078-1-aweber.kernel@gmail.com/

Cheers,
Nathan

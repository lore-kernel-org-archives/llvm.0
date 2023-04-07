Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC66FBD;
	Fri,  7 Apr 2023 17:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC94FC433EF;
	Fri,  7 Apr 2023 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680888760;
	bh=kOfFnNfCPJ2IKnu4CAEDUJyTJhJFhtY3VZ5zn9VGgUg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=etHf2zGGbcdq9TBhybRQK2jWK3DjVKQiiBpvcQVAnPtInhBYGIWPp9LoBlq6JyBMF
	 7zDWjr2YssoDpHtzKqaLELcbCXAE4SCYnHl3BqDRGT4fvdaEB9VPQZIQ4vuamteb7d
	 eH+reR3taH20rFQ1VyZVYv3Ngxv557mPKkbjGojiKbHbeF5DWyfELeax8GvfydSB2x
	 SL2AyhPXttInijDbWam5u9JR/8tVG0il7GkjfY1y6zhnf7RJjvu+cE/U9GDF5FEdhB
	 SHLBMSR7aLttZbO5I2K7Ba9l2X9rJ84z4NxAif8ABCx1pTUUiIw8zG+98aHV11j/Ox
	 rwVvbHer6oYVw==
Message-ID: <de9f8156-9c68-a237-2f03-e9fe41c04beb@kernel.org>
Date: Fri, 7 Apr 2023 19:32:20 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] vdpa: solidrun: constify pointers to hwmon_channel_info
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <20230407150130.79917-1-krzysztof.kozlowski@linaro.org>
 <202304080108.n5D0MIBE-lkp@intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <202304080108.n5D0MIBE-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/04/2023 19:18, kernel test robot wrote:
> Hi Krzysztof,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.3-rc5 next-20230406]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

Dependency is provided as link to lore, as typical in all submissions.
The --base does not make much sense since dependency is only on the lists.

Best regards,
Krzysztof


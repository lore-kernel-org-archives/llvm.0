Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8F2C85
	for <llvm@lists.linux.dev>; Mon,  8 Nov 2021 10:55:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636368946; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=4M9uOTBXUH00cBBpv3ijxurnpayOaBUBlP63Y3jJYOc=; b=QOs0kkoX7HIF3J9lujmsrZgCbHdr9ka2tthkaZcUqrnFaae1WtmVvf8wMLYJFfEaF2UZLBBB
 k0uA8ISwyiEln1Q2/IehS7A9hq0jALB2LB3bREK111PFO6WvRYw/3ihbwEgg8U2pdYNFrZDz
 KrweSMcS9Iwnwfj82vJnxMJucNg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmNGYzNyIsICJsbHZtQGxpc3RzLmxpbnV4LmRldiIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 618902318037be2651bc03a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 10:55:45
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 8292CC43616; Mon,  8 Nov 2021 10:55:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
	autolearn=no autolearn_force=no version=3.4.0
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 92915C4338F;
	Mon,  8 Nov 2021 10:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 92915C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: kernel test robot <lkp@intel.com>
Cc: Seevalamuthu Mariappan <seevalam@codeaurora.org>,  llvm@lists.linux.dev,  kbuild-all@lists.01.org,  linux-kernel@vger.kernel.org,  Miles Hu <milehu@codeaurora.org>,  Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>,  Jouni Malinen <jouni@codeaurora.org>,
    "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: drivers/net/wireless/ath/ath11k/mac.c:5408:22: error: parameter 'changed_flags' set but not used
References: <202111061154.1NPBOyXF-lkp@intel.com>
Date: Mon, 08 Nov 2021 12:55:39 +0200
In-Reply-To: <202111061154.1NPBOyXF-lkp@intel.com> (kernel test robot's
	message of "Sat, 6 Nov 2021 11:54:04 +0800")
Message-ID: <87v912q5lg.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

+ ath11k list

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fe91c4725aeed35023ba4f7a1e1adfebb6878c23
> commit: 689a5e6fff75229ac7c2af7a9c51dc2d3ca1882b ath11k: monitor mode clean up to use separate APIs
> date:   6 weeks ago
> config: hexagon-buildonly-randconfig-r006-20211013 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a8c695542b2987eb9a203d5663a0740cb4725f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=689a5e6fff75229ac7c2af7a9c51dc2d3ca1882b
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 689a5e6fff75229ac7c2af7a9c51dc2d3ca1882b
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=hexagon 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> drivers/net/wireless/ath/ath11k/mac.c:5408:22: error: parameter 'changed_flags' set but not used [-Werror,-Wunused-but-set-parameter]
>                                               unsigned int changed_flags,
>                                                            ^
>    1 error generated.

Looks like a valid warning to me, can someone submit a patch?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCC868
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 13:37:10 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id b15so13894132edd.7
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hSoiWGmAid6Jcw8dbKeL1Gu/MkI3FecJPwAl3ahoMxo=;
        b=mOlRxGG+AiBEx1fQXJNVPuhU0OERNEerkC7arcIh8ezYZQKnqvQQDMgd/A+506w33K
         2W0C6YtKz7GXNLvw8B1ei5QaTQTb2icVFyg/OHQerAdOXRn7UHppZOjR5Tf4BczEaibD
         xv4DseRHSL8NJm4rTwTdep+vJq/aKkx7A06Iy9cCMiYm7gC6R0vKWi36IadrsF/OPjL3
         9inbLAEZWeqvN4O4nBcjWC0YSSydEY23qmoHki/8ZposSnvHRTXe32+XhwNKkZfhOr/B
         nO0WIl9EenmPBuaZeVio6sWfCKllTXlgxHpZ3CUn227S3nRylXx+xp2/gqe56YJCfiVu
         BLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hSoiWGmAid6Jcw8dbKeL1Gu/MkI3FecJPwAl3ahoMxo=;
        b=eBo1IrgPxgO+7WzHEni5kFnl+6UKyZVNQA9lvRZwbcOiI/PHjGeeEEJf46dfYB3zjY
         dnZDa090tkkCfP1jqr3YVdBGkK+Ehe/CrvRYF/5VzWj5TfIl62F80wNhBU4SGZxClniF
         yVGTawwB67FiXtJHeEbCx5PG/3dW087wzpkDJQSKamdYUNKcS8rgGlnwVgReUnaClBZe
         41l6yG9CUH5xAAuPUj9bM4+gq6UIEpM9O7IOqGlNTm9OjgResu8UCDFod4kmQC0kTmAt
         2jYmGTzQ7LSrZz3Cmnpi9wgvFV/1DFwBTp5YsyTofbMHaZI4LDAAwF0FdB2kLWpfDtyi
         bVlg==
X-Gm-Message-State: AOAM530m6enq3Z96qutuOsqwKtuWuGihGXw0a4pAYi0Pi91gh3WkrpwC
	8OXIRDpaKKT9D/hxvN3KmpM=
X-Google-Smtp-Source: ABdhPJwjb/sXYSPmkbBrmeK9+ELiIYipL0vIxC+DcGaeS7oDI+DsDo34LwjOShvmPLPNbLz7V3WroQ==
X-Received: by 2002:a17:907:94c2:: with SMTP id dn2mr51961530ejc.312.1636119428637;
        Fri, 05 Nov 2021 06:37:08 -0700 (PDT)
Received: from skbuf ([188.25.175.102])
        by smtp.gmail.com with ESMTPSA id hc10sm4085126ejc.99.2021.11.05.06.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:37:08 -0700 (PDT)
Date: Fri, 5 Nov 2021 15:37:06 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Martin Kaistra <martin.kaistra@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, Richard Cochran <richardcochran@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>
Subject: Re: [PATCH 6/7] net: dsa: b53: Add logic for TX timestamping
Message-ID: <20211105133706.3dxnnxurwrxrqczs@skbuf>
References: <20211104133204.19757-7-martin.kaistra@linutronix.de>
 <202111051954.rPDqSaCq-lkp@intel.com>
 <b99aa58c-26c0-768a-ebcd-f46cb49a2ca7@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b99aa58c-26c0-768a-ebcd-f46cb49a2ca7@linutronix.de>

On Fri, Nov 05, 2021 at 01:59:52PM +0100, Martin Kaistra wrote:
> 
> 
> Am 05.11.21 um 12:17 schrieb kernel test robot:
> > Hi Martin,
> > 
> > Thank you for the patch! Yet something to improve:
> > 
> > [auto build test ERROR on net-next/master]
> > [also build test ERROR on net/master linus/master next-20211105]
> > [cannot apply to tip/timers/core v5.15]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> > 
> > url:    https://github.com/0day-ci/linux/commits/Martin-Kaistra/Add-PTP-support-for-BCM53128-switch/20211104-213538
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 84882cf72cd774cf16fd338bdbf00f69ac9f9194
> > config: x86_64-randconfig-r033-20211105 (attached as .config)
> > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 847a6807332b13f43704327c2d30103ec0347c77)
> > reproduce (this is a W=1 build):
> >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          # https://github.com/0day-ci/linux/commit/b484f272339c8b2fd87f5d3493849439003c0026
> >          git remote add linux-review https://github.com/0day-ci/linux
> >          git fetch --no-tags linux-review Martin-Kaistra/Add-PTP-support-for-BCM53128-switch/20211104-213538
> >          git checkout b484f272339c8b2fd87f5d3493849439003c0026
> >          # save the attached .config to linux build tree
> >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> > > > drivers/net/dsa/b53/b53_common.c:2304:20: error: incompatible function pointer types initializing 'void (*)(struct dsa_switch *, int, struct sk_buff *)' with an expression of type 'bool (struct dsa_switch *, int, struct sk_buff *)' (aka '_Bool (struct dsa_switch *, int, struct sk_buff *)') [-Werror,-Wincompatible-function-pointer-types]
> >             .port_txtstamp          = b53_port_txtstamp,
> >                                       ^~~~~~~~~~~~~~~~~
> >     1 error generated.
> > 
> > 
> 
> oops, I will fix the signature of b53_port_txtstamp() for the
> !CONFIG_B53_PTP case in v2.

Can you please ensure that it also _works_ when CONFIG_B53_PTP is disabled?
FYI I will not start reviewing this patch set until it compiles correctly.
Thanks.

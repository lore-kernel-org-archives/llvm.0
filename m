Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9888110E
	for <llvm@lists.linux.dev>; Mon, 26 Jun 2023 06:53:48 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b7f92b764dso3049685ad.2
        for <llvm@lists.linux.dev>; Sun, 25 Jun 2023 23:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687762428; x=1690354428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/mKVCyR4eEZFj8L7Z3aDYIifcOE6uAur+24zt0VYeDI=;
        b=brl03/H6KgTnaLWI8CNDAduqg7RoE1gg9JCbwaNT60hwO8F4wFU8Hg7jfNAU41ZXPG
         Q2ce9196eClhD11zl1wco14GUuekQ6ARdNjKxReA562N8qMbYonEWLxTvAhlh1nRmar+
         N68FCTXk7iCUw9Ln9ZFeKyEkz1Xu1+3b5e7EDtt+FYlG4+PFjMdK6KJ01MvV6lXAfrFU
         OWYbe6E5CPoyBZ4gTyFTaxZnMF2QKDQDozAeJB+0T8u6fP4EM2qSBqMsg0u3cJNzozCh
         zW+T2ZPIVH7y7LYnztqiOGWEJfeuWBVhRWpa8l4Nlf59LNeLAYNb0eIdw9AHzGkEzTAP
         msew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687762428; x=1690354428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mKVCyR4eEZFj8L7Z3aDYIifcOE6uAur+24zt0VYeDI=;
        b=XJFAS2qb677J0y0ivJvb2fwkxU3X3ehcmJZJj1qde0HG3nD36au6EJ0DK/C7rCBzjd
         Mwl8lRPyGbqjwhnD3p17MevmNXK/NLW/4Ue/6M4ORqOrEEplez9lGFwTOwb7yCUJ28/5
         B7ZAxwSGF8iZgiEItbDrXENQ/RfjRNOre5SOIeH+RqAWP8oh5r/qqC/z/WeOD7SX3G/d
         pnkWgpOlcgwQ4Z72Gr6eZqvEmXe3sMBjFAiKxZVy5Cn6FEJIbmeMfxXdzsXO6Eto9xcT
         h9hOAg/9BZzzAfONTSWY96qbpAUHzun4KCXSzX8FevSDUojJWxrVI5nBZ4HcOiBHoace
         kZoQ==
X-Gm-Message-State: AC+VfDxnImiT2k5KSiQH6coqBUUJKyrHIX9j4L1Do1Sqj4oSry4bigef
	XEHtyrFwFCSWDs1oU/G5jucfAQ==
X-Google-Smtp-Source: ACHHUZ43KkptyRWbzW85nw7UGFAQY+W/7tcWHv6td0zLHjtFfKSFvRT06mCeQFZNmkxWEfKN7dXZYw==
X-Received: by 2002:a17:903:18b:b0:1b6:eff5:c011 with SMTP id z11-20020a170903018b00b001b6eff5c011mr3338566plg.23.1687762428244;
        Sun, 25 Jun 2023 23:53:48 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001aaecc0b6ffsm3428199pls.160.2023.06.25.23.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 23:53:47 -0700 (PDT)
Date: Mon, 26 Jun 2023 12:23:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5324/12162]
 drivers/cpufreq/cpufreq-dt-platdev.c:18:34: warning: unused variable
 'allowlist'
Message-ID: <20230626065345.2i562lyf23fantlm@vireshk-i7>
References: <202306250025.savpMM8L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306250025.savpMM8L-lkp@intel.com>

On 25-06-23, 00:28, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8d2be868b42c08290509c60515865f4de24ea704
> commit: 3b062a086984d35a3c6d3a1c7841d0aa73aa76af [5324/12162] cpufreq: dt-platdev: Support building as module
> config: i386-randconfig-r035-20230624 (https://download.01.org/0day-ci/archive/20230625/202306250025.savpMM8L-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20230625/202306250025.savpMM8L-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306250025.savpMM8L-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/cpufreq/cpufreq-dt-platdev.c:18:34: warning: unused variable 'allowlist' [-Wunused-const-variable]
>    static const struct of_device_id allowlist[] __initconst = {
>                                     ^
> >> drivers/cpufreq/cpufreq-dt-platdev.c:105:34: warning: unused variable 'blocklist' [-Wunused-const-variable]
>    static const struct of_device_id blocklist[] __initconst = {
>                                     ^
>    2 warnings generated.
> 

Hi,

Do you have any patch to fix this ? I am not sure why the error is coming here
and I am not able to reproduce it too.

-- 
viresh

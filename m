Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D552C3FD4
	for <llvm@lists.linux.dev>; Fri, 30 Jun 2023 06:06:22 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-666ed230c81so1385067b3a.0
        for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 23:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688105182; x=1690697182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FoQDqvgFjP9yIbNKgNX/63X8qzFVfopYrI03Z5gPuZs=;
        b=YIKi3vyfcjrWLRboUKSiLakgNi2F9x57FRd5SmknzlK3rspfA0uYAcbIhva27p6QDz
         VU5AX/yNquCmAikErptNFkBPOfwyqHl0kAYMpW4+IlPDwlBrRasgxaovywpLeExT3ZqU
         JCKifxzyzqnZevbuBVTmJnjYMVAOWWUk47QApDTdKRzmfa29nq/JAmAP64gD5zidjyq1
         8ZhbPCstfVz7ar1prAb8AoriRanmtjjldx/lrJ8YsqnAFNdGc3JDtUiyUodxszLFAleW
         B3IKc3dCKQ/GjJQrdaJMRrkkH+ri00sxmpv33BVLxzFA5LCZt/4TODK9ozApWnjLPOrX
         0msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688105182; x=1690697182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoQDqvgFjP9yIbNKgNX/63X8qzFVfopYrI03Z5gPuZs=;
        b=AAtuF/pJmGT1v7CjPai4LUof6zJBYvQljIkATWjLwCixuV7KM99mbW/71ZtVNCKgS4
         IadvPPoyhGZjsfECnxclK4p1I1zQyJI40dqHarV/M8uraUkWkmK2JKjrvNafwEKx4wRy
         hze3Xuu6joELvACdzYBxLL+78HbAUo7j1EIDoXrdu8vPbNF7TOYAdy/guoV8VMM2B5o0
         qOQCho8sjMNUsAFLOC2P1U0EPa3dvsv+Zs+lPNfqwpF0Ski/9ZmzIyLpKyb5cgMWZM1L
         VRODFj1sXlz2VjHa7RKp5IgCr8TB8iP1Bqgy7jve/r0gOM6QuKDJE4qfPqOLQUkzChsW
         GaLw==
X-Gm-Message-State: ABy/qLbHVibUlhds3iuPoqsejc/oTYtK4th8dRuQeWnaUztbaVbEgjPe
	cnSbtODPob2T/UpildvSFSHt/Q==
X-Google-Smtp-Source: APBJJlHu5lo/ftGXXxmHcultaYkBbYMsHO52f4I9kLJs5dcbCEzDSBQuwf5ZAjZlxyBZksdGLuqLCQ==
X-Received: by 2002:a05:6a00:2282:b0:668:7325:e184 with SMTP id f2-20020a056a00228200b006687325e184mr2392442pfe.16.1688105182122;
        Thu, 29 Jun 2023 23:06:22 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id e5-20020a62ee05000000b0064fe06fe712sm9232900pfi.129.2023.06.29.23.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 23:06:21 -0700 (PDT)
Date: Fri, 30 Jun 2023 11:36:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Zhipeng Wang <zhipeng.wang_1@nxp.com>,
	kernel test robot <lkp@intel.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [EXT] Re: [linux-next:master 5324/12162]
 drivers/cpufreq/cpufreq-dt-platdev.c:18:34: warning: unused variable
 'allowlist'
Message-ID: <20230630060619.zsfw4aynce7wt7cv@vireshk-i7>
References: <202306250025.savpMM8L-lkp@intel.com>
 <20230626065345.2i562lyf23fantlm@vireshk-i7>
 <PAXPR04MB8304F58EE8AE785A8B823C09EB24A@PAXPR04MB8304.eurprd04.prod.outlook.com>
 <20230628153923.GA254367@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628153923.GA254367@dev-arch.thelio-3990X>

On 28-06-23, 08:39, Nathan Chancellor wrote:
> On Wed, Jun 28, 2023 at 01:33:40AM +0000, Zhipeng Wang wrote:
> > Hi,
> > 
> > I'm sorry for responding so late. I have also tried to reproduce this issue many times and I have not reproduced it.
> 
> I can reproduce this with the configuration that the robot provided,
> even with GCC.
> 
>   $ curl -LSso .config https://download.01.org/0day-ci/archive/20230625/202306250025.savpMM8L-lkp@intel.com/config
> 
>   $ make -skj"$(nproc)" ARCH=i386 CROSS_COMPILE=x86_64-linux- W=1 olddefconfig drivers/cpufreq/cpufreq-dt-platdev.o
>   drivers/cpufreq/cpufreq-dt-platdev.c:105:34: warning: 'blocklist' defined but not used [-Wunused-const-variable=]
>     102 | static const struct of_device_id blocklist[] __initconst = {
>         |                                  ^~~~~~~~~
>   drivers/cpufreq/cpufreq-dt-platdev.c:18:34: warning: 'allowlist' defined but not used [-Wunused-const-variable=]
>      17 | static const struct of_device_id allowlist[] __initconst = {
>         |                                  ^~~~~~~~~
> 
> The W=1 is the key here, this warning is not enabled in a normal build. This
> configuration does not have CONFIG_OF=y, so of_match_node() is just defined as
> NULL, meaning these variables are indeed unused.

Ahh. Sent a patch to fix it now. Thanks.

> However, I am kind of confused as to how the robot landed on 3b062a08698 as the
> problematic commit, as I can reproduce these warnings without it.

Right.

-- 
viresh

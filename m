Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4C0173
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 04:46:36 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id q22-20020a17090a431600b001b0e3a74cf7so495354pjg.1
        for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 20:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eDWxnzvCmzrzAprZHasD1ozU4OVidLGPGD2BiUAz8d8=;
        b=YqGcQJz6CqIDBwpk4gkCtmXJDoi9i7ZQ0vcyjJfLVvkA8MOQky4ap5Tcly/VW2+sqy
         a5BhEAxfxjG0QoYeMKcORdQkjnMg7IifmA/3xKVce+SsfVmNTAAQr7G1UkRrnpd6yoqd
         FiadgYej94k+RaBd5vt/t5eT4DMZacLRXtEfID+7mlZp71AwYjuPDX8q4/pcRCd9d3fR
         K3tQrei+J1/YZGqH6jcF+quE86vmUxtEnTQgNkXQZYIto8o06lc9dCAqKuCzWbP0MldS
         1wzRUcgmIFudZ8P6p7BApdvvWbzMpQXVo1gdAJVOc4HpBhg9geCpgmnmJiTIPYbt7MNf
         O1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eDWxnzvCmzrzAprZHasD1ozU4OVidLGPGD2BiUAz8d8=;
        b=11BsuZwzNRWrUiGBipZEvMOraJKkVCFnBjCbj2jUFTfJkmerbsJh+ZfIluh6zuTNO7
         5gvsW8w9tTmvoLUN11N4sOjVGEPZJSqeBuzY72ThqBki0xhlYo6SS6CArNjheWkpJEle
         Hw8llucjJONqyMjsqDtOeYbK5PnHwRs3eGAcpfkOtRrE5QIh1rs5BfcFNs9pHNSZcumb
         6bJnbkDtdBrDfEt8y7ezL+zWlSEEMJj72Y86UMIgi8vyGBBsDtVXOir/Yq/8tfEJ8jCU
         hKIfW4qWtaqKKNhxazB7GI7Ic9xMXnetEvn7wyc1e8gLkjlkdEoMaOGi0xakOhP+GeNS
         oIxA==
X-Gm-Message-State: AOAM530ugytQueQKVpsHh3kNS6ECVEgOFmjCeff0sFKB2PANtGgr+0Qc
	Bf69K1gF8zA28P794vbPPBi2DQ==
X-Google-Smtp-Source: ABdhPJzk5JAJM+Hd05z4l0QSn+h8QuOsiGk7Zrck5Jvj2mk0n0Z3WfnW01eDSjbRA8yoAe3pqclASw==
X-Received: by 2002:a17:90b:4b48:: with SMTP id mi8mr3063403pjb.214.1639457195457;
        Mon, 13 Dec 2021 20:46:35 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([134.195.101.46])
        by smtp.gmail.com with ESMTPSA id a9sm7972769pgl.26.2021.12.13.20.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 20:46:35 -0800 (PST)
Date: Tue, 14 Dec 2021 12:46:28 +0800
From: Leo Yan <leo.yan@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kbuild-all@lists.01.org
Subject: Re: [PATCH v2 4/4] coresight: etm3x: Don't trace PID for non-root
 PID namespace
Message-ID: <20211214044628.GB1884193@leoy-ThinkPad-X240s>
References: <20211213121323.1887180-5-leo.yan@linaro.org>
 <202112140344.viPmOWp6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202112140344.viPmOWp6-lkp@intel.com>

Hi,

On Tue, Dec 14, 2021 at 03:16:42AM +0800, kernel test robot wrote:
> Hi Leo,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.16-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Leo-Yan/coresight-etm-Correct-PID-tracing-for-non-root-namespace/20211213-201632
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2585cf9dfaaddf00b069673f27bb3f8530e2039c
> config: arm-buildonly-randconfig-r003-20211213 (https://download.01.org/0day-ci/archive/20211214/202112140344.viPmOWp6-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://github.com/0day-ci/linux/commit/81d5f47788c40d34c8159d64d4505eb485254e8f
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Leo-Yan/coresight-etm-Correct-PID-tracing-for-non-root-namespace/20211213-201632
>         git checkout 81d5f47788c40d34c8159d64d4505eb485254e8f
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/hwtracing/coresight/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/hwtracing/coresight/coresight-etm3x-core.c:344:7: error: implicit declaration of function 'task_is_in_init_pid_ns' [-Werror,-Wimplicit-function-declaration]
>            if (!task_is_in_init_pid_ns(current))
>                 ^
>    1 error generated.
> 
> 
> vim +/task_is_in_init_pid_ns +344 drivers/hwtracing/coresight/coresight-etm3x-core.c
> 
>    301	
>    302	#define ETM3X_SUPPORTED_OPTIONS (ETMCR_CYC_ACC | \
>    303					 ETMCR_TIMESTAMP_EN | \
>    304					 ETMCR_RETURN_STACK)
>    305	
>    306	static int etm_parse_event_config(struct etm_drvdata *drvdata,
>    307					  struct perf_event *event)
>    308	{
>    309		struct etm_config *config = &drvdata->config;
>    310		struct perf_event_attr *attr = &event->attr;
>    311	
>    312		if (!attr)
>    313			return -EINVAL;
>    314	
>    315		/* Clear configuration from previous run */
>    316		memset(config, 0, sizeof(struct etm_config));
>    317	
>    318		if (attr->exclude_kernel)
>    319			config->mode = ETM_MODE_EXCL_KERN;
>    320	
>    321		if (attr->exclude_user)
>    322			config->mode = ETM_MODE_EXCL_USER;
>    323	
>    324		/* Always start from the default config */
>    325		etm_set_default(config);
>    326	
>    327		/*
>    328		 * By default the tracers are configured to trace the whole address
>    329		 * range.  Narrow the field only if requested by user space.
>    330		 */
>    331		if (config->mode)
>    332			etm_config_trace_mode(config);
>    333	
>    334		/*
>    335		 * At this time only cycle accurate, return stack  and timestamp
>    336		 * options are available.
>    337		 */
>    338		if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
>    339			return -EINVAL;
>    340	
>    341		config->ctrl = attr->config;
>    342	
>    343		/* Don't trace contextID when runs in non-root PID namespace */
>  > 344		if (!task_is_in_init_pid_ns(current))

This patchset is based on another patchset [1], as described on the
cover letter patch.  This is why here reports for building failure.

To avoid the false positive reporting, if any better practice I can
follow up to resolve the dependency between two patchsets, please let
me know and I will do in next time.

Thanks,
Leo

[1] https://lore.kernel.org/lkml/20211208083320.472503-1-leo.yan@linaro.org/

>    345			config->ctrl &= ~ETMCR_CTXID_SIZE;
>    346	
>    347		/*
>    348		 * Possible to have cores with PTM (supports ret stack) and ETM
>    349		 * (never has ret stack) on the same SoC. So if we have a request
>    350		 * for return stack that can't be honoured on this core then
>    351		 * clear the bit - trace will still continue normally
>    352		 */
>    353		if ((config->ctrl & ETMCR_RETURN_STACK) &&
>    354		    !(drvdata->etmccer & ETMCCER_RETSTACK))
>    355			config->ctrl &= ~ETMCR_RETURN_STACK;
>    356	
>    357		return 0;
>    358	}
>    359	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

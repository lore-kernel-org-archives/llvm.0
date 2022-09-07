Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7207789DD
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 23:59:54 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 73so15116938pga.1
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 16:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Xm8twwbhSCZxaH4aFeYsoFerGkRqg7GnennRIfUkuB4=;
        b=Nvf/udBBKl35LSP+VeG4z7B+tugFJniX0DKqaCKhWxzl5j3IeduP5Wf4qvFB54Ucjh
         e3LaiMyfxfFLvoz11EEDHAhxDtgf67gHuKNSvLXp6PaCyjSbu2er0ZlaRdrZjAAJ5SS7
         RcRJTttFQwcNJBsKwiogM2W+a9No31STFR+7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Xm8twwbhSCZxaH4aFeYsoFerGkRqg7GnennRIfUkuB4=;
        b=KDqos1hpmYqNWfaSSWhQG1rtJeoKYEBwAR+Md8vyWieoZQHznMqXOJCLdWGFdyrkQF
         K2L24nW1aJmcgqKYCEJGJGFS9x/38LbLlTDrENEWh3OZTQUM0YTWZgLgCoTqPGveN89M
         8wGNyIHwTjEJBe7IWAZSBJQGqvZMoylvq+U8VipN14v6HI/7Z1RySE0XF9oHlUw9QTux
         qcTw3m+ZFVPPeLfuJCY8OnHjM1O4CngxYz/PHYEAnoMF3IP53GuCmodovAILi/4wGENc
         h5iLrb2RcsJTdEuZI0Opr/5VBAcmX9tfx5T+c3Bi+3arPjHi5uA9KTNOCw3e29GGsrg4
         Ubvg==
X-Gm-Message-State: ACgBeo27poFt7Dsm2Dbk4iGvlc8JQox9KXCtckFIt2xVX+hO5OixAibI
	B1wgEC9reucHLanSmmAKujwfMg==
X-Google-Smtp-Source: AA6agR6e+TA2LHRavyzzo6438GAoeDUBS7zGKy819y+7v9KvwJYGlmxIQ9m86IAP3JhW9ZfqP2YUmQ==
X-Received: by 2002:a63:886:0:b0:434:8606:ce93 with SMTP id 128-20020a630886000000b004348606ce93mr5447876pgi.281.1662595193850;
        Wed, 07 Sep 2022 16:59:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n125-20020a634083000000b0042b5095b7b4sm11288669pga.5.2022.09.07.16.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:59:53 -0700 (PDT)
Date: Wed, 7 Sep 2022 16:59:52 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/net/wireless/ath/ath10k/htt.h:1677:2: warning: field
 within 'struct htt_tx_fetch_ind' is less aligned than 'union
 htt_tx_fetch_ind::(anonymous at
 drivers/net/wireless/ath/ath10k/htt.h:1677:2)' and is usually due to 'struct
 htt_tx_fetch_ind' being...
Message-ID: <202209071657.0A6FF97@keescook>
References: <202209031855.LVCj2Q6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209031855.LVCj2Q6u-lkp@intel.com>

On Sat, Sep 03, 2022 at 06:08:27PM +0800, kernel test robot wrote:
> Hi Kees,
> 
> FYI, the error/warning still remains.

Thanks for the heads-up. This appears unrelated to the treewide change
-- it just became a bit louder. The unaligned access warning was always
present. "pahole" output shows no changes to struct member offsets nor
struct sizes.

-Kees

> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   d895ec7938c431fe61a731939da76a6461bc6133
> commit: fa7845cfd53f3b1d3f60efa55db89805595bc045 treewide: Replace open-coded flex arrays in unions
> date:   11 months ago
> config: arm-randconfig-r031-20220903 (https://download.01.org/0day-ci/archive/20220903/202209031855.LVCj2Q6u-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fa7845cfd53f3b1d3f60efa55db89805595bc045
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout fa7845cfd53f3b1d3f60efa55db89805595bc045
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/net/wireless/ath/ath10k/mac.c:8:
>    In file included from drivers/net/wireless/ath/ath10k/mac.h:11:
>    In file included from drivers/net/wireless/ath/ath10k/core.h:18:
>    drivers/net/wireless/ath/ath10k/htt.h:721:34: warning: field prefix within 'struct htt_rx_indication' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            struct htt_rx_indication_prefix prefix;
>                                            ^
>    drivers/net/wireless/ath/ath10k/htt.h:742:34: warning: field prefix within 'struct htt_rx_indication_hl' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication_hl' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            struct htt_rx_indication_prefix prefix;
>                                            ^
> >> drivers/net/wireless/ath/ath10k/htt.h:1677:2: warning: field  within 'struct htt_tx_fetch_ind' is less aligned than 'union htt_tx_fetch_ind::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1677:2)' and is usually due to 'struct htt_tx_fetch_ind' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            union {
>            ^
>    drivers/net/wireless/ath/ath10k/htt.h:1815:2: warning: field  within 'struct htt_resp' is less aligned than 'union htt_resp::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1815:2)' and is usually due to 'struct htt_resp' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            union {
>            ^
>    drivers/net/wireless/ath/ath10k/mac.c:5942:22: warning: parameter 'changed_flags' set but not used [-Wunused-but-set-parameter]
>                                        unsigned int changed_flags,
>                                                     ^
>    5 warnings generated.
> --
>    In file included from drivers/net/wireless/ath/ath10k/debug.c:14:
>    In file included from drivers/net/wireless/ath/ath10k/core.h:18:
>    drivers/net/wireless/ath/ath10k/htt.h:721:34: warning: field prefix within 'struct htt_rx_indication' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            struct htt_rx_indication_prefix prefix;
>                                            ^
>    drivers/net/wireless/ath/ath10k/htt.h:742:34: warning: field prefix within 'struct htt_rx_indication_hl' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication_hl' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            struct htt_rx_indication_prefix prefix;
>                                            ^
> >> drivers/net/wireless/ath/ath10k/htt.h:1677:2: warning: field  within 'struct htt_tx_fetch_ind' is less aligned than 'union htt_tx_fetch_ind::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1677:2)' and is usually due to 'struct htt_tx_fetch_ind' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            union {
>            ^
>    drivers/net/wireless/ath/ath10k/htt.h:1815:2: warning: field  within 'struct htt_resp' is less aligned than 'union htt_resp::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1815:2)' and is usually due to 'struct htt_resp' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            union {
>            ^
>    4 warnings generated.
> --
>    In file included from drivers/net/wireless/ath/ath10k/ce.c:8:
>    In file included from drivers/net/wireless/ath/ath10k/hif.h:11:
>    In file included from drivers/net/wireless/ath/ath10k/core.h:18:
>    drivers/net/wireless/ath/ath10k/htt.h:721:34: warning: field prefix within 'struct htt_rx_indication' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            struct htt_rx_indication_prefix prefix;
>                                            ^
>    drivers/net/wireless/ath/ath10k/htt.h:742:34: warning: field prefix within 'struct htt_rx_indication_hl' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication_hl' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            struct htt_rx_indication_prefix prefix;
>                                            ^
> >> drivers/net/wireless/ath/ath10k/htt.h:1677:2: warning: field  within 'struct htt_tx_fetch_ind' is less aligned than 'union htt_tx_fetch_ind::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1677:2)' and is usually due to 'struct htt_tx_fetch_ind' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            union {
>            ^
>    drivers/net/wireless/ath/ath10k/htt.h:1815:2: warning: field  within 'struct htt_resp' is less aligned than 'union htt_resp::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1815:2)' and is usually due to 'struct htt_resp' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            union {
>            ^
>    drivers/net/wireless/ath/ath10k/ce.c:127:1: warning: unused function 'ath10k_get_ring_byte' [-Wunused-function]
>    ath10k_get_ring_byte(unsigned int offset,
>    ^
>    drivers/net/wireless/ath/ath10k/ce.c:212:1: warning: unused function 'ath10k_ce_shadow_dest_ring_write_index_set' [-Wunused-function]
>    ath10k_ce_shadow_dest_ring_write_index_set(struct ath10k *ar,
>    ^
>    drivers/net/wireless/ath/ath10k/ce.c:449:20: warning: unused function 'ath10k_ce_error_intr_enable' [-Wunused-function]
>    static inline void ath10k_ce_error_intr_enable(struct ath10k *ar,
>                       ^
>    7 warnings generated.
> 
> 
> vim +1677 drivers/net/wireless/ath/ath10k/htt.h
> 
>   1670	
>   1671	struct htt_tx_fetch_ind {
>   1672		u8 pad0;
>   1673		__le16 fetch_seq_num;
>   1674		__le32 token;
>   1675		__le16 num_resp_ids;
>   1676		__le16 num_records;
> > 1677		union {
>   1678			/* ath10k_htt_get_tx_fetch_ind_resp_ids() */
>   1679			DECLARE_FLEX_ARRAY(__le32, resp_ids);
>   1680			DECLARE_FLEX_ARRAY(struct htt_tx_fetch_record, records);
>   1681		};
>   1682	} __packed;
>   1683	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

-- 
Kees Cook

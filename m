Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F35BA5D;
	Tue, 15 Nov 2022 17:16:10 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5so10127340wmo.1;
        Tue, 15 Nov 2022 09:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7juo2FoT4miYQDNoa2XkhqNtIZm9eHKB/9DZ7kVhm0M=;
        b=JJdlJuuUNsGwkfEj/2B1NLWQeqdLkWvgeVEFlnZNFdBBWIK5BmOcdElxUtypefal3F
         bEpF2xN2+LNNQjrs6n7AEXWgX/O/URCwFvHciO6AgEl0Rm9lv1yQh9SnP5DKxzFB2SOY
         o4DYwl6btR0bMN8joGBRXwt7qIckxOTnaHFJZg4hkLRG2VxCoFyb4akg7zvTOGtY2R8V
         qtvc8UclEnvxjjy6NU1Seb7A0E8b0HLiHiEWNXpd21oL+r7P+WXNh2GNWcBVXEAIXtkw
         lAe5rkpowawIKBUUztQin17hU4u95tNtmQgcBArH+awd29Pt1kr8vIWRKZejmIELfno1
         v/eg==
X-Gm-Message-State: ANoB5plhaJ2PGAOMMjeFLuY7hZBfMu9NrnfOv9sNTrF9B6dYFv8HL5C5
	pPQFMjBId2uYOtC7xxyJlMU=
X-Google-Smtp-Source: AA0mqf60l9fSFKwJqJfSNq4xWLwxfeVNuxNQW1LBIi1bBHUOmxy58IlUZnqXV4GuDJZsWiosWty2Jw==
X-Received: by 2002:a05:600c:3d12:b0:3cf:92cc:9e5f with SMTP id bh18-20020a05600c3d1200b003cf92cc9e5fmr2255898wmb.181.1668532569222;
        Tue, 15 Nov 2022 09:16:09 -0800 (PST)
Received: from [192.168.64.94] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id b3-20020adff903000000b002366fb99cdasm12853245wrr.50.2022.11.15.09.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 09:16:08 -0800 (PST)
Message-ID: <edda71f4-9912-d336-6d5b-0e1e102d4bfe@grimberg.me>
Date: Tue, 15 Nov 2022 19:16:07 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [linux-nvme:nvme-6.2 26/41] drivers/nvme/host/core.c:5122:6:
 error: assigning to 'int' from incompatible type 'void'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-nvme@lists.infradead.org, Hannes Reinecke <hare@suse.de>,
 Chaitanya Kulkarni <kch@nvidia.com>
References: <202211160055.rbjs32vH-lkp@intel.com>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <202211160055.rbjs32vH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> tree:   git://git.infradead.org/nvme.git nvme-6.2
> head:   e2deb6d1a5b2dcff71f429a64fb516186aa0382c
> commit: c1658b482f1bec9ebafa49eec69a29aebbc23556 [26/41] nvme-auth: don't ignore key generation failures when initializing ctrl keys
> config: i386-randconfig-a016-20221114
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git remote add linux-nvme git://git.infradead.org/nvme.git
>          git fetch --no-tags linux-nvme nvme-6.2
>          git checkout c1658b482f1bec9ebafa49eec69a29aebbc23556
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/nvme/host/core.c:5122:6: error: assigning to 'int' from incompatible type 'void'
>             ret = nvme_auth_init_ctrl(ctrl);

Christoph,

Can you fold this into the offending commit please?
--
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index a50b0743728e..273f4f95f425 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -1063,7 +1063,7 @@ static inline int nvme_init_auth(void)
         return 0;
  }
  static inline void nvme_exit_auth(void) {};
-static inline void nvme_auth_init_ctrl(struct nvme_ctrl *ctrl) {};
+static inline int nvme_auth_init_ctrl(struct nvme_ctrl *ctrl) {};
  static inline void nvme_auth_stop(struct nvme_ctrl *ctrl) {};
  static inline int nvme_auth_negotiate(struct nvme_ctrl *ctrl, int qid)
  {
--

If not, I can send a patch to fold in.
